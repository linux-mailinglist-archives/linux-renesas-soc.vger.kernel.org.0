Return-Path: <linux-renesas-soc+bounces-14236-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C6DA5A6DA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Mar 2025 23:17:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 19A3F1893514
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Mar 2025 22:17:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44E061E8339;
	Mon, 10 Mar 2025 22:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iWdJKGL4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B241E411C;
	Mon, 10 Mar 2025 22:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741645015; cv=none; b=QK1zPfe3LLT7068pejr/Cu5pRdlgZdmufy1zdFVtdZprA0KROlXf5E+uvCyUBVMvwauv7Z8447Z2ZvFzaZkcSJXMwUFpkDyPxC6TYgWBEv6W5k8hSoUpW9dl3Sx7oIGcvppAPfegIybTTZ9Dih2+TKiAtIclv0Mr+tSsHd8oQJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741645015; c=relaxed/simple;
	bh=uPzVgNJtr9kkTWtPDLiGgIWOsAJbSrZd8+u0qOMgpFE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h+W03x40HhbbPtXsrtifI/JLAKriBrWnFETbF2lip1Uk+kNr5Leu+hK72rcuXFLRjGOhOyEpSrQRJMv/YkmZt3ER5CEBvlTMkJQ3P0NkTWw/GLa+eBFK4cyvRjgqxVb4ZYgPsOhigeF/fBiKW/CuZXqVPgjgJqedLASZHAU6DAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iWdJKGL4; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741645013; x=1773181013;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=uPzVgNJtr9kkTWtPDLiGgIWOsAJbSrZd8+u0qOMgpFE=;
  b=iWdJKGL4sT798gygWiKmecVle75QtY31ZV53CIw62wZcLUPnbwr5+HhH
   CmmV+PscjBaEdBPnHPQF/g2n7/NrWS63eJ4txqMG+elkUicJzBTRpvd+O
   fDg59gKLltWqZHiOh/TVY5kEW/pLWRemiCRXuwdj4eovF4affOFTtwMvU
   GxsotTsrbCOK2YbsnPnoC6OJWT8AZSqZvNFe1k4534Do3f1R/HxBRikpr
   z0MBuzWtDpm/X1t7CJBmmoxnGg065gTVfbs9bA+HYXPbZhv8PcAVJeoGF
   oO92/R86Hbc3pXdZawhHCQdTJXhRyTsW852IDNQPvKhRKavs23GrSxKc9
   A==;
X-CSE-ConnectionGUID: zsFT/Rc7SxeDeeBz9MDLGQ==
X-CSE-MsgGUID: qiF90Tk8Sr+EJ80CXSPLpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="46443300"
X-IronPort-AV: E=Sophos;i="6.14,237,1736841600"; 
   d="scan'208";a="46443300"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 15:16:51 -0700
X-CSE-ConnectionGUID: pyIFQ1evQc2fPiccT80O7w==
X-CSE-MsgGUID: Rsad+2zVT/S5NLl9/fCAXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,237,1736841600"; 
   d="scan'208";a="143315040"
Received: from jekeller-desk.jf.intel.com ([10.166.241.15])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 15:16:51 -0700
From: Jacob Keller <jacob.e.keller@intel.com>
Date: Mon, 10 Mar 2025 15:16:37 -0700
Subject: [PATCH net 2/5] renesas: reject PTP_STRICT_FLAGS as unsupported
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250310-jk-net-fixes-supported-extts-flags-v1-2-854ffb5f3a96@intel.com>
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

The ravb_ptp_extts() function checks the flags coming from the
PTP_EXTTS_REQUEST ioctl, to ensure that future flags are not accepted on
accident.

This was updated to 'honor' the PTP_STRICT_FLAGS in commit 6138e687c7b6
("ptp: Introduce strict checking of external time stamp options.").
However, the driver does not *actually* validate the flags.

I originally fixed this driver to reject future flags in commit
592025a03b34 ("renesas: reject unsupported external timestamp flags"). It
is still unclear whether this hardware timestamps the rising, falling, or
both edges of the input signal.

Accepting requests with PTP_STRICT_FLAGS is a bug, as this could lead to
users mistakenly assuming a request with PTP_RISING_EDGE actually
timestamps the rising edge only.

Reject requests with PTP_STRICT_FLAGS (and hence all PTP_EXTTS_REQUEST2
requests) until someone with access to the datasheet or hardware knowledge
can confirm the timestamping behavior and update this driver.

Fixes: 6138e687c7b6 ("ptp: Introduce strict checking of external time stamp options.")
Signed-off-by: Jacob Keller <jacob.e.keller@intel.com>
---
 drivers/net/ethernet/renesas/ravb_ptp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_ptp.c b/drivers/net/ethernet/renesas/ravb_ptp.c
index 6e4ef7af27bf31ab2aad8e06a65e0ede6046e3c0..b4365906669f3bd40953813e263aeaafd2e1eb70 100644
--- a/drivers/net/ethernet/renesas/ravb_ptp.c
+++ b/drivers/net/ethernet/renesas/ravb_ptp.c
@@ -179,8 +179,7 @@ static int ravb_ptp_extts(struct ptp_clock_info *ptp,
 	/* Reject requests with unsupported flags */
 	if (req->flags & ~(PTP_ENABLE_FEATURE |
 			   PTP_RISING_EDGE |
-			   PTP_FALLING_EDGE |
-			   PTP_STRICT_FLAGS))
+			   PTP_FALLING_EDGE))
 		return -EOPNOTSUPP;
 
 	if (req->index)

-- 
2.48.1.397.gec9d649cc640


