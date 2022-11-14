trigger AccountTrigger1 on Account (after update) {
    new AccountTriggerHandler1().run();
}