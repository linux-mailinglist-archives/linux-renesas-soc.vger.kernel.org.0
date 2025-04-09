Return-Path: <linux-renesas-soc+bounces-15627-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6E0A81A18
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Apr 2025 02:49:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC287467D1B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Apr 2025 00:48:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A665C2AE97;
	Wed,  9 Apr 2025 00:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ItphXU+r"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241553E47B
	for <linux-renesas-soc@vger.kernel.org>; Wed,  9 Apr 2025 00:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744159731; cv=none; b=jJn1RdVzAe2IbRlegh08XArJ+NCqrjXQ4A0h7p4xfROUQzjtHuiLPc8G2T/LFjevZdH3cwONOscnSmQ5sALRzTMfeC98yTfOge1rDeKzF6QRQIcJpuPBZOYrMrfYob1Rzy8wh2g5UihvRiKJqPy5l6WY8RZcqV/I8YHAyJ7AWaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744159731; c=relaxed/simple;
	bh=iG6bbHir4U+SlquzrIuANlxmJUEL/YGfgDPY7mCCzc0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aSHLt4hChBVvMfnJYs3UlRwH7dfBkSph3zAApS4BjUxS/9J5OpuEoK8jHyFj+LgaU/wau1BXMeN53DHVU7H0BNbdcK5c4/v7/BLx8TDhl5h0I7wvlY1AIp2YQB4Hcrp6EkgbNfTlnI8L9njyxPntyJINHONa9sFi6+dTplfs4mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ItphXU+r; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0AD94EF2;
	Wed,  9 Apr 2025 02:46:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744159607;
	bh=iG6bbHir4U+SlquzrIuANlxmJUEL/YGfgDPY7mCCzc0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ItphXU+rh2o5FiEMQ5MKbHLurOPjytnGIzUqey4lUg7WrpFawDR+Suhx/DEGQDaD2
	 7qAhJtRHB8M4kisBPfGIqQgLFXaC4KhUmfsLgwJliBfFC3d2KRj51JSe9Rjpccxnq+
	 JxfrTUsBdNOkX3fInXPE0wfVekPYDXN3/3fRr7Hc=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [vsp-tests] [PATCH 15/16] tests: Add WPF RGB to YUV conversion test
Date: Wed,  9 Apr 2025 03:47:57 +0300
Message-ID: <20250409004758.11014-16-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250409004758.11014-1-laurent.pinchart@ideasonboard.com>
References: <20250409004758.11014-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a test case to validate RGB <-> YUV conversion in the RPF and WPF.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 tests/meson.build           |  1 +
 tests/vsp-unit-test-0028.sh | 51 +++++++++++++++++++++++++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100755 tests/vsp-unit-test-0028.sh

diff --git a/tests/meson.build b/tests/meson.build
index e5396cc0a132..6c3ebd28095f 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -29,6 +29,7 @@ tests = files([
     'vsp-unit-test-0025.sh',
     'vsp-unit-test-0026.sh',
     'vsp-unit-test-0027.sh',
+    'vsp-unit-test-0028.sh',
 ])
 
 install_data(tests, install_dir : get_option('prefix'))
diff --git a/tests/vsp-unit-test-0028.sh b/tests/vsp-unit-test-0028.sh
new file mode 100755
index 000000000000..23a4f411e863
--- /dev/null
+++ b/tests/vsp-unit-test-0028.sh
@@ -0,0 +1,51 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2025 Renesas Electronics Corporation
+
+#
+# Test RGB to YUV conversion in RPF and WPF.
+#
+
+. ./vsp-lib.sh
+
+features="rpf.0 wpf.0"
+formats="RGB24-YUV444M YUV444M-RGB24"
+
+test_rwpf_csc() {
+	local rwpf=$1
+	local format=$2
+	local infmt=${format%-*}
+	local outfmt=${format#*-}
+	local midfmt
+
+	test_start "$rwpf CSC $infmt -> $outfmt"
+
+	if [ $rwpf = 'RPF' ] ; then
+		midfmt=$outfmt
+	else
+		midfmt=$infmt
+	fi
+
+	pipe_configure rpf-wpf 0 0
+	format_configure rpf-wpf 0 0 $infmt 1024x768 $outfmt --midfmt=$midfmt
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
+	for rwpf in RPF WPF ; do
+		for format in $formats ; do
+			test_rwpf_csc $rwpf $format
+		done
+	done
+}
+
+test_init $0 "$features"
+test_run
-- 
Regards,

Laurent Pinchart


