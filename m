Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8586F5016B9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Apr 2022 17:50:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235864AbiDNPKw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 14 Apr 2022 11:10:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355961AbiDNPHg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Apr 2022 11:07:36 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9128F91550
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Apr 2022 07:45:57 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:7915:bbfe:555b:5456])
        by andre.telenet-ops.be with bizsmtp
        id Jelv2700M4TB7ht01elwA9; Thu, 14 Apr 2022 16:45:56 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nf0jL-000cGz-F4; Thu, 14 Apr 2022 16:45:55 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nf0jK-00E9zE-Uy; Thu, 14 Apr 2022 16:45:54 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: defconfig: Enable Maxim MAX96712 Quad GMSL2 Deserializer support
Date:   Thu, 14 Apr 2022 16:45:52 +0200
Message-Id: <7b5ea7eaabc1da79fd974f9d9845a5a527f2fb14.1649947458.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Increase build and test coverage by enabling modular support for the
Maxim MAX96712 Quad GMSL2 Deserializer, as used on the Renesas Falcon
board.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v5.19.
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 2836f3c5d3614de2..9ceb8c82ae16f0fa 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -984,6 +984,7 @@ CONFIG_STAGING=y
 CONFIG_STAGING_MEDIA=y
 CONFIG_VIDEO_HANTRO=m
 CONFIG_VIDEO_IMX_MEDIA=m
+CONFIG_VIDEO_MAX96712=m
 CONFIG_CHROME_PLATFORMS=y
 CONFIG_CROS_EC=y
 CONFIG_CROS_EC_I2C=y
-- 
2.25.1

