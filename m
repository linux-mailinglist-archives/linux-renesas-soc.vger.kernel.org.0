Return-Path: <linux-renesas-soc+bounces-12499-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A814A1C38D
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Jan 2025 14:03:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C5631165F93
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Jan 2025 13:03:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA0831CAA63;
	Sat, 25 Jan 2025 13:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="KIdxAVP9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D366E1E87B
	for <linux-renesas-soc@vger.kernel.org>; Sat, 25 Jan 2025 13:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737810208; cv=none; b=lGciSrblK44IafzTdkunJtOrCZWg3i2PHeH51AlfoTNnc852DUYcpcPSOL3qDcEt7jN1GXvYyZghxOLCrPKavq/FAeUJEn3Oi5DoP4vk9iFrAftAULZ3R2pwr8j6eatZhgd4W5gggP6j9b6G+4R7fpbOU5ZXhWHOGNEyA8JnTnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737810208; c=relaxed/simple;
	bh=ftR5XJYsXKHWa5cc9ROSUSHZfVpV9/hc+UzZyIL+uec=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZSLd7xvXryP7+9J4OoFmH1sO26JzaGLlJ3QBxI4EzrdPJhiY7tbGNqIscuUKGwDP1GniflKeNoJtY7OwHIsPkpz1Oyj4GW5Tt/X5BiSxmBhwv8vyMJ4poUbUihZqC9Z9Qc4j41yu62RNKiss0kuGK/k7cJw+bPorlm34/ShdwCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=KIdxAVP9; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=TratUz/3MHTxNF
	1MpSrxA2LIt3xvpiwcBbevQNMEFK8=; b=KIdxAVP9uXM1IaqhI7TGf6CEEgQtBA
	xCxPRtoMqX5pPsQTP12hbBcF4MtJHJKsCwILe2BN2hevK345wBYltrje1WeMY6sF
	NgzrCzo8MDUeb5tL0SjrAze9pFKMHloQNV1e/G5bsJhuNUFpVX99ratj0oVQ62c1
	u/+ko7OQhJmgpnTttnrtuAJAtExSLswmweWlR7p4P1+nkZey8fKVRI1CNd9Pikew
	UYvLX221F18kN44p7CnXdT+f0b2JDDzrkfZkAE6NR4Lop4miIgjUVODDidhwBw1E
	NEV9FydoAtHHl6Uwdu8ueqyGWePK9D5cH4fdaeHJ7jUMUxX4i0cYL2UA==
Received: (qmail 3876038 invoked from network); 25 Jan 2025 14:03:24 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Jan 2025 14:03:24 +0100
X-UD-Smtp-Session: l3s3148p1@chbrd4csppkujnvm
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH] bitops: use safer link explaining the algorithm
Date: Sat, 25 Jan 2025 14:01:55 +0100
Message-ID: <20250125130320.38232-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During review, a concern was raised that the link explaining the
algorithm might get stale. Meanwhile, the site has been archived in the
WayBack machine. So, use their link which is hopefully more stable.

Fixes: c320592f3f2a ("bitops: add generic parity calculation for u8")
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

The original patch went upstream via I3C. Yury, do you want to take this
fixup or shall it also go via I3C?

 include/linux/bitops.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/bitops.h b/include/linux/bitops.h
index c1cb53cf2f0f..dde4ad0034ae 100644
--- a/include/linux/bitops.h
+++ b/include/linux/bitops.h
@@ -254,7 +254,7 @@ static inline int parity8(u8 val)
 {
 	/*
 	 * One explanation of this algorithm:
-	 * https://funloop.org/codex/problem/parity/README.html
+	 * http://web.archive.org/web/20250105093316/https://funloop.org/codex/problem/parity/README.html
 	 */
 	val ^= val >> 4;
 	return (0x6996 >> (val & 0xf)) & 1;
-- 
2.45.2


