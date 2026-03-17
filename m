Return-Path: <linux-renesas-soc+bounces-29700-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJP9EQDjuWnzPAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29700-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 00:25:52 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5EE2B451D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 00:25:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4078D30DD282
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 23:19:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19FAE18872A;
	Tue, 17 Mar 2026 23:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ROU3KBKY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE4837E30D
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 23:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773789577; cv=none; b=Qj4yr+EGlq7M8Mg4WCKn4A7HKr69NUHs39Z7qW2KNW81pRxyupJk2zAkO6EcJ7knUvFi0t66fh4Yez8wq11/B1R3fYmTdIMOEqByIcQIsGDslNda8M7moWfhqr3wdpifMMvKBHNYtiqpuIO2GWtFib2KGgX/avCoA0qjvjGJouo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773789577; c=relaxed/simple;
	bh=k3ZTJSuAUE4ZlJaeYMMQ/jM8ULAQ3DF1JYH+rCgaF7A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FH01q++qDCVsBv4quKpySbn/1hRfTT9YBjuHhaavAOLIfLnFCDKIO2DfDhi7xVHohmM2oQXMBKCF+1FfNusWrDZ0rJ/8N6daiuxhx1EcupE10uWT0Y/1nunRfxFnk5cWqgyfY4b66skCTive8JJYtxVQgZl5O55GAirqYjnG0Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ROU3KBKY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 66D41B3;
	Wed, 18 Mar 2026 00:18:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773789501;
	bh=k3ZTJSuAUE4ZlJaeYMMQ/jM8ULAQ3DF1JYH+rCgaF7A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ROU3KBKYIqlosSfKiAwpMjWN3pD1cZo/vam7YhM/fu64WfZqaOZLsu6v2N1SEMTLS
	 uo9Cy67mWiPLxyhM2ZwyS2quTU4ujcKD6ztZ+tKAFb/c06BRHS1fzISHouiPu1l/jo
	 0JPGR2zgO4S/GtukkQi0I4U21/P3JX1cl/fxdG7U=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: [PATCH 1/4] drm: rcar-du: Ensure correct suspend/resume ordering with VSP
Date: Wed, 18 Mar 2026 01:19:27 +0200
Message-ID: <20260317231930.595719-2-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260317231930.595719-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20260317231930.595719-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-29700-lists,linux-renesas-soc=lfdr.de,renesas];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DE5EE2B451D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The VSP serves as an interface to memory and a compositor to the DU. It
therefore needs to be suspended after and resumed before the DU, to be
properly stopped and restarted in a controlled fashion driven by the DU
driver. This currently works by chance. Avoid relying on luck by
enforcing the correct suspend/resume ordering with device links.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c | 16 ++++++++++++++++
 drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.h |  2 ++
 2 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
index 94c22d2db197..a4a49dcd8233 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
@@ -20,6 +20,7 @@
 #include <drm/drm_vblank.h>
 
 #include <linux/bitops.h>
+#include <linux/device.h>
 #include <linux/dma-mapping.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
@@ -458,6 +459,9 @@ static void rcar_du_vsp_cleanup(struct drm_device *dev, void *res)
 
 	kfree(vsp->planes);
 
+	if (vsp->link)
+		device_link_del(vsp->link);
+
 	put_device(vsp->vsp);
 }
 
@@ -482,6 +486,18 @@ int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
 	if (ret < 0)
 		return ret;
 
+	/*
+	 * Enforce suspend/resume ordering between the DU (consumer) and the
+	 * VSP (supplier). The DU will be suspended before and resume after the
+	 * VSP.
+	 */
+	vsp->link = device_link_add(rcdu->dev, vsp->vsp, DL_FLAG_STATELESS);
+	if (!vsp->link) {
+		dev_err(rcdu->dev, "Failed to create device link to VSP %s\n",
+			dev_name(vsp->vsp));
+		return -EINVAL;
+	}
+
 	ret = vsp1_du_init(vsp->vsp);
 	if (ret < 0)
 		return ret;
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.h b/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.h
index 67630f0b6599..a6731249db34 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.h
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.h
@@ -12,6 +12,7 @@
 
 #include <drm/drm_plane.h>
 
+struct device_link;
 struct drm_framebuffer;
 struct rcar_du_format_info;
 struct rcar_du_vsp;
@@ -26,6 +27,7 @@ struct rcar_du_vsp_plane {
 struct rcar_du_vsp {
 	unsigned int index;
 	struct device *vsp;
+	struct device_link *link;
 	struct rcar_du_device *dev;
 	struct rcar_du_vsp_plane *planes;
 	unsigned int num_planes;
-- 
Regards,

Laurent Pinchart


