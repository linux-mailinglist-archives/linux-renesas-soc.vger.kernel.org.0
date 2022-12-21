Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE338652E6E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Dec 2022 10:25:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234569AbiLUJZR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 21 Dec 2022 04:25:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234572AbiLUJZQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Dec 2022 04:25:16 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 216B41C12E;
        Wed, 21 Dec 2022 01:25:15 -0800 (PST)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 297DFBC0;
        Wed, 21 Dec 2022 10:25:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671614710;
        bh=mAIchRsfWm60/8wNk1lc/GlHZ/+MSKW5YCayASadUJc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WXSwMZokpH93jqEWeskMpn/RcHvJw2q68lWf+qV/ZZ338JpIuVJIKfoJmUNpTjkMa
         XSea5+jDag5Tn8RcuJmsunXnR/SqTv4VOI1V8L0sYI9TKDxtbcZDQyYecgy7Ess5AU
         Of7wwjPe8kraYyqDtanoFMK2dvZr/VAHn5M9eJew=
From:   Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: [PATCH v3 5/7] media: renesas: vsp1: Add new formats (2-10-10-10 ARGB, Y210, Y212)
Date:   Wed, 21 Dec 2022 11:24:46 +0200
Message-Id: <20221221092448.741294-6-tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221221092448.741294-1-tomi.valkeinen+renesas@ideasonboard.com>
References: <20221221092448.741294-1-tomi.valkeinen+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add new pixel formats: RGBX1010102, RGBA1010102, ARGB2101010, Y210 and
Y212.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 .../media/platform/renesas/vsp1/vsp1_pipe.c   | 18 +++++++
 .../media/platform/renesas/vsp1/vsp1_regs.h   | 23 ++++++++
 .../media/platform/renesas/vsp1/vsp1_rpf.c    | 52 +++++++++++++++++++
 3 files changed, 93 insertions(+)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
index f72ac01c21ea..f8093ba9539e 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
@@ -146,6 +146,18 @@ static const struct vsp1_format_info vsp1_video_formats[] = {
 	  VI6_FMT_ARGB_8888, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
 	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
 	  1, { 32, 0, 0 }, false, false, 1, 1, false },
+	{ V4L2_PIX_FMT_RGBX1010102, MEDIA_BUS_FMT_ARGB8888_1X32,
+	  VI6_FMT_RGB10_RGB10A2_A2RGB10,
+	  VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS,
+	  1, { 32, 0, 0 }, false, false, 1, 1, false },
+	{ V4L2_PIX_FMT_RGBA1010102, MEDIA_BUS_FMT_ARGB8888_1X32,
+	  VI6_FMT_RGB10_RGB10A2_A2RGB10,
+	  VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS,
+	  1, { 32, 0, 0 }, false, false, 1, 1, false },
+	{ V4L2_PIX_FMT_ARGB2101010, MEDIA_BUS_FMT_ARGB8888_1X32,
+	  VI6_FMT_RGB10_RGB10A2_A2RGB10,
+	  VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS,
+	  1, { 32, 0, 0 }, false, false, 1, 1, false },
 	{ V4L2_PIX_FMT_UYVY, MEDIA_BUS_FMT_AYUV8_1X32,
 	  VI6_FMT_YUYV_422, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
 	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
@@ -202,6 +214,12 @@ static const struct vsp1_format_info vsp1_video_formats[] = {
 	  VI6_FMT_Y_U_V_444, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
 	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
 	  3, { 8, 8, 8 }, false, true, 1, 1, false },
+	{ V4L2_PIX_FMT_Y210, MEDIA_BUS_FMT_AYUV8_1X32,
+	  VI6_FMT_YUYV_422, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS,
+	  1, { 32, 0, 0 }, false, false, 2, 1, false },
+	{ V4L2_PIX_FMT_Y212, MEDIA_BUS_FMT_AYUV8_1X32,
+	  VI6_FMT_YUYV_422, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS,
+	  1, { 32, 0, 0 }, false, false, 2, 1, false },
 };
 
 /**
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_regs.h b/drivers/media/platform/renesas/vsp1/vsp1_regs.h
index c61e8dafeecf..d94343ae57a1 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_regs.h
+++ b/drivers/media/platform/renesas/vsp1/vsp1_regs.h
@@ -228,6 +228,28 @@
 #define VI6_RPF_MULT_ALPHA_RATIO_MASK	(0xff << 0)
 #define VI6_RPF_MULT_ALPHA_RATIO_SHIFT	0
 
+#define VI6_RPF_EXT_INFMT0		0x0370
+#define VI6_RPF_EXT_INFMT0_F2B		BIT(12)
+#define VI6_RPF_EXT_INFMT0_IPBD_Y_8	(0 << 8)
+#define VI6_RPF_EXT_INFMT0_IPBD_Y_10	(1 << 8)
+#define VI6_RPF_EXT_INFMT0_IPBD_Y_12	(2 << 8)
+#define VI6_RPF_EXT_INFMT0_IPBD_C_8	(0 << 4)
+#define VI6_RPF_EXT_INFMT0_IPBD_C_10	(1 << 4)
+#define VI6_RPF_EXT_INFMT0_IPBD_C_12	(2 << 4)
+#define VI6_RPF_EXT_INFMT0_BYPP_M1_RGB10	(3 << 0)
+
+#define VI6_RPF_EXT_INFMT1		0x0374
+#define VI6_RPF_EXT_INFMT1_PACK_CPOS(a, b, c, d) \
+	(((a) << 24) | ((b) << 16) | ((c) << 8) | ((d) << 0))
+
+#define VI6_RPF_EXT_INFMT2		0x0378
+#define VI6_RPF_EXT_INFMT2_PACK_CLEN(a, b, c, d) \
+	(((a) << 24) | ((b) << 16) | ((c) << 8) | ((d) << 0))
+
+#define VI6_RPF_BRDITH_CTRL		0x03e0
+#define VI6_RPF_BRDITH_CTRL_ODE		BIT(8)
+#define VI6_RPF_BRDITH_CTRL_CBRM	BIT(0)
+
 /* -----------------------------------------------------------------------------
  * WPF Control Registers
  */
@@ -846,6 +868,7 @@
 #define VI6_FMT_XBXGXR_262626		0x21
 #define VI6_FMT_ABGR_8888		0x22
 #define VI6_FMT_XXRGB_88565		0x23
+#define VI6_FMT_RGB10_RGB10A2_A2RGB10	0x30
 
 #define VI6_FMT_Y_UV_444		0x40
 #define VI6_FMT_Y_UV_422		0x41
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
index 045aa54f7998..3b17f5fa4067 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
@@ -109,6 +109,58 @@ static void rpf_configure_stream(struct vsp1_entity *entity,
 	vsp1_rpf_write(rpf, dlb, VI6_RPF_INFMT, infmt);
 	vsp1_rpf_write(rpf, dlb, VI6_RPF_DSWAP, fmtinfo->swap);
 
+	if (entity->vsp1->info->gen == 4) {
+		u32 ext_infmt0;
+		u32 ext_infmt1;
+		u32 ext_infmt2;
+
+		switch (fmtinfo->fourcc) {
+		case V4L2_PIX_FMT_RGBX1010102:
+			ext_infmt0 = VI6_RPF_EXT_INFMT0_BYPP_M1_RGB10;
+			ext_infmt1 = VI6_RPF_EXT_INFMT1_PACK_CPOS(0, 10, 20, 0);
+			ext_infmt2 = VI6_RPF_EXT_INFMT2_PACK_CLEN(10, 10, 10, 0);
+			break;
+
+		case V4L2_PIX_FMT_RGBA1010102:
+			ext_infmt0 = VI6_RPF_EXT_INFMT0_BYPP_M1_RGB10;
+			ext_infmt1 = VI6_RPF_EXT_INFMT1_PACK_CPOS(0, 10, 20, 30);
+			ext_infmt2 = VI6_RPF_EXT_INFMT2_PACK_CLEN(10, 10, 10, 2);
+			break;
+
+		case V4L2_PIX_FMT_ARGB2101010:
+			ext_infmt0 = VI6_RPF_EXT_INFMT0_BYPP_M1_RGB10;
+			ext_infmt1 = VI6_RPF_EXT_INFMT1_PACK_CPOS(2, 12, 22, 0);
+			ext_infmt2 = VI6_RPF_EXT_INFMT2_PACK_CLEN(10, 10, 10, 2);
+			break;
+
+		case V4L2_PIX_FMT_Y210:
+			ext_infmt0 = VI6_RPF_EXT_INFMT0_F2B |
+				     VI6_RPF_EXT_INFMT0_IPBD_Y_10 |
+				     VI6_RPF_EXT_INFMT0_IPBD_C_10;
+			ext_infmt1 = 0x0;
+			ext_infmt2 = 0x0;
+			break;
+
+		case V4L2_PIX_FMT_Y212:
+			ext_infmt0 = VI6_RPF_EXT_INFMT0_F2B |
+				     VI6_RPF_EXT_INFMT0_IPBD_Y_12 |
+				     VI6_RPF_EXT_INFMT0_IPBD_C_12;
+			ext_infmt1 = 0x0;
+			ext_infmt2 = 0x0;
+			break;
+
+		default:
+			ext_infmt0 = 0;
+			ext_infmt1 = 0;
+			ext_infmt2 = 0;
+			break;
+		}
+
+		vsp1_rpf_write(rpf, dlb, VI6_RPF_EXT_INFMT0, ext_infmt0);
+		vsp1_rpf_write(rpf, dlb, VI6_RPF_EXT_INFMT1, ext_infmt1);
+		vsp1_rpf_write(rpf, dlb, VI6_RPF_EXT_INFMT2, ext_infmt2);
+	}
+
 	/* Output location. */
 	if (pipe->brx) {
 		const struct v4l2_rect *compose;
-- 
2.34.1

