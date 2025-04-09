Return-Path: <linux-renesas-soc+bounces-15623-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F2DA81A12
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Apr 2025 02:48:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 796053AD33B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Apr 2025 00:48:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A0C14C80;
	Wed,  9 Apr 2025 00:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JbX+sy3k"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BA23595C
	for <linux-renesas-soc@vger.kernel.org>; Wed,  9 Apr 2025 00:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744159725; cv=none; b=ZZyqvm8CIJuWaWAaOagiwyzzPAYH3uKKBrmhAIZilX9irwolL3zUhEE78CjkcMvrqptCz2mZdlaMsMjryYkYHLaOfTrqeI+qPOcwsnSwBUHZjqIfomhmvziOU0wrj3va9SlvsHWnqprMvnn/IyIlshz2aCm890QJL8LR5lSNTBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744159725; c=relaxed/simple;
	bh=INDIGiCQGrUsxyMEHtK/+J98aRwHa3L8EQVmkR3yduM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H4Xn2YMqn7mPmCTtS5weo8I0yteTwh0PYEwHbcTquPTvXHdrxCtJLIrichUGEs5F+t4BUOWzyoehEsIODl2eWbTfY+M3M0eXY7DiYq/3oDfaIHotl4ArYVIhbXgFuWziClK5NLIKDW0Skjop4yMEMzsNo6v6c7B6ljmEQ1dgRpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JbX+sy3k; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9A092F90;
	Wed,  9 Apr 2025 02:46:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744159601;
	bh=INDIGiCQGrUsxyMEHtK/+J98aRwHa3L8EQVmkR3yduM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JbX+sy3kcTNdkZiUG3q0T1I3K6m/yR7BX52yE5Vo/JgbMW5FbUbEfF3Ai4xvCW5HT
	 7rQ6hzf8Rpi4/AI5hDTAY1Ik+caJqUjOJqkf9FDeQ7VEYgHPLB7j0AUsKt0jfkBL1y
	 syqonB3ATn7lAHDZRmYFzoLj+6SYXKwc9Qjx+5Xw=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [vsp-tests] [PATCH 11/16] vsp-lib: Support specifying pipeline internal format for RPF -> WPF
Date: Wed,  9 Apr 2025 03:47:53 +0300
Message-ID: <20250409004758.11014-12-laurent.pinchart@ideasonboard.com>
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

The RPF can perform color space conversion, converting between RGB and
YUV formats. Testing this feature requires specifying different formats
on the RPF input and output. Add a --midfmt argument to the
format_rpf_wpf() function to specify the RPF output format, and
propagate it through the pipeline up to the WPF input.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 scripts/vsp-lib.sh | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/scripts/vsp-lib.sh b/scripts/vsp-lib.sh
index ba87de5af954..d8722905cdc9 100755
--- a/scripts/vsp-lib.sh
+++ b/scripts/vsp-lib.sh
@@ -789,6 +789,7 @@ format_rpf_wpf() {
 	local infmt=$(format_v4l2_to_mbus $3)
 	local size=$4
 	local outfmt=$(format_v4l2_to_mbus $5)
+	local midfmt=$infmt
 	local rpfcrop=
 	local wpfcrop=
 	local rpfoutsize=
@@ -802,6 +803,9 @@ format_rpf_wpf() {
 
 	for option in $* ; do
 		case $option in
+		--midfmt=*)
+			midfmt=$(format_v4l2_to_mbus ${option/--midfmt=/})
+			;;
 		--rpfcrop=*)
 			rpfcrop=${option/--rpfcrop=/}
 			;;
@@ -831,8 +835,8 @@ format_rpf_wpf() {
 	fi
 
 	$mediactl -d $mdev -V "'$dev rpf.$rpf':0 [fmt:$infmt/$size $rpfcrop]"
-	$mediactl -d $mdev -V "'$dev rpf.$rpf':1 [fmt:$infmt/$rpfoutsize]"
-	$mediactl -d $mdev -V "'$dev wpf.$wpf':0 [fmt:$infmt/$rpfoutsize $wpfcrop]"
+	$mediactl -d $mdev -V "'$dev rpf.$rpf':1 [fmt:$midfmt/$rpfoutsize]"
+	$mediactl -d $mdev -V "'$dev wpf.$wpf':0 [fmt:$midfmt/$rpfoutsize $wpfcrop]"
 	$mediactl -d $mdev -V "'$dev wpf.$wpf':1 [fmt:$outfmt/$outsize]"
 }
 
-- 
Regards,

Laurent Pinchart


