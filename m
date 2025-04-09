Return-Path: <linux-renesas-soc+bounces-15624-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BD7A81A14
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Apr 2025 02:48:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 809F219E11C9
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Apr 2025 00:49:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 760C93595C;
	Wed,  9 Apr 2025 00:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UcEz+Oux"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F28026AF5
	for <linux-renesas-soc@vger.kernel.org>; Wed,  9 Apr 2025 00:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744159727; cv=none; b=BhiV65E2orywXqhCoNNIkc4Xvar6QtlPG6CwPdGWdXJrXzltJ/xKcAKh8uE2oYCuRdFUp3yDk8FptckXhYfelPyCC0tKnqj1tlKJVWmS2HAlEle0XCPx06y2LsINTa68ivrocdIu6Vu9uvgvoDfGpqmtib7KgNjS3+yVxNt80OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744159727; c=relaxed/simple;
	bh=kNHVw+b833L018HUNn9P11uSm9o66ENvrIDCFt44OsY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jy92gKpFcMbbi+8/CIUFy9BCcZWfY4M2IMa6vZasaY+lCxq0eir47TEHLObNJYdAGxx4cYJ3kg7KbhWli8NKTy2H+QEaLnzRMgpom/o6R79ZLsRyh7h0f1LWQOsZImUnbGuADv22K9sYMRHFo5XLTHacOoDNsSGTpYGi99Ee5I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UcEz+Oux; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 05052A98;
	Wed,  9 Apr 2025 02:46:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744159603;
	bh=kNHVw+b833L018HUNn9P11uSm9o66ENvrIDCFt44OsY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UcEz+OuxDy4s7T+ZvJzYezAotLM2ZVJzPAQbBygGYzOcDK6sNS8A/kBfFtkZlm0MR
	 uBe6PydYNm6z9Bi+50Isu5dBVkvI9ya3ubcFSZZFWpiaTZF3E2tflNam/FCIJm41wR
	 7M2VErAXkQ0Iip6KgdjivqDkKt8uZSp+zxJPLoQE=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [vsp-tests] [PATCH 12/16] vsp-lib: Centralize pad format setting in function
Date: Wed,  9 Apr 2025 03:47:54 +0300
Message-ID: <20250409004758.11014-13-laurent.pinchart@ideasonboard.com>
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

Create a new vsp1_entity_set_format() function to set a pad format, and
use it through the code. This prepares for automating configuration of
colour space parameters.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 scripts/vsp-lib.sh | 161 ++++++++++++++++++++++++---------------------
 1 file changed, 86 insertions(+), 75 deletions(-)

diff --git a/scripts/vsp-lib.sh b/scripts/vsp-lib.sh
index d8722905cdc9..2e1980d5debb 100755
--- a/scripts/vsp-lib.sh
+++ b/scripts/vsp-lib.sh
@@ -77,6 +77,17 @@ vsp1_entity_get_size() {
 	      sed 's/.*\/\([0-9x]*\).*/\1/'
 }
 
+vsp1_entity_set_format() {
+	local entity=$1
+	local pad=$2
+	local format=$3
+	local size=$4
+	shift 4
+	local options="$*"
+
+	$mediactl -d $mdev -V "'$dev $entity':$pad [fmt:$format/$size $options]"
+}
+
 vsp1_has_control() {
 	local subdev=$(vsp1_entity_subdev $1)
 	local control_name=$(echo $2 | tr '+' ' ')
@@ -555,7 +566,7 @@ format_rpf() {
 	local size=$2
 	local rpf=$3
 
-	$mediactl -d $mdev -V "'$dev rpf.$rpf':0 [fmt:$format/$size]"
+	vsp1_entity_set_format rpf.$rpf 0 $format $size
 
 	__vsp_rpf_format=$1
 }
@@ -571,13 +582,13 @@ __format_rpf_brx() {
 
 	for input in `seq 0 1 $((ninputs-1))` ; do
 		offset=$((offset+50))
-		$mediactl -d $mdev -V "'$dev rpf.$input':0 [fmt:$format/$size]"
-		$mediactl -d $mdev -V "'$dev $name':$input [fmt:$format/$size compose:($offset,$offset)/$size]"
+		vsp1_entity_set_format rpf.$input 0 $format $size
+		vsp1_entity_set_format $name $input $format $size "compose:($offset,$offset)/$size"
 	done
 
-	$mediactl -d $mdev -V "'$dev $name':$output [fmt:$format/$size]"
-	$mediactl -d $mdev -V "'$dev wpf.0':0 [fmt:$format/$size]"
-	$mediactl -d $mdev -V "'$dev wpf.0':1 [fmt:$format/$size]"
+	vsp1_entity_set_format $name $output $format $size
+	vsp1_entity_set_format wpf.0 0 $format $size
+	vsp1_entity_set_format wpf.0 1 $format $size
 
 	__vsp_rpf_format=$2
 	__vsp_wpf_format=$2
@@ -599,13 +610,13 @@ format_rpf_bru_uds() {
 
 	local bru_output=$(vsp1_count_bru_inputs)
 
-	$mediactl -d $mdev -V "'$dev rpf.0':0 [fmt:$infmt/$insize]"
-	$mediactl -d $mdev -V "'$dev bru':0 [fmt:$infmt/$insize]"
-	$mediactl -d $mdev -V "'$dev bru':$bru_output [fmt:$infmt/$insize]"
-	$mediactl -d $mdev -V "'$dev uds.0':0 [fmt:$infmt/$insize]"
-	$mediactl -d $mdev -V "'$dev uds.0':1 [fmt:$infmt/$outsize]"
-	$mediactl -d $mdev -V "'$dev wpf.0':0 [fmt:$infmt/$outsize]"
-	$mediactl -d $mdev -V "'$dev wpf.0':1 [fmt:$outfmt/$outsize]"
+	vsp1_entity_set_format rpf.0 0 $infmt $insize
+	vsp1_entity_set_format bru 0 $infmt $insize
+	vsp1_entity_set_format bru $bru_output $infmt $insize
+	vsp1_entity_set_format uds.0 0 $infmt $insize
+	vsp1_entity_set_format uds.0 1 $infmt $outsize
+	vsp1_entity_set_format wpf.0 0 $infmt $outsize
+	vsp1_entity_set_format wpf.0 1 $outfmt $outsize
 
 	[ $insize != $outsize ] && __vsp_pixel_perfect=false
 	__vsp_rpf_format=$1
@@ -616,11 +627,11 @@ format_rpf_clu() {
 	local format=$(format_v4l2_to_mbus $1)
 	local size=$2
 
-	$mediactl -d $mdev -V "'$dev rpf.0':0 [fmt:$format/$size]"
-	$mediactl -d $mdev -V "'$dev clu':0 [fmt:$format/$size]"
-	$mediactl -d $mdev -V "'$dev clu':1 [fmt:$format/$size]"
-	$mediactl -d $mdev -V "'$dev wpf.0':0 [fmt:$format/$size]"
-	$mediactl -d $mdev -V "'$dev wpf.0':1 [fmt:$format/$size]"
+	vsp1_entity_set_format rpf.0 0 $format $size
+	vsp1_entity_set_format clu 0 $format $size
+	vsp1_entity_set_format clu 1 $format $size
+	vsp1_entity_set_format wpf.0 0 $format $size
+	vsp1_entity_set_format wpf.0 1 $format $size
 
 	__vsp_rpf_format=$1
 	__vsp_wpf_format=$1
@@ -630,11 +641,11 @@ format_rpf_hst() {
 	local format=$(format_v4l2_to_mbus $1)
 	local size=$2
 
-	$mediactl -d $mdev -V "'$dev rpf.0':0 [fmt:$format/$size]"
-	$mediactl -d $mdev -V "'$dev hst':0 [fmt:$format/$size]"
-	$mediactl -d $mdev -V "'$dev hst':1 [fmt:AHSV8888_1X32/$size]"
-	$mediactl -d $mdev -V "'$dev wpf.0':0 [fmt:AHSV8888_1X32/$size]"
-	$mediactl -d $mdev -V "'$dev wpf.0':1 [fmt:AHSV8888_1X32/$size]"
+	vsp1_entity_set_format rpf.0 0 $format $size
+	vsp1_entity_set_format hst 0 $format $size
+	vsp1_entity_set_format hst 1 AHSV8888_1X32 $size
+	vsp1_entity_set_format wpf.0 0 AHSV8888_1X32 $size
+	vsp1_entity_set_format wpf.0 1 AHSV8888_1X32 $size
 
 	__vsp_rpf_format=$1
 	__vsp_wpf_format=$3
@@ -646,10 +657,10 @@ format_rpf_hgo() {
 	local crop=${3:+crop:$3}
 	local compose=${4:+compose:$4}
 
-	$mediactl -d $mdev -V "'$dev rpf.0':0 [fmt:$format/$size]"
-	$mediactl -d $mdev -V "'$dev wpf.0':0 [fmt:$format/$size]"
-	$mediactl -d $mdev -V "'$dev wpf.0':1 [fmt:$format/$size]"
-	$mediactl -d $mdev -V "'$dev hgo':0   [fmt:$format/$size $crop $compose]"
+	vsp1_entity_set_format rpf.0 0 $format $size
+	vsp1_entity_set_format wpf.0 0 $format $size
+	vsp1_entity_set_format wpf.0 1 $format $size
+	vsp1_entity_set_format hgo 0 $format $size $crop $compose
 
 	__vsp_histo_type=hgo
 	__vsp_rpf_format=$1
@@ -662,12 +673,12 @@ format_rpf_hgt() {
 	local crop=${3:+crop:$3}
 	local compose=${4:+compose:$4}
 
-	$mediactl -d $mdev -V "'$dev rpf.0':0 [fmt:$format/$size]"
-	$mediactl -d $mdev -V "'$dev hst':0   [fmt:$format/$size]"
-	$mediactl -d $mdev -V "'$dev hgt':0   [fmt:$format/$size $crop $compose]"
-	$mediactl -d $mdev -V "'$dev hsi':0   [fmt:$format/$size]"
-	$mediactl -d $mdev -V "'$dev wpf.0':0 [fmt:$format/$size]"
-	$mediactl -d $mdev -V "'$dev wpf.0':1 [fmt:$format/$size]"
+	vsp1_entity_set_format rpf.0 0 $format $size
+	vsp1_entity_set_format hst 0 $format $size
+	vsp1_entity_set_format hgt 0 $format $size $crop $compose
+	vsp1_entity_set_format hsi 0 $format $size
+	vsp1_entity_set_format wpf.0 0 $format $size
+	vsp1_entity_set_format wpf.0 1 $format $size
 
 	__vsp_histo_type=hgt
 	__vsp_rpf_format=$1
@@ -678,11 +689,11 @@ format_rpf_lut() {
 	local format=$(format_v4l2_to_mbus $1)
 	local size=$2
 
-	$mediactl -d $mdev -V "'$dev rpf.0':0 [fmt:$format/$size]"
-	$mediactl -d $mdev -V "'$dev lut':0 [fmt:$format/$size]"
-	$mediactl -d $mdev -V "'$dev lut':1 [fmt:$format/$size]"
-	$mediactl -d $mdev -V "'$dev wpf.0':0 [fmt:$format/$size]"
-	$mediactl -d $mdev -V "'$dev wpf.0':1 [fmt:$format/$size]"
+	vsp1_entity_set_format rpf.0 0 $format $size
+	vsp1_entity_set_format lut 0 $format $size
+	vsp1_entity_set_format lut 1 $format $size
+	vsp1_entity_set_format wpf.0 0 $format $size
+	vsp1_entity_set_format wpf.0 1 $format $size
 
 	__vsp_rpf_format=$1
 	__vsp_wpf_format=$1
@@ -694,11 +705,11 @@ format_rpf_uds() {
 	local outfmt=$(format_v4l2_to_mbus $3)
 	local outsize=$4
 
-	$mediactl -d $mdev -V "'$dev rpf.0':0 [fmt:$infmt/$insize]"
-	$mediactl -d $mdev -V "'$dev uds.0':0 [fmt:$infmt/$insize]"
-	$mediactl -d $mdev -V "'$dev uds.0':1 [fmt:$infmt/$outsize]"
-	$mediactl -d $mdev -V "'$dev wpf.0':0 [fmt:$infmt/$outsize]"
-	$mediactl -d $mdev -V "'$dev wpf.0':1 [fmt:$outfmt/$outsize]"
+	vsp1_entity_set_format rpf.0 0 $infmt $insize
+	vsp1_entity_set_format uds.0 0 $infmt $insize
+	vsp1_entity_set_format uds.0 1 $infmt $outsize
+	vsp1_entity_set_format wpf.0 0 $infmt $outsize
+	vsp1_entity_set_format wpf.0 1 $outfmt $outsize
 
 	[ $insize != $outsize ] && __vsp_pixel_perfect=false
 	__vsp_rpf_format=$1
@@ -713,13 +724,13 @@ format_rpf_uds_bru() {
 
 	local bru_output=$(vsp1_count_bru_inputs)
 
-	$mediactl -d $mdev -V "'$dev rpf.0':0 [fmt:$infmt/$insize]"
-	$mediactl -d $mdev -V "'$dev uds.0':0 [fmt:$infmt/$insize]"
-	$mediactl -d $mdev -V "'$dev uds.0':1 [fmt:$infmt/$outsize]"
-	$mediactl -d $mdev -V "'$dev bru':0 [fmt:$infmt/$outsize]"
-	$mediactl -d $mdev -V "'$dev bru':$bru_output [fmt:$infmt/$outsize]"
-	$mediactl -d $mdev -V "'$dev wpf.0':0 [fmt:$infmt/$outsize]"
-	$mediactl -d $mdev -V "'$dev wpf.0':1 [fmt:$outfmt/$outsize]"
+	vsp1_entity_set_format rpf.0 0 $infmt $insize
+	vsp1_entity_set_format uds.0 0 $infmt $insize
+	vsp1_entity_set_format uds.0 1 $infmt $outsize
+	vsp1_entity_set_format bru 0 $infmt $outsize
+	vsp1_entity_set_format bru $bru_output $infmt $outsize
+	vsp1_entity_set_format wpf.0 0 $infmt $outsize
+	vsp1_entity_set_format wpf.0 1 $outfmt $outsize
 
 	[ $insize != $outsize ] && __vsp_pixel_perfect=false
 	__vsp_rpf_format=$1
@@ -733,13 +744,13 @@ format_rpf_uds_sru() {
 	local outfmt=$(format_v4l2_to_mbus $4)
 	local outsize=$5
 
-	$mediactl -d $mdev -V "'$dev rpf.0':0 [fmt:$infmt/$insize]"
-	$mediactl -d $mdev -V "'$dev uds.0':0 [fmt:$infmt/$insize]"
-	$mediactl -d $mdev -V "'$dev uds.0':1 [fmt:$infmt/$midsize]"
-	$mediactl -d $mdev -V "'$dev sru':0 [fmt:$infmt/$midsize]"
-	$mediactl -d $mdev -V "'$dev sru':1 [fmt:$infmt/$outsize]"
-	$mediactl -d $mdev -V "'$dev wpf.0':0 [fmt:$infmt/$outsize]"
-	$mediactl -d $mdev -V "'$dev wpf.0':1 [fmt:$outfmt/$outsize]"
+	vsp1_entity_set_format rpf.0 0 $infmt $insize
+	vsp1_entity_set_format uds.0 0 $infmt $insize
+	vsp1_entity_set_format uds.0 1 $infmt $midsize
+	vsp1_entity_set_format sru 0 $infmt $midsize
+	vsp1_entity_set_format sru 1 $infmt $outsize
+	vsp1_entity_set_format wpf.0 0 $infmt $outsize
+	vsp1_entity_set_format wpf.0 1 $outfmt $outsize
 
 	__vsp_pixel_perfect=false
 	__vsp_rpf_format=$1
@@ -752,11 +763,11 @@ format_rpf_sru() {
 	local outfmt=$(format_v4l2_to_mbus $3)
 	local outsize=$4
 
-	$mediactl -d $mdev -V "'$dev rpf.0':0 [fmt:$infmt/$insize]"
-	$mediactl -d $mdev -V "'$dev sru':0 [fmt:$infmt/$insize]"
-	$mediactl -d $mdev -V "'$dev sru':1 [fmt:$infmt/$outsize]"
-	$mediactl -d $mdev -V "'$dev wpf.0':0 [fmt:$infmt/$outsize]"
-	$mediactl -d $mdev -V "'$dev wpf.0':1 [fmt:$outfmt/$outsize]"
+	vsp1_entity_set_format rpf.0 0 $infmt $insize
+	vsp1_entity_set_format sru 0 $infmt $insize
+	vsp1_entity_set_format sru 1 $infmt $outsize
+	vsp1_entity_set_format wpf.0 0 $infmt $outsize
+	vsp1_entity_set_format wpf.0 1 $outfmt $outsize
 
 	__vsp_pixel_perfect=false
 	__vsp_rpf_format=$1
@@ -770,13 +781,13 @@ format_rpf_sru_uds() {
 	local outfmt=$(format_v4l2_to_mbus $4)
 	local outsize=$5
 
-	$mediactl -d $mdev -V "'$dev rpf.0':0 [fmt:$infmt/$insize]"
-	$mediactl -d $mdev -V "'$dev sru':0 [fmt:$infmt/$insize]"
-	$mediactl -d $mdev -V "'$dev sru':1 [fmt:$infmt/$midsize]"
-	$mediactl -d $mdev -V "'$dev uds.0':0 [fmt:$infmt/$midsize]"
-	$mediactl -d $mdev -V "'$dev uds.0':1 [fmt:$infmt/$outsize]"
-	$mediactl -d $mdev -V "'$dev wpf.0':0 [fmt:$infmt/$outsize]"
-	$mediactl -d $mdev -V "'$dev wpf.0':1 [fmt:$outfmt/$outsize]"
+	vsp1_entity_set_format rpf.0 0 $infmt $insize
+	vsp1_entity_set_format sru 0 $infmt $insize
+	vsp1_entity_set_format sru 1 $infmt $midsize
+	vsp1_entity_set_format uds.0 0 $infmt $midsize
+	vsp1_entity_set_format uds.0 1 $infmt $outsize
+	vsp1_entity_set_format wpf.0 0 $infmt $outsize
+	vsp1_entity_set_format wpf.0 1 $outfmt $outsize
 
 	__vsp_pixel_perfect=false
 	__vsp_rpf_format=$1
@@ -834,10 +845,10 @@ format_rpf_wpf() {
 		outsize=$rpfoutsize
 	fi
 
-	$mediactl -d $mdev -V "'$dev rpf.$rpf':0 [fmt:$infmt/$size $rpfcrop]"
-	$mediactl -d $mdev -V "'$dev rpf.$rpf':1 [fmt:$midfmt/$rpfoutsize]"
-	$mediactl -d $mdev -V "'$dev wpf.$wpf':0 [fmt:$midfmt/$rpfoutsize $wpfcrop]"
-	$mediactl -d $mdev -V "'$dev wpf.$wpf':1 [fmt:$outfmt/$outsize]"
+	vsp1_entity_set_format rpf.$rpf 0 $infmt $size $rpfcrop
+	vsp1_entity_set_format rpf.$rpf 1 $midfmt $rpfoutsize
+	vsp1_entity_set_format wpf.$wpf 0 $midfmt $rpfoutsize $wpfcrop
+	vsp1_entity_set_format wpf.$wpf 1 $outfmt $outsize
 }
 
 format_wpf() {
@@ -845,8 +856,8 @@ format_wpf() {
 	local size=$2
 	local wpf=$3
 
-	$mediactl -d $mdev -V "'$dev wpf.$wpf':0 [fmt:$format/$size]"
-	$mediactl -d $mdev -V "'$dev wpf.$wpf':1 [fmt:$format/$size]"
+	vsp1_entity_set_format wpf.$wpf 0 $format $size
+	vsp1_entity_set_format wpf.$wpf 1 $format $size
 
 	__vsp_wpf_format=$1
 }
-- 
Regards,

Laurent Pinchart


