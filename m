Return-Path: <linux-renesas-soc+bounces-14319-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DFCA5E71C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Mar 2025 23:16:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4962317BA32
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Mar 2025 22:16:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 338261EFFB7;
	Wed, 12 Mar 2025 22:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X4m0JfJO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8211E1EEA40;
	Wed, 12 Mar 2025 22:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741817771; cv=none; b=IF30xjcaoQwKdwGWZdmJiGnOaVCPlm8wgp51ZWYGlSpxjMqiw4/o46dmoBxOlwqP9zFhCTY793VX32tLVuCS9W2tfNvEwts6zlPJKsb/NomVcCiwkE7E2vGs+jxRyDg6G3YPjLhgdOI1XCiBi2zjRHFvvx57pCi1qijByL/e4tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741817771; c=relaxed/simple;
	bh=uPzVgNJtr9kkTWtPDLiGgIWOsAJbSrZd8+u0qOMgpFE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vo/yeqA4mriHwf9LUjR93pkyKnzFsjnGvDlykPh3Fi11exao1++wwItY+DhgcoroC7BWQbSmq1EqDrUZ6LIJ6vOQoM6tsgBSFb364UfKAUYvdpoQ+//oAdK22ipMJkHPLo1aCV+ED1r8qNni7BcXMX6vgpp0B7HDK+iJr5bIfT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X4m0JfJO; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741817770; x=1773353770;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=uPzVgNJtr9kkTWtPDLiGgIWOsAJbSrZd8+u0qOMgpFE=;
  b=X4m0JfJOqlLXOsMDE8rLogrUaKDM8R71fpHb5A3CPEsj2UrLeb21r/2d
   X80cijbk7q1Tt21lJqt1F07uQyfpiYepyHFPCIr/6H0pLF1ejyhsfF0jF
   W8pFJVcEJ22+93Q0YEYg562jWzm5ok1fEPREnrftQoanQbs28r0d3ZecO
   hQjwYfb4z0GmLN12eX2WA8BVaRehKaohCsGy1gqIupKz8Tf/AoR1jIVzY
   5kJn/Vo0Ghkja6JCGuX8aTQo+qZWUy7lIvOkcWplEZS9m0x984Mg27vxC
   JGTLLlVd5Roce6GuhByiG/9QZ4J71DDKU+B5JZCLpewpww5oL6y6GAgEe
   g==;
X-CSE-ConnectionGUID: 9QQ6n2hWSW281Qv2gjaMTg==
X-CSE-MsgGUID: alZCEDeXT5O1UGmYEgUbJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="54288399"
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; 
   d="scan'208";a="54288399"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 15:16:07 -0700
X-CSE-ConnectionGUID: RPZqz1gqRd2fk2ZEEyOS1w==
X-CSE-MsgGUID: hNR8Cw4qTzSxMi0CU6QKgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; 
   d="scan'208";a="125950242"
Received: from jekeller-desk.jf.intel.com ([10.166.241.15])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 15:16:07 -0700
From: Jacob Keller <jacob.e.keller@intel.com>
Date: Wed, 12 Mar 2025 15:15:51 -0700
Subject: [PATCH net v2 2/5] renesas: reject PTP_STRICT_FLAGS as unsupported
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250312-jk-net-fixes-supported-extts-flags-v2-2-ea930ba82459@intel.com>
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


