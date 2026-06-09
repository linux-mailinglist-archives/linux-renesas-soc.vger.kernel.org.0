Return-Path: <linux-renesas-soc+bounces-33744-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RYbpMT/0J2oH6QIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33744-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 13:08:47 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 750E965F4FE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 13:08:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ll2rxxqF;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33744-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33744-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4B3EE31E8A1C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jun 2026 11:00:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB87F3FCB3E;
	Tue,  9 Jun 2026 10:59:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8A63F9F43
	for <linux-renesas-soc@vger.kernel.org>; Tue,  9 Jun 2026 10:59:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781002775; cv=none; b=REJr0xcrbw4k92WqY3kyZZ+TStsv8ZPmsuo9TO6NOj7egElL4TNqhe8hMbexApLYoerNe7JV0Pqfl1t2oBhPWydgDPbqU/8AlQ5H1M5uTjk0SJkn0C6nT5BauyOJENMO4zTRxRSKJ/m3GwoRXtGkz1YOOyFpOvxINy4/QGFXshQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781002775; c=relaxed/simple;
	bh=U7gFYCZBHlMfedCTieRMzQlrxSP71kZGI/WHZLC1yjg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HmeVFCXahgbwzKSSEy1bukk2RbAji1+OjRYmJ817Ak8dEwiozxfTA+E2D2xZiS5M86I5Ck4BmtldzodxPhZbnDp6ic1eaMIfqw0l8XGeIP8b6QGoOEjhfNLBD3wPmTumv+LDltMTlSAK65br/j/rws31yWFOT4ybBeSw7fP/y1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ll2rxxqF; arc=none smtp.client-ip=209.85.128.43
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490b12270b3so32273245e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 Jun 2026 03:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781002772; x=1781607572; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XwC0/BmrWqLN7wfExQfGq6TF8V6hWtX93QQJcQuLNxk=;
        b=ll2rxxqFGxt/rxdU6+n3LAvlW0lpWoawx9qSNeepSbw8I78aZ8QtGBbZDd/ykQe4Ky
         Qm1DM/kGhUE3RYzhaBJ/zz+lXf1TxFLEdGFy5QbIOD3rn7krz+gqiz5P+af+ZePbY+yb
         zlKTOj8xWyflfqkH4YdNQvxlTROhk99rF/5lv4IpPuA1MZNCUyLPATfX+h7DA+NcbXmU
         UeNSGx80LP11EApntHjNiVu0XBUgKrzGiVpGE0VyecbO5oo8PrQQYYLE2zIyvXxwfny1
         K8UdGE0d9MKjegaLTIVpdpAEPF2+r6UxccOmocPSihlLzhvsKIMEDV6CA9LIF50r4GO+
         W0+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781002772; x=1781607572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XwC0/BmrWqLN7wfExQfGq6TF8V6hWtX93QQJcQuLNxk=;
        b=qyV1rkV/ekr9Af1BaBy9ZDVIDA+Hg/oaqJQ/XFLTA4jwk8vhJqRKky/jiPJFJOvf/H
         ndvGHhoyn/NXsgSLqXPw7dx1qqcBbjvi5cK9rWPi01tNUKz1u27nMGAsAKMY2QbRkDgl
         ATd6mpVvET3YYo7kh1rzpqfp8R+t4NlPYNoBaoId2MntbfZcVIsypBJju1XfkQwo99N1
         y887lZgGP6z+mcb1pRtPVBt0IODCE0rNAa9D3794CEMEjkauZncgErJ1eR5PxtuIYp17
         oq+AHi2WLVc4Ik5QWWReGQUge1wF/5AGMxzGmqVEyyXLrMJVDLnsker6sG1O44YPRyxJ
         zlZw==
X-Forwarded-Encrypted: i=1; AFNElJ9njEI+sGBi9KVQf2+8dxFi+Gohoh+9PINr90wZbwpSHrtuUPmDueNZNViGmR+NvIJA4mfaUMr4bMBkGcIRuGqPQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOT0/gmT3ZER3snCEmPsb4y6XtiRurFLTMASOo4BRWstMj6EzB
	OSg903a0gh0EkquHS5kO/rx1TAL6c50Cr18adVTaNWWT886Yr7rOemJV
X-Gm-Gg: Acq92OFZl745bK9VJShUNVLXDL2KQLj3h2kQYzFLe+HzsmxqJZkZeTa5bRVECE6xomB
	K+NdxSycxlWGbLnFJ9OZm/PAk9y0706lpdO/1thTIsAvOYoZlyfGB8zm1WRfawwlM8sRlDzxze6
	HTQLfdNftStx3BccQI/Jn6i29ZgCyWInktnw3H77B/OZhXJEVLFJz/4ImYVT8+lX/OP0OOGpnNR
	GV6iXFEFUumR9qH/m3OLzbvvA+VknowAY/lk43SjWnSwhi7BwdU1h2T3jdGEPxwa8a6NLbwZY0T
	WFQTevRJkvp1Fvqd+uhGvXKGBRdgtu9F6wEgwoO0vP6SokM4lNykD7Fo/oK4Vsug4rSDtN4l37S
	XFu3XU7zvhSc6nIDjPUklEtCNkCc9zn4iOojpGZOkcAIQAbax9XQ4oQh2b9rA8IvSHvZNd+TSPA
	qBB0zlB+flSLYTbgJj0b2dlkermXphs94nZDhj7EFUV5wyIEqrOOzrhSmyac4TdaX6sY2DdLnPI
	SInybHi5UYllQsgR+IvGtnufAfaR+qFBLbDpsz0ihQCmHk7ngeR2KdBlA==
X-Received: by 2002:a05:600c:34cb:b0:490:4b89:5361 with SMTP id 5b1f17b1804b1-490c25afa03mr312956635e9.7.1781002772434;
        Tue, 09 Jun 2026 03:59:32 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:2b2d:6009:3bbe:fb84])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3d663csm524250635e9.11.2026.06.09.03.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 03:59:32 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 2/5] clk: renesas: cpg-mssr: Implement dedicated MSTP delay logic for RZ/T2H LCDC and RTC
Date: Tue,  9 Jun 2026 11:59:21 +0100
Message-ID: <20260609105924.962573-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609105924.962573-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260609105924.962573-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33744-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:prabhakar.csengg@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,baylibre.com,kernel.org,redhat.com,gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,bp.renesas.com:mid,renesas.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 750E965F4FE

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Introduce a dedicated clock delay mechanism, cpg_rzt2h_mstp_delay(), to
satisfy the module-stop (MSTP) state release requirements specified in
the RZ/T2H hardware manual.

Per the hardware manual, while a standard 10 us delay (satisfying 7 dummy
reads) is sufficient for most IP blocks, the LCDC requires 100 dummy reads
(142 us) and the RTC requires 300 dummy reads (428 us) to stabilize after
being released from a module-stop state.

Implement a conditional bitmask filter helper that switches wait
intervals based on the packaged module clock index. In
cpg_mstp_clock_endisable(), the clock index and individual target bits are
known, allowing an exact match. In the resume path cpg_mssr_resume_noirq(),
where individual bits are not tracked, pass a fallback register index base
(`reg * 32`) with bit verification masked out to match on the peripheral's
register group block instead.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Dropped using table based approach in favor of direct conditional checks on the clock index.
- Updated commit message to reflect the new approach.
---
 drivers/clk/renesas/renesas-cpg-mssr.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index 5b84cbee030b..4ed056b18d31 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -253,6 +253,22 @@ static void cpg_rzt2h_mstp_write(struct cpg_mssr_priv *priv, u16 offset, u32 val
 	writel(value, base + RZT2H_MSTPCR_OFFSET(offset));
 }
 
+static void cpg_rzt2h_mstp_delay(u32 idx, bool bit_valid)
+{
+	unsigned int mask = bit_valid ? GENMASK(31, 0) : GENMASK(31, 5);
+
+	if (idx == (MOD_CLK_PACK(1204) & mask)) {
+		/* LCDC needs 100 dummy reads, or 142us */
+		udelay(142);
+	} else if (idx == (MOD_CLK_PACK(605) & mask)) {
+		/* RTC needs 300 dummy reads, or 428us */
+		udelay(428);
+	} else {
+		/* default 7 dummy reads, or 10us */
+		udelay(10);
+	}
+}
+
 static int cpg_mstp_clock_endisable(struct clk_hw *hw, bool enable)
 {
 	struct mstp_clock *clock = to_mstp_clock(hw);
@@ -312,7 +328,7 @@ static int cpg_mstp_clock_endisable(struct clk_hw *hw, bool enable)
 		 * register, we simply add a delay after the read operation.
 		 */
 		cpg_rzt2h_mstp_read(priv, priv->control_regs[reg]);
-		udelay(10);
+		cpg_rzt2h_mstp_delay(clock->index, true);
 		return 0;
 	}
 
@@ -1142,7 +1158,7 @@ static int cpg_mssr_resume_noirq(struct device *dev)
 			cpg_rzt2h_mstp_write(priv, priv->control_regs[reg], newval);
 			/* See cpg_mstp_clock_endisable() on why this is necessary. */
 			cpg_rzt2h_mstp_read(priv, priv->control_regs[reg]);
-			udelay(10);
+			cpg_rzt2h_mstp_delay(reg * 32, false);
 			continue;
 		} else
 			writel(newval, priv->pub.base0 + priv->control_regs[reg]);
-- 
2.54.0


