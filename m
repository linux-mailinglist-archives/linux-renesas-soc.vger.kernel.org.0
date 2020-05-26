Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1386E1E30D0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2020 23:02:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390151AbgEZVCA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 May 2020 17:02:00 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:12474 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2389124AbgEZVB7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 May 2020 17:01:59 -0400
X-IronPort-AV: E=Sophos;i="5.73,437,1583161200"; 
   d="scan'208";a="47867537"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 27 May 2020 06:01:59 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id BF07440DAD1F;
        Wed, 27 May 2020 06:01:56 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     alsa-devel@alsa-project.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/2] dt-bindings: ASoC: renesas,rsnd: Add r8a7742 support
Date:   Tue, 26 May 2020 22:01:43 +0100
Message-Id: <1590526904-13855-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590526904-13855-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <1590526904-13855-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document RZ/G1H (R8A7742) SoC bindings.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
---
 Documentation/devicetree/bindings/sound/renesas,rsnd.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.txt b/Documentation/devicetree/bindings/sound/renesas,rsnd.txt
index 797fd03..1596f0d 100644
--- a/Documentation/devicetree/bindings/sound/renesas,rsnd.txt
+++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.txt
@@ -263,6 +263,7 @@ Required properties:
 				  "renesas,rcar_sound-gen2" if generation2 (or RZ/G1)
 				  "renesas,rcar_sound-gen3" if generation3 (or RZ/G2)
 				  Examples with soctypes are:
+				    - "renesas,rcar_sound-r8a7742" (RZ/G1H)
 				    - "renesas,rcar_sound-r8a7743" (RZ/G1M)
 				    - "renesas,rcar_sound-r8a7744" (RZ/G1N)
 				    - "renesas,rcar_sound-r8a7745" (RZ/G1E)
-- 
2.7.4

