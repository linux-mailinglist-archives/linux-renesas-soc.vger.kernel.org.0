Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9BD14E2D7A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Mar 2022 17:12:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234996AbiCUQN7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Mar 2022 12:13:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350715AbiCUQN6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Mar 2022 12:13:58 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A4172E6BC
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Mar 2022 09:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=Olo2Uqd/vUiEwq
        7fC0KME5v7jxlFjg6geezBJLWQIFQ=; b=qoKEAx2sBOI4aUgpFuP764d7Pz/1Z9
        kpGEG9DrJOfTU8fbLJa5V2fbMFKkL6bLVSZxK+zeDAg0qsYQM+mdJsOdu9nISaTc
        762A8OJN5MJBgs6GNac0yLruTEI0jEf+RdY0TwGW3dqyizv2K5KUZonCRzsbTgro
        fBX2L1OlRTv2A=
Received: (qmail 957674 invoked from network); 21 Mar 2022 17:12:29 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Mar 2022 17:12:29 +0100
X-UD-Smtp-Session: l3s3148p1@oNRNw7zaGtkgAwDPXxCoAIeNYiWy88zT
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-kernel@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH 02/15] base: regmap: use new name 'usleep_autoyield' instead of 'fsleep'
Date:   Mon, 21 Mar 2022 17:12:10 +0100
Message-Id: <20220321161223.2837-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220321161223.2837-1-wsa+renesas@sang-engineering.com>
References: <20220321161223.2837-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The function was just renamed to be easier understandable. No functional
change.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
RFC, please do not apply yet

 drivers/base/regmap/regmap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index 8f9fe5fd4707..27c75611d177 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -2429,7 +2429,7 @@ static int _regmap_range_multi_paged_reg_write(struct regmap *map,
 
 				if (regs[i].delay_us) {
 					if (map->can_sleep)
-						fsleep(regs[i].delay_us);
+						usleep_autoyield(regs[i].delay_us);
 					else
 						udelay(regs[i].delay_us);
 				}
@@ -2470,7 +2470,7 @@ static int _regmap_multi_reg_write(struct regmap *map,
 
 			if (regs[i].delay_us) {
 				if (map->can_sleep)
-					fsleep(regs[i].delay_us);
+					usleep_autoyield(regs[i].delay_us);
 				else
 					udelay(regs[i].delay_us);
 			}
-- 
2.34.1

