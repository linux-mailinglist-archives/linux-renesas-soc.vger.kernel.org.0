Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A17F6123A87
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2019 00:09:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726539AbfLQXJJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Dec 2019 18:09:09 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:56894 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726454AbfLQXJJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Dec 2019 18:09:09 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BF9249BF;
        Wed, 18 Dec 2019 00:09:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1576624147;
        bh=aROGuM/kUggA/FWpJUywkaxAs+n5HHISQN39ygHEdPs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uKqu4kY5Vt+pYye0eoiVFFfEN4l0Obt2Fr2rE+ROzwighCuJ8MeENMf+G7FjbLtl5
         sTyUB5kDir5Zu8lj5JpjiXq0nxi2R+n7SjQgCkurqEOHtml2cMQv3P2uTvjWXTF/Tu
         PHcrAlPyIjocMoz0Y8M+zua1mslTyl0t/OTH6xLc=
Date:   Wed, 18 Dec 2019 01:08:56 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
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
Message-ID: <20191217230856.GE4874@pendragon.ideasonboard.com>
References: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1573660292-10629-7-git-send-email-fabrizio.castro@bp.renesas.com>
 <20191213171038.GH4860@pendragon.ideasonboard.com>
 <TY1PR01MB1770DEDFA6050EA77AA218F8C0500@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <CAMuHMdUE0O9_8g02f2ABiV8SSMXNJB9S9e89p0OJKnTvx8MO9g@mail.gmail.com>
 <TY1PR01MB17705FC08F72875484DF2208C0500@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <CAMuHMdVqHekyeOaHwpFyG5buNZp-XmvGizqZ=Gbg40_=NL+s2A@mail.gmail.com>
 <20191217135414.GA4741@pendragon.ideasonboard.com>
 <TY1PR01MB177059B563B0F29E5A4E424BC0500@TY1PR01MB1770.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <TY1PR01MB177059B563B0F29E5A4E424BC0500@TY1PR01MB1770.jpnprd01.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Dec 17, 2019 at 10:06:14PM +0000, Fabrizio Castro wrote:
> On 17 December 2019 13:54, Laurent Pinchart wrote:
> > On Tue, Dec 17, 2019 at 01:38:51PM +0100, Geert Uytterhoeven wrote:
> >> On Tue, Dec 17, 2019 at 1:31 PM Fabrizio Castro wrote:
> >>> On 17 December 2019 12:21, Geert Uytterhoeven wrote:
> >>>> On Tue, Dec 17, 2019 at 12:03 PM Fabrizio Castro wrote:
> >>>>> On 13 December 2019 17:11, Laurent Pinchart wrote:
> >>>>>> On Wed, Nov 13, 2019 at 03:51:25PM +0000, Fabrizio Castro wrote:
> >>>>>>> Add support for transparent LVDS decoders by adding a new
> >>>>>>> compatible string ("lvds-decoder") to the driver.
> >>>>>>> This patch also adds member connector_type to struct lvds_codec,
> >>>>>>> and that's because LVDS decoders have a different connector type
> >>>>>>> from LVDS encoders. We fill this new member up with the data
> >>>>>>> matching the compatible string.
> >>>>>>>
> >>>>>>> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> >>>>>>>
> >>>>>>> --- a/drivers/gpu/drm/bridge/lvds-codec.c
> >>>>>>> +++ b/drivers/gpu/drm/bridge/lvds-codec.c
> >>>>>>>
> >>>>>>> @@ -65,6 +67,7 @@ static int lvds_codec_probe(struct platform_device *pdev)
> >>>>>>>     if (!lvds_codec)
> >>>>>>>             return -ENOMEM;
> >>>>>>>
> >>>>>>> +   lvds_codec->connector_type = (u32)of_device_get_match_data(&pdev->dev);
> >>>>>>
> >>>>>> I'm now getting a compilation failure here:
> >>>>>>
> >>>>>> drivers/gpu/drm/bridge/lvds-codec.c: In function ‘lvds_codec_probe’:
> >>>>>> drivers/gpu/drm/bridge/lvds-codec.c:68:31: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
> >>>>>>   lvds_codec->connector_type = (u32)of_device_get_match_data(&pdev->dev);
> >>>>>>                                ^
> >>>>>>
> >>>>>> The fix should be simple:
> >>>>>>
> >>>>>>       lvds_codec->connector_type = (uintptr_t)of_device_get_match_data(dev);
> >>>>>>
> >>>>>> I'm bothered by the fact that I've compiled this before without any
> >>>>>> issue, so this really puzzles me. Do you get the same warning ?
> >>>>>
> >>>>> The warning appears when compiling for arm64, understandably so.
> >>>>> We must have compiled this for arm only the first time around.
> >>>>>
> >>>>> I think the right way to solve this is to either cast to (u32)(uintptr_t) or (u32)(unsigned long).
> >>>>
> >>>> Just casting to uintptr_t should be sufficient.
> >>>
> >>> It should be sufficient for the compiler, but I have seen examples where people
> >>> preferred to be explicit, like in:
> >>> drivers/mailbox/mtk-cmdq-mailbox.c
> >>> drivers/leds/leds-pm8058.c
> >>>
> >>> Since the kernel is increasing its tightness with respect to warnings, I personally prefer
> >>> (u32)(uintptr_t), even though not strictly necessary, but I am fine with (uintptr_t) if you
> >>> don't like (u32)(uintptr_t).
> >>
> >> It depends. I try to have as few casts as possible ("casts are evil").
> >>
> >> While adding the extra (u32) cast makes it clearer that the intended
> >> result is a u32 (for now), it will cause silent truncation on 64-bit if
> >> connector_type is ever enlarged to unsigned long, and larger values are
> >> used.
> >>
> >> In this particular case this is unlikely, though, as unsigned long would
> >> still be 32-bit on 32-bit platforms, so the larger values cannot be
> >> used.
> > 
> > I also try to add as few casts as possible, so (uintptr_t) would be my
> > preference.
> > 
> > Fabrizio, could you submit a new version of this patch with the problem
> > fixed (and with the casts you decide to use, but using uintptr_t instead
> > of unsigned long in any case) ?
> 
> Will send a new version tomorrow with (uintptr_t)

Done as v4.1 :-)

-- 
Regards,

Laurent Pinchart
