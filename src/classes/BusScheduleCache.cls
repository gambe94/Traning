public class BusScheduleCache {
	// Get partition
	private Cache.OrgPartition part;


	public BusScheduleCache() {
		part = new Cache.OrgPartition('local.BusSchedule');
	}

	public void putSchedule(String busLine, Time[] schedule) {
		part.put(busline, schedule);
	}

	public Time[] getSchedule(string busLine) {
		Time[] bSched = new Time[] { };

		if (part != null && (Time[]) part.get(busLine) != null) {
			bSched = (Time[]) part.get(busLine);
		} else {
			bSched.add(Time.newInstance(8, 0, 0, 0));
			bSched.add(Time.newInstance(17, 0, 0, 0));
		}

		return bSched;
	}

}