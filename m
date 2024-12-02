Return-Path: <linux-renesas-soc+bounces-10776-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DA59C9E0402
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Dec 2024 14:50:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9BBE2282113
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Dec 2024 13:50:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6CFA204F77;
	Mon,  2 Dec 2024 13:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b="1FOEisxi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7122040A4
	for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Dec 2024 13:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733147375; cv=none; b=AU+H9e4avckS0ALIc64TZdJBjsNwlMs3ne/DQhiznf7GKrTxGMCcA+PvCIHXQfan1n8uAJOgyeX7ID4PONLHJK4cDN86CMTXjWA+5AbUleIx6I05etX24eL/hkHsCibHwX/9y9xoVK+m11YF7GXxjt2D7hWwqBYrDtIXpyezCS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733147375; c=relaxed/simple;
	bh=4aBJjV9AGG6v/ueyNuXxKCEwqM57vbdIvUBj15x4HvQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JqIZ6gqkcK5SdYmQgDnanLsGK8TQcdE7yHFhEfI8jz77AnnW1BFo0Opqt2R33BdWN6Mwyr+ihZr5cNmMnwPztREGx29xxpCXQic/9azsW7tREXeWlgZk27iuuCF0/CpR4siNZAveYCNwN7aY7gsFYqcG+zkJumCIDueFhvBuIqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com; spf=pass smtp.mailfrom=cogentembedded.com; dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b=1FOEisxi; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cogentembedded.com
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2ffc80318c9so44187171fa.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Dec 2024 05:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20230601.gappssmtp.com; s=20230601; t=1733147372; x=1733752172; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=utmDOcX/I6M6gZgQOmT31f/v0I8skcbfVHDvau0Ra4U=;
        b=1FOEisxi8IeZv5FtSncX0miSxtfjQCXPiV6a4To0epk0J6OBPluPKE6FJzKwaAJMsG
         sebG4bzW+1pWdJMOIxMqDJGs23DzOebc+Yjf8UG4zmfch/F0br82YIJAeTSM16pmCLxY
         g4C89tJm1kYelawNphTjRms5tJuvfPOOM19acK89J3rfeNltTxq4FdubQatpMwn4O3it
         J4F/7uBkodCrQyxwG7W3F10IKaTpG1QwSBvTpfemKvAVCxAV57fKHXrK5XviSDv1eUL9
         x3UEJ1hJunUYtVCA1UXoW4Cwdfq7s/ln9Ah79Q+mofoPwRlm7CeNFMrG/3X9jS1xvVY0
         74vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733147372; x=1733752172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=utmDOcX/I6M6gZgQOmT31f/v0I8skcbfVHDvau0Ra4U=;
        b=l4bWMoWzk+owJ+YGHggm5xC29p4OB9gei2eveqpL6xiidUICVWolZoKnRXbvFH0Ojd
         /hLPaw5YvVtAy+P+BvMPOmXU23cE0uI/JLeHpFHfxJlJqkJ1nE+G2FUtemNQ3Um3nCX+
         MzLyovEsmNdzq5eOD4qjrza9zHYlI99pUC0jdZC4hdL0I9VBfTFrlxhzdGhvvH/i+OWI
         PzNtdj4WaZ5XqFA5STpKGkInYJy9OxpiZwQSPv0IFd5yIMsyBZRyikc5Y+XwdfiKEBKS
         A/pZHA2cxvEkdvOrtEWEF/gUl5o44cjJ+OuUbqLqKxf6tsJ083FACdT3lt8T0FaRupbb
         TMSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIcHqsxgULVfbPbPeF9aojtsMnNwkB8e316w4/7yp3nDPygywEojpuS1bGg+cRpFuZalxwd0RKLQ4u5crfDFkWWw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbALijtOKRnDMcVprFERBUTO/HmCSSrki4yT9YwTSqgXsarL8W
	XSJz3NNwukgtOEe7WegpGnAgU/BioGn/yuqRNGagsgeshWXSSXdTiaKvF2sWa70=
X-Gm-Gg: ASbGnctX7vs6BMn0LjVWf5EZiCsbv66uhKio+Nq4TVzAcUK0OwPiWfPAcX2wdcVXrDL
	uXXC66M5yBn/LQPcCRSjE/VC+exxqLYba3m7CKWn7/GKP7ZrHLOUjQEarS7sx+NcHDP+UTlAPew
	eo6neRhUFcffKNYj28c7/5JDuuujD/S9abcUVmYsoQUzped0z3u6nKizpQuOXapvagyQDh2kDxW
	6NqdedGApC/iw68sJnjFsLqyaWHWahMq6vel4aHvEqFaNuifP1LolifixMPQA2C
X-Google-Smtp-Source: AGHT+IEumbL0xz4LEy0IxGz1T5wriVQbKuAxxhzOUJEXRi0z23STaQZgb5byEvsRsYGGQEBKO7tgYg==
X-Received: by 2002:a05:651c:211a:b0:2fb:5688:55a4 with SMTP id 38308e7fff4ca-2ffd6099734mr102259291fa.17.1733147372085;
        Mon, 02 Dec 2024 05:49:32 -0800 (PST)
Received: from cobook.home ([91.198.101.25])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffdfbb8f2csm12972661fa.15.2024.12.02.05.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 05:49:31 -0800 (PST)
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Andrew Lunn <andrew@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Dege <michael.dege@renesas.com>,
	Christian Mardmoeller <christian.mardmoeller@renesas.com>,
	Dennis Ostermann <dennis.ostermann@renesas.com>,
	Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Subject: [PATCH 4/5] net: renesas: rswitch: do not deinit disabled ports
Date: Mon,  2 Dec 2024 18:49:03 +0500
Message-Id: <20241202134904.3882317-5-nikita.yoush@cogentembedded.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241202134904.3882317-1-nikita.yoush@cogentembedded.com>
References: <20241202134904.3882317-1-nikita.yoush@cogentembedded.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In rswitch_ether_port_init_all(), only enabled ports are initialized.
Then, rswitch_ether_port_deinit_all() shall also only deinitialize
enabled ports.

Fixes: 3590918b5d07 ("net: ethernet: renesas: Add support for "Ethernet Switch"")
Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
---
 drivers/net/ethernet/renesas/rswitch.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
index 779c05b8e05f..5980084d9211 100644
--- a/drivers/net/ethernet/renesas/rswitch.c
+++ b/drivers/net/ethernet/renesas/rswitch.c
@@ -1527,7 +1527,7 @@ static void rswitch_ether_port_deinit_all(struct rswitch_private *priv)
 {
 	unsigned int i;
 
-	for (i = 0; i < RSWITCH_NUM_PORTS; i++) {
+	rswitch_for_each_enabled_port(priv, i) {
 		phy_exit(priv->rdev[i]->serdes);
 		rswitch_ether_port_deinit_one(priv->rdev[i]);
 	}
-- 
2.39.5


