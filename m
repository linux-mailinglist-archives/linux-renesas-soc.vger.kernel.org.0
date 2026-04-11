Return-Path: <linux-renesas-soc+bounces-31183-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mID/GZo02ml9zAgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31183-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Apr 2026 13:46:34 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F7F3DF95C
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Apr 2026 13:46:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AF36E304217E
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Apr 2026 11:44:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0558335E95F;
	Sat, 11 Apr 2026 11:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="aR2uSJiy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6876935B659
	for <linux-renesas-soc@vger.kernel.org>; Sat, 11 Apr 2026 11:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775907822; cv=none; b=PFZpVLNKC7ycqKCrNolqhkQ0fXb2mO9NAXcnPa1I6BELCwdw389pzrBY/vO9ixYdUz4OqY4gwiYOY7d4wEL6SE73dRFvdUBOZgW0KTxcFNTj5N3049IIWF058WvITTHYrDfhT8P8B2vqm9+FRItzQjRi1SbyqPap5hoRQFbh31c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775907822; c=relaxed/simple;
	bh=00agU9G8WCwFdL8wNmeE5/RI+LQevLHKH0zoSbPnvhI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MftBpO+kOIQdw3wV0pxiCbjAbQ5ZQ3y1viIHLTNCPyusWoVSr5TPpNAYZcyQhr5Oj+q74AB12c+J/YjNMAIyrkbCfRXbheCxIUSuE35I1U1MoSA6kF6x3D1EI3ox8xoRMKMohTTYf7HMjCBcjF5gTJs1Z49FN6y4ESkHeQcR+xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=aR2uSJiy; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43d0deb7ad5so2199831f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Sat, 11 Apr 2026 04:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1775907820; x=1776512620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=woi0lrK3i2kpcKywf5o3X0tfp9llXfvPOtNyhrNBRjY=;
        b=aR2uSJiyLT6jmwBC3UH6WcfEo4IK6ecwdENClhaWAE8OcMX2Qiug9EqrsvgpYVJGVc
         zjdpK19ssdSr/KKwrSrTYiHPIBJzL59S1aNHGw5vS1XlY1y0PD2c0BdBkXpS/gC/8PLM
         XfRB6JC6lK3hlu5S+72CT6foKn880JNNQXQ6lqjIhzMvpnavRgiyqup/ZZURyM8P5xOz
         DuWEU0irOKUhCuNd+lneHGGGICr8iqau0A73S9s2/bKwTJvTMbjKMk7U9UK9gXxFGoPK
         g6fDAvDW7Zz3gCCY9JWgKD7YVr+ADGCwDXFTP4AM2hSR/I9vCv78xsFCZaqbw/Y7csqE
         3C+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775907820; x=1776512620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=woi0lrK3i2kpcKywf5o3X0tfp9llXfvPOtNyhrNBRjY=;
        b=DV3+wyXBPcpNd7N6ZZHPijT+Cf4bmvzzAONE7Yjba9HS/7TpHslzZUNl/wweQfYDa8
         nkIpYj+ObwmeS9QQWeuE+eDt3nVYiKh2w2KE8UJO7fAg9Gt/1T1TofyJDOZHWdGNE0iy
         L/lON7Gxc6iqg4EySx/nKuXJ+xfcvHY7j78amWxwVRLPTtDZcssMxZx60YmcvyNU+Wx4
         jL9Yt1C7PJ4xAy7R0xjYTSmPIBKGkdh6aG2J2OFG5yyhb8Gsfup0R0YEvSZPerK1E3dP
         oc1ZnKu03/3X7iZehOTl6tdRCxe0ukFqUovgp9IZXLyrRiDc9WQs96jMgLd0/2elvPWJ
         iEAg==
X-Forwarded-Encrypted: i=1; AJvYcCUvWa+vIK+NNWKoPtx/Llcad0/gih1dMs4EnVIsTPsV1ahNPB0ZO+XkJrEeUbOM2vvw7TIYmOGkyfc/WWzHuC+0iQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKZiXBleSV8dZmaMnl6OpeiKtP3D2EaPbem9UoS3F9DJ6mwEIu
	wTheyNs483S41w3hvdgmSK9f2Go4IbCuMZgYrUseKxEfE1UYWEg5nljRxk/s2uqtH3Q=
X-Gm-Gg: AeBDiesRS9RJxPANzsCqbTWiMV72n44X35DEVI/Rfp0fB+bd81L2ek8D11cp7oeKP28
	RAJbjjbas8qp0CYqiwYveiswFoh7lRC6PJ5XBoynM9LfXKmP6PvPSFW7qgkRyS2u1A6MePeuLr7
	l171T8ZLy/SPr4+eH5efNRlUbF7Mjc+mG3y3qr2SFZpBayeZ1eFuIgqR0s5dDpbZ4SOL+RBRlhJ
	aXBPMrKrYYaFvHjrzSNB+woFjvWJX/8OQzmvuLp7tCPpjvRk7SDWx+7tqKHUz5ORWnRBmrZNF6j
	Fugl+SlcT37p4O+4xf20YlCzkQAXZ1/BydOiJiIUpGYNM+etR84paY9x8ulaZXn32oTCStANjZ7
	9C86jZ6Cg/oZcTlyxhj+UT9EhgxcCMOob58p/PC5prblvk52Ap9lF6Jwa9wX5blyUYtgHBMWV/I
	yPtJ6u7BMGRope+5mIfGXIHk4jDI+vIuISSXkYIWj0JGBYCYfYSwcDuA2JCvc37pA=
X-Received: by 2002:a05:6000:420b:b0:43c:ff3f:c635 with SMTP id ffacd0b85a97d-43d642b188amr9465975f8f.34.1775907819734;
        Sat, 11 Apr 2026 04:43:39 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5c981sm15776447f8f.33.2026.04.11.04.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 04:43:38 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: vkoul@kernel.org,
	Frank.Li@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	fabrizio.castro.jz@renesas.com,
	long.luu.ur@renesas.com
Cc: claudiu.beznea@tuxon.dev,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 17/17] dmaengine: sh: rz-dmac: Set the Link End (LE) bit on the last descriptor
Date: Sat, 11 Apr 2026 14:43:03 +0300
Message-ID: <20260411114303.2814115-18-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260411114303.2814115-1-claudiu.beznea.uj@bp.renesas.com>
References: <20260411114303.2814115-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[tuxon.dev:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31183-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[tuxon.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com,bp.renesas.com,pengutronix.de,glider.be,renesas.com];
	DKIM_TRACE(0.00)[tuxon.dev:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bp.renesas.com:mid,tuxon.dev:dkim]
X-Rspamd-Queue-Id: 46F7F3DF95C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

On an RZ/G2L-based system, it has been observed that when the DMA channels
for all enabled IPs are active (TX and RX for one serial IP, TX and RX for
one audio IP, and TX and RX for one SPI IP), shortly after all of them are
started, the system can become irrecoverably blocked. In one debug session
the system did not block, and the DMA HW registers were inspected. It was
found that the DER (Descriptor Error) bit in the CHSTAT register for one of
the SPI DMA channels was set.

According to the RZ/G2L HW Manual, Rev. 1.30, chapter 14.4.7 Channel
Status Register n/nS (CHSTAT_n/nS), description of the DER bit, the DER
bit is set when the LV (Link Valid) value loaded with a descriptor in link
mode is 0. This means that the DMA engine has loaded an invalid
descriptor (as defined in Table 14.14, Header Area, of the same manual).

The same chapter states that when a descriptor error occurs, the transfer
is stopped, but no DMA error interrupt is generated.

Set the LE bit on the last descriptor of a transfer. This informs the DMA
engine that this is the final descriptor for the transfer.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- none

Changes in v3:
- none

Changes in v2:
- none

 drivers/dma/sh/rz-dmac.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c
index 00e18d8213ca..f5d2e206f4bb 100644
--- a/drivers/dma/sh/rz-dmac.c
+++ b/drivers/dma/sh/rz-dmac.c
@@ -200,6 +200,7 @@ struct rz_dmac {
 
 /* LINK MODE DESCRIPTOR */
 #define HEADER_LV			BIT(0)
+#define HEADER_LE			BIT(1)
 #define HEADER_WBD			BIT(2)
 
 #define RZ_DMAC_MAX_CHAN_DESCRIPTORS	16
@@ -382,7 +383,7 @@ static void rz_dmac_prepare_desc_for_memcpy(struct rz_dmac_chan *channel)
 	lmdesc->chcfg = chcfg;
 	lmdesc->chitvl = 0;
 	lmdesc->chext = 0;
-	lmdesc->header = HEADER_LV;
+	lmdesc->header = HEADER_LV | HEADER_LE;
 
 	rz_dmac_set_dma_req_no(dmac, channel->index, dmac->info->default_dma_req_no);
 
@@ -425,7 +426,7 @@ static void rz_dmac_prepare_descs_for_slave_sg(struct rz_dmac_chan *channel)
 		lmdesc->chext = 0;
 		if (i == (sg_len - 1)) {
 			lmdesc->chcfg = (channel->chcfg & ~CHCFG_DEM);
-			lmdesc->header = HEADER_LV;
+			lmdesc->header = HEADER_LV | HEADER_LE;
 		} else {
 			lmdesc->chcfg = channel->chcfg;
 			lmdesc->header = HEADER_LV;
-- 
2.43.0


