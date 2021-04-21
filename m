Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A9753674C0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Apr 2021 23:22:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240622AbhDUVWi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 21 Apr 2021 17:22:38 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:38256 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238497AbhDUVWi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Apr 2021 17:22:38 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E18D53EE;
        Wed, 21 Apr 2021 23:22:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1619040123;
        bh=TB4+FoDBVxxSrB/TUbbps9a3vRShB5YzPoFR5+169H0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=U+5dG03gpYFcQwZrFelSo4Z0091oaP8BGPSfhbdKuUvOuTxnTxHb3QTYsM9IwAeWw
         SLZwfNfvENKyQWgQk66uN2KkSnmzQJofKNG07OxFuJy46Jmg19MNakvtkvfftqX3Gn
         l8ivx8GGdTT2t1pWDzkLlf7mf65GTIh9v6P227x0=
Date:   Thu, 22 Apr 2021 00:21:57 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kangjie Lu <kjlu@umn.edu>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH 073/190] Revert "media: rcar_drif: fix a memory
 disclosure"
Message-ID: <YICXdauWkNRezHgX@pendragon.ideasonboard.com>
References: <20210421130105.1226686-1-gregkh@linuxfoundation.org>
 <20210421130105.1226686-74-gregkh@linuxfoundation.org>
 <CAMuHMdVFf3_jo+oGPm4THhan3bVZx99omkG1LnAp=B4JTKhChA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdVFf3_jo+oGPm4THhan3bVZx99omkG1LnAp=B4JTKhChA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Wed, Apr 21, 2021 at 08:58:22PM +0200, Geert Uytterhoeven wrote:
> On Wed, Apr 21, 2021 at 3:06 PM Greg Kroah-Hartman wrote:
> > This reverts commit d39083234c60519724c6ed59509a2129fd2aed41.
> >
> > Commits from @umn.edu addresses have been found to be submitted in "bad
> > faith" to try to test the kernel community's ability to review "known
> > malicious" changes.  The result of these submissions can be found in a
> > paper published at the 42nd IEEE Symposium on Security and Privacy
> > entitled, "Open Source Insecurity: Stealthily Introducing
> > Vulnerabilities via Hypocrite Commits" written by Qiushi Wu (University
> > of Minnesota) and Kangjie Lu (University of Minnesota).
> >
> > Because of this, all submissions from this group must be reverted from
> > the kernel tree and will need to be re-reviewed again to determine if
> > they actually are a valid fix.  Until that work is complete, remove this
> > change to ensure that no problems are being introduced into the
> > codebase.
> >
> > Cc: Kangjie Lu <kjlu@umn.edu>
> > Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> > Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> Upon a second look, I still see nothing wrong with the original commit.
> However, as I'm no v4l expert, I'd like to defer to the experts for final
> judgement.

It seems fine to me, but it also seems unneeded, as the V4L2 core clears
the whole f->fmt union before calling this operation. The revert will
this improve performance very slightly.

> > --- a/drivers/media/platform/rcar_drif.c
> > +++ b/drivers/media/platform/rcar_drif.c
> > @@ -915,7 +915,6 @@ static int rcar_drif_g_fmt_sdr_cap(struct file *file, void *priv,
> >  {
> >         struct rcar_drif_sdr *sdr = video_drvdata(file);
> >
> > -       memset(f->fmt.sdr.reserved, 0, sizeof(f->fmt.sdr.reserved));
> >         f->fmt.sdr.pixelformat = sdr->fmt->pixelformat;
> >         f->fmt.sdr.buffersize = sdr->fmt->buffersize;
> >

-- 
Regards,

Laurent Pinchart
