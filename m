Return-Path: <linux-renesas-soc+bounces-15628-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7AAA81A15
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Apr 2025 02:48:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5E1D3AD213
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Apr 2025 00:48:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D5EC2AE97;
	Wed,  9 Apr 2025 00:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RAzrx6/1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020812C190
	for <linux-renesas-soc@vger.kernel.org>; Wed,  9 Apr 2025 00:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744159733; cv=none; b=mJqusVc1dU/o2tbOisEuno39KBRSD8vEg9yZeSXHvFIJQluPZJKsKSTJUcd7rzcOJx9zMjGGdNFX3eAHUsVqMMV6va+fT4H2qkVZSfdgmPcbJR1JcM8yg27rlKIRJm/XhsMvwYH4wfAGUAujdSUfeHXZ4AS+dYGQNSjuFPBAxr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744159733; c=relaxed/simple;
	bh=yydOIbzrQK0HysdALPaTgH1T1ytoNpw9dTgj75L/HzM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KKq1ZAnoSNxCw77XzBsPTtqR4Qvxi8+DbQe365n8vsykFZsTL/XbdVop+4mAG3ngm3WJDPP1my7Sp65SU7Ez2ISsY8aK0V7SnBLdfLfnOhBsAOPw3aRbulnd+njSjrri7qI/Pr+g8j/0pyEnkVbm8Sng85L+LTNfcA+DJvgpMDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RAzrx6/1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6DA6399F;
	Wed,  9 Apr 2025 02:46:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744159608;
	bh=yydOIbzrQK0HysdALPaTgH1T1ytoNpw9dTgj75L/HzM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RAzrx6/1mInL+5WJ7x3hkuiKa/fJSPbAUwIRseh7Ayi5CHww3wAe03EVdjCcZJ0+D
	 CJpNXlYjdmQc0eX2rGhkZW7Doj4WrUIFy+z6YYW0QytFkv6d07Q5ow7GXDbtY0IsEi
	 NyJMfYPfwnM/VXFb/WesJ0cks2wJqwwg396JITHc=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [vsp-tests] [PATCH 16/16] tests: Add color space support to RGB <-> YUV conversion test
Date: Wed,  9 Apr 2025 03:47:58 +0300
Message-ID: <20250409004758.11014-17-laurent.pinchart@ideasonboard.com>
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

Run the YUV <-> RGB conversion test with all four color spaces supported
by the VSP.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 tests/vsp-unit-test-0028.sh | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/tests/vsp-unit-test-0028.sh b/tests/vsp-unit-test-0028.sh
index 23a4f411e863..5016e65cb865 100755
--- a/tests/vsp-unit-test-0028.sh
+++ b/tests/vsp-unit-test-0028.sh
@@ -16,9 +16,10 @@ test_rwpf_csc() {
 	local format=$2
 	local infmt=${format%-*}
 	local outfmt=${format#*-}
+	local encoding=$3
 	local midfmt
 
-	test_start "$rwpf CSC $infmt -> $outfmt"
+	test_start "$rwpf CSC $infmt -> $outfmt ($encoding)"
 
 	if [ $rwpf = 'RPF' ] ; then
 		midfmt=$outfmt
@@ -27,12 +28,12 @@ test_rwpf_csc() {
 	fi
 
 	pipe_configure rpf-wpf 0 0
-	format_configure rpf-wpf 0 0 $infmt 1024x768 $outfmt --midfmt=$midfmt
+	format_configure rpf-wpf 0 0 $infmt 1024x768 $outfmt --midfmt=$midfmt --encoding=$encoding
 
 	vsp_runner rpf.0 &
 	vsp_runner wpf.0
 
-	local result=$(compare_frames)
+	local result=$(compare_frames $rwpf-$encoding)
 
 	test_complete $result
 }
@@ -42,7 +43,9 @@ test_main() {
 
 	for rwpf in RPF WPF ; do
 		for format in $formats ; do
-			test_rwpf_csc $rwpf $format
+			for encoding in 601:lim-range 601:full-range 709:lim-range 709:full-range ; do
+				test_rwpf_csc $rwpf $format $encoding
+			done
 		done
 	done
 }
-- 
Regards,

Laurent Pinchart


