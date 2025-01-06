import 'dart:core';

/// Calculate weights based on available plates
class WeightCalcService
{
    WeightCalcService(this._increment, this._warmupPercentages);

    final double    _increment;             // The smallest plate weight availble for use.
    final List<int> _warmupPercentages;     // The % of workour weights to use for warmup sets.

    /// Return the warmup weights used for the given weight, to the nearest available increment.
    List<double> getWarmupWeights(double weight) {
        return _warmupPercentages.map((int p) => _nearestWeight(weight * (p / 100))).toList();
    }

    /// In some instances we want to use arithmetic on a given workout weight but only
    /// set increments are available to be used. This function gets the nearest available
    /// weight which can be used. 
    double _nearestWeight(double weight)
    {
        /// e.g.    _increment = 1.25kg, weight = 6.0kg
        ///         The increment means that we cannot load 6.0kg onto the bar.
        ///         to find the nearest divide the weight by the increment and round it:
        ///         6 / 1.25 = 4.8; round to 5.
        ///         multiply the result by the increment to get the final weight:
        ///         1.25 * 5 = 6.25.
    
        return _increment * (weight / _increment).round();
    }
}
