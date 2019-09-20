Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 467A1B935F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Sep 2019 16:47:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393141AbfITOrK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 20 Sep 2019 10:47:10 -0400
Received: from baptiste.telenet-ops.be ([195.130.132.51]:48950 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393140AbfITOrJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Sep 2019 10:47:09 -0400
Received: from ramsan ([84.194.98.4])
        by baptiste.telenet-ops.be with bizsmtp
        id 3qn62100405gfCL01qn6is; Fri, 20 Sep 2019 16:47:06 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iBKBe-0001PU-1S; Fri, 20 Sep 2019 16:47:06 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iBKBd-00078Z-VN; Fri, 20 Sep 2019 16:47:05 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] soc: renesas: rcar-sysc: Remove unneeded inclusion of <linux/bug.h>
Date:   Fri, 20 Sep 2019 16:47:05 +0200
Message-Id: <20190920144705.27394-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

No R-Car or RZ/G SYSC driver uses any of the definitions provided by
<linux/bug.h>, hence there is no need to include this header file.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v5.5.

 drivers/soc/renesas/r8a7743-sysc.c  | 1 -
 drivers/soc/renesas/r8a7745-sysc.c  | 1 -
 drivers/soc/renesas/r8a77470-sysc.c | 1 -
 drivers/soc/renesas/r8a774a1-sysc.c | 1 -
 drivers/soc/renesas/r8a774c0-sysc.c | 1 -
 drivers/soc/renesas/r8a7779-sysc.c  | 1 -
 drivers/soc/renesas/r8a7790-sysc.c  | 1 -
 drivers/soc/renesas/r8a7791-sysc.c  | 1 -
 drivers/soc/renesas/r8a7792-sysc.c  | 1 -
 drivers/soc/renesas/r8a7794-sysc.c  | 1 -
 drivers/soc/renesas/r8a7795-sysc.c  | 1 -
 drivers/soc/renesas/r8a7796-sysc.c  | 1 -
 drivers/soc/renesas/r8a77965-sysc.c | 1 -
 drivers/soc/renesas/r8a77970-sysc.c | 1 -
 drivers/soc/renesas/r8a77980-sysc.c | 1 -
 drivers/soc/renesas/r8a77990-sysc.c | 1 -
 drivers/soc/renesas/r8a77995-sysc.c | 1 -
 17 files changed, 17 deletions(-)

diff --git a/drivers/soc/renesas/r8a7743-sysc.c b/drivers/soc/renesas/r8a7743-sysc.c
index edf6436e879fa662..4e2c0ab951b3dc7d 100644
--- a/drivers/soc/renesas/r8a7743-sysc.c
+++ b/drivers/soc/renesas/r8a7743-sysc.c
@@ -5,7 +5,6 @@
  * Copyright (C) 2016 Cogent Embedded Inc.
  */
 
-#include <linux/bug.h>
 #include <linux/kernel.h>
 
 #include <dt-bindings/power/r8a7743-sysc.h>
diff --git a/drivers/soc/renesas/r8a7745-sysc.c b/drivers/soc/renesas/r8a7745-sysc.c
index 65dc6b09cc858d38..865821a2f0c6f74d 100644
--- a/drivers/soc/renesas/r8a7745-sysc.c
+++ b/drivers/soc/renesas/r8a7745-sysc.c
@@ -5,7 +5,6 @@
  * Copyright (C) 2016 Cogent Embedded Inc.
  */
 
-#include <linux/bug.h>
 #include <linux/kernel.h>
 
 #include <dt-bindings/power/r8a7745-sysc.h>
diff --git a/drivers/soc/renesas/r8a77470-sysc.c b/drivers/soc/renesas/r8a77470-sysc.c
index cfa015e208ef0042..1eeb8018df506428 100644
--- a/drivers/soc/renesas/r8a77470-sysc.c
+++ b/drivers/soc/renesas/r8a77470-sysc.c
@@ -5,7 +5,6 @@
  * Copyright (C) 2018 Renesas Electronics Corp.
  */
 
-#include <linux/bug.h>
 #include <linux/kernel.h>
 
 #include <dt-bindings/power/r8a77470-sysc.h>
diff --git a/drivers/soc/renesas/r8a774a1-sysc.c b/drivers/soc/renesas/r8a774a1-sysc.c
index 9db51ff6f5edde4e..38ac2c689ff00a0c 100644
--- a/drivers/soc/renesas/r8a774a1-sysc.c
+++ b/drivers/soc/renesas/r8a774a1-sysc.c
@@ -7,7 +7,6 @@
  * Copyright (C) 2016 Glider bvba
  */
 
-#include <linux/bug.h>
 #include <linux/kernel.h>
 
 #include <dt-bindings/power/r8a774a1-sysc.h>
diff --git a/drivers/soc/renesas/r8a774c0-sysc.c b/drivers/soc/renesas/r8a774c0-sysc.c
index 40d1558aab37ca4d..c1c216f7d0733c44 100644
--- a/drivers/soc/renesas/r8a774c0-sysc.c
+++ b/drivers/soc/renesas/r8a774c0-sysc.c
@@ -7,7 +7,6 @@
  */
 
 #include <linux/bits.h>
-#include <linux/bug.h>
 #include <linux/kernel.h>
 #include <linux/sys_soc.h>
 
diff --git a/drivers/soc/renesas/r8a7779-sysc.c b/drivers/soc/renesas/r8a7779-sysc.c
index 517aa40fa6e6d493..e24a7151d55f5835 100644
--- a/drivers/soc/renesas/r8a7779-sysc.c
+++ b/drivers/soc/renesas/r8a7779-sysc.c
@@ -5,7 +5,6 @@
  * Copyright (C) 2016 Glider bvba
  */
 
-#include <linux/bug.h>
 #include <linux/kernel.h>
 
 #include <dt-bindings/power/r8a7779-sysc.h>
diff --git a/drivers/soc/renesas/r8a7790-sysc.c b/drivers/soc/renesas/r8a7790-sysc.c
index 9b5a6bb621520963..b9afe7f6245b383c 100644
--- a/drivers/soc/renesas/r8a7790-sysc.c
+++ b/drivers/soc/renesas/r8a7790-sysc.c
@@ -5,7 +5,6 @@
  * Copyright (C) 2016 Glider bvba
  */
 
-#include <linux/bug.h>
 #include <linux/kernel.h>
 
 #include <dt-bindings/power/r8a7790-sysc.h>
diff --git a/drivers/soc/renesas/r8a7791-sysc.c b/drivers/soc/renesas/r8a7791-sysc.c
index acf545cdebfbe1f2..f00fa24522a3b236 100644
--- a/drivers/soc/renesas/r8a7791-sysc.c
+++ b/drivers/soc/renesas/r8a7791-sysc.c
@@ -5,7 +5,6 @@
  * Copyright (C) 2016 Glider bvba
  */
 
-#include <linux/bug.h>
 #include <linux/kernel.h>
 
 #include <dt-bindings/power/r8a7791-sysc.h>
diff --git a/drivers/soc/renesas/r8a7792-sysc.c b/drivers/soc/renesas/r8a7792-sysc.c
index 05b78525cc430bac..60aae242c43f570d 100644
--- a/drivers/soc/renesas/r8a7792-sysc.c
+++ b/drivers/soc/renesas/r8a7792-sysc.c
@@ -5,7 +5,6 @@
  * Copyright (C) 2016 Cogent Embedded Inc.
  */
 
-#include <linux/bug.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
 
diff --git a/drivers/soc/renesas/r8a7794-sysc.c b/drivers/soc/renesas/r8a7794-sysc.c
index 0d42637fa6620994..72ef4e85458ff3a4 100644
--- a/drivers/soc/renesas/r8a7794-sysc.c
+++ b/drivers/soc/renesas/r8a7794-sysc.c
@@ -5,7 +5,6 @@
  * Copyright (C) 2016 Glider bvba
  */
 
-#include <linux/bug.h>
 #include <linux/kernel.h>
 
 #include <dt-bindings/power/r8a7794-sysc.h>
diff --git a/drivers/soc/renesas/r8a7795-sysc.c b/drivers/soc/renesas/r8a7795-sysc.c
index 7e15cd09c4eb4780..91074411b8cfe48f 100644
--- a/drivers/soc/renesas/r8a7795-sysc.c
+++ b/drivers/soc/renesas/r8a7795-sysc.c
@@ -6,7 +6,6 @@
  */
 
 #include <linux/bits.h>
-#include <linux/bug.h>
 #include <linux/kernel.h>
 #include <linux/sys_soc.h>
 
diff --git a/drivers/soc/renesas/r8a7796-sysc.c b/drivers/soc/renesas/r8a7796-sysc.c
index a4eaa8d1f5d0f49d..d374622a667bbfbd 100644
--- a/drivers/soc/renesas/r8a7796-sysc.c
+++ b/drivers/soc/renesas/r8a7796-sysc.c
@@ -6,7 +6,6 @@
  */
 
 #include <linux/bits.h>
-#include <linux/bug.h>
 #include <linux/kernel.h>
 #include <linux/sys_soc.h>
 
diff --git a/drivers/soc/renesas/r8a77965-sysc.c b/drivers/soc/renesas/r8a77965-sysc.c
index b5d8230d4bbc1b87..ff0b0d1169922bfb 100644
--- a/drivers/soc/renesas/r8a77965-sysc.c
+++ b/drivers/soc/renesas/r8a77965-sysc.c
@@ -8,7 +8,6 @@
  */
 
 #include <linux/bits.h>
-#include <linux/bug.h>
 #include <linux/kernel.h>
 
 #include <dt-bindings/power/r8a77965-sysc.h>
diff --git a/drivers/soc/renesas/r8a77970-sysc.c b/drivers/soc/renesas/r8a77970-sysc.c
index b3033e3f0fd0b0ff..706258250600652e 100644
--- a/drivers/soc/renesas/r8a77970-sysc.c
+++ b/drivers/soc/renesas/r8a77970-sysc.c
@@ -6,7 +6,6 @@
  */
 
 #include <linux/bits.h>
-#include <linux/bug.h>
 #include <linux/kernel.h>
 
 #include <dt-bindings/power/r8a77970-sysc.h>
diff --git a/drivers/soc/renesas/r8a77980-sysc.c b/drivers/soc/renesas/r8a77980-sysc.c
index e3b5ee1b3091dee1..39ca84a67daadd21 100644
--- a/drivers/soc/renesas/r8a77980-sysc.c
+++ b/drivers/soc/renesas/r8a77980-sysc.c
@@ -7,7 +7,6 @@
  */
 
 #include <linux/bits.h>
-#include <linux/bug.h>
 #include <linux/kernel.h>
 
 #include <dt-bindings/power/r8a77980-sysc.h>
diff --git a/drivers/soc/renesas/r8a77990-sysc.c b/drivers/soc/renesas/r8a77990-sysc.c
index 1d2432020b7a15d2..9f92737dc3526ba2 100644
--- a/drivers/soc/renesas/r8a77990-sysc.c
+++ b/drivers/soc/renesas/r8a77990-sysc.c
@@ -6,7 +6,6 @@
  */
 
 #include <linux/bits.h>
-#include <linux/bug.h>
 #include <linux/kernel.h>
 #include <linux/sys_soc.h>
 
diff --git a/drivers/soc/renesas/r8a77995-sysc.c b/drivers/soc/renesas/r8a77995-sysc.c
index 6243aaaf60fbb51c..efcc67e3d76dc513 100644
--- a/drivers/soc/renesas/r8a77995-sysc.c
+++ b/drivers/soc/renesas/r8a77995-sysc.c
@@ -5,7 +5,6 @@
  * Copyright (C) 2017 Glider bvba
  */
 
-#include <linux/bug.h>
 #include <linux/kernel.h>
 
 #include <dt-bindings/power/r8a77995-sysc.h>
-- 
2.17.1

