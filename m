Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76C1221D490
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2020 13:10:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728950AbgGMLKd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Jul 2020 07:10:33 -0400
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:31093 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727890AbgGMLKd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Jul 2020 07:10:33 -0400
X-Halon-ID: 5441fa3b-c4f9-11ea-86ee-0050569116f7
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (p4fca2eca.dip0.t-ipconnect.de [79.202.46.202])
        by bin-vsp-out-03.atm.binero.net (Halon) with ESMTPA
        id 5441fa3b-c4f9-11ea-86ee-0050569116f7;
        Mon, 13 Jul 2020 13:09:36 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     linux-renesas-soc@vger.kernel.org
Cc:     =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] ARM: dts: gose: Fix ports node name for adv7612
Date:   Mon, 13 Jul 2020 13:10:16 +0200
Message-Id: <20200713111016.523189-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

When adding the adv7612 device node the ports node was misspelled as
port, fix this.

Fixes: bc63cd87f3ce924f ("ARM: dts: gose: add HDMI input")
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 arch/arm/boot/dts/r8a7793-gose.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r8a7793-gose.dts b/arch/arm/boot/dts/r8a7793-gose.dts
index 79baf06019f5a6ff..5974253973041633 100644
--- a/arch/arm/boot/dts/r8a7793-gose.dts
+++ b/arch/arm/boot/dts/r8a7793-gose.dts
@@ -394,7 +394,7 @@ hdmi-in@4c {
 			interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
 			default-input = <0>;
 
-			port {
+			ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
-- 
2.27.0

