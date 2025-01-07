Return-Path: <linux-renesas-soc+bounces-11896-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ED790A03A83
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jan 2025 10:03:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7923C3A5994
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jan 2025 09:02:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40E731E47AD;
	Tue,  7 Jan 2025 09:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="RbIUaH0X"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7487C1E284C
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Jan 2025 09:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736240538; cv=none; b=nO9BdHxQO7MfT3KUhaoOaL9WXLUhVWohEMDFqF2Yu11ka+gdoEm1aLDFI4Ib54OxXS1eq5WQij74NxthBuZoxzcf2E5IUI+QH6UYcShjh33HFHRqrEaWnRMvIxyM+QNdhPfhMKFEE8gRMd6sViwj6+ada/las7+/TQhEamF2GwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736240538; c=relaxed/simple;
	bh=QiBIdouyIx1qglm/e/K6lcFhd3LVDevU6HqldZDWIGo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kd2tAR5WcNPwYFm8U1kDq6Pvc0xpe+1Enxgl2yXIS9G/+ogNSqYvhXyzl+TQk1dXDmocKKG0ZpAsMVPhXYGk0Q/0ShRggpJzAVNRiF/rjn+1bCrgu/Oczg3k716XJD/FzgxckSazjFSgI7AgYUHit2xAV612rzljSFIvXyUkQcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=RbIUaH0X; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=VK7WWM9T+jjQMMEJxB7ZW7cFigQlqgODHUPmKzMbE/g=; b=RbIUaH
	0XwejCD8WqjEc6SDRvifpswXcjkZYtVds+fIXmMydw3hvyYgbeGNykY8yZbiogZd
	UQQs6CgUu6V979w5obR/HoZG4SoxUUMv5VvoWenv4pKj6Rdob/BLaIuO8gr3wvNI
	p8wS0aGQYm9m5cnXu+miiGtGCSR4KyciFx7dpyUhqKwcewneUdsEqhAz9Nmo3Msw
	QDCJ+319Ab3b+1O7PhvjE01N9LWLJyudwjdaMZItIhrGzca5H5BzwAl7p+Xc/Aj6
	B8xIRXhzmtS0DDGYbNH4gVJGME9lZIucOYkNbjRob1HTTziYTZDB/dGOVHwOpK3x
	XB7YiretpcoD2m+Q==
Received: (qmail 2125365 invoked from network); 7 Jan 2025 10:02:10 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Jan 2025 10:02:10 +0100
X-UD-Smtp-Session: l3s3148p1@z1AGABorapMgAwDPXw20AOMQ2KO98fSH
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i3c@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v4 4/5] i3c: mipi-i3c-hci: use parity8 helper instead of open coding it
Date: Tue,  7 Jan 2025 10:02:02 +0100
Message-ID: <20250107090204.6593-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250107090204.6593-1-wsa+renesas@sang-engineering.com>
References: <20250107090204.6593-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel has now a generic helper for getting parity with easier to
understand semantics. Make use of it. Here, it also fixes a bug because
the correct algorithm is using XOR ('^=') instead of ADD ('+=').

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---

Change since v3:

* updated commit message to mention the bugfix

I intentionally did not add a Fixes tag because this fix depends on
patch 1. The proper fix for backporting would change this to XOR, I'd
think.

 drivers/i3c/master/mipi-i3c-hci/dat_v1.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dat_v1.c b/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
index 47b9b4d4ed3f..85c4916972e4 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
@@ -40,15 +40,6 @@
 #define dat_w0_write(i, v)	writel(v, hci->DAT_regs + (i) * 8)
 #define dat_w1_write(i, v)	writel(v, hci->DAT_regs + (i) * 8 + 4)
 
-static inline bool dynaddr_parity(unsigned int addr)
-{
-	addr |= 1 << 7;
-	addr += addr >> 4;
-	addr += addr >> 2;
-	addr += addr >> 1;
-	return (addr & 1);
-}
-
 static int hci_dat_v1_init(struct i3c_hci *hci)
 {
 	unsigned int dat_idx;
@@ -123,7 +114,7 @@ static void hci_dat_v1_set_dynamic_addr(struct i3c_hci *hci,
 	dat_w0 = dat_w0_read(dat_idx);
 	dat_w0 &= ~(DAT_0_DYNAMIC_ADDRESS | DAT_0_DYNADDR_PARITY);
 	dat_w0 |= FIELD_PREP(DAT_0_DYNAMIC_ADDRESS, address) |
-		  (dynaddr_parity(address) ? DAT_0_DYNADDR_PARITY : 0);
+		  (parity8(address) ? 0 : DAT_0_DYNADDR_PARITY);
 	dat_w0_write(dat_idx, dat_w0);
 }
 
-- 
2.45.2


