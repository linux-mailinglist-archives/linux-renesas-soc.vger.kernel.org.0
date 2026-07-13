Return-Path: <linux-renesas-soc+bounces-35121-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bW6vCMXjVGpDggAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35121-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 15:10:29 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A053F74B59B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 15:10:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=tuxon.dev header.s=google header.b=frPDc6Ss;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35121-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35121-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 01B6B3065317
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 13:07:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E94D421A15;
	Mon, 13 Jul 2026 13:06:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80ACD4218A4
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 13:06:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783947972; cv=none; b=lnykJj+0mtydTKL058nYLSax/XVc1Sw8q6eFy4D87rhjsHW3HpjjJgvwP1QzBCWdz74XCfrzF7F/Tu2KtUrQjA77faLzqDljYupfy0/dYNV4EUM3UI0pRkqRySReCnoHb+W1jM6puaKI8TppaHh84M/c+U1xaKaW05a1cqqFpdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783947972; c=relaxed/simple;
	bh=gGFbx5GwX/AjI3SqC89Oqwbz7Sk7o61kxh/XwmRTimU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QZI+/rdCzS9Ynt5QAkRJPYNngIj9dbIT55l9/ehrxCMkUmIQlhbALy8FugO8TV8YWpvwNVyg/X5xblYlOnIAt9zoMIfmYI+e6d2TTsGo8nXhqY37yUq1KQ11tYvhpMV9ZFO9dEvA6QrwdhRbZJ2+3lSK90I0yN8TImLJRRhM61Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=frPDc6Ss; arc=none smtp.client-ip=209.85.128.53
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493b77b150aso26170225e9.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 06:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1783947969; x=1784552769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VNXmTXjRfKoPXDcikOUifOydaqjawsRuj+0wvKXoUpU=;
        b=frPDc6Ss+u6nA4zl8ewg1/iB/mq4mtVwD5JvFxrH9Ykc5QcOMRDA9auCnhsqDodnb2
         wFLI6I83RTFRz1nSgvgRlMJ0VmSrI2wIZj6Zqe4AEzIGOb0+d/w/mjOF7h4JwhZHxqeS
         SeaOGHc600V8SXoMR/nk0OqpiIcvc24eRdMIozCS8WKg4gGDA4qIVwW7yIYsWACVxpGf
         bTA9fwgVApW7YqhbRjtP8toUcNBxFnGv3Ez7aSfG71SJ8jf2JA+jjgb636gnTpCY/mvT
         pPOiQZI9YQttcR/LM3DLq3elYwx4KmI7YjLvFwDRSWkYXb+/bnx7ei75s8cPuBsdzMv/
         jQEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783947969; x=1784552769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VNXmTXjRfKoPXDcikOUifOydaqjawsRuj+0wvKXoUpU=;
        b=gTsbrZvU/3/ageOeiHY9z6WBmXqCPcKYrSxbgnFLMKKhWnFbXamvUuHpY+4wRv8H6N
         Dpp0phN79rNNRQ6v3ZcC9kB938Qoj5knkV0ROelAb08ATpEMNLvHolfkocV59uOCVCal
         4Z0XWhk0eumvHhD9KVBhlA6rwKnzUvaQnJtpMMKhghnVSaros5oZd69mPyNGbrFo1Tja
         SjSU9S8Z+DG9yOXIAh73ZrXKYMTXIQw9ktHl4YUHrODuCY3COZ8SYvAmt7YkTOkcSY69
         ZWz7ComIjbX7HizqYpmxqHDUwgc04MzNoHLuW+fkiKnaGPTvdpMKCvix0O25EMHi7AuN
         3B5w==
X-Forwarded-Encrypted: i=1; AHgh+RqrtVqgdX0c49FN04HY6gbI1B68yE4rZF7LextV2aONNhWpkPy6hUCK7X6JD3etLOzBuLkkL3jD3e88ul/Fo/JYXg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWjVZ9/21NJPVJJb36GYIU1KivOSC2A53V1ggJ6jBHjhdwV2nf
	/fPUlgiuV/qBuudoJyo1r7jsm5JgsdPHHlNLStvT5Z/1kMeEM1PFA7PI8xxjCaOzprU=
X-Gm-Gg: AfdE7cmRyF7b6LYL1WNoTLqWZVgdSgs77wLEJr+V8NkgpDZgjn8p0Xu6B3bVSK3rCEw
	RkNl2StYW+mWvMaEBuYfeRACxW3ixzygffDSD9X0p8bVIC92T0WAmv2Vm5/1+IWogpTUeSx3Pee
	QtzxTvoO07fVOas6ig2GPKaamMU5SO3SPLe/7+shuDYKbu8b3UT5BNWbJ8aHiNK6CEM+iXCfG76
	KK64qiI0+Fzxb0ySDafT15ygg558DjM0qMMQcnDK/TJNaTEdwZimzdjJ6BiaEToLb+l5CpOt5LQ
	lJByo9HyPTT2YaWzBFuFH+ODmcFGYMW+loF10wSo21trMMHtsBOXhF94t2sE+zya7ewsZP9EGM9
	aJ0cTaKLttZlkPqYIiX1/PkFHPmmDWSc85xQLXn/Upevj8SJvnB9ibnLydktCdUFfwpGo3Bkghs
	SE90IdovRV2+70fQop8pQvAEGxbTITNn+U/FJbTME3KAf94H0k6pePninJ9C3aTtkGFzm164M=
X-Received: by 2002:a05:600c:2e15:b0:493:eb71:5cc6 with SMTP id 5b1f17b1804b1-493f88280bamr55543995e9.27.1783947968931;
        Mon, 13 Jul 2026 06:06:08 -0700 (PDT)
Received: from claudiu-TUXEDO-InfinityBook-Pro-AMD-Gen9.. ([2a02:2f04:6402:500:e91e:fe5e:857b:d0c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f273195d9sm25321609f8f.3.2026.07.13.06.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:06:08 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
To: wsa+renesas@sang-engineering.com,
	tommaso.merciai.xr@bp.renesas.com,
	alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v5 11/17] i3c: renesas: Follow a unified pattern for transfer and command initialization
Date: Mon, 13 Jul 2026 16:05:39 +0300
Message-ID: <20260713130545.568657-12-claudiu.beznea+renesas@tuxon.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713130545.568657-1-claudiu.beznea+renesas@tuxon.dev>
References: <20260713130545.568657-1-claudiu.beznea+renesas@tuxon.dev>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[tuxon.dev:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-35121-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:tommaso.merciai.xr@bp.renesas.com,m:alexandre.belloni@bootlin.com,m:Frank.Li@nxp.com,m:p.zabel@pengutronix.de,m:claudiu.beznea@tuxon.dev,m:linux-i3c@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:claudiu.beznea.uj@bp.renesas.com,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[tuxon.dev];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[tuxon.dev:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,tuxon.dev:from_mime,tuxon.dev:dkim,tuxon.dev:mid,nxp.com:email,renesas.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A053F74B59B

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Follow a unified pattern for transfer and command initialization across
the driver. This keeps the code cleaner and easier to follow. Also, in
some cases the I3C device was enabled before the transfer data structure
was even allocated.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v5:
- none

Changes in v4:
- none

Changes in v3:
- none

Changes in v2:
- collected tags

 drivers/i3c/master/renesas-i3c.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 9a3613220034..c1396c49f45e 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -663,6 +663,10 @@ static int renesas_i3c_daa(struct i3c_master_controller *m)
 	if (!xfer)
 		return -ENOMEM;
 
+	init_completion(&xfer->comp);
+	cmd = xfer->cmds;
+	cmd->rx_count = 0;
+
 	/* Enable I3C bus. */
 	renesas_i3c_bus_enable(m, true);
 
@@ -684,10 +688,6 @@ static int renesas_i3c_daa(struct i3c_master_controller *m)
 		renesas_writel(i3c->regs, DATBAS(pos), datbas_dvdyad_with_parity(ret));
 	}
 
-	init_completion(&xfer->comp);
-	cmd = xfer->cmds;
-	cmd->rx_count = 0;
-
 	ret = renesas_i3c_get_free_pos(i3c);
 	if (ret < 0)
 		return ret;
@@ -779,13 +779,13 @@ static int renesas_i3c_send_ccc_cmd(struct i3c_master_controller *m,
 	if (!xfer)
 		return -ENOMEM;
 
-	renesas_i3c_bus_enable(m, true);
-
 	init_completion(&xfer->comp);
 	cmd = xfer->cmds;
 	cmd->rnw = ccc->rnw;
 	cmd->cmd0 = 0;
 
+	renesas_i3c_bus_enable(m, true);
+
 	/* Calculate the command descriptor. */
 	switch (ccc->id) {
 	case I3C_CCC_SETDASA:
@@ -835,15 +835,15 @@ static int renesas_i3c_i3c_xfers(struct i3c_dev_desc *dev, struct i3c_xfer *i3c_
 	struct renesas_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
 	int i;
 
-	/* Enable I3C bus. */
-	renesas_i3c_bus_enable(m, true);
-
 	struct renesas_i3c_xfer *xfer __free(kfree) = renesas_i3c_alloc_xfer(i3c, 1);
 	if (!xfer)
 		return -ENOMEM;
 
 	init_completion(&xfer->comp);
 
+	/* Enable I3C bus. */
+	renesas_i3c_bus_enable(m, true);
+
 	for (i = 0; i < i3c_nxfers; i++) {
 		struct renesas_i3c_cmd *cmd = xfer->cmds;
 
@@ -964,12 +964,12 @@ static int renesas_i3c_i2c_xfers(struct i2c_dev_desc *dev,
 	if (!xfer)
 		return -ENOMEM;
 
-	renesas_i3c_bus_enable(m, false);
-
 	init_completion(&xfer->comp);
 	xfer->is_i2c_xfer = true;
 	cmd = xfer->cmds;
 
+	renesas_i3c_bus_enable(m, false);
+
 	if (!(renesas_readl(i3c->regs, BCST) & BCST_BFREF)) {
 		cmd->err = -EBUSY;
 		return cmd->err;
-- 
2.43.0


