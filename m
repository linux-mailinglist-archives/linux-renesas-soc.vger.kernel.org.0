Return-Path: <linux-renesas-soc+bounces-30153-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kGHtJbx6wmnqdAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30153-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 12:51:24 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B98307A4E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 12:51:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 425E5315E4C2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 11:44:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4789A3F54C4;
	Tue, 24 Mar 2026 11:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kMAoiizq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E363ED5CE
	for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Mar 2026 11:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774352626; cv=none; b=ahw37hTR2okji+Y6MwWjvBBv7dnYZ4u8lvfTEn5FrPw2EkZ/DNp0scyBCctFsfBbAn4K5PVGJHFL5rwZ5P594516uqsJOxzpTHIdhBwMHQod4BAxkzTZBhf49HxL/i61RHu8ZmA0r9pKQXTkPWhe4ymNq0XZ00r0FM8QITHs0SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774352626; c=relaxed/simple;
	bh=j0Gd04+kJqJ6VR/s+a8qrHwz+JDzDy6zM8WFPZZZUj8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qOn3Nlk+HpJm8VgYS6mJgWJ8BQuU8Uc87VRV7nZ2qPJowAAF+A59cG2JO6j2ASnZpho/jal8jE6Z6trfueAdQubLWrLthgial13zeaWy61SbagXHHnkH1QatpMP5ZEJSheRO9sv/kEQCgjZLl01fph2rY7/DMBXf45fIx3QYaZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kMAoiizq; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-486fd5360d4so13127875e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Mar 2026 04:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774352618; x=1774957418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QNiRs4I0KqGZbcAMjICGT778jYVtsL4Bi7idhY15odQ=;
        b=kMAoiizqinLvsr+eMl2jDd8E5CqUmP/XQQAV6loJXxE+uwmPzUWfO6kmZxhYnnBQYt
         6zduq61pvDcXM97BeJZG4k/733igv08RLRwdTOsdCabDOdZKdqr9RHu52BvlPnihne03
         oC2QvtFBhkPNruAyzz6lp7gxuF/mrm4/7aEDzO2sDZk8Yq+mEM/hIXmwiNMP1BgzISaY
         S+ML02m3C0K2VGx7QuF6SfKY8KiZ3NfCHwupO6ZxYcIHHeklPQZT68sqmVIIk4x9LeGc
         ADDBAQPN1WxIRG1rMgt+GbrzEvmSaVyBfINhBR4i5OMPOA4KthQ+Ymcb0CsQYSWWHePD
         kjPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774352618; x=1774957418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QNiRs4I0KqGZbcAMjICGT778jYVtsL4Bi7idhY15odQ=;
        b=ph3O+jGFJpmMMBHa0QAP33LR/zNFGcePW7brlTZXDcUi+TTgGkrudyqZ8qcXdx0Nz9
         G72PN9Ic0BPmvfYFYbiVTXwLuABuhctsK9uP8mEf68xkATqde/P3JeHrsTzGWKxOie2z
         kQsYyr95xJ5y1Fz3go1zuR4LTbyYAHqo/3mRl6V0zvMGKrZPUWMhvJDhlFMIIgazVO0f
         RzPTkqK5bcp3QCC27X34B0j0E7zFNIo4TJd8qXizLQCY4wbus2eWkA/PgrGJ+COJWg2c
         VWUa7gzSDaqE8rqe1qFSYp8ujSglKC7RnsQhmnMsrSvKczj+uEy5JvNTlLpKViZ/FkmD
         vSyA==
X-Forwarded-Encrypted: i=1; AJvYcCVWe+B0RS2TeTqzCcZJVj5jDvhkGwO1tyu5l1CFprSkkCcV5uUHSdeHeWDfnHTMzs2awVNdMwYiqwOvw5VIFVN3Dw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/eBt7idFH/RUeLn6es6D5UzTT66cka7/Ke8Hy1PUPHEEfvJM3
	X4LXUwtHpBD1v8NCFlr2G1goZOrXN/i8ddsyOsUo+cDles/1++Z2Pv3V
X-Gm-Gg: ATEYQzz9fhk1GWkjaYpjkvjYPwvIZRP/5Io4HrRMwEHR5Oc1D12efZXvo/i7ezCaQBd
	o6GpNCmVgZSg0w+vDOQZGEIucLVLjoDDWabqSbB52z8neS1AxFvuJIrhVpmkOijJpHn6OXirfTa
	SzQVBkuXjTKJN222LQwUE60Grg/vQUjpwHPCnDYzZlXS0CAXyqoU3clCZreeYDz+zjwtTPIIr6O
	3v07U32n71W3Ok24563Usghyu8D6EHFKGxghLfcmTILD6D2XYKlQFmloiYDXEVW5VoHGxNBV5jR
	wsuoy8W8Ep8Gh0hUVto5IW+fAmal3rOCAi0C5IRqIUGQOCdEKngQCzoYAPD3s5DQ2EWNKbLuJNV
	J6DrU7EEKUaMNPV1NlfXUfITKX3pOfpsY2jqNuurC0RxyTnKVLM6ToEIQjQOt0JxyIbeVkvy+/y
	0JfVdF9vmqsX0qvKJDnU7zaWs9J9IUntAl1wftcYX7ZOVINye5
X-Received: by 2002:a05:600c:2d14:b0:487:2b7:18d1 with SMTP id 5b1f17b1804b1-48702b718demr103827345e9.33.1774352618212;
        Tue, 24 Mar 2026 04:43:38 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:a4a6:e61e:cd81:c756])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4870f7f5682sm25416465e9.3.2026.03.24.04.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 04:43:37 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v8 05/11] clk: renesas: rzg2l-cpg: Add rzg2l_mod_clock_init_mstop_helper()
Date: Tue, 24 Mar 2026 11:43:10 +0000
Message-ID: <20260324114329.268249-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260324114329.268249-1-biju.das.jz@bp.renesas.com>
References: <20260324114329.268249-1-biju.das.jz@bp.renesas.com>
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-30153-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bp.renesas.com:mid,glider.be:email,renesas.com:email]
X-Rspamd-Queue-Id: 37B98307A4E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Refactor the mstop initialisation logic in rzg2l_mod_clock_init_mstop()
into a dedicated helper function rzg2l_mod_clock_init_mstop_helper(). This
decouples the logic for setting module stop state on disabled clocks from
the iteration loop, allowing it to be reused during resume to re-enable
critical clocks.

No functional change.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v7->v8:
 * Fit the comments in rzg2l_mod_clock_init_mstop_helper() to 80 character
   space.
v6->v7:
 * Collected tag
v6:
 * New patch
---
 drivers/clk/renesas/rzg2l-cpg.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index a38401c18dcf..738a4b182f27 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1594,6 +1594,20 @@ static struct mstop *rzg2l_mod_clock_get_mstop(struct rzg2l_cpg_priv *priv, u32
 	return NULL;
 }
 
+static void rzg2l_mod_clock_init_mstop_helper(struct rzg2l_cpg_priv *priv,
+					      struct mod_clock *clk)
+{
+	/*
+	 * Out of reset all modules are enabled. Set module state in case
+	 * associated clocks are disabled at probe. Otherwise module is in
+	 * invalid HW state.
+	 */
+	scoped_guard(spinlock_irqsave, &priv->rmw_lock) {
+		if (!rzg2l_mod_clock_is_enabled(&clk->hw))
+			rzg2l_mod_clock_module_set_state(clk, true);
+	}
+}
+
 static void rzg2l_mod_clock_init_mstop(struct rzg2l_cpg_priv *priv)
 {
 	struct mod_clock *clk;
@@ -1603,15 +1617,7 @@ static void rzg2l_mod_clock_init_mstop(struct rzg2l_cpg_priv *priv)
 		if (!clk->mstop)
 			continue;
 
-		/*
-		 * Out of reset all modules are enabled. Set module state
-		 * in case associated clocks are disabled at probe. Otherwise
-		 * module is in invalid HW state.
-		 */
-		scoped_guard(spinlock_irqsave, &priv->rmw_lock) {
-			if (!rzg2l_mod_clock_is_enabled(&clk->hw))
-				rzg2l_mod_clock_module_set_state(clk, true);
-		}
+		rzg2l_mod_clock_init_mstop_helper(priv, clk);
 	}
 }
 
-- 
2.43.0


