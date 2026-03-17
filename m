Return-Path: <linux-renesas-soc+bounces-29702-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SD1hFJbiuWmnPAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29702-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 00:24:06 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0A92B4443
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 00:24:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E379F300CFF7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 23:19:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F6713195EA;
	Tue, 17 Mar 2026 23:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pzcr9M9t"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A300D2D7DF3
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 23:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773789580; cv=none; b=IEYGVqHv/hw8cbSvKNAJSo/xMjogf8M3kMl70nqyoq3AMDybEsuo4YIgG4r7jr+ec3mH+gODhkvUElDm1J7/zocKo9z9ll+yBB8R4BSm0QkjEG2lNC9lq13MggNhMd1O2kS36C0yCJEgcQvofsWo2wFJOLfEg4xUq+iM3xO6VsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773789580; c=relaxed/simple;
	bh=KV8jqEFhaHfQRq9P+VG4/SCumEfR8TaE/ef//TFBllg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QFHVYG+xoNZcoeBg4Yeh3P+pYxSoXvbvWPix37wkBMzzc2bkVh/vreffckOO7RP+W8LSNnONc1HX3SPW7Om6T2PApeWJSL8Hq2bL0+Tzu2KlyhU7of6+9KIyisFzjAQnvS2Uk4FGeLzF37iGaENqn7o48SVWXJ7sha9C4z7kTLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pzcr9M9t; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 02BF9DA8;
	Wed, 18 Mar 2026 00:18:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773789504;
	bh=KV8jqEFhaHfQRq9P+VG4/SCumEfR8TaE/ef//TFBllg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pzcr9M9ty/SlD0G2mYfXg4nQI0gFsfBJuAmNACJrlgzEgA2FpCwq/Gzz/qrd/FyG2
	 274gXdVGv8Tbpm2zojflg3LzMTkc2VEBTNqqBtIKs//GZ7siwRJCjNTp0U5+4A0mIx
	 D/rmvWQhy5vmwMYwSIntYaKsoUU6QTYli4GKIpw8=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: [PATCH 3/4] drm: rcar-du: Use __free() to simplify device_node handling
Date: Wed, 18 Mar 2026 01:19:29 +0200
Message-ID: <20260317231930.595719-4-laurent.pinchart+renesas@ideasonboard.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-29702-lists,linux-renesas-soc=lfdr.de,renesas];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid]
X-Rspamd-Queue-Id: DE0A92B4443
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Replace manual of_node_put() calls with __free(). This simplifies error
handling code and makes it less bug-prone.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c | 25 ++++++-------------
 1 file changed, 7 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
index f38e45d38ad2..9a53b5a86c82 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
@@ -19,6 +19,7 @@
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
+#include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/dma-buf.h>
 #include <linux/of.h>
@@ -573,7 +574,7 @@ static int rcar_du_encoders_init_one(struct rcar_du_device *rcdu,
 				     enum rcar_du_output output,
 				     struct of_endpoint *ep)
 {
-	struct device_node *entity;
+	struct device_node *entity __free(device_node) = NULL;
 	int ret;
 
 	/* Locate the connected entity and initialize the encoder. */
@@ -588,7 +589,6 @@ static int rcar_du_encoders_init_one(struct rcar_du_device *rcdu,
 		dev_dbg(rcdu->dev,
 			"connected entity %pOF is disabled, skipping\n",
 			entity);
-		of_node_put(entity);
 		return -ENODEV;
 	}
 
@@ -598,15 +598,13 @@ static int rcar_du_encoders_init_one(struct rcar_du_device *rcdu,
 			 "failed to initialize encoder %pOF on output %s (%d), skipping\n",
 			 entity, rcar_du_output_name(output), ret);
 
-	of_node_put(entity);
-
 	return ret;
 }
 
 static int rcar_du_encoders_init(struct rcar_du_device *rcdu)
 {
+	struct device_node *ep_node __free(device_node) = NULL;
 	struct device_node *np = rcdu->dev->of_node;
-	struct device_node *ep_node;
 	unsigned int num_encoders = 0;
 
 	/*
@@ -620,10 +618,8 @@ static int rcar_du_encoders_init(struct rcar_du_device *rcdu)
 		int ret;
 
 		ret = of_graph_parse_endpoint(ep_node, &ep);
-		if (ret < 0) {
-			of_node_put(ep_node);
+		if (ret < 0)
 			return ret;
-		}
 
 		/* Find the output route corresponding to the port number. */
 		for (i = 0; i < RCAR_DU_OUTPUT_MAX; ++i) {
@@ -644,10 +640,8 @@ static int rcar_du_encoders_init(struct rcar_du_device *rcdu)
 		/* Process the output pipeline. */
 		ret = rcar_du_encoders_init_one(rcdu, output, &ep);
 		if (ret < 0) {
-			if (ret == -EPROBE_DEFER) {
-				of_node_put(ep_node);
+			if (ret == -EPROBE_DEFER)
 				return ret;
-			}
 
 			continue;
 		}
@@ -775,9 +769,9 @@ static int rcar_du_cmm_init(struct rcar_du_device *rcdu)
 	}
 
 	for (i = 0; i < cells; ++i) {
+		struct device_node *cmm __free(device_node) = NULL;
 		struct platform_device *pdev;
 		struct device_link *link;
-		struct device_node *cmm;
 		int ret;
 
 		cmm = of_parse_phandle(np, "renesas,cmms", i);
@@ -787,21 +781,16 @@ static int rcar_du_cmm_init(struct rcar_du_device *rcdu)
 			return -EINVAL;
 		}
 
-		if (!of_device_is_available(cmm)) {
+		if (!of_device_is_available(cmm))
 			/* It's fine to have a phandle to a non-enabled CMM. */
-			of_node_put(cmm);
 			continue;
-		}
 
 		pdev = of_find_device_by_node(cmm);
 		if (!pdev) {
 			dev_err(rcdu->dev, "No device found for CMM%u\n", i);
-			of_node_put(cmm);
 			return -EINVAL;
 		}
 
-		of_node_put(cmm);
-
 		/*
 		 * -ENODEV is used to report that the CMM config option is
 		 * disabled: return 0 and let the DU continue probing.
-- 
Regards,

Laurent Pinchart


