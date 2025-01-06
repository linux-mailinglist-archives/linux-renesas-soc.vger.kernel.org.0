Return-Path: <linux-renesas-soc+bounces-11867-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DE3A021C6
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jan 2025 10:27:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92163188530D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jan 2025 09:27:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E3FA1D934B;
	Mon,  6 Jan 2025 09:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="aPPfy35s"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C348B1D8E06
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Jan 2025 09:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736155659; cv=none; b=nng2zM3/srUyMfGwWYZFw2uw1zw8dmyznu5HPPILLCRrs7DA3pm9yYS9KqEP3eO9PiaY6GHcmYjeq7r2+isASmSn/ep+BHT7Fn8KNYNLO5l+MmznzqsuJj4VxANCnCpaKPDhqvo1ttvzHxkK4YjhEsHe9O+PfNlWzEtCkvrKazk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736155659; c=relaxed/simple;
	bh=iE2RZGbU/m3GTH5mM4eQ3IKKskw9bZO8Ye67V3av1/s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EcKe6hXQQ8Sjrh7VEZn1gWN17J6LCMmow+8hMse4ekngzpd1yxLg6MyMXh8w4J73Dv9Um0CiyrvzDbRJJ3WbFIC9Xq/Q48Q0HyDCVtojFRwtoyHXnzQ3Nljjx3cTtF7/wT0Tbu0QXzF05MzDHEdy5pH/f9PtVc8RBdpS1ERSqow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=aPPfy35s; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=/HzJlxcDzDQ4BvZyB5ZfxXV6i05giy4HK5Wtt3ukFzE=; b=aPPfy3
	5s/163j8j2uLyoDeGPLC6/Qykt2evG8W7DWBim4j7PNHuTry+M1/V7MtK92YE8vZ
	IBFDBjkvfrDIRCMfK5BdsdrxAUikwOPTGe216Fd7NEn7SA+eWBIthxc/k7tXdi6y
	gLDkOpXh+3OTqlCGPqpc85wqIoP2t4mssLk1v4ADAEMihgg6IQcm6d7cAcSs+hli
	5RLnOcLisX4q/h3BrDcbX9/E+C8LpAvYBgq3ptffVnJLv9gN5wSZFnLTX8RNySYY
	IhUk3CRQPXSbdInv7GrreMONlnIWBlfLDUlDPQM1BATTV2mzSalkGdSZbuOb5hX9
	2hxcFp6C/PtNxf+w==
Received: (qmail 1727803 invoked from network); 6 Jan 2025 10:27:26 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Jan 2025 10:27:26 +0100
X-UD-Smtp-Session: l3s3148p1@HqGXPAYr2psgAwDPXw20AOMQ2KO98fSH
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i3c@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Yury Norov <yury.norov@gmail.com>,
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [PATCH v3 1/5] bitops: add generic parity calculation for u8
Date: Mon,  6 Jan 2025 10:27:19 +0100
Message-ID: <20250106092725.22869-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250106092725.22869-1-wsa+renesas@sang-engineering.com>
References: <20250106092725.22869-1-wsa+renesas@sang-engineering.com>
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
2.45.2


