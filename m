Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54B2039DCE2
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jun 2021 14:48:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230242AbhFGMua (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Jun 2021 08:50:30 -0400
Received: from www.zeus03.de ([194.117.254.33]:34018 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230233AbhFGMu3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Jun 2021 08:50:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version:content-type
        :content-transfer-encoding; s=k1; bh=oGVu9sD0aGq6pO8YoYNJl6zW8nM
        WYUMTbfsOYdfBnXA=; b=JyjrEB2eZ4oXmzO8xp6olQRLGEh5emyrjWTO3W0m6ld
        /IHaikWwo6POEvAamBZmH+GVHAbXUQ0X8YjBGSYqPk4faI/A9wTSwQqsOPeOz8UA
        wbm9q7tPe4JLnM9X1ApMNtCaLZGC9pNO+fwFTi2DdCC6OeQbKOwLfKS9oNYwTNcA
        =
Received: (qmail 729490 invoked from network); 7 Jun 2021 14:48:36 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Jun 2021 14:48:36 +0200
X-UD-Smtp-Session: l3s3148p1@uVuvdSzEbs+57tsr
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-kernel@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        devicetree@vger.kernel.org
Subject: [PATCH V2 RESEND] dt-bindings: timer: renesas,tmu: add r8a779a0 TMU support
Date:   Mon,  7 Jun 2021 14:48:28 +0200
Message-Id: <20210607124828.1984-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---

Changes since v1:
* rebased to -next (other SoCs have been added meanwhile)
  rebased second time for the resend
* added tags from Niklas and Geert (thanks!)

 Documentation/devicetree/bindings/timer/renesas,tmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/renesas,tmu.yaml b/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
index f0f0f121c355..c57169118b68 100644
--- a/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
+++ b/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
@@ -36,6 +36,7 @@ properties:
           - renesas,tmu-r8a77980 # R-Car V3H
           - renesas,tmu-r8a77990 # R-Car E3
           - renesas,tmu-r8a77995 # R-Car D3
+          - renesas,tmu-r8a779a0 # R-Car V3U
       - const: renesas,tmu
 
   reg:
-- 
2.30.2

