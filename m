Return-Path: <linux-renesas-soc+bounces-15625-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 304A3A81A16
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Apr 2025 02:49:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27094467CBC
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Apr 2025 00:48:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B3732AE97;
	Wed,  9 Apr 2025 00:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HCLPwdqq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1116A2C190
	for <linux-renesas-soc@vger.kernel.org>; Wed,  9 Apr 2025 00:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744159728; cv=none; b=O97UgD2TS2vw1rWU9AdYaT4xiEdH3joJUotcPGbIGSDHnVeLbc/nSWqR+If1BXvO2jC26BHKf4ThcWeHWcHa6+qnZCD3gnEjh7WBdbLbzatXVqhY/bWp5gi6LLDpNve4sJO1IiE7eSUu/roe7rWnJrzhNiw7OTlakSONe30Pcy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744159728; c=relaxed/simple;
	bh=qQWb81AfXXSMd9QPZvHWF4BO92V8i1WPOWYL8mOifNI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oRKSE66OdT5qXAAqkksSQigfFHELqcRrUObE02jfE05eVRyFd8nqasRvO+hrTN1MpP9/ip6Of9cNebbMv439kSg+z7jn+scxaT8n58LedrxXZMglX1kj04qo4q6A/sB+8hUSGAmSDDpZyEIw1QiSAfzGrhMG7bjR5D8+onRCgaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HCLPwdqq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 623C71440;
	Wed,  9 Apr 2025 02:46:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744159604;
	bh=qQWb81AfXXSMd9QPZvHWF4BO92V8i1WPOWYL8mOifNI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HCLPwdqq5CeJPWuXKKneJ82aLPfFE2Pzbm6zp6Z63JxLe9a7tdQh425r6VxL6UCnM
	 WLtNy5B0cnj+DqStBI/h1lLLtNgVEUrNF/dYFiPyCF1hw+VKLiIxo4UwAQJulLcBPM
	 ZQZ7rZpi+v7kne/Xbu4ni78zQtTDX1tb8xHUMZkQ=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [vsp-tests] [PATCH 13/16] vsp-lib: Use canonical media bus code names
Date: Wed,  9 Apr 2025 03:47:55 +0300
Message-ID: <20250409004758.11014-14-laurent.pinchart@ideasonboard.com>
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

The media-ctl utility names media bus codes by stripping the
MEDIA_BUS_FMT_ prefix from the kernel macro name. For a small set of
formats, alternative names are supported for historical reasons. Their
usage is discouraged, so use the canonical names in the tests.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 scripts/vsp-lib.sh | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/vsp-lib.sh b/scripts/vsp-lib.sh
index 2e1980d5debb..85f3fdef69d1 100755
--- a/scripts/vsp-lib.sh
+++ b/scripts/vsp-lib.sh
@@ -532,7 +532,7 @@ pipe_configure() {
 format_v4l2_to_mbus() {
 	case $1 in
 	RGB332 | ARGB555 | XRGB555 | RGB565 | BGR24 | RGB24 | XBGR32 | XRGB32 | ABGR32 | ARGB32)
-		echo "ARGB32";
+		echo "ARGB8888_1X32";
 		;;
 
 	HSV24 | HSV32)
@@ -540,7 +540,7 @@ format_v4l2_to_mbus() {
 		;;
 
 	UYVY | VYUY | YUYV | YVYU | NV12M | NV16M | NV21M | NV61M | YUV420M | YUV422M | YUV444M | YVU420M | YVU422M | YVU444M)
-		echo "AYUV32"
+		echo "AYUV8_1X32"
 		;;
 
 	*)
@@ -558,7 +558,7 @@ format_v4l2_to_mbus() {
 
 format_v4l2_is_yuv() {
 	local format=$(format_v4l2_to_mbus $1)
-	[ $format = 'AYUV32' ]
+	[ $format = 'AYUV8_1X32' ]
 }
 
 format_rpf() {
-- 
Regards,

Laurent Pinchart


