Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E73797EB6E4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Nov 2023 20:30:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229456AbjKNTa4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Nov 2023 14:30:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbjKNTaj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Nov 2023 14:30:39 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AFCEBB
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Nov 2023 11:30:33 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9C212EBA;
        Tue, 14 Nov 2023 20:30:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1699990204;
        bh=8Acwfq/QWLPbxnb7H66pazV2DtcmUy4p7ugYI3ApURA=;
        h=From:To:Cc:Subject:Date:From;
        b=lYWGS5e40ZQ2+of6B+zffwkwJx6wICE6GU6qO8R7/OWMqQHwzFjU9MdtVnBLA/jtm
         ZuxEGx81YckPh5novYQWnLTEjbt/amhjQHjCmKDhHyPI9AjaAXxEhdBcW30ne59cQL
         XULEtRmrtkOxKdLOuxYdr6vPUclXh5W+d/6zUxBU=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [kmsxx] [PATCH] testpat: Fix memory mapping in threaded drawing
Date:   Tue, 14 Nov 2023 21:30:36 +0200
Message-ID: <20231114193036.27049-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The IFramebuffer::map() function is not thread-safe, which is why the
threaded implementation of draw_test_pattern_impl() maps all planes
before starting to draw. A typo slipped in the code, resulting in only
plane 0 being mapped. This didn't result in an immediate segfault, as
drawing operations in the worker threads map the remaining planes.
However, due to the implementation of DumbFramebuffer::map(), this can
result in the same plane being mapped multiple times, with only one of
the mapping recorded in the mapping cache. The other mappings are then
leaked, leading not only to extra memory consumption, but also to the
DRM device never being released even after the destruction of the Card
object.

Fix this.

Fixes: 40d96062a37c ("Revert "testpat: remove threaded drawing"")
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
I've noticed this issue when running the DU KMS tests, when the tests
run right after multi-planar format tests would sometimes fail, while
running fine in isolation. It was "fun" to debug, for some definition of
"fun".
---
 kms++util/src/testpat.cpp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kms++util/src/testpat.cpp b/kms++util/src/testpat.cpp
index 78c9d19a5ad7..1102588cc9f7 100644
--- a/kms++util/src/testpat.cpp
+++ b/kms++util/src/testpat.cpp
@@ -173,7 +173,7 @@ static void draw_test_pattern_impl(IFramebuffer& fb, YUVType yuvt)
 
 	// Create the mmaps before starting the threads
 	for (unsigned i = 0; i < fb.num_planes(); ++i)
-		fb.map(0);
+		fb.map(i);
 
 	unsigned num_threads = thread::hardware_concurrency();
 	vector<thread> workers;

base-commit: c23e7548ee317c043660f9b992388257e99f1776
-- 
Regards,

Laurent Pinchart

