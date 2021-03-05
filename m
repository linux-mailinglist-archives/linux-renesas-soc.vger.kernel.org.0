Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F111932EC9D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Mar 2021 14:56:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231140AbhCEN4V (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 5 Mar 2021 08:56:21 -0500
Received: from www.zeus03.de ([194.117.254.33]:53250 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230423AbhCEN4N (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 5 Mar 2021 08:56:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=/fW9K0irdCEFidceFN8Hjw5GYun
        xF6GvAyPEXzxASEQ=; b=bgjlLBawYusbRljl7HwsCEDsu1hEgP6yTzkhFH3vQFG
        7Vhia2iR5YML3XzZF6k6PcwI0LgG+FyJ+8D8eidK4v52RLSZ2aHwHCaNhnu4QtHJ
        h4+5QPNXojnP4QbNG9LFSyCk5tDZ4KeNjLeXVKJyiY8LDuPBijHVJoh/NP0w0qeg
        =
Received: (qmail 2241771 invoked from network); 5 Mar 2021 14:56:11 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Mar 2021 14:56:11 +0100
X-UD-Smtp-Session: l3s3148p1@XPIdcsq8TJlN91Vm
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] dt-bindings: timer: renesas,cmt: add r8a779a0 CMT support
Date:   Fri,  5 Mar 2021 14:56:03 +0100
Message-Id: <20210305135603.1227-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

CMT passed the testsuite fine, so let's add it.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

 Documentation/devicetree/bindings/timer/renesas,cmt.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/renesas,cmt.yaml b/Documentation/devicetree/bindings/timer/renesas,cmt.yaml
index 428db3a21bb9..363ec28e07da 100644
--- a/Documentation/devicetree/bindings/timer/renesas,cmt.yaml
+++ b/Documentation/devicetree/bindings/timer/renesas,cmt.yaml
@@ -79,6 +79,7 @@ properties:
               - renesas,r8a77980-cmt0     # 32-bit CMT0 on R-Car V3H
               - renesas,r8a77990-cmt0     # 32-bit CMT0 on R-Car E3
               - renesas,r8a77995-cmt0     # 32-bit CMT0 on R-Car D3
+              - renesas,r8a779a0-cmt0     # 32-bit CMT0 on R-Car V3U
           - const: renesas,rcar-gen3-cmt0 # 32-bit CMT0 on R-Car Gen3 and RZ/G2
 
       - items:
@@ -94,6 +95,7 @@ properties:
               - renesas,r8a77980-cmt1     # 48-bit CMT on R-Car V3H
               - renesas,r8a77990-cmt1     # 48-bit CMT on R-Car E3
               - renesas,r8a77995-cmt1     # 48-bit CMT on R-Car D3
+              - renesas,r8a779a0-cmt1     # 48-bit CMT on R-Car V3U
           - const: renesas,rcar-gen3-cmt1 # 48-bit CMT on R-Car Gen3 and RZ/G2
 
   reg:
-- 
2.29.2

