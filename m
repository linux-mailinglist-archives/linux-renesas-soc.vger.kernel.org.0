Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBF8B79FC6B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Sep 2023 08:58:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231752AbjING6e (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 14 Sep 2023 02:58:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230141AbjING6d (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Sep 2023 02:58:33 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 949B6CD8;
        Wed, 13 Sep 2023 23:58:29 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB278C433C8;
        Thu, 14 Sep 2023 06:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694674709;
        bh=tvOMWhno4qW0NNw8WiKZfKMoQticUHymzv2JF0+MLAs=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=OhlUUpAVtkXI5EghBPL8aQuuMUojpIDjICnRvgoHHvkXlXH4VH6W6zd+4KsJu6Sqt
         bV3pDhPu2hO+FaJpKnkEkcyAQ9XiRehG5bkdxGWTBrYmkuWeuIZNuOLg54YGKppCkb
         xckeGUe8lDHg1RQaX5HhAj2WCePp7z9Cu9DShuF1pU9IBClVgCKQ3Zed00ScYzCkAF
         w4MTUCTSu/FpWsmh1UTw0gBw9yuieyt5IPLOFUcljf6Bq26JMsC7TAr1eb/s9sLS1h
         3f7h3gzVp6RdNf/wvjmaHVzVChtSq7FHZX8rgik51ptNnhiWLmnZ8ojP8qWaK91dW/
         rts81twgZgQcQ==
Message-ID: <ced723bd-dc88-d796-c86f-9fa96641d982@kernel.org>
Date:   Thu, 14 Sep 2023 15:58:26 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] ata,scsi: do not issue START STOP UNIT on resume
Content-Language: en-US
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
 <ffc1442b-698e-65ab-9aaf-e4ca076b697c@kernel.org>
 <CAMuHMdXK-pnzMNzbNw=zWaMbQtWtca850eYv98oUjQkypgBfwg@mail.gmail.com>
 <2d90bd7c-5c34-a345-bc29-44dfa923fc19@kernel.org>
 <CAMuHMdVHu3zeM0WA7TcTA2QT9X68cTttU-TzjsQw6ZuYCu4t=A@mail.gmail.com>
From:   Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <CAMuHMdVHu3zeM0WA7TcTA2QT9X68cTttU-TzjsQw6ZuYCu4t=A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 9/14/23 15:53, Geert Uytterhoeven wrote:
> Hi Damien,
> 
> On Thu, Sep 14, 2023 at 12:03 AM Damien Le Moal <dlemoal@kernel.org> wrote:
>> On 9/13/23 19:21, Geert Uytterhoeven wrote:
>>>> Thanks for the report. The delay for the first data access from user space right
>>>> after resume is 100% expected, with or without this patch. The reason is that
>>>> waking up the drive (spinning it up) is done asynchronously from the PM resume
>>>> context, so when you get "PM suspend exit" message signaling that the system is
>>>> resumed, the drive may not yet be spinning. Any access will wait for that to
>>>> happen before proceeding. Depending on the drive that can take up to 10s or so.
>>>
>>> That does not match with what I am seeing: before this patch, there
>>> was no delay on first data access from user space, as the drive is fully
>>> spun up when system resume returns.
>>
>> Yes, that is a possibility, but not by design. Some users have complained about
>> the long resume times which causes laptop screens to be "black" until disks spin
>> up. That did not happen before 5.16, when the change to scsi using the PM async
>> ops to do suspend/resume created all the issues with suspend/resume on ata side.
>> I am going to run 5.15 again to check.
>>
>> The patch "do not issue START STOP UNIT on resume" was a botch attempt to remove
>> this delay. But it is a bad one because the ATA specs define that a drive can
>> get out of standby (spun down) power state only with a media access command (a
>> VERIFY command is used to spin up the disk). And furthermore, the specs also
>> says that even a reset shall not change the device power state. So issuing a
>> VERIFY command to spin up the drive is required per specs. Note that I do see
>> many of my drives (I have hundreds in the lab) spinning up on reset, which is
>> against the specs. But not all of them. So with the patch "do not issue START
>> STOP UNIT on resume", one risks not seeing the drive resuming correctly (timeout
>> errors on IDENTIFY command issued on resume will get the drive removed).
>>
>>> With this patch, system resume returns earlier, and the drive is only
>>> spun up when user space starts accessing data.
>>
>> Yes, but "when user space starts accessing data" -> "user space accesses are
>> processed only after the drive completes spinning up" would be more accurate.
> 
> Sure, I wrote it down in terms of what the user is experiencing, which may
> not be identical to what's happening under the hood.
> 
>> That is by design and expected. This is the behavior one would see if the drive
>> is set to use standby timers (to go to standby on its own after some idle time)
>> or if runtime suspend is used. I do not see any issue with this behavior. Is
>> this causing any issue on your end ? Do you have concerns about this approach ?
>>
>> Having the resume process wait for the drive to fully spin-up is easy to do. But
>> as I mentioned, many users are really not happy about how slow resuming become
>> with that. If I do that, you will get back the previous behavior you mention,
>> but I will be again getting emails about "resume is broken".
>>
>> I made a decision: no waiting for spinup. That causes a delay for the user on
>> first access, but that makes resume overall far faster. I do not want to go back
>> on that, unless you can confirm that there is a real regression/error/data
>> corruption happening.
> 
> I agree that is fine.

Still, R-CAR is not working for you with the patch adding the link. Looking into
it now. Trying to verify things with qemu & regular AHCI on PCs too as I do not
have an R-CAR board. Hard to debug :)

Preparing some patches for you to get more debug info.

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

-- 
Damien Le Moal
Western Digital Research

