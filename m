Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5675B17D96D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Mar 2020 07:49:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725942AbgCIGti (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Mar 2020 02:49:38 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:39043 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725796AbgCIGti (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Mar 2020 02:49:38 -0400
X-IronPort-AV: E=Sophos;i="5.70,532,1574089200"; 
   d="scan'208";a="41144970"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 09 Mar 2020 15:49:36 +0900
Received: from localhost.localdomain (unknown [10.166.15.86])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id A980D400618F;
        Mon,  9 Mar 2020 15:49:36 +0900 (JST)
From:   Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>
Subject: [PATCH 1/2] dt-bindings: arm: renesas: Add M3ULCB with R-Car M3-W+
Date:   Mon,  9 Mar 2020 15:44:24 +0900
Message-Id: <20200309064425.25437-2-yuya.hamamachi.sx@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200309064425.25437-1-yuya.hamamachi.sx@renesas.com>
References: <20200309064425.25437-1-yuya.hamamachi.sx@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add device tree binding documentation for the Renesas M3ULCB board equipped
with an R-Car M3-W+ (R8A77961) SoC.

Signed-off-by: Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>
---
 Documentation/devicetree/bindings/arm/renesas.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/renesas.yaml b/Documentation/devicetree/bindings/arm/renesas.yaml
index 9436124c5809..611094d9186b 100644
--- a/Documentation/devicetree/bindings/arm/renesas.yaml
+++ b/Documentation/devicetree/bindings/arm/renesas.yaml
@@ -208,6 +208,7 @@ properties:
       - description: R-Car M3-W+ (R8A77961)
         items:
           - enum:
+              - renesas,m3ulcb # M3ULCB (R-Car Starter Kit Pro, RTP8J77961ASKB0SK0SA05A (M3 ES3.0))
               - renesas,salvator-xs # Salvator-XS (Salvator-X 2nd version, RTP0RC7796SIPB0012SA5A)
           - const: renesas,r8a77961
 
-- 
2.25.1

