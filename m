Return-Path: <linux-renesas-soc+bounces-15615-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB28A81A0B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Apr 2025 02:48:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3560F19E131A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Apr 2025 00:48:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B7A24C80;
	Wed,  9 Apr 2025 00:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PN/LzKae"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A163595C
	for <linux-renesas-soc@vger.kernel.org>; Wed,  9 Apr 2025 00:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744159712; cv=none; b=EG5gIu2FarOT2n1dLiC4eX7Co3d58ZBVs/pkQvgG6fmOgaL5YVyV6YNGE1e4VLf0Jw6gxqilMfoRbIsTDwmJbLkZJkvDqsWiQ/3OjfWveR40gLjXxPZJXDPY6tVxHobiNCTKQUsUQXaF/JUDJATf3RSpBBd/vyXs8WZugh3134k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744159712; c=relaxed/simple;
	bh=x24Hb95DOle7mCiLoNQD0yOncyC59IPEGKYsCu+Mb8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bEs+fdIhiCTjTjUvcX38XqGLIkQGzUXyycsx8Trfqk+X4TuBI4RaPoelk6cYAm8JpJySc2bzNiVkpuqqa3rI6CFNiXwvJ5RIascVIRvV6zURTMv5Z4qJQESKWcHPQCnlIEpRm7n0Od3cHCbDVba/ogWDIquoQXMJaRPeprRzVDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PN/LzKae; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 61B32A98;
	Wed,  9 Apr 2025 02:46:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744159590;
	bh=x24Hb95DOle7mCiLoNQD0yOncyC59IPEGKYsCu+Mb8Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PN/LzKaejYid0jGaOHKKw+rrArlANIiDlEu/R4JkftHGcUsEmxC0ZnidyufSsH/i0
	 ejfYXh5J7oU0jRPVAd6goxLhvR8WtLfFjLsM9NWlL3z/wTgcoxuMm2wVa2xQuafqDw
	 /AbP9LQYJudsQH/ZFDkSQTP020jUeTZG0D2LLQGA=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [vsp-tests] [PATCH 03/16] Use correct .ppm extension for PPM images
Date: Wed,  9 Apr 2025 03:47:45 +0300
Message-ID: <20250409004758.11014-4-laurent.pinchart@ideasonboard.com>
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

The reference images used by the test scripts are in PPM format, not
PNM. Use the correct file extension.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 ...pnm.gz => frame-reference-1024x768.ppm.gz} | Bin
 data/frames/meson.build                       |   4 ++--
 scripts/bin2png.sh                            |   8 +++----
 scripts/vsp-lib.sh                            |  22 +++++++++---------
 4 files changed, 17 insertions(+), 17 deletions(-)
 rename data/frames/{frame-reference-1024x768.pnm.gz => frame-reference-1024x768.ppm.gz} (100%)

diff --git a/data/frames/frame-reference-1024x768.pnm.gz b/data/frames/frame-reference-1024x768.ppm.gz
similarity index 100%
rename from data/frames/frame-reference-1024x768.pnm.gz
rename to data/frames/frame-reference-1024x768.ppm.gz
diff --git a/data/frames/meson.build b/data/frames/meson.build
index f4ec8e30bdac..a9d79f29cde3 100644
--- a/data/frames/meson.build
+++ b/data/frames/meson.build
@@ -20,8 +20,8 @@ foreach table : tables
                   install_dir : 'frames')
 endforeach
 
-custom_target(input : files('frame-reference-1024x768.pnm.gz'),
-              output : 'frame-reference-1024x768.pnm',
+custom_target(input : files('frame-reference-1024x768.ppm.gz'),
+              output : 'frame-reference-1024x768.ppm',
               capture : true,
               command : [gzip, '-cd', '@INPUT@'],
               install : true,
diff --git a/scripts/bin2png.sh b/scripts/bin2png.sh
index d231d192e772..e7b16ee6288b 100755
--- a/scripts/bin2png.sh
+++ b/scripts/bin2png.sh
@@ -6,7 +6,7 @@ FILE=${1:-.}
 
 convert_image() {
 	local file=$1
-	local pnm=${file%bin}pnm
+	local ppm=${file%bin}ppm
 	local png=${file%bin}png
 
 	local format=$(echo $file | sed -e 's|.*-\([[:alnum:]]*\)-\([0-9]*x[0-9]*\).*.bin|\1|' | tr '[:lower:]' '[:upper:]')
@@ -24,9 +24,9 @@ convert_image() {
 		;;
 	esac
 
-	raw2rgbpnm -f $format -s $size $file $pnm && \
-		convert $pnm $png
-	rm $pnm
+	raw2rgbpnm -f $format -s $size $file $ppm && \
+		convert $ppm $png
+	rm $ppm
 }
 
 if [ -d $FILE ] ; then
diff --git a/scripts/vsp-lib.sh b/scripts/vsp-lib.sh
index 114bc7200e6e..92a9121337f1 100755
--- a/scripts/vsp-lib.sh
+++ b/scripts/vsp-lib.sh
@@ -196,7 +196,7 @@ reference_frame() {
 	[ x$__vsp_brx_inputs != x ] && options="$options -c $__vsp_brx_inputs"
 
 	$genimage -i $in_format -f $out_format -s $size -a $alpha $options -o $file \
-		frames/frame-reference-1024x768.pnm
+		frames/frame-reference-1024x768.ppm
 }
 
 reference_histogram() {
@@ -210,7 +210,7 @@ reference_histogram() {
 	[[ "x$hgt_hue_areas" != x ]] && hue="--histogram-areas $hgt_hue_areas"
 
 	$genimage -i $format -f $format -s $size -H $file --histogram-type $type $hue \
-		frames/frame-reference-1024x768.pnm
+		frames/frame-reference-1024x768.ppm
 }
 
 # ------------------------------------------------------------------------------
@@ -247,17 +247,17 @@ compare_frame_fuzzy() {
 	local img_a=$3
 	local img_b=$4
 
-	local pnm_a=${img_a/bin/pnm}
-	local pnm_b=${img_b/bin/pnm}
+	local ppm_a=${img_a/bin/ppm}
+	local ppm_b=${img_b/bin/ppm}
 
-	raw2rgbpnm -f $fmt -s $size $img_a $pnm_a > /dev/null
-	raw2rgbpnm -f $fmt -s $size $img_b $pnm_b > /dev/null
+	raw2rgbpnm -f $fmt -s $size $img_a $ppm_a > /dev/null
+	raw2rgbpnm -f $fmt -s $size $img_b $ppm_b > /dev/null
 
-	local ae=$(compare -metric ae $pnm_a $pnm_b /dev/null 2>&1)
-	local mae=$(compare -metric mae $pnm_a $pnm_b /dev/null 2>&1 | sed 's/.*(\(.*\))/\1/')
+	local ae=$(compare -metric ae $ppm_a $ppm_b /dev/null 2>&1)
+	local mae=$(compare -metric mae $ppm_a $ppm_b /dev/null 2>&1 | sed 's/.*(\(.*\))/\1/')
 
-	rm $pnm_a
-	rm $pnm_b
+	rm $ppm_a
+	rm $ppm_b
 
 	local width=$(echo $size | cut -d 'x' -f 1)
 	local height=$(echo $size | cut -d 'x' -f 2)
@@ -892,7 +892,7 @@ generate_input_frame() {
 	$(format_v4l2_is_yuv $format) && options="$options -C -i YUV444M"
 
 	$genimage -f $format -s $size -a $alpha $options -o $file \
-		frames/frame-reference-1024x768.pnm
+		frames/frame-reference-1024x768.ppm
 }
 
 vsp_runner() {
-- 
Regards,

Laurent Pinchart


