Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CC1359F7E5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Aug 2022 12:35:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234401AbiHXKfh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Aug 2022 06:35:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236358AbiHXKf0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Aug 2022 06:35:26 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88D3C80520
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Aug 2022 03:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=JXe0s5vb4r1tug
        Q+zr6ZHri0IlW9LJDcXIYq/OG7LtM=; b=iwm5cBrqp4BXaXZCNxgoEZReEBhtvi
        S9CHt5CryjvynsDp4l6k551NnQndKQkgKM9QFQBvhcruQuUgclpu0OsJQoji/tHc
        VnWjMi9qpC5wDIawMJNwKODcknMFK3/qDTJ64uSE45W3SCQRiwT6SONLZP8JYA02
        FCWxqNSrnh1fM=
Received: (qmail 2180907 invoked from network); 24 Aug 2022 12:35:23 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 24 Aug 2022 12:35:23 +0200
X-UD-Smtp-Session: l3s3148p1@2fEDPfrmjLMgAwDPXxw3AFlguiwjsjwa
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 4/4] TEST: arm64: dts: renesas: spider: Add MSIOF node
Date:   Wed, 24 Aug 2022 12:35:15 +0200
Message-Id: <20220824103515.54931-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220824103515.54931-1-wsa+renesas@sang-engineering.com>
References: <20220824103515.54931-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Activate spidev on the MSIOF0 connector on the breakout board.
Not for upstream!

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm64/boot/dts/renesas/r8a779f0-spider.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779f0-spider.dts b/arch/arm64/boot/dts/renesas/r8a779f0-spider.dts
index 7a7c8ffba711..20803dcf73dc 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f0-spider.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779f0-spider.dts
@@ -31,3 +31,11 @@ eeprom@51 {
 		pagesize = <8>;
 	};
 };
+
+&msiof0 {
+	spidev@0  {
+		compatible = "rohm,dh2228fv";
+		reg = <0>;
+		spi-max-frequency = <400000>;
+	};
+};
-- 
2.35.1

