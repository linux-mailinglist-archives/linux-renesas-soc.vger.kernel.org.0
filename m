Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 243FC34370A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Mar 2021 04:03:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229991AbhCVDCw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 21 Mar 2021 23:02:52 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35456 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229761AbhCVDCY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 21 Mar 2021 23:02:24 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 09B2F1025;
        Mon, 22 Mar 2021 04:02:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1616382139;
        bh=v1B2NZGFeIQk1d26ZpRXPBNZXiCp5x5dLUlFUdNh+Sg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=p3uvGWxbTBq+a4MSM4v80LTMRjop17rOyjAtNRCykg5sBWCZd9xWFuxHLDdBWnjcH
         WX1zR6tMFWDRIAfEBU4moxH8Aw4Jv/DxMQznWXotvKloTd6OKEK3/RwYeF/EWDt6re
         t8ntu7bjKnQabNk20i70aSLpfLPxGAQvzxvDYEwA=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>
Subject: [RFC PATCH 04/11] drm/bridge: ti-sn65dsi86: Use bitmask to store valid rates
Date:   Mon, 22 Mar 2021 05:01:21 +0200
Message-Id: <20210322030128.2283-5-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.28.1
In-Reply-To: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The valid rates are stored in an array of 8 booleans. Replace it with a
bitmask to save space.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index c45420a50e73..1d1be791d5ba 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -557,9 +557,9 @@ static int ti_sn_bridge_calc_min_dp_rate_idx(struct ti_sn_bridge *pdata)
 	return i;
 }
 
-static void ti_sn_bridge_read_valid_rates(struct ti_sn_bridge *pdata,
-					  bool rate_valid[])
+static unsigned int ti_sn_bridge_read_valid_rates(struct ti_sn_bridge *pdata)
 {
+	unsigned int valid_rates = 0;
 	unsigned int rate_per_200khz;
 	unsigned int rate_mhz;
 	u8 dpcd_val;
@@ -599,13 +599,13 @@ static void ti_sn_bridge_read_valid_rates(struct ti_sn_bridge *pdata,
 			     j < ARRAY_SIZE(ti_sn_bridge_dp_rate_lut);
 			     j++) {
 				if (ti_sn_bridge_dp_rate_lut[j] == rate_mhz)
-					rate_valid[j] = true;
+					valid_rates |= BIT(j);
 			}
 		}
 
 		for (i = 0; i < ARRAY_SIZE(ti_sn_bridge_dp_rate_lut); i++) {
-			if (rate_valid[i])
-				return;
+			if (valid_rates & BIT(i))
+				return valid_rates;
 		}
 		DRM_DEV_ERROR(pdata->dev,
 			      "No matching eDP rates in table; falling back\n");
@@ -627,15 +627,17 @@ static void ti_sn_bridge_read_valid_rates(struct ti_sn_bridge *pdata,
 			      (int)dpcd_val);
 		fallthrough;
 	case DP_LINK_BW_5_4:
-		rate_valid[7] = 1;
+		valid_rates |= BIT(7);
 		fallthrough;
 	case DP_LINK_BW_2_7:
-		rate_valid[4] = 1;
+		valid_rates |= BIT(4);
 		fallthrough;
 	case DP_LINK_BW_1_62:
-		rate_valid[1] = 1;
+		valid_rates |= BIT(1);
 		break;
 	}
+
+	return valid_rates;
 }
 
 static void ti_sn_bridge_set_video_timings(struct ti_sn_bridge *pdata)
@@ -753,8 +755,8 @@ static int ti_sn_link_training(struct ti_sn_bridge *pdata, int dp_rate_idx,
 static void ti_sn_bridge_enable(struct drm_bridge *bridge)
 {
 	struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
-	bool rate_valid[ARRAY_SIZE(ti_sn_bridge_dp_rate_lut)] = { };
 	const char *last_err_str = "No supported DP rate";
+	unsigned int valid_rates;
 	int dp_rate_idx;
 	unsigned int val;
 	int ret = -EINVAL;
@@ -793,13 +795,13 @@ static void ti_sn_bridge_enable(struct drm_bridge *bridge)
 	regmap_update_bits(pdata->regmap, SN_SSC_CONFIG_REG, DP_NUM_LANES_MASK,
 			   val);
 
-	ti_sn_bridge_read_valid_rates(pdata, rate_valid);
+	valid_rates = ti_sn_bridge_read_valid_rates(pdata);
 
 	/* Train until we run out of rates */
 	for (dp_rate_idx = ti_sn_bridge_calc_min_dp_rate_idx(pdata);
 	     dp_rate_idx < ARRAY_SIZE(ti_sn_bridge_dp_rate_lut);
 	     dp_rate_idx++) {
-		if (!rate_valid[dp_rate_idx])
+		if (!(valid_rates & BIT(dp_rate_idx)))
 			continue;
 
 		ret = ti_sn_link_training(pdata, dp_rate_idx, &last_err_str);
-- 
Regards,

Laurent Pinchart

