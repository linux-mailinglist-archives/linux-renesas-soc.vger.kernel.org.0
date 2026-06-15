Return-Path: <linux-renesas-soc+bounces-34003-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RUBML5vYL2pcHwUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34003-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 12:48:59 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C18685768
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 12:48:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=B8bsWJig;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34003-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34003-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1C8B5301D309
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 10:48:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F857343883;
	Mon, 15 Jun 2026 10:48:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBA8330644
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jun 2026 10:48:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781520533; cv=none; b=S90VMOYFGfU39VjOzkDLO4kVrH4c1QG47DFUM4mQF/uQxS6SbuVs4VdQzw+vAIKAWldDZoaQ/ZP47XMrmufIkue3s+0HEq2fuwjxI1iAt8GIFV39bcO/p6SANpI/12CbL89xHF006o47hz3zkfDRewC6FvZ1vM2jjoPTnRHL8VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781520533; c=relaxed/simple;
	bh=YGpbOnzNFHtccs1nsI/f3ODNgK61VFnWrTpbiSn+Gyo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YKQ4Tnxlm1eE1ht4COtSqXMDdCyrDYaBRI/09udeNUBF3aLzNclB6SR0uAG5KpCjG8AISoiM/HgCRt8MpA2G2DwbmeQhCsAo7hBMBTDN0BXGgD8rly8WxQUkGxkPDWP8q3zQ2qBzIBLEsYYsV3f8s7TyqLhg2lP9eU7jLsRMtyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B8bsWJig; arc=none smtp.client-ip=209.85.221.49
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-45ef1198766so1654110f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jun 2026 03:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781520530; x=1782125330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XLeDqFqDa9KpNOsyOXrLj3mdC+7gkZq+DBsY04Jn0Wo=;
        b=B8bsWJigtpLPwqRo2K2q9YHVka2iRo4qpphaaV/J8FJodYlKvU65Yawi0xRW+G3mlZ
         jbhDDUI+y23rnn5jILa5d4EniLtryAIjXbgZKmUQhZ5lPjOg/X6INvdOWYXAUjLF3iKO
         7pidSZ3I8YhLlBASXzarrPRub1jro4l3R04VbHu6kEKMZC28VbC0d8nlLVZB5F5M/7M7
         RVv3FnMFKWcYdzgI17zcIH4dyqeu1LBEds1gRtArcX7OA8QNNkBCW759PcQKyx7zRm4I
         rlhrBIdnnC5qeKSM+ZOgXYVeK8j/J6TOtm5RGu5GuMsMuLTnrpMWPxn2+f/+QoGrCu6Z
         z1oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781520530; x=1782125330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XLeDqFqDa9KpNOsyOXrLj3mdC+7gkZq+DBsY04Jn0Wo=;
        b=ZSMr4DLCgS1o1Rsvbq/j/nMbMokOyCf+r9WC5nNgKCtOhGZAXXw8XDMQSskyKTLRAR
         4xUmp0geCVA/aoGvz6HhSDJbrzSJ2gqZ2zT0KFy1Kc+Jme9ZFGN5ij9Gzttzyng1/J02
         AGAl9Ewy+0cfc/W5UHkWvkm+nOzTXdsly7aZs9tPoFn8BzTPClobU52G1ySOXBJxjWAg
         yeE5SfsZQgBTc1R55HgFHo3hBEyjVaTC3RhF4ccFJuRb0mN1fTWECIzfrBgDoxBX5mX+
         ln7lxu+x2aVGphlMb/C/xFh2aqiprNZ2uGzaD5RViQumbfXtY6vtta9qBjs3ad5lC0kK
         UPNQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Z3LQciqbP88+oGxxiTdDiocPrTqxK3yUCffCO3TTBmLR4nuEPKtm1DrAIzCCHotH/rqFUzIT2hDN9RyDLEUmS2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxW8XIvQ9JoZO/3CDymyc7Vexin8JtBRrJ7JGH9kfGGM6R9hbgw
	pMUO77C5mS4MdL93mlRTk2uzE4wlZtveQ5VC3m0NS9P815Ur/9Rzo0Xp
X-Gm-Gg: Acq92OFrk/G49AnZvQnVWfHEgdDBIUWwq9xzK2t1tso7l9mt4Ezshadij2VMHiyLNx/
	wZABw1BmjwVTyeYalseppHvluhiPB5vpKK5Q86nJs9FuiOBcsC1Xnp0Z/xjxJhTYYY44TwSyxPA
	WD51CFE/eh8SwKLSKvZ2VHt/ouKNfTYFlRBMdcgFM+kQxWK9WALgtinhu4rKR74efbgjwXNoS9c
	j4bX/2qXsg1Yl4vE3n6rmr7ZCs8Q310pne8r8mAZAhLKQLKVdRJmqbFbB9Qt2LBGIzOVd/xnCUT
	RpKJ4fNL3Uu0oGF8E4kPlnqn+58lrmlZ6fcrSATzj7CowOtcx6TVQ69r5HfZGk0EcNX+OXC/eqm
	fOLcfi3uCbju+Y0knywpmtZCWx6r+1p0kl0JbMX+5h954dBxLhZfwbOf2XG1RHVLMbdpP5/j9yQ
	mx5WqJ/61Grf9xEb2Jx7KxnA0EzP1YKEJwa6P+ViUDfMHPCeUAYvEcK864A8/KouiNOHomEpVOJ
	S0d3KHi5Xv6nnO4VUr+f6VUgbbavNmUfqtG
X-Received: by 2002:a05:6000:2586:b0:460:684d:d565 with SMTP id ffacd0b85a97d-4606f255ab8mr16011008f8f.15.1781520530262;
        Mon, 15 Jun 2026 03:48:50 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1e4:992f:3ad2:4f2b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26f1cdsm34812464f8f.11.2026.06.15.03.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 03:48:49 -0700 (PDT)
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
Subject: [PATCH v3 2/5] clk: renesas: cpg-mssr: Implement dedicated MSTP delay logic for RZ/T2H LCDC and RTC
Date: Mon, 15 Jun 2026 11:48:42 +0100
Message-ID: <20260615104845.4122868-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615104845.4122868-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260615104845.4122868-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34003-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,renesas.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 77C18685768

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
v2->v3:
- No change

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


