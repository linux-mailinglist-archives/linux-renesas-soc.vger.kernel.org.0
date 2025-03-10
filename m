Return-Path: <linux-renesas-soc+bounces-14238-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 92759A5A6DF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Mar 2025 23:17:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F41721744CD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Mar 2025 22:17:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B29E51E991B;
	Mon, 10 Mar 2025 22:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HuBLsaTe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175E81E5B8B;
	Mon, 10 Mar 2025 22:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741645015; cv=none; b=g1L73QWXG7h2OxHtUjZqO224gruzjBX3VZ7R8Fr8hQZDZ2UJk5v5jxFxx4CzdMI4HHQrjFMwq+2GH20uZWcxiXwFoVB8dID1LotSBb+Zcch5kLPTXg0LcAy0J9vlKzwcV4j+smgE9blBAhBDIpVX2/iGFIRNeVA+cw7ixs6UI0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741645015; c=relaxed/simple;
	bh=vgAZuqrWQCBG8jhKLQ4s5o+NgYF0GeB2/KjKVbVyH3U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JyLjZ0W9AoDN2czBtg27I7eBEyRQ+i/TINkaQ2NaNMAv+c+m3L9K+aSMpfcgkB18klZlmfrRlmoJdQfa3P3N77fWx8vCtX1JpSrfD1wVOMmDPlyGTCGQbcd27SpPBKUM95kgNQG1+E1u4Z3KBiLf/Fh9QiA0pKbxNsWCgP8RGa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HuBLsaTe; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741645014; x=1773181014;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=vgAZuqrWQCBG8jhKLQ4s5o+NgYF0GeB2/KjKVbVyH3U=;
  b=HuBLsaTewk6HlmyDKEaAR/6SBOe7fM9rtOn4e7JxQn95TVJHM2AQsF7R
   onDS4migVbzEyP2bYGqye/n0xPfJ7EZRhL3urddgmLKwEZLaP/zkaRVWH
   hAnyLQCZ0qjts7jCU7wbqErpFQDNBWHJQFptdMqjh2WwiVprAcEYu9nQ7
   9xEKcvAMHr1MEe9oQa0Qb5flW41SWHufvkqpg5a1EVQZkK1dhtGZvSoGZ
   tneOQ/HOWu6a/AmWNhviKHLX1EMScQUuWmNgJdUz2IDLMnSYt1vibwT7W
   B1CdrkhG9OHHhF7dLh6S4ttF7kGcMEPoNgVLnePicfE3+/cv9+VbO1iKE
   A==;
X-CSE-ConnectionGUID: mbGEcOE9Qpq9JQ+ChJUlKA==
X-CSE-MsgGUID: 20ieANMHT3qQJO2334J6DQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="46443330"
X-IronPort-AV: E=Sophos;i="6.14,237,1736841600"; 
   d="scan'208";a="46443330"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 15:16:52 -0700
X-CSE-ConnectionGUID: IFiZBJ1MRY69tA7JEHGrhQ==
X-CSE-MsgGUID: 298+Y2kOS9eoNIBjE0E6Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,237,1736841600"; 
   d="scan'208";a="143315050"
Received: from jekeller-desk.jf.intel.com ([10.166.241.15])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 15:16:51 -0700
From: Jacob Keller <jacob.e.keller@intel.com>
Date: Mon, 10 Mar 2025 15:16:39 -0700
Subject: [PATCH net 4/5] broadcom: fix supported flag check in periodic
 output function
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250310-jk-net-fixes-supported-extts-flags-v1-4-854ffb5f3a96@intel.com>
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

In bcm_ptp_perout_locked, the driver rejects requests which have
PTP_PEROUT_PHASE set. This appears to be an attempt to reject any
unsupported flags. Unfortunately, this only checks one flag, but does not
protect against PTP_PEROUT_ONE_SHOT, or any future flags which may be
added.

Fix the check to ensure that no flag other than the supported
PTP_PEROUT_DUTY_CYCLE is set.

Fixes: 7bfe91efd525 ("net: phy: Add support for 1PPS out and external timestamps")
Signed-off-by: Jacob Keller <jacob.e.keller@intel.com>
---
 drivers/net/phy/bcm-phy-ptp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/bcm-phy-ptp.c b/drivers/net/phy/bcm-phy-ptp.c
index 208e8f561e0696e64bd5e842b66d88c65d70bfc0..eba8b5fb1365f4e43331e479e8e2f3c4b590ab96 100644
--- a/drivers/net/phy/bcm-phy-ptp.c
+++ b/drivers/net/phy/bcm-phy-ptp.c
@@ -597,7 +597,8 @@ static int bcm_ptp_perout_locked(struct bcm_ptp_private *priv,
 
 	period = BCM_MAX_PERIOD_8NS;	/* write nonzero value */
 
-	if (req->flags & PTP_PEROUT_PHASE)
+	/* Reject unsupported flags */
+	if (req->flags & ~PTP_PEROUT_DUTY_CYCLE)
 		return -EOPNOTSUPP;
 
 	if (req->flags & PTP_PEROUT_DUTY_CYCLE)

-- 
2.48.1.397.gec9d649cc640


