Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAA201E18DF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2020 03:15:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388433AbgEZBPz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 May 2020 21:15:55 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:54362 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388348AbgEZBPz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 May 2020 21:15:55 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 81AE511F3;
        Tue, 26 May 2020 03:15:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1590455751;
        bh=Aa+iQDfRsoFORPoXZkc3bpAotSuSaJ78D7SXr/Pd0oQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Q/UTB99ALsw/bkOmqcR/5uaKzy0Ee5Awr1EVqkckgNyKz4822HERUHDOAp5o1mqoF
         vvDLpBZap9c1FM899W8gnnVqaZCZ2n63FwIwXVPIzVMvMHsi3o8tBBYp1VrPsTFWh0
         /RfUPLhxZT8BjkQaCD4dY778G66Y6+n99DpZ7zHA=
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
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 27/27] drm: Add default modes for connectors in unknown state
Date:   Tue, 26 May 2020 04:15:05 +0300
Message-Id: <20200526011505.31884-28-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200526011505.31884-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20200526011505.31884-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The DRM CRTC helpers add default modes to connectors in the connected
state if no mode can be retrieved from the connector. This behaviour is
useful for VGA or DVI outputs that have no connected DDC bus. However,
in such cases, the status of the output usually can't be retrieved and
is reported as connector_status_unknown.

Extend the addition of default modes to connectors in an unknown state
to support outputs that can retrieve neither the modes nor the
connection status.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/drm_probe_helper.c       | 3 ++-
 include/drm/drm_modeset_helper_vtables.h | 8 +++++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index f5d141e0400f..9055d9573c90 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -491,7 +491,8 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
 	if (count == 0 && connector->status == connector_status_connected)
 		count = drm_add_override_edid_modes(connector);
 
-	if (count == 0 && connector->status == connector_status_connected)
+	if (count == 0 && (connector->status == connector_status_connected ||
+			   connector->status == connector_status_unknown))
 		count = drm_add_modes_noedid(connector, 1024, 768);
 	count += drm_helper_probe_add_cmdline_mode(connector);
 	if (count == 0)
diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
index 421a30f08463..afe55e2e93d2 100644
--- a/include/drm/drm_modeset_helper_vtables.h
+++ b/include/drm/drm_modeset_helper_vtables.h
@@ -876,13 +876,19 @@ struct drm_connector_helper_funcs {
 	 * The usual way to implement this is to cache the EDID retrieved in the
 	 * probe callback somewhere in the driver-private connector structure.
 	 * In this function drivers then parse the modes in the EDID and add
-	 * them by calling drm_add_edid_modes(). But connectors that driver a
+	 * them by calling drm_add_edid_modes(). But connectors that drive a
 	 * fixed panel can also manually add specific modes using
 	 * drm_mode_probed_add(). Drivers which manually add modes should also
 	 * make sure that the &drm_connector.display_info,
 	 * &drm_connector.width_mm and &drm_connector.height_mm fields are
 	 * filled in.
 	 *
+	 * Note that the caller function will automatically add standard VESA
+	 * DMT modes up to 1024x768 if the .get_modes() helper operation returns
+	 * no mode and if the connector status is connector_status_connected or
+	 * connector_status_unknown. There is no need to call
+	 * drm_add_edid_modes() manually in that case.
+	 *
 	 * Virtual drivers that just want some standard VESA mode with a given
 	 * resolution can call drm_add_modes_noedid(), and mark the preferred
 	 * one using drm_set_preferred_mode().
-- 
Regards,

Laurent Pinchart

