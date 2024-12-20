Return-Path: <linux-renesas-soc+bounces-11644-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D65869F916E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 12:33:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6AB62188633E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 11:33:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 534DA1B6D16;
	Fri, 20 Dec 2024 11:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="DvKXHZE6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2AB1C07CD
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Dec 2024 11:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734694422; cv=none; b=U4UxQBVTEhsgmte+4z1QjHwAFY3zyFAj00LPZakgJDuYdaetDZA0MOFlWrB7BvJe0j09hVLEN4KcRFmHg15tZWnU2Cz0+uKBlPqfWEEQC9yhiqfRQDzfGVCOLkZWNVA6fAHJAzbEgHebzc+sab4EU2NPqCOC00TjQ3mBZ4i1yvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734694422; c=relaxed/simple;
	bh=gpNBkc6doeMy4/aCPzNDJIb9seFsCsIEDoGkRZbmb8I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=A1c48PuGNoErNjWYNVJFf8ccQq4WOUGUnnod7kDHDkJXhIWVkByzWr4ycZpPwa2/sjZRuVUnjC2PvjRH4balvmQAplilQfwypFHDa2D7cHmyGpYr7pUE64ANzHf7LciFoBzO4GgqYyAWvLN/hlD1zP9HUCAE7F/eoBN742/aiko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=DvKXHZE6; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=Xle8vB4tioG0noyMlph488LEaOgkNcMUcx711tLKtDQ=; b=DvKXHZ
	E6sa8osmBPAmLZAxnYmUvqb4aaU5Dd18iLQNg3ISos1/vhTWDlQAYh2ypr3SpVyO
	cHRS7jTgpQR0XiIhcHAN5ZpEnBry5XOoMw6+KF4Dv828B9U1OAsTGZxZMJwYa24+
	3sfBxRo5ysuRPBIvd8TvmXVG+3zlOjbdphpwq0b5uDA6incMolKXEccKFjsnS+ph
	HaDHkrOLVAAcyXPeoQXBehaPSsqdtqK8ooEexrVqYpoOxL/o+KMgSq7kBfLzsZZt
	Fcu1peqThM1T06cUyZJZJ5v/vZqe2IAd9xbojbCWZSe+GZ+kbiDRD29/gDEQrisy
	LOci0rnhp89kcnvA==
Received: (qmail 991002 invoked from network); 20 Dec 2024 12:33:38 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Dec 2024 12:33:38 +0100
X-UD-Smtp-Session: l3s3148p1@IZaTBLIp0uIujnsY
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Yury Norov <yury.norov@gmail.com>,
	linux-i3c@lists.infradead.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH RFT RESEND 4/5] i3c: mipi-i3c-hci: use get_parity8 helper instead of open coding it
Date: Fri, 20 Dec 2024 12:33:32 +0100
Message-Id: <20241220113335.17937-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241220113335.17937-1-wsa+renesas@sang-engineering.com>
References: <20241220113335.17937-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel has now a generic helper for getting parity with easier to
understand semantics. Make use of it.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i3c/master/mipi-i3c-hci/dat_v1.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dat_v1.c b/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
index 47b9b4d4ed3f..ac67016932b0 100644
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
+		  (get_parity8(address) ? 0 : DAT_0_DYNADDR_PARITY);
 	dat_w0_write(dat_idx, dat_w0);
 }
 
-- 
2.39.2


