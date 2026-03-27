Return-Path: <linux-renesas-soc+bounces-30523-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oOrADp4ax2mXSwUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30523-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Mar 2026 01:02:38 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 867CC34CA11
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Mar 2026 01:02:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B9B1B3067599
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Mar 2026 00:00:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CABE2066F7;
	Sat, 28 Mar 2026 00:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="o1KxClSY";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Flu0XLbq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C26E3C1F;
	Sat, 28 Mar 2026 00:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774656056; cv=none; b=L5w8EqWiinJS62VbHqCaqReDmAMKABj+VwJbDT0fVolnvoHo0YLmD4bq9vyoAAZ22zVO+1bEDZsc3WvRn4dgcbMkmW/CKw+dnUrgBj3YBJ+Ka3iZIzmk7ZrjvLUZyyuVaKCTeEzJUQJYP2JlwR9VihqWyZ0dUE5goaB/AOzf4vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774656056; c=relaxed/simple;
	bh=wEsjeFWjn65aGJrjBgYuxcGCgOjobTA8eWYeLGz6lwA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZpR5H1UOIX/DpQnVmHY2rb1tB06/Z4qKBgtz3bGjF/0HaG3W6Mij1rAH0nzdAAKkReDQMW5J+1iHFaBUNWs9GO/KzFVutEjfTdE3e27FP240Gz50yqTApQINTMOsPyiW6DdphFKu/uus42gE5eGTJ82LqD0jiKprP2U3+DHcDo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=o1KxClSY; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Flu0XLbq; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4fjHj049zlz9tQq;
	Sat, 28 Mar 2026 01:00:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774656052;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FA7vRkaUWeTAiIDXNhp4k7I+V+nhQPb2VXXYgIo7eRQ=;
	b=o1KxClSY1eeSPxPVEvF8mWbox8jOPmegvPLmiGnUYeAkzZaY4E5rC7U6cruffz6PTvXQLP
	UFgL2TgBDDNbEPiYAS4ucQ6JCcCrh8Tlmn+f79P+U4qlNtyIC91CIjnDf9NqrKhyftMmYf
	C+97uDOFo5LryFCi92dlguzcndbDN4IxTjnFbc8zY1ruskvEj4AFRnyKb3xzZUtLozd/VY
	FkjuQYGncIO6rHs1aGgfyoTXTkoVMtWuxx4x80qYZtpxrpdDQqGMSPOGFtNW20zoEkfKZ8
	IV8sCYlALmSv3jsxk7IZTPJq9M4MlJX5b3uvSBiaEWuXn+0V+dIoFsvQ7G4sIQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774656051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FA7vRkaUWeTAiIDXNhp4k7I+V+nhQPb2VXXYgIo7eRQ=;
	b=Flu0XLbqQyKdp4GJqX0R0GesdtjkM1G7HlgcKzSW2bJIzzKjNp4bwHpju7LtItWoiUbzH/
	pdZAfqf+NBCAdF6SwDxGazFLbTo9Lrey+oBchca2BUzwwlRbClRWoKrNIeFVxVxQ55Y+WF
	nYclNd01Bv/cdKvRTN7NAoVYkSwEu60ZioQlQRAWaZasw3FfhCj1o8uj92yorb35AeoB67
	mrut8yO0g3bPeuiEe5Whma8CALLCzxQG1vNsJcS/ViIm++qbcPDkayOxnFzY8i7ViiukP5
	9mNej/Ur7FeMZO+3yB18BfRfd5nQtelnBHrkUhIKPXXfs4LgEjO0K12xZCtJCw==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [RFC][PATCH 3/4] ARM: dts: renesas: r8a7740: Add ZT/ZTR trace clock on R-Mobile A1
Date: Sat, 28 Mar 2026 00:58:20 +0100
Message-ID: <20260328000031.94645-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260328000031.94645-1-marek.vasut+renesas@mailbox.org>
References: <20260328000031.94645-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: e99503f44b42a0a902d
X-MBO-RS-META: 1s68q53skbzoodft3bacmomj6bgdeui9
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30523-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[mailbox.org,kernel.org,glider.be,gmail.com,baylibre.com,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 867CC34CA11
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add ZT trace bus and ZTR trace clock on the R-Mobile A1.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm/boot/dts/renesas/r8a7740.dtsi    | 6 +++---
 include/dt-bindings/clock/r8a7740-clock.h | 2 ++
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/renesas/r8a7740.dtsi b/arch/arm/boot/dts/renesas/r8a7740.dtsi
index d13ab86c3ab47..0a622da79dc1a 100644
--- a/arch/arm/boot/dts/renesas/r8a7740.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7740.dtsi
@@ -551,9 +551,9 @@ cpg_clocks: cpg_clocks@e6150000 {
 			clock-output-names = "system", "pllc0", "pllc1",
 					     "pllc2", "r",
 					     "usb24s",
-					     "i", "zg", "b", "m1", "hp",
-					     "hpp", "usbp", "s", "zb", "m3",
-					     "cp";
+					     "i", "zg", "b", "m1", "ztr", "zt",
+					     "hp", "hpp", "usbp", "s", "zb",
+					     "m3", "cp";
 		};
 
 		/* Variable factor clocks (DIV6) */
diff --git a/include/dt-bindings/clock/r8a7740-clock.h b/include/dt-bindings/clock/r8a7740-clock.h
index 1b3fdb39cc426..8a8816b2ff6ac 100644
--- a/include/dt-bindings/clock/r8a7740-clock.h
+++ b/include/dt-bindings/clock/r8a7740-clock.h
@@ -24,6 +24,8 @@
 #define R8A7740_CLK_ZB		14
 #define R8A7740_CLK_M3		15
 #define R8A7740_CLK_CP		16
+#define R8A7740_CLK_ZTR		17
+#define R8A7740_CLK_ZT		18
 
 /* MSTP1 */
 #define R8A7740_CLK_CEU21	28
-- 
2.53.0


