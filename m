Return-Path: <linux-renesas-soc+bounces-15626-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B44A81A17
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Apr 2025 02:49:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 051CB467CD8
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Apr 2025 00:48:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFE8B42048;
	Wed,  9 Apr 2025 00:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SqtQJ21W"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD2A2C190
	for <linux-renesas-soc@vger.kernel.org>; Wed,  9 Apr 2025 00:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744159730; cv=none; b=DvY/NjlOExYlMjCWH2ZMXmr7R/my2kZC7bZ3i1nPrIcRSmqu5MLLbIFuw7OBSyNRg46h/T+KFbgd2xWl+kaUkI+piqYyMGEcg5frljh1LFIbFoCjCgW9ZhHVxfoI6ivSUM6tiQJujpp4GZVG4mjWHfF1rom1WJtQDXKawGiPF34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744159730; c=relaxed/simple;
	bh=KD+GGB+AMbGefdpwqsz5hyPsEY1mFzHDsohPBHOsJZs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mnV59Mczqt+KvMePSOvIFd44+E1bztXq9T6fpfxeCoReqdu7eSPBucP1lt95+Uu15+qZk9DH5iyPaMzPqOBv7JT/Esk+vjTB4jbNtGkqvqXDRpiaIr9ZvYOaUsg1XtCdaSE2PAV6TKdP4vbJwib9WEzTWbx+GsyqMMA+oLm4nHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SqtQJ21W; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B9AA183D;
	Wed,  9 Apr 2025 02:46:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744159605;
	bh=KD+GGB+AMbGefdpwqsz5hyPsEY1mFzHDsohPBHOsJZs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SqtQJ21WM0Q/6BQ4Jn6sMx5Gak1m+KrV2x4y91GsHXH0ktibXFmphDgxmRGDeE6Tz
	 P24begfdF0yr3E9q+cXoARl4dVjGetw+F85+IaTijkmt58BD8vjuzzSG8GoEiPN/dM
	 JjYWumrqYFMb4Bc/IzGi8ZbH7eC5SOo5tu3Sd+bg=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [vsp-tests] [PATCH 14/16] vsp-lib: Add support for color space
Date: Wed,  9 Apr 2025 03:47:56 +0300
Message-ID: <20250409004758.11014-15-laurent.pinchart@ideasonboard.com>
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

Support configuring the color space when setting formats on subdev pads
and on video devices. As the VSP only cares about the encoding and
quantization, the colorspace and transfer function parameters are not
handled.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 scripts/vsp-lib.sh | 82 ++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 76 insertions(+), 6 deletions(-)

diff --git a/scripts/vsp-lib.sh b/scripts/vsp-lib.sh
index 85f3fdef69d1..47828296285e 100755
--- a/scripts/vsp-lib.sh
+++ b/scripts/vsp-lib.sh
@@ -85,6 +85,12 @@ vsp1_entity_set_format() {
 	shift 4
 	local options="$*"
 
+	if [ $format = 'AYUV8_1X32' ] ; then
+		options="$options ycbcr:$__vsp_encoding quantization:$__vsp_quantization"
+	else
+		options="$options ycbcr:601 quantization:full-range"
+	fi
+
 	$mediactl -d $mdev -V "'$dev $entity':$pad [fmt:$format/$size $options]"
 }
 
@@ -115,6 +121,30 @@ vsp1_reset_controls() {
 	$yavta --no-query --reset-controls $subdev | ./logger.sh "$entity" >> $logfile
 }
 
+gen_image_csc_options() {
+	local options=
+
+	case $__vsp_encoding in
+	601)
+		options="$options -e BT.601"
+		;;
+	709)
+		options="$options -e REC.709"
+		;;
+	esac
+
+	case $__vsp_quantization in
+	lim-range)
+		options="$options -q limited"
+		;;
+	full-range)
+		options="$options -q full"
+		;;
+	esac
+
+	echo "$options"
+}
+
 # -----------------------------------------------------------------------------
 # Reference frame generation
 #
@@ -206,6 +236,11 @@ reference_frame() {
 
 	[ x$__vsp_brx_inputs != x ] && options="$options -c $__vsp_brx_inputs"
 
+	options="$options $(gen_image_csc_options)"
+
+	echo "Generating reference frame with $genimage -i $in_format -f $out_format -s $size -a $alpha $options" | \
+		./logger.sh check >> $logfile
+
 	$genimage -i $in_format -f $out_format -s $size -a $alpha $options -o $file \
 		frames/frame-reference-1024x768.ppm
 }
@@ -512,6 +547,8 @@ pipe_reset() {
 	__vsp_rpf_format=
 	__vsp_wpf_index=0
 	__vsp_wpf_format=
+	__vsp_encoding=601
+	__vsp_quantization=lim-range
 	__vsp_pixel_perfect=true
 }
 
@@ -866,7 +903,23 @@ format_configure() {
 	local pipe=${1//-/_}
 	shift 1
 
-	format_$pipe $*
+	local options
+	local arg
+
+	for arg in $* ; do
+		case $arg in
+		--encoding=*)
+			local encoding=${arg/--encoding=/}
+			__vsp_encoding=${encoding%:*}
+			__vsp_quantization=${encoding#*:}
+			;;
+		*)
+			options="$options $arg"
+			;;
+		esac
+	done
+
+	format_$pipe $options
 }
 
 # ------------------------------------------------------------------------------
@@ -886,9 +939,10 @@ hgt_configure() {
 #
 
 generate_input_frame() {
-	local file=$1
-	local format=$2
-	local size=$3
+	local entity=$1
+	local file=$2
+	local format=$3
+	local size=$4
 
 	local alpha=
 	local options=
@@ -910,6 +964,11 @@ generate_input_frame() {
 
 	$(format_v4l2_is_yuv $format) && options="$options -C -i YUV444M"
 
+	options="$options $(gen_image_csc_options)"
+
+	echo "Generating input frame with $genimage -f $format -s $size -a $alpha $options" | \
+		./logger.sh $entity >> $logfile
+
 	$genimage -f $format -s $size -a $alpha $options -o $file \
 		frames/frame-reference-1024x768.ppm
 }
@@ -952,6 +1011,7 @@ vsp_runner() {
 	local videodev
 	local format
 	local size
+	local csc
 
 	case $entity in
 	hgo)
@@ -971,7 +1031,7 @@ vsp_runner() {
 		format=$__vsp_rpf_format
 		size=$(vsp1_entity_get_size $entity 0)
 		file=${frames_dir}${entity}.bin
-		generate_input_frame $file $format $size
+		generate_input_frame $entity $file $format $size
 		;;
 
 	wpf.*)
@@ -982,7 +1042,17 @@ vsp_runner() {
 		;;
 	esac
 
-	$yavta -c$count -n $buffers ${format:+-f $format} ${size:+-s $size} \
+	if [ x$format != 'x' ] ; then
+		if [ $(format_v4l2_to_mbus $format) = 'AYUV8_1X32' ] ; then
+			local encoding=$(echo $__vsp_encoding | tr '[:lower:]-' '[:upper:]_')
+			local quantization=$(echo $__vsp_quantization | tr '[:lower:]-' '[:upper:]_')
+			csc="--encoding $encoding --quantization $quantization"
+		else
+			csc="--encoding 601 --quantization FULL_RANGE"
+		fi
+	fi
+
+	$yavta -c$count -n $buffers ${format:+-f $format} ${size:+-s $size} $csc \
 		${skip:+--skip $skip} ${file:+--file=$file} ${pause:+-p$pause} \
 		$videodev | ./logger.sh $entity >> $logfile
 }
-- 
Regards,

Laurent Pinchart


