Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA6275458B7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jun 2022 01:40:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238503AbiFIXk5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Jun 2022 19:40:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237000AbiFIXk4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Jun 2022 19:40:56 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF17420A5F4
        for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Jun 2022 16:40:54 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BFB899F7;
        Fri, 10 Jun 2022 01:40:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1654818044;
        bh=r87wCBB4j2ophvRPuZbG4lnkS+7gH6zD2cjvu5RcV3g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YFFoCMxEDuBCu3pY2R+ExWiQOGfKOXX0YVsX4jH7q0yQTVnoLIs4aLDnrZN05szJU
         qIZPjEd7GyzoPYzi3qq1qpFrW5odAaCqNDUq+3dhQjzGPBInC81f/P8Us1MPUMNPLB
         Q0lJXyGg9qZkX8GAvUkrfyFg5cyGgqP1gux+dmic=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [kms-test] [PATCH 05/10] kmstest: Support specifying property values in percents
Date:   Fri, 10 Jun 2022 02:40:26 +0300
Message-Id: <20220609234031.14803-6-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220609234031.14803-1-laurent.pinchart@ideasonboard.com>
References: <20220609234031.14803-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

If the property is a string that ends with a '%' character, treat it as
a percentage of the range reported by the property and convert it to the
corresponding numerical value.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 tests/kmstest.py | 27 ++++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/tests/kmstest.py b/tests/kmstest.py
index 2afaa513aa4d..a99bf3b89d34 100755
--- a/tests/kmstest.py
+++ b/tests/kmstest.py
@@ -258,8 +258,25 @@ class AtomicRequest(pykms.AtomicReq):
         self.__test = test
         self.__props = {}
 
-    def __format_props(self, props):
-        return {k: v & ((1 << 64) - 1) for k, v in props.items()}
+    def __format_props(self, obj, props):
+        out = {}
+        for k, v in props.items():
+            if isinstance(v, str):
+                if v.endswith('%'):
+                    prop = obj.get_prop(k)
+                    if prop.type not in (pykms.PropertyType.Range, pykms.PropertyType.SignedRange):
+                        raise RuntimeError(f'Unsupported property type {prop.type} for value {v}')
+
+                    min, max = prop.values
+                    v = min + int((max - min) * int(v[:-1]) / 100)
+                else:
+                    v = int(v)
+
+            if not isinstance(v, int):
+                raise RuntimeError(f'Unsupported value type {type(v)} for property {k}')
+
+            out[k] = v & ((1 << 64) - 1)
+        return out
 
     def add(self, obj, *kwargs):
         if obj.id not in self.__props:
@@ -267,13 +284,13 @@ class AtomicRequest(pykms.AtomicReq):
         obj_props = self.__props[obj.id]
 
         if len(kwargs) == 1 and isinstance(kwargs[0], collections.abc.Mapping):
-            props = self.__format_props(kwargs[0])
+            props = self.__format_props(obj, kwargs[0])
         elif len(kwargs) == 2:
-            props = self.__format_props({ kwargs[0]: = kwargs[1] })
+            props = self.__format_props(obj, { kwargs[0]: kwargs[1] })
 
         obj_props.update(props)
 
-        super().add(obj, *kwargs)
+        super().add(obj, props)
 
     def commit(self, data=0, allow_modeset=False):
         ret = super().commit(data, allow_modeset)
-- 
Regards,

Laurent Pinchart

