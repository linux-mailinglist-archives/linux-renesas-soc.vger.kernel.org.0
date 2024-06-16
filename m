Return-Path: <linux-renesas-soc+bounces-6307-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BA2909E48
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 16 Jun 2024 18:01:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65F0C281273
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 16 Jun 2024 16:01:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A75FC15ACB;
	Sun, 16 Jun 2024 16:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="IrZDr+P9";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="T9UYY3Qr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B9911185;
	Sun, 16 Jun 2024 16:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718553678; cv=none; b=JNgr4xdzPVKB7uFaujTCu7ySk2WeYjKVYRZJAYMpKwU+HfdyAc1fVd8jrF0whJcu5FahW9XgLyUV3eh0XnfFKLFAGv/AdcewVB4QQ79Chmc0nIMGoo04ygGQxPL+RwUjLwhUDSVDISa/agaCtrEs2wK0Qx6febdEeh8DapAwzsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718553678; c=relaxed/simple;
	bh=ky76xrPx3KXd2PYAqt9g4d0sF6oxLndKUB08CCA+F0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j3hJbzGgj3B5rGNU6IBS6Izbrd4fxLhTUROCqWxm+EQP/ZGxT2Lo498oLZfHfI5dC+zok4h18ggHZJrfRhOMi4q2ZGXtgs6KZkhfqO6f3fpCgFl2BBfUiQpkMeU0p6cSeta9SneL5FkRc5TOPF8ug48RRVTLMJ6kpShLtWL1Jlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=IrZDr+P9; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=T9UYY3Qr; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4W2Hmz4svLz9sZ1;
	Sun, 16 Jun 2024 18:01:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1718553667;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=r3CnB77GSg22IGMkBWAHaCoVPnRGOj7kbhcXuyKInSE=;
	b=IrZDr+P99wuJwGqgEtwuHRuZKy5HwMDMIjW4wjgtPBLm5AsoFbU9jH6J0UyhLvCLWpog0S
	c3CR94fVR6CeJ98mBjLLULXcjMLSj5pkqQivB4qMch5ucmLmy6Atn237qspzDDPAT8mBwi
	CpgeDUI36e6WNhjoXz3fB51t7BNhEa8iWSeOQKOCVJbdeZoFPYKRSn1vHPzKsU9exwgChJ
	fxSHWHaBeeyrPlJTA1fZDyQjm0ymvgf/aSIRBDgSbBqqGxWxnTdWcVOUnnvWmD3jkF0sXn
	Qmneeerwqx36PFII/N499GgQBAuxr1tkASH/8SuACul0zfAuq2OnugGQkk/iCg==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1718553665;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=r3CnB77GSg22IGMkBWAHaCoVPnRGOj7kbhcXuyKInSE=;
	b=T9UYY3QrgSqjVPdaFKxneQ1KaMEv2yWISwv92e7cl1sjr6fzj3gp2zSmrmE4Duid5AXdpN
	3Ch3FY8Vl02WU1kh9YsfVequDNl/mzQsY7syViG0DOaSLIyj+UPyJjQDhlISG/U7nww93G
	bTkEQ0xpfISuhoFn6bLAyx0iIGeqLKYZLBjgmIkhw6ZyU2IkO4hht7kQJ6UjmoFWGC1q6/
	UWedibmBTiM+5ooNbvsdTDakNoUgNa1oIyL1tHekJus2dwnPVLeOeao4gO+X8Cs5zMQUQu
	zHrpp8m66AOeDd8OeiBPwUyV3WNAhXHbiMc8tSoxvQ5Np8VkkWkd3AVd0pVyeQ==
To: linux-clk@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] dt-bindings: clock: r8a7779: Remove duplicate newline
Date: Sun, 16 Jun 2024 18:00:20 +0200
Message-ID: <20240616160038.45937-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 8xqqk8hrsxghkbn9conx3m9oqteiz6ns
X-MBO-RS-ID: 0e427122175b53372da
X-Rspamd-Queue-Id: 4W2Hmz4svLz9sZ1

Drop duplicate newline. No functional change.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 include/dt-bindings/clock/r8a7779-clock.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/dt-bindings/clock/r8a7779-clock.h b/include/dt-bindings/clock/r8a7779-clock.h
index 342a60b11934b..e39acdc6499c0 100644
--- a/include/dt-bindings/clock/r8a7779-clock.h
+++ b/include/dt-bindings/clock/r8a7779-clock.h
@@ -57,5 +57,4 @@
 #define R8A7779_CLK_MMC1	30
 #define R8A7779_CLK_MMC0	31
 
-
 #endif /* __DT_BINDINGS_CLOCK_R8A7779_H__ */
-- 
2.43.0


