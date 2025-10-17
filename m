Return-Path: <linux-renesas-soc+bounces-23246-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A829FBE9ED3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Oct 2025 17:33:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 555BA5A07EC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Oct 2025 15:21:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C820E3328F2;
	Fri, 17 Oct 2025 15:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LagN8xJN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301CB2472B0
	for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Oct 2025 15:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760714378; cv=none; b=aYfjgmaqmC7L7FScZtdE/y9ZHn1gCsrBDKgSJEokBMPubhniSVwcbQm/iOEcNJjmfbvJvSh3NsGFtKePo6nQQgLmq4nZsBMYvmkPtUz7t5LbViKd/wt6RDY84jRo9Frun2FRUmmFZXn2JFyduNGxqpNFxpoRTnjA9rScopIUTM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760714378; c=relaxed/simple;
	bh=30hY9VGZfgPtebi29fjNHxTGYZKsq/orJOz7VuvML8I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YNqnOL26VM5KCB29MWeBOeqW5zDGk4215Z0S2TTmzUQQFbNbnE+OX22sloejVB1fmhcyRKyt4rtFkvBRDhvrXC5q6F+kRkZGdakNURyR/MEzFhF9hyqsGLVpIYVPLrwtvFRx1tDNpkXnI9VBwDYJj2J3FDLRQaZELhMddUA3o/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LagN8xJN; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2697899a202so22377905ad.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Oct 2025 08:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760714376; x=1761319176; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M7I2zMxiqw9nCosgHfAG52KOx4TPHBq8RCQsUTlA/+E=;
        b=LagN8xJN898QlM/NaatEe3nqw8GLr2aFGZf0fyZx4rGbkvUSemCzrNSl1rl4eMUT76
         IAoYJTV+SpVh/ZEcVAu2dcp90yppUM+XnsfF97ef1zE2Kz7ykzuMTXaeMM1VFAMriu6Q
         EfcvlPwXXzzXuZyEHL5kgUYHcRK72X/T7MLaGFOoiQWRHzg4num4E3bOBn4BL89uNvai
         MsyjU32JZ9Mot8CX7LnJgKL6eK5RQJeIgqizWY/Lr6s4qg/Fa6TQEDuKUvKgYjeRVjxK
         rgmh7mkPeKcQ4EVxhXEv7gpOWvIkkAet+hlvVD6GVfL8MdtL9zpxdP/khBUcr8oXGXNM
         ZTTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760714376; x=1761319176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M7I2zMxiqw9nCosgHfAG52KOx4TPHBq8RCQsUTlA/+E=;
        b=SAbBYNyeyPNrh15Ynfp79Y0rmuZjW7kZPTu+CeDf/9DKafeh3E8MyifsdADy8K3UES
         t2eydcbLGlG7h1spXhqJS1YpX+EJj55pmKW09BO019LRHaVndxkVdTPs3qkXCtbDXQPJ
         E7qXpNSXhkr0Ve0J0up0wn0Oe/WHAqNww18kew4pSTO9FTppFXw6Qv7gTRQx8pHwD2Je
         v94/8NM8V3Q/vH12jKPzS08fvjluRKqMH2jneCkzKKRLgMT3jhj+O9oyhVEOZjEtn7Tf
         2Em7hW6eFuFRhfrFx0xiA1ZeiV6GNFBDQbjga3zJh3sy+QyFV8AA5OSs0dDV2htGbuR1
         gWfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvePLJq0in+55hRbHJgWEraEp5wa/2NgItmP7NANyIojdsrdODMS10SCjFGVak0gKTbggg1D1k2C6vJvNGqCOC/A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+NZogTm6OEcYtxcUaU9ZZ6KH8Dr3HJsLAkzARIDEXag39S24z
	pD0ITxKrxrkmrCChRK/JgxEeZnQQz9iFEnmJUT6WE2kTZnb3U9v/9dFM
X-Gm-Gg: ASbGncu0V8ZK1mhGO7OvNq+AEWP6RYj7M1UTUQjydPepNBAg/DldaefPPqR3qzn7TyC
	2pRRY9gLKQIgDs72+zdxkA/RtK0U9wzdwBba4BzMQ1TAlIax0SEai96a+mrmFK0+OiuRki+zwYo
	kGuxhBoALunP4UrA7YZDtkzMQojwVwCFTKB1pKWQ24Vbut5IV+m62Y/tz2yT8Rt2z6K2cMUkUT0
	/uno3bel1tBOKSiceMETE+fB2JR4sufAW08K5hYDnprY17w5v2si11yqX+Hc+Qz6iXrurrDwPfk
	X0Bn1mKnCmClREly8LDYTOEC6dqjHEyNmn8RxK9fU3/YsfN7iUFVIVBTw8g/d+Mg05Gd1w+LiUc
	lLmoFDgAjPSKtJNeu6SrccZ10KABtbHFqLYJj6DyC1H2W+M0fMFOmGoGjXlR3Hmy127R2Jtasqm
	FbNhytL+qNfDUMJ8VuYv5BqmT7kCDlFaBE
X-Google-Smtp-Source: AGHT+IH0+48acCb/GQWZoQcUE6viuTtTcLkvy8Fj+MMDiu+Sba/GIsfY/hul5gd1I7tvE0KgRk6MoA==
X-Received: by 2002:a17:903:24f:b0:279:373b:407f with SMTP id d9443c01a7336-290918cbe15mr103570215ad.5.1760714376203;
        Fri, 17 Oct 2025 08:19:36 -0700 (PDT)
Received: from iku.. ([2401:4900:1c07:c7d3:fdc9:5e8f:28db:7f80])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2909930a756sm67193955ad.14.2025.10.17.08.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 08:19:35 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Paul Barker <paul@pbarker.dev>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Mitsuhiro Kimura <mitsuhiro.kimura.kc@renesas.com>
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 3/4] net: ravb: Enforce descriptor type ordering
Date: Fri, 17 Oct 2025 16:18:29 +0100
Message-ID: <20251017151830.171062-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251017151830.171062-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251017151830.171062-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Ensure the TX descriptor type fields are published in a safe order so the
DMA engine never begins processing a descriptor chain before all descriptor
fields are fully initialised.

For multi-descriptor transmits the driver writes DT_FEND into the last
descriptor and DT_FSTART into the first. The DMA engine begins processing
when it observes DT_FSTART. Move the dma_wmb() barrier so it executes
immediately after DT_FEND and immediately before writing DT_FSTART
(and before DT_FSINGLE in the single-descriptor case). This guarantees
that all prior CPU writes to the descriptor memory are visible to the
device before DT_FSTART is seen.

This avoids a situation where compiler/CPU reordering could publish
DT_FSTART ahead of DT_FEND or other descriptor fields, allowing the DMA to
start on a partially initialised chain and causing corrupted transmissions
or TX timeouts. Such a failure was observed on RZ/G2L with an RT kernel as
transmit queue timeouts and device resets.

Fixes: 2f45d1902acf ("ravb: minimize TX data copying")
Cc: stable@vger.kernel.org
Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Reflowed the code and updated the comment to clarify the ordering
  requirements.
- Updated commit message.
- Split up adding memory barrier change before ringing doorbell
  into a separate patch.
---
 drivers/net/ethernet/renesas/ravb_main.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index a200e205825a..0e40001f64b4 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -2211,13 +2211,25 @@ static netdev_tx_t ravb_start_xmit(struct sk_buff *skb, struct net_device *ndev)
 
 		skb_tx_timestamp(skb);
 	}
-	/* Descriptor type must be set after all the above writes */
-	dma_wmb();
+
 	if (num_tx_desc > 1) {
 		desc->die_dt = DT_FEND;
 		desc--;
+		/* When using multi-descriptors, DT_FEND needs to get written
+		 * before DT_FSTART, but the compiler may reorder the memory
+		 * writes in an attempt to optimize the code.
+		 * Use a dma_wmb() barrier to make sure DT_FEND and DT_FSTART
+		 * are written exactly in the order shown in the code.
+		 * This is particularly important for cases where the DMA engine
+		 * is already running when we are running this code. If the DMA
+		 * sees DT_FSTART without the corresponding DT_FEND it will enter
+		 * an error condition.
+		 */
+		dma_wmb();
 		desc->die_dt = DT_FSTART;
 	} else {
+		/* Descriptor type must be set after all the above writes */
+		dma_wmb();
 		desc->die_dt = DT_FSINGLE;
 	}
 	ravb_modify(ndev, TCCR, TCCR_TSRQ0 << q, TCCR_TSRQ0 << q);
-- 
2.43.0


