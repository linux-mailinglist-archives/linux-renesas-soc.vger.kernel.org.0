Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35C532163E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 May 2019 11:27:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728924AbfEQJ1F (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 May 2019 05:27:05 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:59553 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728299AbfEQJ1F (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 May 2019 05:27:05 -0400
X-IronPort-AV: E=Sophos;i="5.60,479,1549897200"; 
   d="scan'208";a="16234975"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 17 May 2019 18:27:03 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 6B2524006DF2;
        Fri, 17 May 2019 18:26:59 +0900 (JST)
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Thierry Reding <treding@nvidia.com>,
        =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>, xu_shunji@hoperun.com
Subject: [PATCH v3 1/2] dt-bindings: Add vendor prefix for HopeRun
Date:   Fri, 17 May 2019 10:26:28 +0100
Message-Id: <1558085189-22061-2-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558085189-22061-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1558085189-22061-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add "Jiangsu HopeRun Software Co., Ltd." to the list of devicetree
vendor prefixes as "hoperun".

Website: http://www.hoperun.com/en

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>

---
v2->v3:
* Moved to vendor-prefixes.yaml
* Dropped Reviewed-by Simon as this is a completely new patch and as
  such it needs a brand new review
v1->v2:
* No change
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 33a65a4..83ca481 100644
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
2.7.4

