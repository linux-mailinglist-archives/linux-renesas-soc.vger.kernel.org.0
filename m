Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 102DE452BF1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Nov 2021 08:44:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230461AbhKPHpt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Nov 2021 02:45:49 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:62354 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231368AbhKPHpo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Nov 2021 02:45:44 -0500
X-IronPort-AV: E=Sophos;i="5.87,238,1631545200"; 
   d="scan'208";a="100767139"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 16 Nov 2021 16:42:38 +0900
Received: from localhost.localdomain (unknown [10.166.14.185])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id E1064400C4FD;
        Tue, 16 Nov 2021 16:42:37 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org,
        gregkh@linuxfoundation.org, jirislaby@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-serial@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 06/16] dt-bindings: clock: renesas,cpg-mssr: Document r8a779f0
Date:   Tue, 16 Nov 2021 16:41:20 +0900
Message-Id: <20211116074130.107554-7-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211116074130.107554-1-yoshihiro.shimoda.uh@renesas.com>
References: <20211116074130.107554-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add binding documentation for the R-Car S4-8 (R8A779F0) Clock Pulse
Generator.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
index 9b414fbde6d7..e0b86214f0f5 100644
--- a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
@@ -48,6 +48,7 @@ properties:
       - renesas,r8a77990-cpg-mssr # R-Car E3
       - renesas,r8a77995-cpg-mssr # R-Car D3
       - renesas,r8a779a0-cpg-mssr # R-Car V3U
+      - renesas,r8a779f0-cpg-mssr # R-Car S4-8
 
   reg:
     maxItems: 1
-- 
2.25.1

