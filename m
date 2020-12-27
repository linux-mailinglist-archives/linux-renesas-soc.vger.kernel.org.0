Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72ACD2E3134
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 27 Dec 2020 14:05:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726371AbgL0NFM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 27 Dec 2020 08:05:12 -0500
Received: from www.zeus03.de ([194.117.254.33]:37916 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726300AbgL0NFK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 27 Dec 2020 08:05:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=XEGX+JKQU4h8/h
        1poP8+hWxz2kBiDmO6WqO1OgrQurU=; b=b7P1s1KydDTS3s4YFrLSUCUi66D0l+
        RMZpavNAFRU/WZ5fbfAclzZwNqI+LShpdHUVOx+qxbbdplJu68Xjbzr34E4RFeWF
        jU20L3c/0UYVed4a75jvmDwBkUECdPahVc8J6qpyGbTQY1ifzfwhBonVUptyGzQw
        ytvsYF+4h5oHk=
Received: (qmail 1501233 invoked from network); 27 Dec 2020 14:04:21 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Dec 2020 14:04:21 +0100
X-UD-Smtp-Session: l3s3148p1@cbK/y3G3asEgAwDPXwIpAOUwDQytQs2L
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] arm64: dts: r8a779a0: WIP disable reset-gpios for AVB
Date:   Sun, 27 Dec 2020 14:04:06 +0100
Message-Id: <20201227130407.10991-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201227130407.10991-1-wsa+renesas@sang-engineering.com>
References: <20201227130407.10991-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Retrieving a GPIO currently fails, so probing the whole driver fails
then. Remove them for now to get a working AVB device for testing.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts b/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
index f5f27dece6ee..48801f2bdbe5 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
@@ -34,7 +34,7 @@ phy0: ethernet-phy@0 {
 		reg = <0>;
 		interrupt-parent = <&gpio4>;
 		interrupts = <16 IRQ_TYPE_LEVEL_LOW>;
-		reset-gpios = <&gpio4 15 GPIO_ACTIVE_LOW>;
+		//reset-gpios = <&gpio4 15 GPIO_ACTIVE_LOW>;
 	};
 };
 
@@ -49,7 +49,7 @@ phy1: ethernet-phy@1 {
 		reg = <0>;
 		interrupt-parent = <&gpio5>;
 		interrupts = <16 IRQ_TYPE_LEVEL_LOW>;
-		reset-gpios = <&gpio5 15 GPIO_ACTIVE_LOW>;
+		//reset-gpios = <&gpio5 15 GPIO_ACTIVE_LOW>;
 	};
 };
 
@@ -64,7 +64,7 @@ phy2: ethernet-phy@2 {
 		reg = <0>;
 		interrupt-parent = <&gpio6>;
 		interrupts = <16 IRQ_TYPE_LEVEL_LOW>;
-		reset-gpios = <&gpio6 15 GPIO_ACTIVE_LOW>;
+		//reset-gpios = <&gpio6 15 GPIO_ACTIVE_LOW>;
 	};
 };
 
@@ -79,7 +79,7 @@ phy3: ethernet-phy@3{
 		reg = <0>;
 		interrupt-parent = <&gpio7>;
 		interrupts = <16 IRQ_TYPE_LEVEL_LOW>;
-		reset-gpios = <&gpio7 15 GPIO_ACTIVE_LOW>;
+		//reset-gpios = <&gpio7 15 GPIO_ACTIVE_LOW>;
 	};
 };
 
@@ -94,7 +94,7 @@ phy4: ethernet-phy@4 {
 		reg = <0>;
 		interrupt-parent = <&gpio8>;
 		interrupts = <16 IRQ_TYPE_LEVEL_LOW>;
-		reset-gpios = <&gpio8 15 GPIO_ACTIVE_LOW>;
+		//reset-gpios = <&gpio8 15 GPIO_ACTIVE_LOW>;
 	};
 };
 
@@ -109,7 +109,7 @@ phy5: ethernet-phy@5 {
 		reg = <0>;
 		interrupt-parent = <&gpio9>;
 		interrupts = <16 IRQ_TYPE_LEVEL_LOW>;
-		reset-gpios = <&gpio9 15 GPIO_ACTIVE_LOW>;
+		//reset-gpios = <&gpio9 15 GPIO_ACTIVE_LOW>;
 	};
 };
 
-- 
2.29.2

