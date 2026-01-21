Return-Path: <linux-renesas-soc+bounces-27254-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJcwJ11hcWkHGgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27254-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 00:29:33 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BB45F86D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 00:29:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0BB639AB0C6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 23:27:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B004322B6D;
	Wed, 21 Jan 2026 23:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="hKPzsLD8";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="avQ2sYo5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8089C200110;
	Wed, 21 Jan 2026 23:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769038028; cv=none; b=X4E9Y/HEQNfnDaBkoCtXtFf9mH3jMwLfZVvRRxB9CdP5RqDhpeLKOvba72jJzPDqo5FVBda3VbNU1ny3IR+mmAV6VL4OYOcCQRClagOXU9RX3ithkj5xHdJKhbiitwGQgjqyH7u2XVbzI2CoEaRUYNdH9v0dUogDBm16zwfwiH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769038028; c=relaxed/simple;
	bh=Ie1Haw2WtnPvlbwL6gllW4suUIrjMIZAvmGVyCVImOU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JhgEjqUETviE+ylEvjvpdYc+l+UAZ6yUrHnEIEUlU/kafpNDfZ+oJuUl+kZ6gUh+fydYGuzW/gMfaX2UyvD66iTtZjnfdfvDRdOGET0WlWx+jkdRrr33huhxlh0H8IOsZn0HoWvrUB2R4z4L5PeIhUpgvvRsImb2vakS58BoG4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=hKPzsLD8; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=avQ2sYo5; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dxL204JGkz9t0F;
	Thu, 22 Jan 2026 00:27:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1769038024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=72c8DeUN47vTutVPJIuE6RFL458UWuddRpkcj6kDtFQ=;
	b=hKPzsLD8DzyDAyangyxy9wKY4R+FSZr8TICDt+iRJibhPvJzKUKp2ES4kwM0sDutQ06hxQ
	+dGDNOFk9ufivMzPrha3UMZgwcJaFUjDsCgYDUNTvGpoYngr6t9iP0xSbJ5Vssz9loLdY+
	ixCn2sbm3sgFlkyaHPmcGhDll+VYMEA5wgOK4Utd3pcIFW/LSojeEEmI8WDO2Nm1SVvJPb
	GIBqCgQzYQrXWeyT3mDQN0MeGyNvPGMF0fSU7PLLnXcXk8Tl6RWtMJp+hmXx9guu3iYOj7
	dHQVL40cHH+g6L8q6BdSckJwQ/tx56aeXlOpZF30xsW4S6qR4M1x6tlinuFE3Q==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=avQ2sYo5;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1769038022;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=72c8DeUN47vTutVPJIuE6RFL458UWuddRpkcj6kDtFQ=;
	b=avQ2sYo5yrnTLKEcNIg4qWrVa47RgXp5YWweVK+u2iBtNlUAnJaaqDX6ygcd2LgkfD42Iq
	mQb8mMYAU2cIiFsLXacRR+GahsRhn6uU38icAppKkHepVouCXDNglquxXBZfExHrJz2Fkg
	urFQZD+OlxHjxt5G/VI5NjFcHsWbdwUqOPjO1s1dQ2LXRd+68CklDP8beUP5TEYfY7+NvA
	RznszVZb+V0jgCe1Q6S9lVZjgyxbg2jPPkK2M/sRI+q7dTQuCHmwqe0gxQKA+DqBVidIfE
	Fl9jL3Iz/O4kwj54bBJ4CGhxl3Dy8NKO+H0r6BpefQtPxOsY/yJwAPrMRUQLRQ==
To: linux-clk@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	stable@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3] clk: rs9: Reserve 8 struct clk_hw slots for for 9FGV0841
Date: Thu, 22 Jan 2026 00:26:38 +0100
Message-ID: <20260121232657.155281-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: o4fiikg9hpk9rrnasrfk5ai4ews1gthk
X-MBO-RS-ID: 7f6992ab9ce530ef4aa
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[mailbox.org,reject];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27254-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 57BB45F86D
X-Rspamd-Action: no action

The 9FGV0841 has 8 outputs and registers 8 struct clk_hw, make sure
there are 8 slots for those newly registered clk_hw pointers, else
there is going to be out of bounds write when pointers 4..7 are set
into struct rs9_driver_data .clk_dif[4..7] field.

Since there are other structure members past this struct clk_hw
pointer array, writing to .clk_dif[4..7] fields corrupts both
the struct rs9_driver_data content and data around it, sometimes
without crashing the kernel. However, the kernel does surely
crash when the driver is unbound or during suspend.

Fix this, increase the struct clk_hw pointer array size to the
maximum output count of 9FGV0841, which is the biggest chip that
is supported by this driver.

Cc: stable@vger.kernel.org
Fixes: f0e5e1800204 ("clk: rs9: Add support for 9FGV0841")
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
Closes: https://lore.kernel.org/CAMuHMdVyQpOBT+Ho+mXY07fndFN9bKJdaaWGn91WOFnnYErLyg@mail.gmail.com
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: - Update the commit message crash paragraph
    - Add RB/TB from Geert
V3: Add Closes:
---
 drivers/clk/clk-renesas-pcie.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-renesas-pcie.c b/drivers/clk/clk-renesas-pcie.c
index 4c3a5e4eb77ac..f94a9c4d0b670 100644
--- a/drivers/clk/clk-renesas-pcie.c
+++ b/drivers/clk/clk-renesas-pcie.c
@@ -64,7 +64,7 @@ struct rs9_driver_data {
 	struct i2c_client	*client;
 	struct regmap		*regmap;
 	const struct rs9_chip_info *chip_info;
-	struct clk_hw		*clk_dif[4];
+	struct clk_hw		*clk_dif[8];
 	u8			pll_amplitude;
 	u8			pll_ssc;
 	u8			clk_dif_sr;
-- 
2.51.0


