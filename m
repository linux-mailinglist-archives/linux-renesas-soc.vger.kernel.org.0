Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C748288144
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Aug 2019 19:33:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436863AbfHIRd2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 9 Aug 2019 13:33:28 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:54073 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436858AbfHIRd2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Aug 2019 13:33:28 -0400
Received: by mail-wm1-f65.google.com with SMTP id 10so6473758wmp.3;
        Fri, 09 Aug 2019 10:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RYenYv2RF2YyQKxjEa0F5oPdLpwTsKicpGgVmDg1Iqo=;
        b=bFoyuVFok3c+2FQU7agOeb5AKazbrIVgHMOSTZBlmKEu1XsuheyLEFPr/xBTiMPPgP
         URwsoU1qXEqJXNjWcnNoOjQWTm9hJQTGOLhmSZFEi5ysxdLtXpnRXsgQxSz7Mup+pr90
         ad65eW/cpFylpyT8YjVyHruiK1s4qYOStx5b+MdGrnqHfVV/xVevxO/udNOOXuCLmVuv
         rtWBb3dvUMEYZ9P230gpBRpfTvhKN32POmE2cN/3LHDJ/UhExcYQGyCYoI9YeHeMutxr
         JjLfGszBFptwURIQTuCv3i1Xzbu+vHmzCYAQQyq7cSrZzIdjHVvVvbV4akMg+ecMLklP
         Awfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RYenYv2RF2YyQKxjEa0F5oPdLpwTsKicpGgVmDg1Iqo=;
        b=VeW5rGfvuuS47akKY89Lmp1M6GZmEzzYBWwTnyqkh8JIT1iaY9qFxQBzpt/v6K2G8H
         r7Yt1X6Nhksv82ia6uJWfqutqfjFDKrhGUEP22jxZRFcB03hoHTfpvYP0CLgOVnzUduj
         mt5sB//VqyT3y+36x9hzpzWws+sGhhTnNqyFQFHy/msGEfSdh09oKF2BhiSPjzplMIoP
         8La32E9dpzXwbyLd7zHbgnoI8Hn1aveOVY9KTDJY8NwjN/5E02ur+XmlD1C9UoB+WoDe
         vqJiRBR8f5SxNhaFEFU7cb7MwwOtjGaZ2al6HK48BbFQVu2k2nzU20t//mn2sRRVMmX0
         sWjQ==
X-Gm-Message-State: APjAAAV9DBqOYcCHYVfSPYIm4Gg7pzECV2jtA6TOQdmUqGPKD8VT0/vr
        YcdGvP0dOZnj9zenANKQkAuxXO+h
X-Google-Smtp-Source: APXvYqynHwPJ8Rnu8G9QOsu/l0onyqeDgoSY5wvQL8XyVUD5m9MpcwYxUj6bxIqmq6asSehywN82EQ==
X-Received: by 2002:a1c:7611:: with SMTP id r17mr12060674wmc.117.1565372005372;
        Fri, 09 Aug 2019 10:33:25 -0700 (PDT)
Received: from chi.lan (ip-86-49-35-8.net.upcbroadband.cz. [86.49.35.8])
        by smtp.gmail.com with ESMTPSA id e10sm17527845wrn.33.2019.08.09.10.33.24
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 09 Aug 2019 10:33:24 -0700 (PDT)
From:   marek.vasut@gmail.com
To:     devicetree@vger.kernel.org
Cc:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] of: Fix of_empty_ranges_quirk()
Date:   Fri,  9 Aug 2019 19:33:21 +0200
Message-Id: <20190809173321.19944-1-marek.vasut@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Marek Vasut <marek.vasut+renesas@gmail.com>

The of_empty_ranges_quirk() returns a mix of boolean and signed integer
types, which cannot work well. Replace that with boolean only and fix
usage logic in of_translate_one() -- the check should trigger when the
ranges are NULL and the quirk is applicable on the hardware.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org
To: devicetree@vger.kernel.org
---
 drivers/of/address.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index b492176c0572..ae2819e148b8 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -616,7 +616,7 @@ static struct of_bus *of_match_bus(struct device_node *np)
 	return NULL;
 }
 
-static int of_empty_ranges_quirk(struct device_node *np)
+static bool of_empty_ranges_quirk(struct device_node *np)
 {
 	if (IS_ENABLED(CONFIG_PPC)) {
 		/* To save cycles, we cache the result for global "Mac" setting */
@@ -631,7 +631,8 @@ static int of_empty_ranges_quirk(struct device_node *np)
 			quirk_state =
 				of_machine_is_compatible("Power Macintosh") ||
 				of_machine_is_compatible("MacRISC");
-		return quirk_state;
+		if (quirk_state > 0)
+			return true;
 	}
 	return false;
 }
@@ -662,8 +663,8 @@ static int of_translate_one(struct device_node *parent, struct of_bus *bus,
 	 * This code is only enabled on powerpc. --gcl
 	 */
 	ranges = of_get_property(parent, rprop, &rlen);
-	if (ranges == NULL && !of_empty_ranges_quirk(parent)) {
-		pr_debug("no ranges; cannot translate\n");
+	if (ranges == NULL && of_empty_ranges_quirk(parent)) {
+		pr_err("no ranges; cannot translate\n");
 		return 1;
 	}
 	if (ranges == NULL || rlen == 0) {
-- 
2.20.1

