// Generated by gencpp from file boris_manipulator/localizationResponse.msg
// DO NOT EDIT!


#ifndef BORIS_MANIPULATOR_MESSAGE_LOCALIZATIONRESPONSE_H
#define BORIS_MANIPULATOR_MESSAGE_LOCALIZATIONRESPONSE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace boris_manipulator
{
template <class ContainerAllocator>
struct localizationResponse_
{
  typedef localizationResponse_<ContainerAllocator> Type;

  localizationResponse_()
    : connection(false)
    , distance_x(0.0)
    , distance_y(0.0)
    , distance_z(0.0)
    , position_x(0.0)
    , position_y(0.0)
    , position_z(0.0)  {
    }
  localizationResponse_(const ContainerAllocator& _alloc)
    : connection(false)
    , distance_x(0.0)
    , distance_y(0.0)
    , distance_z(0.0)
    , position_x(0.0)
    , position_y(0.0)
    , position_z(0.0)  {
  (void)_alloc;
    }



   typedef uint8_t _connection_type;
  _connection_type connection;

   typedef double _distance_x_type;
  _distance_x_type distance_x;

   typedef double _distance_y_type;
  _distance_y_type distance_y;

   typedef double _distance_z_type;
  _distance_z_type distance_z;

   typedef double _position_x_type;
  _position_x_type position_x;

   typedef double _position_y_type;
  _position_y_type position_y;

   typedef double _position_z_type;
  _position_z_type position_z;





  typedef boost::shared_ptr< ::boris_manipulator::localizationResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::boris_manipulator::localizationResponse_<ContainerAllocator> const> ConstPtr;

}; // struct localizationResponse_

typedef ::boris_manipulator::localizationResponse_<std::allocator<void> > localizationResponse;

typedef boost::shared_ptr< ::boris_manipulator::localizationResponse > localizationResponsePtr;
typedef boost::shared_ptr< ::boris_manipulator::localizationResponse const> localizationResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::boris_manipulator::localizationResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::boris_manipulator::localizationResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::boris_manipulator::localizationResponse_<ContainerAllocator1> & lhs, const ::boris_manipulator::localizationResponse_<ContainerAllocator2> & rhs)
{
  return lhs.connection == rhs.connection &&
    lhs.distance_x == rhs.distance_x &&
    lhs.distance_y == rhs.distance_y &&
    lhs.distance_z == rhs.distance_z &&
    lhs.position_x == rhs.position_x &&
    lhs.position_y == rhs.position_y &&
    lhs.position_z == rhs.position_z;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::boris_manipulator::localizationResponse_<ContainerAllocator1> & lhs, const ::boris_manipulator::localizationResponse_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace boris_manipulator

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::boris_manipulator::localizationResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::boris_manipulator::localizationResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::boris_manipulator::localizationResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::boris_manipulator::localizationResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::boris_manipulator::localizationResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::boris_manipulator::localizationResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::boris_manipulator::localizationResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "9262ab8a424c72423785dba6bebfb167";
  }

  static const char* value(const ::boris_manipulator::localizationResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x9262ab8a424c7242ULL;
  static const uint64_t static_value2 = 0x3785dba6bebfb167ULL;
};

template<class ContainerAllocator>
struct DataType< ::boris_manipulator::localizationResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "boris_manipulator/localizationResponse";
  }

  static const char* value(const ::boris_manipulator::localizationResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::boris_manipulator::localizationResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "bool connection\n"
"float64 distance_x\n"
"float64 distance_y\n"
"float64 distance_z\n"
"float64 position_x\n"
"float64 position_y\n"
"float64 position_z\n"
;
  }

  static const char* value(const ::boris_manipulator::localizationResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::boris_manipulator::localizationResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.connection);
      stream.next(m.distance_x);
      stream.next(m.distance_y);
      stream.next(m.distance_z);
      stream.next(m.position_x);
      stream.next(m.position_y);
      stream.next(m.position_z);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct localizationResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::boris_manipulator::localizationResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::boris_manipulator::localizationResponse_<ContainerAllocator>& v)
  {
    s << indent << "connection: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.connection);
    s << indent << "distance_x: ";
    Printer<double>::stream(s, indent + "  ", v.distance_x);
    s << indent << "distance_y: ";
    Printer<double>::stream(s, indent + "  ", v.distance_y);
    s << indent << "distance_z: ";
    Printer<double>::stream(s, indent + "  ", v.distance_z);
    s << indent << "position_x: ";
    Printer<double>::stream(s, indent + "  ", v.position_x);
    s << indent << "position_y: ";
    Printer<double>::stream(s, indent + "  ", v.position_y);
    s << indent << "position_z: ";
    Printer<double>::stream(s, indent + "  ", v.position_z);
  }
};

} // namespace message_operations
} // namespace ros

#endif // BORIS_MANIPULATOR_MESSAGE_LOCALIZATIONRESPONSE_H
