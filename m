Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2847765BF93
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Jan 2023 13:05:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232887AbjACMEw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 Jan 2023 07:04:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237280AbjACMEU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Jan 2023 07:04:20 -0500
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76E89E10
        for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Jan 2023 04:04:19 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:f1ca:ff0d:9dea:806e])
        by andre.telenet-ops.be with bizsmtp
        id 4C4H290012YHDVW01C4Hxo; Tue, 03 Jan 2023 13:04:17 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1pCg1g-001yq8-NG; Tue, 03 Jan 2023 13:04:16 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1pCg1g-001OFw-BO; Tue, 03 Jan 2023 13:04:16 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: defconfig: Enable RZ/G2L MIPI CSI-2 and CRU support
Date:   Tue,  3 Jan 2023 13:04:14 +0100
Message-Id: <32098bf6a5e78a4bcc6398ccb5db0b01f1afc9b9.1672747428.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Increase build and test coverage by enabling support for the Renesas
RZ/G2L MIPI CSI-2 Receiver and the RZ/G2L Camera Receiving Unit, as used
on the RZ/G2L SMARC EVK development board.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v6.3.
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 4e9488fbbc060f04..22543373e89af2eb 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -717,6 +717,8 @@ CONFIG_VIDEO_QCOM_VENUS=m
 CONFIG_VIDEO_RCAR_ISP=m
 CONFIG_VIDEO_RCAR_CSI2=m
 CONFIG_VIDEO_RCAR_VIN=m
+CONFIG_VIDEO_RZG2L_CSI2=m
+CONFIG_VIDEO_RZG2L_CRU=m
 CONFIG_VIDEO_RENESAS_FCP=m
 CONFIG_VIDEO_RENESAS_FDP1=m
 CONFIG_VIDEO_RENESAS_VSP1=m
-- 
2.25.1

