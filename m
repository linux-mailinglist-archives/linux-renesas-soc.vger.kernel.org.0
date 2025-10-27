Return-Path: <linux-renesas-soc+bounces-23705-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AA181C117DD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Oct 2025 22:13:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F2B1F4E82DE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Oct 2025 21:13:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B665329C7E;
	Mon, 27 Oct 2025 21:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="xfqSMXBd";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="iMo/4nEV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B307A328637;
	Mon, 27 Oct 2025 21:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761599590; cv=none; b=geni6omZAUCSi1v2mDi1fdPNxDZpDoNBoKrn4rcZaGKice28aWQS1b5gqh404i3JqQJRbllg4zgQboVSdynXLHpgCMunP9d4G2WESo7beprdeifLubh9YWYFzbmzysMg0R7Aho2JYpITq4PgqW6KxHdrPk+lvybkSljpnWilxgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761599590; c=relaxed/simple;
	bh=91arwbWkEfstO1zFGV/Ck+Hh8gg/ioNI/kfkcMyFFOY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lkdr9ozy6TZNSiwQJUUMEm5GypfzWvdHEXh8ZjQM1zhFWtykwQ+LO2hqWkictyhKzeZMNDC82OuAHwDbgl0mnhqJe4FiLKY84dVL06B+D7NUipnqBexVsqnEayOP5CIbIQVvxA2XK5N6IBG3k0Y1gY5FjhGoFXh2H24UvebtbAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=xfqSMXBd; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=iMo/4nEV; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4cwR754hfdz9tJr;
	Mon, 27 Oct 2025 22:13:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761599585;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=no/zMXF3o5yvFJwzzOab3IhyPOuWdzG/Yy0a8t6IGG8=;
	b=xfqSMXBdB0bmkcRQzaOhJR0holqP0YcGQgji+5UXFzOXYnHDY5OaToOZq+kNOKnvF4mShb
	h5Dv5KsPb6AdECFkpBhzBcb+a/IhnTEMWnTpx7r4PltbwrORnldAuGD6ipPYOq+8bdUTVY
	ZqKy0wB22nIhS1xnZ3f3EIewvASWZYeZlkduaGUnz/xwrEX5nvHQ0XZwwuwJ0wht4mvsuY
	uhZxzB0lQeB96/3k/uaUa9GZD9QXp8AUZTayHHew2M9dQIk6xgCMKPcfmshhOj6li6Nu8d
	EBOM2EE0juWOxwk8iiM8KYQerBGi1euC9HEj+AILrJkxshcCsFYNPJdsCbX8fg==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="iMo/4nEV";
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761599583;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=no/zMXF3o5yvFJwzzOab3IhyPOuWdzG/Yy0a8t6IGG8=;
	b=iMo/4nEVPnAHoFBvMZxLxriIocmKVIiWI+ZX6Vd+oPavtj9mgIqVH8Cs1rfKupZS3svJal
	Hfty44l68vMYM7ACYcnsKs4hlGuxLXC02c3SNGKaISbxbPzEgiCH/s8I6H4CktHJ7cgnCo
	GXiilmhmtFEWFHBH52P06B2kxREcHsOmjGQmILaYCIQG2pKe7OGN685ZCYl3flyArOJgmK
	dl2h1aK2hjL5HDHQi/Cgy8npQCclhDkKqKSGuFqIJwgoA42/+MfVKzc24AsvdYfRwnCrPy
	XDt9dYveCwZriNAYGNk1FugVBPA1Zf8sPc5xQ4WqdFgYrqygGZXyPArtCZMwXw==
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
Subject: [PATCH 3/5] arm64: dts: renesas: r8a77960-salvator-xs: Enable GPU support
Date: Mon, 27 Oct 2025 22:12:19 +0100
Message-ID: <20251027211249.95826-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251027211249.95826-1-marek.vasut+renesas@mailbox.org>
References: <20251027211249.95826-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 5d20bb82f03ff2f556d
X-MBO-RS-META: sxf6yd3g614zbdfbkmac5615tgyw3di1
X-Rspamd-Queue-Id: 4cwR754hfdz9tJr

Enable GPU on Salvator-X 2nd version with R-Car M3-W.

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
 arch/arm64/boot/dts/renesas/r8a77960-salvator-xs.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77960-salvator-xs.dts b/arch/arm64/boot/dts/renesas/r8a77960-salvator-xs.dts
index 9ebb47b6bf2dc..115cc47bb0724 100644
--- a/arch/arm64/boot/dts/renesas/r8a77960-salvator-xs.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77960-salvator-xs.dts
@@ -35,3 +35,7 @@ &du {
 	clock-names = "du.0", "du.1", "du.2",
 		      "dclkin.0", "dclkin.1", "dclkin.2";
 };
+
+&gpu {
+	status = "okay";
+};
-- 
2.51.0


