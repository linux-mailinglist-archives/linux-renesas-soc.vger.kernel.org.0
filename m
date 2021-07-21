Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32FBA3D15E0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jul 2021 20:06:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237437AbhGUR0C (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 21 Jul 2021 13:26:02 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:26276 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230253AbhGUR0C (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Jul 2021 13:26:02 -0400
X-IronPort-AV: E=Sophos;i="5.84,258,1620658800"; 
   d="scan'208";a="88395580"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 22 Jul 2021 03:06:37 +0900
Received: from localhost.localdomain (unknown [10.226.92.105])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 0740740104D0;
        Thu, 22 Jul 2021 03:06:34 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] arm64: dts: renesas: rzg2: Add internal rx delay
Date:   Wed, 21 Jul 2021 19:06:32 +0100
Message-Id: <20210721180632.15080-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hihope boards use Realtek PHY. From the very beginning it use only
tx delays. However the phy driver commit bbc4d71d63549bcd003
("net: phy: realtek: fix rtl8211e rx/tx delay config") introduced
NFS mount failure. Now it needs rx delay inaddition to tx delay
for NFS mount to work. This patch fixes NFS mount failure issue
by adding MAC internal rx delay.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi b/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi
index 202c4fc88bd5..dde3a07bc417 100644
--- a/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi
+++ b/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi
@@ -20,6 +20,7 @@
 	pinctrl-names = "default";
 	phy-handle = <&phy0>;
 	tx-internal-delay-ps = <2000>;
+	rx-internal-delay-ps = <1800>;
 	status = "okay";
 
 	phy0: ethernet-phy@0 {
-- 
2.17.1

