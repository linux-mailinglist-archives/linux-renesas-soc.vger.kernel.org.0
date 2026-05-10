Return-Path: <linux-renesas-soc+bounces-32321-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uD4dGUhGAGqgFgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32321-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 May 2026 10:48:08 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E26225032FA
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 May 2026 10:48:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F0290301A1DE
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 May 2026 08:44:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3403836AB47;
	Sun, 10 May 2026 08:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZuqfS2kt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9786B36C5B2
	for <linux-renesas-soc@vger.kernel.org>; Sun, 10 May 2026 08:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778402663; cv=none; b=SYhkRNx+LOycaQt4Qf+81VryU/K9x9rr4ZSONgbW2SwdIHetJ1g31ulCP7tAhR2hySjJ7Xtn+RN1Rv9l2eUx6ApD+IaZy8rvdtuKUfixGhlSZqN33Oc8LOiYi5AbG4jHF1/fZfzFGRFlnVEYeSfXDGKHJG74F0inu7s4T/3F0w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778402663; c=relaxed/simple;
	bh=hAz9cVk/REbCqtvF14qK2qb5B2E/7eVaibiWkjmIo8g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gZQVhvx9TcWeH5mVBWLKkoAi5iUjEl/dl9xy8G7AJC0hy61hy/0hNxzmQnt6XxnZC1odRg3hUMKVk/JxYRxgrAutXNWkFlVcC/SpMmAriMmwPScVtIgaadYHUoIT5sjWF07hic3bLIrEEDF6AhkPDPkp4onZLArUIG+/ns1CEbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZuqfS2kt; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ba1e9d3687so21141975ad.3
        for <linux-renesas-soc@vger.kernel.org>; Sun, 10 May 2026 01:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778402661; x=1779007461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R2/zYcrseTTot6/6qcImxSuA8kM1CWD/r6OyNv/RP/c=;
        b=ZuqfS2ktak3H8/wpGlvN/oR9G6PeJSWihXJxKqWvWGVMWTFmxHF7+GItfSk3Uvh9oj
         Xbtphv/I0JYqohufOtIvjd6KXQLIlYkbqWWZgiCZkAnkKnI58uFSlAWXjhkpPjkIDunB
         mHHj13HFY68B1GdNDkvhzA/S7K+gy+iBmQgsMP6MwyYdqpLzpyNP4ycmiCP5L9517Imb
         BJe7TWabFuErDbIW5AhupqjotMmwpTMgSB72yyPOLxET2iBUUigpKSA/pO1ASgCfYCZu
         jUyxSezrjOliE8onjutuay6Bmjy2fuPts7IFRHwxStJWVMI10hJPRDGhYVw+vAcpQIQl
         GrHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778402661; x=1779007461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R2/zYcrseTTot6/6qcImxSuA8kM1CWD/r6OyNv/RP/c=;
        b=Nms7XpquL4tXgiBbaPXZwRnIeThI7DI9clSO4cTCtsG5isD1D6JkcVYuu0U14eXmtj
         N9uAOODwWZ4ISbGUs/88/LC0O5v+Tb92WlIgaZ9wW/tWMk75Xss1EZZPXmUu6hVnFaiD
         r86n7BfuNQ5WOG56vCnt1XnU2qr4VBsq3jI3JmEpYUr3QO/hST0OWPLw0C3BxWjqWoCT
         7OcZexXgO+3baCQ46u7sXSeBSYMm7KWnpR/pyaT3pwgNd3wXpluxHFKTCPYJ/j20dbO2
         1wh4XNGkp35tWh1VkLAckPFl8QNlhfIKsWmlK+WT5DemUISEcqw1mHmAs3KXptYCWtVh
         PMBA==
X-Forwarded-Encrypted: i=1; AFNElJ/MVYwnZfGDmc3lF14eCM0iUel8na8nA3kjmooghtNvnjDhOhAXjiIM5M6kEBVTp6lXRz0dWQ0Vm6UXo46Xisjp2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0D4rvHYsNUKtRU9fa+OWqR/M2i7hN54WV5VA9UUO722lLlSKz
	zbo/6ymI+5rkVr1oYC/JUbp4/2S4iv5+wufHhzBKwQ9RD89meWuTt45W
X-Gm-Gg: Acq92OF9W7tFDnsgDFLG9Dp1WwQdhMoLLptO41sFm57PVAYZ8VS/Lv6deEJhUSmyPYB
	c2OBMTvupVeJ9RJtvtd7KiWmVD+2flD+t8Kg2efjZhCLLpgyuH7nwc6tKsS9lanvC3wslWk8LN4
	NJbN9zN6KzmfQquwIjAxzeTOBUusJchsCAvKSUFNP5WkYLMpSgyHEpS9+LmmOa7BSaeFgDpG5tL
	BE7p9swIImjqmC3BpIj+OniJXqklu1IgfLOtTm9VtABbIxr8vwx5cL4ZmT7a+pggmjs359zjnZv
	THYrhoOPwJaP6XYK5Q0hjGVn83bjSJg0OFU4npQTBbIT29qbqg1SDEFC+5qbannCrKguWCKcbHb
	deooCM4RHsbCiKbGVVP+Cs+pOT2FnfTps/6huB4GyAlJu/WUnPTV4cMVV44V80RAUJ9QhtVbVlT
	z+EW0H1R/dcbPp0w8X28CgumOPfTBgRzoYxfNjUZ3zR7Gi4lOsBlZznpSHQA==
X-Received: by 2002:a17:902:fb0f:b0:2ba:6ca2:bca with SMTP id d9443c01a7336-2ba79c20dd6mr140989945ad.26.1778402660935;
        Sun, 10 May 2026 01:44:20 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d3ffa0sm70471005ad.25.2026.05.10.01.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 01:44:20 -0700 (PDT)
From: phucduc.bui@gmail.com
To: kuninori.morimoto.gx@renesas.com
Cc: broonie@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	geert+renesas@glider.be,
	krzk+dt@kernel.org,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-sound@vger.kernel.org,
	magnus.damm@gmail.com,
	perex@perex.cz,
	robh@kernel.org,
	tiwai@suse.com,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 08/10] ASoC: renesas: fsi: add fsi_clk_prepare/unprepare()
Date: Sun, 10 May 2026 15:43:01 +0700
Message-ID: <20260510084303.122426-9-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260510084303.122426-1-phucduc.bui@gmail.com>
References: <20260510084303.122426-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E26225032FA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,glider.be,gmail.com,perex.cz,suse.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-32321-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Action: no action

From: bui duc phuc <phucduc.bui@gmail.com>

Add helper functions for preparing and unpreparing FSI clocks.

These helpers centralize clock prepare/unprepare handling and
will be used by subsequent patches to move clock management
into sleepable contexts.

Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/renesas/fsi.c | 66 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 8c46d6806958..b93809b5da15 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -732,6 +732,72 @@ static int fsi_clk_is_valid(struct fsi_priv *fsi)
 		fsi->clock.rate;
 }
 
+static int fsi_clk_prepare(struct fsi_priv *fsi)
+{
+	struct fsi_clk *clock = &fsi->clock;
+	struct clk *spu = fsi->master->clk_spu;
+	struct clk *xck = clock->xck;
+	struct clk *ick = clock->ick;
+	struct clk *div = clock->div;
+	int ret;
+
+	if (!IS_ERR_OR_NULL(spu) && fsi->master->spu_count == 0) {
+		ret = clk_prepare(spu);
+		if (ret)
+			return ret;
+	}
+
+	if (!IS_ERR_OR_NULL(xck)) {
+		ret = clk_prepare(xck);
+		if (ret)
+			goto err_spu;
+	}
+
+	if (!IS_ERR_OR_NULL(ick)) {
+		ret = clk_prepare(ick);
+		if (ret)
+			goto err_xck;
+	}
+
+	if (!IS_ERR_OR_NULL(div)) {
+		ret = clk_prepare(div);
+		if (ret)
+			goto err_ick;
+	}
+
+	return 0;
+
+err_ick:
+	clk_unprepare(ick);
+err_xck:
+	clk_unprepare(xck);
+err_spu:
+	clk_unprepare(spu);
+
+	return ret;
+}
+
+static void fsi_clk_unprepare(struct fsi_priv *fsi)
+{
+	struct fsi_clk *clock = &fsi->clock;
+	struct clk *spu = fsi->master->clk_spu;
+	struct clk *xck = clock->xck;
+	struct clk *ick = clock->ick;
+	struct clk *div = clock->div;
+
+	if (!IS_ERR_OR_NULL(div))
+		clk_unprepare(div);
+
+	if (!IS_ERR_OR_NULL(ick))
+		clk_unprepare(ick);
+
+	if (!IS_ERR_OR_NULL(xck))
+		clk_unprepare(xck);
+
+	if (!IS_ERR_OR_NULL(spu) && fsi->master->spu_count == 0)
+		clk_unprepare(spu);
+}
+
 static int fsi_clk_enable(struct device *dev,
 			  struct fsi_priv *fsi)
 {
-- 
2.43.0


