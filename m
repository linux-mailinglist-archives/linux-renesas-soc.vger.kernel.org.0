Return-Path: <linux-renesas-soc+bounces-29271-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJ/ZCWOgsmkOOQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29271-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 12:15:47 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A314270BBD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 12:15:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C86223010833
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 11:15:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC3903B6C16;
	Thu, 12 Mar 2026 11:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eXuQ8ZNm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA3B3B47E2
	for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Mar 2026 11:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773314135; cv=none; b=pySm++M1JgCI+wHXuFTYu0YS9dGsVmDTH8OWAZy6PhC2Ukw320wJBpq5fTNHyDua1CLGTmdgK5pocYqrEnINwAmzd9XoNStBSGfiLi0ZHlgSJaoB+gkPSFePwRlU7QdCneQ6ve8JVC4GPSRFqCp7No3lzisEnQVQ0YzK5JrmLyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773314135; c=relaxed/simple;
	bh=6KFZsyF5zCUsUUU8aDvJtlhiu7/4C1dLbnJSrEqU+8k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nnsvbZBTVZxwu2u6bpNIOyV7rsDF6MlB9Sy1khiwHxY2LeAYGnCochp6msFfH2Ajf4/zF4qV7xDoDmlChmuPwbZCB6ZhlRws2jouhNjpXEORiZpfpotFseaYbktNxw/fFtXU+2AF5CxssurfihEZkqR4dRVvP93vA0742SrhzvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eXuQ8ZNm; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-483487335c2so7278505e9.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Mar 2026 04:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773314132; x=1773918932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qfQzGSA5WbRXU/h41ykwoCteraq6rjsMmPJJZqznTns=;
        b=eXuQ8ZNmT2rmBEEMbyQPCpPqDyxuZWLfiMhVZtwqugdWZKBojw5/StyNC4CZi8eyxn
         CGBnAqHfpimm0rqgraoUgEXM8r1F+o/faTI84VmUkfN/io5auAS6MAnP/K0RbdhWZE5Z
         VfFOTYyDKtAOgCwYxkcqy0qiqh3ClLbrtmrcbK+9Zvlk68MqEOLrIhN1qDAwTW+3As/k
         e61G4a5ShWu4ZIcvpdUu4YbEe7d9S3AVe1+pa22rqk2b7wzfF/C5lm2tZDV+BuMXya0j
         q0momkMqT7oE3FByaPQvVKzE5QY0PEFFGiIhm13ckWoiFp5VikmUaIIjuzbbtdOuoz+3
         cqOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773314132; x=1773918932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qfQzGSA5WbRXU/h41ykwoCteraq6rjsMmPJJZqznTns=;
        b=rRMyzcjVBCRIRYAG0AWORxUSN1XyGYw/X2w0zqkYbKy9KDXVsf4C07cc5MjoxNYLVz
         Qu3NgRReTlzVqJSpaHvwfCC4HksBhW4nD03NDdVAZ1zR2U65n59RnK2Lc+Dnzbx2h9BA
         QgiH4PYrOYK0hSYXA3Ca84uWRFYLVZ4qvKmhpRxkntDQqBjdwnG4/uUJurKUEgZYr5vg
         LMdo8cCd7F8lQbNJ6E9taE971RgIqJoCBJBpim96OxuW9Np6xI/gJBKLTp/MueJY5ZTP
         kfT9jjWYjT+lDQfYnywAQIHFNKllXh+mNcx6BB3j29Aj9Z2sPvHXndWFJ6bBL6JlxHnA
         xozw==
X-Gm-Message-State: AOJu0YwIu/guKd9wR0fBhIQuwz83xDK68X/pSzFrJ8mJ6MbnnjTYruJ5
	SRwEK52oyqyYTkqX06ugsVktDfpWmTpU33tjM33iQlrQ6c1zOYjjpygc
X-Gm-Gg: ATEYQzwMszcMDwi8O7g3Sq3KEE5MpApRL/K1se6JzDXTsXVgMeGo2L6LeEKoEVAnAcp
	8ajpHlecDF0FuaNLw00i+OfJ7lo3LU9iFfjv6flYrFXoP/YXVLE/EsdgXy32nf4Quh1EvL7L2Jz
	EGd1OBu6wgo8MC7fG9lOrpgIlMrkJGDMyD9KqYLYXQtGfy9uYFCPr2R8khai63BlBsenzxBMnoO
	xEqvzTMGScPBa0gTd92boJIm3gviKHWVD00nHhDyjECxx3SpLpTChjpCjud3K4AC7vIvu+pkbeF
	LBkFpbae5TfQRP57JncjdOH7vXrdS5OxVj5/+PRrijain1qMv3P7k94FUQpg5ClJJGMuxPTyJNB
	6sxT8Rp6oualfuxHxe47UsRWlMy+fjTkdjfmKjSiHNxCHWQ8PpIn73liLTBgYaK7q6ENvtm6Y1K
	UwHfSkg/QUOaaJpRm5vB5pjSXYVsHC3HArhlkWEnHjUFqdaC9ODSdLQKqIhN6XdTnPbJg=
X-Received: by 2002:a05:600c:8710:b0:485:3f72:3230 with SMTP id 5b1f17b1804b1-4854b0d2917mr96475265e9.15.1773314130444;
        Thu, 12 Mar 2026 04:15:30 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:fc52:7d64:32f4:e21e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b6f708sm311458385e9.11.2026.03.12.04.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 04:15:29 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/2] clk: renesas: r9a09g057: Add PCIe clocks and reset
Date: Thu, 12 Mar 2026 11:15:21 +0000
Message-ID: <20260312111521.115392-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260312111521.115392-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260312111521.115392-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-29271-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6A314270BBD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add clocks and reset entries for the PCIe controller.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/r9a09g057-cpg.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g057-cpg.c b/drivers/clk/renesas/r9a09g057-cpg.c
index c3174f40fdb4..2fa5a620bbd9 100644
--- a/drivers/clk/renesas/r9a09g057-cpg.c
+++ b/drivers/clk/renesas/r9a09g057-cpg.c
@@ -508,6 +508,10 @@ static const struct rzv2h_mod_clk r9a09g057_mod_clks[] __initconst = {
 						BUS_MSTOP(8, BIT(6))),
 	DEF_MOD("gbeth_1_aclk_i",		CLK_PLLDTY_DIV8, 12, 3, 6, 3,
 						BUS_MSTOP(8, BIT(6))),
+	DEF_MOD("pcie_0_aclk",			CLK_PLLDTY_ACPU_DIV2, 12, 4, 6, 4,
+						BUS_MSTOP(1, BIT(13) | BIT(15))),
+	DEF_MOD("pcie_0_clk_pmu",		CLK_PLLDTY_ACPU_DIV2, 12, 5, 6, 5,
+						BUS_MSTOP(1, BIT(13) | BIT(15))),
 	DEF_MOD("cru_0_aclk",			CLK_PLLDTY_ACPU_DIV2, 13, 2, 6, 18,
 						BUS_MSTOP(9, BIT(4))),
 	DEF_MOD_NO_PM("cru_0_vclk",		CLK_PLLVDO_CRU0, 13, 3, 6, 19,
@@ -642,6 +646,7 @@ static const struct rzv2h_reset r9a09g057_resets[] __initconst = {
 	DEF_RST(10, 15, 5, 0),		/* USB2_0_PRESETN */
 	DEF_RST(11, 0, 5, 1),		/* GBETH_0_ARESETN_I */
 	DEF_RST(11, 1, 5, 2),		/* GBETH_1_ARESETN_I */
+	DEF_RST(11, 2, 5, 3),		/* PCIE_0_ARESETN */
 	DEF_RST(12, 5, 5, 22),		/* CRU_0_PRESETN */
 	DEF_RST(12, 6, 5, 23),		/* CRU_0_ARESETN */
 	DEF_RST(12, 7, 5, 24),		/* CRU_0_S_RESETN */
-- 
2.53.0


