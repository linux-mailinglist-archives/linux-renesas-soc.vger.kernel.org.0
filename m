Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC46A564BF0
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Jul 2022 04:56:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229473AbiGDC4m (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 3 Jul 2022 22:56:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229931AbiGDC4l (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 3 Jul 2022 22:56:41 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 868F43888
        for <linux-renesas-soc@vger.kernel.org>; Sun,  3 Jul 2022 19:56:40 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id r22so833904pgr.2
        for <linux-renesas-soc@vger.kernel.org>; Sun, 03 Jul 2022 19:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u3s42XxdHyXge/pVFWIS+CHtmK4obou0ip/X+qwriSo=;
        b=qRmtW2k0k8IqQFCsFlteLbDRsoPXK/fITgaOuVF/DoeOWLTGZbMg5O8OtjFc28gX7O
         VFFqxAW265jnsiVMay2TTkTovpUhASN3PiOt5TTIYunHNAPnOgQCH043JbomCt4Gjyd6
         LrWJC3SEJY3v5Mxp36G2pVM5Zxg6y6YN+gy/VeX5VH5Q3WLqCdq6ZuYj5yK8nEqCwYda
         CwQyRLQcscpFgIkkpPdrvDyoqkaObvgFeTf6um2CSTzZlaU087uuPCRrJsZyAjeNs2po
         IOahfga+eHmo52cOrVxsRDaxWYEAIr2M97ok9aD3Wgaushb++l+GE1ng/zJk1maCxnYp
         PxFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u3s42XxdHyXge/pVFWIS+CHtmK4obou0ip/X+qwriSo=;
        b=Oq4MWXm8obEVLNrl98Rg43xnjNA/fizTWhhduRZ1gL9iJRNodtJyktWqNsOYKfHy0V
         ocs8ZG9fk9DttH6KS7jYMsVV7COol6aYSO2yMMPbk3ploovz3AGCD/UqAjI5ujQ65KDM
         3qnhDcNFw2xwwz92oyNyufh0SFhgMRLIgd/V2cI35WRok139nWaOVftcKT72bUnJhZS3
         u4h8RZ0hnQOTLYR5x93vMxdDZsFIR9JfZ2baahYngCsih/JHkVCj+HCFbwqPAGCvAJoL
         2VH+flK8NCyDH0Zsl3II8Gh2epLEaRgvx+pspWDd48QdqxHdlLA3mLRxqqjESHak0i5N
         kxww==
X-Gm-Message-State: AJIora841KOMffzkKR0UOUW5QMAKuzNwgyBAeiFqdiSYeeQstXZ6zVs1
        0Jwh0F7ijI47ffyHHHeYxUB1pWFxkb15xWLl
X-Google-Smtp-Source: AGRyM1u/r3PgF2xAEyNochUkRBQAL+YL/q5MGpH4AwwtNo0hFzkO7gA1dfKPb2tV/Lo2sfkHclWiwA==
X-Received: by 2002:a05:6a00:140f:b0:4e0:6995:9c48 with SMTP id l15-20020a056a00140f00b004e069959c48mr33196835pfu.59.1656903399793;
        Sun, 03 Jul 2022 19:56:39 -0700 (PDT)
Received: from taki-u2.hq.igel.co.jp (napt.igel.co.jp. [219.106.231.132])
        by smtp.gmail.com with ESMTPSA id q10-20020a170902f78a00b0016b80d2fac8sm14283887pln.248.2022.07.03.19.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jul 2022 19:56:39 -0700 (PDT)
From:   Takanari Hayama <taki@igel.co.jp>
To:     linux-renesas-soc@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com
Subject: [PATCH 2/3] kmstest: Support specifying pixel blend mode for planes
Date:   Mon,  4 Jul 2022 11:56:31 +0900
Message-Id: <20220704025632.3911253-3-taki@igel.co.jp>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220704025632.3911253-1-taki@igel.co.jp>
References: <20220704025632.3911253-1-taki@igel.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add an optional pixel blend mode argument to the atomic_plane_set()
function to  specify the pixel blend mode for the plane.

Signed-off-by: Takanari Hayama <taki@igel.co.jp>
---
 tests/kmstest.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/kmstest.py b/tests/kmstest.py
index 224c160e32fa..a39ceab3891b 100755
--- a/tests/kmstest.py
+++ b/tests/kmstest.py
@@ -395,7 +395,7 @@ class KMSTest(object):
         else:
             return req.commit(0, True)
 
-    def atomic_plane_set(self, plane, crtc, source, destination, fb, alpha=None, zpos=None, sync=False):
+    def atomic_plane_set(self, plane, crtc, source, destination, fb, alpha=None, zpos=None, blendmode=None, sync=False):
         req = AtomicRequest(self)
         req.add(plane, {
                     'FB_ID': fb.id,
@@ -413,6 +413,8 @@ class KMSTest(object):
             req.add(plane, 'alpha', alpha)
         if zpos is not None:
             req.add(plane, 'zpos', zpos)
+        if blendmode is not None:
+            req.add(plane, 'pixel blend mode', blendmode)
         if sync:
             return req.commit_sync()
         else:
-- 
2.25.1

