Return-Path: <linux-renesas-soc+bounces-11641-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 091F59F916D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 12:33:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C5C927A10B6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 11:33:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A396C18A6D3;
	Fri, 20 Dec 2024 11:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Mk5lMcbB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8EC1A8405
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Dec 2024 11:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734694420; cv=none; b=Mm4rKiX33m/XAaTFVqUz84XBWoNxOephOjwbCmwXxiegOLG2GTjHr4PevbrSw7wFwXdxk4ZuiQU2cBhNUohjlUfvbyEhfiTzHbGLwjLxTaSH8+Ogl/YWrW1f6LXi6cZIxmpJk8SUmNPjjZ60OEGAiQ4JDqEm6YHIYzxI7CNaDCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734694420; c=relaxed/simple;
	bh=eqGHK14hiiHm06pTZF2RCIe0dz2FSZkRJZ81635i/Kg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lan14Pn5gsVz0yKBpgGQPhSiwNLkaGZTLoPJPJsOVb/2QeKSu26ERBntCy1+VfFX9NRfgnDK82gq9/OiF8+9A3hjUrGBY5KmsYhflX9siEohycKrqCmHkTOTVQxZycov12e17bsBoJ2+6JguasSoNufvBW7Il/JPt4FPbx8ksdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Mk5lMcbB; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=uWx7Khj94+L0maCjBS9mNDc9rvpKoRkC0PwJFVrpB/4=; b=Mk5lMc
	bBigG6RSFglZ1BJGbzzc1v4XUGxS3lCHnMfYERPbnXJ6Qoq2xaZmAXjDo/m/Ph4r
	EEi3DUP5uBH6cF1FjK9cslyAx6V4Uu3b9BvDjEHMTakEMF72MmkAjSnJ9QFUTvQO
	T7UJ+zlyRZZ8E+kLdLQwj2jxEL8TZNM6EEd0AdRYQ6t3xYpa+u+a50zwHmtrNyXA
	V2lPtbcc9w9k/9nx6tJqcKBlB/63FtLVPkfdMLl3UHqclIZDgvpfeJccCelkuL1/
	gJiuZ3cU9lv8rZZVJY86eHLXXD8UdchTRVT6xK6Qa6QXxCdPazGKOEUk1DhWoDui
	o/o2UkWLM9hu2K8w==
Received: (qmail 990887 invoked from network); 20 Dec 2024 12:33:36 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Dec 2024 12:33:36 +0100
X-UD-Smtp-Session: l3s3148p1@q194BLIptOIujnsY
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Yury Norov <yury.norov@gmail.com>,
	linux-i3c@lists.infradead.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [PATCH RFT RESEND 1/5] bitops: add generic parity calculation for u8
Date: Fri, 20 Dec 2024 12:33:29 +0100
Message-Id: <20241220113335.17937-2-wsa+renesas@sang-engineering.com>
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
index ba35bbf07798..4ed430934ffc 100644
--- a/include/linux/bitops.h
+++ b/include/linux/bitops.h
@@ -229,6 +229,37 @@ static inline int get_count_order_long(unsigned long l)
 	return (int)fls_long(--l);
 }
 
+/**
+ * get_parity8 - get the parity of an u8 value
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
+ *	if (get_parity8(val) == 1)
+ *		return -EBADMSG;
+ *
+ * If you need to calculate a parity bit, you need to draw the conclusion from
+ * this result yourself. Example to enforce odd parity, parity bit is bit 7:
+ *
+ *	if (get_parity8(val) == 0)
+ *		val |= BIT(7);
+ */
+static inline int get_parity8(u8 val)
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


