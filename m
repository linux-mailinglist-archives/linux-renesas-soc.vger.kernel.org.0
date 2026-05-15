Return-Path: <linux-renesas-soc+bounces-32652-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CIXFpbSBmqKoAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32652-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 10:00:22 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFD454AF36
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 10:00:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 562F13098E74
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 07:57:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3FF23FFAB2;
	Fri, 15 May 2026 07:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="I3ZCtmS2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931CD3EF655;
	Fri, 15 May 2026 07:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778831814; cv=none; b=FfQ7GErpHUy9OmUZvJvuWQbCdeH0yM9Y+PPBqFhVp1CYmDpxY5iBuJV8RbGp85p3pd7HxSUVqxxguaLiEGTEitIWkBrzoTnOC8ijgCuLaDwyZfDHjG+4W95uK8KHhGo4P+hRVcqY/OLOm47RLQ4yqtjs3xbxTMQwqlt+23ShSIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778831814; c=relaxed/simple;
	bh=gBQFB78X4KGzpd0DZyLsXnhD9qIE3f4obIum+k+GS5o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kZcVWpS6H8i8wjmAmj4qCxvknIvghts5nnjmySl8gRmP/eY6g+GGWbvXfotroRaV4dgEHWVIRCUUvGm/f9HpSyc2LeXo4+YIrz5cMJ0LwxB2yCSuZvoLW6sL6OKfHBC/uP219Hb9OpUbgYTJLZWD/yajhAQguUqSwdLiFyoKD8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=I3ZCtmS2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B10C81337;
	Fri, 15 May 2026 09:56:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778831798;
	bh=gBQFB78X4KGzpd0DZyLsXnhD9qIE3f4obIum+k+GS5o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=I3ZCtmS2M9jvVB9tUwR3xDgYz12AJs28JQDrulU0fckk7wuPsa4BcFPjJKZoP6H+d
	 qL/+eoRThiSYPKaAggi+dBxQfu/hvzGFh6vXQyCFsUqUkXJ8lfP7hP8DSztvJR8niz
	 3/26+2rVSWWMLE2C5OaN/2MCDbF0E/hxxzTbjTlw=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Fri, 15 May 2026 10:56:17 +0300
Subject: [PATCH v2 4/5] drm/rcar-du: dsi: Support DSC in the pipeline
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-rcar-du-dsc-v2-4-f6b9240a1240@ideasonboard.com>
References: <20260515-rcar-du-dsc-v2-0-f6b9240a1240@ideasonboard.com>
In-Reply-To: <20260515-rcar-du-dsc-v2-0-f6b9240a1240@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2997;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=gBQFB78X4KGzpd0DZyLsXnhD9qIE3f4obIum+k+GS5o=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqBtG3q6ozBUgeLeR+VJ30nREHyXEMve1sOkZTR
 xbyjxGiDQuJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCagbRtwAKCRD6PaqMvJYe
 9RjID/9WAMplmXopUUNqWD2y44x/JVmYqyvm4ZbiME70tsNXFMLDNZnLeswVpp1JZ5IMBIanikP
 qpF8iIziHv39jNvGkKYJWgSO5hsCNICcwQQVU+N3tIQK9MxRz3EBAFrdMxCmhMqmuAgekOuhvIR
 AE4+5urWeIba7HUYnNpaoC1IsQUc/1dYBHFrG9s9j2usgOhRy0rDM96Jrpo+f8lw8EIRixDuAoZ
 ocYss95m6kQhsHiqF9TQtnfCys9PpRx/SbZkRhMFwVFqEnK99JjRqOoD5M1HrnZ/zj9VlUur/Jk
 ih50kVwFanGpKy5cajMj8yJOcuxHBiECJ1L4Ln/MC+gJrmKGP2tE8gpqMLgUuSkOgvnbNFfM3Ou
 om1+65soeyYWy5gTAaM37XY69FmD61+/J+fOtTxANnVQc9GQF4zJsZ9YW6p+85KOapQBnPRUXMX
 L+rJffH6IENfQjjSoJ5eKNbJDoqVFdxKWc4DAKWZRwSFBXipHraHGalH+WmMZ1u0pM2zMS6FsoB
 DubX1RoSZBWkR6NynHxk/jt4JxgJ9A1HDGgRMwShXgNwnzEKifvzJHDgbbJmtHKHuiaesE830Ap
 gi8pAdcHS2TnMoy/nSRTRzSki7OlKdGJ58VvruZmvtCdU4tQhisYXFVnmVSXfVinrj3z8STSwY5
 U9K+0us038+8XHA==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-Rspamd-Queue-Id: CBFD454AF36
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32652-lists,linux-renesas-soc=lfdr.de,renesas];
	FREEMAIL_TO(0.00)[glider.be,baylibre.com,kernel.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,mailbox.org,pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomi.valkeinen@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:dkim]
X-Rspamd-Action: no action

Enabling DSI clocks on rcar-du needs some tricks as the DU dot clock is
provided by the DSI. Thus, we call rcar_mipi_dsi_pclk_enable() from the
crtc, when enabling the crtc.

With DSC (added in upcoming patch) in the pipeline, between the DU and
the DSI, the above call path is broken as the crtc tries to call
rcar_mipi_dsi_pclk_enable() on the DSC.

Adjust the rcar_mipi_dsi_pclk_enable() so that it detects the DSC, and
in that case gets the next bridge from the DSC, which is the DSI.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c | 36 +++++++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
index 4ef2e3c129ed..085e229bcb0b 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
@@ -88,6 +88,8 @@ struct dsi_setup_info {
 	const struct dsi_clk_config *clkset;
 };
 
+static const struct drm_bridge_funcs rcar_mipi_dsi_bridge_ops;
+
 static inline struct rcar_mipi_dsi *
 bridge_to_rcar_mipi_dsi(struct drm_bridge *bridge)
 {
@@ -844,15 +846,39 @@ static void rcar_mipi_dsi_atomic_disable(struct drm_bridge *bridge,
 	rcar_mipi_dsi_stop_video(dsi);
 }
 
+/*
+ * We need to skip the DSC bridge when we have DSC in between the DU and
+ * the DSI. We detect the DSI bridge via bridge->funcs, and assume the
+ * next_bridge is the DSI bridge. If this is not the case, the DT data
+ * is wrong (so it shouldn't really happen).
+ */
+static struct drm_bridge *
+rcar_mipi_dsi_resolve_bridge(struct drm_bridge *bridge)
+{
+	if (bridge->funcs != &rcar_mipi_dsi_bridge_ops)
+		bridge = bridge->next_bridge;
+
+	if (!bridge || bridge->funcs != &rcar_mipi_dsi_bridge_ops)
+		return NULL;
+
+	return bridge;
+}
+
 void rcar_mipi_dsi_pclk_enable(struct drm_bridge *bridge,
 			       struct drm_atomic_state *state)
 {
-	struct rcar_mipi_dsi *dsi = bridge_to_rcar_mipi_dsi(bridge);
 	const struct drm_display_mode *mode;
 	struct drm_connector *connector;
+	struct rcar_mipi_dsi *dsi;
 	struct drm_crtc *crtc;
 	int ret;
 
+	bridge = rcar_mipi_dsi_resolve_bridge(bridge);
+	if (WARN_ON(!bridge))
+		return;
+
+	dsi = bridge_to_rcar_mipi_dsi(bridge);
+
 	connector = drm_atomic_get_new_connector_for_encoder(state,
 							     bridge->encoder);
 	crtc = drm_atomic_get_new_connector_state(state, connector)->crtc;
@@ -885,7 +911,13 @@ EXPORT_SYMBOL_GPL(rcar_mipi_dsi_pclk_enable);
 
 void rcar_mipi_dsi_pclk_disable(struct drm_bridge *bridge)
 {
-	struct rcar_mipi_dsi *dsi = bridge_to_rcar_mipi_dsi(bridge);
+	struct rcar_mipi_dsi *dsi;
+
+	bridge = rcar_mipi_dsi_resolve_bridge(bridge);
+	if (WARN_ON(!bridge))
+		return;
+
+	dsi = bridge_to_rcar_mipi_dsi(bridge);
 
 	rcar_mipi_dsi_shutdown(dsi);
 	rcar_mipi_dsi_clk_disable(dsi);

-- 
2.43.0


