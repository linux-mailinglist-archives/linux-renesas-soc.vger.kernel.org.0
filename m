Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34EAD5093A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jun 2019 12:52:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729338AbfFXKwo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Jun 2019 06:52:44 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:59970 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728369AbfFXKwo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Jun 2019 06:52:44 -0400
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 36F4925AF0F;
        Mon, 24 Jun 2019 20:52:42 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 0AD52E21A77; Mon, 24 Jun 2019 12:52:40 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>
Subject: [PATCH v3 1/2] arm64: dts: renesas: r8a77990: Add cpg reset for DU
Date:   Mon, 24 Jun 2019 12:52:23 +0200
Message-Id: <20190624105224.23927-2-horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190624105224.23927-1-horms+renesas@verge.net.au>
References: <20190624105224.23927-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

Add CPG reset properties to DU node of E3 (r8a77990) SoC.

According to Laurent Pinchart, R-Car Gen3 reset is handled at the group
level so specifying one reset entry per group is sufficient.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
v3 [Simon Horman]
- rewrote changelog

v2 [Simon Horman]
- only add one reset entry per group

v1 [Yoshihiro Kaneko]

v0 [Takeshi Kihara]
---
 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index b4318661f35e..84d1f58e73e7 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -1766,6 +1766,8 @@
 			clocks = <&cpg CPG_MOD 724>,
 				 <&cpg CPG_MOD 723>;
 			clock-names = "du.0", "du.1";
+			resets = <&cpg 724>;
+			reset-names = "du.0";
 			vsps = <&vspd0 0 &vspd1 0>;
 			status = "disabled";
 
-- 
2.11.0

