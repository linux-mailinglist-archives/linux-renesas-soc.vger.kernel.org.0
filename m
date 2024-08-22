Return-Path: <linux-renesas-soc+bounces-8069-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E2095BAE5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 17:47:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 89CF91F21855
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 15:47:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9554C2C1A5;
	Thu, 22 Aug 2024 15:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="p7SqWnWo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DA12C6B6
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Aug 2024 15:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724341617; cv=none; b=pvMzU/T1+RJQviNKdFxfUDLuVHRCToHTmH1Hx6TcMIbihMrgvVj9lC/pLnZmElCbMOD1UDTh+VehDEI4/QUGAboQMWrhLI2ORjiBocNxCdog+v1WaH1EknOAJQG5NXsotqv1GamZWzNa9+gdIkONYT8nHXOSkRCX7nYN6XUxPio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724341617; c=relaxed/simple;
	bh=odocXFEfjk2fSHShpJrHq0/0iPDFPuc98DH4j03ndBU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GnDqBbNnEDtZHDH5G22bdci5KCH2cDxfE4Im//wX4fGEc0czfKk7PaZ8XMBkp3VQ+VZQRonO8uvy/RVzXvOLUnWkPJ0RsQCyHES75bxp2TVdSjGjRtbD1cbRisnrYBXMud/8NzAfv8ANLTUSBDBxTL+r6hj3qd6aqFDc6MiP/fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=p7SqWnWo; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 57AF8219;
	Thu, 22 Aug 2024 17:45:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724341551;
	bh=odocXFEfjk2fSHShpJrHq0/0iPDFPuc98DH4j03ndBU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p7SqWnWodX/PLoXr6fs3cy4xFnBPO1NTGAQ0quIzD3yDqc30l8jTuGz1jQFJW6mTe
	 AQYz/L78Kk7O7tnKkL90WvPk/5BZh37HMybk2MORA2/CikA9RyFcEIA5OY9LP0TpYj
	 4cSoMVTV72zW6IbXYG0ZmGcSxRNGVH5X9/VqVmYI=
Date: Thu, 22 Aug 2024 18:46:52 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: libcamera-devel@lists.libcamera.org
Cc: Chen-Yu Tsai <wens@csie.org>,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Maxime Ripard <mripard@kernel.org>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 0/7] media: v4l2: Improve media link validation
Message-ID: <20240822154652.GA26081@pendragon.ideasonboard.com>
References: <20240822153527.25320-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240822153527.25320-1-laurent.pinchart+renesas@ideasonboard.com>

This patch series was sent to libcamera-devel instead of linux-media.
I've now fixed that mistake, sorry the noise. Please reply to the series
sent to the right mailing list.

On Thu, Aug 22, 2024 at 06:35:20PM +0300, Laurent Pinchart wrote:
> Hello,
> 
> This patch series improves the link validation helpers to make it easier
> for drivers to validate all links in a pipeline.
> 
> The vast majority of drivers use the v4l2_subdev_link_validate()
> function as their .link_validate() handler for subdevs. This correctly
> validates subdev-to-subdev links. For links between subdevs and video
> capture devices, a few drivers implement the .link_validate() operation
> of their video devices, while others implement manual validation in
> their .streamon() handler, or don't implement validation at all. Links
> between video output devices are in an even worse state, as the link
> validation logic at pipeline start time does not call the
> .link_validate() operation on the source side of a link, leaving manual
> validation in .streamon() the only option. Adding insult to injury,
> v4l2_subdev_link_validate() prints a warning when the link's source is
> not a subdev, which forces drivers to implement a manual subdev link
> validation handler for subdevs connected to output video nodes.
> 
> It turns out that v4l2_subdev_link_validate() is even used in the
> .link_validate() implementation of video devices by two drivers. This is
> clearly wrong, and is addressed by patches 1/7 to 3/7. Note that patch
> 3/7 should ideally implement real validation of the link between the
> subdev and video capture device, but that requires understanding of the
> driver's logic as well as testing, so I have left it out as an exercise
> for the driver's maintainer. The patch doesn't introduce any regression.
> 
> Patch 4/7 then starts refactoring the v4l2_subdev_link_validate() to
> separate the current warning in two categories, with a WARN_ON() for an
> issue that indicates a clear driver bug (and does not occur in any
> driver in mainline at the moment), and keeping the pr_warn_once() for
> other issues that are present in multiple drivers.
> 
> Patch 5/7 continues with expanding v4l2_subdev_link_validate() to better
> support links from video output devices to subdevs, delegating the
> validation to the video output device's .link_validate() operation. This
> allows using v4l2_subdev_link_validate() for all subdevs in a driver,
> regardless of whether they are connected to other subdevs, video capture
> devices or video output devices, and implementing all the link
> validation for video devices in their .link_validate() operation.
> 
> Patches 6/7 and 7/7 then address the v4l2_subdev_link_validate() warning
> for the vsp1 driver. Patch 6/7 silences the warning. This is
> unfortunately done with a workaround, as the ideal implementation,
> moving all validation for video devices to their .link_validate()
> operation as showcased in patch 7/7, breaks operation of the vsp1 unit
> test suite. While that is fixable in the test suite, it indicates that
> other userspace applications may also break as a result.
> 
> To my great sadness, I had to mark patch 7/7 as [DNI]. This does not
> make the v4l2_subdev_link_validate() improvements in patch 5/7
> pointless, as they are useful for new drivers, as well as drivers that
> don't include multiple video devices in a pipeline.
> 
> Laurent Pinchart (7):
>   media: microchip-isc: Drop v4l2_subdev_link_validate() for video
>     devices
>   media: sun4i_csi: Implement link validate for sun4i_csi subdev
>   media: sun4i_csi: Don't use v4l2_subdev_link_validate() for video
>     device
>   media: v4l2-subdev: Refactor warnings in v4l2_subdev_link_validate()
>   media: v4l2-subdev: Support hybrid links in
>     v4l2_subdev_link_validate()
>   media: renesas: vsp1: Implement .link_validate() for video devices
>   [DNI] media: renesas: vsp1: Validate all links through
>     .link_validate()
> 
>  .../platform/microchip/microchip-isc-base.c   |  19 +---
>  .../media/platform/renesas/vsp1/vsp1_video.c  | 104 +++++++++---------
>  .../platform/sunxi/sun4i-csi/sun4i_csi.c      |  12 ++
>  drivers/media/v4l2-core/v4l2-subdev.c         |  50 +++++++--
>  include/media/v4l2-subdev.h                   |   6 +
>  5 files changed, 115 insertions(+), 76 deletions(-)
> 
> 
> base-commit: a043ea54bbb975ca9239c69fd17f430488d33522

-- 
Regards,

Laurent Pinchart

