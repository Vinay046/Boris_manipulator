// Auto-generated. Do not edit!

// (in-package boris_manipulator.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class localizationRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type localizationRequest
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type localizationRequest
    let len;
    let data = new localizationRequest(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'boris_manipulator/localizationRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd41d8cd98f00b204e9800998ecf8427e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new localizationRequest(null);
    return resolved;
    }
};

class localizationResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.connection = null;
      this.distance_x = null;
      this.distance_y = null;
      this.distance_z = null;
      this.position_x = null;
      this.position_y = null;
      this.position_z = null;
    }
    else {
      if (initObj.hasOwnProperty('connection')) {
        this.connection = initObj.connection
      }
      else {
        this.connection = false;
      }
      if (initObj.hasOwnProperty('distance_x')) {
        this.distance_x = initObj.distance_x
      }
      else {
        this.distance_x = 0.0;
      }
      if (initObj.hasOwnProperty('distance_y')) {
        this.distance_y = initObj.distance_y
      }
      else {
        this.distance_y = 0.0;
      }
      if (initObj.hasOwnProperty('distance_z')) {
        this.distance_z = initObj.distance_z
      }
      else {
        this.distance_z = 0.0;
      }
      if (initObj.hasOwnProperty('position_x')) {
        this.position_x = initObj.position_x
      }
      else {
        this.position_x = 0.0;
      }
      if (initObj.hasOwnProperty('position_y')) {
        this.position_y = initObj.position_y
      }
      else {
        this.position_y = 0.0;
      }
      if (initObj.hasOwnProperty('position_z')) {
        this.position_z = initObj.position_z
      }
      else {
        this.position_z = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type localizationResponse
    // Serialize message field [connection]
    bufferOffset = _serializer.bool(obj.connection, buffer, bufferOffset);
    // Serialize message field [distance_x]
    bufferOffset = _serializer.float64(obj.distance_x, buffer, bufferOffset);
    // Serialize message field [distance_y]
    bufferOffset = _serializer.float64(obj.distance_y, buffer, bufferOffset);
    // Serialize message field [distance_z]
    bufferOffset = _serializer.float64(obj.distance_z, buffer, bufferOffset);
    // Serialize message field [position_x]
    bufferOffset = _serializer.float64(obj.position_x, buffer, bufferOffset);
    // Serialize message field [position_y]
    bufferOffset = _serializer.float64(obj.position_y, buffer, bufferOffset);
    // Serialize message field [position_z]
    bufferOffset = _serializer.float64(obj.position_z, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type localizationResponse
    let len;
    let data = new localizationResponse(null);
    // Deserialize message field [connection]
    data.connection = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [distance_x]
    data.distance_x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [distance_y]
    data.distance_y = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [distance_z]
    data.distance_z = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [position_x]
    data.position_x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [position_y]
    data.position_y = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [position_z]
    data.position_z = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 49;
  }

  static datatype() {
    // Returns string type for a service object
    return 'boris_manipulator/localizationResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '9262ab8a424c72423785dba6bebfb167';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool connection
    float64 distance_x
    float64 distance_y
    float64 distance_z
    float64 position_x
    float64 position_y
    float64 position_z
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new localizationResponse(null);
    if (msg.connection !== undefined) {
      resolved.connection = msg.connection;
    }
    else {
      resolved.connection = false
    }

    if (msg.distance_x !== undefined) {
      resolved.distance_x = msg.distance_x;
    }
    else {
      resolved.distance_x = 0.0
    }

    if (msg.distance_y !== undefined) {
      resolved.distance_y = msg.distance_y;
    }
    else {
      resolved.distance_y = 0.0
    }

    if (msg.distance_z !== undefined) {
      resolved.distance_z = msg.distance_z;
    }
    else {
      resolved.distance_z = 0.0
    }

    if (msg.position_x !== undefined) {
      resolved.position_x = msg.position_x;
    }
    else {
      resolved.position_x = 0.0
    }

    if (msg.position_y !== undefined) {
      resolved.position_y = msg.position_y;
    }
    else {
      resolved.position_y = 0.0
    }

    if (msg.position_z !== undefined) {
      resolved.position_z = msg.position_z;
    }
    else {
      resolved.position_z = 0.0
    }

    return resolved;
    }
};

module.exports = {
  Request: localizationRequest,
  Response: localizationResponse,
  md5sum() { return '9262ab8a424c72423785dba6bebfb167'; },
  datatype() { return 'boris_manipulator/localization'; }
};
