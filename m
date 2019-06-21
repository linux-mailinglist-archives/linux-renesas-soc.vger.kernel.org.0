Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFB094E2B1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2019 11:11:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726218AbfFUJLY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Jun 2019 05:11:24 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:33354 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726210AbfFUJLY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Jun 2019 05:11:24 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id C12A025AEEC;
        Fri, 21 Jun 2019 19:11:20 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id C006B940396; Fri, 21 Jun 2019 11:11:18 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        "David S . Miller" <davem@davemloft.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 2/9] dt-bindings: Add vendor prefix for HopeRun
Date:   Fri, 21 Jun 2019 11:11:09 +0200
Message-Id: <9d79b2f1aed4909988ecd8b370c7919856639699.1561107729.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1561107729.git.horms+renesas@verge.net.au>
References: <cover.1561107729.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Add "Jiangsu HopeRun Software Co., Ltd." to the list of devicetree
vendor prefixes as "hoperun".

Website: http://www.hoperun.com/en

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 33a65a45e319..83ca4816a78b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -371,6 +371,8 @@ patternProperties:
     description: Holt Integrated Circuits, Inc.
   "^honeywell,.*":
     description: Honeywell
+  "^hoperun,.*":
+    description: Jiangsu HopeRun Software Co., Ltd.
   "^hp,.*":
     description: Hewlett Packard
   "^holtek,.*":
-- 
2.11.0

