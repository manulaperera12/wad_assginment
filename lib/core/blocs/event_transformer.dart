import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:stream_transform/stream_transform.dart';

const throttleDuration = Duration(milliseconds: 100);

class Transformer {
  static EventTransformer<E> throttleDroppable<E>({Duration duration = throttleDuration}) {
    return (events, mapper) {
      return droppable<E>().call(events.throttle(duration), mapper);
    };
  }

  static EventTransformer<E> throttleRestartable<E>({Duration duration = throttleDuration}) {
    return (events, mapper) {
      return restartable<E>().call(events.throttle(duration), mapper);
    };
  }

  static EventTransformer<E> throttleSequential<E>({Duration duration = throttleDuration}) {
    return (events, mapper) {
      return sequential<E>().call(events.throttle(duration), mapper);
    };
  }

  static EventTransformer<E> throttleConcurrent<E>({Duration duration = throttleDuration}) {
    return (events, mapper) {
      return concurrent<E>().call(events.throttle(duration), mapper);
    };
  }
}
