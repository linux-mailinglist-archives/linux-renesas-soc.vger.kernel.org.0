Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17E431E0F52
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2020 15:21:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390675AbgEYNVx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 May 2020 09:21:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388685AbgEYNVx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 May 2020 09:21:53 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73CBFC061A0E
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 May 2020 06:21:53 -0700 (PDT)
Received: from Q.local (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DA50A24D;
        Mon, 25 May 2020 15:21:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1590412912;
        bh=sj/b51fmFWMPnkcErhv0uGlEjkNITwp029zs+BFrT+I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=vi/f56dK1UzPgW8vgC4/fW0EFHynRnGl8b9A+wgCFCNzWspHOy8d1KI4z2UaPP7aZ
         vvuZetj/vjX3eqBc7UwunwTyUGPa6IdNA05FLo5K0wEF3EeGobS2qClL/LTSC7lpgv
         6AJ3gmmu3QIRvU6FDf6xE+iF3StwH27cxnglzyYY=
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Cc:     Eugeniu Rosca <roscaeugeniu@gmail.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [VSP-Tests PATCH] tests: Provide {un,}bind testing
Date:   Mon, 25 May 2020 14:21:48 +0100
Message-Id: <20200525132148.3454488-1-kieran.bingham@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <d4544b1b-a695-bd70-0ccb-e2fb1838f3f8@ideasonboard.com>
References: <d4544b1b-a695-bd70-0ccb-e2fb1838f3f8@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Perform unbind-bind testing of the VSP devices to validate
successful removal of the drivers.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 tests/vsp-unit-test-0026.sh | 63 +++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100755 tests/vsp-unit-test-0026.sh

diff --git a/tests/vsp-unit-test-0026.sh b/tests/vsp-unit-test-0026.sh
new file mode 100755
index 000000000000..86c523a65651
--- /dev/null
+++ b/tests/vsp-unit-test-0026.sh
@@ -0,0 +1,63 @@
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
+	# Unbind and rebind individually
+	for v in $vsps; do
+		unbind_vsp $v;
+		bind_vsp $v;
+	done
+
+	# Unbind, then rebind all VSPs at once
+	for v in $vsps; do
+		unbind_vsp $v;
+	done
+	for v in $vsps; do
+		bind_vsp $v;
+	done;
+
+	# Perform a simple copy test to validate HW is alive
+	test_copy RGB24 128x128
+}
+
+test_init $0 "$features"
+test_run
-- 
2.25.1

