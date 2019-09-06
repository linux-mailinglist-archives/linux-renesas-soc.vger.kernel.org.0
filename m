Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EFFD0AB6FB
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2019 13:16:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726462AbfIFLQq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 6 Sep 2019 07:16:46 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:33500 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726073AbfIFLQq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Sep 2019 07:16:46 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 2FE9425B7AD;
        Fri,  6 Sep 2019 21:16:44 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 1E3949445E7; Fri,  6 Sep 2019 13:16:42 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH] dt-bindings: Correct spelling in example schema
Date:   Fri,  6 Sep 2019 13:16:24 +0200
Message-Id: <20190906111624.6820-1-horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Correct spelling of "identifier".

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
Based on v5.3-rc1
---
 Documentation/devicetree/bindings/example-schema.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/example-schema.yaml b/Documentation/devicetree/bindings/example-schema.yaml
index 9175d67f355d..c43819c2783a 100644
--- a/Documentation/devicetree/bindings/example-schema.yaml
+++ b/Documentation/devicetree/bindings/example-schema.yaml
@@ -5,7 +5,7 @@
 # All the top-level keys are standard json-schema keywords except for
 # 'maintainers' and 'select'
 
-# $id is a unique idenifier based on the filename. There may or may not be a
+# $id is a unique identifier based on the filename. There may or may not be a
 # file present at the URL.
 $id: "http://devicetree.org/schemas/example-schema.yaml#"
 # $schema is the meta-schema this schema should be validated with.
-- 
2.11.0

