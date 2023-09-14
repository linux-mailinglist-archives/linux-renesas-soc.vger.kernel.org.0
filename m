Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3449079FC53
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Sep 2023 08:53:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233411AbjINGx3 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 14 Sep 2023 02:53:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232878AbjINGx0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Sep 2023 02:53:26 -0400
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0D81CE5;
        Wed, 13 Sep 2023 23:53:22 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-59bcd927b45so7232017b3.1;
        Wed, 13 Sep 2023 23:53:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694674401; x=1695279201;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MubaXS4LapmWRsdSNbB72rtVm488qlzx9GSVnCeypz4=;
        b=crTTfMT/yzelgeN+eHU8SlsdQmSKN2K6OnWR9fWFLBs7l2F1s9tMRDCvTNeYpRWoKV
         rvzkqPjAPjoagQmscZM2ehjoXimQGCvrDVL+C3+Bth6uw0FlZAv5NyVly7IS1798Zq5u
         8YMhAtc4pwVdZBQUFzaIdP4nL8B992FI2RcoFBKlwK6/LRCkmb3y1Bx82xonSr6qsJBe
         S1c0vwqdFyYSmD06Ova9F7mJVO0y+3nJFzxl6x9IMwk4dl9+z4IZKII3lmMCAenE6hd8
         /RC4Urs5+XNjW5hmHOuOBlKsTlSrTb8bSonA8PIdsiFginwQDrTfHiVvyY/FEaEu2HBg
         pb0w==
X-Gm-Message-State: AOJu0Yz/LVqPujfFDwUST1BFFgZOKRW49rNYwCefBefHcjT63g5j86s/
        GSCNF/ILZmzgY5laVhc5UFiDJunGz01lVA==
X-Google-Smtp-Source: AGHT+IHOHpzLQZ6f18LYofB8tRO4sNSSlhTgdOKCw92hfJ355vQ+Qyvj+zqhuZLWUxkzoptf2c8c9g==
X-Received: by 2002:a81:4705:0:b0:59a:b7b2:5f02 with SMTP id u5-20020a814705000000b0059ab7b25f02mr5171564ywa.18.1694674401715;
        Wed, 13 Sep 2023 23:53:21 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id m131-20020a0dca89000000b005773afca47bsm192932ywd.27.2023.09.13.23.53.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Sep 2023 23:53:20 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-d815a5eee40so610500276.2;
        Wed, 13 Sep 2023 23:53:20 -0700 (PDT)
X-Received: by 2002:a25:acd5:0:b0:d80:a9d:aea9 with SMTP id
 x21-20020a25acd5000000b00d800a9daea9mr4631207ybd.34.1694674400192; Wed, 13
 Sep 2023 23:53:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230731003956.572414-1-dlemoal@kernel.org> <8be9c370-2f1-5815-431-f68ab868669@linux-m68k.org>
 <ffc1442b-698e-65ab-9aaf-e4ca076b697c@kernel.org> <CAMuHMdXK-pnzMNzbNw=zWaMbQtWtca850eYv98oUjQkypgBfwg@mail.gmail.com>
 <2d90bd7c-5c34-a345-bc29-44dfa923fc19@kernel.org>
In-Reply-To: <2d90bd7c-5c34-a345-bc29-44dfa923fc19@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 14 Sep 2023 08:53:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVHu3zeM0WA7TcTA2QT9X68cTttU-TzjsQw6ZuYCu4t=A@mail.gmail.com>
Message-ID: <CAMuHMdVHu3zeM0WA7TcTA2QT9X68cTttU-TzjsQw6ZuYCu4t=A@mail.gmail.com>
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

On Thu, Sep 14, 2023 at 12:03 AM Damien Le Moal <dlemoal@kernel.org> wrote:
> On 9/13/23 19:21, Geert Uytterhoeven wrote:
> >> Thanks for the report. The delay for the first data access from user space right
> >> after resume is 100% expected, with or without this patch. The reason is that
> >> waking up the drive (spinning it up) is done asynchronously from the PM resume
> >> context, so when you get "PM suspend exit" message signaling that the system is
> >> resumed, the drive may not yet be spinning. Any access will wait for that to
> >> happen before proceeding. Depending on the drive that can take up to 10s or so.
> >
> > That does not match with what I am seeing: before this patch, there
> > was no delay on first data access from user space, as the drive is fully
> > spun up when system resume returns.
>
> Yes, that is a possibility, but not by design. Some users have complained about
> the long resume times which causes laptop screens to be "black" until disks spin
> up. That did not happen before 5.16, when the change to scsi using the PM async
> ops to do suspend/resume created all the issues with suspend/resume on ata side.
> I am going to run 5.15 again to check.
>
> The patch "do not issue START STOP UNIT on resume" was a botch attempt to remove
> this delay. But it is a bad one because the ATA specs define that a drive can
> get out of standby (spun down) power state only with a media access command (a
> VERIFY command is used to spin up the disk). And furthermore, the specs also
> says that even a reset shall not change the device power state. So issuing a
> VERIFY command to spin up the drive is required per specs. Note that I do see
> many of my drives (I have hundreds in the lab) spinning up on reset, which is
> against the specs. But not all of them. So with the patch "do not issue START
> STOP UNIT on resume", one risks not seeing the drive resuming correctly (timeout
> errors on IDENTIFY command issued on resume will get the drive removed).
>
> > With this patch, system resume returns earlier, and the drive is only
> > spun up when user space starts accessing data.
>
> Yes, but "when user space starts accessing data" -> "user space accesses are
> processed only after the drive completes spinning up" would be more accurate.

Sure, I wrote it down in terms of what the user is experiencing, which may
not be identical to what's happening under the hood.

> That is by design and expected. This is the behavior one would see if the drive
> is set to use standby timers (to go to standby on its own after some idle time)
> or if runtime suspend is used. I do not see any issue with this behavior. Is
> this causing any issue on your end ? Do you have concerns about this approach ?
>
> Having the resume process wait for the drive to fully spin-up is easy to do. But
> as I mentioned, many users are really not happy about how slow resuming become
> with that. If I do that, you will get back the previous behavior you mention,
> but I will be again getting emails about "resume is broken".
>
> I made a decision: no waiting for spinup. That causes a delay for the user on
> first access, but that makes resume overall far faster. I do not want to go back
> on that, unless you can confirm that there is a real regression/error/data
> corruption happening.

I agree that is fine.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
