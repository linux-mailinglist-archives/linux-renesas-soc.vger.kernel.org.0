Return-Path: <linux-renesas-soc+bounces-23707-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B789C117EB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Oct 2025 22:14:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 67B8F4E467D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Oct 2025 21:13:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12AB132B9B1;
	Mon, 27 Oct 2025 21:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="CxqkSFXE";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="YfjuCeC4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C0C32AAB9;
	Mon, 27 Oct 2025 21:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761599594; cv=none; b=azCAeRR++6z6M/k/BrWtu305Skyz1XOmh1H1ES2/zW8DrPs8EX00Co+u10cPGC6CB6ZmdTybaZ+na3kuKM8JlRHZQM/zJBPnnI+eh0UcTPMYw9gQMqtuDs2K0ZsQ2Yi+EB1nh+C+sLFiwzuaAXhTnAM1Gej1TyuW292TM8haOT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761599594; c=relaxed/simple;
	bh=VFdcwUOlLKT81CjoQTss9FuaOfWwooOmwTWGLcbY72o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AAb0/8tTul/GgoOSoF3VUnb3ba0ZsjghlrF9WRIJa4E5p6z/wVGWY1oX4mCYosfxwY7Z5ujRMYpQJ0u8Y2es2Mb7qOkmnOI5e1cgwTYbKHrQUavXXutNnywU7tnvzaLUFnp12ZlJSnLsBAYZBOeYLBn80FuBS3fmTMhexESUH+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=CxqkSFXE; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=YfjuCeC4; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cwR773y3Kz9sml;
	Mon, 27 Oct 2025 22:13:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761599587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6PRunP/YNOJ9z+4AGyl00EpVVMnl0vwiLtCGJcY4k2M=;
	b=CxqkSFXE4PZWN2rCFFK0R1KmtmJ1IGFwxGBTRq0B7Kydpnx/U0dgkmYA7E5ZlWATZlB23k
	cdqPrMWc+peWFPZJR2vkN6EyRtlgxHNkBRIWwdOjM/MPkxUDLXHFlZeFDp2uKyODYVBN3T
	HuKEU109dsEiHM5+RsJg1KlMiyevMeQmik3XhVzMWrxGjTslD7R3ZIoAvXo1Jh9eoVU9qk
	oXC9cxXRUWAYz8OLKPpocwWltkGF/ODXxAOxgG22sPM6y8T/WufOyk7dqHjWvz5o5191dZ
	zZTVJJbLAH/tqEC+hsuCp8lk/LOhAQAr2b1QgMnuCmoaozW3cgpHbZTS6tdseQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=YfjuCeC4;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761599585;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6PRunP/YNOJ9z+4AGyl00EpVVMnl0vwiLtCGJcY4k2M=;
	b=YfjuCeC452ScEuIBSG0jAYca2OUyt4jH98dVJ7jAVVNbwBlffaMisYh4WuzhnZAgoFUuTI
	yPV94DaLiDtie21rEWF1aHH5xoxIcR8+//P15YI4baEACYWN3FF3h1r4k3bWv68aeBBIrP
	/Nec17a7x2LSlAJbpepW/Z7fQuH/XrQ5AXP5dMw7wo7uRXlPnix83eipRdLLE81+imIi2h
	NYePCUdgFwVj7T4snB24qELrh9uPZuloQWyciQlQPv7WF9lYEY+xcImg8m55YS4Q6oezoz
	GvkGizJw4vlz5m2srdlP2z/mOTY9iylBzlylNmq00L4nOE+eFyYjIxRMDOWB8Q==
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
Subject: [PATCH 4/5] arm64: dts: renesas: r8a77961-ulcb: Enable GPU support
Date: Mon, 27 Oct 2025 22:12:20 +0100
Message-ID: <20251027211249.95826-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251027211249.95826-1-marek.vasut+renesas@mailbox.org>
References: <20251027211249.95826-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: xgoodommmsga7y3kbtdydw16tf14i7hh
X-MBO-RS-ID: 2b57621e4bf0f37ccf8
X-Rspamd-Queue-Id: 4cwR773y3Kz9sml

Enable GPU on M3ULCB with R-Car M3-W+.

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
 arch/arm64/boot/dts/renesas/r8a77961-ulcb.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77961-ulcb.dts b/arch/arm64/boot/dts/renesas/r8a77961-ulcb.dts
index 70cf926667a6e..0c0806cec6989 100644
--- a/arch/arm64/boot/dts/renesas/r8a77961-ulcb.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77961-ulcb.dts
@@ -40,3 +40,7 @@ &du {
 	clock-names = "du.0", "du.1", "du.2",
 		      "dclkin.0", "dclkin.1", "dclkin.2";
 };
+
+&gpu {
+	status = "okay";
+};
-- 
2.51.0


