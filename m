Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB2D132ED0A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Mar 2021 15:25:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229818AbhCEOYf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 5 Mar 2021 09:24:35 -0500
Received: from www.zeus03.de ([194.117.254.33]:36782 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230161AbhCEOYE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 5 Mar 2021 09:24:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=Db2OqtDIcsIdYQMFBPuOR8jWP/j
        2kyScFTv4LFMBMSw=; b=w9dYBbV50ODMyzmlsGJTsbCT0FUT6WpTWhK20N41I7e
        N4RAwo6rw1dy8Kp85LbiWT4ylHSI/Hz4huhrfQzHb7rSnBZ0WQmXp5GzdQrgEMtp
        zS2sXaDEimfC3Qq6DBQxwYw5NYD21YWBrwEnkEUUOaawJH6DoPmjHniSw5e/29fI
        =
Received: (qmail 2249510 invoked from network); 5 Mar 2021 15:24:02 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Mar 2021 15:24:02 +0100
X-UD-Smtp-Session: l3s3148p1@nSLt1cq8XplN91Vm
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] dt-bindings: timer: renesas,tmu: add r8a779a0 TMU support
Date:   Fri,  5 Mar 2021 15:23:59 +0100
Message-Id: <20210305142359.11992-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

This is the correct one. TMU passed the testsuite, CMT needs a second
look.

 Documentation/devicetree/bindings/timer/renesas,tmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/renesas,tmu.yaml b/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
index c54188731a1b..20af9ce05ae5 100644
--- a/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
+++ b/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
@@ -30,6 +30,7 @@ properties:
           - renesas,tmu-r8a7779  # R-Car H1
           - renesas,tmu-r8a77970 # R-Car V3M
           - renesas,tmu-r8a77980 # R-Car V3H
+          - renesas,tmu-r8a779a0 # R-Car V3U
       - const: renesas,tmu
 
   reg:
-- 
2.29.2

