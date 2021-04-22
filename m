Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6033367A6E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Apr 2021 08:58:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234979AbhDVG61 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 22 Apr 2021 02:58:27 -0400
Received: from mail-vs1-f44.google.com ([209.85.217.44]:44651 "EHLO
        mail-vs1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234976AbhDVG61 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 22 Apr 2021 02:58:27 -0400
Received: by mail-vs1-f44.google.com with SMTP id t23so6044720vso.11;
        Wed, 21 Apr 2021 23:57:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4foBw09MDw6s3pXeHYY2a07YfZSi/nyyHNfjUeyH1VU=;
        b=M8WUUI0HfZlLeryijBdLqI5EICYOkWqHO5NYuv/GubYr5K8grBMpadIo7XHxhSp/9h
         ExYxHtK4C09Zjki/MkeqnIQTOec8GQx7RP7trgxfsQe50H2IqGV2dz83JAcXnuRDg8fJ
         OMtN/2tCHz+dT610357pf/kRfatWkVlzYRPn3aUn8Vtp4GvgL9fkEG0hdXYVIaqJStuY
         zEJA+HPajlEq8CLyuJ3h0opeKg1yuTtD0B2T1aEWdrr4GdtflstF7Kmj1K3RC9GEihl1
         s2rIkHN41nRz9DV5a7hb++YMMJEqiplunA8dg/9f5gxHVUm4VUHA7g9P9WyafDeYOzb1
         Ufpw==
X-Gm-Message-State: AOAM532iGnozgwqSk4yPsggNDWilhv5z7siTNJFJP/JgW5/DSjzmOpv4
        7EkFOJgAnbtI0aJ76oN2R1IeRNjK2BkZvYljl/w=
X-Google-Smtp-Source: ABdhPJyOjs5ar2yehQ6u0OsOpuk5qctA0sHyTLkAEf/YwE4Ttu+Zj/JaO+TzLjr4hTLSCU9NA0rCHT7xEOAQunIXbuc=
X-Received: by 2002:a67:fc57:: with SMTP id p23mr1176649vsq.40.1619074672248;
 Wed, 21 Apr 2021 23:57:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210421130105.1226686-1-gregkh@linuxfoundation.org>
 <20210421130105.1226686-74-gregkh@linuxfoundation.org> <CAMuHMdVFf3_jo+oGPm4THhan3bVZx99omkG1LnAp=B4JTKhChA@mail.gmail.com>
 <YICXdauWkNRezHgX@pendragon.ideasonboard.com>
In-Reply-To: <YICXdauWkNRezHgX@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 22 Apr 2021 08:57:41 +0200
Message-ID: <CAMuHMdXN_j49MeEv2wUW5JOeYbJYU7Gj1FtEv7s744mo0x1rWA@mail.gmail.com>
Subject: Re: [PATCH 073/190] Revert "media: rcar_drif: fix a memory disclosure"
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kangjie Lu <kjlu@umn.edu>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Wed, Apr 21, 2021 at 11:22 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Wed, Apr 21, 2021 at 08:58:22PM +0200, Geert Uytterhoeven wrote:
> > On Wed, Apr 21, 2021 at 3:06 PM Greg Kroah-Hartman wrote:
> > > This reverts commit d39083234c60519724c6ed59509a2129fd2aed41.
> > >
> > > Commits from @umn.edu addresses have been found to be submitted in "bad
> > > faith" to try to test the kernel community's ability to review "known
> > > malicious" changes.  The result of these submissions can be found in a
> > > paper published at the 42nd IEEE Symposium on Security and Privacy
> > > entitled, "Open Source Insecurity: Stealthily Introducing
> > > Vulnerabilities via Hypocrite Commits" written by Qiushi Wu (University
> > > of Minnesota) and Kangjie Lu (University of Minnesota).
> > >
> > > Because of this, all submissions from this group must be reverted from
> > > the kernel tree and will need to be re-reviewed again to determine if
> > > they actually are a valid fix.  Until that work is complete, remove this
> > > change to ensure that no problems are being introduced into the
> > > codebase.
> > >
> > > Cc: Kangjie Lu <kjlu@umn.edu>
> > > Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> > > Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > > Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> > > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> >
> > Upon a second look, I still see nothing wrong with the original commit.
> > However, as I'm no v4l expert, I'd like to defer to the experts for final
> > judgement.
>
> It seems fine to me, but it also seems unneeded, as the V4L2 core clears
> the whole f->fmt union before calling this operation. The revert will
> this improve performance very slightly.

Hmm, that means very recent commit f12b81e47f48940a ("media: core
headers: fix kernel-doc warnings") is not fully correct, as it added
kerneldoc stating this is the responsibility of the driver:

+ * @reserved:          drivers and applications must zero this array

Anyway, it doesn't look like this umn.edu patch introduced a bug.

> > > --- a/drivers/media/platform/rcar_drif.c
> > > +++ b/drivers/media/platform/rcar_drif.c
> > > @@ -915,7 +915,6 @@ static int rcar_drif_g_fmt_sdr_cap(struct file *file, void *priv,
> > >  {
> > >         struct rcar_drif_sdr *sdr = video_drvdata(file);
> > >
> > > -       memset(f->fmt.sdr.reserved, 0, sizeof(f->fmt.sdr.reserved));
> > >         f->fmt.sdr.pixelformat = sdr->fmt->pixelformat;
> > >         f->fmt.sdr.buffersize = sdr->fmt->buffersize;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
