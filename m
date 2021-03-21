Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C04093431B4
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 21 Mar 2021 09:35:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230047AbhCUH7I (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 21 Mar 2021 03:59:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229996AbhCUH6i (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 21 Mar 2021 03:58:38 -0400
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B4A7C061574;
        Sun, 21 Mar 2021 00:58:38 -0700 (PDT)
Received: by mail-qk1-x72b.google.com with SMTP id y18so7514470qky.11;
        Sun, 21 Mar 2021 00:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w/FodDC12fPiOO8KW+LQzpBz2k4WggnFhqLfSXUOk7I=;
        b=H0Tl3FAbKGNNdQY1nn7qXJAoUpOyIY1laxGMwhds2cDvmv77zy8ROW8tUBT/43pmWQ
         JoE6R9uodvdFZuJpRRPcI7hAVNwpwhX1gjPkUuBm77PQXlqmqRuqBeg8SSxlwIwq73fv
         tyutaF5pxdVXAA/8zpZmQXPMRI8jhs95LlW/rNVA6lfo6l74NpRBuZMwEqe3VkNcOM+i
         8MaHIB5BBEEHBW2o+4bz+24yVyED2d5PPp66ZoADjtYOyesD1gzFwztPs3Q5y5JQX6Mh
         wymI/gthKne2if6WGNTfWtpp/b8hq7ccDSt6RQuIuVQHi1vhUWN5hBUovoP5ywerYNEV
         ghWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w/FodDC12fPiOO8KW+LQzpBz2k4WggnFhqLfSXUOk7I=;
        b=biRay4HkuvwE67msl29/E6rdC7BY3idaHbXamUx8QontcpWLvrAqBgFqkfiF4y2bDT
         LrNxwzdyXjzH4KARO7j7XSwNMRnO3uVF23RYKQ4QluYLM30tMj7S3jTdCshEpOo7ZsPM
         h7uYMiUp8ClpinU4r9o9/uMGnH4vtc/12K8sLJtqntz5okR8e5PWKcnV5fodOkaK+NeP
         7FZW1BxW6VcgtWy8BHpn4dHKCD5CfdqPxLXGeVO6PdvXINc4KPocxwjXN7eRtuDJr8zK
         00oKmyUzjUmxEE6B8RWm89U93j0agizqet9IKAEkNflsfqD/vKO7eEVu+TEWJWMiFBFg
         xIAw==
X-Gm-Message-State: AOAM5330bozn+e/OJzzDEOWpwjydhW8HdtkY5BsHEqlAfabAK0iYTeJM
        NWsjUEJZoFbq4ed+jLSc3O0=
X-Google-Smtp-Source: ABdhPJxNLUvkzFIE3YzBjX0C4EvNEPKtpihnwmObFP1TJ19QdzliFLuYNnnzcn50yB9+IqaPAxZBfA==
X-Received: by 2002:ae9:f81a:: with SMTP id x26mr5608819qkh.497.1616313517322;
        Sun, 21 Mar 2021 00:58:37 -0700 (PDT)
Received: from Slackware.localdomain ([156.146.55.204])
        by smtp.gmail.com with ESMTPSA id d23sm8298626qka.125.2021.03.21.00.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Mar 2021 00:58:36 -0700 (PDT)
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     rdunlap@infradead.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH] clk: renesas: Couple of spelling fixes
Date:   Sun, 21 Mar 2021 13:28:13 +0530
Message-Id: <20210321075813.9471-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


s/suposed/supposed/
s/concurent/concurrent/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/clk/renesas/r9a06g032-clocks.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/r9a06g032-clocks.c b/drivers/clk/renesas/r9a06g032-clocks.c
index 892e91b92f2c..1fe166e7f8bd 100644
--- a/drivers/clk/renesas/r9a06g032-clocks.c
+++ b/drivers/clk/renesas/r9a06g032-clocks.c
@@ -279,7 +279,7 @@ static const struct r9a06g032_clkdesc r9a06g032_clocks[] = {
 	/*
 	 * These are not hardware clocks, but are needed to handle the special
 	 * case where we have a 'selector bit' that doesn't just change the
-	 * parent for a clock, but also the gate it's suposed to use.
+	 * parent for a clock, but also the gate it's supposed to use.
 	 */
 	{
 		.index = R9A06G032_UART_GROUP_012,
@@ -311,7 +311,7 @@ static const struct r9a06g032_clkdesc r9a06g032_clocks[] = {

 struct r9a06g032_priv {
 	struct clk_onecell_data data;
-	spinlock_t lock; /* protects concurent access to gates */
+	spinlock_t lock; /* protects concurrent access to gates */
 	void __iomem *reg;
 };

--
2.30.1

