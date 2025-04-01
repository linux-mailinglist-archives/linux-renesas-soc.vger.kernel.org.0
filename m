Return-Path: <linux-renesas-soc+bounces-15247-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C4DA77D8F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Apr 2025 16:22:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06A663AEDE7
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Apr 2025 14:22:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C397F204C1A;
	Tue,  1 Apr 2025 14:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QZOQEs1m"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FCC32046B4;
	Tue,  1 Apr 2025 14:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743517343; cv=none; b=Hn4g60AB/gFuz866UzIBO6w6bYC8bbMEpHXcsDwL3CqanNqLkmpb4/FDRbRmUe9LcjcH+FjtXLTRBhtFJhquHzvmKmEbY7OBYoPJ15cQpPAbwJlyvPkhZhQi+HBt+5L2wL6caJeY+oHk15e878TRWX8Q/YPk9UUHlsZmUYFoSSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743517343; c=relaxed/simple;
	bh=mJknMhHwY51fCLlC4PKnAISgV5O4N7lJcBbILqKyOow=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Os7h6axlzS4iUPoTu2eecNFxxcoIDRtggN6u7gmjvgo+tLt7Tc/bwWE9XxO7vhWzp3adH9KEZ0A01ElUQzZUSgQflYPs8SXgy9+L/AbLiK2rz5BzD81DJAoOdLz0cVYvs6jFkzVLUXo0aXJv90uyJtSRwK+iIptorpOwNKmemb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QZOQEs1m; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.101] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BD4CC8DB;
	Tue,  1 Apr 2025 16:20:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743517219;
	bh=mJknMhHwY51fCLlC4PKnAISgV5O4N7lJcBbILqKyOow=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QZOQEs1mATNS55cMj2cKBsdN5RA7PFIgV6NGEmuWtlqUyc0rhyJWdjhOuO/YM2ocx
	 8FT36iCLTqxu+CA+evF5jbIC+OddVE0VzDhWilVNTpppGSZCpqElFmhDd9A5UCTD54
	 JXQYSnvCnwzRSZcPJtpD1ZgPQMnDwVhIYDDtq0bM=
From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Date: Tue, 01 Apr 2025 16:22:01 +0200
Subject: [PATCH v7 1/5] media: vsp1: Add support IIF ISP Interface
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250401-v4h-iif-v7-1-cc547c0bddd5@ideasonboard.com>
References: <20250401-v4h-iif-v7-0-cc547c0bddd5@ideasonboard.com>
In-Reply-To: <20250401-v4h-iif-v7-0-cc547c0bddd5@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=12221;
 i=jacopo.mondi+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=mJknMhHwY51fCLlC4PKnAISgV5O4N7lJcBbILqKyOow=;
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBn6/aRn3kLxmAdZ+ksEBnumXTJpF3T+CXGDK+qT
 72Kq23lIlGJAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCZ+v2kQAKCRByNAaPFqFW
 PDTcD/9kAhOvWupYyUF2dQO20vYp/clZtUBRDSBnp5TTYcloxx6twBr4YfNOq1kURHxE3WxM7JX
 6QJpv7/CeH8fhaZDscantrGAaMj314ehe/m5KQ/B1yn1bu5LY5SDMMRyE23bV0cLz4DgKM1ewN8
 +e5Na3ixkPIq9podE9J7DFZLPWABoycG5p0Wq9niMHs31LQTjoDyqdAiwX+o1NhO0wIA+tngnm6
 z6gXAL+r0z1T144WPqpNVgVCJPlpQyHU/xxyCyUT8dMHqhbQ+8lxxSuoe5aaWQGjvCFbG2BHa35
 JEfIYeKBilYPo0UC1/U829bge0hJpjiNIlYqlGAL5BVBuXZMSz9grx1EVXfsuUdTKEprS1t3q11
 yUwYvWu7LRfkVUd6AzzwXJ50X1dB2ZUHflOCqeIDrWl7ZI2Il5znrP9rjsPCae+1uC7W/ASR+I6
 XzUPK3J7npWu7DgCqkBNNatLOe9Uhz4hzZyJdZODIauyh3bPzNpZiu0b2/fPuy6T7TCwNj7zX7c
 8xJrUw5mZPv6GDeAKAlQjOYYEzyHerYyhVltWC59Z8W7x4dQo569SBqoztuwozXUL2jN4J7G8tQ
 Io6c9W5PgIvZektOgRECWZWkxUvSrgpuCcDujEx5LxCbxeV4tpEW4zzUlnknEyCYFDhyPbjHHbh
 m9xMcbphCPLuIXA==
X-Developer-Key: i=jacopo.mondi+renesas@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

The IIF (ISP InterFace) is a VSP2 function that transfers data
to the ISP by reading from external memory through two RPF
instances.

Add support for it in the vsp1 driver by introducing a new entity
type. The sole required operation is to enable the IIF function
during configure_stream().

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>

---
v2->v3:
- Replace SRGGB codes with luma-only
- Fix CI loop warning report
- Drop a hunk that was not meant to be there
---
 drivers/media/platform/renesas/vsp1/Makefile      |   2 +-
 drivers/media/platform/renesas/vsp1/vsp1.h        |   3 +
 drivers/media/platform/renesas/vsp1/vsp1_drv.c    |  11 ++
 drivers/media/platform/renesas/vsp1/vsp1_entity.c |   8 ++
 drivers/media/platform/renesas/vsp1/vsp1_entity.h |   1 +
 drivers/media/platform/renesas/vsp1/vsp1_iif.c    | 121 ++++++++++++++++++++++
 drivers/media/platform/renesas/vsp1/vsp1_iif.h    |  26 +++++
 drivers/media/platform/renesas/vsp1/vsp1_pipe.c   |   1 +
 drivers/media/platform/renesas/vsp1/vsp1_pipe.h   |   1 +
 drivers/media/platform/renesas/vsp1/vsp1_regs.h   |   8 ++
 10 files changed, 181 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/vsp1/Makefile b/drivers/media/platform/renesas/vsp1/Makefile
index 4bb4dcbef7b5..de8c802e1d1a 100644
--- a/drivers/media/platform/renesas/vsp1/Makefile
+++ b/drivers/media/platform/renesas/vsp1/Makefile
@@ -5,6 +5,6 @@ vsp1-y					+= vsp1_rpf.o vsp1_rwpf.o vsp1_wpf.o
 vsp1-y					+= vsp1_clu.o vsp1_hsit.o vsp1_lut.o
 vsp1-y					+= vsp1_brx.o vsp1_sru.o vsp1_uds.o
 vsp1-y					+= vsp1_hgo.o vsp1_hgt.o vsp1_histo.o
-vsp1-y					+= vsp1_lif.o vsp1_uif.o
+vsp1-y					+= vsp1_iif.o vsp1_lif.o vsp1_uif.o
 
 obj-$(CONFIG_VIDEO_RENESAS_VSP1)	+= vsp1.o
diff --git a/drivers/media/platform/renesas/vsp1/vsp1.h b/drivers/media/platform/renesas/vsp1/vsp1.h
index 2f6f0c6ae555..263024639dd2 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1.h
+++ b/drivers/media/platform/renesas/vsp1/vsp1.h
@@ -32,6 +32,7 @@ struct vsp1_clu;
 struct vsp1_hgo;
 struct vsp1_hgt;
 struct vsp1_hsit;
+struct vsp1_iif;
 struct vsp1_lif;
 struct vsp1_lut;
 struct vsp1_rwpf;
@@ -56,6 +57,7 @@ struct vsp1_uif;
 #define VSP1_HAS_BRS		BIT(9)
 #define VSP1_HAS_EXT_DL		BIT(10)
 #define VSP1_HAS_NON_ZERO_LBA	BIT(11)
+#define VSP1_HAS_IIF		BIT(12)
 
 struct vsp1_device_info {
 	u32 version;
@@ -91,6 +93,7 @@ struct vsp1_device {
 	struct vsp1_hgt *hgt;
 	struct vsp1_hsit *hsi;
 	struct vsp1_hsit *hst;
+	struct vsp1_iif *iif;
 	struct vsp1_lif *lif[VSP1_MAX_LIF];
 	struct vsp1_lut *lut;
 	struct vsp1_rwpf *rpf[VSP1_MAX_RPF];
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
index 9fc6bf624a52..d13e9b31aa7c 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
@@ -29,6 +29,7 @@
 #include "vsp1_hgo.h"
 #include "vsp1_hgt.h"
 #include "vsp1_hsit.h"
+#include "vsp1_iif.h"
 #include "vsp1_lif.h"
 #include "vsp1_lut.h"
 #include "vsp1_pipe.h"
@@ -340,6 +341,16 @@ static int vsp1_create_entities(struct vsp1_device *vsp1)
 			      &vsp1->entities);
 	}
 
+	if (vsp1_feature(vsp1, VSP1_HAS_IIF)) {
+		vsp1->iif = vsp1_iif_create(vsp1);
+		if (IS_ERR(vsp1->iif)) {
+			ret = PTR_ERR(vsp1->iif);
+			goto done;
+		}
+
+		list_add_tail(&vsp1->iif->entity.list_dev, &vsp1->entities);
+	}
+
 	/*
 	 * The LIFs are only supported when used in conjunction with the DU, in
 	 * which case the userspace API is disabled. If the userspace API is
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_entity.c b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
index 8b8945bd8f10..2096a09a1278 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_entity.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
@@ -63,9 +63,14 @@ void vsp1_entity_route_setup(struct vsp1_entity *entity,
 	/*
 	 * The ILV and BRS share the same data path route. The extra BRSSEL bit
 	 * selects between the ILV and BRS.
+	 *
+	 * The BRU and IIF share the same data path route. The extra IIFSEL bit
+	 * selects between the IIF and BRU.
 	 */
 	if (source->type == VSP1_ENTITY_BRS)
 		route |= VI6_DPR_ROUTE_BRSSEL;
+	else if (source->type == VSP1_ENTITY_IIF)
+		route |= VI6_DPR_ROUTE_IIFSEL;
 	vsp1_dl_body_write(dlb, source->route->reg, route);
 }
 
@@ -528,6 +533,9 @@ struct media_pad *vsp1_entity_remote_pad(struct media_pad *pad)
 	  { VI6_DPR_NODE_WPF(idx) }, VI6_DPR_NODE_WPF(idx) }
 
 static const struct vsp1_route vsp1_routes[] = {
+	{ VSP1_ENTITY_IIF, 0, VI6_DPR_BRU_ROUTE,
+	  { VI6_DPR_NODE_BRU_IN(0), VI6_DPR_NODE_BRU_IN(1),
+	    VI6_DPR_NODE_BRU_IN(3) }, VI6_DPR_NODE_WPF(0) },
 	{ VSP1_ENTITY_BRS, 0, VI6_DPR_ILV_BRS_ROUTE,
 	  { VI6_DPR_NODE_BRS_IN(0), VI6_DPR_NODE_BRS_IN(1) }, 0 },
 	{ VSP1_ENTITY_BRU, 0, VI6_DPR_BRU_ROUTE,
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_entity.h b/drivers/media/platform/renesas/vsp1/vsp1_entity.h
index 1bcc9e27dfdc..bdcb780a79da 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_entity.h
+++ b/drivers/media/platform/renesas/vsp1/vsp1_entity.h
@@ -28,6 +28,7 @@ enum vsp1_entity_type {
 	VSP1_ENTITY_HGT,
 	VSP1_ENTITY_HSI,
 	VSP1_ENTITY_HST,
+	VSP1_ENTITY_IIF,
 	VSP1_ENTITY_LIF,
 	VSP1_ENTITY_LUT,
 	VSP1_ENTITY_RPF,
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_iif.c b/drivers/media/platform/renesas/vsp1/vsp1_iif.c
new file mode 100644
index 000000000000..5dd62bebbe8c
--- /dev/null
+++ b/drivers/media/platform/renesas/vsp1/vsp1_iif.c
@@ -0,0 +1,121 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * vsp1_iif.c  --  R-Car VSP1 IIF (ISP Interface)
+ *
+ * Copyright (C) 2025 Ideas On Board Oy
+ * Copyright (C) 2025 Renesas Corporation
+ */
+
+#include "vsp1.h"
+#include "vsp1_dl.h"
+#include "vsp1_iif.h"
+
+#define IIF_MIN_WIDTH				128U
+#define IIF_MIN_HEIGHT				32U
+#define IIF_MAX_WIDTH				5120U
+#define IIF_MAX_HEIGHT				4096U
+
+/* -----------------------------------------------------------------------------
+ * Device Access
+ */
+
+static inline void vsp1_iif_write(struct vsp1_dl_body *dlb, u32 reg, u32 data)
+{
+	vsp1_dl_body_write(dlb, reg, data);
+}
+
+/* -----------------------------------------------------------------------------
+ * V4L2 Subdevice Operations
+ */
+
+static const unsigned int iif_codes[] = {
+	MEDIA_BUS_FMT_Y8_1X8,
+	MEDIA_BUS_FMT_Y10_1X10,
+	MEDIA_BUS_FMT_Y12_1X12,
+	MEDIA_BUS_FMT_Y16_1X16,
+	MEDIA_BUS_FMT_METADATA_FIXED
+};
+
+static int iif_enum_mbus_code(struct v4l2_subdev *subdev,
+			      struct v4l2_subdev_state *sd_state,
+			      struct v4l2_subdev_mbus_code_enum *code)
+{
+	return vsp1_subdev_enum_mbus_code(subdev, sd_state, code, iif_codes,
+					  ARRAY_SIZE(iif_codes));
+}
+
+static int iif_enum_frame_size(struct v4l2_subdev *subdev,
+			       struct v4l2_subdev_state *sd_state,
+			       struct v4l2_subdev_frame_size_enum *fse)
+{
+	return vsp1_subdev_enum_frame_size(subdev, sd_state, fse,
+					   IIF_MIN_WIDTH, IIF_MIN_HEIGHT,
+					   IIF_MAX_WIDTH, IIF_MAX_HEIGHT);
+}
+
+static int iif_set_format(struct v4l2_subdev *subdev,
+			  struct v4l2_subdev_state *sd_state,
+			  struct v4l2_subdev_format *fmt)
+{
+	return vsp1_subdev_set_pad_format(subdev, sd_state, fmt, iif_codes,
+					  ARRAY_SIZE(iif_codes),
+					  IIF_MIN_WIDTH, IIF_MIN_HEIGHT,
+					  IIF_MAX_WIDTH, IIF_MAX_HEIGHT);
+}
+
+static const struct v4l2_subdev_pad_ops iif_pad_ops = {
+	.enum_mbus_code = iif_enum_mbus_code,
+	.enum_frame_size = iif_enum_frame_size,
+	.get_fmt = vsp1_subdev_get_pad_format,
+	.set_fmt = iif_set_format,
+};
+
+static const struct v4l2_subdev_ops iif_ops = {
+	.pad    = &iif_pad_ops,
+};
+
+/* -----------------------------------------------------------------------------
+ * VSP1 Entity Operations
+ */
+
+static void iif_configure_stream(struct vsp1_entity *entity,
+				 struct v4l2_subdev_state *state,
+				 struct vsp1_pipeline *pipe,
+				 struct vsp1_dl_list *dl,
+				 struct vsp1_dl_body *dlb)
+{
+	vsp1_iif_write(dlb, VI6_IIF_CTRL, VI6_IIF_CTRL_CTRL);
+}
+
+static const struct vsp1_entity_operations iif_entity_ops = {
+	.configure_stream = iif_configure_stream,
+};
+
+/* -----------------------------------------------------------------------------
+ * Initialization and Cleanup
+ */
+
+struct vsp1_iif *vsp1_iif_create(struct vsp1_device *vsp1)
+{
+	struct vsp1_iif *iif;
+	int ret;
+
+	iif = devm_kzalloc(vsp1->dev, sizeof(*iif), GFP_KERNEL);
+	if (!iif)
+		return ERR_PTR(-ENOMEM);
+
+	iif->entity.ops = &iif_entity_ops;
+	iif->entity.type = VSP1_ENTITY_IIF;
+
+	/*
+	 * The IIF is never exposed to userspace, but media entity registration
+	 * requires a function to be set. Use PROC_VIDEO_PIXEL_FORMATTER just to
+	 * avoid triggering a WARN_ON(), the value won't be seen anywhere.
+	 */
+	ret = vsp1_entity_init(vsp1, &iif->entity, "iif", 3, &iif_ops,
+			       MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER);
+	if (ret < 0)
+		return ERR_PTR(ret);
+
+	return iif;
+}
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_iif.h b/drivers/media/platform/renesas/vsp1/vsp1_iif.h
new file mode 100644
index 000000000000..165996a822c1
--- /dev/null
+++ b/drivers/media/platform/renesas/vsp1/vsp1_iif.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * vsp1_iif.h  --  R-Car VSP1 IIF (ISP Interface)
+ *
+ * Copyright (C) 2025 Ideas On Board Oy
+ * Copyright (C) 2025 Renesas Corporation
+ */
+#ifndef __VSP1_IIF_H__
+#define __VSP1_IIF_H__
+
+#include <media/v4l2-subdev.h>
+
+#include "vsp1_entity.h"
+
+struct vsp1_iif {
+	struct vsp1_entity entity;
+};
+
+static inline struct vsp1_iif *to_iif(struct v4l2_subdev *subdev)
+{
+	return container_of(subdev, struct vsp1_iif, entity.subdev);
+}
+
+struct vsp1_iif *vsp1_iif_create(struct vsp1_device *vsp1);
+
+#endif /* __VSP1_IIF_H__ */
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
index bb0739f684f3..8e9be3ec1b4d 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
@@ -286,6 +286,7 @@ void vsp1_pipeline_reset(struct vsp1_pipeline *pipe)
 	pipe->brx = NULL;
 	pipe->hgo = NULL;
 	pipe->hgt = NULL;
+	pipe->iif = NULL;
 	pipe->lif = NULL;
 	pipe->uds = NULL;
 }
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.h b/drivers/media/platform/renesas/vsp1/vsp1_pipe.h
index 1ba7bdbad5a8..1655a820da10 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.h
+++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.h
@@ -119,6 +119,7 @@ struct vsp1_pipeline {
 	struct vsp1_entity *brx;
 	struct vsp1_entity *hgo;
 	struct vsp1_entity *hgt;
+	struct vsp1_entity *iif;
 	struct vsp1_entity *lif;
 	struct vsp1_entity *uds;
 	struct vsp1_entity *uds_input;
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_regs.h b/drivers/media/platform/renesas/vsp1/vsp1_regs.h
index 7eca82e0ba7e..86e47c2d991f 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_regs.h
+++ b/drivers/media/platform/renesas/vsp1/vsp1_regs.h
@@ -252,6 +252,13 @@
 #define VI6_RPF_BRDITH_CTRL_ODE		BIT(8)
 #define VI6_RPF_BRDITH_CTRL_CBRM	BIT(0)
 
+/* -----------------------------------------------------------------------------
+ * IIF Control Registers
+ */
+
+#define VI6_IIF_CTRL			0x0608
+#define VI6_IIF_CTRL_CTRL		0x13
+
 /* -----------------------------------------------------------------------------
  * WPF Control Registers
  */
@@ -388,6 +395,7 @@
 #define VI6_DPR_HST_ROUTE		0x2044
 #define VI6_DPR_HSI_ROUTE		0x2048
 #define VI6_DPR_BRU_ROUTE		0x204c
+#define VI6_DPR_ROUTE_IIFSEL		BIT(28)
 #define VI6_DPR_ILV_BRS_ROUTE		0x2050
 #define VI6_DPR_ROUTE_BRSSEL		BIT(28)
 #define VI6_DPR_ROUTE_FXA_MASK		(0xff << 16)

-- 
2.48.1


