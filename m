Return-Path: <linux-renesas-soc+bounces-23703-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 81527C117D0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Oct 2025 22:13:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2ACBA350A0F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Oct 2025 21:13:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4623C321F54;
	Mon, 27 Oct 2025 21:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ECos1Apu";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="CTJmc6Yh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FB42F1FE7;
	Mon, 27 Oct 2025 21:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761599587; cv=none; b=VzckmuqCZan1W4HI3gpB4bcA46cJgiWzg5TOr+VdueYb2f8f2+Cx+RPr9gLs/pQeXvjatNbN2b6Gcji1E+7DVbom0/gXhGVST/cxy9/79YkTlUXxG32+iU/iUqE4wTKdpsbixg78D+QpKASakDSLjdiYg/vY9C9kDe5LfKAw72g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761599587; c=relaxed/simple;
	bh=jTdE400yq/ajNb8WdhfrvI4VJVwqniWouH/qHirbl4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DbhbSl54GjEWuGFpTH9ZRL/atQDphFOf3+5laDfw7VoaoYf3fg+mnwVcrjY7QR6D8mOhashghNg/AdHnvr/MMO+J9fPooQJIng4pQxJPgqLvYVQy0ddaYhvfN+pUBAgIbN5c52oA1/JXomkg7VQlc2aVmXxW96HZunN9fWOzqVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=ECos1Apu; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=CTJmc6Yh; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cwR721FWcz9t39;
	Mon, 27 Oct 2025 22:13:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761599582;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=P9OYt/TVtRqFlVbtQUwUoKw4zIYro3RdYxyw20BMr/A=;
	b=ECos1Apu5Egkw9B6hybGFMS2K73AwLbCk1La+iEOSBIr30wb954icsuHAVwNIQnUG/QWZG
	+hUr7zGF5mXJkSuuE+pDAz+ADSxSYMLjOdc4jU/a3jKexShIOUX/PHZYFJxONokwClkka7
	r1JT/XwjrAgZlR7N0XWIAkg9Y6sK31rSCqgs44NNm9zbNZ45PaD1fs9D8P9PaeOFDGkY4l
	ZGMWO/W/6y3+/zzuzzJBdscFyCGn4xLn2OE1t/hmoC7htYZ7wRPe87R1PKDPwFqGm61BN+
	+3w8ed8AVqZWG9Kf3/3gEBredClj5nRwvxG3jdUjVdtkoAXSROkIiX4SKcDO8g==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=CTJmc6Yh;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761599580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=P9OYt/TVtRqFlVbtQUwUoKw4zIYro3RdYxyw20BMr/A=;
	b=CTJmc6Yh+S0Gg5bcv/Nn0L3KzDM6vko5mIe+/OwS7prAQCpm30rodgFSb221KgJNdjXx+Y
	XyqNp6AGq3p+Wg3xLO3idZJtZJ70KLZLyCX1poY1f+gdkydUPzDlNeqnXVQpWS0+e34Kwj
	XJRAydl/2HiQyYZsoK3UOX3nzZtdXDIXVRQ+aRuK3Q3wrHLP8LZKzGZtNHbExJProIxgfm
	vPEm8tYHJagCw4Bf3xcNeTAZi69sWxYgqvV7W+SQPC71LjwJw7H59U5yRDYL/ZYH/mY2Qo
	kDBYHizj6iE7gAJYhfvL0+K9MpcOlhcwoFyeXcy+Qi7eg9s4+pkigmDbOo3qeg==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/5] arm64: dts: renesas: r8a77960-ulcb: Enable GPU support
Date: Mon, 27 Oct 2025 22:12:17 +0100
Message-ID: <20251027211249.95826-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: aqa83zx3pbeywqrbia83sjswxm745px3
X-MBO-RS-ID: 92c7b2c63661db9e584
X-Rspamd-Queue-Id: 4cwR721FWcz9t39

Enable GPU on M3ULCB with R-Car M3-W.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts b/arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts
index 4bfeb1df0488d..c3282593346bc 100644
--- a/arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts
@@ -36,3 +36,7 @@ &du {
 	clock-names = "du.0", "du.1", "du.2",
 		      "dclkin.0", "dclkin.1", "dclkin.2";
 };
+
+&gpu {
+	status = "okay";
+};
-- 
2.51.0


