Return-Path: <linux-renesas-soc+bounces-5044-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C40E28B9F9A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 May 2024 19:35:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E61DE1C218CB
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 May 2024 17:35:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BA3E16FF3E;
	Thu,  2 May 2024 17:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OR4Jc2jZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304DA28FC;
	Thu,  2 May 2024 17:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714671341; cv=none; b=Lrq0J5WtpLwDcQ5Q0d2YPpsjQiPIX9eGon5vvLx59n3Lp8XxBp6E2xZhH/TgNquV51gNeo62DTuOg1+XQaOjquxrpys4gp91p12UdNX6wpuAKEKaG/J+U8O2LVbyJeZ0h5ygZ4DLsu2qYjFHPk4DvHmquOrmTDLsj1+wfOkGSU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714671341; c=relaxed/simple;
	bh=Hr5LMlCMCqxzI5fdUrCvTURdGTfJ1Xg2AdY/lZf1Jq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=byqbgFBr6uDdLPJsGTgsJjErwgw85VIl9y8TmF8N7C59zzZZqnj5B8AhNiELEZaYSk3OxRx0m9eW0BLonk2ZYFlJy0RKfaT0a1dityAQyqAse+hvRGdTaWqS/9cWgrcYUN3WLIfwj2/6AEbDb8nT+XP8aMZrIyEXDQIuyCyqhaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OR4Jc2jZ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CE0DB552;
	Thu,  2 May 2024 19:34:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714671280;
	bh=Hr5LMlCMCqxzI5fdUrCvTURdGTfJ1Xg2AdY/lZf1Jq8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OR4Jc2jZNNHJTnbbMzIwsG0QCBvQ3T0qUuyyLSR/3/V0T6SSAmVJMru7b6XvlvSO/
	 0vXpDHsfzBiUD9ZtKoIsXsXwY4zlKFPj3I629wHJqrzeblftG+rJAX1OslX5sPqfhc
	 fujJZMzSYBg709brqj1A+u0VnynsPTXjSDAp+Jmk=
Date: Thu, 2 May 2024 20:35:30 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 00/19] media: renesas: rcar-csi2: Support multiple streams
Message-ID: <20240502173530.GG15807@pendragon.ideasonboard.com>
References: <20240430103956.60190-1-jacopo.mondi@ideasonboard.com>
 <20240430111718.GC1341585@ragnatech.se>
 <2spoyuhvmrnkecg6ux43cf4rz6vwaipj4cydairyjeoyut7nus@j7iilnodd2xn>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2spoyuhvmrnkecg6ux43cf4rz6vwaipj4cydairyjeoyut7nus@j7iilnodd2xn>

On Tue, Apr 30, 2024 at 01:51:13PM +0200, Jacopo Mondi wrote:
> Hi Niklas
>   thanks for the quick reply
> 
> On Tue, Apr 30, 2024 at 01:17:18PM +0200, Niklas Söderlund wrote:
> > Hi Jacopo,
> >
> > Thanks for this work! I'm happy that we finally can get this upstream. I
> > will test and review this in the coming days. As there appears to be a
> > few dependencies to get this to work do you have a branch covering
> > everything needed?
> 
> Sure
> https://git.kernel.org/pub/scm/linux/kernel/git/jmondi/linux.git/
> jmondi/renesas-drivers-2024-04-23-v6.9-rc5/multistream
> 
> I should have added it to the cover letter
> 
> > On 2024-04-30 12:39:36 +0200, Jacopo Mondi wrote:
> > > Hello this series implements multi-stream support for R-Car CSI-2 and the
> > > two CSI-2 devices that are available on Renesas dev-boards which are mainline
> > > supported (the ADV748x HDMI decoder and the MAX9286 GMSL deserializer).
> >
> > You also need to update the MAX96712 driver in staging else V3U and Gen4
> > will break.
> >
> 
> Ouch, right. I can do that but won't be able to test. Would you ?
> 
> > > The net gain in feature is:
> > > - ADV748x: Select on which MIPI CSI-2 VC to send the stream on
> > > - MAX9286: Paves the way for run-time selection of active links
> > >
> > > Both features are realized by controlling the devices routing tables.
> > > The max9286 routing support is not implemented, but these patches are needed
> > > in order to maintain the current version compatible with R-Car CSI-2.
> > >
> > > The R-Car CSI-2 driver needs to be updated in order to support multiplexed
> > > transmitters, in particular:
> > >
> > > - Use LINK_FREQ to compute the lane bandwidth
> > > - Support subdev_active state
> > > - Configure DT and VC handling by using the remote's frame_desc
> > >
> > > A separate fix for VIN sits at the top of the series to re-enable YUYV capture
> > > operations.
> > >
> > > The series needs to activate streams in v4l2-subdev to work correctly:
> > >
> > > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > > @@ -32,7 +32,7 @@
> > >   * 'v4l2_subdev_enable_streams_api' to 1 below.
> > >   */
> > >
> > > -static bool v4l2_subdev_enable_streams_api;
> > > +static bool v4l2_subdev_enable_streams_api = 1;
> > >  #endif
> >
> > I'm not up to date with the latest state of the multiple streams API.
> > Can this be runtime configured or will this break capture if the kernel
> > is not patched to enable this?
> 
> I'm afraid the latter. I really hope in the next kernel release we can
> get rid of this protection and enable streams by default.

I hope it will be done for v6.12 or possibly v6.11.

> > >
> > > Test scripts, based on vin-tests are available at:
> > > https://git.uk.ideasonboard.com/jmondi/vin-tests
> > >
> > > A note for Sakari: patch
> > > "media: max9286: Implement support for LINK_FREQ"
> > >
> > > Could actually use your new
> > > "media: v4l: Support passing sub-device argument to v4l2_get_link_freq()"
> > >
> > > I kept it as it is for this version waiting for your patch to get in.
> >
> > I like this idea.
> >
> > >
> > > A note for Niklas:
> > > I think this series paves the way to actually moving the control of which
> > > VC goes to which VIN using a routing table instead of using link enablement.
> > >
> > > Currently the setup is as it follows: routing within R-Car CSI-2 is fixed, sink
> > > stream 0/X goes to source stream X+1/0 and each source pad represents a VC.
> > > Which VC gets sent to which VIN is controlled by link enablement.
> > >
> > > A more natural way of handling this would be to make the routing table
> > > within CSI-2 configurable and have media-links immutable between the CSI-2
> > > source pad. A CSI-2 source pad would then represent a 'channel' between
> > > CSI-2 and VIN and not the VC which is sent on it.
> > >
> > > This setup would better represent the current implementation, with VIN's VCSEL
> > > fixed channel routing and with the CSI-2 routing table controlling which VC gets
> > > sent on which channel. What do you think ?
> >
> > That could be useful. Maybe we can even switch to use immutable links
> > and use the routing instead greatly simplifying the VIN driver as this
> > together with the other VIN series on the list we can drop the ugly
> > group concept ;-)
> 
> I had the same idea, but I'm not yet sure how this would work when a
> CSI-2 can be routed to multiple VIN groups...
> 
> > But this series is already quiet large, I think we can work on this
> > on-top in a new series.
> 
> Exactly, I didn't want to pile too many things. max9286 routing would
> be next in line, I kept it out to avoid sending 30 patches in one go
> (and to send this out earlier to get feedbacks)
> 
> > > Jacopo Mondi (19):
> > >   media: adv748x: Add support for active state
> > >   media: adv748x: Add flags to adv748x_subdev_init()
> > >   media: adv748x: Use V4L2 streams
> > >   media: adv748x: Propagate format to opposite stream
> > >   media: adv748x: Implement set_routing()
> > >   media: adv748x: Use routes to configure VC
> > >   media: adv748x: Implement .get_frame_desc()
> > >   media: max9286: Add support for subdev active state
> > >   media: max9286: Fix enum_mbus_code
> > >   media: max9286: Use frame interval from subdev state
> > >   media: max9286: Use V4L2 Streams
> > >   media: max9286: Implement .get_frame_desc()
> > >   media: max9286: Implement support for LINK_FREQ
> > >   media: max9286: Implement .get_mbus_config()
> > >   media: rcar-csi2: Add support for multiplexed streams
> > >   media: rcar-csi2: Support multiplexed transmitters
> > >   media: rcar-csi2: Store format in the subdev state
> > >   media: rcar-csi2: Implement set_routing
> > >   media: rcar-vin: Fix YUYV8_1X16 handling for CSI-2
> > >
> > >  drivers/media/i2c/adv748x/adv748x-afe.c       |   2 +-
> > >  drivers/media/i2c/adv748x/adv748x-core.c      |  12 +-
> > >  drivers/media/i2c/adv748x/adv748x-csi2.c      | 251 +++++++---
> > >  drivers/media/i2c/adv748x/adv748x-hdmi.c      |   2 +-
> > >  drivers/media/i2c/adv748x/adv748x.h           |   4 +-
> > >  drivers/media/i2c/max9286.c                   | 457 ++++++++++++------
> > >  drivers/media/platform/renesas/rcar-csi2.c    | 442 ++++++++++++-----
> > >  .../platform/renesas/rcar-vin/rcar-dma.c      |  16 +-
> > >  8 files changed, 834 insertions(+), 352 deletions(-)

-- 
Regards,

Laurent Pinchart

