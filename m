Return-Path: <linux-renesas-soc+bounces-14320-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4679EA5E720
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Mar 2025 23:16:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F38A17B321
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Mar 2025 22:16:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C39201F03CE;
	Wed, 12 Mar 2025 22:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dlzZqd2p"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161021EFF81;
	Wed, 12 Mar 2025 22:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741817771; cv=none; b=LeybQeKzr5GdXT94t+pDYAEclJ9LV5blPn3D8zlUv13t9fSGRe4uNnWl/qBiWXGi8Ps6Mwyyd7XSmwJL7caDI6D/P84Uo7HOeWdQ2+PJ5odDxzm0aOuh/3BRierxf/fXfDE5e1vtn7o8YuaDT53ScuHaSPomYpTpm2lpSrQZZTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741817771; c=relaxed/simple;
	bh=NdeYUySIiYtPzYwBwD5+tXrplkOPuaQwtpJ5FgKG8a4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BCCr3AFL6IsPGdfpAMxk02Eh1hPvHxfXlM+yTr2bpqtKM/ZW+jfpdIzi9eKQE7soVkYBGLGSeo3JqBT0wAdaXreg9BVRo5CuOKMA3ahypcMkSd/DjA28cdtLT3FttvNmDsmR8jzlmLHkcAWhxOcdeiHDQyCHvGbP7/58nTEnXaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dlzZqd2p; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741817770; x=1773353770;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=NdeYUySIiYtPzYwBwD5+tXrplkOPuaQwtpJ5FgKG8a4=;
  b=dlzZqd2pZJ9ozVXXvXys1qkJ8T9a2sAdlpLK6ByrUw04mFl4ZKyypjbe
   DwDjTzV0UunfKPlcSoyPMLTIBqOh1iH6A9gQSE+OWwD0ze9vDyTLiDIWY
   5KWi0T96WHOKpErZ74DZttY2Fpma8SOJAreRVWexUqpwffrthq7y19Y8Y
   sOokw5l5hliWAOx6NYC3ZirkBo1/v9oIw9/76NIGHLSwsGQ4G2E31MUXj
   AJ05WuQ/MmiTwwyutMerwhi9EnnN9uScKKqr8SPmGvxMRBYkCJfx6hcbL
   IgbWiulRBD5DOSBJwAFtYjsmYMfGAFQJIpaV6no5KXcFwy2+eTaQnd/rs
   A==;
X-CSE-ConnectionGUID: wzCDKYLgSHqbhHHWaU8aCA==
X-CSE-MsgGUID: cRGgUJ/ATTCIVhRhTaxxgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="54288380"
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; 
   d="scan'208";a="54288380"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 15:16:07 -0700
X-CSE-ConnectionGUID: 4HPccVGcS1W1/YOMvq4TvA==
X-CSE-MsgGUID: zuJTnNl9QyOwsEw3Pr9dyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; 
   d="scan'208";a="125950239"
Received: from jekeller-desk.jf.intel.com ([10.166.241.15])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 15:16:06 -0700
From: Jacob Keller <jacob.e.keller@intel.com>
Date: Wed, 12 Mar 2025 15:15:50 -0700
Subject: [PATCH net v2 1/5] igb: reject invalid external timestamp requests
 for 82580-based HW
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250312-jk-net-fixes-supported-extts-flags-v2-1-ea930ba82459@intel.com>
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

The igb_ptp_feature_enable_82580 function correctly checks that unknown
flags are not passed to the function. However, it does not actually check
PTP_RISING_EDGE or PTP_FALLING_EDGE when configuring the external timestamp
function.

The data sheet for the 82580 product says:

  Upon a change in the input level of one of the SDP pins that was
  configured to detect Time stamp events using the TSSDP register, a time
  stamp of the system time is captured into one of the two auxiliary time
  stamp registers (AUXSTMPL/H0 or AUXSTMPL/H1).

  For example to define timestamping of events in the AUXSTMPL0 and
  AUXSTMPH0 registers, Software should:

  1. Set the TSSDP.AUX0_SDP_SEL field to select the SDP pin that detects
     the level change and set the TSSDP.AUX0_TS_SDP_EN bit to 1.

  2. Set the TSAUXC.EN_TS0 bit to 1 to enable timestamping

The same paragraph is in the i350 and i354 data sheets.

The wording implies that the time stamps are captured at any level change.
There does not appear to be any way to only timestamp one edge of the
signal.

Reject requests which do not set both PTP_RISING_EDGE and PTP_FALLING_EDGE
when operating under PTP_STRICT_FLAGS mode via PTP_EXTTS_REQUEST2.

Fixes: 38970eac41db ("igb: support EXTTS on 82580/i354/i350")
Reviewed-by: Michal Swiatkowski <michal.swiatkowski@linux.intel.com>
Signed-off-by: Jacob Keller <jacob.e.keller@intel.com>
---
Changes in v2:
- Fix the 82580 check to allow disabling the pin without flags set.
---
 drivers/net/ethernet/intel/igb/igb_ptp.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/ethernet/intel/igb/igb_ptp.c b/drivers/net/ethernet/intel/igb/igb_ptp.c
index f9457055612004c10f74379122063e8136fe7d76..f323e1c1989f1bfbbf1f04043c2c0f14ae8c716f 100644
--- a/drivers/net/ethernet/intel/igb/igb_ptp.c
+++ b/drivers/net/ethernet/intel/igb/igb_ptp.c
@@ -509,6 +509,12 @@ static int igb_ptp_feature_enable_82580(struct ptp_clock_info *ptp,
 					PTP_STRICT_FLAGS))
 			return -EOPNOTSUPP;
 
+		/* Both the rising and falling edge are timestamped */
+		if (rq->extts.flags & PTP_STRICT_FLAGS &&
+		    (rq->extts.flags & PTP_ENABLE_FEATURE) &&
+		    (rq->extts.flags & PTP_EXTTS_EDGES) != PTP_EXTTS_EDGES)
+			return -EOPNOTSUPP;
+
 		if (on) {
 			pin = ptp_find_pin(igb->ptp_clock, PTP_PF_EXTTS,
 					   rq->extts.index);

-- 
2.48.1.397.gec9d649cc640


