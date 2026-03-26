Return-Path: <linux-renesas-soc+bounces-30393-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLpyOPqTxWmq/gQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30393-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 21:15:54 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 899B433B51A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 21:15:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 07E46303F7E0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 20:10:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C151C378D71;
	Thu, 26 Mar 2026 20:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FqCVBGgj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54CC2371046
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 20:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774555830; cv=none; b=Ku2XFTu0rJStoypAYUK7+iuW7s/JMDj054c8VuKRE3MHksIH5ijkN6kQyMITzV3Xy8En6KoKbHNYah3hErKpoH+uwYM0tD8y3BrqIM7T87HXoGNFCOZJmEKAFn3Gu1JRw4DPBZF/oNfoGZGcL/lb/RAmlzKubzIQpE7C6ZyzVQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774555830; c=relaxed/simple;
	bh=wVpCKFixwVvIFTAExhaQlW8sEoNllF0+EqWgRpRXDjM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=WtuaIMSbp6r4M7BmYaifBrAXBqNg+B6il7dtBmjhxJTQYAEZtOVfGgl+Ohux3zhyswyyvufVvDVcFeqb4a2CUkHE9iE1Sbf6V0CQbzSBIqcNJbKvEjeXm388XFms2cypajN+F85ELiCwRh9opBftgcjFS6uFwX2/yjaaEDSB9Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FqCVBGgj; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-439b9b1900bso865918f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 13:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774555828; x=1775160628; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IZlpFAd1bDLyyk1KJZ+xsptLXG1EfpfxvxYR58kTEMk=;
        b=FqCVBGgjAvfVRFysBs9x5BT0qFwGQhfH41KlzUt0UqGwNb38XJ/iLubToyONdlp6Ay
         McP2k/pTYChwTpKkdL4lBf0sVPvHJoIAnbSmGHzkXnxloNO85Nft7jwNOnkN4vGqigTB
         C1YnOiTFdx4YtPsqZj6KLvttl5SqWXqwfM1PRoE+Sp3bmHsk43shtyxCQ1UT58VtZNs2
         yqzqJWpvAKQmgs81UoXXEOvMgP2Fx4b0RIcK7cbk7SVfDma1hbCNUXNQRqmpCvCImzyj
         OmrEdZqSDXMX4Z1/TIMhUtapZUHvn+sid0WIxEgkCaUL+qaZlAAcrqIGKS9j3ej96sG+
         2S8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774555828; x=1775160628;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IZlpFAd1bDLyyk1KJZ+xsptLXG1EfpfxvxYR58kTEMk=;
        b=MKsMPYFCZKK/94AXFcsatGseKlPL52wNljU16gsE+DHHYIJF7kJ0JkAxDhIvC+uAa/
         mH0WQh6maf78Ygt95iTZFmATldfOTx3AkwbvWxEa9DIDUBN3yOC5lj7szfEnQAvxzYeL
         R/3dHYSUaJA/ouvStm1QVz19sVLKfjwNKNPXnOV9whHFJaS4Nvu9+uTTSU0Hc8IhcUG8
         Ce3zb1SkvvBJzWiUotj+WONItHDoGJLwpoHJS/YqIx/SYOKXCEi2//KWLKbW3Lc63eQG
         DvWsB8F8e0b0/wnHtuRRUFvAldjwRMzp+licOkGMm8UxcjU1cutZMfFdwXJGOKo9tEu7
         Cvpw==
X-Forwarded-Encrypted: i=1; AJvYcCWbGA4hsOnZl9ZjKPkVvuuv574gSQMmEAWZoOkI6UclZ/DLUZsUwICydy0NlwoD8bmPxSfedSE80miunOdIxe37VQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwygcT4BJGUQhQ7Ja4hPGhrpAcrIH9Nbt5x7LZ8+lpVlLcaZRA2
	2IQyNnI25K44A5rpfwUdmPQ2vkY4FLfQV7q1Lwd9K5zb3k8qRegFVkHI
X-Gm-Gg: ATEYQzyToekXdZS2IOfQsXwDzY9BVYzi2vOHILfRUdtygME6JQSP65aBNfWsw0/hY4C
	0u7iWlOFGWjvC7oS3nfDx2K05aG5/rRHreOXwW3lQmbVvh1imTiTByMV5hGSy7lizKBW87GhZie
	968lJo2hHo4MFNr++a7IJ45k1N9UhYzCVzsqxDyk66KcUB7AeTZ6p2Fe5H6Bx3NIYsY64ZLF7cf
	UD+jL5EtT3XwXd/yY3ZzO9/vJxutgjsBZKgDCIc0vaUaJ2eLwINx8atigzKIL3db66i+R2UeyeX
	5Umi1dJ5tq5CMM03OkmDoYP9C4185KllK9NUqkL+W8hjkCNip1ZyhRNQydDF9AZCqKDxhE8PeeN
	xcodISl4KVURDQZ4Ys/ao54xpB41DeSt1O3j4av3DBfF4p++/WSkv93uFHvwI/0WsmgcyZGw3aI
	1U0+VllT5Et9+QdNnAf7ZP0IT/uKb6qHma9+IfEHdHOn8=
X-Received: by 2002:a5d:55c5:0:b0:43b:8f30:39bb with SMTP id ffacd0b85a97d-43b8f303a7cmr8813334f8f.24.1774555827404;
        Thu, 26 Mar 2026 13:10:27 -0700 (PDT)
Received: from Gattout.localdomain ([90.90.41.97])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919e265csm10770027f8f.32.2026.03.26.13.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 13:10:26 -0700 (PDT)
From: Amin GATTOUT <amin.gattout@gmail.com>
Date: Thu, 26 Mar 2026 21:10:15 +0100
Subject: [PATCH] drm/rcar-du: Convert to of_drm_find_and_get_bridge()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-bridge-v1-1-c0c44b53f7b6@gmail.com>
X-B4-Tracking: v=1; b=H4sIAKaSxWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYyMz3aSizBSgqIlxanJSapplirFlmhJQcUFRalpmBdig6NjaWgBFnDL
 LWAAAAA==
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Amin GATTOUT <amin.gattout@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774555826; l=1018;
 i=amin.gattout@gmail.com; s=20260326; h=from:subject:message-id;
 bh=wVpCKFixwVvIFTAExhaQlW8sEoNllF0+EqWgRpRXDjM=;
 b=NOKuhLSsAxhcL7CZTAmS43VqHadaUFxCot50JKLhaF/LiRNsS4QcEfHbcCYKI6z/LSfPXY+oo
 QGuxg8H3aALAtJWx74ppTozTdm+121TGPzcE2tPYIMjI9MWPEAQLVpP
X-Developer-Key: i=amin.gattout@gmail.com; a=ed25519;
 pk=BnWtaSL6rBEMWInyLFWt97n6yImdAKsf/0S5K7jcwQI=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30393-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[ideasonboard.com,linux.intel.com,kernel.org,bootlin.com,suse.de,gmail.com,ffwll.ch,glider.be];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[amingattout@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 899B433B51A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

of_drm_find_bridge() is deprecated.
Replace it with of_drm_find_and_get_bridge() which increments
the bridge refcount as required.

Signed-off-by: Amin GATTOUT <amin.gattout@gmail.com>
---
 drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c
index 7ecec7b04a8d..42253c1251b5 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c
@@ -72,7 +72,7 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
 		if (IS_ERR(bridge))
 			return PTR_ERR(bridge);
 	} else {
-		bridge = of_drm_find_bridge(enc_node);
+		bridge = of_drm_find_and_get_bridge(enc_node);
 		if (!bridge)
 			return -EPROBE_DEFER;
 

---
base-commit: d813f421930c5b01b9f61043932de02602dd6ae3
change-id: 20260326-bridge-43ecbef9d39f

Best regards,
-- 
Amin GATTOUT <amin.gattout@gmail.com>


