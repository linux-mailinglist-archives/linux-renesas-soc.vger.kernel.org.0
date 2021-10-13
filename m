Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4274042BCA9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Oct 2021 12:20:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239332AbhJMKWR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Oct 2021 06:22:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239336AbhJMKWJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Oct 2021 06:22:09 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 039D6C061746
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Oct 2021 03:20:05 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:9c93:91ff:d58:ecfb])
        by baptiste.telenet-ops.be with bizsmtp
        id 5NL32600B0KW32a01NL3z2; Wed, 13 Oct 2021 12:20:03 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mabMh-004XwN-3O; Wed, 13 Oct 2021 12:20:03 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1maa86-002spX-El; Wed, 13 Oct 2021 11:00:54 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/LOCAL 3/4] arm64: renesas: defconfig: Enable CONFIG_PWM_RENESAS_TPU
Date:   Wed, 13 Oct 2021 11:00:44 +0200
Message-Id: <55a67d3480894f2be2509db3ce1fdb2ee502adf1.1634115568.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <fa758f27d9153ae3d8d92d7452bce9aa881327c7.1634115568.git.geert+renesas@glider.be>
References: <fa758f27d9153ae3d8d92d7452bce9aa881327c7.1634115568.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Increase build and test coverage.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Not intended for upstream merge.
To be applied to the topic/renesas-defconfig branch.
---
 arch/arm64/configs/renesas_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 71fb5acd98b1ff5e..45df24076e34f341 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -333,6 +333,7 @@ CONFIG_IIO=y
 CONFIG_MAX9611=y
 CONFIG_PWM=y
 CONFIG_PWM_RCAR=y
+CONFIG_PWM_RENESAS_TPU=y
 CONFIG_PHY_RCAR_GEN3_PCIE=y
 CONFIG_PHY_RCAR_GEN3_USB2=y
 CONFIG_PHY_RCAR_GEN3_USB3=y
-- 
2.25.1

