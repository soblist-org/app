export interface Meta {
  year: string;
  month: string;
  day: string;
  victim?: string;
}
export interface Case {
  meta: Meta;
  title: string;
  content: string;
  images?: string[];
}
export interface SonOfBitch {
  // Basic
  name: string;
  picSrc: string;
  addr: string;
  cases: Case[];
  birth: string;
  addedDate: string;
  // Alternative
  activeArea?: string;
  idNumber?: string;
  isMarried?: boolean;
  schoolName?: string;
  companyName?: string;
  job?: string;
  major?: string;
}
export interface State {
  sobList: SonOfBitch[];
}

const state: State = {
  sobList: [],
};

export default state;
