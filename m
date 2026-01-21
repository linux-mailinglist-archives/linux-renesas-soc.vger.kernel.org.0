Return-Path: <linux-renesas-soc+bounces-27253-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDcSHSphcWkHGgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27253-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 00:28:42 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FDE5F838
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 00:28:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 181E45A794F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 23:26:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85171362143;
	Wed, 21 Jan 2026 23:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="mukidE0L";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="PmX6g09U"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B75323A99E;
	Wed, 21 Jan 2026 23:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769037943; cv=none; b=YzJPRU01HDT7YaKILFapwZM+rEKO1wFLbFqF4MWuPQj94koH65z/3Sl8bvYPX2D5Jn9GrYpiiAJblr3n9DkMb93KrwGpNxjKXcJLRxkgCuF8Sm9TDJdIBHhiSoQ+7ecNrTy73SqX3pZtwQxqV4hnQwz4fVYRshmf/Hk50qLyk9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769037943; c=relaxed/simple;
	bh=S+LBdLA4hcIAqNz7uq4tBs/+Gvn10/AuAyNmacxaocU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e+mV6K/Evc4rT3WLtBbxjKfYPoagb2N2MOadiyqSpTweA4iyH6wlVCHD3nj/h1Zl0NOH2sunp1isa+8kIDnPesCH3gFV2s/lPZ05oGerS6gLtXQPikoxogd8Y3pY0ruE3xwbbw1F9E1kK/ItwUy1aEBQk/fbd9cBHjM+PU7q4Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=mukidE0L; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=PmX6g09U; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4dxL0G3S26z9vDw;
	Thu, 22 Jan 2026 00:25:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1769037934;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ycMx7yDEbrHDp2ulRu0w2N9uRRs85FHVMrAZD5KYRc0=;
	b=mukidE0L0l1cRCgqdHwWaUBUfRNjkHlCsPinbs1P+b5TzFUXWJ5siEshUc52H7+oVJ0OPL
	kOn6iYH+7sEbwiSpThQypN6q0/QB00EWruYp/WOvUgVWK12A7Ffs82f6AzIwJsJ0U8Zyiy
	cFBLh7ZolLPbegw2hYbZhRvcW7Jyyq5sz6mLLZ07iQuKE2rotoQiMK69JqsPuNi4Rv9IQW
	13Bmf7Jg2u3ShcZOtbRcUQPgKtPe7jUAmPTTeDZH15wnxkQZSgks7Ng9QrCVW3ZwG/VcIZ
	J7jPSuM8eMDa9RT1WnninkWPouw3vNgar2RW/5l8b8wawkGtfsnNVLHMjPqftg==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1769037932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ycMx7yDEbrHDp2ulRu0w2N9uRRs85FHVMrAZD5KYRc0=;
	b=PmX6g09UcELICgPLSpzJ19ciAEBE5o8l+k6J0/Zbgx4kFvDZV3g9aUUlErXgLlHpls6NhC
	O1bTVyBw0bX2m6MtfLeegavG2dTdWm+GaU4WD70Al+BS6rIu0aHchmA6LJejFYkdgpRUiE
	j55xTZMQVjc8kp673SFo2NXUHIGHWzL/Q3DuUecRLuNIx0gFcRfmK/M4a8qx7xPDXqoY+8
	vzwzjSxclLbaKpRk4LAsJ9iAc5cE5LG5RRSjRZ2A0JQmi+OFaSplHjBuRds0WBz9L+wC9Q
	Ejyt00C3TKc7K3ajNcf5NmwMg1HxzIOgLJAsE7z50oR3q+CCiRnP1letLO9Ihw==
To: linux-input@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Cheng-Yang Chou <yphbchou0911@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Marc Zyngier <maz@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Thomas Gleixner <tglx@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/2] Input: ili210x - convert to disable_valid_irq scoped guard
Date: Thu, 22 Jan 2026 00:23:48 +0100
Message-ID: <20260121232522.154771-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260121232522.154771-1-marek.vasut+renesas@mailbox.org>
References: <20260121232522.154771-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: bhifuexfbdxuf9n5odyibfa7ry693z11
X-MBO-RS-ID: 93af858cc11beaeedca
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27253-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[mailbox.org,infradead.org,gmail.com,nxp.com,glider.be,huawei.com,oss.qualcomm.com,kernel.org,linutronix.de,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[mailbox.org,reject];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 49FDE5F838
X-Rspamd-Action: no action

Use disable_valid_irq scoped guard to simplify the code and
deduplicate the polling and IRQ driver case. No functional
change.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: "Peter Zijlstra (Intel)" <peterz@infradead.org>
Cc: Cheng-Yang Chou <yphbchou0911@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/input/touchscreen/ili210x.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
index 3bf524a6ee204..70abbd675bb01 100644
--- a/drivers/input/touchscreen/ili210x.c
+++ b/drivers/input/touchscreen/ili210x.c
@@ -893,10 +893,7 @@ static ssize_t ili210x_firmware_update_store(struct device *dev,
 	 * the touch controller to disable the IRQs during update, so we have
 	 * to do it this way here.
 	 */
-	if (client->irq > 0) {
-		guard(disable_irq)(&client->irq);
-		error = ili210x_firmware_update(dev, fwbuf, ac_end, df_end);
-	} else {
+	scoped_guard(disable_valid_irq, &client->irq) {
 		error = ili210x_firmware_update(dev, fwbuf, ac_end, df_end);
 	}
 
-- 
2.51.0


