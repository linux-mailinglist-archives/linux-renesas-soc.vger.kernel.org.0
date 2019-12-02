Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA47910E6EE
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Dec 2019 09:31:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726210AbfLBIbQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Dec 2019 03:31:16 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:42854 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726057AbfLBIbQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Dec 2019 03:31:16 -0500
Received: by mail-oi1-f193.google.com with SMTP id j22so1277652oij.9;
        Mon, 02 Dec 2019 00:31:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TgcuAjtRIpHHn+mewrE8xY/XXtbhINI+FBdsIRU3xR0=;
        b=b2XXFkLOkKLe06v9Mxqx3kDFkOswuP/z62r8bD+O8n+QE+GunF8en2uaaGyiewQ7Bq
         w7wvUZ5iJHnpvKzAMaE9mtqN22LGFd+ae1OJSNZmA+gyFH7JG1zl/XDUdjKrcsARosqr
         iYgIz59Koo8IqUXVoSE8/vaWWWIq3j0SJEOGPGVR1tAyIesbdEf6JImewerdlrNrMMDL
         khq/bjKjGebut0ypzWcOH3dpsP9PbNB7QOVIrWgVmBKTfNpiXeXvALCua1sJvtY9rOjb
         LR0Y6sVptLdax05BgywbJ9fNckSvcmWdyFEjcCR2ZH1uZCcGYU7cn468xgPltzya2DyB
         KfuQ==
X-Gm-Message-State: APjAAAV+IqhG/TlzY4vC61ot1gi9+6VSIgYctXJaefCEbe272Ymtgria
        Dc0ZgoZSkdg3uYyMeeLjo0QkSq5klCY+AVVwT3vNrHrk
X-Google-Smtp-Source: APXvYqwOySxmE37vPCHqDSf4HQfzKjJeLlq3+SSo9bkp46N3sNjcL5EGN3HTTrC/VjrYSqFVNUBo1A1THYYXoopAOfo=
X-Received: by 2002:aca:36c5:: with SMTP id d188mr1454560oia.54.1575275474903;
 Mon, 02 Dec 2019 00:31:14 -0800 (PST)
MIME-Version: 1.0
References: <20190917183652.7310-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdVYYveVeF4+16vi8zk+0yVZMMJnMvKbLms7CbQ6w00uVg@mail.gmail.com>
 <20191119204725.GA1454@kunai> <CAMuHMdV+W62MkSRuYZNT0ezOt_KkyStfoeZohu7m1pOP=4a0HQ@mail.gmail.com>
 <20191121085702.GA1184@ninjato> <CAMuHMdVHN_wVuqFn3UcbFWxGPLxc5TfbMBRAWpptdt9M36JRHQ@mail.gmail.com>
 <20191121111025.GB1184@ninjato> <20191202082041.GA1266@kunai>
In-Reply-To: <20191202082041.GA1266@kunai>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 2 Dec 2019 09:31:03 +0100
Message-ID: <CAMuHMdXLr627Tn88+Cu8tUVMviBdypR_rpO6dk-3UBwTWzYvAQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: tmio: remove workaround for NON_REMOVABLE
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Mon, Dec 2, 2019 at 9:20 AM Wolfram Sang <wsa@the-dreams.de> wrote:
> > anymore. However, I know have the issue highly reproducible with
> > renesas_defconfig and renesas-drivers. Good!
>
> Bummer, it is not that reproducible :(
>
> Yesterday, I tried latest linus tree which includes Ulf's changes to
> genpd and it worked, even with the NON_REMOVABLE workaround removed
> again. Then I reverted Ulf's changes to double check it made a
> difference, but the SCC still worked. So, I switched back to the
> renesas-drivers tree which used to fail last week, and it sadly works,
> too. Sigh...

How do you reboot in between tests?
I usually use /sbin/reboot if the target booted fine, and the (remote
controlled)
reset button if the target locked up.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
