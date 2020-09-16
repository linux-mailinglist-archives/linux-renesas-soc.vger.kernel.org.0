Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D22DB26C8CA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Sep 2020 20:57:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726507AbgIPS5q (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Sep 2020 14:57:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727413AbgIPRxQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Sep 2020 13:53:16 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DF56C002184
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Sep 2020 07:18:37 -0700 (PDT)
Received: from Q.local (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0DD0A26B;
        Wed, 16 Sep 2020 16:18:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1600265905;
        bh=4o5DTKHE0f9KxLdQkHn0OQUhAax/CuHlASp1v/HedD4=;
        h=From:To:Cc:Subject:Date:From;
        b=WkSs/a4E6OLtAag8eJJNoGMVhnFOS4BQgiUVYay1lQ8bkTEWc9AQkewcAcJxqGwCt
         wGf+SXTkI6Cglh802obpsAjbZcijXUo6HSBQOgDJCXxtjzVLXAuj7PtuxwbKbPmH0O
         dHv6tvIkQx6gP6Jem1RPrDKbzTbqYA6xY4Nh3uC0=
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v2] tests: Provide {un,}bind testing
Date:   Wed, 16 Sep 2020 15:18:15 +0100
Message-Id: <20200916141815.1481807-1-kieran.bingham@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Perform unbind-bind testing of the VSP devices to validate
successful removal of the drivers.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---

v2:
 - Semi-colons removed
 - duplicated tests removed.

This is the updated patch, I intend to push to master.

--
Kieran


 tests/vsp-unit-test-0026.sh | 55 +++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100755 tests/vsp-unit-test-0026.sh

diff --git a/tests/vsp-unit-test-0026.sh b/tests/vsp-unit-test-0026.sh
new file mode 100755
index 000000000000..0e013cec881b
--- /dev/null
+++ b/tests/vsp-unit-test-0026.sh
@@ -0,0 +1,55 @@
+#!/bin/sh
+
+#
+# Test unbinding and binding all VSP1 devices, performing a simple
+# copy test to validate the hardware afterwards.
+#
+
+. ./vsp-lib.sh
+
+features="rpf.0 wpf.0"
+
+vsp1_driver=/sys/bus/platform/drivers/vsp1
+vsps=$(cd /sys/bus/platform/devices/; ls | grep vsp)
+
+unbind_vsp() {
+	echo $1 > $vsp1_driver/unbind
+}
+
+bind_vsp() {
+	echo $1 > $vsp1_driver/bind
+}
+
+# Input is directly copied to the output. No change in format or size.
+test_copy() {
+	local format=$1
+	local insize=$2
+
+	test_start "simple hardware validation after unbind/bind cycles"
+
+	pipe_configure rpf-wpf 0 0
+	format_configure rpf-wpf 0 0 $format $insize $format
+
+	vsp_runner rpf.0 &
+	vsp_runner wpf.0
+
+	local result=$(compare_frames)
+
+	test_complete $result
+}
+
+test_main() {
+	local format
+
+	# Unbind and rebind VSPs individually
+	for v in $vsps; do
+		unbind_vsp $v
+		bind_vsp $v
+	done
+
+	# Perform a simple copy test to validate HW is alive
+	test_copy RGB24 128x128
+}
+
+test_init $0 "$features"
+test_run
-- 
2.25.1

