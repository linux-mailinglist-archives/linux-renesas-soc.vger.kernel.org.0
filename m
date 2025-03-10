Return-Path: <linux-renesas-soc+bounces-14235-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2D7A5A6D6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Mar 2025 23:17:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 33A583AD05F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Mar 2025 22:16:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15F531E5B84;
	Mon, 10 Mar 2025 22:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n2lLNBl4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2A41DFE20;
	Mon, 10 Mar 2025 22:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741645014; cv=none; b=pksp4iX5ARMqkt3FLb/FkuEJNr0zC1o+I43baCEXBw57ULrivCmVDv2O4FOKbJdzBnMdk8wyC5P9P53IJ58g5PIH+fgGP9oLwI5ST12RzyA4ao9Ym4Q2iX+CQmNqEN48QmgYXbLN52gUX/8WRgkjE+Ot+K/yL4DBAvzsFQKZreQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741645014; c=relaxed/simple;
	bh=myoSGgj74XPWSsdzkbKReU54Ix7Ldof7Y/C1MVgScH0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZYw6MEx4Horkk5cLW+SLM+5OfSfBfPN4XilauSZw9tcDDEjV2qmopvJW5J7RcJXB8Xdq+r0BCLgk3Tm/jltgV+IAWCIYZqxGXCsx27U1J1bjLupeqzVNk5JxdnS4ehwG8myx9kDXhM/VnPXAj4s/Uxd+AMOu/9U37p4soWtV3PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n2lLNBl4; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741645012; x=1773181012;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=myoSGgj74XPWSsdzkbKReU54Ix7Ldof7Y/C1MVgScH0=;
  b=n2lLNBl4SO8voCKJhysCR9eLrxAB+mrVbtJvLIsHfGy+mIKtxY3sXmNP
   CcOpDPtiPqI/i60JzEnVXLgm5OBwXoIfsddB7yGhRt3TCUet3c/9wOZvI
   OZUtOVekqhiDp84FeUhjUc8fPcgm2XvjNC4Hvr75XEdwZG4RraancmRZn
   MCYRgfbSjvB+auYBYyi0fwRRQK5ymJfRQ4lRtWlvB2GQOD99sY8h7eo6K
   tUN0FuFY+mP/LVGCkl+YJx1WZpeLGSwbeujSID76/I0yZ6sjd9fyEyU0R
   9BZqlslISUbIwT8Tl/NAQ+QYLrp1MBh4/rNX+UYlUtSl8lx7QAZwwVq3z
   w==;
X-CSE-ConnectionGUID: KHO+s8xXQPmsYcZsqlmb7w==
X-CSE-MsgGUID: P08JWCspTBqmm8wnXx6Pkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="46443285"
X-IronPort-AV: E=Sophos;i="6.14,237,1736841600"; 
   d="scan'208";a="46443285"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 15:16:50 -0700
X-CSE-ConnectionGUID: 9M7MY91sQ0GFODloV84q9g==
X-CSE-MsgGUID: WnZ+pzQ2RKC4p8tI+T5R2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,237,1736841600"; 
   d="scan'208";a="143315035"
Received: from jekeller-desk.jf.intel.com ([10.166.241.15])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 15:16:50 -0700
From: Jacob Keller <jacob.e.keller@intel.com>
Date: Mon, 10 Mar 2025 15:16:36 -0700
Subject: [PATCH net 1/5] igb: reject invalid external timestamp requests
 for 82580-based HW
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250310-jk-net-fixes-supported-extts-flags-v1-1-854ffb5f3a96@intel.com>
References: <20250310-jk-net-fixes-supported-extts-flags-v1-0-854ffb5f3a96@intel.com>
In-Reply-To: <20250310-jk-net-fixes-supported-extts-flags-v1-0-854ffb5f3a96@intel.com>
To: Tony Nguyen <anthony.l.nguyen@intel.com>, 
 Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Richard Cochran <richardcochran@gmail.com>, Ruud Bos <kernel.hbk@gmail.com>, 
 Paul Barker <paul.barker.ct@bp.renesas.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Bryan Whitehead <bryan.whitehead@microchip.com>, 
 UNGLinuxDriver@microchip.com, Raju Lakkaraju <Raju.Lakkaraju@microchip.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Jonathan Lemon <jonathan.lemon@gmail.com>, Lasse Johnsen <l@ssejohnsen.me>, 
 Vadim Fedorenko <vadim.fedorenko@linux.dev>
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
Signed-off-by: Jacob Keller <jacob.e.keller@intel.com>
---
 drivers/net/ethernet/intel/igb/igb_ptp.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/ethernet/intel/igb/igb_ptp.c b/drivers/net/ethernet/intel/igb/igb_ptp.c
index f9457055612004c10f74379122063e8136fe7d76..b89ef4538a18d7ca11325ddc15944a878f4d807e 100644
--- a/drivers/net/ethernet/intel/igb/igb_ptp.c
+++ b/drivers/net/ethernet/intel/igb/igb_ptp.c
@@ -509,6 +509,11 @@ static int igb_ptp_feature_enable_82580(struct ptp_clock_info *ptp,
 					PTP_STRICT_FLAGS))
 			return -EOPNOTSUPP;
 
+		/* Both the rising and falling edge are timstamped */
+		if (rq->extts.flags & PTP_STRICT_FLAGS &&
+		    (rq->extts.flags & PTP_EXTTS_EDGES) != PTP_EXTTS_EDGES)
+			return -EOPNOTSUPP;
+
 		if (on) {
 			pin = ptp_find_pin(igb->ptp_clock, PTP_PF_EXTTS,
 					   rq->extts.index);

-- 
2.48.1.397.gec9d649cc640


