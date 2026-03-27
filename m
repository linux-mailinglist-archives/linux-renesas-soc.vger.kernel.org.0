Return-Path: <linux-renesas-soc+bounces-30444-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aIsqMuvCxmm8OQUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30444-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 18:48:27 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 739AB348989
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 18:48:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA21F310A1A0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 17:43:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98BD33FE653;
	Fri, 27 Mar 2026 17:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hgm7UYpM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CF83FBEAE
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Mar 2026 17:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774633377; cv=none; b=Gb+fkvXT0lUZEH2cJxPQP8uY2qpqfLbICWdLDuJUxjwpWpK3sQCXaYJSOcYyrC/ZXp1Ah1gDdKMk4z67FjE4V3M4E8tIiyhzmafNrqIU73eWHagnM1tCd/QGLZ6jQWf9tNc9xa8+68gOVx7rLmWMNEZfxIXxiZ+EK97awnCR7vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774633377; c=relaxed/simple;
	bh=t4SSfXHIac8jCT5bDwrO5IN+FDjym5opOhoaI0NA79E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iBp8KTvPjfT+vg3bUeuQx+F/mVHN3R7U72+HIaLYR/Uba4SkHh5EQTRcuf0QHlU9r1qXvmA3TeKbtDAb8VT6rNM1/UI7r4yGzy0OnLy0n/dqFPX1ZsxOHdnRRzh0V2cGRIJfNtmcq5C4BqgQOpRzkRHuzcrQjg/PZZMrTcA417E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hgm7UYpM; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso21637105e9.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Mar 2026 10:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774633371; x=1775238171; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=90Ymw5BXIdj4erWp17W/x/NFuWNsVOK/0ZIwzA/B/wI=;
        b=hgm7UYpM3Lr3OHlGDFV0Nzbv9iCdjypfeK1yE8VtgICwuCn9gPYtvENpISWS8vnC+4
         rgoZE1WCCaMOyQahyD9H97l22LkjKig05wi5sxbYaq4NKQytg/J2qRplZnQ4NGquBHn5
         AsG+53O3JIJifs47eEFJc5r7LrFA+jvQ4dWLiZRb+ImPZMw8M92IsFC35/sfO8GdUOQJ
         kylDAlsWembYcrXQifaqAZD18b8U6A5UGSDTvlqXeLbEihDo5D6e48G4LAVZ0QIJog75
         itB5sCEb3VJAUO86ORJ+3GpxKUEwzISuJGj79VWxNVl85J7/X6yz7L/x+pUER6OQwd5G
         vvUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774633371; x=1775238171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=90Ymw5BXIdj4erWp17W/x/NFuWNsVOK/0ZIwzA/B/wI=;
        b=ilSsnTlVOaHZSdhE/Tq0IsApa06S3ICZ0XIlFOMYSybqgJ1zq2jcG7+hbZ18aQjkIi
         yGNWrvEEMI55WylvHNNre1ntxWPXnsDCX5Nwjv+SzC6bxwcTV1s4b1MAzSuH5xWCf1El
         BrcOKwtKevb9LVXz344KSRnLGDwuAeg8sJJXDGzQuuq4CkaRgum4ZvbapMnDfgiwYX04
         i9t1xJMkp2aziKckfur2QHW8G0N/9zEjZxnZTxx9VoK9rcZkRuSxmkY5cbGqx/Z7BIfG
         D2LtGxfu+qxxrJ4U960TM+R25tsux3LAyoqD8MFqGSNCx48qgfdSsBklu6BetjNdlupQ
         Kd4A==
X-Forwarded-Encrypted: i=1; AJvYcCXifuXu3qDTB2G6YhNidwxZZ2UgFtTQKeLrsaaWtzpHEUXBixWcN5eMhXFrlghcUXWwE7rEIU1pgSh6m301ALzJMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yymlm2Nm4AXftNIBbrD3lhMX10ShFE1qFRCkUBkZj07UZOBTsNW
	h2N4VGP9URWv5dttxpDEKnq55FkcjxM0djTR5i/NInZAXWbZa2z8rFYb
X-Gm-Gg: ATEYQzxBHV+xeKX2DORBl9KPOmrprQ/WDslsS1lcJbbR7fR0tFTv60cLV752XnwehBt
	WpMyoc0ui4OwyGO8ZDcKjfBK4JD0qx1LSMx3URX3q8VdnhSUjQJGaNFFR0NSmxOQLpzV2W/ysxq
	OtpH4Y5IzEuAYWkFGgr7CCmNa4Jq0jC+0JfDWS0NgsaBVmx0eikzA7igmv52B00esmzj7sXBeMD
	0fIS//OwbWfsRT9fvv7DXfKXOFKOgJeAUz9ks/sq7iR1zw0jINIbL74Ag2HQKrIhfBX5dObQOMY
	Vi4IT/szamF3WmJ90qW/3y1qqUv/O/FBnipofhbEEPHiedBzT35obhX0tU3S0uLyiR7x0KhGtnB
	kMa4ei3pUBPnhMy7J2H98hkGMKkhqSFxz41X5VzoAa0RSmXDGbehSwEH5CSm15Bgdmv0G00EaCb
	5Ri3PAcja9BNMCPXfcYVPDlvcXfVAIsOcYxSA3k2WBWt4xUwkgQXFZ5IKcUx5gNupe931yovmIg
	G78vuWOJaa4B8PVqV3VxmlMmaqGMcYl3LA67gsJjeNueUo=
X-Received: by 2002:a05:600d:7:b0:485:439b:683f with SMTP id 5b1f17b1804b1-48727f5fe73mr44646895e9.20.1774633371241;
        Fri, 27 Mar 2026 10:42:51 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:cad3:5596:28d0:27e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9192e528sm15965933f8f.1.2026.03.27.10.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 10:42:50 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 3/3] memory: renesas-rpc-if: Add support for RZ/T2H SoC
Date: Fri, 27 Mar 2026 17:42:45 +0000
Message-ID: <20260327174245.3947213-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260327174245.3947213-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260327174245.3947213-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30444-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com,bp.renesas.com,sang-engineering.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,renesas.com,bp.renesas.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: 739AB348989
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add support for the xSPI controller found on the Renesas RZ/T2H
(R9A09G077) SoC.

The xSPI IP on RZ/T2H is closely related to the RZ/G3E variant, with
minor differences in some configuration register bits. As these
differences are not currently exercised by the driver, reuse the
existing implementation and regmap configuration.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Added xspi_info_r9a09g077 for RZ/T2H with type XSPI_RZ_T2H instead
  of reusing xspi_info_r9a09g047 with type XSPI_RZ_G3E, to allow for
  better differentiation in the future if needed.
---
 drivers/memory/renesas-rpc-if.c | 11 ++++++++++-
 include/memory/renesas-rpc-if.h |  1 +
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/memory/renesas-rpc-if.c b/drivers/memory/renesas-rpc-if.c
index 3755956ae906..347650698424 100644
--- a/drivers/memory/renesas-rpc-if.c
+++ b/drivers/memory/renesas-rpc-if.c
@@ -211,7 +211,9 @@ int rpcif_sw_init(struct rpcif *rpcif, struct device *dev)
 	rpcif->dev = dev;
 	rpcif->dirmap = rpc->dirmap;
 	rpcif->size = rpc->size;
-	rpcif->xspi = rpc->info->type == XSPI_RZ_G3E;
+	rpcif->xspi = (rpc->info->type == XSPI_RZ_G3E ||
+		       rpc->info->type == XSPI_RZ_T2H);
+
 	return 0;
 }
 EXPORT_SYMBOL(rpcif_sw_init);
@@ -1142,9 +1144,16 @@ static const struct rpcif_info xspi_info_r9a09g047 = {
 	.type = XSPI_RZ_G3E,
 };
 
+static const struct rpcif_info xspi_info_r9a09g077 = {
+	.regmap_config = &xspi_regmap_config,
+	.impl = &xspi_impl,
+	.type = XSPI_RZ_T2H,
+};
+
 static const struct of_device_id rpcif_of_match[] = {
 	{ .compatible = "renesas,r8a7796-rpc-if", .data = &rpcif_info_r8a7796 },
 	{ .compatible = "renesas,r9a09g047-xspi", .data = &xspi_info_r9a09g047 },
+	{ .compatible = "renesas,r9a09g077-xspi", .data = &xspi_info_r9a09g077 },
 	{ .compatible = "renesas,rcar-gen3-rpc-if", .data = &rpcif_info_gen3 },
 	{ .compatible = "renesas,rcar-gen4-rpc-if", .data = &rpcif_info_gen4 },
 	{ .compatible = "renesas,rzg2l-rpc-if", .data = &rpcif_info_rz_g2l },
diff --git a/include/memory/renesas-rpc-if.h b/include/memory/renesas-rpc-if.h
index 53663c4e5ae3..39810d2db095 100644
--- a/include/memory/renesas-rpc-if.h
+++ b/include/memory/renesas-rpc-if.h
@@ -62,6 +62,7 @@ enum rpcif_type {
 	RPCIF_RCAR_GEN4,
 	RPCIF_RZ_G2L,
 	XSPI_RZ_G3E,
+	XSPI_RZ_T2H,
 };
 
 struct rpcif {
-- 
2.53.0


