Return-Path: <linux-renesas-soc+bounces-14323-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB48A5E726
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Mar 2025 23:16:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 721143BB07E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Mar 2025 22:16:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80E611F0E2A;
	Wed, 12 Mar 2025 22:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZU0vjVmN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE58B1F03D8;
	Wed, 12 Mar 2025 22:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741817773; cv=none; b=NAcuWcEnze2DQuUN5f1ee5RM7bKFCgPS6HeCsjFTRfppEw2h47RE72lD46EH26VAsOUqWRHwMv9YFOoPEAxaVAiglMCT85kfXW8GSbf3l13gnXeh0C7PFSWvyR/WK3ntkEvDeHFvRC5iiOL0FB0Pap9dcyBpqh13ak2la4frFUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741817773; c=relaxed/simple;
	bh=dZtHQmHw2E/TNV4LhtJkvHxvd1dLBtC07ImShwyJx1c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oIsHwryE6zp/uppaO35pMHuGnyUDvCba2CtqFBlQP8lM8Bo4ol5pHVqYME6MEgPtF8q0sQssfAdpnrEbGJhviBB4jJFdpUnCkNZ5pIKDl7sECX3CU+vxoIlX8FUU9m2FsA8eLRGwiwvkmcpWYW18hEYwuNeiKYljJAtFrgHy0Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZU0vjVmN; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741817772; x=1773353772;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=dZtHQmHw2E/TNV4LhtJkvHxvd1dLBtC07ImShwyJx1c=;
  b=ZU0vjVmNwb13IxsezdyVAJFPfP44KITuMRdGrjZ2NidMGHzlOh2zg9+H
   F2Z67pbtWxfRU+wATNmCeV9IR8kqlPQEMyhKUlKkVeX2aUPQjyMCEOvEo
   16LplSKIdLxgfTdOhVhtThinXmmJSHzlnKZlU9k+6bzNGfllbtHsgHxi7
   T+rJEg1Omi/xQL86AikwsYfzL1j7O8T8/fGFalNLr18e60yazA2A9SN7h
   VL0GSRJOyUXx+/WZk/hO+RXrlgOlU0i/UaVZ8RsYEZiT/QlE8NVTdumXq
   t1gZXxbRUTil85vV7ZZdQzUpjfgWqDe4si3/WnwPxaPRs12jv9l24kKmC
   Q==;
X-CSE-ConnectionGUID: B3zqPGFURBW21N+3jJdO9g==
X-CSE-MsgGUID: ltJWj/1iQYiULtOGLBPgLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="54288432"
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; 
   d="scan'208";a="54288432"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 15:16:08 -0700
X-CSE-ConnectionGUID: n41JY1lQQdaoPy2xR1G+TQ==
X-CSE-MsgGUID: 7j8DIBiETSWs78ngq/acow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; 
   d="scan'208";a="125950251"
Received: from jekeller-desk.jf.intel.com ([10.166.241.15])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 15:16:07 -0700
From: Jacob Keller <jacob.e.keller@intel.com>
Date: Wed, 12 Mar 2025 15:15:54 -0700
Subject: [PATCH net v2 5/5] ptp: ocp: reject unsupported periodic output
 flags
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250312-jk-net-fixes-supported-extts-flags-v2-5-ea930ba82459@intel.com>
References: <20250312-jk-net-fixes-supported-extts-flags-v2-0-ea930ba82459@intel.com>
In-Reply-To: <20250312-jk-net-fixes-supported-extts-flags-v2-0-ea930ba82459@intel.com>
To: Tony Nguyen <anthony.l.nguyen@intel.com>, 
 Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Richard Cochran <richardcochran@gmail.com>, Ruud Bos <kernel.hbk@gmail.com>, 
 Paul Barker <paul.barker.ct@bp.renesas.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Bryan Whitehead <bryan.whitehead@microchip.com>, 
 UNGLinuxDriver@microchip.com, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Jonathan Lemon <jonathan.lemon@gmail.com>, Lasse Johnsen <l@ssejohnsen.me>, 
 Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
 Michal Swiatkowski <michal.swiatkowski@linux.intel.com>
Cc: intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, Jacob Keller <jacob.e.keller@intel.com>
X-Mailer: b4 0.14.2

The ptp_ocp_signal_from_perout() function supports PTP_PEROUT_DUTY_CYCLE
and PTP_PEROUT_PHASE. It does not support PTP_PEROUT_ONE_SHOT, but does not
reject a request with such an unsupported flag.

Add the appropriate check to ensure that unsupported requests are rejected
both for PTP_PEROUT_ONE_SHOT as well as any future flags.

Fixes: 1aa66a3a135a ("ptp: ocp: Program the signal generators via PTP_CLK_REQ_PEROUT")
Reviewed-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
Signed-off-by: Jacob Keller <jacob.e.keller@intel.com>
---
 drivers/ptp/ptp_ocp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
index b651087f426f50a73229ca57634fc5d6912e0a87..4a87af0980d695a9ab1b23e2544f620759ccb892 100644
--- a/drivers/ptp/ptp_ocp.c
+++ b/drivers/ptp/ptp_ocp.c
@@ -2090,6 +2090,10 @@ ptp_ocp_signal_from_perout(struct ptp_ocp *bp, int gen,
 {
 	struct ptp_ocp_signal s = { };
 
+	if (req->flags & ~(PTP_PEROUT_DUTY_CYCLE |
+			   PTP_PEROUT_PHASE))
+		return -EOPNOTSUPP;
+
 	s.polarity = bp->signal[gen].polarity;
 	s.period = ktime_set(req->period.sec, req->period.nsec);
 	if (!s.period)

-- 
2.48.1.397.gec9d649cc640


