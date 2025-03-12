Return-Path: <linux-renesas-soc+bounces-14318-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 314B6A5E717
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Mar 2025 23:16:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C7D117B339
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Mar 2025 22:16:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 770721EEA28;
	Wed, 12 Mar 2025 22:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ms9320zr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA6D1D86F2;
	Wed, 12 Mar 2025 22:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741817769; cv=none; b=JmKs94LAcSHbH84mJFQCfou40G09JLSmSsP65wco2Zjxc1VfTt5dyApwoa9R0nFruZGPLb8Ac5yObNDCqkyYxKMj3+sNOEG8jNb1nEb9YX15qz5s+WN1y3HrDJQPjVFr0YfywuZp6OXRUETilm8krq5OahaMBLcay/RWIRMBIp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741817769; c=relaxed/simple;
	bh=1KwTPESjoV4wGw74MHx2lBmKX2wLUahDheHKien59S8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Xu8LMQQGg9jSuIr1IL3VnICkiXBCNZOkYaARlDX5jqaxRwnk74sDu5f4snx//gtHey0ex0cMESmD/pDn876qIbnPDU6/4zICjjIfAPwZ9TBcl9OXBd5KrQKg0mWNotPmju3zfcwDOZUbDJqvqRVcVoRP6oDx9D/vRF/fWbqpxk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ms9320zr; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741817768; x=1773353768;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=1KwTPESjoV4wGw74MHx2lBmKX2wLUahDheHKien59S8=;
  b=Ms9320zrm9UzMv8LrJmhs/FV2F0aRVqP0F//7TJEdK3KldPri403PCDd
   rAgiL93wA7epLxdDqwl6GX+vUqS9gQtJMsCXZ/vAW9DuM82YJeyPABSZM
   ToZ7f2clXPpeCKxuPVbDp8Rcxwc6NHLpHYFzUI5bVj4/kJntV0hFEloSE
   PNeMVM7WpwGpycmWn+0AfehgDA1W47rSADg0xsI4K5epzmLGeFeMg7rsO
   K+y6PvCOV8q9RoywQbRjrKNq7DQogDwEjR257XXIOC7HdCyV9s+tD2a4H
   Sf0lYvsxGBnVylfqpwlR++ICs/V/QkrBl5+oLnSMtimiGfwIlXmBJ7Hxf
   w==;
X-CSE-ConnectionGUID: K2mu5F8SSUOvp5wJa5/9XA==
X-CSE-MsgGUID: MJo2/cg8Q6meIdyQ6zXpDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="54288360"
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; 
   d="scan'208";a="54288360"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 15:16:07 -0700
X-CSE-ConnectionGUID: 7ZptAuQLTnauwVB7uWUibw==
X-CSE-MsgGUID: VsKtbhuZR+WBzzCjQvWRCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; 
   d="scan'208";a="125950236"
Received: from jekeller-desk.jf.intel.com ([10.166.241.15])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 15:16:06 -0700
From: Jacob Keller <jacob.e.keller@intel.com>
Subject: [PATCH net v2 0/5] net: ptp: fix egregious supported flag checks
Date: Wed, 12 Mar 2025 15:15:49 -0700
Message-Id: <20250312-jk-net-fixes-supported-extts-flags-v2-0-ea930ba82459@intel.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJUH0mcC/5WNTQ6CMBCFr0Jm7ZhSqEFX3MOwQJjCKLakUwmGc
 HcbbuDy/X1vA6HAJHDLNgi0sLB3SehTBt3YuoGQ+6RBK21UkSt8vtBRRMsrCcpnnn2I1COtMQr
 aqR0EqSqLsq9IG6MhgeZARz1x7pDG0CRzZIk+fI/jJT+ifz6WHBVWprT2YWzRXi81u0jTufNva
 PZ9/wGZ3E3/2QAAAA==
X-Change-ID: 20250310-jk-net-fixes-supported-extts-flags-e8434d8e2552
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

In preparation for adding .supported_extts_flags and
.supported_perout_flags to the ptp_clock_info structure, fix a couple of
places where drivers get existing flag gets grossly incorrect.

The igb driver claims 82580 supports strictly validating PTP_RISING_EDGE
and PTP_FALLING_EDGE, but doesn't actually check the flags. Fix the driver
to require that the request match both edges, as this is implied by the
datasheet description.

The renesas driver also claims to support strict flag checking, but does
not actually check the flags either. I do not have the data sheet for this
device, so I do not know what edge it timestamps. For simplicity, just
reject all requests with PTP_STRICT_FLAGS. This essentially prevents the
PTP_EXTTS_REQUEST2 ioctl from working. Updating to correctly validate the
flags will require someone who has the hardware to confirm the behavior.

The lan743x driver supports (and strictly validates) that the request is
either PTP_RISING_EDGE or PTP_FALLING_EDGE but not both. However, it does
not check the flags are one of the known valid flags. Thus, requests for
PTP_EXT_OFF (and any future flag) will be accepted and misinterpreted. Add
the appropriate check to reject unsupported PTP_EXT_OFF requests and future
proof against new flags.

The broadcom PHY driver checks that PTP_PEROUT_PHASE is not set. This
appears to be an attempt at rejecting unsupported flags. It is not robust
against flag additions such as the PTP_PEROUT_ONE_SHOT, or anything added
in the future. Fix this by instead checking against the negation of the
supported PTP_PEROUT_DUTY_CYCLE instead.

The ptp_ocp driver supports PTP_PEROUT_PHASE and PTP_PEROUT_DUTY_CYCLE, but
does not check unsupported flags. Add the appropriate check to ensure
PTP_PEROUT_ONE_SHOT and any future flags are rejected as unsupported.

These are changes compile-tested, but I do not have hardware to validate the
behavior.

There are a number of other drivers which enable periodic output or
external timestamp requests, but which do not check flags at all. We could
go through each of these drivers one-by-one and meticulously add a flag
check. Instead, these drivers will be covered only by the upcoming
.supported_extts_flags and .supported_perout_flags checks in a net-next
series.

Signed-off-by: Jacob Keller <jacob.e.keller@intel.com>
---
Changes in v2:
- Drop Raju Lakkaraju from Cc since his email appears to no longer deliver.
- Fix the igb 82580 check to allow disabling the pin without flags set.
- Link to v1: https://lore.kernel.org/r/20250310-jk-net-fixes-supported-extts-flags-v1-0-854ffb5f3a96@intel.com

---
Jacob Keller (5):
      igb: reject invalid external timestamp requests for 82580-based HW
      renesas: reject PTP_STRICT_FLAGS as unsupported
      net: lan743x: reject unsupported external timestamp requests
      broadcom: fix supported flag check in periodic output function
      ptp: ocp: reject unsupported periodic output flags

 drivers/net/ethernet/intel/igb/igb_ptp.c     | 6 ++++++
 drivers/net/ethernet/microchip/lan743x_ptp.c | 6 ++++++
 drivers/net/ethernet/renesas/ravb_ptp.c      | 3 +--
 drivers/net/phy/bcm-phy-ptp.c                | 3 ++-
 drivers/ptp/ptp_ocp.c                        | 4 ++++
 5 files changed, 19 insertions(+), 3 deletions(-)
---
base-commit: 992ee3ed6e9fdd0be83a7daa5ff738e3cf86047f
change-id: 20250310-jk-net-fixes-supported-extts-flags-e8434d8e2552

Best regards,
-- 
Jacob Keller <jacob.e.keller@intel.com>


