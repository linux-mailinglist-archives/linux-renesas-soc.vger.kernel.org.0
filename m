Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A3DF218EFD
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jul 2020 19:50:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728249AbgGHRsq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Jul 2020 13:48:46 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:48841 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725953AbgGHRsp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Jul 2020 13:48:45 -0400
X-IronPort-AV: E=Sophos;i="5.75,328,1589209200"; 
   d="scan'208";a="51641770"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 09 Jul 2020 02:48:44 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id DDF294005E3D;
        Thu,  9 Jul 2020 02:48:40 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/8] dt-bindings: serial: renesas,hscif: Document r8a774e1 bindings
Date:   Wed,  8 Jul 2020 18:48:25 +0100
Message-Id: <1594230511-24790-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594230511-24790-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <1594230511-24790-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

RZ/G2H (R8A774E1) SoC also has the R-Car gen3 compatible HSCIF ports,
so document the SoC specific bindings.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 Documentation/devicetree/bindings/serial/renesas,hscif.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/renesas,hscif.yaml b/Documentation/devicetree/bindings/serial/renesas,hscif.yaml
index 6b04c0451d41..9fb87a648c1b 100644
--- a/Documentation/devicetree/bindings/serial/renesas,hscif.yaml
+++ b/Documentation/devicetree/bindings/serial/renesas,hscif.yaml
@@ -42,6 +42,7 @@ properties:
               - renesas,hscif-r8a774a1     # RZ/G2M
               - renesas,hscif-r8a774b1     # RZ/G2N
               - renesas,hscif-r8a774c0     # RZ/G2E
+              - renesas,hscif-r8a774e1     # RZ/G2H
               - renesas,hscif-r8a7795      # R-Car H3
               - renesas,hscif-r8a7796      # R-Car M3-W
               - renesas,hscif-r8a77961     # R-Car M3-W+
-- 
2.17.1

