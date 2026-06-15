Return-Path: <linux-renesas-soc+bounces-34029-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id syLWD2n6L2oQLAUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34029-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 15:13:13 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A05686984
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 15:13:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=kHDjkhBR;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34029-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34029-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8B07C300F46C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 13:13:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64B9D3F58F4;
	Mon, 15 Jun 2026 13:12:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5913F4DD6;
	Mon, 15 Jun 2026 13:12:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781529160; cv=none; b=OXc/EB87VG7jt3fLFjISoMjSQTIRztF/JnUnH65swutyqDazZuRLiNZ28pMNIyJuRtgl3MfYnSIq3bxGt6ZFHiIJIcoWFCf2cFMN3VSBKVmbHP+KfrAbONYX8HuEVGTJYhmTTh4twrWy/4y1CgP/uEf5JHPz5Z1L4UHyst6MOMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781529160; c=relaxed/simple;
	bh=5ctjG7NGK6UPrJitqiaBGctFX5TJpTY/5yZ0RISE+JY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l2I+EnP4FPgbVi4RY9lzVG1kNFLYmdWiORRKz7RXjBywB38pmAL3lOJMBkEZ4xX2IW40zC8Zqi5oZtQrUhHJNh++vE4O5xTGVptnKz+pH3UwK0ACTeNFf075yb1FF2P61mKm8VG3XasMMVKpUSS+311ir42ShVaZFFs1ATmxoHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kHDjkhBR; arc=none smtp.client-ip=213.167.242.64
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 94B9A1E1B;
	Mon, 15 Jun 2026 15:11:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781529120;
	bh=5ctjG7NGK6UPrJitqiaBGctFX5TJpTY/5yZ0RISE+JY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kHDjkhBRDqtzg2lkXhTvQYMjGTsVOe/OxooCxIYSXxuXUOL/7ZnEooYvmJDKpHDYt
	 X8g46yiZkN7z2hdL39scrXpDquhE7KSZg4JmYo0sKL3pcprr0jxIl1v2PFug+V2NAd
	 VlKC5qa2Jo9uBRGfOpbwhcZsmsVTAz7gZVC7Hbus=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Mon, 15 Jun 2026 16:11:57 +0300
Subject: [PATCH v5 4/7] drm/rcar-du: dsi: Support DSC in the pipeline
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-rcar-du-dsc-v5-4-aed1a28610e4@ideasonboard.com>
References: <20260615-rcar-du-dsc-v5-0-aed1a28610e4@ideasonboard.com>
In-Reply-To: <20260615-rcar-du-dsc-v5-0-aed1a28610e4@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2388;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=5ctjG7NGK6UPrJitqiaBGctFX5TJpTY/5yZ0RISE+JY=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqL/o3tQ/9aXDqXtaD+SMx/77W38ZbjPcrQ2nPL
 o6cQFU4vV2JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCai/6NwAKCRD6PaqMvJYe
 9UmlEACrUo7pcZd85rmn/izjcVIEgGgKFikKupX6Xd343uFge2hH0noKV/6VturknzCeceO2YRQ
 cZJ6/zkad2nWejpNdjI2DN6fa8JFr8FbkAHikV4iKQXLQbnnpnxMGT10ZHmpKFcfpXXq3di3gbs
 IT901Xrt87oMQG5mEPXkPrzAfKsytf9mZnaNiJjY3HsoRS3fb6YvHUyPYdf9WAqy8W8S5O3qbXS
 RhPBcPwV9TkraZN/0g8am8HRFnF8kfU2P7J02BOSM9QGRWUWy9aY72PsNDpIeW2YixCDTs7vSsi
 IUMeNAGq4sOF9WTMJy3Jlbaeynu/cPaZcZd8kCNd3SoecSwhdB3ftOT0PKjAfPZD2lrn+y35sJN
 I5mMcnC/S27Qm6CnjbV5zSlajOrDrCdS733buu35/wZ6A/TBixOVJjeGE3DNBu8JkyO5dCGpn1M
 /bRFh6e1haGO+KjVXugXzbI3UD4bcefxPj1UGcuUeyGNZw9rD98H0w6Mc8UtZ1VfPxe4jyhcdEB
 XSxtuFwdHKNsY3OiMr2XfSN37jAXplsraaU+twt/3unkk8j9eSxbKg+0KMKSxMZsyy+SFWAQyZn
 iadzdxCj2Od3IYezHyusZALQRJDNMeXWEIdwzBRepEqohimWKw5X+7DyIUP9e9uFFHqVT9U+qhA
 h+NhtaCddLFsd8g==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34029-lists,linux-renesas-soc=lfdr.de,renesas];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:marek.vasut+renesas@mailbox.org,m:laurent.pinchart+renesas@ideasonboard.com,m:kieran.bingham+renesas@ideasonboard.com,m:p.zabel@pengutronix.de,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:tomi.valkeinen+renesas@ideasonboard.com,m:geert@glider.be,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,m:marek.vasut@mailbox.org,m:laurent.pinchart@ideasonboard.com,m:kieran.bingham@ideasonboard.com,m
 :tomi.valkeinen@ideasonboard.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,baylibre.com,kernel.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,mailbox.org,pengutronix.de];
	FORGED_SENDER(0.00)[tomi.valkeinen@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomi.valkeinen@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 22A05686984

Enabling DSI clocks on rcar-du needs some tricks as the DU dot clock is
provided by the DSI. Thus, we call rcar_mipi_dsi_pclk_enable() from the
crtc, when enabling the crtc.

With DSC (added in upcoming patch) in the pipeline, between the DU and
the DSI, the above call path is broken as the crtc tries to call
rcar_mipi_dsi_pclk_enable() on the DSC.

To solve this problem, make sure we store the DSI bridge to the
rcdu->dsi[] array, instead of the first bridge in the DSI pipeline
(which can be DCS), by checking the bridge's bridge->type.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c | 18 ++++++++++++++++--
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c   |  1 +
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c
index db2088529b48..ac85838ab3b8 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c
@@ -89,9 +89,23 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
 				drm_bridge_get(bridge);
 
 		if (output == RCAR_DU_OUTPUT_DSI0 ||
-		    output == RCAR_DU_OUTPUT_DSI1)
+		    output == RCAR_DU_OUTPUT_DSI1) {
+			struct drm_bridge *dsi_bridge;
+
+			/*
+			 * When we have a DSC block between the DU and the DSI,
+			 * the "bridge" points to the DSC. Detect the DSC by looking
+			 * at the bridge type, and skip the DSC if the bridge is not
+			 * the DSI bridge.
+			 */
+
+			dsi_bridge = bridge->type == DRM_MODE_CONNECTOR_DSI ?
+						     bridge :
+						     bridge->next_bridge;
+
 			rcdu->dsi[output - RCAR_DU_OUTPUT_DSI0] =
-				drm_bridge_get(bridge);
+				drm_bridge_get(dsi_bridge);
+		}
 	}
 
 	/*
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
index aaafee1c060b..f429f03a380c 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
@@ -957,6 +957,7 @@ static int rcar_mipi_dsi_host_attach(struct mipi_dsi_host *host,
 
 	/* Initialize the DRM bridge. */
 	dsi->bridge.of_node = dsi->dev->of_node;
+	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
 	drm_bridge_add(&dsi->bridge);
 
 	return 0;

-- 
2.43.0


