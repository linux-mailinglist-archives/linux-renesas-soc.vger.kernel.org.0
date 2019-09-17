Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD08DB4E7E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Sep 2019 14:52:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726181AbfIQMwU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Sep 2019 08:52:20 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:57923 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725901AbfIQMwU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Sep 2019 08:52:20 -0400
X-IronPort-AV: E=Sophos;i="5.64,516,1559487600"; 
   d="scan'208";a="26574875"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 17 Sep 2019 21:52:18 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 4B0FA41ABBEA;
        Tue, 17 Sep 2019 21:52:16 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Biju Das <biju.das@bp.renesas.com>, linux-serial@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] dt-bindings: serial: sh-sci: Document r8a774b1 bindings
Date:   Tue, 17 Sep 2019 13:45:24 +0100
Message-Id: <1568724324-26995-1-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

RZ/G2N (R8A774B1) SoC also has the R-Car Gen3 compatible SCIF and
HSCIF ports, so document the SoC specific bindings.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 Documentation/devicetree/bindings/serial/renesas,sci-serial.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/renesas,sci-serial.txt b/Documentation/devicetree/bindings/serial/renesas,sci-serial.txt
index dd63151..b143d9a 100644
--- a/Documentation/devicetree/bindings/serial/renesas,sci-serial.txt
+++ b/Documentation/devicetree/bindings/serial/renesas,sci-serial.txt
@@ -26,6 +26,8 @@ Required properties:
     - "renesas,hscif-r8a77470" for R8A77470 (RZ/G1C) HSCIF compatible UART.
     - "renesas,scif-r8a774a1" for R8A774A1 (RZ/G2M) SCIF compatible UART.
     - "renesas,hscif-r8a774a1" for R8A774A1 (RZ/G2M) HSCIF compatible UART.
+    - "renesas,scif-r8a774b1" for R8A774B1 (RZ/G2N) SCIF compatible UART.
+    - "renesas,hscif-r8a774b1" for R8A774B1 (RZ/G2N) HSCIF compatible UART.
     - "renesas,scif-r8a774c0" for R8A774C0 (RZ/G2E) SCIF compatible UART.
     - "renesas,hscif-r8a774c0" for R8A774C0 (RZ/G2E) HSCIF compatible UART.
     - "renesas,scif-r8a7778" for R8A7778 (R-Car M1) SCIF compatible UART.
-- 
2.7.4

