Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1ABE7F064C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Nov 2019 20:52:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726820AbfKETwS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Nov 2019 14:52:18 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:45148 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726640AbfKETwS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Nov 2019 14:52:18 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5C457559;
        Tue,  5 Nov 2019 20:52:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1572983536;
        bh=HTRxW1JGt92kEA/NNvUHxAWI1eI7HemP329in2Rcpeo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RCkmw/scmF2sktO/Mcz0LCLM+Po9x2KPgnnqL2mVBICg43zP2Dmgq8wcM8Mz+Ip7g
         SgGRF7Luh8stLyFqQkZmZu0G2OsbpihHj8p9kLtwsQnJ4Uxp2GuM0wF6ijjgx6vcE+
         HDsHV1BcGoeI5ZyzTIen3dXLjPhG/td21ihK1ISw=
Date:   Tue, 5 Nov 2019 21:52:05 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Simon Horman <horms@verge.net.au>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 0/8] drm: rcar-du: Add Color Management Module (CMM)
Message-ID: <20191105195205.GB4869@pendragon.ideasonboard.com>
References: <20191016085548.105703-1-jacopo+renesas@jmondi.org>
 <20191017191400.GH4901@pendragon.ideasonboard.com>
 <CAMuHMdWTCF30+JpztF-p-5JqHS5ALiAs5E0Jo82DCgpu99NZ7w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdWTCF30+JpztF-p-5JqHS5ALiAs5E0Jo82DCgpu99NZ7w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Tue, Nov 05, 2019 at 05:14:20PM +0100, Geert Uytterhoeven wrote:
> On Thu, Oct 17, 2019 at 9:14 PM Laurent Pinchart wrote:
> > On Wed, Oct 16, 2019 at 10:55:40AM +0200, Jacopo Mondi wrote:
> > > Minimal increment to the CMM series, this time should really be the last one.
> > >
> > > Just missing Rob's ack on [1/8] and Laurent's one on [5/8].
> > >
> > > Changelog is minimal:
> > > CMM
> > > - Remove the cmm_config.enable flag. The cmm_config.table field validity is
> > >   used to enable/disable the LUT operations
> > > - Expand comments as suggested by Laurent
> > >
> > > CRTC
> > > - use drm_color_lut_size() to check the LUT table size
> > > - Inline calls to rcar_cmm_enable()/disable()
> > > - Add TODO entries as suggested by Laurent
> > >
> > > For the record, the full series changelog is available at:
> > > https://paste.debian.net/1107427/
> > >
> > > v5 from yesterday with informations on testing is available at:
> > > https://lkml.org/lkml/2019/10/15/337
> > >
> > > Geert will you collect for DTS patches for the next release?
> > > I assume the DU changes go through Laurent instead ?
> >
> > I've taken patch 1/8 to 6/8 and 8/8 in my tree. I expected Geert to take
> > 7/8.
> 
> And so I did. 7/8 is now in arm-soc/for-next.
> 
> However, your drm/du/next branch seems to contain 7/8 instead of 8/8?

That was a mistake that I fixed in a second pull request (see
https://lists.freedesktop.org/archives/dri-devel/2019-October/241110.html),
I forgot to update the drm/du/next branch, but the tag should be
correct. I've now fixed the problem in the branch as well.

-- 
Regards,

Laurent Pinchart
