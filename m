Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 014CD214726
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  4 Jul 2020 17:59:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726682AbgGDP7U (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 4 Jul 2020 11:59:20 -0400
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:28312 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726639AbgGDP7U (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 4 Jul 2020 11:59:20 -0400
X-Halon-ID: 51880df4-be0f-11ea-8fb8-005056917f90
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (p4fca2eca.dip0.t-ipconnect.de [79.202.46.202])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id 51880df4-be0f-11ea-8fb8-005056917f90;
        Sat, 04 Jul 2020 17:59:19 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     linux-renesas-soc@vger.kernel.org
Cc:     =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 1/2] ARM: dts: gose: Fix ports node name for adv7180
Date:   Sat,  4 Jul 2020 17:58:55 +0200
Message-Id: <20200704155856.3037010-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200704155856.3037010-1-niklas.soderlund+renesas@ragnatech.se>
References: <20200704155856.3037010-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

When adding the adv7180 device node the ports node was misspelled as
port, fix this.

Fixes: 8cae359049a88b75 ("ARM: dts: gose: add composite video input")
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 arch/arm/boot/dts/r8a7793-gose.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r8a7793-gose.dts b/arch/arm/boot/dts/r8a7793-gose.dts
index 79baf06019f5a6ff..a378b54867bb4d1f 100644
--- a/arch/arm/boot/dts/r8a7793-gose.dts
+++ b/arch/arm/boot/dts/r8a7793-gose.dts
@@ -336,7 +336,7 @@ composite-in@20 {
 			reg = <0x20>;
 			remote = <&vin1>;
 
-			port {
+			ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
-- 
2.27.0

