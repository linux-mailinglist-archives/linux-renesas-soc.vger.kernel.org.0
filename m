Return-Path: <linux-renesas-soc+bounces-14239-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC72A5A6E0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Mar 2025 23:17:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 35C2A189399A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Mar 2025 22:17:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8CEF1E3DF2;
	Mon, 10 Mar 2025 22:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TlV7ZyJK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491561E8348;
	Mon, 10 Mar 2025 22:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741645019; cv=none; b=gJqzT8+Im81+mWoDx4gzU0k4jCxkL7NYRLdJqtA15DBkDDZKGoiTVOiNI+wEW6pUC92voIwlVelLXipP7WDLNwiRvSlUvSX0CU5WbX5p+1pE+b7MZ9aP6zQ0Ijnrw2ZwjhfNgNjSzAqMPc50sA2MkgyCSi2apgUuqRBECh9fKHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741645019; c=relaxed/simple;
	bh=Z8+q2GV/aH550yKDFdVnUikndMt1LzCKO/Ii8P5vA5A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=emQ4W8s1nnBU52eGAwhG6KUMqUnRXMxqv42F/KOL92xAeFzYB9am0RKWeZblxYR1ci/5JeiMVBljzJUGpb3TfV+MZmLIUkjdHLQfLkyrncd8IkIO/PpGE32+ux79sOSlqJATljbXTgeRd3tk3kNPH1v5xSAF0z8eUFzCPUFK4ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TlV7ZyJK; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741645015; x=1773181015;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=Z8+q2GV/aH550yKDFdVnUikndMt1LzCKO/Ii8P5vA5A=;
  b=TlV7ZyJKlD0YQMWxoMbteLxytxPVnr3eg/P7V9KHGPzlpNMNEs4J1TO6
   FxRtqSAu4tsTbiVYbpzi5oXYmbPApVH7xEIBY9WYaWkSTqYrLEc3b1mwh
   H66UQDooAbO3jndB50Pqe3aRfSXUjtFwATpKTM9XZTo9vzF8lQtZ8ym+M
   Nzr31Wn3B1g/HmehiwPwp0idHzOPCDxUCyiOLIL37ikjEea8Wm8ol6NyS
   QTyhOiu6d+yTvI73q2Lmdqzy4rMEuXWrn6pfuvtOd5kz1ugeWqnmHY0E/
   CUBEOyfHHsrmGj3Y9WJxXpZpFuSZInShXW6Gohlzc7/rK9lp+swTWLp5o
   g==;
X-CSE-ConnectionGUID: 0Iy3PrYDTru4U58ZBOrHvQ==
X-CSE-MsgGUID: fn4yyUboQe6W9fQIfylNfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="46443345"
X-IronPort-AV: E=Sophos;i="6.14,237,1736841600"; 
   d="scan'208";a="46443345"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 15:16:52 -0700
X-CSE-ConnectionGUID: kY5vil/mQL6S7hDXNmQUtg==
X-CSE-MsgGUID: NB6gvf4ST3aeLEoatqrb3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,237,1736841600"; 
   d="scan'208";a="143315055"
Received: from jekeller-desk.jf.intel.com ([10.166.241.15])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 15:16:52 -0700
From: Jacob Keller <jacob.e.keller@intel.com>
Date: Mon, 10 Mar 2025 15:16:40 -0700
Subject: [PATCH net 5/5] ptp: ocp: reject unsupported periodic output flags
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250310-jk-net-fixes-supported-extts-flags-v1-5-854ffb5f3a96@intel.com>
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

The ptp_ocp_signal_from_perout() function supports PTP_PEROUT_DUTY_CYCLE
and PTP_PEROUT_PHASE. It does not support PTP_PEROUT_ONE_SHOT, but does not
reject a request with such an unsupported flag.

Add the appropriate check to ensure that unsupported requests are rejected
both for PTP_PEROUT_ONE_SHOT as well as any future flags.

Fixes: 1aa66a3a135a ("ptp: ocp: Program the signal generators via PTP_CLK_REQ_PEROUT")
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


