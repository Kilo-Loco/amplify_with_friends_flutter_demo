/*
* Copyright 2020 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// ignore_for_file: public_member_api_docs

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:flutter/foundation.dart';

/** This is an auto generated class representing the Message type in your schema. */
@immutable
class Message extends Model {
  static const classType = const MessageType();
  final String id;
  final String body;
  final String sender;
  final TemporalDateTime creationDate;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const Message._internal(
      {@required this.id,
      @required this.body,
      @required this.sender,
      @required this.creationDate});

  factory Message(
      {String id,
      @required String body,
      @required String sender,
      @required TemporalDateTime creationDate}) {
    return Message._internal(
        id: id == null ? UUID.getUUID() : id,
        body: body,
        sender: sender,
        creationDate: creationDate);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Message &&
        id == other.id &&
        body == other.body &&
        sender == other.sender &&
        creationDate == other.creationDate;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("Message {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("body=" + "$body" + ", ");
    buffer.write("sender=" + "$sender" + ", ");
    buffer.write("creationDate=" +
        (creationDate != null ? creationDate.format() : "null"));
    buffer.write("}");

    return buffer.toString();
  }

  Message copyWith(
      {String id, String body, String sender, TemporalDateTime creationDate}) {
    return Message(
        id: id ?? this.id,
        body: body ?? this.body,
        sender: sender ?? this.sender,
        creationDate: creationDate ?? this.creationDate);
  }

  Message.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        body = json['body'],
        sender = json['sender'],
        creationDate = json['creationDate'] != null
            ? TemporalDateTime.fromString(json['creationDate'])
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'body': body,
        'sender': sender,
        'creationDate': creationDate?.format()
      };

  static final QueryField ID = QueryField(fieldName: "message.id");
  static final QueryField BODY = QueryField(fieldName: "body");
  static final QueryField SENDER = QueryField(fieldName: "sender");
  static final QueryField CREATIONDATE = QueryField(fieldName: "creationDate");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Message";
    modelSchemaDefinition.pluralName = "Messages";

    modelSchemaDefinition.authRules = [
      AuthRule(authStrategy: AuthStrategy.PUBLIC, operations: [
        ModelOperation.CREATE,
        ModelOperation.UPDATE,
        ModelOperation.DELETE,
        ModelOperation.READ
      ])
    ];

    modelSchemaDefinition.addField(ModelFieldDefinition.id());

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Message.BODY,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Message.SENDER,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Message.CREATIONDATE,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)));
  });
}

class MessageType extends ModelType<Message> {
  const MessageType();

  @override
  Message fromJson(Map<String, dynamic> jsonData) {
    return Message.fromJson(jsonData);
  }
}
