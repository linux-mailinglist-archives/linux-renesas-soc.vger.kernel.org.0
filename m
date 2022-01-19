Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EBF5493B96
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jan 2022 15:02:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354989AbiASOCp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Jan 2022 09:02:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354957AbiASOCo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Jan 2022 09:02:44 -0500
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BA6BC06173E
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Jan 2022 06:02:43 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:a44d:f245:bac9:611c])
        by xavier.telenet-ops.be with bizsmtp
        id ke2g2600K2FKFx601e2gWu; Wed, 19 Jan 2022 15:02:41 +0100
Received: from rox.of.borg ([192.168.97.57] helo=rox)
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nABXs-00AS0k-9i; Wed, 19 Jan 2022 15:02:40 +0100
Received: from geert by rox with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nABXr-009iH3-T2; Wed, 19 Jan 2022 15:02:39 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     linux-renesas-soc@vger.kernel.org
Cc:     LUU HOAI <hoai.luu.ub@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 02/15] dt-bindings: pinctrl: renesas,pfc: Document r8a779f0 support
Date:   Wed, 19 Jan 2022 15:02:19 +0100
Message-Id: <fa92c8c659874b707eeafe37f4486e7b040f2b65.1642599415.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1642599415.git.geert+renesas@glider.be>
References: <cover.1642599415.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: LUU HOAI <hoai.luu.ub@renesas.com>

Document Pin Function Controller (PFC) support for the Renesas R-Car
S4-8 (R8A779F0) SoC.

Signed-off-by: LUU HOAI <hoai.luu.ub@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml
index 8548e3639b7549da..2a57df75d832f14b 100644
--- a/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml
@@ -44,6 +44,7 @@ properties:
       - renesas,pfc-r8a77990    # R-Car E3
       - renesas,pfc-r8a77995    # R-Car D3
       - renesas,pfc-r8a779a0    # R-Car V3U
+      - renesas,pfc-r8a779f0    # R-Car S4-8
       - renesas,pfc-sh73a0      # SH-Mobile AG5
 
   reg:
-- 
2.25.1

