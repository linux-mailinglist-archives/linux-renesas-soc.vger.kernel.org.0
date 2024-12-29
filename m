Return-Path: <linux-renesas-soc+bounces-11740-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 881339FDE7F
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 29 Dec 2024 11:13:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3CB61161670
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 29 Dec 2024 10:12:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF8121442F3;
	Sun, 29 Dec 2024 10:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="dijRjoAD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692F986346
	for <linux-renesas-soc@vger.kernel.org>; Sun, 29 Dec 2024 10:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735467169; cv=none; b=bFqhzWo2C4CjM9VbuNhsE1cuwxzzrL9kdJYsJ6AiPb7bO345kjkyXKhgL1eZQ+YI9GDHDgLEcGOOdQgrr1Uk1F66vE1vlGMJZ9/+PGk+u/6r1FLNK3cw3T2RpukLA4LuY55VLqaKCaBodGArfWkiGX2zM2BB9bJmnmn/e3yK50k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735467169; c=relaxed/simple;
	bh=O9CYMB0lO17RuiwpnK2GfLz07nkd/+OcaZhmBRSW0S0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZUMKpdOwe4ql2trU3B5L9Ge55sGiZ3Ntw+vthungk998PZZonjVyeP4yEgsUqH5m1GO8r/c/cMdu+MmqWEOkzVgLg21j18r9PBHlgQuE3V2d6afqeSjiBQEQ4ZDfK3FsBcId117KZYE5h3AEjMwYGns/GbUawPg63Riyir4UFeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=dijRjoAD; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=plWvPVApWRSIQ2OhiRlGaz0MEdpViJLDsoLZ/6lDlDA=; b=dijRjo
	ADdThNVTeq3XMcZlByKGXwrUpaKcK4vencvoye8hwie4arvk6Yi5b2AtUjpo9Q+T
	0070rb8XEYsy1mx+5EMMtMzhHFKVF8dfJQlTqh4p8S1w+IDDKyz3J6a0g8Uk7WEf
	qmkVK5ebgrZhBhalI68fBxs1hw4/fJp9H+o27AUiF1aCA2rOrQxhZEJ31WZGZRG9
	P3uoBNZcaYAzrp1bMRzrcMAfSGl4MPcK1qoHEuKUiXFSllf+CKJB7J5BesJ6lsIE
	Me9IV4OWNsVjDoLex9+u+IKvaEBUIiuEyJJ7DRGxCYQ5WNSAa27/ovtC6m6Z+yYI
	1GYe0d/HUwLdy/Cg==
Received: (qmail 3656632 invoked from network); 29 Dec 2024 11:12:36 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Dec 2024 11:12:36 +0100
X-UD-Smtp-Session: l3s3148p1@T5td72UqgrEujnsY
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i3c@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Yury Norov <yury.norov@gmail.com>,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH RFT v2 1/5] bitops: add generic parity calculation for u8
Date: Sun, 29 Dec 2024 11:12:29 +0100
Message-Id: <20241229101234.2896-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241229101234.2896-1-wsa+renesas@sang-engineering.com>
References: <20241229101234.2896-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are multiple open coded implementations for getting the parity of
a byte in the kernel, even using different approaches. Take the pretty
efficient version from SPD5118 driver and make it generally available by
putting it into the bitops header. As long as there is just one parity
calculation helper, the creation of a distinct 'parity.h' header was
discarded. Also, the usage of hweight8() for architectures having a
popcnt instruction is postponed until a use case within hot paths is
desired. The motivation for this patch is the frequent use of odd parity
in the I3C specification and to simplify drivers there.

Changes compared to the original SPD5118 version are the addition of
kernel documentation, switching the return type from bool to int, and
renaming the argument of the function.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Yury Norov <yury.norov@gmail.com>
Reviewed-by: Kuan-Wei Chiu <visitorckw@gmail.com>
Tested-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
Changes since v1:

* renamed from 'get_parity8' to 'parity8'
* use XOR instead of OR in the kdoc example (Thanks, Rasmus, for both)
* rebased to 6.13-rc4

 include/linux/bitops.h | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/include/linux/bitops.h b/include/linux/bitops.h
index ba35bbf07798..c1cb53cf2f0f 100644
--- a/include/linux/bitops.h
+++ b/include/linux/bitops.h
@@ -229,6 +229,37 @@ static inline int get_count_order_long(unsigned long l)
 	return (int)fls_long(--l);
 }
 
+/**
+ * parity8 - get the parity of an u8 value
+ * @value: the value to be examined
+ *
+ * Determine the parity of the u8 argument.
+ *
+ * Returns:
+ * 0 for even parity, 1 for odd parity
+ *
+ * Note: This function informs you about the current parity. Example to bail
+ * out when parity is odd:
+ *
+ *	if (parity8(val) == 1)
+ *		return -EBADMSG;
+ *
+ * If you need to calculate a parity bit, you need to draw the conclusion from
+ * this result yourself. Example to enforce odd parity, parity bit is bit 7:
+ *
+ *	if (parity8(val) == 0)
+ *		val ^= BIT(7);
+ */
+static inline int parity8(u8 val)
+{
+	/*
+	 * One explanation of this algorithm:
+	 * https://funloop.org/codex/problem/parity/README.html
+	 */
+	val ^= val >> 4;
+	return (0x6996 >> (val & 0xf)) & 1;
+}
+
 /**
  * __ffs64 - find first set bit in a 64 bit word
  * @word: The 64 bit word
-- 
2.39.2


