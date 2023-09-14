Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B5187A0998
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Sep 2023 17:47:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241161AbjINPrL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 14 Sep 2023 11:47:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241163AbjINPrK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Sep 2023 11:47:10 -0400
X-Greylist: delayed 330 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 14 Sep 2023 08:47:06 PDT
Received: from vps.thesusis.net (vps.thesusis.net [34.202.238.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68104E0;
        Thu, 14 Sep 2023 08:47:06 -0700 (PDT)
Received: by vps.thesusis.net (Postfix, from userid 1000)
        id 122451394AC; Thu, 14 Sep 2023 11:41:35 -0400 (EDT)
References: <20230731003956.572414-1-dlemoal@kernel.org>
 <8be9c370-2f1-5815-431-f68ab868669@linux-m68k.org>
 <ffc1442b-698e-65ab-9aaf-e4ca076b697c@kernel.org>
 <CAMuHMdXK-pnzMNzbNw=zWaMbQtWtca850eYv98oUjQkypgBfwg@mail.gmail.com>
 <2d90bd7c-5c34-a345-bc29-44dfa923fc19@kernel.org>
User-agent: mu4e 1.7.12; emacs 27.1
From:   Phillip Susi <phill@thesusis.net>
To:     Damien Le Moal <dlemoal@kernel.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-ide@vger.kernel.org, linux-scsi@vger.kernel.org,
        "Martin K . Petersen" <martin.petersen@oracle.com>,
        Paul Ausbeck <paula@soe.ucsc.edu>,
        Thorsten Leemhuis <regressions@leemhuis.info>,
        TW <dalzot@gmail.com>, regressions@lists.linux.dev,
        Bart Van Assche <bvanassche@acm.org>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] ata,scsi: do not issue START STOP UNIT on resume
Date:   Thu, 14 Sep 2023 11:29:59 -0400
In-reply-to: <2d90bd7c-5c34-a345-bc29-44dfa923fc19@kernel.org>
Message-ID: <87edj0yd74.fsf@vps.thesusis.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


Damien Le Moal <dlemoal@kernel.org> writes:

> VERIFY command is used to spin up the disk). And furthermore, the specs also
> says that even a reset shall not change the device power state. So issuing a
> VERIFY command to spin up the drive is required per specs. Note that I do see
> many of my drives (I have hundreds in the lab) spinning up on reset, which is
> against the specs. But not all of them. So with the patch "do not issue START
> STOP UNIT on resume", one risks not seeing the drive resuming correctly (timeout
> errors on IDENTIFY command issued on resume will get the drive removed).

I tried to get some patches merged a few years back along these lines to
be able to keep some ATA disks in a mostly permanent state of being
powered down.  I don't recall the specs saying that a reset would not
change power states.  What I do recall is that as a general rule, ATA
disks automatically spin up after power on, unless the Power Up in
Standby feature is activated, which at least for Western Digital drives,
requires a jumper to short some pins on the drive.

IIRC, I had a patch to skip the START UNIT command on resume based on a
sysfs setting.  I think it was rejected because SCSI disks can not be
accessed without the START UNIT command, and even though the scsi eh
path will notice when a drive needs this and issue it, there was
something not good about the eh path.  I think it was something along
the lines of all IO to all disks on the whole scsi host are suspended
during eh.

I also tried to have the runtime pm notice whether the drive auto
powered up or not and set the runtime pm state to correctly indicate
whether the drive is running or not, as well as to use the deeper ATA
SLEEP state to save more power over STANDBY and allow the ATA link to be
runtime pm suspended.
