Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C514825F653
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Sep 2020 11:20:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728400AbgIGJU2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Sep 2020 05:20:28 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:34821 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728239AbgIGJUJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Sep 2020 05:20:09 -0400
X-IronPort-AV: E=Sophos;i="5.76,401,1592838000"; 
   d="scan'208";a="56349404"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 07 Sep 2020 18:20:08 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 49CAE40065CD;
        Mon,  7 Sep 2020 18:20:08 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 05/14] dt-bindings: reset: renesas,rst: Document r8a779a0 reset module
Date:   Mon,  7 Sep 2020 18:19:41 +0900
Message-Id: <1599470390-29719-6-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599470390-29719-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1599470390-29719-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document bindings for the R-Car V3U (R8A779A0) reset module.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 Documentation/devicetree/bindings/reset/renesas,rst.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/reset/renesas,rst.yaml b/Documentation/devicetree/bindings/reset/renesas,rst.yaml
index 2849ce4..620cd05 100644
--- a/Documentation/devicetree/bindings/reset/renesas,rst.yaml
+++ b/Documentation/devicetree/bindings/reset/renesas,rst.yaml
@@ -47,6 +47,7 @@ properties:
       - renesas,r8a77980-rst      # R-Car V3H
       - renesas,r8a77990-rst      # R-Car E3
       - renesas,r8a77995-rst      # R-Car D3
+      - renesas,r8a779a0-rst      # R-Car V3U
 
   reg:
     maxItems: 1
-- 
2.7.4

