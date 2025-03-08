import { Controller } from "@hotwired/stimulus";
interface Option {
    offset?: number;
    behavior?: string;
}
export default class ScrollTo extends Controller<HTMLAnchorElement> {
    offsetValue: number;
    behaviorValue: string;
    hasOffsetValue: boolean;
    static values: {
        offset: NumberConstructor;
        behavior: StringConstructor;
    };
    initialize(): void;
    connect(): void;
    disconnect(): void;
    scroll(event: Event): void;
    get offset(): number;
    get behavior(): string;
    get defaultOptions(): Option;
}
export {};
