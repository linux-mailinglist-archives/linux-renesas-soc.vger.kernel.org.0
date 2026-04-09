Return-Path: <linux-renesas-soc+bounces-31088-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +C/vGs6i12kUQQgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31088-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Apr 2026 14:59:58 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E07D13CAB16
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Apr 2026 14:59:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2F20B300C82F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Apr 2026 12:59:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD4B83C063B;
	Thu,  9 Apr 2026 12:59:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 314322749EA;
	Thu,  9 Apr 2026 12:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775739573; cv=none; b=bqHtTtggjieblpC/Qx4KKWFaq5dYaCSWc9u3ZFCdhq1fBuMLVezhlK143+4AUNDC7pCT27PxkjJ/AF6xYU3MPKiNABFDYzMZq5zzK0JigtMjY3pLZHTqpRCQC6yoWnQPhvHriWbL9N+AFCnBfyyEuZxH3NVbV3V53DNTwOEgsCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775739573; c=relaxed/simple;
	bh=/CD3r/8ZrV6NizCvbITZXKeqNMuD1dL7A65opHTPK2o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DLlrDTpdhim7h3cGZ3IOop1zHVbkG2LiASp1+juXx54UgutX8FxiaEkXp/Tbd1fGJlibcR8UU1HRj+5m0ePWP7eSMpqABY0YzJzZODwC/zpasIztZC+mNp14UX8dfvRRkWobzyo9AIrXvd97mV+iNap2dFlIvzEGHPa+YXDSdCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: 1rP/+D1DRJir+2j/hHMjKg==
X-CSE-MsgGUID: eAPoP2GDRgOt6f1AQ9enYg==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 09 Apr 2026 21:59:31 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.172])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 62E6441B5544;
	Thu,  9 Apr 2026 21:59:27 +0900 (JST)
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: rafael@kernel.org,
	daniel.lezcano@kernel.org
Cc: rui.zhang@intel.com,
	lukasz.luba@arm.com,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH] thermal: renesas: rzg3e: Remove stale @trim_offset kernel-doc entry
Date: Thu,  9 Apr 2026 14:59:16 +0200
Message-ID: <20260409125916.2244241-1-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-31088-lists,linux-renesas-soc=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E07D13CAB16
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The trim_offset field was removed from struct rzg3e_thermal_priv but
its kernel-doc entry was left behind. Remove it to fix the mismatch.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---
 drivers/thermal/renesas/rzg3e_thermal.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/thermal/renesas/rzg3e_thermal.c b/drivers/thermal/renesas/rzg3e_thermal.c
index dde021e283b7..f0e29fe633db 100644
--- a/drivers/thermal/renesas/rzg3e_thermal.c
+++ b/drivers/thermal/renesas/rzg3e_thermal.c
@@ -93,7 +93,6 @@ struct rzg3e_thermal_info {
  * @info: chip type specific information
  * @trmval0: calibration value 0 (b)
  * @trmval1: calibration value 1 (c)
- * @trim_offset: offset for trim registers in syscon
  * @lock: protects hardware access during conversions
  */
 struct rzg3e_thermal_priv {
-- 
2.25.1


