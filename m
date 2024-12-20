Return-Path: <linux-renesas-soc+bounces-11634-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1659F9160
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 12:32:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD14616852E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 11:32:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B77C1C1741;
	Fri, 20 Dec 2024 11:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="JOr2yzBe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818411C5F04
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Dec 2024 11:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734694231; cv=none; b=B2KWZvkrCuWJz3ByK33zsD0ckgJG0/UIj5vzzAz1TKg8JitNIw1e/WO1iR6VdFS7gP5+T1En62RV0i1tgq1PeIkIxFr0a/jKU9a61cAWZCzxRidFfnqqFB8pzMsT93+5dMZOTDHmdT9qzQ31s7KTXmMammBNde+aQ0hV9o01m5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734694231; c=relaxed/simple;
	bh=gpNBkc6doeMy4/aCPzNDJIb9seFsCsIEDoGkRZbmb8I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=M/L82hSOdFam6H6lPWykdoeBh6V8Oc17RuKQPJ1O0pRLMANIPhZxsJKNanGQJdwspfQCyX+K99UWlzCC05i8XOoZwlz20O/W47qJEgWGNrI+9xncA+PzrAc/Ephdb6+hnSz6aNWnbIxExLdB2HxhsoxWe8s9OA+HxRllywtMDkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=JOr2yzBe; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=Xle8vB4tioG0noyMlph488LEaOgkNcMUcx711tLKtDQ=; b=JOr2yz
	Bexm47v5wzeQCPJkhwFqqlSDLpwbGjsiluD1HliWQfq2s3ASnD3OrtYNFs9TYOfK
	1AbIdgV7i7LYE1beaRVYp01FMENsAoub5s3Ra5NY5uvqSt1cGKxAougsbP3imU4W
	7SIvCceCuOixvH/Iq8i3rnzoe3gMdHdQI6ScogMnh29/7pQ4aPvtOab/LtnrT7eN
	6i1p5ZoZGgbNoGNSg3xEOy2OXsfr1V+/jHjgcc7QVXOvDO6RREIphnOaljWOA+SI
	eheErQwvQ2M853ESFoJcU72+OuJnMsTJw0tz1IIpS4RXoPiAt2nkIyfxUl9SXeC+
	FxtEtIqFhfIwUNLA==
Received: (qmail 989787 invoked from network); 20 Dec 2024 12:30:21 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Dec 2024 12:30:21 +0100
X-UD-Smtp-Session: l3s3148p1@cA/Z+LEpEJ8ujnsY
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Yury Norov <yury.norov@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH RFT 4/5] i3c: mipi-i3c-hci: use get_parity8 helper instead of open coding it
Date: Fri, 20 Dec 2024 12:29:58 +0100
Message-Id: <20241220113000.17537-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241220113000.17537-1-wsa+renesas@sang-engineering.com>
References: <20241220113000.17537-1-wsa+renesas@sang-engineering.com>
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


