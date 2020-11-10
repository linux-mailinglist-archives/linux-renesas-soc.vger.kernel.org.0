Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A8732ADB8B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Nov 2020 17:22:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726900AbgKJQWA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Nov 2020 11:22:00 -0500
Received: from www.zeus03.de ([194.117.254.33]:35238 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726737AbgKJQWA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Nov 2020 11:22:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=uotfqwKVBcbjit
        16yorZStZ7gDieIduxZh48pEI1uRA=; b=gE9MZEoX40uHHjSJQpsijz8FI569dc
        veA9sMI1GAtu+JIEFKYy6l7dylpxejw4/q7n/auM8WUYEZJLQ9BARkvRvCrqMkUN
        bD4ymsFSQNIaeC7znlc+g8KXaLzjEQf3hIBHd7V35gFTTwSVEfE72MF+uoWeVwnl
        JqXKrgBy5OqNQ=
Received: (qmail 2226038 invoked from network); 10 Nov 2020 17:21:58 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Nov 2020 17:21:58 +0100
X-UD-Smtp-Session: l3s3148p1@YPr0E8OzSssgAwDPXxAvAEQD26z+TKuA
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 1/3] mmc: renesas_sdhi: clear TAPEN when resetting, too
Date:   Tue, 10 Nov 2020 17:21:49 +0100
Message-Id: <20201110162151.37622-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201110162151.37622-1-wsa+renesas@sang-engineering.com>
References: <20201110162151.37622-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

We want to clear TAPEN in a software reset, too, to have a completely
known state. Especially when we doing the initial reset during boot to
clear previous firmware states.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/renesas_sdhi_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 1fabf8c5773c..476a0c0198c6 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -558,7 +558,7 @@ static void renesas_sdhi_reset(struct tmio_mmc_host *host)
 	struct renesas_sdhi *priv = host_to_priv(host);
 
 	if (priv->scc_ctl) {
-		renesas_sdhi_reset_scc(host, priv);
+		renesas_sdhi_disable_scc(host->mmc);
 		renesas_sdhi_reset_hs400_mode(host, priv);
 		priv->needs_adjust_hs400 = false;
 
-- 
2.28.0

