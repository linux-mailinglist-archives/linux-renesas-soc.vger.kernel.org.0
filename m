Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34EAE39E5AC
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jun 2021 19:42:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230197AbhFGRoe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Jun 2021 13:44:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229997AbhFGRoe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Jun 2021 13:44:34 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FF42C061766
        for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Jun 2021 10:42:42 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:c184:ea65:c3d6:a616])
        by albert.telenet-ops.be with bizsmtp
        id EHig2500B1G4u2S06HiggZ; Mon, 07 Jun 2021 19:42:40 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lqJGq-00E7pO-8m; Mon, 07 Jun 2021 19:42:40 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lqJGp-0079Lv-R3; Mon, 07 Jun 2021 19:42:39 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: rcar-gen3: Add SoC model to comment headers
Date:   Mon,  7 Jun 2021 19:42:38 +0200
Message-Id: <2cb7113d307b1bfdb33cd96245202b2d5d867818.1623087738.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Make sure the R-Car Gen3 SoC model present is documented in the comment
header of each board DTS.  This makes it easier to identify boards that
are available with different SoC or SiP options.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v5.14.

 arch/arm64/boot/dts/renesas/r8a77950-ulcb-kf.dts | 2 +-
 arch/arm64/boot/dts/renesas/r8a77950-ulcb.dts    | 3 ++-
 arch/arm64/boot/dts/renesas/r8a77951-ulcb-kf.dts | 2 +-
 arch/arm64/boot/dts/renesas/r8a77951-ulcb.dts    | 3 ++-
 arch/arm64/boot/dts/renesas/r8a77960-ulcb-kf.dts | 2 +-
 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts    | 3 ++-
 arch/arm64/boot/dts/renesas/r8a77961-ulcb-kf.dts | 2 +-
 arch/arm64/boot/dts/renesas/r8a77965-ulcb-kf.dts | 2 +-
 arch/arm64/boot/dts/renesas/r8a77965-ulcb.dts    | 3 ++-
 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts   | 2 +-
 arch/arm64/boot/dts/renesas/r8a77980-condor.dts  | 2 +-
 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts   | 2 +-
 arch/arm64/boot/dts/renesas/r8a77995-draak.dts   | 2 +-
 arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts  | 2 +-
 14 files changed, 18 insertions(+), 14 deletions(-)

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
index 38a6d6a108d488ed..f1df707b98a6e269 100644
--- a/arch/arm64/boot/dts/renesas/r8a77950-ulcb.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77950-ulcb.dts
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Device Tree Source for the H3ULCB (R-Car Starter Kit Premier) board
+ * Device Tree Source for the H3ULCB (R-Car Starter Kit Premier) board with
+ * R-Car H3 ES1.x
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
index 8ad8f2a539771de8..21ce300b54abecef 100644
--- a/arch/arm64/boot/dts/renesas/r8a77951-ulcb.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77951-ulcb.dts
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Device Tree Source for the H3ULCB (R-Car Starter Kit Premier) board
+ * Device Tree Source for the H3ULCB (R-Car Starter Kit Premier) board with
+ * R-Car H3 ES2.0+
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
index d041042a56192ab2..d936fb9281be6edd 100644
--- a/arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Device Tree Source for the M3ULCB (R-Car Starter Kit Pro) board
+ * Device Tree Source for the M3ULCB (R-Car Starter Kit Pro) board with R-Car
+ * M3-W
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
index 964078b6cc49e959..87b013279c74dc48 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965-ulcb.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77965-ulcb.dts
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Device Tree Source for the M3NULCB (R-Car Starter Kit Pro) board
+ * Device Tree Source for the M3NULCB (R-Car Starter Kit Pro) board with R-Car
+ * M3-N
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
index 4715e4a4abe064cd..236671401bc1e4de 100644
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
index 6783c3ad08567e4b..9290ea49e2dd3c7a 100644
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

