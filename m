Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63E051D22EB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2020 01:21:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732521AbgEMXVj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 May 2020 19:21:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1732374AbgEMXVi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 May 2020 19:21:38 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E743C061A0C;
        Wed, 13 May 2020 16:21:38 -0700 (PDT)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E1EFB304;
        Thu, 14 May 2020 01:21:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1589412097;
        bh=nSYfl51exhXTHIawrSl7iIpoBoDAweq1HgMxwdwidWk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PSZjTaptSGDslymBNifH+MVUaTO8e3TIaLX3HXy5RZd9IKKce6AwWDaniaDBb3qo3
         llLoQs4RYU1t8QEKcilFbnN7mE9mvUynm9K59dO7HGZZPuIRI9CMocfbmZPRevA9H5
         i5SIUTmIorQqZwTF3zetzR3hFm2nYkueGXTAO6m8=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 5/4] dt-bindings: display: bridge: thc63lvd1024: Document dual-output mode
Date:   Thu, 14 May 2020 02:21:27 +0300
Message-Id: <20200513232127.21798-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200406111543.GC4757@pendragon.ideasonboard.com>
References: <20200406111543.GC4757@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The DT binding support both dual-input and dual-output mode, but only
dual-input is documented. Document dual-output mode.

Suggested-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../display/bridge/thine,thc63lvd1024.yaml       | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.yaml b/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.yaml
index 469ac4a34273..fedd3460d6f6 100644
--- a/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.yaml
@@ -30,11 +30,17 @@ properties:
       This device has four video ports. Their connections are modeled using the
       OF graph bindings specified in Documentation/devicetree/bindings/graph.txt.
 
-      The device can operate in single-link mode or dual-link mode. In
-      single-link mode, all pixels are received on port@0, and port@1 shall not
-      contain any endpoint. In dual-link mode, even-numbered pixels are
-      received on port@0 and odd-numbered pixels on port@1, and both port@0 and
-      port@1 shall contain endpoints.
+      The device can operate in single or dual input and output modes.
+
+      When operating in single input mode, all pixels are received on port@0,
+      and port@1 shall not contain any endpoint. In dual input mode,
+      even-numbered pixels are received on port@0 and odd-numbered pixels on
+      port@1, and both port@0 and port@1 shall contain endpoints.
+
+      When operating in single output mode all pixels are output from the first
+      CMOS/TTL port and port@3 shall not contain any endpoint. In dual output
+      mode pixels are output from both CMOS/TTL ports and both port@2 and
+      port@3 shall contain endpoints.
 
     properties:
       '#address-cells':
-- 
Regards,

Laurent Pinchart

