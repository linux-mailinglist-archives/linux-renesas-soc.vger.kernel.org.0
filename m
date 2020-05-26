Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BD0A1E18BF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2020 03:15:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388419AbgEZBPi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 May 2020 21:15:38 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:54224 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388416AbgEZBPh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 May 2020 21:15:37 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A9AFC11B7;
        Tue, 26 May 2020 03:15:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1590455732;
        bh=MJQj5JzG549sGpsTAGA9uKvLJ7s5eWarFYKAgs9itgc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fBoUoUMcHiANTvo4sCs8YTPYlj9VaEtDH5VztyQk/ipOUBjQ1AFhpnyyfzup1vfQl
         yyPM83SpfCoYLHcWjhL0DZc/dN3TI81dib6YdwflGecJMz1ZNRlYeLGCDLmywzrPTy
         +6I0Pmg9IWdiuZx58Fyzx5xNv5CCdjpsuedxL69k=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Andrzej Hajda <a.hajda@samsung.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 09/27] drm: edid: Constify connector argument to infoframe functions
Date:   Tue, 26 May 2020 04:14:47 +0300
Message-Id: <20200526011505.31884-10-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200526011505.31884-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20200526011505.31884-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The drm_hdmi_avi_infoframe_from_display_mode(),
drm_hdmi_vendor_infoframe_from_display_mode() and
drm_hdmi_avi_infoframe_quant_range() functions take a drm_connector that
they don't modify. Mark it as const.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/drm_edid.c | 12 ++++++------
 include/drm/drm_edid.h     |  6 +++---
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 3bd95c4b02eb..e6b26f16c21f 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5365,7 +5365,7 @@ void drm_set_preferred_mode(struct drm_connector *connector,
 }
 EXPORT_SYMBOL(drm_set_preferred_mode);
 
-static bool is_hdmi2_sink(struct drm_connector *connector)
+static bool is_hdmi2_sink(const struct drm_connector *connector)
 {
 	/*
 	 * FIXME: sil-sii8620 doesn't have a connector around when
@@ -5450,7 +5450,7 @@ drm_hdmi_infoframe_set_hdr_metadata(struct hdmi_drm_infoframe *frame,
 }
 EXPORT_SYMBOL(drm_hdmi_infoframe_set_hdr_metadata);
 
-static u8 drm_mode_hdmi_vic(struct drm_connector *connector,
+static u8 drm_mode_hdmi_vic(const struct drm_connector *connector,
 			    const struct drm_display_mode *mode)
 {
 	bool has_hdmi_infoframe = connector ?
@@ -5466,7 +5466,7 @@ static u8 drm_mode_hdmi_vic(struct drm_connector *connector,
 	return drm_match_hdmi_mode(mode);
 }
 
-static u8 drm_mode_cea_vic(struct drm_connector *connector,
+static u8 drm_mode_cea_vic(const struct drm_connector *connector,
 			   const struct drm_display_mode *mode)
 {
 	u8 vic;
@@ -5504,7 +5504,7 @@ static u8 drm_mode_cea_vic(struct drm_connector *connector,
  */
 int
 drm_hdmi_avi_infoframe_from_display_mode(struct hdmi_avi_infoframe *frame,
-					 struct drm_connector *connector,
+					 const struct drm_connector *connector,
 					 const struct drm_display_mode *mode)
 {
 	enum hdmi_picture_aspect picture_aspect;
@@ -5651,7 +5651,7 @@ EXPORT_SYMBOL(drm_hdmi_avi_infoframe_colorspace);
  */
 void
 drm_hdmi_avi_infoframe_quant_range(struct hdmi_avi_infoframe *frame,
-				   struct drm_connector *connector,
+				   const struct drm_connector *connector,
 				   const struct drm_display_mode *mode,
 				   enum hdmi_quantization_range rgb_quant_range)
 {
@@ -5755,7 +5755,7 @@ s3d_structure_from_display_mode(const struct drm_display_mode *mode)
  */
 int
 drm_hdmi_vendor_infoframe_from_display_mode(struct hdmi_vendor_infoframe *frame,
-					    struct drm_connector *connector,
+					    const struct drm_connector *connector,
 					    const struct drm_display_mode *mode)
 {
 	/*
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 34b15e3d070c..43254319ab19 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -361,11 +361,11 @@ drm_load_edid_firmware(struct drm_connector *connector)
 
 int
 drm_hdmi_avi_infoframe_from_display_mode(struct hdmi_avi_infoframe *frame,
-					 struct drm_connector *connector,
+					 const struct drm_connector *connector,
 					 const struct drm_display_mode *mode);
 int
 drm_hdmi_vendor_infoframe_from_display_mode(struct hdmi_vendor_infoframe *frame,
-					    struct drm_connector *connector,
+					    const struct drm_connector *connector,
 					    const struct drm_display_mode *mode);
 
 void
@@ -378,7 +378,7 @@ drm_hdmi_avi_infoframe_bars(struct hdmi_avi_infoframe *frame,
 
 void
 drm_hdmi_avi_infoframe_quant_range(struct hdmi_avi_infoframe *frame,
-				   struct drm_connector *connector,
+				   const struct drm_connector *connector,
 				   const struct drm_display_mode *mode,
 				   enum hdmi_quantization_range rgb_quant_range);
 
-- 
Regards,

Laurent Pinchart

