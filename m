Return-Path: <linux-renesas-soc+bounces-1953-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB18584142B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jan 2024 21:24:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 819CF28B47E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jan 2024 20:23:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32A7C76052;
	Mon, 29 Jan 2024 20:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="hcCoAdJ9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251E6152DFC
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jan 2024 20:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706559823; cv=none; b=CMuizJIVQ65yjNNlkgjKoHo8jDK4eFO9xjIm0flxIog0edXvAsAgx/4XUCy7JcRE+pI5NorZyuvV1r5R+VjThY+vUuuHtqrYp937RxY9eeChl91alzn1LtGCmu9HnxhvqQPNMNAPoVV6rhGbx6luxjCym6zyXDCkjUm6r3IjDZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706559823; c=relaxed/simple;
	bh=BQhNCcVevdHyPYz2HAdbLwYqHA8p888DFWtFjDtrd4s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KQSfFsC9bTI5diQGBkpdoLGoYyH232rukMWBOCAbYOxAATDIfxYgqg4+thyk4Pci9fPXa2V3dLKFiyD/ZXEB5cgDS7zBlFfKmSZi9ggOyaWBsZkHKcDhkxsdqacGHE6Y+5sBw+2wNeyrpoDldm5hMmAtvIH7rO0dDs/66+lD6Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=hcCoAdJ9; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-55f1102b300so1402275a12.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jan 2024 12:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1706559819; x=1707164619; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=759t6dHKnm3zRPUWRD776/+JNdcD4djCnzhQxTJ2HXk=;
        b=hcCoAdJ94TyivSkoyZVQBsVF29m1PaOsXip4qg9ifcLZl2iwCrMwmht33qUZOQozti
         CBk+kxze7peI1nxXNIW31Sqv2zcynK5e+qadodX0ziP+ZDqzi7I1xf0d4Q6mB2IUuP6k
         pLsHAn15REX1l//uFvc42MHDiUT14lxm/1EqQLEA89Q61uQTHUgMu7C0RiseTWGOF5Ea
         FuvVqgdBfdBwQAky+rrNzG7NglNZbrGp09YaPJbXz0L/xkgIrPvA7nhLJl3UbS7+Dbw9
         25SiMqESUuKRSTRmDsXfkW8E88R33jg6/6l+s6umnkLTrddBVP6sHv+Tg3NfNZKa+E+g
         5IBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706559819; x=1707164619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=759t6dHKnm3zRPUWRD776/+JNdcD4djCnzhQxTJ2HXk=;
        b=PUicrUNJf6yPyr+RM6MqBWPFRK10zjNLAMO+/rC1W/O2YxvgZP1CTTKVSihy7aiXdB
         vgmDttpjGxuNFScFXBStWNmWSYj1nGJLmJ9V4OHpDvd5Yl56yB4YnUkihti/1b+Izrb3
         h74QeN0uKDbvcr6JK+zvNP9dLPrJUica4nRNmlFOseURV+EvNAvycIpS8m89Gn02N8MJ
         HPDJuGGLjC5TUUc+MsmW0a8/cxSl/Aqbf81Veh3vrENmckeSOyAPVGlPDTrJKGZ5tk2S
         8ulm5evs2gaPdPuGqovZ0A9lWAE/tbAoliz5N1JFy6EUsUuedpaP0kEpnP1e6xkcZSHJ
         5Y6g==
X-Gm-Message-State: AOJu0Ywmpx0TAd8nkS2Y37PKaor+EM/ID95NEnHIRD2Axs3cQXFKpYMM
	7zE+MuPi/srUY/3erS1ziwwvId6OkCkWsRpaaSN7OP2pwJ4wMGDLQbtIyskhsBI=
X-Google-Smtp-Source: AGHT+IFNKTNmcMIq+Bjzr513pjgOnzfHsHIp1+faYlQF/j2dAqDQgHSiG2CWMMO11G7J95Vp1jAhYA==
X-Received: by 2002:a17:906:1406:b0:a2f:b9bf:3955 with SMTP id p6-20020a170906140600b00a2fb9bf3955mr4960091ejc.21.1706559819235;
        Mon, 29 Jan 2024 12:23:39 -0800 (PST)
Received: from sleipner.berto.se (p4fcc8c6a.dip0.t-ipconnect.de. [79.204.140.106])
        by smtp.googlemail.com with ESMTPSA id mc4-20020a170906eb4400b00a338fedb9ebsm4316386ejb.54.2024.01.29.12.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 12:23:38 -0800 (PST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 6/6] media: rcar-vin Rename notifier helper functions
Date: Mon, 29 Jan 2024 21:22:54 +0100
Message-ID: <20240129202254.1126012-7-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240129202254.1126012-1-niklas.soderlund+renesas@ragnatech.se>
References: <20240129202254.1126012-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The helper functions to parse device tree and lookup information where
previously targeting a shared notifier in the shared group. This have
now been reworked to separate notifiers, one for each VIN.

Rename and move the functions verbatim to make it clear they now are
helpers for each VINs individual notifier instead of a shared one on the
group level.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../platform/renesas/rcar-vin/rcar-core.c     | 156 +++++++++---------
 1 file changed, 78 insertions(+), 78 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index 244ab1b3a8c0..4c5ca4dff77b 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
@@ -176,81 +176,6 @@ static void rvin_group_put(struct rvin_dev *vin)
 	kref_put(&group->refcount, rvin_group_release);
 }
 
-static int rvin_group_entity_to_remote_id(struct rvin_dev *vin,
-					  struct media_entity *entity)
-{
-	struct v4l2_subdev *sd;
-	unsigned int i;
-
-	sd = media_entity_to_v4l2_subdev(entity);
-
-	for (i = 0; i < RVIN_REMOTES_MAX; i++)
-		if (vin->remotes[i].subdev == sd)
-			return i;
-
-	return -ENODEV;
-}
-
-static int rvin_group_parse_of(struct rvin_dev *vin, unsigned int port,
-			       unsigned int id)
-{
-	struct fwnode_handle *ep, *fwnode;
-	struct v4l2_fwnode_endpoint vep = {
-		.bus_type = V4L2_MBUS_CSI2_DPHY,
-	};
-	struct v4l2_async_connection *asc;
-	int ret;
-
-	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(vin->dev), port, id, 0);
-	if (!ep)
-		return 0;
-
-	fwnode = fwnode_graph_get_remote_endpoint(ep);
-	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
-	fwnode_handle_put(ep);
-	if (ret) {
-		vin_err(vin, "Failed to parse %pOF\n", to_of_node(fwnode));
-		ret = -EINVAL;
-		goto out;
-	}
-
-	asc = v4l2_async_nf_add_fwnode(&vin->notifier, fwnode,
-				       struct v4l2_async_connection);
-	if (IS_ERR(asc)) {
-		ret = PTR_ERR(asc);
-		goto out;
-	}
-
-	vin->remotes[vep.base.id].asc = asc;
-
-	vin_dbg(vin, "Add device %pOF to slot %u\n",
-		to_of_node(fwnode), vep.base.id);
-out:
-	fwnode_handle_put(fwnode);
-
-	return ret;
-}
-
-static int rvin_group_notifier_init(struct rvin_dev *vin, unsigned int port,
-				    unsigned int max_id)
-{
-	unsigned int id;
-	int ret;
-
-	for (id = 0; id < max_id; id++) {
-		ret = rvin_group_parse_of(vin, port, id);
-		if (ret)
-			return ret;
-	}
-
-	/* Make sure at least one remote was described. */
-	for (id = 0; id < max_id; id++)
-		if (vin->remotes[id].asc)
-			return 0;
-
-	return -ENODEV;
-}
-
 /* -----------------------------------------------------------------------------
  * Controls
  */
@@ -316,6 +241,81 @@ static int rvin_create_controls(struct rvin_dev *vin, struct v4l2_subdev *subdev
  * Async notifier
  */
 
+static int rvin_remote_entity_to_id(struct rvin_dev *vin,
+				    struct media_entity *entity)
+{
+	struct v4l2_subdev *sd;
+	unsigned int i;
+
+	sd = media_entity_to_v4l2_subdev(entity);
+
+	for (i = 0; i < RVIN_REMOTES_MAX; i++)
+		if (vin->remotes[i].subdev == sd)
+			return i;
+
+	return -ENODEV;
+}
+
+static int rvin_remote_parse_of(struct rvin_dev *vin, unsigned int port,
+				unsigned int id)
+{
+	struct fwnode_handle *ep, *fwnode;
+	struct v4l2_fwnode_endpoint vep = {
+		.bus_type = V4L2_MBUS_CSI2_DPHY,
+	};
+	struct v4l2_async_connection *asc;
+	int ret;
+
+	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(vin->dev), port, id, 0);
+	if (!ep)
+		return 0;
+
+	fwnode = fwnode_graph_get_remote_endpoint(ep);
+	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
+	fwnode_handle_put(ep);
+	if (ret) {
+		vin_err(vin, "Failed to parse %pOF\n", to_of_node(fwnode));
+		ret = -EINVAL;
+		goto out;
+	}
+
+	asc = v4l2_async_nf_add_fwnode(&vin->notifier, fwnode,
+				       struct v4l2_async_connection);
+	if (IS_ERR(asc)) {
+		ret = PTR_ERR(asc);
+		goto out;
+	}
+
+	vin->remotes[vep.base.id].asc = asc;
+
+	vin_dbg(vin, "Add device %pOF to slot %u\n",
+		to_of_node(fwnode), vep.base.id);
+out:
+	fwnode_handle_put(fwnode);
+
+	return ret;
+}
+
+static int rvin_remote_notifier_init(struct rvin_dev *vin, unsigned int port,
+				     unsigned int max_id)
+{
+	unsigned int id;
+	int ret;
+
+	for (id = 0; id < max_id; id++) {
+		ret = rvin_remote_parse_of(vin, port, id);
+		if (ret)
+			return ret;
+	}
+
+	/* Make sure at least one remote was described. */
+	for (id = 0; id < max_id; id++)
+		if (vin->remotes[id].asc)
+			return 0;
+
+	return -ENODEV;
+}
+
 static int rvin_find_pad(struct v4l2_subdev *sd, int direction)
 {
 	unsigned int pad;
@@ -638,7 +638,7 @@ static int rvin_csi2_link_notify(struct media_link *link, u32 flags,
 
 	mutex_lock(&group->lock);
 
-	csi_id = rvin_group_entity_to_remote_id(vin, link->source->entity);
+	csi_id = rvin_remote_entity_to_id(vin, link->source->entity);
 	if (csi_id == -ENODEV) {
 		struct v4l2_subdev *sd;
 
@@ -804,7 +804,7 @@ static int rvin_csi2_init(struct rvin_dev *vin)
 	have_parallel = ret != -ENODEV;
 
 
-	ret = rvin_group_notifier_init(vin, 1, RVIN_CSI_MAX);
+	ret = rvin_remote_notifier_init(vin, 1, RVIN_CSI_MAX);
 	if (ret && ret != -ENODEV)
 		goto err_group;
 	have_remote = ret != -ENODEV;
@@ -859,7 +859,7 @@ static int rvin_isp_init(struct rvin_dev *vin)
 	if (ret)
 		goto err_controls;
 
-	ret = rvin_group_notifier_init(vin, 2, RVIN_ISP_MAX);
+	ret = rvin_remote_notifier_init(vin, 2, RVIN_ISP_MAX);
 	if (ret)
 		goto err_group;
 
-- 
2.43.0


