Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44F5C79DC4D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Sep 2023 00:58:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233749AbjILW6J (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Sep 2023 18:58:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230162AbjILW6I (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Sep 2023 18:58:08 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 951D410F2;
        Tue, 12 Sep 2023 15:58:04 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08E84C433C7;
        Tue, 12 Sep 2023 22:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694559484;
        bh=NAtOaI9HU8baypZmmlLZv2/KQI6WE86OX+R6CWMrQAc=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=Igk14st9bo4dLVQ5NeGy4u7L4bHXZ4yFABi05n1mv9nEMlOL1K+yH9fIzdX+ajs9a
         4sFUXPl9DnGg/lAJetUF0ZZr6wsJ6L3Dufrl+oNse+krxshVPWfMS3R6ttfI7HsANd
         xQ2xSxgJLdtEXHnyeTx4oh3HZ975iPka22RAEaXj7eMWBt8KxmAR3vCymkLfuHODeF
         6ngryMeu25+2+qN0MZYd/aWRm9ndsnDYaUUt9DrL2A89zNl/dN0apXOP773I0D+8Js
         R5fFjGYHiffO8z48k/ZG8xq6docK2tWC5tEmzukGyWyHjGG0f/rg52ERByK5AiUhkQ
         REW/LSN9SO1TA==
Message-ID: <ffc1442b-698e-65ab-9aaf-e4ca076b697c@kernel.org>
Date:   Wed, 13 Sep 2023 07:58:01 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] ata,scsi: do not issue START STOP UNIT on resume
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-ide@vger.kernel.org, linux-scsi@vger.kernel.org,
        "Martin K . Petersen" <martin.petersen@oracle.com>,
        Paul Ausbeck <paula@soe.ucsc.edu>,
        Thorsten Leemhuis <regressions@leemhuis.info>,
        TW <dalzot@gmail.com>, regressions@lists.linux.dev,
        Bart Van Assche <bvanassche@acm.org>,
        linux-renesas-soc@vger.kernel.org
References: <20230731003956.572414-1-dlemoal@kernel.org>
 <8be9c370-2f1-5815-431-f68ab868669@linux-m68k.org>
Content-Language: en-US
From:   Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <8be9c370-2f1-5815-431-f68ab868669@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 9/13/23 02:39, Geert Uytterhoeven wrote:
>  	Hi Damien,
> 
> On Mon, 31 Jul 2023, Damien Le Moal wrote:
>> During system resume, ata_port_pm_resume() triggers ata EH to
>> 1) Resume the controller
>> 2) Reset and rescan the ports
>> 3) Revalidate devices
>> This EH execution is started asynchronously from ata_port_pm_resume(),
>> which means that when sd_resume() is executed, none or only part of the
>> above processing may have been executed. However, sd_resume() issues a
>> START STOP UNIT to wake up the drive from sleep mode. This command is
>> translated to ATA with ata_scsi_start_stop_xlat() and issued to the
>> device. However, depending on the state of execution of the EH process
>> and revalidation triggerred by ata_port_pm_resume(), two things may
>> happen:
>> 1) The START STOP UNIT fails if it is received before the controller has
>>   been reenabled at the beginning of the EH execution. This is visible
>>   with error messages like:
>>
>> ata10.00: device reported invalid CHS sector 0
>> sd 9:0:0:0: [sdc] Start/Stop Unit failed: Result: hostbyte=DID_OK driverbyte=DRIVER_OK
>> sd 9:0:0:0: [sdc] Sense Key : Illegal Request [current]
>> sd 9:0:0:0: [sdc] Add. Sense: Unaligned write command
>> sd 9:0:0:0: PM: dpm_run_callback(): scsi_bus_resume+0x0/0x90 returns -5
>> sd 9:0:0:0: PM: failed to resume async: error -5
>>
>> 2) The START STOP UNIT command is received while the EH process is
>>   on-going, which mean that it is stopped and must wait for its
>>   completion, at which point the command is rather useless as the drive
>>   is already fully spun up already. This case results also in a
>>   significant delay in sd_resume() which is observable by users as
>>   the entire system resume completion is delayed.
>>
>> Given that ATA devices will be woken up by libata activity on resume,
>> sd_resume() has no need to issue a START STOP UNIT command, which solves
>> the above mentioned problems. Do not issue this command by introducing
>> the new scsi_device flag no_start_on_resume and setting this flag to 1
>> in ata_scsi_dev_config(). sd_resume() is modified to issue a START STOP
>> UNIT command only if this flag is not set.
>>
>> Reported-by: Paul Ausbeck <paula@soe.ucsc.edu>
>> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=215880
>> Fixes: a19a93e4c6a9 ("scsi: core: pm: Rely on the device driver core for async power management")
>> Signed-off-by: Damien Le Moal <dlemoal@kernel.org>
> 
> Thanks for your patch, which is now commit 0a8589055936d8fe
> ("ata,scsi: do not issue START STOP UNIT on resume") in v6.5-rc5.
> Sorry for being late to the party, but this commit landed upstream
> during my summer holidays, and apparently I wasn't that focussed on
> noticing small behavioral changes after getting back to work...
> 
> I noticed an oddity after s2idle or s2ram on Renesas Salvator-XS (R-Car
> H3 ES2.0) with an old (spinning rust) SATA drive, and bisected it to
> this commit: when accessing the drive after system resume, there is now
> a delay of ca. 5s before data is returned, presumably due to starting
> the drive, and having to wait for it to spin up to be able to read data.
> But the good news is that the actual system resume takes less time than
> before (reduced by even more than ca. 5s!), so this looks like a net
> win...

Thanks for the report. The delay for the first data access from user space right
after resume is 100% expected, with or without this patch. The reason is that
waking up the drive (spinning it up) is done asynchronously from the PM resume
context, so when you get "PM suspend exit" message signaling that the system is
resumed, the drive may not yet be spinning. Any access will wait for that to
happen before proceeding. Depending on the drive that can take up to 10s or so.

I am not entirely sure where the net win you see come from. But the patch you
mention is in fact completely wrong and does not fix the underlying issues with
ata suspend/resume and potential deadlocks in PM due to ata ports relationship
with scsi devices. So I have been working on fixing this for the last 2 weeks,
after another user also reported issues with the patch you mention [1].

Could you try libata for-next branch on your system ? There are 7 fix patches in
there that I plan to send out for 6.6-rc2 to fix the patch in question and other
issues potentially causing deadlocks on resume. The patches were posted also [2].

https://lore.kernel.org/linux-ide/20230912005655.368075-1-dlemoal@kernel.org/T/#t

> I'm not sure this is to be called a regression, I just wanted you to be
> aware of it.

The delay on access is not a regression. You likely where not seeing it before
because of the lack of synchronization between ata & scsi on resume was likely
making the resume processing take longer than it needs to be, which gave time to
the drive to spin up. The patches in libata for-next should fix all that. Please
test !

Thanks !

[1]
https://lore.kernel.org/linux-ide/8be9c370-2f1-5815-431-f68ab868669@linux-m68k.org/T/#m066ae988869d588c1b8c684cb52773e7708ade4c
[2]
https://lore.kernel.org/linux-ide/20230912005655.368075-1-dlemoal@kernel.org/T/#t


-- 
Damien Le Moal
Western Digital Research

