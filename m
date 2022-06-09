Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A65DB5458B4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jun 2022 01:40:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237871AbiFIXkx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Jun 2022 19:40:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237000AbiFIXkw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Jun 2022 19:40:52 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E445205F8C
        for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Jun 2022 16:40:51 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D34079B1;
        Fri, 10 Jun 2022 01:40:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1654818043;
        bh=VolIJTVgnCbeIKSi5Gra0e9A1r1F5DzfyGmAbD70/BY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WsQInHosgfio8IiY1xKf6d+R+DcnP9kzLN8edUgeJqxuA++miKu3Z0YZqG6DezV1m
         idtcTO9iWmJJCt+afgderP9zQXHLdibM3aCEO/6BCsq1uNVKkSJfL8KMSMoXcP6lrJ
         ATfR/JbnGYALBu2EaVPVr3vhq9kNcK9cMYfwGkY0=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [kms-test] [PATCH 03/10] tests: allplanes: Log the plane IDs
Date:   Fri, 10 Jun 2022 02:40:24 +0300
Message-Id: <20220609234031.14803-4-laurent.pinchart@ideasonboard.com>
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

Plane IDs are useful for debugging, log them.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 tests/kms-test-allplanes.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/kms-test-allplanes.py b/tests/kms-test-allplanes.py
index 0fe6cfab0a2d..96ac4f19f538 100755
--- a/tests/kms-test-allplanes.py
+++ b/tests/kms-test-allplanes.py
@@ -46,7 +46,8 @@ class AllPlanesTest(kmstest.KMSTest):
                 continue
 
             self.logger.log(f'Testing connector {connector.fullname}, CRTC {crtc.id}, '
-                            f'mode {mode.name} with {len(planes)} planes')
+                            f'mode {mode.name} with {len(planes)} planes '
+                            f'(P: {crtc.primary_plane.id}, O: {[plane.id for plane in planes]})')
 
             # Create a frame buffer
             fb = pykms.DumbFramebuffer(self.card, mode.hdisplay, mode.vdisplay, 'XR24')
-- 
Regards,

Laurent Pinchart

