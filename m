Return-Path: <linux-renesas-soc+bounces-32410-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFTIIWMsAmq/ogEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32410-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 21:22:11 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FEC75150A3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 21:22:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2B45930229C1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 19:19:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69EED4D8DA9;
	Mon, 11 May 2026 19:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g9vskC3i"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756C64D2ED3
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 May 2026 19:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778527158; cv=none; b=bxIMz0F4xcMBZrRnCbkLE37eCnb+09eThFKz1CX4Q13J6qD9VxHBMvoK7rRBdsZu7ZwwSVgb2gRn08PAnLGkXriamt7A/p4OrpCggSvuHufXbdertTv2Z5v2GR5fVcxRPD5MD4uVSHUmUXOzJTr0021TaH7kj0wx8SiIKnl+W+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778527158; c=relaxed/simple;
	bh=LBeDEgZcG53jxDrJXYhFxbZX8rocP0frMxZVg1RlP94=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bv6tH2xWJNNiPZgako0O2o4rXWmpDCI/6RehJ9s2kjEU+SY86XA1zv9YZq7A/Qi7CXkcSjR3zIkEmbzjwPUVautcBwjI+F0980K/LikqKcpnpGCN9WfEDceX+CNJ3bzHOyhEW98NZBu7HwIvwBw9ACQk60GwjVXXbULYIX9uMvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g9vskC3i; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso40089305e9.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 May 2026 12:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778527154; x=1779131954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a1ZSKqDKys1YDO0iK340T9vdYLek+xBsPl8I5xs6dy4=;
        b=g9vskC3iHYV33tUkLOuXaeGikjhJ8MuQqcwRTCR8OsL3Hk4QLfA/7gEmceUVxRA1XU
         Ak4ntIOMrzT8o9t55bIQihcHVAsXNWas2AgzcOkTpJ5pfk04a9q7g1jQupl/zi8tQcli
         RIB/2QvbyLuHnYd6phr7hnapiiGN80beXuDUMgueCYn6G4wrkowd9wb3bS9c+VxKJXzi
         VzD5YPQdhY5AYz8cfm2F/eQ2i0Yr8Oy3w2W/W//4BqkEuMcrsdSrEvonK8gQNaN+vUHZ
         9uNSkFpiu3tIZDYSMDrinhdDp8ut6jr1xmHhsPg8fqNbUW7p5W4v5nGCphI+lcXW6sLW
         rQVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778527154; x=1779131954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a1ZSKqDKys1YDO0iK340T9vdYLek+xBsPl8I5xs6dy4=;
        b=dK8ut6R9F1nqBjcAUJ409WruYGPcciVqdu1yBCD80oyHYHF7Uc8rSVoV9MkwPyN/2s
         /h8wq2popsTvX+aNkNh4grtfmawjCzhdgcYFPvnznq++Fnudhu/c32ycJLW9V7s5Tuj8
         GKIxejdIAqRRPvq5j9MA/pW+mn2H4bdC3y9CTPjV8zcZsujrO/kOu5rTQHzg7KSOOLGi
         616pAmupJO2Fw1a0a8EFmj+wr6XaOFIFy28VxwAqTw+1Jvxl/vLTJn1rG+xxZSi9BiPO
         nld5gvvkIJV42vGSBNNDwMHxeGvp7+Clv9VlVlKhF3Ji6nF9TuwKl08Qf1/8FQ83XM5H
         FdZw==
X-Gm-Message-State: AOJu0YxefRuCs6gRyhT6AI1CXyq36k00v8PrQD0q+/KA+s6tkBGratPn
	DAENbHmDL0FV0Mph8+xrfuNEXrEPl3E3Dty/u5mTfcpTrRInEvbkqXpg
X-Gm-Gg: Acq92OEC2+AcEWswizrEbKYuSGFc7s+B1AY/TW0G4uCutUI7FcwnK2FJZrGyEjiy2iP
	4SkSoaTr6nfR82yB6a2X1kb8qmnEoIx2boJMy3tDaRG0y8k9Y2St7C5SiEWjPdtvEEAEp2dFSyA
	hzFF+fVxeLrOb9bqvQa++R2rgj4D+mkxpKtuZtm3mGh+C7/5+UISP/TRdoYOh0oIMLV2P3bwBLI
	t8ogP78QjnAz4kf1/n/1jJJ1LBgcBarjprPO1lCo+VqAR+5tSsU1h6yYr+eOUxwL96IzOSWA5Tf
	jF5MsWmaNU4Psr75p3wkyuAOZ8jF5piPlra2aI6J5E1e/mdKQYl1/h7N1Qf1jo/T2Tjngz2Q2ff
	h/az50hmruXpWwnSTTf14Ne4M4dZCUfSwZEWTkTeFK5l4tGN5SSwHz60xetjOX5+HC1adoKjLJu
	L1DlkIUL3vK2zZPjr7rIvQx8+Oq4ezNtFn16g3rU2zzJJL3Tb3hq712wCkutCX97mqlNjP07NeI
	kB6jPhWVB5oIGe1srBXGwV1o7aeAWwAuNPIzQ==
X-Received: by 2002:a05:600c:c166:b0:48e:6f39:f7be with SMTP id 5b1f17b1804b1-48e6f39f7d2mr195440165e9.10.1778527153714;
        Mon, 11 May 2026 12:19:13 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:e687:6094:b849:9886])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e7e45ff89sm150350725e9.8.2026.05.11.12.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 12:19:13 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/4] clk: renesas: cpg-mssr: Add table-driven MSTP dummy-read delay for LCDC on RZ/T2H
Date: Mon, 11 May 2026 20:19:08 +0100
Message-ID: <20260511191910.1945705-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511191910.1945705-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260511191910.1945705-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 2FEC75150A3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32410-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FREEMAIL_TO(0.00)[glider.be,baylibre.com,kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-0.985];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Action: no action

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Per the RZ/T2H hardware manual, to secure processing after release from
the module-stop state, dummy read the same MSTPCRm register at least
seven times for most IP blocks, at least 100 times for LCDC and at
least 300 times for RTC before proceeding with subsequent processing.

The existing udelay(10) satisfies the seven dummy-read requirement for
most IP blocks. Extend this to support per-IP dummy-read requirements
by introducing a table-driven lookup, rzt2h_mstp_delay_table, where
each entry records the MSTPCRm register index, bit position and the
minimum dummy-read count from the hardware manual, converted to
microseconds via RZT2H_MSTP_READS_TO_US().

Introduce cpg_rzt2h_mstp_get_delay_us() to replace the open-coded
udelay(10) calls. In cpg_mstp_clock_endisable() the exact register and
bit are known so the lookup matches on both fields. In
cpg_mssr_resume_noirq() the register is known but not the individual
bit, so pass RZT2H_MSTP_ANY_BIT causing the lookup to match on the
register alone and return the delay for the first matching entry.

Add an entry for LCDC which requires at least 100 dummy reads. Adding
support for further IP blocks with non-default requirements only needs
a new entry in rzt2h_mstp_delay_table with no logic changes needed.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/renesas-cpg-mssr.c | 65 +++++++++++++++++++++++++-
 1 file changed, 63 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index 5b84cbee030b..e6bf5062e40e 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -96,6 +96,24 @@ static const u16 mstpcr_for_gen4[] = {
 #define RZT2H_MSTPCR_BLOCK(x)		((x) >> RZT2H_MSTPCR_BLOCK_SHIFT)
 #define RZT2H_MSTPCR_OFFSET(x)		((x) & RZT2H_MSTPCR_OFFSET_MASK)
 
+/* Dummy read counts as specified by the RZ/T2H hardware manual */
+#define RZT2H_MSTP_DEFAULT_DUMMY_READS	7
+#define RZT2H_MSTP_LCDC_DUMMY_READS	100
+
+/*
+ * Time per dummy read in nanoseconds, derived from the original udelay(10)
+ * which was used to satisfy the 7 dummy-read requirement:
+ * 10000 ns / 7 reads = 1429 ns per read.
+ */
+#define RZT2H_MSTP_DUMMY_READ_NS	1429
+#define RZT2H_MSTP_READS_TO_US(n)	(((n) * RZT2H_MSTP_DUMMY_READ_NS) / 1000)
+#define RZT2H_MSTP_DEFAULT_DELAY_US	RZT2H_MSTP_READS_TO_US(RZT2H_MSTP_DEFAULT_DUMMY_READS)
+
+#define RZT2H_MSTPCRM_INDEX		12
+#define RZT2H_MSTPCRM04_LCDC		4
+
+#define RZT2H_MSTP_ANY_BIT		U32_MAX
+
 static const u16 mstpcr_for_rzt2h[] = {
 	RZT2H_MSTPCR(0, 0x300), /* MSTPCRA */
 	RZT2H_MSTPCR(0, 0x304), /* MSTPCRB */
@@ -113,6 +131,35 @@ static const u16 mstpcr_for_rzt2h[] = {
 	RZT2H_MSTPCR(1, 0x334), /* MSTPCRN */
 };
 
+/**
+ * struct rzt2h_mstp_delay_entry - MSTP dummy-read requirement for RZ/T2H
+ *
+ * @reg: Index into control_regs[]. Exact match.
+ * @bit: MSTP bit position, or RZT2H_MSTP_ANY_BIT for register-level match.
+ * @delay_us: Computed delay in microseconds to satisfy the dummy read requirement.
+ */
+struct rzt2h_mstp_delay_entry {
+	u32 reg;
+	u32 bit;
+	u32 delay_us;
+};
+
+/*
+ * Per RZ/T2H HW manual: to secure processing after release from the
+ * module-stop state, dummy read the same register at least seven times
+ * (except RTC and LCDC) after writing to initiate release from the
+ * module-stop state. For RTC, dummy read at least 300 times and for
+ * LCDC, at least 100 times.
+ *
+ * Instead of performing the actual dummy reads, an equivalent delay is
+ * added using udelay(), computed from the required read count via
+ * RZT2H_MSTP_READS_TO_US().
+ */
+static const struct rzt2h_mstp_delay_entry rzt2h_mstp_delay_table[] = {
+	{ RZT2H_MSTPCRM_INDEX, RZT2H_MSTPCRM04_LCDC,
+	  RZT2H_MSTP_READS_TO_US(RZT2H_MSTP_LCDC_DUMMY_READS) },
+};
+
 /*
  * Standby Control Register offsets (RZ/A)
  * Base address is FRQCR register
@@ -253,6 +300,20 @@ static void cpg_rzt2h_mstp_write(struct cpg_mssr_priv *priv, u16 offset, u32 val
 	writel(value, base + RZT2H_MSTPCR_OFFSET(offset));
 }
 
+static unsigned int cpg_rzt2h_mstp_get_delay_us(u32 reg, u32 bit)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(rzt2h_mstp_delay_table); i++) {
+		const struct rzt2h_mstp_delay_entry *e = &rzt2h_mstp_delay_table[i];
+
+		if (e->reg == reg && (e->bit == bit || bit == RZT2H_MSTP_ANY_BIT))
+			return e->delay_us;
+	}
+
+	return RZT2H_MSTP_DEFAULT_DELAY_US;
+}
+
 static int cpg_mstp_clock_endisable(struct clk_hw *hw, bool enable)
 {
 	struct mstp_clock *clock = to_mstp_clock(hw);
@@ -312,7 +373,7 @@ static int cpg_mstp_clock_endisable(struct clk_hw *hw, bool enable)
 		 * register, we simply add a delay after the read operation.
 		 */
 		cpg_rzt2h_mstp_read(priv, priv->control_regs[reg]);
-		udelay(10);
+		udelay(cpg_rzt2h_mstp_get_delay_us(reg, bit));
 		return 0;
 	}
 
@@ -1142,7 +1203,7 @@ static int cpg_mssr_resume_noirq(struct device *dev)
 			cpg_rzt2h_mstp_write(priv, priv->control_regs[reg], newval);
 			/* See cpg_mstp_clock_endisable() on why this is necessary. */
 			cpg_rzt2h_mstp_read(priv, priv->control_regs[reg]);
-			udelay(10);
+			udelay(cpg_rzt2h_mstp_get_delay_us(reg, RZT2H_MSTP_ANY_BIT));
 			continue;
 		} else
 			writel(newval, priv->pub.base0 + priv->control_regs[reg]);
-- 
2.54.0


