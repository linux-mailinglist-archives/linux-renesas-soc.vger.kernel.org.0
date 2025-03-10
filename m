Return-Path: <linux-renesas-soc+bounces-14237-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 41560A5A6DC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Mar 2025 23:17:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C0D83AB57F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Mar 2025 22:16:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7904F1E885A;
	Mon, 10 Mar 2025 22:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c5QbF/ot"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48721E5734;
	Mon, 10 Mar 2025 22:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741645015; cv=none; b=S9UfWsWnU6LN6vLSa0D4aryhRQfMS5ePthhsk9QwumqGQNbecy2FjzGN6gEE5LrnEUBAP4PBqZ8+TRIPx934OlEMhQsnSTXKinliD7Ahbi4WDr6CkP7dQeuh9s6e5/CUC57LCt7FPIQWFwSLQ9yrsLbF+G0qB4ESOFxJoQeM7Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741645015; c=relaxed/simple;
	bh=VzLmmWyim0nHsZCIPWUYMGPDjbA4w3HmsLWEbB6sip0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e0MtsNI6LvTkFcntyZCSjMfM3R8yI5c89IPSkEcNkPBpNQEZ9voZiR/1dAJfkW80zb9TWU70JT1W029yXXBYTx258h89qcoKkIQ6UrCevSb+Zy2SDysIYpph3Qz4T5jQxdR5m+NWnMxkPakZXLR1GIO7GARYHZAjPeGYXqlLPpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c5QbF/ot; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741645014; x=1773181014;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=VzLmmWyim0nHsZCIPWUYMGPDjbA4w3HmsLWEbB6sip0=;
  b=c5QbF/ot0prTagyxJtjaLGQj+7ZdptWjnvYsNlMk5t0ZhF2ifUdpbz+c
   M3nt4MqOvcSRg8PJqo+0RhW4ez7txlWh1F9eJ6vxFBNCTgLvj/hDqmrlf
   u69RSrEQ+g2bmtk+9BCSpQp/+oVgQpQ/4AjNZoubfibRJ8pGO552u+LxU
   AuvyD6DsYUaosYavvVvDkQ4flEDc4RsS7Zl/i++Xa32wwT/tRPUYFhlKP
   hEknHpyvscXrIbQ5j8SjTbJKGL+6wtW8Jg6qjZdJaDXtfm1cXFRK1JxYX
   HAP3P8IXxl71X2ToEq/y9T0F25DVrzFM6HAZOahJ6uSTeNRfuereueBgN
   w==;
X-CSE-ConnectionGUID: VV+720O8R6qM47N4qBU5zw==
X-CSE-MsgGUID: dt3TUISvQzeRw4LQ7Ef1ZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="46443315"
X-IronPort-AV: E=Sophos;i="6.14,237,1736841600"; 
   d="scan'208";a="46443315"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 15:16:51 -0700
X-CSE-ConnectionGUID: aIwT9U65RtWSb4jdW5AY8w==
X-CSE-MsgGUID: Hu8Gqi8uTCS1Ssqen7xDmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,237,1736841600"; 
   d="scan'208";a="143315046"
Received: from jekeller-desk.jf.intel.com ([10.166.241.15])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 15:16:51 -0700
From: Jacob Keller <jacob.e.keller@intel.com>
Date: Mon, 10 Mar 2025 15:16:38 -0700
Subject: [PATCH net 3/5] net: lan743x: reject unsupported external
 timestamp requests
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250310-jk-net-fixes-supported-extts-flags-v1-3-854ffb5f3a96@intel.com>
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


