Return-Path: <linux-renesas-soc+bounces-27978-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qK2MLDTJhWnAGAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27978-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Feb 2026 11:57:56 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D4CFCE46
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Feb 2026 11:57:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5479D30432F0
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Feb 2026 10:53:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87A3438F24C;
	Fri,  6 Feb 2026 10:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QzNGpdV5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B02338F93C
	for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Feb 2026 10:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770375196; cv=none; b=gKPcjrNKdxb14fV5MyXxdQz5vcvrwBqJPyOeyXy1RNUv/9eiIiC1aer8AzY1JbvL+C3LGPUQaIHuCjaE/0OrkSD/CkGmeDQg3axX0t1Tmd+/3exqYsEZc19uTCDNrU4IaoANpXFiC2DtTVWrQqW/3n3vP3IIADGOI2NV+k+L2NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770375196; c=relaxed/simple;
	bh=ADGZX1kaLQxBtMAwjetAO0IYz9qSFbFJW6C9e9h65Ks=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ht6YLWK4n04oR3Woe8knFddqYXznGYOwvkWs2tdeDRGfJAhCgIkMIXcmZNvj6U4AUoN7H35AEZUyV0Hh71ecHL0Fv5dWaoclzXU8+9WbvBGTjtdIejLiAC9Z5zuu6zCcn2T9Av7ROpfeEdkbjDXW22kxNlVFJqrrI1CtXbowzg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QzNGpdV5; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4362507f0feso817881f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Feb 2026 02:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770375195; x=1770979995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qs9Gkx1rz7xGBYd71ho1RwbM3cX0c0FSNNlweHUIWZY=;
        b=QzNGpdV5huY49t4L6JnLwQFu3GZ4JoLrLvNOFtRAKwTMeiJ0Y1IUwVDvRz79kbpLAi
         oNADqPQT/T1sumXkETtM1nQCxfsz3KP2k3u/nvM3dr1fIHOnlLTnZ1V/JegGUjE1vTHB
         GPFd6y2Hok4YxAZCVNoDs7aoA9frM8fZK5AesoqBKQXfw3poICZeDxoku51pIOHye+b0
         jBbji+cxf+kolHMx1ISeENYmgPxdxUR0MtBQPC0yV8xLzKR6NUOhZL+il24E5nPbrszL
         LKOyZRQIfiaL12stkQQQDsNyujJqR25Tk1LZk94HC5OaXNswjZC268MKKF324CAiL32P
         Nguw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770375195; x=1770979995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qs9Gkx1rz7xGBYd71ho1RwbM3cX0c0FSNNlweHUIWZY=;
        b=GOxLxxTHDyZun+r6WL53X5CGixG1qjf9644P0Lt0FP7LMc27nkvwx+U17kYGjHS00y
         GtZYCKTWG2FgoSUMk+J9X3lQz9DrTTOc/dE5OjKkmOjitUBPoC4sakrQ3vS13hOt+Hhi
         z+ZC7+A7USdojh6ycOTUTXZ3WjRMuJiq7j/udX5gM1aCbJ//i3tdydkO6l+FclBg0IbO
         SaG/lOqvkQ5cgtwN+QBdn68eQWkUfPIHeKSvVQHgHSEvEmEnCI3sIC0eNwWFbkKLXMad
         CA4WToJc/BzOw3Pii8956etYDRgzGAfcp6OtOFsOSWBQ7YyJt8lCN+/81BEhfwGYdwtA
         vcvA==
X-Forwarded-Encrypted: i=1; AJvYcCW2mBcnrpcOw7XGgLOPVYJ80IRTr1SNSw/W7t/7DcZ7EyasdmmcTZrzRoM3jCNXU3OY/8YCuRyGMEhB4EnrWYl1bA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCAhzHwaNCz9Qld0rV6hZ7VDxet2Vw4YC93bwGoxsMRIaUfRw/
	qDlxMufaGENIYQ8Zzmj7M2D7EQ6pA1aamSHpNFjciCUqNJtytJGbrIIK
X-Gm-Gg: AZuq6aKtr1dI2zWJgNvGkMYjbaP1FN5wmZZDkcKaVOwOmMTCwFeiqEUvcg9+GAmQwiz
	m5OEQa4VlVhPjj/4ACoJhRvlRBoQPpVxbRZpDSPn6mvNA9MpdYgimdUtQSI7Cb5EI30GZbAAA/n
	Blgq+/ZCCmfn7aoUj0wCzuYBuKsX5dUhVO1xnQg1293/oM9wcfQItT00ypQGXu/N1sZVzbIJ9Ki
	Ezrifb9rHwhtB2+fkStsjasCfMXWKEXWc7ZDqgEeZS0akBrwt3Guudf5bvS9CSosvZ2yLSCre9Y
	w0xEubfY5RpbtNYlFlCEXHghh4mQJialnPQyLkGi/Gy5F2/yPH3yZydsuArnITAoRgFpYp7MXWN
	oLzsNO0ShwrZam19xL5cUPyphQ1EXKlvyVU5yQlkUNt1UepRKc2Esy4CrudJmmLt+uIkLHBjCaS
	3td3E3eqebAlxVRWMB+A==
X-Received: by 2002:a05:6000:4284:b0:430:fbe1:3822 with SMTP id ffacd0b85a97d-4362938d7cemr3657506f8f.54.1770375194552;
        Fri, 06 Feb 2026 02:53:14 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:1e64:f8d5:9d7a:19d4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43629730992sm4519611f8f.21.2026.02.06.02.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 02:53:14 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 1/4] clk: renesas: rzg2l: Drop a check in rzg3s_cpg_pll_clk_recalc_rate()
Date: Fri,  6 Feb 2026 10:53:01 +0000
Message-ID: <20260206105312.231015-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260206105312.231015-1-biju.das.jz@bp.renesas.com>
References: <20260206105312.231015-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-27978-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 56D4CFCE46
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

Drop the unwanted check in rzg3s_cpg_pll_clk_recalc_rate() as the function
is SoC specific.

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * No change
v2->v3:
 * Collected tag
v1->v2:
 * No change
---
 drivers/clk/renesas/rzg2l-cpg.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index f4deb5d3b837..945e31c8f161 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1107,9 +1107,6 @@ static unsigned long rzg3s_cpg_pll_clk_recalc_rate(struct clk_hw *hw,
 	u32 nir, nfr, mr, pr, val, setting;
 	u64 rate;
 
-	if (pll_clk->type != CLK_TYPE_G3S_PLL)
-		return parent_rate;
-
 	setting = GET_REG_SAMPLL_SETTING(pll_clk->conf);
 	if (setting) {
 		val = readl(priv->base + setting);
-- 
2.43.0


