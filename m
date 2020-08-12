Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2272242ACF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Aug 2020 16:03:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726684AbgHLODM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Aug 2020 10:03:12 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:17492 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726651AbgHLODH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Aug 2020 10:03:07 -0400
X-IronPort-AV: E=Sophos;i="5.76,304,1592838000"; 
   d="scan'208";a="54444336"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 12 Aug 2020 23:03:06 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 2144F4008C6D;
        Wed, 12 Aug 2020 23:03:02 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Marian-Cristian Rotariu 
        <marian-cristian.rotariu.rb@bp.renesas.com>
Subject: [PATCH 5/9] dt-bindings: display: renesas,dw-hdmi: Add r8a774e1 support
Date:   Wed, 12 Aug 2020 15:02:13 +0100
Message-Id: <20200812140217.24251-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200812140217.24251-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20200812140217.24251-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>

Document RZ/G2H (R8A774E1) SoC bindings.

Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../devicetree/bindings/display/bridge/renesas,dw-hdmi.txt       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
index 819f3e31013c..f275997ab947 100644
--- a/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
+++ b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
@@ -14,6 +14,7 @@ Required properties:
 - compatible : Shall contain one or more of
   - "renesas,r8a774a1-hdmi" for R8A774A1 (RZ/G2M) compatible HDMI TX
   - "renesas,r8a774b1-hdmi" for R8A774B1 (RZ/G2N) compatible HDMI TX
+  - "renesas,r8a774e1-hdmi" for R8A774E1 (RZ/G2H) compatible HDMI TX
   - "renesas,r8a7795-hdmi" for R8A7795 (R-Car H3) compatible HDMI TX
   - "renesas,r8a7796-hdmi" for R8A7796 (R-Car M3-W) compatible HDMI TX
   - "renesas,r8a77965-hdmi" for R8A77965 (R-Car M3-N) compatible HDMI TX
-- 
2.17.1

