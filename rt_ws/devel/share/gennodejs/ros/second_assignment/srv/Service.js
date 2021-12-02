// Auto-generated. Do not edit!

// (in-package second_assignment.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class ServiceRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.setVal = null;
    }
    else {
      if (initObj.hasOwnProperty('setVal')) {
        this.setVal = initObj.setVal
      }
      else {
        this.setVal = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ServiceRequest
    // Serialize message field [setVal]
    bufferOffset = _serializer.char(obj.setVal, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ServiceRequest
    let len;
    let data = new ServiceRequest(null);
    // Deserialize message field [setVal]
    data.setVal = _deserializer.char(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'second_assignment/ServiceRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '700f3d0ef2d3afaa15c71d548b552f53';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    char setVal
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ServiceRequest(null);
    if (msg.setVal !== undefined) {
      resolved.setVal = msg.setVal;
    }
    else {
      resolved.setVal = 0
    }

    return resolved;
    }
};

class ServiceResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.getVal = null;
    }
    else {
      if (initObj.hasOwnProperty('getVal')) {
        this.getVal = initObj.getVal
      }
      else {
        this.getVal = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ServiceResponse
    // Serialize message field [getVal]
    bufferOffset = _serializer.float32(obj.getVal, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ServiceResponse
    let len;
    let data = new ServiceResponse(null);
    // Deserialize message field [getVal]
    data.getVal = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'second_assignment/ServiceResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '682a4eca7e2dcef83971164d6ea2a189';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 getVal
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ServiceResponse(null);
    if (msg.getVal !== undefined) {
      resolved.getVal = msg.getVal;
    }
    else {
      resolved.getVal = 0.0
    }

    return resolved;
    }
};

module.exports = {
  Request: ServiceRequest,
  Response: ServiceResponse,
  md5sum() { return '4f1064e684dd3d6da99d55dc37eb289e'; },
  datatype() { return 'second_assignment/Service'; }
};
