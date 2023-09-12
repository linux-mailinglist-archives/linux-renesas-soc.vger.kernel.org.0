Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C98F479D7C4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Sep 2023 19:40:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236827AbjILRkH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Sep 2023 13:40:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237132AbjILRkH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Sep 2023 13:40:07 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC4A710C9
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Sep 2023 10:40:02 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:a74b:c851:eeda:f0c8])
        by xavier.telenet-ops.be with bizsmtp
        id l5fz2A00S0nS7QV015fzeq; Tue, 12 Sep 2023 19:40:00 +0200
Received: from geert (helo=localhost)
        by ramsan.of.borg with local-esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qg7Ml-0033vI-Jc;
        Tue, 12 Sep 2023 19:39:59 +0200
Date:   Tue, 12 Sep 2023 19:39:59 +0200 (CEST)
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Damien Le Moal <dlemoal@kernel.org>
cc:     linux-ide@vger.kernel.org, linux-scsi@vger.kernel.org,
        "Martin K . Petersen" <martin.petersen@oracle.com>,
        Paul Ausbeck <paula@soe.ucsc.edu>,
        Thorsten Leemhuis <regressions@leemhuis.info>,
        TW <dalzot@gmail.com>, regressions@lists.linux.dev,
        Bart Van Assche <bvanassche@acm.org>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] ata,scsi: do not issue START STOP UNIT on resume
In-Reply-To: <20230731003956.572414-1-dlemoal@kernel.org>
Message-ID: <8be9c370-2f1-5815-431-f68ab868669@linux-m68k.org>
References: <20230731003956.572414-1-dlemoal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

 	Hi Damien,

On Mon, 31 Jul 2023, Damien Le Moal wrote:
> During system resume, ata_port_pm_resume() triggers ata EH to
> 1) Resume the controller
> 2) Reset and rescan the ports
> 3) Revalidate devices
> This EH execution is started asynchronously from ata_port_pm_resume(),
> which means that when sd_resume() is executed, none or only part of the
> above processing may have been executed. However, sd_resume() issues a
> START STOP UNIT to wake up the drive from sleep mode. This command is
> translated to ATA with ata_scsi_start_stop_xlat() and issued to the
> device. However, depending on the state of execution of the EH process
> and revalidation triggerred by ata_port_pm_resume(), two things may
> happen:
> 1) The START STOP UNIT fails if it is received before the controller has
>   been reenabled at the beginning of the EH execution. This is visible
>   with error messages like:
>
> ata10.00: device reported invalid CHS sector 0
> sd 9:0:0:0: [sdc] Start/Stop Unit failed: Result: hostbyte=DID_OK driverbyte=DRIVER_OK
> sd 9:0:0:0: [sdc] Sense Key : Illegal Request [current]
> sd 9:0:0:0: [sdc] Add. Sense: Unaligned write command
> sd 9:0:0:0: PM: dpm_run_callback(): scsi_bus_resume+0x0/0x90 returns -5
> sd 9:0:0:0: PM: failed to resume async: error -5
>
> 2) The START STOP UNIT command is received while the EH process is
>   on-going, which mean that it is stopped and must wait for its
>   completion, at which point the command is rather useless as the drive
>   is already fully spun up already. This case results also in a
>   significant delay in sd_resume() which is observable by users as
>   the entire system resume completion is delayed.
>
> Given that ATA devices will be woken up by libata activity on resume,
> sd_resume() has no need to issue a START STOP UNIT command, which solves
> the above mentioned problems. Do not issue this command by introducing
> the new scsi_device flag no_start_on_resume and setting this flag to 1
> in ata_scsi_dev_config(). sd_resume() is modified to issue a START STOP
> UNIT command only if this flag is not set.
>
> Reported-by: Paul Ausbeck <paula@soe.ucsc.edu>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=215880
> Fixes: a19a93e4c6a9 ("scsi: core: pm: Rely on the device driver core for async power management")
> Signed-off-by: Damien Le Moal <dlemoal@kernel.org>

Thanks for your patch, which is now commit 0a8589055936d8fe
("ata,scsi: do not issue START STOP UNIT on resume") in v6.5-rc5.
Sorry for being late to the party, but this commit landed upstream
during my summer holidays, and apparently I wasn't that focussed on
noticing small behavioral changes after getting back to work...

I noticed an oddity after s2idle or s2ram on Renesas Salvator-XS (R-Car
H3 ES2.0) with an old (spinning rust) SATA drive, and bisected it to
this commit: when accessing the drive after system resume, there is now
a delay of ca. 5s before data is returned, presumably due to starting
the drive, and having to wait for it to spin up to be able to read data.
But the good news is that the actual system resume takes less time than
before (reduced by even more than ca. 5s!), so this looks like a net
win...

I'm not sure this is to be called a regression, I just wanted you to be
aware of it.

Thanks!

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds
