// Generated by gencpp from file boris_manipulator/localization.msg
// DO NOT EDIT!


#ifndef BORIS_MANIPULATOR_MESSAGE_LOCALIZATION_H
#define BORIS_MANIPULATOR_MESSAGE_LOCALIZATION_H

#include <ros/service_traits.h>


#include <boris_manipulator/localizationRequest.h>
#include <boris_manipulator/localizationResponse.h>


namespace boris_manipulator
{

struct localization
{

typedef localizationRequest Request;
typedef localizationResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct localization
} // namespace boris_manipulator


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::boris_manipulator::localization > {
  static const char* value()
  {
    return "75886f154361ea2dcee0a0ccaddcf0d9";
  }

  static const char* value(const ::boris_manipulator::localization&) { return value(); }
};

template<>
struct DataType< ::boris_manipulator::localization > {
  static const char* value()
  {
    return "boris_manipulator/localization";
  }

  static const char* value(const ::boris_manipulator::localization&) { return value(); }
};


// service_traits::MD5Sum< ::boris_manipulator::localizationRequest> should match
// service_traits::MD5Sum< ::boris_manipulator::localization >
template<>
struct MD5Sum< ::boris_manipulator::localizationRequest>
{
  static const char* value()
  {
    return MD5Sum< ::boris_manipulator::localization >::value();
  }
  static const char* value(const ::boris_manipulator::localizationRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::boris_manipulator::localizationRequest> should match
// service_traits::DataType< ::boris_manipulator::localization >
template<>
struct DataType< ::boris_manipulator::localizationRequest>
{
  static const char* value()
  {
    return DataType< ::boris_manipulator::localization >::value();
  }
  static const char* value(const ::boris_manipulator::localizationRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::boris_manipulator::localizationResponse> should match
// service_traits::MD5Sum< ::boris_manipulator::localization >
template<>
struct MD5Sum< ::boris_manipulator::localizationResponse>
{
  static const char* value()
  {
    return MD5Sum< ::boris_manipulator::localization >::value();
  }
  static const char* value(const ::boris_manipulator::localizationResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::boris_manipulator::localizationResponse> should match
// service_traits::DataType< ::boris_manipulator::localization >
template<>
struct DataType< ::boris_manipulator::localizationResponse>
{
  static const char* value()
  {
    return DataType< ::boris_manipulator::localization >::value();
  }
  static const char* value(const ::boris_manipulator::localizationResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // BORIS_MANIPULATOR_MESSAGE_LOCALIZATION_H
