Return-Path: <linux-renesas-soc+bounces-14234-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FD6A5A6CF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Mar 2025 23:16:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B2A5D17372B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Mar 2025 22:16:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66FA81E1C3A;
	Mon, 10 Mar 2025 22:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="byXYwimg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DE0382;
	Mon, 10 Mar 2025 22:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741645013; cv=none; b=Itymgt6grRPdJp/T4YlMkAdfe+r0NNLdCwqpuLbXAW+88p8dEiVvEWrOUsLilgb34h/S8NyI+3IBO+5TeTx1RP00CZ9u1MDBt+XrhlhWINzlM7BTtgxBBV/wWlP7nePKg1OQRe/M8Gem/COVHNmr7psfxD8Ya14lcyks8tLSlIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741645013; c=relaxed/simple;
	bh=TsIVHhAGzWgkmSmlzL5RUweT57BypUp0vQOzaPl/oNY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=d9QkFXAOVJ9rg+bQcE3mXXqypErEx7QfQzkNnR45RCkxnsZqFQtvWTS7g6vrvCCoChST09Pr2JN1Lh/Ydby6Q1CAWdc0eHDDpXzbCcRFliRU9pAjCqolgzbcYO2Gu6i7fr5vqiUeCJ9Ms+dznYviGmYDyNS8jWICKOdTlHOskc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=byXYwimg; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741645011; x=1773181011;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=TsIVHhAGzWgkmSmlzL5RUweT57BypUp0vQOzaPl/oNY=;
  b=byXYwimgMfGrMhFZHWRWOyb1xYyw4L29DKyOz6Q8d0pQMrBu04g9+N2Q
   Ey0GnQ7WSvkoBK7IqidksJnWKXFApfi2loR/7dQaPEvxk9u9AkDYv1T4S
   D05VxqummNSSJfa779DGi4aWKiDjSd7nSzBo1fzqzoveUzxJyBY4zpTql
   3cSgsaKyQXsDkSg/SmcihxsCAbZcQc6NvWR9bZ7tZ3F8E8loUpICKz7gF
   JlQM59ryg78CxR2m3nepY85nTERl1LGC5edSqLtcyXbB5qwWm2f8FKQIW
   BryKIzfq6Nnrhl0zPdGdOacDHuYTephEIl2BSpZPt4COVir0cYLZHGVJb
   g==;
X-CSE-ConnectionGUID: xpzou1/tSnyKBeNJCTs1MA==
X-CSE-MsgGUID: 9YyUDk9zTEKjxsj+LKCm0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="46443272"
X-IronPort-AV: E=Sophos;i="6.14,237,1736841600"; 
   d="scan'208";a="46443272"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 15:16:50 -0700
X-CSE-ConnectionGUID: PSw1ICMzSayj7hbOQ+CvGA==
X-CSE-MsgGUID: wIbL1Gw/TPO+Vxm76VVhhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,237,1736841600"; 
   d="scan'208";a="143315031"
Received: from jekeller-desk.jf.intel.com ([10.166.241.15])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 15:16:50 -0700
From: Jacob Keller <jacob.e.keller@intel.com>
Subject: [PATCH net 0/5] net: ptp: fix egregious supported flag checks
Date: Mon, 10 Mar 2025 15:16:35 -0700
Message-Id: <20250310-jk-net-fixes-supported-extts-flags-v1-0-854ffb5f3a96@intel.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMNkz2cC/x2MwQqDMBAFf0X23IUYDUh/pfQgzdNuW2LIxiKI/
 +7icWBmdlIUgdK92angLypLMmhvDb3eY5rBEo3JOx9c1zr+fDmh8iQblHXNeSkVkbHVqjz9xlk
 ZQ9/1cYAPwZONcsGl2+dBFtPzOE4TnFoZeQAAAA==
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
Jacob Keller (5):
      igb: reject invalid external timestamp requests for 82580-based HW
      renesas: reject PTP_STRICT_FLAGS as unsupported
      net: lan743x: reject unsupported external timestamp requests
      broadcom: fix supported flag check in periodic output function
      ptp: ocp: reject unsupported periodic output flags

 drivers/net/ethernet/intel/igb/igb_ptp.c     | 5 +++++
 drivers/net/ethernet/microchip/lan743x_ptp.c | 6 ++++++
 drivers/net/ethernet/renesas/ravb_ptp.c      | 3 +--
 drivers/net/phy/bcm-phy-ptp.c                | 3 ++-
 drivers/ptp/ptp_ocp.c                        | 4 ++++
 5 files changed, 18 insertions(+), 3 deletions(-)
---
base-commit: 992ee3ed6e9fdd0be83a7daa5ff738e3cf86047f
change-id: 20250310-jk-net-fixes-supported-extts-flags-e8434d8e2552

Best regards,
-- 
Jacob Keller <jacob.e.keller@intel.com>


