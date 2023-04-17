Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D76976E4A3C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Apr 2023 15:44:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230492AbjDQNo4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Apr 2023 09:44:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230517AbjDQNoy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Apr 2023 09:44:54 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34ADD1BF8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Apr 2023 06:44:51 -0700 (PDT)
Received: from ramsan.of.borg ([84.195.187.55])
        by xavier.telenet-ops.be with bizsmtp
        id lpko2900u1C8whw01pkomm; Mon, 17 Apr 2023 15:44:49 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1poP4u-00H0Vz-0L;
        Mon, 17 Apr 2023 15:40:27 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1poP5n-007zAM-LL;
        Mon, 17 Apr 2023 15:40:27 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 2/5] drm: shmobile: Add support for DRM_FORMAT_XRGB8888
Date:   Mon, 17 Apr 2023 15:40:22 +0200
Message-Id: <9107cdda83234cf09fc8a93609a66ace1a55aba3.1681734821.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1681734821.git.geert+renesas@glider.be>
References: <cover.1681734821.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

DRM_FORMAT_XRGB8888 aka XR24 is the modus francus of DRM, and should be
supported by all drivers.

The handling for DRM_FORMAT_XRGB8888 is similar to DRM_FORMAT_ARGB8888,
just ignore the alpha channel.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
v2:
  - Add Reviewed-by.
---
 drivers/gpu/drm/shmobile/shmob_drm_crtc.c  | 1 +
 drivers/gpu/drm/shmobile/shmob_drm_kms.c   | 5 +++++
 drivers/gpu/drm/shmobile/shmob_drm_plane.c | 5 +++++
 3 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/shmobile/shmob_drm_crtc.c
index 713a7612244c647a..08dc1428aa16caf0 100644
--- a/drivers/gpu/drm/shmobile/shmob_drm_crtc.c
+++ b/drivers/gpu/drm/shmobile/shmob_drm_crtc.c
@@ -232,6 +232,7 @@ static void shmob_drm_crtc_start(struct shmob_drm_crtc *scrtc)
 		value = LDDDSR_LS | LDDDSR_WS | LDDDSR_BS;
 		break;
 	case DRM_FORMAT_ARGB8888:
+	case DRM_FORMAT_XRGB8888:
 	default:
 		value = LDDDSR_LS;
 		break;
diff --git a/drivers/gpu/drm/shmobile/shmob_drm_kms.c b/drivers/gpu/drm/shmobile/shmob_drm_kms.c
index 3c5fe3bc183c7c13..99381cc0abf3ae1f 100644
--- a/drivers/gpu/drm/shmobile/shmob_drm_kms.c
+++ b/drivers/gpu/drm/shmobile/shmob_drm_kms.c
@@ -39,6 +39,11 @@ static const struct shmob_drm_format_info shmob_drm_format_infos[] = {
 		.bpp = 32,
 		.yuv = false,
 		.lddfr = LDDFR_PKF_ARGB32,
+	}, {
+		.fourcc = DRM_FORMAT_XRGB8888,
+		.bpp = 32,
+		.yuv = false,
+		.lddfr = LDDFR_PKF_ARGB32,
 	}, {
 		.fourcc = DRM_FORMAT_NV12,
 		.bpp = 12,
diff --git a/drivers/gpu/drm/shmobile/shmob_drm_plane.c b/drivers/gpu/drm/shmobile/shmob_drm_plane.c
index 604ae23825daaafd..850986cee848226a 100644
--- a/drivers/gpu/drm/shmobile/shmob_drm_plane.c
+++ b/drivers/gpu/drm/shmobile/shmob_drm_plane.c
@@ -80,6 +80,7 @@ static void __shmob_drm_plane_setup(struct shmob_drm_plane *splane,
 		format |= LDBBSIFR_SWPL | LDBBSIFR_SWPW | LDBBSIFR_SWPB;
 		break;
 	case DRM_FORMAT_ARGB8888:
+	case DRM_FORMAT_XRGB8888:
 	default:
 		format |= LDBBSIFR_SWPL;
 		break;
@@ -95,6 +96,9 @@ static void __shmob_drm_plane_setup(struct shmob_drm_plane *splane,
 	case DRM_FORMAT_ARGB8888:
 		format |= LDBBSIFR_AL_PK | LDBBSIFR_RY | LDDFR_PKF_ARGB32;
 		break;
+	case DRM_FORMAT_XRGB8888:
+		format |= LDBBSIFR_AL_1 | LDBBSIFR_RY | LDDFR_PKF_ARGB32;
+		break;
 	case DRM_FORMAT_NV12:
 	case DRM_FORMAT_NV21:
 		format |= LDBBSIFR_AL_1 | LDBBSIFR_CHRR_420;
@@ -231,6 +235,7 @@ static const uint32_t formats[] = {
 	DRM_FORMAT_RGB565,
 	DRM_FORMAT_RGB888,
 	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_NV12,
 	DRM_FORMAT_NV21,
 	DRM_FORMAT_NV16,
-- 
2.34.1

