Return-Path: <linux-renesas-soc+bounces-14472-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A3900A64D8C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Mar 2025 12:59:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BDAC13B529A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Mar 2025 11:58:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C49923C8D9;
	Mon, 17 Mar 2025 11:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="q7x1oIil"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A3B23BD1C;
	Mon, 17 Mar 2025 11:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742212666; cv=none; b=fiaaMb7DD6sN9jrCPr/JiXnFQsLK57CkQycx4E9kiz8Hvz2t9PIUP4ynglSRifzTB1CfOs65QKkS7c9uMrIrpNhXxB59mUuD/qajLndj+p2DjrOV04OvOmyBEuK8i6agRiLL0X7zCITFMpqkui1rAwwRyXFFolLL86Im1mQK0l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742212666; c=relaxed/simple;
	bh=Ntfb/leZ76e56lVNlSaDyhMpZbW5jt2+J80bJ1w8X8I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bKuAwruZIz043SlmxXnW79Uz7daRszZR1Yyi14uB1OwqnxO/qYATxUR9oIeMj88QWK6gOyNzNk14grP2EUiPh+LcWKdiA4T3JHI0DgWoKlECeQgqmZdAUccJoWGLIH6iwCMHOxS74rzk9mhlut+KNf2R6yZL/jH53DkJEib4GeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=q7x1oIil; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.102] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 69C0C14B1;
	Mon, 17 Mar 2025 12:55:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742212548;
	bh=Ntfb/leZ76e56lVNlSaDyhMpZbW5jt2+J80bJ1w8X8I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=q7x1oIilWsysoPE+nvyVd0d7YX6msu6I0dzweyNo8s1oId/USh64Kcsht3f7+np1M
	 T8tURcfcX9Ezs4waNVSV0tCeS5QWwyA8GAL4oQacgw9UJo/Uuaph5nEq9PecY3raW1
	 s7NZiNPrXk7hs35lN0/jhLdcK10cgvI72j8E2vC8=
From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Date: Mon, 17 Mar 2025 12:56:43 +0100
Subject: [PATCH v3 5/7] media: vsp1: rwpf: Initialize image formats
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250317-v4h-iif-v3-5-63aab8982b50@ideasonboard.com>
References: <20250317-v4h-iif-v3-0-63aab8982b50@ideasonboard.com>
In-Reply-To: <20250317-v4h-iif-v3-0-63aab8982b50@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=7618;
 i=jacopo.mondi+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=Ntfb/leZ76e56lVNlSaDyhMpZbW5jt2+J80bJ1w8X8I=;
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBn2A4llD3bvxxrcJLw22UBaaQbOPx1GkVpZ4LWF
 eFsOq3b/QqJAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCZ9gOJQAKCRByNAaPFqFW
 PFrKD/90GPvB2o0A2K46SkcWMyigq7zu9oTqV1QDLZ8M7XzuUz+/WAu1oa0LyMPvVwLiX//S/Ga
 FWhHLAEcQrOzmDZl2lYYOgozeyxlvcjI/kNhjWu1Sng4+IEnSDt1Xsp5UXHUqH41mjiWw13ga+5
 pcvYexfWOt0Ig4Yg9D+1hYSE1LobmE76s0CfR4hCeWRr0+iGS5G/NhE9f2wWa9MFg/N0xA7LuCh
 kvdzP4Ub/yv8c1MWDFTxIftSAgRvgE2A8Q/zFcnH8IRY/dK/5zEFvYXPSpHxzDKwYRrf/0Kmve1
 3uRLv7lIK+aZt6HAWA9H/K2oLXHSUQJUFwPofvCXVqzTBRauACKayaloCT8h3gawAClx5hN0jDV
 eRPzkmZtdo8IPZb+6anzFKL7UtYP2Vc+i0kxgsFKopZqRsvKbfdk/cQ+R1gQJ00T7/0cIY8CRd7
 BEJNZ9pmjSN79zEiotnJzhO7TV+GDB68Wf6voJL4UGBfxg5XT+dCpLCC82ZaFb0cvc5GqWVK3Ky
 BYBkuo6mLixEV4++dpjTNwlp+T6wjlB2wl4R4kPXxHc76MBZp189X6f2ekLyHRC/fVPVhJKkNRD
 s//2k77kL0ZfdXYbCFRGElJ6Ae3f5NyETf0xJnF2Djr7cUpgMDfizH8HjgWQyVK6Jbfr28+dgc6
 VNESaZfW6oS4eeA==
X-Developer-Key: i=jacopo.mondi+renesas@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

With the forthcoming support for VSPX the r/wpf unit will be used
to perform memory access on the behalf of the ISP units.

Prepare to support reading from external memory images in RAW Bayer
format and ISP configuration parameters by expanding the list
of supported media bus codes.

Store the list of valid mbus code in the rwpf device and initialize it
in the new vsp1_rwpf_init_formats() function, called by RPFs and WFPs at
entity creation time.

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>

---
v2->v3:
  - Introduce vsp1_rwpf_init_formats()
  - Store the list of mbus codes at init time instead of computing it
---
 drivers/media/platform/renesas/vsp1/vsp1_rpf.c  |  7 +++
 drivers/media/platform/renesas/vsp1/vsp1_rwpf.c | 79 +++++++++++++++++++++++--
 drivers/media/platform/renesas/vsp1/vsp1_rwpf.h |  4 ++
 drivers/media/platform/renesas/vsp1/vsp1_wpf.c  |  7 +++
 4 files changed, 91 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
index 5c8b3ba1bd3c2c7b9289f05c9c2578e9717c23ff..056491286577cc8e9e7a6bd096f1107da6009ea7 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
@@ -400,6 +400,13 @@ struct vsp1_rwpf *vsp1_rpf_create(struct vsp1_device *vsp1, unsigned int index)
 	rpf->entity.type = VSP1_ENTITY_RPF;
 	rpf->entity.index = index;
 
+	ret = vsp1_rwpf_init_formats(vsp1, rpf);
+	if (ret < 0) {
+		dev_err(vsp1->dev, "rpf%u: failed to initialize formats\n",
+			index);
+		return ERR_PTR(ret);
+	}
+
 	sprintf(name, "rpf.%u", index);
 	ret = vsp1_entity_init(vsp1, &rpf->entity, name, 2, &vsp1_rwpf_subdev_ops,
 			       MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER);
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
index 93b0ed5fd0da0c6a182dbbfe1e54eb8cfd66c493..f1d27300ecf3f0f82550fb6aae1d37de33805ca1 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
@@ -16,12 +16,47 @@
 #define RWPF_MIN_WIDTH				1
 #define RWPF_MIN_HEIGHT				1
 
+struct vsp1_rwpf_codes {
+	const u32 *codes;
+	unsigned int num_codes;
+};
+
 static const u32 rwpf_mbus_codes[] = {
 	MEDIA_BUS_FMT_ARGB8888_1X32,
 	MEDIA_BUS_FMT_AHSV8888_1X32,
 	MEDIA_BUS_FMT_AYUV8_1X32,
 };
 
+static const struct vsp1_rwpf_codes rwpf_codes = {
+	.codes = rwpf_mbus_codes,
+	.num_codes = ARRAY_SIZE(rwpf_mbus_codes),
+};
+
+static const u32 vspx_rpf0_mbus_codes[] = {
+	MEDIA_BUS_FMT_Y8_1X8,
+	MEDIA_BUS_FMT_Y10_1X10,
+	MEDIA_BUS_FMT_Y12_1X12,
+	MEDIA_BUS_FMT_Y16_1X16,
+	MEDIA_BUS_FMT_METADATA_FIXED
+};
+
+static const struct vsp1_rwpf_codes vspx_rpf0_codes = {
+	.codes = vspx_rpf0_mbus_codes,
+	.num_codes = ARRAY_SIZE(vspx_rpf0_mbus_codes),
+};
+
+static const u32 vspx_rpf1_mbus_codes[] = {
+	MEDIA_BUS_FMT_Y8_1X8,
+	MEDIA_BUS_FMT_Y10_1X10,
+	MEDIA_BUS_FMT_Y12_1X12,
+	MEDIA_BUS_FMT_Y16_1X16,
+};
+
+static const struct vsp1_rwpf_codes vspx_rpf1_codes = {
+	.codes = vspx_rpf1_mbus_codes,
+	.num_codes = ARRAY_SIZE(vspx_rpf1_mbus_codes),
+};
+
 /* -----------------------------------------------------------------------------
  * V4L2 Subdevice Operations
  */
@@ -30,10 +65,12 @@ static int vsp1_rwpf_enum_mbus_code(struct v4l2_subdev *subdev,
 				    struct v4l2_subdev_state *sd_state,
 				    struct v4l2_subdev_mbus_code_enum *code)
 {
-	if (code->index >= ARRAY_SIZE(rwpf_mbus_codes))
+	struct vsp1_rwpf *rwpf = to_rwpf(subdev);
+
+	if (code->index >= rwpf->mbus_codes->num_codes)
 		return -EINVAL;
 
-	code->code = rwpf_mbus_codes[code->index];
+	code->code = rwpf->mbus_codes->codes[code->index];
 
 	return 0;
 }
@@ -69,12 +106,12 @@ static int vsp1_rwpf_set_format(struct v4l2_subdev *subdev,
 	}
 
 	/* Default to YUV if the requested format is not supported. */
-	for (i = 0; i < ARRAY_SIZE(rwpf_mbus_codes); ++i) {
-		if (fmt->format.code == rwpf_mbus_codes[i])
+	for (i = 0; i < rwpf->mbus_codes->num_codes; ++i) {
+		if (fmt->format.code == rwpf->mbus_codes->codes[i])
 			break;
 	}
-	if (i == ARRAY_SIZE(rwpf_mbus_codes))
-		fmt->format.code = MEDIA_BUS_FMT_AYUV8_1X32;
+	if (i == rwpf->mbus_codes->num_codes)
+		fmt->format.code = rwpf->mbus_codes->codes[0];
 
 	format = v4l2_subdev_state_get_format(state, fmt->pad);
 
@@ -267,8 +304,38 @@ static const struct v4l2_ctrl_ops vsp1_rwpf_ctrl_ops = {
 	.s_ctrl = vsp1_rwpf_s_ctrl,
 };
 
+
+int vsp1_rwpf_init_formats(struct vsp1_device *vsp1, struct vsp1_rwpf *rwpf)
+{
+	/* Only VSPX and RPF support reading Bayer data. */
+	if (!vsp1_feature(vsp1, VSP1_HAS_IIF) ||
+	    rwpf->entity.type != VSP1_ENTITY_RPF) {
+		rwpf->mbus_codes = &rwpf_codes;
+		return 0;
+	}
+
+	/*
+	 * VSPX only features RPF0 and RPF1. RPF0 supports reading ISP ConfigDMA
+	 * and Bayer data, RPF1 supports reading Bayer data only.
+	 */
+	switch (rwpf->entity.index) {
+	case 0:
+		rwpf->mbus_codes = &vspx_rpf0_codes;
+		break;
+	case 1:
+		rwpf->mbus_codes = &vspx_rpf1_codes;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 int vsp1_rwpf_init_ctrls(struct vsp1_rwpf *rwpf, unsigned int ncontrols)
 {
+	/* Initialize controls. */
+
 	v4l2_ctrl_handler_init(&rwpf->ctrls, ncontrols + 1);
 	v4l2_ctrl_new_std(&rwpf->ctrls, &vsp1_rwpf_ctrl_ops,
 			  V4L2_CID_ALPHA_COMPONENT, 0, 255, 1, 255);
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.h b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.h
index 5ac9f0a6fafcee955f32d768aafe8a87516908ae..64feb4742494f6d6a34abe4a21c89b64cfc0a6ca 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.h
+++ b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.h
@@ -30,6 +30,7 @@ struct vsp1_rwpf_memory {
 	dma_addr_t addr[3];
 };
 
+struct vsp1_rwpf_codes;
 struct vsp1_rwpf {
 	struct vsp1_entity entity;
 	struct v4l2_ctrl_handler ctrls;
@@ -39,6 +40,8 @@ struct vsp1_rwpf {
 	unsigned int max_width;
 	unsigned int max_height;
 
+	const struct vsp1_rwpf_codes *mbus_codes;
+
 	struct v4l2_pix_format_mplane format;
 	const struct vsp1_format_info *fmtinfo;
 	unsigned int brx_input;
@@ -81,6 +84,7 @@ struct vsp1_rwpf *vsp1_wpf_create(struct vsp1_device *vsp1, unsigned int index);
 
 void vsp1_wpf_stop(struct vsp1_rwpf *wpf);
 
+int vsp1_rwpf_init_formats(struct vsp1_device *vsp1, struct vsp1_rwpf *rwpf);
 int vsp1_rwpf_init_ctrls(struct vsp1_rwpf *rwpf, unsigned int ncontrols);
 
 extern const struct v4l2_subdev_ops vsp1_rwpf_subdev_ops;
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_wpf.c b/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
index da651a882bbb7e4d58f2dfea9dcea60a41f4f79c..a32e4b3527db41e7fac859ad8e13670141c1ef04 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
@@ -548,6 +548,13 @@ struct vsp1_rwpf *vsp1_wpf_create(struct vsp1_device *vsp1, unsigned int index)
 	wpf->entity.type = VSP1_ENTITY_WPF;
 	wpf->entity.index = index;
 
+	ret = vsp1_rwpf_init_formats(vsp1, wpf);
+	if (ret < 0) {
+		dev_err(vsp1->dev, "wpf%u: failed to initialize formats\n",
+			index);
+		return ERR_PTR(ret);
+	}
+
 	sprintf(name, "wpf.%u", index);
 	ret = vsp1_entity_init(vsp1, &wpf->entity, name, 2, &vsp1_rwpf_subdev_ops,
 			       MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER);

-- 
2.48.1


