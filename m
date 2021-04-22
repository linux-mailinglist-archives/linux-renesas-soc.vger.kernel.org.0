Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3F6D367D22
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Apr 2021 11:03:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229938AbhDVJET (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 22 Apr 2021 05:04:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:42118 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230316AbhDVJEQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 22 Apr 2021 05:04:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6B1F461428;
        Thu, 22 Apr 2021 09:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619082222;
        bh=kOWQRTM3XWNMCkgPqM3/yz/0ND8MnHE7ApbWuhF7kNk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=KI5I1b5+fKyD+23wRiFyiS2DQTo12S0lIBGNugxJwRjitycdwkXOGO+cl8XFLalL9
         9N2QmoRYyF2lHbpNoSYXPnrRSL4VSg6FnpsGWMUzzILh3EnQFo4OcA7pIEOBlExgkr
         ynEUXWwaA1b6tNgD6e85+sCz0DFKzp3/Fz532PPpuE2amH6cfpC0+TaIFsfAwGtRH2
         JhUxuNlLqu0U+9MxSvy3ggKdRFZwWz6BN2nHhKiXzzbUS0QdVRFL3EuE8ZLuQCB6wF
         KOQHiSQIv8th9BpI2F3kQ7WE7/7C7e3fa0If6roAejLx6CQsiABnNJ7D2L5+85Phg7
         TosFc5lfGG7Rw==
Date:   Thu, 22 Apr 2021 11:03:36 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kangjie Lu <kjlu@umn.edu>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Niklas =?UTF-8?B?U8O2ZGVybHVuZA==?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH 073/190] Revert "media: rcar_drif: fix a memory
 disclosure"
Message-ID: <20210422110336.1d67678d@coco.lan>
In-Reply-To: <c8dbe373-8910-5b34-ce71-cad1bcab2d71@xs4all.nl>
References: <20210421130105.1226686-1-gregkh@linuxfoundation.org>
        <20210421130105.1226686-74-gregkh@linuxfoundation.org>
        <CAMuHMdVFf3_jo+oGPm4THhan3bVZx99omkG1LnAp=B4JTKhChA@mail.gmail.com>
        <YICXdauWkNRezHgX@pendragon.ideasonboard.com>
        <CAMuHMdXN_j49MeEv2wUW5JOeYbJYU7Gj1FtEv7s744mo0x1rWA@mail.gmail.com>
        <c8dbe373-8910-5b34-ce71-cad1bcab2d71@xs4all.nl>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Em Thu, 22 Apr 2021 09:29:36 +0200
Hans Verkuil <hverkuil-cisco@xs4all.nl> escreveu:

> On 22/04/2021 08:57, Geert Uytterhoeven wrote:
> > Hi Laurent,
> > 
> > On Wed, Apr 21, 2021 at 11:22 PM Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com> wrote:  
> >> On Wed, Apr 21, 2021 at 08:58:22PM +0200, Geert Uytterhoeven wrote:  
> >>> On Wed, Apr 21, 2021 at 3:06 PM Greg Kroah-Hartman wrote:  
> >>>> This reverts commit d39083234c60519724c6ed59509a2129fd2aed41.
> >>>>
> >>>> Commits from @umn.edu addresses have been found to be submitted in "bad
> >>>> faith" to try to test the kernel community's ability to review "known
> >>>> malicious" changes.  The result of these submissions can be found in a
> >>>> paper published at the 42nd IEEE Symposium on Security and Privacy
> >>>> entitled, "Open Source Insecurity: Stealthily Introducing
> >>>> Vulnerabilities via Hypocrite Commits" written by Qiushi Wu (University
> >>>> of Minnesota) and Kangjie Lu (University of Minnesota).
> >>>>
> >>>> Because of this, all submissions from this group must be reverted from
> >>>> the kernel tree and will need to be re-reviewed again to determine if
> >>>> they actually are a valid fix.  Until that work is complete, remove this
> >>>> change to ensure that no problems are being introduced into the
> >>>> codebase.
> >>>>
> >>>> Cc: Kangjie Lu <kjlu@umn.edu>
> >>>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> >>>> Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> >>>> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> >>>> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>  
> >>>
> >>> Upon a second look, I still see nothing wrong with the original commit.
> >>> However, as I'm no v4l expert, I'd like to defer to the experts for final
> >>> judgement.  
> >>
> >> It seems fine to me, but it also seems unneeded, as the V4L2 core clears
> >> the whole f->fmt union before calling this operation. The revert will
> >> this improve performance very slightly.  
> > 
> > Hmm, that means very recent commit f12b81e47f48940a ("media: core
> > headers: fix kernel-doc warnings") is not fully correct, as it added
> > kerneldoc stating this is the responsibility of the driver:
> > 
> > + * @reserved:          drivers and applications must zero this array  
> 
> Actually, it is the V4L2 core used by the driver that zeroes this. So
> drivers don't need to do this, it's done for them. It used to be the
> responsibility of the driver itself, but this was all moved to the core
> framework a long time ago since, duh!, drivers always forgot this :-)
> 
> > 
> > Anyway, it doesn't look like this umn.edu patch introduced a bug.  
> 
> I haven't seen any bugs introduced by the media patches from umn.edu.

Hi Greg,

I also double-checked all media revert patches from:

	git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git umn.edu-reverts

currently on this patch:
	6f4747a872ad Revert "ethtool: fix a potential missing-check bug"

That's a summary of what I found:

All of those should be dropped from your tree:

	84fdb5856edd	Revert "media: si2165: fix a missing check of return value"
	867043f2206e	Revert "media: video-mux: fix null pointer dereferences"
	78ae4b621297	Revert "media: cx231xx: replace BUG_ON with recovery code"
	5be328a55817	Revert "media: saa7146: Avoid using BUG_ON as an assertion"
	81ce83158d22	Revert "media: davinci/vpfe_capture.c: Avoid BUG_ON for register failure"
	3319b39504b8	Revert "media: media/saa7146: fix incorrect assertion in saa7146_buffer_finish"
	b393f7cb29a2	Revert "media: rcar-vin: Fix a reference count leak."
	197bc5d03682	Revert "media: rcar-vin: Fix a reference count leak."
	2fd9cf68bbb6	Revert "media: rockchip/rga: Fix a reference count leak."
	d1e4614eca24	Revert "media: platform: fcp: Fix a reference count leak."
	416e8a6ae07f	Revert "media: camss: Fix a reference count leak."
	06b793ae497b	Revert "media: s5p-mfc: Fix a reference count leak"
	8f9fc14a7cc9	Revert "media: stm32-dcmi: Fix a reference count leak"
	556e1f86ba24	Revert "media: ti-vpe: Fix a missing check and reference count leak"
	5f5b1722ad0d	Revert "media: exynos4-is: Fix a reference count leak"
	f4c758c6c1cb	Revert "media: exynos4-is: Fix a reference count leak due to pm_runtime_get_sync"
	beb717878c73	Revert "media: exynos4-is: Fix several reference count leaks due to pm_runtime_get_sync
	7066ec748bfd	Revert "media: sti: Fix reference count leaks"
	cdd117093b19	Revert "media: st-delta: Fix reference count leak in delta_run_work"

As, after my re-check, they all seem to be addressing real issues. So,
NACK on those.

This patch (073/190):

	899ab4671bc0	Revert "media: rcar_drif: fix a memory disclosure"

While it doesn't hurt, it is useless, as the media core already
prevents memory disclosure. So, it should be reverted.

So, for patch 073/190:

Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Thanks,
Mauro
