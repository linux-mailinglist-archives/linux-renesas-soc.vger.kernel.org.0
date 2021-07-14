Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F1073C83D6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jul 2021 13:24:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232151AbhGNL1s (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 14 Jul 2021 07:27:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231136AbhGNL1r (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Jul 2021 07:27:47 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36273C06175F
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jul 2021 04:24:56 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:39cc:190a:2775:cfe7])
        by michel.telenet-ops.be with bizsmtp
        id UzQu2500A1ccfby06zQuGF; Wed, 14 Jul 2021 13:24:54 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m3d0Y-0017XL-0G; Wed, 14 Jul 2021 13:24:54 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m3d0X-00A7ri-2R; Wed, 14 Jul 2021 13:24:53 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2] arm64: dts: renesas: rcar-gen3: Add SoC model to comment headers
Date:   Wed, 14 Jul 2021 13:24:51 +0200
Message-Id: <251569665d7d4f4ed4bbab7267ce2ddccdef33e5.1626261816.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Make sure the R-Car Gen3 SoC model present is documented in the comment
header of each board DTS, on a single line.  This makes it easier to
identify boards that are available with different SoC or SiP options.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
--
To be queued in renesas-devel for v5.15.

v2:
  - Add Reviewed-by,
  - Use a single line for easier grepping.
---
 arch/arm64/boot/dts/renesas/r8a77950-ulcb-kf.dts | 2 +-
 arch/arm64/boot/dts/renesas/r8a77950-ulcb.dts    | 2 +-
 arch/arm64/boot/dts/renesas/r8a77951-ulcb-kf.dts | 2 +-
 arch/arm64/boot/dts/renesas/r8a77951-ulcb.dts    | 2 +-
 arch/arm64/boot/dts/renesas/r8a77960-ulcb-kf.dts | 2 +-
 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts    | 2 +-
 arch/arm64/boot/dts/renesas/r8a77961-ulcb-kf.dts | 2 +-
 arch/arm64/boot/dts/renesas/r8a77961-ulcb.dts    | 3 +--
 arch/arm64/boot/dts/renesas/r8a77965-ulcb-kf.dts | 2 +-
 arch/arm64/boot/dts/renesas/r8a77965-ulcb.dts    | 2 +-
 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts   | 2 +-
 arch/arm64/boot/dts/renesas/r8a77980-condor.dts  | 2 +-
 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts   | 2 +-
 arch/arm64/boot/dts/renesas/r8a77995-draak.dts   | 2 +-
 arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts  | 2 +-
 15 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77950-ulcb-kf.dts b/arch/arm64/boot/dts/renesas/r8a77950-ulcb-kf.dts
index dcaaf12cec40dab4..85f008ef63ded5d6 100644
--- a/arch/arm64/boot/dts/renesas/r8a77950-ulcb-kf.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77950-ulcb-kf.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Device Tree Source for the H3ULCB Kingfisher board
+ * Device Tree Source for the H3ULCB Kingfisher board with R-Car H3 ES1.x
  *
  * Copyright (C) 2017 Renesas Electronics Corp.
  * Copyright (C) 2017 Cogent Embedded, Inc.
diff --git a/arch/arm64/boot/dts/renesas/r8a77950-ulcb.dts b/arch/arm64/boot/dts/renesas/r8a77950-ulcb.dts
index 38a6d6a108d488ed..5340579931e35f8c 100644
--- a/arch/arm64/boot/dts/renesas/r8a77950-ulcb.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77950-ulcb.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Device Tree Source for the H3ULCB (R-Car Starter Kit Premier) board
+ * Device Tree Source for the H3ULCB (R-Car Starter Kit Premier) board with R-Car H3 ES1.x
  *
  * Copyright (C) 2016 Renesas Electronics Corp.
  * Copyright (C) 2016 Cogent Embedded, Inc.
diff --git a/arch/arm64/boot/dts/renesas/r8a77951-ulcb-kf.dts b/arch/arm64/boot/dts/renesas/r8a77951-ulcb-kf.dts
index 11f943a67703f0a8..2e58a27aa2766603 100644
--- a/arch/arm64/boot/dts/renesas/r8a77951-ulcb-kf.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77951-ulcb-kf.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Device Tree Source for the H3ULCB Kingfisher board
+ * Device Tree Source for the H3ULCB Kingfisher board with R-Car H3 ES2.0+
  *
  * Copyright (C) 2017 Renesas Electronics Corp.
  * Copyright (C) 2017 Cogent Embedded, Inc.
diff --git a/arch/arm64/boot/dts/renesas/r8a77951-ulcb.dts b/arch/arm64/boot/dts/renesas/r8a77951-ulcb.dts
index 8ad8f2a539771de8..06d4e948eb0f1292 100644
--- a/arch/arm64/boot/dts/renesas/r8a77951-ulcb.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77951-ulcb.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Device Tree Source for the H3ULCB (R-Car Starter Kit Premier) board
+ * Device Tree Source for the H3ULCB (R-Car Starter Kit Premier) board with R-Car H3 ES2.0+
  *
  * Copyright (C) 2016 Renesas Electronics Corp.
  * Copyright (C) 2016 Cogent Embedded, Inc.
diff --git a/arch/arm64/boot/dts/renesas/r8a77960-ulcb-kf.dts b/arch/arm64/boot/dts/renesas/r8a77960-ulcb-kf.dts
index 2151c37d77a6c942..02d61360692c0ac6 100644
--- a/arch/arm64/boot/dts/renesas/r8a77960-ulcb-kf.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77960-ulcb-kf.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Device Tree Source for the M3ULCB Kingfisher board
+ * Device Tree Source for the M3ULCB Kingfisher board with R-Car M3-W
  *
  * Copyright (C) 2017 Renesas Electronics Corp.
  * Copyright (C) 2017 Cogent Embedded, Inc.
diff --git a/arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts b/arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts
index d041042a56192ab2..4bfeb1df0488dc7a 100644
--- a/arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Device Tree Source for the M3ULCB (R-Car Starter Kit Pro) board
+ * Device Tree Source for the M3ULCB (R-Car Starter Kit Pro) board with R-Car M3-W
  *
  * Copyright (C) 2016 Renesas Electronics Corp.
  * Copyright (C) 2016 Cogent Embedded, Inc.
diff --git a/arch/arm64/boot/dts/renesas/r8a77961-ulcb-kf.dts b/arch/arm64/boot/dts/renesas/r8a77961-ulcb-kf.dts
index 6ec958348eb025d9..d66eb27ee8c48189 100644
--- a/arch/arm64/boot/dts/renesas/r8a77961-ulcb-kf.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77961-ulcb-kf.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Device Tree Source for the M3ULCB Kingfisher board
+ * Device Tree Source for the M3ULCB Kingfisher board with R-Car M3-W+
  *
  * Copyright (C) 2020 Eugeniu Rosca <rosca.eugeniu@gmail.com>
  */
diff --git a/arch/arm64/boot/dts/renesas/r8a77961-ulcb.dts b/arch/arm64/boot/dts/renesas/r8a77961-ulcb.dts
index 294a055f117ea72b..70cf926667a6eee9 100644
--- a/arch/arm64/boot/dts/renesas/r8a77961-ulcb.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77961-ulcb.dts
@@ -1,7 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Device Tree Source for the M3ULCB (R-Car Starter Kit Pro) board with R-Car
- * M3-W+
+ * Device Tree Source for the M3ULCB (R-Car Starter Kit Pro) board with R-Car M3-W+
  *
  * Copyright (C) 2020 Renesas Electronics Corp.
  */
diff --git a/arch/arm64/boot/dts/renesas/r8a77965-ulcb-kf.dts b/arch/arm64/boot/dts/renesas/r8a77965-ulcb-kf.dts
index 12aa08fd6fd87f7e..a601968c5727e55a 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965-ulcb-kf.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77965-ulcb-kf.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Device Tree Source for the M3NULCB Kingfisher board
+ * Device Tree Source for the M3NULCB Kingfisher board with R-Car M3-N
  *
  * Copyright (C) 2018 Renesas Electronics Corp.
  * Copyright (C) 2018 Cogent Embedded, Inc.
diff --git a/arch/arm64/boot/dts/renesas/r8a77965-ulcb.dts b/arch/arm64/boot/dts/renesas/r8a77965-ulcb.dts
index 964078b6cc49e959..71704b67a20e13b1 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965-ulcb.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77965-ulcb.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Device Tree Source for the M3NULCB (R-Car Starter Kit Pro) board
+ * Device Tree Source for the M3NULCB (R-Car Starter Kit Pro) board with R-Car M3-N
  *
  * Copyright (C) 2018 Renesas Electronics Corp.
  * Copyright (C) 2018 Cogent Embedded, Inc.
diff --git a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
index 5c84681703edad2e..d24da54f312b9085 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Device Tree Source for the Eagle board
+ * Device Tree Source for the Eagle board with R-Car V3M
  *
  * Copyright (C) 2016-2017 Renesas Electronics Corp.
  * Copyright (C) 2017 Cogent Embedded, Inc.
diff --git a/arch/arm64/boot/dts/renesas/r8a77980-condor.dts b/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
index 7bde0a549c09884f..edf7f2a2f958787c 100644
--- a/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Device Tree Source for the Condor board
+ * Device Tree Source for the Condor board with R-Car V3H
  *
  * Copyright (C) 2018 Renesas Electronics Corp.
  * Copyright (C) 2018 Cogent Embedded, Inc.
diff --git a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
index df647de9015b0949..9c7146084ea1c779 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Device Tree Source for the ebisu board
+ * Device Tree Source for the Ebisu board with R-Car E3
  *
  * Copyright (C) 2018 Renesas Electronics Corp.
  */
diff --git a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
index 192a7806f16bac87..f0f585a4046196f2 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Device Tree Source for the Draak board
+ * Device Tree Source for the Draak board with R-Car D3
  *
  * Copyright (C) 2016-2018 Renesas Electronics Corp.
  * Copyright (C) 2017 Glider bvba
diff --git a/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts b/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
index 687f019e79f059a1..dc671ff57ec7678a 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Device Tree Source for the Falcon CPU and BreakOut boards
+ * Device Tree Source for the Falcon CPU and BreakOut boards with R-Car V3U
  *
  * Copyright (C) 2020 Renesas Electronics Corp.
  */
-- 
2.25.1

