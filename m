Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A69F586072
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 31 Jul 2022 20:52:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235053AbiGaSws (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 31 Jul 2022 14:52:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237661AbiGaSwq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 31 Jul 2022 14:52:46 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94F52E037
        for <linux-renesas-soc@vger.kernel.org>; Sun, 31 Jul 2022 11:52:43 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2A68F415;
        Sun, 31 Jul 2022 20:52:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1659293562;
        bh=eBfnfDHslXJbMu7WHHvEm6XeS0XUVMM2vkRzHqkqaO8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=aJGttAtE3YutjsOOMtMmWPO5nliJ9w/sHvEGyxkQ5qMv6vu+xSmCi3mANodpGpFeC
         K+njTom+0dPZk9dD38wzikDqe1X/qt1Ctt53y/7UUuMxOTwF4PDaC98jc+wK/Azq4N
         M7NMvnhXJHOUH5g6dk8hdK0xUr+ryl8/i42gipvM=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [kms-test] [PATCH 9/7] kmstest: Raise clear exception when property is not found
Date:   Sun, 31 Jul 2022 21:52:37 +0300
Message-Id: <20220731185237.11151-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220731152024.24090-1-laurent.pinchart@ideasonboard.com>
References: <20220731152024.24090-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

When converting a property value string to an integer, if the property
is not found, an AttributeError exception is raised and reports that
"'NoneType' object has no attribute 'type'". This isn't very clear,
replace it with a RuntimeError with a proper message.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 tests/kmstest.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/kmstest.py b/tests/kmstest.py
index e84d8fe859f4..3e53defc1dae 100755
--- a/tests/kmstest.py
+++ b/tests/kmstest.py
@@ -268,6 +268,8 @@ class AtomicRequest(pykms.AtomicReq):
             if isinstance(v, str):
                 if v.endswith('%'):
                     prop = obj.get_prop(k)
+                    if not prop:
+                        raise RuntimeError(f'Property {k} not supported by object {obj}')
                     if prop.type not in (pykms.PropertyType.Range, pykms.PropertyType.SignedRange):
                         raise RuntimeError(f'Unsupported property type {prop.type} for value {v}')
 
-- 
Regards,

Laurent Pinchart

