Return-Path: <linux-renesas-soc+bounces-40-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5177F32CC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Nov 2023 16:54:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B9C4D282DEF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Nov 2023 15:54:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECA0A58135;
	Tue, 21 Nov 2023 15:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20230601.gappssmtp.com header.i=@ragnatech-se.20230601.gappssmtp.com header.b="aGYjPjNw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AACFE1A3
	for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Nov 2023 07:53:43 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-a00f67f120aso180211166b.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Nov 2023 07:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20230601.gappssmtp.com; s=20230601; t=1700582022; x=1701186822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OsgRT09PxDe983Ru7T/2ehV/VQm25XU9PRCmjt8k4L8=;
        b=aGYjPjNwEZjPn8kuBshn7NFi2dHasOAha6rlOSaPVBvs13Gdmwr30D8zQOcj8HSyBO
         t9cP00ZreHTnUnovPbs+2VZbf5ZfS2WVZH4TtACJWcpKU1obMBpOkLnNPyN9tCafg95B
         tISXzBfQPKcI/HJSI5JEzLJf1MYWjzn0aOBvR6qNNqsLe2AGPDXdaHUlCnpRydcMeWkz
         qUVckKsnOt87os5K6ry916EF4gDCUZKvcxY9fQUULjOdEt60ofVWkPG8bYmsirGTqn4W
         aqVjZ/xULE89IWP5f1Erc6ofyHy43CZR9UAV6z3qgoN+CoCwYr/YxJggyKpDn/0y4y7o
         YTjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700582022; x=1701186822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OsgRT09PxDe983Ru7T/2ehV/VQm25XU9PRCmjt8k4L8=;
        b=Af6LoB8syDqdy00ifePH7NImz4xDXSkMy+F8yAeLaEQPWgZB/Uo5afpFIuTb2zoiCg
         +I3lAbNpRT0Z0urk63n3EP7gKEaZT3ksTn3L4GS/OHE+WsKo/J/6QbfWLri1SPZAIJQI
         cWEq4HF7dcX7ahn1GRHakeFEEA2hxlpCrsfWJgrKdT6Y+W73ouPeqqbrYFzfCNXBRSwf
         qjryzMrX5cmmiHZdg8yldIyaJOjgxOxx6ckcHM093o86Er3oAzm27RqGP5nS5pFyoWzo
         hj9wDCBS/TQWkhMzXX8Dp5XhivPOotOC6vgAOnHVVhNn/g7tbsHRRRFX0BGq3rh6f/uL
         Xu7Q==
X-Gm-Message-State: AOJu0YxNCQs6HdTwXCdEQGBSPbLUugPgWbSgzT0d+4fbVSwi+pxIRSbZ
	T/u5n3q0Hz7l3LwY90wIlUyBQg==
X-Google-Smtp-Source: AGHT+IFkaP85F01IPGjJeYVQuKY3ifaMp+75FN1HK2cHpYI9JkXozMDhhs3tuYprFTtd2vpVQciQtg==
X-Received: by 2002:a17:906:ae46:b0:9fe:392:c535 with SMTP id lf6-20020a170906ae4600b009fe0392c535mr5313865ejb.69.1700582022034;
        Tue, 21 Nov 2023 07:53:42 -0800 (PST)
Received: from sleipner.berto.se (p4fcc8a96.dip0.t-ipconnect.de. [79.204.138.150])
        by smtp.googlemail.com with ESMTPSA id dv8-20020a170906b80800b009fdc15b5304sm2896853ejb.102.2023.11.21.07.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 07:53:41 -0800 (PST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [net-next v3 2/5] net: ethernet: renesas: rcar_gen4_ptp: Fail on unknown register layout
Date: Tue, 21 Nov 2023 16:53:03 +0100
Message-ID: <20231121155306.515446-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231121155306.515446-1-niklas.soderlund+renesas@ragnatech.se>
References: <20231121155306.515446-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Instead of printing a warning and proceeding with an unknown register
layout return an error. The only call site is already prepared to
propagate the error.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
* Changes since v2
- No change.

* Changes since v1
- Added review tag from Wolfram.
---
 drivers/net/ethernet/renesas/rcar_gen4_ptp.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rcar_gen4_ptp.c b/drivers/net/ethernet/renesas/rcar_gen4_ptp.c
index c007e33c47e1..443ca5a18703 100644
--- a/drivers/net/ethernet/renesas/rcar_gen4_ptp.c
+++ b/drivers/net/ethernet/renesas/rcar_gen4_ptp.c
@@ -130,23 +130,30 @@ static struct ptp_clock_info rcar_gen4_ptp_info = {
 	.enable = rcar_gen4_ptp_enable,
 };
 
-static void rcar_gen4_ptp_set_offs(struct rcar_gen4_ptp_private *ptp_priv,
-				   enum rcar_gen4_ptp_reg_layout layout)
+static int rcar_gen4_ptp_set_offs(struct rcar_gen4_ptp_private *ptp_priv,
+				  enum rcar_gen4_ptp_reg_layout layout)
 {
-	WARN_ON(layout != RCAR_GEN4_PTP_REG_LAYOUT_S4);
+	if (layout != RCAR_GEN4_PTP_REG_LAYOUT_S4)
+		return -EINVAL;
 
 	ptp_priv->offs = &s4_offs;
+
+	return 0;
 }
 
 int rcar_gen4_ptp_register(struct rcar_gen4_ptp_private *ptp_priv,
 			   enum rcar_gen4_ptp_reg_layout layout, u32 clock)
 {
+	int ret;
+
 	if (ptp_priv->initialized)
 		return 0;
 
 	spin_lock_init(&ptp_priv->lock);
 
-	rcar_gen4_ptp_set_offs(ptp_priv, layout);
+	ret = rcar_gen4_ptp_set_offs(ptp_priv, layout);
+	if (ret)
+		return ret;
 
 	ptp_priv->default_addend = clock;
 	iowrite32(ptp_priv->default_addend, ptp_priv->addr + ptp_priv->offs->increment);
-- 
2.42.1


