Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59987122D87
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2019 14:54:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728564AbfLQNya (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Dec 2019 08:54:30 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:46186 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728309AbfLQNy3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Dec 2019 08:54:29 -0500
Received: from pendragon.ideasonboard.com (85-76-114-113-nat.elisa-mobile.fi [85.76.114.113])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 77CCC9C5;
        Tue, 17 Dec 2019 14:54:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1576590867;
        bh=a9Znys4PI/NrVQPB6/m8UFFVFKRqUcrKabr7FFz1U2I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MCr/BIYD7JtXnJygA8jtzeEOMAh1Af/VCqhl/qOlcyOdTddo1xKlIjK1P5ic8BwXp
         hGKwm4Hhp7GHmXVV2ojkoRtdoC7mlqULCe4b0ZkW8ENzcievuDi1L4CD90upFUxy02
         UvhdbxA8DYpBn0lAKHVTn6Sf+MknFL2hO3jc7QCc=
Date:   Tue, 17 Dec 2019 15:54:14 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        Biju Das <biju.das@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Peter Rosin <peda@axentia.se>
Subject: Re: [PATCH v4 06/13] drm/bridge: lvds-codec: Add "lvds-decoder"
 support
Message-ID: <20191217135414.GA4741@pendragon.ideasonboard.com>
References: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1573660292-10629-7-git-send-email-fabrizio.castro@bp.renesas.com>
 <20191213171038.GH4860@pendragon.ideasonboard.com>
 <TY1PR01MB1770DEDFA6050EA77AA218F8C0500@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <CAMuHMdUE0O9_8g02f2ABiV8SSMXNJB9S9e89p0OJKnTvx8MO9g@mail.gmail.com>
 <TY1PR01MB17705FC08F72875484DF2208C0500@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <CAMuHMdVqHekyeOaHwpFyG5buNZp-XmvGizqZ=Gbg40_=NL+s2A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdVqHekyeOaHwpFyG5buNZp-XmvGizqZ=Gbg40_=NL+s2A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,

On Tue, Dec 17, 2019 at 01:38:51PM +0100, Geert Uytterhoeven wrote:
> On Tue, Dec 17, 2019 at 1:31 PM Fabrizio Castro wrote:
> > On 17 December 2019 12:21, Geert Uytterhoeven wrote:
> >> On Tue, Dec 17, 2019 at 12:03 PM Fabrizio Castro wrote:
> >>> On 13 December 2019 17:11, Laurent Pinchart wrote:
> >>>> On Wed, Nov 13, 2019 at 03:51:25PM +0000, Fabrizio Castro wrote:
> >>>>> Add support for transparent LVDS decoders by adding a new
> >>>>> compatible string ("lvds-decoder") to the driver.
> >>>>> This patch also adds member connector_type to struct lvds_codec,
> >>>>> and that's because LVDS decoders have a different connector type
> >>>>> from LVDS encoders. We fill this new member up with the data
> >>>>> matching the compatible string.
> >>>>>
> >>>>> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> >>>>>
> >>>>> --- a/drivers/gpu/drm/bridge/lvds-codec.c
> >>>>> +++ b/drivers/gpu/drm/bridge/lvds-codec.c
> >>>>>
> >>>>> @@ -65,6 +67,7 @@ static int lvds_codec_probe(struct platform_device *pdev)
> >>>>>     if (!lvds_codec)
> >>>>>             return -ENOMEM;
> >>>>>
> >>>>> +   lvds_codec->connector_type = (u32)of_device_get_match_data(&pdev->dev);
> >>>>
> >>>> I'm now getting a compilation failure here:
> >>>>
> >>>> drivers/gpu/drm/bridge/lvds-codec.c: In function ‘lvds_codec_probe’:
> >>>> drivers/gpu/drm/bridge/lvds-codec.c:68:31: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
> >>>>   lvds_codec->connector_type = (u32)of_device_get_match_data(&pdev->dev);
> >>>>                                ^
> >>>>
> >>>> The fix should be simple:
> >>>>
> >>>>       lvds_codec->connector_type = (uintptr_t)of_device_get_match_data(dev);
> >>>>
> >>>> I'm bothered by the fact that I've compiled this before without any
> >>>> issue, so this really puzzles me. Do you get the same warning ?
> >>>
> >>> The warning appears when compiling for arm64, understandably so.
> >>> We must have compiled this for arm only the first time around.
> >>>
> >>> I think the right way to solve this is to either cast to (u32)(uintptr_t) or (u32)(unsigned long).
> >>
> >> Just casting to uintptr_t should be sufficient.
> >
> > It should be sufficient for the compiler, but I have seen examples where people
> > preferred to be explicit, like in:
> > drivers/mailbox/mtk-cmdq-mailbox.c
> > drivers/leds/leds-pm8058.c
> >
> > Since the kernel is increasing its tightness with respect to warnings, I personally prefer
> > (u32)(uintptr_t), even though not strictly necessary, but I am fine with (uintptr_t) if you
> > don't like (u32)(uintptr_t).
> 
> It depends. I try to have as few casts as possible ("casts are evil").
> 
> While adding the extra (u32) cast makes it clearer that the intended
> result is a u32 (for now), it will cause silent truncation on 64-bit if
> connector_type is ever enlarged to unsigned long, and larger values are
> used.
> 
> In this particular case this is unlikely, though, as unsigned long would
> still be 32-bit on 32-bit platforms, so the larger values cannot be
> used.

I also try to add as few casts as possible, so (uintptr_t) would be my
preference.

Fabrizio, could you submit a new version of this patch with the problem
fixed (and with the casts you decide to use, but using uintptr_t instead
of unsigned long in any case) ?

-- 
Regards,

Laurent Pinchart
