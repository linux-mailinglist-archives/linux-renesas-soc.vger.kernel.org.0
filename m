Return-Path: <linux-renesas-soc+bounces-34212-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7X9UChU3NGoJRwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34212-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 20:21:09 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB3C6A21C6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 20:21:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=PCBLWfIr;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34212-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34212-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6F98A30766C9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 18:20:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90E2D36AB49;
	Thu, 18 Jun 2026 18:19:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773693612FE
	for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Jun 2026 18:19:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781806798; cv=none; b=bauIfCsRzhcZh0GMSctA4zojEcxW9ycVdm+slgeDhgz7ri8aZz2iCHJnCyH1pth63zOMVtU7VoJ6KCRrj6pR2L9om/u7VykhXjhGS7g5JpE5YerINYljGgyEP/lCVeY37F0Esuh3Am5xdmLR6jo/TvNS/fCY+5bA+5l6IkL5iYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781806798; c=relaxed/simple;
	bh=HoYpqivwGVANa/1JF5XBlbgNs/qwjN7jE8naqxHLyDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TUzJyyNwPeJjuZMPYWZDV8eJ3JrFFCvCVSr+iSF0D0EzVlDMaAwSmyaGQn5eg15m8wuiJ6Bcral06H/ZFzKjqh3iwuAYNM2bO18jYThxwelZDeCBDTjdojEhyrujZVozJdDn2RNzl6Y0lav2a+MOSgR0wPJgcHjp79/Avt/F/+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PCBLWfIr; arc=none smtp.client-ip=209.85.221.49
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-462bb734793so1020708f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Jun 2026 11:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781806794; x=1782411594; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JZfCSxnbcgYyMg1b6U2y2nuS3Se3N84xdsJLHyDbTLw=;
        b=PCBLWfIrA3NSAJECZaKmn+f7ERF0ZpxwCmzct7WbPmnLe7I2NBGkDDHeB8Z9HxHaNQ
         VDnDP8fJlmXXSp8j9HimGLcbm9PWcSr7zHUO0XUPC/m6iWpryE5LBWEOrRSpQauBYQfd
         oJCq05VHO5QGnWjG8GgRQkUABdTHpr3r58ZurEaUx4XVJjQ5L0mreaF/fFiJNWgnMnF+
         TaqJD1TZjx9Ul99XM5SPuyvrjwrEEVJiDUKakw3AtnUqJWsh86uW2zu5OlcCSQrTs15e
         MsiUPrRUuEe45t33axagJcdQIDxuhamoO8Td4U8HC6zJtXGzVQxiiG54VBhfa+MJpb3S
         qjpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781806794; x=1782411594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JZfCSxnbcgYyMg1b6U2y2nuS3Se3N84xdsJLHyDbTLw=;
        b=Gjd8u7jw/mK2cIci++FM5DVuGiA4HyfABdixHzgk+k4Xl4Yvagx8KYtncYSNWE0Etu
         7uWkrMbn+DYNPbKQ/PdYZEl2bruaYHjRl6L0+oIQ1POZe8r5JNWjpQ3GSraksg1aZily
         TAJa9AdF1cgO3dYZQvUacEl3Cs6uhJdQ7F/sb6cVo1LPE/MZB63NP+xrzAs6HNOhWJcI
         6fwOgM8TRtdz8VrGEJV2NIdTqgqNLT6pBG940P/4ML5OaH/aRhd6L0f9kouUn30jKHgm
         LLLQwrLop4GT7BOW8gfaMBPR9Ar7CzWJI5vFZYfP0mRGau1uoxZV3bFtb7P5UUjYwRjo
         DNQg==
X-Forwarded-Encrypted: i=1; AFNElJ/Qb3077t+e/ZJhf3+Z2hPnvyR8oC+hS3DT2SycXf0dbEu9hE5F7ZTiodBTydvKi3KSZ/BKn/a1qbUvwEJ+wyyLeQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQuh0qdrFyPx7yniOiyM05g5CqmIU6FZQ4a+UeSb9G93BrRoWM
	KThE8zokOTF5YoTG4lVP18hI98aYrVCwG2ZWx8xaTdWL+IpH9b3WFYW2
X-Gm-Gg: AfdE7cnxat//IuhHNAwIVpyeuBT7huuXZfr67938jOEoKjsxEdY50+Kv52wLg8AGn7f
	femCnnL6H4Ij+RhyOy08dmUzrs0aSyDfjurf6Hs9fFck8+LV4a5uUk/lVfcS6sdnyhcEnvFMLqT
	Ugq1glg4LhGuTM3GVynICCDQfORkBHN7x29j1EwAnJbLVSbU1IlGqERXWhnEEGgpSh71pHHpQT4
	AbSWEjAumBWp1ESbjI2erbVKvY/dPePcFqHo/GpJk8uFVBuoY4dPO1AA+li5nVU2Nd4RcjcnDMP
	m+mjVDROy4E+xsRdSae7V8eM2BBZjx+O/5B9BgOsEsDUcEneKrwi3RpVaBuF1J9no240qZQFIQI
	zmiRpyn+9blRRw4NiO/51eMHHCzEw8RinUf/b2tUApcgKcJyK6SYQbcLGhqcV2Ub70iw/xHyXp/
	YqtNKojN0ZX5KLoHfkXxC3e/0W75i2fIifuDHo4BU8v6k/eD5rHorebdVpQEg37Xl2EIzuLukUt
	OWO+BSqmQGtwPDgmK8fOfkbarI=
X-Received: by 2002:a5d:5f91:0:b0:464:f719:561c with SMTP id ffacd0b85a97d-46501e3a652mr988685f8f.36.1781806793851;
        Thu, 18 Jun 2026 11:19:53 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:3bf7:d534:a488:f67d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-465090c42e1sm869435f8f.11.2026.06.18.11.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 11:19:53 -0700 (PDT)
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
Subject: [PATCH v4 2/5] clk: renesas: cpg-mssr: Implement dedicated MSTP delay logic for RZ/T2H LCDC and RTC
Date: Thu, 18 Jun 2026 19:19:46 +0100
Message-ID: <20260618181949.3036280-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260618181949.3036280-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260618181949.3036280-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34212-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,bp.renesas.com:mid,glider.be:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3AB3C6A21C6

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
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3->v4:
- Added RB tag from Geert.

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


