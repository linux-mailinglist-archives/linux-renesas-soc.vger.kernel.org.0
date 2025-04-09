Return-Path: <linux-renesas-soc+bounces-15622-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C33B3A81A13
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Apr 2025 02:48:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 47C757AD6DC
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Apr 2025 00:47:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 005862C190;
	Wed,  9 Apr 2025 00:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="c6M6M30M"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A86126AF5
	for <linux-renesas-soc@vger.kernel.org>; Wed,  9 Apr 2025 00:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744159723; cv=none; b=tpTm53TKdb41rNDxmR98axBEayobwz5oBDbWQGG/I1dQK6Bb4P3Ec8P3xzR07BPrzxcW6vWLgD0QNB/21UWDRjTmjaT8JcPhErfJplCpsGDc32/V/FVZMvZ4eAjotkAaUu91Ua1oobMfX8HECvRaAVWTReSb5qYfZ4tgPlOEF9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744159723; c=relaxed/simple;
	bh=Xqz4Ptp6xRR4FQY3m8E0fnjrACpBg/HjJaoLWnrqaTY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cVxZctsANLcFnLXF5kFuZstCm77vH75Hq+QpqQisrnLwkJmx+uAvudARzezRuQXEI+W5Jevc6UdNR4K9lslAf2rmgqOeoEM/lmK1GgK3KL3SabKhOPaLr1aV+sF7JrCy7p+PhSbSgTwj19pQaRDd8Q6hI8hMUNrP8x1yQVNafyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=c6M6M30M; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4213399F;
	Wed,  9 Apr 2025 02:46:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744159600;
	bh=Xqz4Ptp6xRR4FQY3m8E0fnjrACpBg/HjJaoLWnrqaTY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c6M6M30MoIqG1bv5pvq18swUt1qrIPiq3KizUtGzjDxJtWymoylhRpOrn/YtYtkgK
	 ddEB0dYCGJNA4cB0L1oI5EntWXoRpeAQZLpnn8Y1FKCNPu1N82kflIWWavbS21tLwM
	 0IcS7dMEXOozB1N+IWU473OeebsrdEE3aGPaxgEQ=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [vsp-tests] [PATCH 10/16] vsp-lib: Save RPF input frames upon error
Date: Wed,  9 Apr 2025 03:47:52 +0300
Message-ID: <20250409004758.11014-11-laurent.pinchart@ideasonboard.com>
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

When a test fail, it can be useful to inspect the frames input to the
RPFs. Save them along the frames output by the WPFs and the reference
frames.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 scripts/vsp-lib.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/vsp-lib.sh b/scripts/vsp-lib.sh
index 92a9121337f1..ba87de5af954 100755
--- a/scripts/vsp-lib.sh
+++ b/scripts/vsp-lib.sh
@@ -316,9 +316,13 @@ compare_frames() {
 
 	if [ x$VSP_KEEP_FRAMES = x1 -o $result = "fail" ] ; then
 		mv ${frames_dir}ref-frame.bin ${0/.sh/}-$params-ref-frame.bin
+		for frame in ${frames_dir}rpf.*.bin ; do
+			mv $frame ${0/.sh/}-$params-$(basename ${frame})
+		done
 	else
 		rm -f ${frames_dir}ref-frame.bin
 		rm -f ${frames_dir}frame-*.bin
+		rm -f ${frames_dir}rpf.*.bin
 	fi
 
 	echo $result
-- 
Regards,

Laurent Pinchart


