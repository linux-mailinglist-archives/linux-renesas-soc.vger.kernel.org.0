Return-Path: <linux-renesas-soc+bounces-8057-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A820A95BA97
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 17:36:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A0632B27D20
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 15:35:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25B541CC164;
	Thu, 22 Aug 2024 15:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZO+znxHn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5541CC88F
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Aug 2024 15:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724340941; cv=none; b=ELLzP1BmIiQecrhYSAe+UJy6lkG6SyOX2sxnYaXCRfnzlOwiMOt4lJK2ReMI1BXXE62G/JMIRo2vxcvF+IbGRyE1+LjgAPL4vdOizDjNYJz1oxLD3Egus/WpzRZNJTATgz7/7GCiCVrjFyYxZmq+1eS/eCVjQl1qw6bxyWZUsus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724340941; c=relaxed/simple;
	bh=L6PW/jnfXa4+nyLEP2SbfgQft2F4O8LsNw4OqltCe/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XcWK+p1KYRu2UQd3FXoz6/b/rhwu3/3hNYP+DxTGn2yxm93i6rZICrll1ToeYEMtwKahuwhp/3ShQvRh9+nd9G7lhGhTTVJyZzFZ9MokxT5JKHasSN2MpQ8ICEEjBRhnfA+4xgB1mpjgx5PmFNYvopS/WCHwyPnYvMitKreqT1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZO+znxHn; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BD3B51083;
	Thu, 22 Aug 2024 17:34:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724340872;
	bh=L6PW/jnfXa4+nyLEP2SbfgQft2F4O8LsNw4OqltCe/g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZO+znxHn3QUDNjcqbTqpq5ynt1/dPTE2hJtRe/CxAqN3qTvmEwQOdWsZBUcucydF2
	 zwQ90wAJuGORKewyOgycAP7hT2SqYnLS6qLd08JcWiMHip3QwfkO30trLNUHD7FUgC
	 KOC5ntjV3Uq7n6yQcih78sejBZ7AzISFoIdO0lEA=
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
Subject: [PATCH v2 4/7] media: v4l2-subdev: Refactor warnings in v4l2_subdev_link_validate()
Date: Thu, 22 Aug 2024 18:35:24 +0300
Message-ID: <20240822153527.25320-5-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240822153527.25320-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20240822153527.25320-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The v4l2_subdev_link_validate() function prints a one-time warning if it
gets called on a link whose source or sink is not a subdev. As links get
validated in the context of their sink, a call to the helper when the
link's sink is not a subdev indicates that the driver has set its
.link_validate() handler to v4l2_subdev_link_validate() on a non-subdev
entity, which is a clear driver bug. On the other hand, the link's
source not being a subdev indicates that the helper is used for a subdev
connected to a video output device, which is a lesser issue, if only
because this is currently common practice.

There are no drivers left in the kernel that use
v4l2_subdev_link_validate() in a context where it may get called on a
non-subdev sink. Replace the pr_warn_once() with a WARN_ON_ONCE() in
this case to make sure that new offenders won't be introduced.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v1:

- Switch from WARN_ON() to WARN_ON_ONCE()
---
 drivers/media/v4l2-core/v4l2-subdev.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 7c5812d55315..d3196042d5c5 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1443,11 +1443,15 @@ int v4l2_subdev_link_validate(struct media_link *link)
 	bool states_locked;
 	int ret;
 
-	if (!is_media_entity_v4l2_subdev(link->sink->entity) ||
-	    !is_media_entity_v4l2_subdev(link->source->entity)) {
-		pr_warn_once("%s of link '%s':%u->'%s':%u is not a V4L2 sub-device, driver bug!\n",
-			     !is_media_entity_v4l2_subdev(link->sink->entity) ?
-			     "sink" : "source",
+	/*
+	 * Links are validated in the context of the sink entity. Usage of this
+	 * helper on a sink that is not a subdev is a clear driver bug.
+	 */
+	if (WARN_ON_ONCE(!is_media_entity_v4l2_subdev(link->sink->entity)))
+		return -EINVAL;
+
+	if (!is_media_entity_v4l2_subdev(link->source->entity)) {
+		pr_warn_once("source of link '%s':%u->'%s':%u is not a V4L2 sub-device, driver bug!\n",
 			     link->source->entity->name, link->source->index,
 			     link->sink->entity->name, link->sink->index);
 		return 0;
-- 
Regards,

Laurent Pinchart


