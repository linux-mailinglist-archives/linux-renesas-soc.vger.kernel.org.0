Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B33166B0BAF
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Mar 2023 15:43:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231652AbjCHOn1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Mar 2023 09:43:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231312AbjCHOnH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Mar 2023 09:43:07 -0500
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DECE8C3639
        for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Mar 2023 06:41:07 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:614d:21b0:703:d0f9])
        by michel.telenet-ops.be with bizsmtp
        id Vqgy290013mNwr406qgy0K; Wed, 08 Mar 2023 15:40:58 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pZuxr-00BFZ6-Na;
        Wed, 08 Mar 2023 15:40:57 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pZuyP-00Fb3V-T8;
        Wed, 08 Mar 2023 15:40:57 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/3] arm64: defconfig: Enable RZ/V2M xHCI and USB3.1 DRD controller support
Date:   Wed,  8 Mar 2023 15:40:54 +0100
Message-Id: <ff10d09c1a00f7024679a249e696e8c8a52d671e.1678286291.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678286291.git.geert+renesas@glider.be>
References: <cover.1678286291.git.geert+renesas@glider.be>
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

Increase build and test coverage by enabling RZ/V2M xHCI and USB3.1 DRD
controller support.

Note that the latter cannot be modular, as USB_XHCI_RCAR is builtin.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index ef88f86fbfda0215..3b5a8298c44e7c91 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -908,6 +908,7 @@ CONFIG_USB=y
 CONFIG_USB_OTG=y
 CONFIG_USB_XHCI_HCD=y
 CONFIG_USB_XHCI_PCI_RENESAS=m
+CONFIG_USB_XHCI_RZV2M=y
 CONFIG_USB_XHCI_TEGRA=y
 CONFIG_USB_BRCMSTB=m
 CONFIG_USB_EHCI_HCD=y
@@ -943,6 +944,7 @@ CONFIG_USB_ONBOARD_HUB=m
 CONFIG_NOP_USB_XCEIV=y
 CONFIG_USB_GADGET=y
 CONFIG_USB_RENESAS_USBHS_UDC=m
+CONFIG_USB_RZV2M_USB3DRD=y
 CONFIG_USB_RENESAS_USB3=m
 CONFIG_USB_TEGRA_XUDC=m
 CONFIG_USB_CONFIGFS=m
-- 
2.34.1

