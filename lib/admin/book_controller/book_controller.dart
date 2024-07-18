import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eproject/admin/book_model/book_model.dart';
import 'package:flutter/material.dart';

class BookController{

  final CollectionReference collectionReference = FirebaseFirestore.instance.collection("Books");

  void bookAdd(BookModel bookModel, BuildContext context)async{

   try{
     Map<String, dynamic> bookAdd = {
       "bookID" : bookModel.bookID,
       "bookName" : bookModel.bookName!,
       "bookImage" : "bookModel.bookImage!",
       "bookPrice" : bookModel.bookPrice!,
       "bookDesc" : bookModel.bookDescription!,
       "bookISBN" : bookModel.bookISBN!,
       "bookAuthor" : bookModel.bookAuthor!,
       "bookCate" : bookModel.bookCategory!,
       "reviews" : []
     };

     await collectionReference.doc(bookModel.bookID).set(bookAdd);
     if(context.mounted){
       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Book Added Successfully"),backgroundColor: Colors.green, margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),behavior: SnackBarBehavior.floating,));
       Navigator.pop(context);
     }
   } catch(ex){
       if(context.mounted){
         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Something went wrong"),backgroundColor: Colors.red, margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),behavior: SnackBarBehavior.floating,));
       }
     }
   }

   Stream<List<BookModel>> getBooks(){
    return collectionReference.snapshots().map((snapshot){
      return snapshot.docs.map((doc){
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return BookModel(
          bookID: data['bookID'],
          bookName: data['bookName'],
          bookImage: data['bookImage'],
          bookPrice: data['bookPrice'],
          bookISBN: data['bookISBN'],
          bookCategory: data['bookCate'],
          bookAuthor: data['bookAuthor'],
          bookDescription: data['bookDesc']
        );
      }).toList();
    });
   }

   void updateBook(BookModel bookModel, BuildContext context)async{
     try{
       Map<String, dynamic> bookAdd = {
         "bookName" : bookModel.bookName!,
         "bookImage" : "bookModel.bookImage!",
         "bookPrice" : bookModel.bookPrice!,
         "bookDesc" : bookModel.bookDescription!,
         "bookISBN" : bookModel.bookISBN!,
         "bookAuthor" : bookModel.bookAuthor!,
         "bookCate" : bookModel.bookCategory!,
         "reviews" : []
       };

       await collectionReference.doc(bookModel.bookID).update(bookAdd);
       if(context.mounted){
         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Book Updated Successfully"),backgroundColor: Colors.green, margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),behavior: SnackBarBehavior.floating,));
         Navigator.pop(context);
       }
     } catch(ex){
       if(context.mounted){
         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Something went wrong"),backgroundColor: Colors.red, margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),behavior: SnackBarBehavior.floating,));
       }
     }
   }

   void deleteBook(String? bookID, BuildContext context)async{
     try{
       await collectionReference.doc(bookID).delete();
       if(context.mounted){
         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Book Deleted Successfully"),backgroundColor: Colors.red, margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),behavior: SnackBarBehavior.floating,));
       }
     } catch(ex){
       if(context.mounted){
         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Something went wrong"),backgroundColor: Colors.red, margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),behavior: SnackBarBehavior.floating,));
       }
     }
   }
}