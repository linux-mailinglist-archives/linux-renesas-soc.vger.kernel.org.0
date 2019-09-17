Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF821B4E8F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Sep 2019 14:55:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726211AbfIQMzI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Sep 2019 08:55:08 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:1617 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725901AbfIQMzI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Sep 2019 08:55:08 -0400
X-IronPort-AV: E=Sophos;i="5.64,516,1559487600"; 
   d="scan'208";a="26794183"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 17 Sep 2019 21:55:06 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 30B7B40065C4;
        Tue, 17 Sep 2019 21:55:04 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH] dt-bindings: arm: renesas: Add HopeRun RZ/G2N boards
Date:   Tue, 17 Sep 2019 13:48:12 +0100
Message-Id: <1568724492-32087-1-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds board HiHope RZ/G2N (the main board, powered by
the R8A774B1) and board HiHope RZ/G2 EX (the expansion board
that sits on top of the HiHope RZ/G2N). Both boards are made
by Jiangsu HopeRun Software Co., Ltd. (a.k.a. HopeRun).

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 Documentation/devicetree/bindings/arm/renesas.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/renesas.yaml b/Documentation/devicetree/bindings/arm/renesas.yaml
index 9ad31f1..bc0b4ec 100644
--- a/Documentation/devicetree/bindings/arm/renesas.yaml
+++ b/Documentation/devicetree/bindings/arm/renesas.yaml
@@ -118,6 +118,14 @@ properties:
 
       - description: RZ/G2N (R8A774B1)
         items:
+          - enum:
+              - hoperun,hihope-rzg2n # HopeRun HiHope RZ/G2N platform
+          - const: renesas,r8a774b1
+
+      - items:
+          - enum:
+              - hoperun,hihope-rzg2-ex # HopeRun expansion board for HiHope RZ/G2 platforms
+          - const: hoperun,hihope-rzg2n
           - const: renesas,r8a774b1
 
       - description: RZ/G2E (R8A774C0)
-- 
2.7.4

