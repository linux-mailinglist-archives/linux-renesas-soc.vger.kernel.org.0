Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFA0679E4BD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Sep 2023 12:21:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239648AbjIMKVg convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Sep 2023 06:21:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239645AbjIMKVg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Sep 2023 06:21:36 -0400
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 833E01989;
        Wed, 13 Sep 2023 03:21:32 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-d7f1bc4ece3so5767547276.1;
        Wed, 13 Sep 2023 03:21:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694600491; x=1695205291;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=McFENviulexPuoSO9u3Tk9ztgtwtFzN/enFbQhOjH0s=;
        b=Aovhm9aS65aNZZzjkW74qHHXSeX/srrJro9PLLG14q9kemd8MwCpVHpmPyWc1o+v++
         u6pCde6h/0LFwPzO+XSzQlWDWm8XMDLcnut7stU9q8M6TANq691quiNccrpA9u80n19M
         w+hprC0uRaZyB82IGQwkZX9qJUvMoHzRms2mLMl0Sl7r/5k2gHBo/h1VbBzMPdsporRg
         3345quk8K8DcbaDWDIH597tkf5Kl9B1x0vkk5aDGsA8Ydy2JLPi+C8JfFoVLVcW/4EPR
         SKHtSWkWWm6b2ktSg/bQDit/GTFJk8MIlL5bMmubPjtAQdbzdAwylSCHLrU27kzAUBYp
         LMDQ==
X-Gm-Message-State: AOJu0YxXlWDCXxNLS9BEspStoI9UsPUbCUJCisUEtDqTxB6+pTOi1Xgg
        dMdfuFysOho8TRFA5OtkrFQp9oqbrrzR1g==
X-Google-Smtp-Source: AGHT+IFdOujy9W7kFQXDNIDulNco8Ljl7YJqcEPGeaOFbC5HIseDEeIRe6IU7yPZrg8z7Z6lyh/GoA==
X-Received: by 2002:a25:830b:0:b0:d74:5f61:15b1 with SMTP id s11-20020a25830b000000b00d745f6115b1mr1876767ybk.26.1694600491469;
        Wed, 13 Sep 2023 03:21:31 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id 188-20020a2507c5000000b00d7b957d8ed9sm2653739ybh.17.2023.09.13.03.21.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Sep 2023 03:21:30 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-d7f0048b042so5748948276.2;
        Wed, 13 Sep 2023 03:21:30 -0700 (PDT)
X-Received: by 2002:a25:d303:0:b0:d7a:def7:b96a with SMTP id
 e3-20020a25d303000000b00d7adef7b96amr1881114ybf.53.1694600490433; Wed, 13 Sep
 2023 03:21:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230731003956.572414-1-dlemoal@kernel.org> <8be9c370-2f1-5815-431-f68ab868669@linux-m68k.org>
 <ffc1442b-698e-65ab-9aaf-e4ca076b697c@kernel.org>
In-Reply-To: <ffc1442b-698e-65ab-9aaf-e4ca076b697c@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 13 Sep 2023 12:21:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXK-pnzMNzbNw=zWaMbQtWtca850eYv98oUjQkypgBfwg@mail.gmail.com>
Message-ID: <CAMuHMdXK-pnzMNzbNw=zWaMbQtWtca850eYv98oUjQkypgBfwg@mail.gmail.com>
Subject: Re: [PATCH] ata,scsi: do not issue START STOP UNIT on resume
To:     Damien Le Moal <dlemoal@kernel.org>
Cc:     linux-ide@vger.kernel.org, linux-scsi@vger.kernel.org,
        "Martin K . Petersen" <martin.petersen@oracle.com>,
        Paul Ausbeck <paula@soe.ucsc.edu>,
        Thorsten Leemhuis <regressions@leemhuis.info>,
        TW <dalzot@gmail.com>, regressions@lists.linux.dev,
        Bart Van Assche <bvanassche@acm.org>,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Damien,

On Wed, Sep 13, 2023 at 12:58 AM Damien Le Moal <dlemoal@kernel.org> wrote:
> On 9/13/23 02:39, Geert Uytterhoeven wrote:
> > On Mon, 31 Jul 2023, Damien Le Moal wrote:
> >> During system resume, ata_port_pm_resume() triggers ata EH to
> >> 1) Resume the controller
> >> 2) Reset and rescan the ports
> >> 3) Revalidate devices
> >> This EH execution is started asynchronously from ata_port_pm_resume(),
> >> which means that when sd_resume() is executed, none or only part of the
> >> above processing may have been executed. However, sd_resume() issues a
> >> START STOP UNIT to wake up the drive from sleep mode. This command is
> >> translated to ATA with ata_scsi_start_stop_xlat() and issued to the
> >> device. However, depending on the state of execution of the EH process
> >> and revalidation triggerred by ata_port_pm_resume(), two things may
> >> happen:
> >> 1) The START STOP UNIT fails if it is received before the controller has
> >>   been reenabled at the beginning of the EH execution. This is visible
> >>   with error messages like:
> >>
> >> ata10.00: device reported invalid CHS sector 0
> >> sd 9:0:0:0: [sdc] Start/Stop Unit failed: Result: hostbyte=DID_OK driverbyte=DRIVER_OK
> >> sd 9:0:0:0: [sdc] Sense Key : Illegal Request [current]
> >> sd 9:0:0:0: [sdc] Add. Sense: Unaligned write command
> >> sd 9:0:0:0: PM: dpm_run_callback(): scsi_bus_resume+0x0/0x90 returns -5
> >> sd 9:0:0:0: PM: failed to resume async: error -5
> >>
> >> 2) The START STOP UNIT command is received while the EH process is
> >>   on-going, which mean that it is stopped and must wait for its
> >>   completion, at which point the command is rather useless as the drive
> >>   is already fully spun up already. This case results also in a
> >>   significant delay in sd_resume() which is observable by users as
> >>   the entire system resume completion is delayed.
> >>
> >> Given that ATA devices will be woken up by libata activity on resume,
> >> sd_resume() has no need to issue a START STOP UNIT command, which solves
> >> the above mentioned problems. Do not issue this command by introducing
> >> the new scsi_device flag no_start_on_resume and setting this flag to 1
> >> in ata_scsi_dev_config(). sd_resume() is modified to issue a START STOP
> >> UNIT command only if this flag is not set.
> >>
> >> Reported-by: Paul Ausbeck <paula@soe.ucsc.edu>
> >> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=215880
> >> Fixes: a19a93e4c6a9 ("scsi: core: pm: Rely on the device driver core for async power management")
> >> Signed-off-by: Damien Le Moal <dlemoal@kernel.org>
> >
> > Thanks for your patch, which is now commit 0a8589055936d8fe
> > ("ata,scsi: do not issue START STOP UNIT on resume") in v6.5-rc5.
> > Sorry for being late to the party, but this commit landed upstream
> > during my summer holidays, and apparently I wasn't that focussed on
> > noticing small behavioral changes after getting back to work...
> >
> > I noticed an oddity after s2idle or s2ram on Renesas Salvator-XS (R-Car
> > H3 ES2.0) with an old (spinning rust) SATA drive, and bisected it to
> > this commit: when accessing the drive after system resume, there is now
> > a delay of ca. 5s before data is returned, presumably due to starting
> > the drive, and having to wait for it to spin up to be able to read data.
> > But the good news is that the actual system resume takes less time than
> > before (reduced by even more than ca. 5s!), so this looks like a net
> > win...
>
> Thanks for the report. The delay for the first data access from user space right
> after resume is 100% expected, with or without this patch. The reason is that
> waking up the drive (spinning it up) is done asynchronously from the PM resume
> context, so when you get "PM suspend exit" message signaling that the system is
> resumed, the drive may not yet be spinning. Any access will wait for that to
> happen before proceeding. Depending on the drive that can take up to 10s or so.

That does not match with what I am seeing: before this patch, there
was no delay on first data access from user space, as the drive is fully
spun up when system resume returns.
With this patch, system resume returns earlier, and the drive is only
spun up when user space starts accessing data.

Note that I do not have any file system mounted, and use
"hd /dev/sda | head -70" to access the disk.

> I am not entirely sure where the net win you see come from. But the patch you
> mention is in fact completely wrong and does not fix the underlying issues with
> ata suspend/resume and potential deadlocks in PM due to ata ports relationship
> with scsi devices. So I have been working on fixing this for the last 2 weeks,
> after another user also reported issues with the patch you mention [1].
>
> Could you try libata for-next branch on your system ? There are 7 fix patches in
> there that I plan to send out for 6.6-rc2 to fix the patch in question and other
> issues potentially causing deadlocks on resume. The patches were posted also [2].
>
> https://lore.kernel.org/linux-ide/20230912005655.368075-1-dlemoal@kernel.org/T/#t

Unfortunately that didn't work, as /dev/sda no longer exists.
Will reply to the patch I bisected the issue to...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
