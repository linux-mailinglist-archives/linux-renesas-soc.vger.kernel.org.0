Return-Path: <linux-renesas-soc+bounces-14321-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B9EA5E722
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Mar 2025 23:16:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CFCE7165BC9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Mar 2025 22:16:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2D551F099D;
	Wed, 12 Mar 2025 22:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UOjUO3WU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0C71EFFBD;
	Wed, 12 Mar 2025 22:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741817772; cv=none; b=omLF8LcbIlr6X0YIWgT9cunlwsZWSKhYQjLyCMkZ0jxp0gPYhl/z2Rpgm1c5nXDEAAT9gyUFeiPVrBs7T7yJCDM3L57p8wQjdfOcLb/4AYEF93GCumgTdPEm0yD723Oa3MuBKrCauV3zlVfQACkPgeLsXQSo9kidtE3TA58r9kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741817772; c=relaxed/simple;
	bh=VzLmmWyim0nHsZCIPWUYMGPDjbA4w3HmsLWEbB6sip0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GWP7enGFPVv5YKd30DW/8y5xw6PKQ113J4vGXrudAJf9SWdDELaE9BrW0ZMdF20rRNVEWE63tsBfQUHKb0ATAsdR8un0TdmJfFYfjtFu5yD5Mr7l9urEWGLUjqWHqJuU3EJvMsC3Tvfg8h0IHzw8XDeqkLVr1b8V1VPzyh36ed4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UOjUO3WU; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741817772; x=1773353772;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=VzLmmWyim0nHsZCIPWUYMGPDjbA4w3HmsLWEbB6sip0=;
  b=UOjUO3WU1NVa7pTAIOssGQ3ZPntpiBeMmjLsjrITlnMIFRbpAV7PKKyE
   TS6MwrUZ9J1KiE3csEl9gwiAeYRVLF7KIb3fiJGRUe7k97wnx2bfhJTHu
   /ZQNPdjNPkRpM+Um6honv/zm95Hj98CdiMWoJcYrvGYTMOPS0j46wHJHg
   xLkyy1WFWV3jB3D9QY6RQ9+SaGBogswTTMNd6ourBBfI6YYIuivGfTBGI
   PsQC5LVMjXLwv4vAPjI6kPwAg+tRK8VIgsvzNTubo5mmR40/lvupZ8Y/p
   HuOPLIQtgI7CyK3trUmxpHL8UNQ2uwuHWSNvWjjkoFX22Z/ASmyZ0pRc6
   A==;
X-CSE-ConnectionGUID: wNrJoq71QEuKUUZsODZuhA==
X-CSE-MsgGUID: 8FVCXbpBS2WA/RRQIL6jGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="54288417"
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; 
   d="scan'208";a="54288417"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 15:16:08 -0700
X-CSE-ConnectionGUID: Ucezg74kRGKlYbjB2GPKQQ==
X-CSE-MsgGUID: TuONhjYaQf2evtu/9Ja0FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; 
   d="scan'208";a="125950245"
Received: from jekeller-desk.jf.intel.com ([10.166.241.15])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 15:16:07 -0700
From: Jacob Keller <jacob.e.keller@intel.com>
Date: Wed, 12 Mar 2025 15:15:52 -0700
Subject: [PATCH net v2 3/5] net: lan743x: reject unsupported external
 timestamp requests
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250312-jk-net-fixes-supported-extts-flags-v2-3-ea930ba82459@intel.com>
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

The lan743x_ptp_io_event_cap_en() function checks that the given request
sets only one of PTP_RISING_EDGE or PTP_FALLING_EDGE, but not both.

However, this driver does not check whether other flags (such as
PTP_EXT_OFF) are set, nor whether any future unrecognized flags are set.

Fix this by adding the appropriate check to the lan743x_ptp_io_extts()
function.

Fixes: 60942c397af6 ("net: lan743x: Add support for PTP-IO Event Input External Timestamp (extts)")
Signed-off-by: Jacob Keller <jacob.e.keller@intel.com>
---
 drivers/net/ethernet/microchip/lan743x_ptp.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/ethernet/microchip/lan743x_ptp.c b/drivers/net/ethernet/microchip/lan743x_ptp.c
index 4a777b449ecd03ac0d7576f8570f1a7794fb3d06..0be44dcb339387e9756f36f909f65c20870bc49b 100644
--- a/drivers/net/ethernet/microchip/lan743x_ptp.c
+++ b/drivers/net/ethernet/microchip/lan743x_ptp.c
@@ -942,6 +942,12 @@ static int lan743x_ptp_io_extts(struct lan743x_adapter *adapter, int on,
 
 	extts = &ptp->extts[index];
 
+	if (extts_request->flags & ~(PTP_ENABLE_FEATURE |
+				     PTP_RISING_EDGE |
+				     PTP_FALLING_EDGE |
+				     PTP_STRICT_FLAGS))
+		return -EOPNOTSUPP;
+
 	if (on) {
 		extts_pin = ptp_find_pin(ptp->ptp_clock, PTP_PF_EXTTS, index);
 		if (extts_pin < 0)

-- 
2.48.1.397.gec9d649cc640


