Return-Path: <linux-renesas-soc+bounces-8054-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F2795BA9C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 17:37:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1FB52B2AFCA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 15:35:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91E441CBEBA;
	Thu, 22 Aug 2024 15:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sGOq2dDg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0CF1CB30A
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Aug 2024 15:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724340935; cv=none; b=Wtmto9UMkYhigFHsV5odvq3K5kIo+naHhqaGePSDG7KqqTGs5eAmwWAIqD2ElVlNJ++iaU0ZKHt9P9BFiiMfmxxBK9vd5ew29dbdz2jSDs9LpBDcwH80c/LQrb//n6YQ6E4Q2uZ5K8JOw10LLYng5iBLywbljJ0wEJ2fO5fO0MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724340935; c=relaxed/simple;
	bh=ynR/rlt2GTIBZ6UQWXHvIDOQFJGcuX9UXR6Ua9Iv6O8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jAXUeu8u1ws4FwC91OZ2ZN27yany3vA2nxHrSm8Fv38Gqu2BlojYYeDPFXaZWwsjvUmiuge8i42i3kYVO8AJkazZXZWIEaBK2BfM+8xefyMKdAi8nMqDnTiHDC1ObJiJbjs293aZLgrCAB6ysZgBgr0eFINXJRrzMl/Nb5DXguM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=sGOq2dDg; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9C9BF899;
	Thu, 22 Aug 2024 17:34:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724340866;
	bh=ynR/rlt2GTIBZ6UQWXHvIDOQFJGcuX9UXR6Ua9Iv6O8=;
	h=From:To:Cc:Subject:Date:From;
	b=sGOq2dDgB6V8mJ7SkGjZNeZtyNmsfo5V1Wjxl/UwNwGChBH+Eymh/N7V+QP48kg2H
	 7X3IZvn8oVJsC0fHCLCtQj73P3D0V6zYUsc/e6sq0+s3vwtI0PJBPbUV0T5m+8q7XL
	 iKYX4JiLq01dmYQd36s/1/t7SOUa+740kD5ayegU=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: libcamera-devel@lists.libcamera.org
Cc: Chen-Yu Tsai <wens@csie.org>,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Maxime Ripard <mripard@kernel.org>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 0/7] media: v4l2: Improve media link validation
Date: Thu, 22 Aug 2024 18:35:20 +0300
Message-ID: <20240822153527.25320-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This patch series improves the link validation helpers to make it easier
for drivers to validate all links in a pipeline.

The vast majority of drivers use the v4l2_subdev_link_validate()
function as their .link_validate() handler for subdevs. This correctly
validates subdev-to-subdev links. For links between subdevs and video
capture devices, a few drivers implement the .link_validate() operation
of their video devices, while others implement manual validation in
their .streamon() handler, or don't implement validation at all. Links
between video output devices are in an even worse state, as the link
validation logic at pipeline start time does not call the
.link_validate() operation on the source side of a link, leaving manual
validation in .streamon() the only option. Adding insult to injury,
v4l2_subdev_link_validate() prints a warning when the link's source is
not a subdev, which forces drivers to implement a manual subdev link
validation handler for subdevs connected to output video nodes.

It turns out that v4l2_subdev_link_validate() is even used in the
.link_validate() implementation of video devices by two drivers. This is
clearly wrong, and is addressed by patches 1/7 to 3/7. Note that patch
3/7 should ideally implement real validation of the link between the
subdev and video capture device, but that requires understanding of the
driver's logic as well as testing, so I have left it out as an exercise
for the driver's maintainer. The patch doesn't introduce any regression.

Patch 4/7 then starts refactoring the v4l2_subdev_link_validate() to
separate the current warning in two categories, with a WARN_ON() for an
issue that indicates a clear driver bug (and does not occur in any
driver in mainline at the moment), and keeping the pr_warn_once() for
other issues that are present in multiple drivers.

Patch 5/7 continues with expanding v4l2_subdev_link_validate() to better
support links from video output devices to subdevs, delegating the
validation to the video output device's .link_validate() operation. This
allows using v4l2_subdev_link_validate() for all subdevs in a driver,
regardless of whether they are connected to other subdevs, video capture
devices or video output devices, and implementing all the link
validation for video devices in their .link_validate() operation.

Patches 6/7 and 7/7 then address the v4l2_subdev_link_validate() warning
for the vsp1 driver. Patch 6/7 silences the warning. This is
unfortunately done with a workaround, as the ideal implementation,
moving all validation for video devices to their .link_validate()
operation as showcased in patch 7/7, breaks operation of the vsp1 unit
test suite. While that is fixable in the test suite, it indicates that
other userspace applications may also break as a result.

To my great sadness, I had to mark patch 7/7 as [DNI]. This does not
make the v4l2_subdev_link_validate() improvements in patch 5/7
pointless, as they are useful for new drivers, as well as drivers that
don't include multiple video devices in a pipeline.

Laurent Pinchart (7):
  media: microchip-isc: Drop v4l2_subdev_link_validate() for video
    devices
  media: sun4i_csi: Implement link validate for sun4i_csi subdev
  media: sun4i_csi: Don't use v4l2_subdev_link_validate() for video
    device
  media: v4l2-subdev: Refactor warnings in v4l2_subdev_link_validate()
  media: v4l2-subdev: Support hybrid links in
    v4l2_subdev_link_validate()
  media: renesas: vsp1: Implement .link_validate() for video devices
  [DNI] media: renesas: vsp1: Validate all links through
    .link_validate()

 .../platform/microchip/microchip-isc-base.c   |  19 +---
 .../media/platform/renesas/vsp1/vsp1_video.c  | 104 +++++++++---------
 .../platform/sunxi/sun4i-csi/sun4i_csi.c      |  12 ++
 drivers/media/v4l2-core/v4l2-subdev.c         |  50 +++++++--
 include/media/v4l2-subdev.h                   |   6 +
 5 files changed, 115 insertions(+), 76 deletions(-)


base-commit: a043ea54bbb975ca9239c69fd17f430488d33522
-- 
Regards,

Laurent Pinchart


