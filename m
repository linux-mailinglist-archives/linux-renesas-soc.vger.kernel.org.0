Return-Path: <linux-renesas-soc+bounces-6739-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E6D9167EE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jun 2024 14:33:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 741CB1F2810A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jun 2024 12:33:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30AC0157460;
	Tue, 25 Jun 2024 12:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UQOKYY42"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611A3156238;
	Tue, 25 Jun 2024 12:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719318825; cv=none; b=WFX3ybjfixZ1RQTBMv4zHOYv9rBNoJFVNf/M88e/0vYecvt8fkUE/RIZB0N/1dmfzqz4KXtQgYfwXqTMNKC6ON5cmYpIZpy8clEe31Usuj4br39xHQ7PNFyd0FcfyFtClimAEMGX40rygtzHvHg2FFWN2OoDE8C9qlKWezE9O1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719318825; c=relaxed/simple;
	bh=4KvUTQLw9gvP30Tp5JNWxt3XSOwjg0Sc/Nc0NF8kTjs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Q1V0qFOTsqTH2an7gqWiX2D8/q1AEl0YEIPXVjOQdpJ6hlNRN2StJG6YDwxb3IoEHJU50as7sKwrFLSHxDdHK5tY8OebjExwWb786dF6zl2jkcnJ5YCIFbj3dpAJGJ9iVzUquZIFaammltYBClVRoxlSXS9ahLolzRxC3+EXLnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UQOKYY42; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2ec5fad1984so31538701fa.0;
        Tue, 25 Jun 2024 05:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719318821; x=1719923621; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/cqf1zVU8T9PJtUZDZ8GI36DML+N/iS1fJepnMDzz0g=;
        b=UQOKYY42yj16gHLo2Bg6jMBthzn3FzjOFAIj8STlvR5XIJm35yKwMPjvAmmiD3GlXn
         iPCN/bPTxta+NsmNZIzDsfSF696BGRlU/l7OSLeQN4s7p3KE5SiDAWHV+FqcLrvHW+hI
         t88n9zeUiuzbwYRkUC+Ay1lf7ComPEw6MTzSlw10J2ExRYNV4hzJ56FMPct+0hljkdv6
         2/5NsfWUwyiTRbr4g1xL9ynZf52tqqP8nMgv/PpBByBdyYkb7VZWa5+jpsBJ4ZOIGF3I
         IsdxjdUP2+hNZRYVURaQm3WFGIw0qPb/ZWWFtGN5yOJVrGTrnJnfGM3MvTsxZW6w6yDB
         2HVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719318821; x=1719923621;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/cqf1zVU8T9PJtUZDZ8GI36DML+N/iS1fJepnMDzz0g=;
        b=rd+Nd4DedTrOU57XzWLDqgvHyQ1AKJ7hMO/huaTTYbZ+e3oKrTYDxSckcFKeQ57K6E
         peKn/cvw74v6mXWA1/iMfG8h2SUJ9OXFLZY3lFfdItRMnht1Dxi3OUojKp6Xi0hef72v
         JiHP7M+PAzuzO722EgdCUF0dIsDLAf53oEIXip3Cn7v9ojMQ/ozTm+xF80jg6fvr5I84
         gO6jkpjh4VALAOB7xynVLWNFPuQGKiUd3PPSJALvoHurYLJ6ZTOsexJFq5bsb0Ng8kiv
         oEDSfekWodte2o2jCjlN+F3m+gSnHV+QQh9wjpX6aBLRMYstYUixgm/Q/Ujdg8C9w4cV
         6BgA==
X-Forwarded-Encrypted: i=1; AJvYcCUcGA6EvcMnamk+qAGW/viemzaaplz1ae1v5b2eTfj9794ipYuJmUr4Qtk1LkPKEcSj6LSteNb3WnABqxsVPzI9VJrF47jx0ILXE+yH
X-Gm-Message-State: AOJu0Yxru9HJ8eSfTgE3/2eqROjcvx8KxPbXBhQIJg1YC05/uwSyd3S4
	199AKw6YkoLhoP9WRJ52+i/HaxYi9eMh64wbuX6rxYcjYEMAecGI
X-Google-Smtp-Source: AGHT+IGzf5w6HLzjANOioi8j8FbeMtUVIjSCWhXUsPjbZQabhZlzSRfjXDiGuLHklpPZSuy0Ut33Vg==
X-Received: by 2002:a2e:86ca:0:b0:2ec:52aa:1155 with SMTP id 38308e7fff4ca-2ec5b36c1fcmr59350491fa.52.1719318821025;
        Tue, 25 Jun 2024 05:33:41 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d0be818sm210288485e9.15.2024.06.25.05.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 05:33:40 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] drm: renesas: Move RZ/G2L MIPI DSI driver to rz-du
Date: Tue, 25 Jun 2024 13:32:44 +0100
Message-Id: <20240625123244.200533-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

All the RZ/G2L DU specific components are located under the rz-du folder,
so it makes sense to move the RZ/G2L MIPI DSI driver there instead of
keeping it in the rcar-du folder. This change improves the organization
and modularity of the driver configuration by grouping related settings together.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/gpu/drm/renesas/rcar-du/Kconfig                   | 8 --------
 drivers/gpu/drm/renesas/rcar-du/Makefile                  | 2 --
 drivers/gpu/drm/renesas/rz-du/Kconfig                     | 8 ++++++++
 drivers/gpu/drm/renesas/rz-du/Makefile                    | 2 ++
 .../gpu/drm/renesas/{rcar-du => rz-du}/rzg2l_mipi_dsi.c   | 0
 .../drm/renesas/{rcar-du => rz-du}/rzg2l_mipi_dsi_regs.h  | 0
 6 files changed, 10 insertions(+), 10 deletions(-)
 rename drivers/gpu/drm/renesas/{rcar-du => rz-du}/rzg2l_mipi_dsi.c (100%)
 rename drivers/gpu/drm/renesas/{rcar-du => rz-du}/rzg2l_mipi_dsi_regs.h (100%)

diff --git a/drivers/gpu/drm/renesas/rcar-du/Kconfig b/drivers/gpu/drm/renesas/rcar-du/Kconfig
index 53c356aed5d5..39af73cf2092 100644
--- a/drivers/gpu/drm/renesas/rcar-du/Kconfig
+++ b/drivers/gpu/drm/renesas/rcar-du/Kconfig
@@ -60,14 +60,6 @@ config DRM_RCAR_MIPI_DSI
 	select DRM_MIPI_DSI
 	select RESET_CONTROLLER
 
-config DRM_RZG2L_MIPI_DSI
-	tristate "RZ/G2L MIPI DSI Encoder Support"
-	depends on DRM && DRM_BRIDGE && OF
-	depends on ARCH_RENESAS || COMPILE_TEST
-	select DRM_MIPI_DSI
-	help
-	  Enable support for the RZ/G2L Display Unit embedded MIPI DSI encoders.
-
 config DRM_RCAR_VSP
 	bool "R-Car DU VSP Compositor Support" if ARM
 	default y if ARM64
diff --git a/drivers/gpu/drm/renesas/rcar-du/Makefile b/drivers/gpu/drm/renesas/rcar-du/Makefile
index b8f2c82651d9..6f132325c8b7 100644
--- a/drivers/gpu/drm/renesas/rcar-du/Makefile
+++ b/drivers/gpu/drm/renesas/rcar-du/Makefile
@@ -14,5 +14,3 @@ obj-$(CONFIG_DRM_RCAR_DU)		+= rcar-du-drm.o
 obj-$(CONFIG_DRM_RCAR_DW_HDMI)		+= rcar_dw_hdmi.o
 obj-$(CONFIG_DRM_RCAR_LVDS)		+= rcar_lvds.o
 obj-$(CONFIG_DRM_RCAR_MIPI_DSI)		+= rcar_mipi_dsi.o
-
-obj-$(CONFIG_DRM_RZG2L_MIPI_DSI)	+= rzg2l_mipi_dsi.o
diff --git a/drivers/gpu/drm/renesas/rz-du/Kconfig b/drivers/gpu/drm/renesas/rz-du/Kconfig
index 5f0db2c5fee6..8ec14271ebba 100644
--- a/drivers/gpu/drm/renesas/rz-du/Kconfig
+++ b/drivers/gpu/drm/renesas/rz-du/Kconfig
@@ -10,3 +10,11 @@ config DRM_RZG2L_DU
 	help
 	  Choose this option if you have an RZ/G2L alike chipset.
 	  If M is selected the module will be called rzg2l-du-drm.
+
+config DRM_RZG2L_MIPI_DSI
+	tristate "RZ/G2L MIPI DSI Encoder Support"
+	depends on DRM && DRM_BRIDGE && OF
+	depends on ARCH_RENESAS || COMPILE_TEST
+	select DRM_MIPI_DSI
+	help
+	  Enable support for the RZ/G2L Display Unit embedded MIPI DSI encoders.
diff --git a/drivers/gpu/drm/renesas/rz-du/Makefile b/drivers/gpu/drm/renesas/rz-du/Makefile
index 663b82a2577f..2987900ea6b6 100644
--- a/drivers/gpu/drm/renesas/rz-du/Makefile
+++ b/drivers/gpu/drm/renesas/rz-du/Makefile
@@ -6,3 +6,5 @@ rzg2l-du-drm-y := rzg2l_du_crtc.o \
 
 rzg2l-du-drm-$(CONFIG_VIDEO_RENESAS_VSP1)	+= rzg2l_du_vsp.o
 obj-$(CONFIG_DRM_RZG2L_DU)		+= rzg2l-du-drm.o
+
+obj-$(CONFIG_DRM_RZG2L_MIPI_DSI)	+= rzg2l_mipi_dsi.o
diff --git a/drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
similarity index 100%
rename from drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi.c
rename to drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
diff --git a/drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
similarity index 100%
rename from drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi_regs.h
rename to drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
-- 
2.34.1


