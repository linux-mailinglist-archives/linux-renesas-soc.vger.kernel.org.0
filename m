Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 857D34648B3
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Dec 2021 08:33:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347617AbhLAHgk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 1 Dec 2021 02:36:40 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:23247 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S237279AbhLAHgj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Dec 2021 02:36:39 -0500
X-IronPort-AV: E=Sophos;i="5.87,278,1631545200"; 
   d="scan'208";a="102002985"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 01 Dec 2021 16:33:17 +0900
Received: from localhost.localdomain (unknown [10.166.14.185])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id EDE4D41FE291;
        Wed,  1 Dec 2021 16:33:16 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org,
        gregkh@linuxfoundation.org, jirislaby@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-serial@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 01/14] dt-bindings: arm: renesas: Document Renesas Spider boards
Date:   Wed,  1 Dec 2021 16:32:55 +0900
Message-Id: <20211201073308.1003945-2-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211201073308.1003945-1-yoshihiro.shimoda.uh@renesas.com>
References: <20211201073308.1003945-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add device tree bindings documentation for Renesas R-Car S4-8
Spider CPU and BreakOut boards.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 Documentation/devicetree/bindings/arm/renesas.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/renesas.yaml b/Documentation/devicetree/bindings/arm/renesas.yaml
index 36197f53b310..afd864b75bb6 100644
--- a/Documentation/devicetree/bindings/arm/renesas.yaml
+++ b/Documentation/devicetree/bindings/arm/renesas.yaml
@@ -317,6 +317,14 @@ properties:
 
       - description: R-Car S4-8 (R8A779F0)
         items:
+          - enum:
+              - renesas,spider-cpu # Spider CPU board (RTP8A779FASKB0SC2S)
+          - const: renesas,r8a779f0
+
+      - items:
+          - enum:
+              - renesas,spider-breakout # Spider BreakOut board (RTP8A779F0ASKB0SB0S)
+          - const: renesas,spider-cpu
           - const: renesas,r8a779f0
 
       - description: R-Car H3e (R8A779M0)
-- 
2.25.1

