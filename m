Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 284824E2DF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2019 11:14:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726487AbfFUJOI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Jun 2019 05:14:08 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:33940 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726518AbfFUJOI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Jun 2019 05:14:08 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id E0F1225BE4C;
        Fri, 21 Jun 2019 19:13:54 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id E482B940CB2; Fri, 21 Jun 2019 11:13:50 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 07/22] ARM: dts: rza2mevb: add ethernet aliases
Date:   Fri, 21 Jun 2019 11:13:34 +0200
Message-Id: <eb8be0276d903a2374c7abc7f3b9a22ba7fd9670.1561104194.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1561104194.git.horms+renesas@verge.net.au>
References: <cover.1561104194.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Chris Brandt <chris.brandt@renesas.com>

Add ethernet aliases so u-boot can find the device nodes.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r7s9210-rza2mevb.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/r7s9210-rza2mevb.dts b/arch/arm/boot/dts/r7s9210-rza2mevb.dts
index a328426a0409..e720a22eaf58 100644
--- a/arch/arm/boot/dts/r7s9210-rza2mevb.dts
+++ b/arch/arm/boot/dts/r7s9210-rza2mevb.dts
@@ -17,6 +17,8 @@
 
 	aliases {
 		serial0 = &scif4;
+		ethernet0 = &ether0;
+		ethernet1 = &ether1;
 	};
 
 	chosen {
-- 
2.11.0

