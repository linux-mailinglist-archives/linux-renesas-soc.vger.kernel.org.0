Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD3314C6A78
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Feb 2022 12:29:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229929AbiB1LaB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Feb 2022 06:30:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231290AbiB1LaA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Feb 2022 06:30:00 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBC4A49270
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Feb 2022 03:29:21 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 743D5A67;
        Mon, 28 Feb 2022 12:29:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1646047757;
        bh=gxRu9R+pUzKq+Yi0XgfngHHUGhm5bjhN6VHzTBg0n/k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=oJ+pyC4B4wjcZ2xiToGp+9Jtp7c4ZKEgOQH4CIFgKbk38ji65wPeS7gPzVprDkIxb
         iCnxfgiw5ia4175uM/lZ0HknwBobETl+5XeIN9jpBbb5C9dnNf/ZLlbn1II505cdy8
         IMWnHpreBcYDeKf7S//7ZUOKoVQQ0CSp/ny0mEnk=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH 3/3] tests: Add RPF cropping test for YUV formats
Date:   Mon, 28 Feb 2022 13:29:01 +0200
Message-Id: <20220228112901.21289-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220228112901.21289-1-laurent.pinchart@ideasonboard.com>
References: <20220228112901.21289-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

YUV formats can be subsampled, which interact with cropping. Add a test
to verify that the VSP driver handles this correctly.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 tests/vsp-unit-test-0027.sh | 46 +++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100755 tests/vsp-unit-test-0027.sh

diff --git a/tests/vsp-unit-test-0027.sh b/tests/vsp-unit-test-0027.sh
new file mode 100755
index 000000000000..8be8ae736375
--- /dev/null
+++ b/tests/vsp-unit-test-0027.sh
@@ -0,0 +1,46 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2017-2022 Renesas Electronics Corporation
+
+#
+# Test RPF crop using multiplanar YUV formats, test buffer offset calculation
+# with subsampling. Use a RPF -> WPF pipeline, passing a selection of cropping
+# windows.
+#
+
+. ./vsp-lib.sh
+
+features="rpf.0 wpf.0"
+crops="(0,0)/512x384 (32,32)/512x384 (32,64)/512x384 (64,32)/512x384"
+formats="NV12M NV16M YUV420M YUV422M YUV444M"
+
+test_rpf_cropping() {
+	local format=$1
+	local crop=$2
+
+	test_start "RPF crop from $crop in $format"
+
+	pipe_configure rpf-wpf 0 0
+	format_configure rpf-wpf 0 0 $format 1024x768 YUV444M --rpfcrop=$crop
+
+	vsp_runner rpf.0 &
+	vsp_runner wpf.0
+
+	local result=$(compare_frames crop=${crop})
+
+	test_complete $result
+}
+
+test_main() {
+	local crop
+	local format
+
+	for format in $formats ; do
+		for crop in $crops ; do
+			test_rpf_cropping $format $crop
+		done
+	done
+}
+
+test_init $0 "$features"
+test_run
-- 
Regards,

Laurent Pinchart

