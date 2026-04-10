Return-Path: <linux-renesas-soc+bounces-31110-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0BL7A1Wv2GljgwgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31110-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 10:05:41 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B8E3D3BF5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 10:05:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A6178301F2B0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 08:05:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE0943A63F1;
	Fri, 10 Apr 2026 08:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VgdHilzX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3B03A3E7B
	for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Apr 2026 08:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775808336; cv=none; b=HU5r9F6MpbDSdbye65+sPyLPsMEQ532i6vcYwBFusIDe2C7nu0oHTRRvmBM4vtakXLDmBCv8xDJDfTvZB2am/+5l84QgFHFWJPrmuMxohQfDBflBycegf94gP65vO+2xbIA/k0lnV+Wr4eDHfd9iaYZeTAp8SMeUlnBEJV78bpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775808336; c=relaxed/simple;
	bh=YiC0zOs6O90q4/FPkzw3mGwg8ejhtR+Z6tBOWwhcw+s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G0UPdCY5c090TtduIXRsG0/YGDNpV5SXIQ+t6KIGX0BQF4g0UEXrx0I7kGkRBw/hIIDZU1OGxj2SV4JTJWqU9ADF/AjGCyKK6iYkKhhYfvf26ePwjkQkH8PZwq8Gi9WqFmNL0WeQq7g+xOGsHgGRrpVoM5TEd6IXiLsVJPsXf0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VgdHilzX; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4888375f735so16965295e9.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Apr 2026 01:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775808333; x=1776413133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hHpfsnzzu+UOFyztPgbXvpWNz6C6DyMlHqqcUHYsTVA=;
        b=VgdHilzX+w/falVX31tlZ7avYi9MwaTraLeJbtDTO9wGm3/HZm9E0rdnw5FYamd20S
         zz5TIQiUMyTiFjR168XWd/tmHxSo2x7/SZITfENrUd33L9/zFq2SfiONPCPbN2dkctgy
         0wLKeBiZkBI3XT43cJ3fPQZLlLWuIBZsny2zcZ9mrlxfqU5bv/qxoIKfSsZ4q3y/z9nv
         VwOaC/h8mSxbD1kSC9DACFLiEsS/6zB038WuKq8sG0cgHtTof+vukSQ8ih4H/W8j6RHJ
         AZEi5kQQrrdBcIre9xr4RVXYPyuDNTlLOtze6x6XNqg1uu43WcIY9cPEsdfbpyqhoTLH
         Ul/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775808333; x=1776413133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hHpfsnzzu+UOFyztPgbXvpWNz6C6DyMlHqqcUHYsTVA=;
        b=oxVverMEhleVz4q1XWxhr/yOlneftdxGOIjHxFhqf+V5VhRzWwV3qIt03gnd3aaX2N
         AyM+dzyyWflysvvUn3i82uWCLfzFt/3g1qh8zWZ5bZ1ZWOiz1ro16ZC82q35y21sKwYa
         2Rqr199vNj2F7n7AFZmzhyhcxfSIZGl/ByE1JElMC4OZx2c2R2ZyajF73SyvGXWgTA2x
         7HrzhYXogOA+hXOq339GiAJKYMQllRKx+vhmlNZmKuxvSbC3L/hqZU069gt+LyWLIyuT
         GxjJXgzkjbmEIxaeSudEgsc7x/wYwCfasYrf8oHcRNb2rDcmyEQmhSuesdr5AfDO1VsR
         bg1g==
X-Forwarded-Encrypted: i=1; AJvYcCWri4vp3H88VFPlAiClhBxa/gL+moXa9aH2oFJX8Tf97B+BavuydqqWhi+bShF8lMT9laLJvrwnERnvGKLpOD92iA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVYCu2/p99WiPyiZ/hPQnDS/c7WtVWdJcFNEOpCg6WBCUrbK9q
	GnXHAAj1gTzYNBeTX0MvARJ9OOPLuxpAn4UQhOvqNgJSeMG9q//fUmgx
X-Gm-Gg: AeBDietr1ehHxSATKRW0pqgS8k94PApVd+DTyyChAcPmV9kXlPn600aKRFisZyGJl0a
	gjPEBmOtxZMDrJzxC2AW32aDQUskaGe3+lSjmCyeWfH2h7vuq7O1AHSRPD8bggViWtmSsvTi5dw
	OBHqG/FMaoAfWH4Tk0BByvv3av3p/pHpTG9np/HuSZ9u2v9+1hlv0CXpexMWuQEGrNqTTTeT1Oe
	xmfJQ/P17s0Ak6H3e9ZMGSgNLuIKyTOR24UUfyotvH/F2l7HE+nJKUDrB3qI9JGYFrjSJHsnBb7
	vmtwbw7OLRJi2yc1S5mYnOQqHBND3M8XQ6KNs3m03E6X/9bMKYigLdlTKESXhehmnKynB/99J/X
	ideMYyknEDfLcKGWQAdY8SgTVBjfuqDlGlNTIHRbQm/69Fhx8+9/9BQ8xbVfx5JtEe24bhIrbrl
	3NwRB4ugw3rBubBltujHABbZQnSCDgbyY6900BMsm0q0WQpE3wco87V91ik2lfU6hkCJJzQr2RG
	7k2nP3zUh37a0ZzqD8GnRLfuP82slbQVoTdiMtaWAz7jHT3
X-Received: by 2002:a05:600c:3047:b0:488:d6eb:e635 with SMTP id 5b1f17b1804b1-488d6ebe7ebmr13526205e9.12.1775808332681;
        Fri, 10 Apr 2026 01:05:32 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:a73b:688a:4297:c5fd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d67ce3e4sm29950375e9.5.2026.04.10.01.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 01:05:32 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: linux-spi@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/3] spi: rzv2h-rspi: Fix invalid SPR=0/BRDV=0 clock configuration
Date: Fri, 10 Apr 2026 09:05:16 +0100
Message-ID: <20260410080517.2405700-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410080517.2405700-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260410080517.2405700-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31110-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: E8B8E3D3BF5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The combination of SPR=0 and BRDV=0 results in the minimum division
ratio of 2, producing the maximum possible bit rate for a given clock
source. This combination is not supported in two cases:

- On RZ/G3E, RZ/G3L, RZ/V2H(P) and RZ/V2N, RSPI_n_TCLK is fixed at
  200MHz, which would yield 100Mbps. The next hardware manual update
  will explicitly state that since the maximum frequency of the
  RSPICKn clock signal is 50MHz, settings with N=0 and n=0 resulting
  in 100Mbps are prohibited.

- On RZ/T2H and RZ/N2H, when PCLK (125MHz) is used as the clock
  source, SPR=0 and BRDV=0 is explicitly listed as unsupported in
  the hardware manual (Table 36.7).

Skip the SPR=0/BRDV=0 combination in rzv2h_rspi_find_rate_fixed() to
prevent the driver from selecting an invalid clock configuration on the
affected SoCs.

Additionally, remove the now redundant RSPI_SPBR_SPR_PCLK_MIN define
which was previously set to 1 to work around the PCLK restriction, but
was overly broad as it incorrectly blocked valid combinations such as
SPR=0/BRDV=1 (31.25Mbps on PCLK=125MHz).

Fixes: 8b61c8919dff ("spi: Add driver for the RZ/V2H(P) RSPI IP")
Fixes: 1ce3e8adc7d0 ("spi: rzv2h-rspi: add support for using PCLK for transfer clock")
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/spi/spi-rzv2h-rspi.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/spi/spi-rzv2h-rspi.c b/drivers/spi/spi-rzv2h-rspi.c
index ad59944c773e..602d4a36b44c 100644
--- a/drivers/spi/spi-rzv2h-rspi.c
+++ b/drivers/spi/spi-rzv2h-rspi.c
@@ -50,7 +50,6 @@
 
 /* Register SPBR */
 #define RSPI_SPBR_SPR_MIN	0
-#define RSPI_SPBR_SPR_PCLK_MIN	1
 #define RSPI_SPBR_SPR_MAX	255
 
 /* Register SPCMD */
@@ -535,6 +534,17 @@ static void rzv2h_rspi_find_rate_fixed(struct clk *clk, u32 hz,
 	for (brdv = RSPI_SPCMD_BRDV_MIN; brdv <= RSPI_SPCMD_BRDV_MAX; brdv++) {
 		spr = DIV_ROUND_UP(clk_rate, hz * (1 << (brdv + 1)));
 		spr--;
+		/*
+		 * Skip SPR=0 and BRDV=0 as it is not a valid combination:
+		 * - On RZ/G3E, RZ/G3L, RZ/V2H(P) and RZ/V2N, RSPI_n_TCLK is
+		 *   fixed at 200MHz and SPR=0 and BRDV=0 results in the maximum
+		 *   bit rate of 100Mbps which is prohibited.
+		 * - On RZ/T2H and RZ/N2H, when PCLK (125MHz) is used as
+		 *   the clock source, SPR=0 and BRDV=0 is explicitly listed
+		 *   as unsupported in the hardware manual (Table 36.7).
+		 */
+		if (!spr && !brdv)
+			continue;
 		if (spr >= spr_min && spr <= spr_max)
 			goto clock_found;
 	}
@@ -568,12 +578,8 @@ static u32 rzv2h_rspi_setup_clock(struct rzv2h_rspi_priv *rspi, u32 hz)
 	rspi->info->find_tclk_rate(rspi->tclk, hz, RSPI_SPBR_SPR_MIN,
 				   RSPI_SPBR_SPR_MAX, &best_clock);
 
-	/*
-	 * T2H and N2H can also use PCLK as a source, which is 125MHz, but not
-	 * when both SPR and BRDV are 0.
-	 */
 	if (best_clock.error && rspi->info->find_pclk_rate)
-		rspi->info->find_pclk_rate(rspi->pclk, hz, RSPI_SPBR_SPR_PCLK_MIN,
+		rspi->info->find_pclk_rate(rspi->pclk, hz, RSPI_SPBR_SPR_MIN,
 					   RSPI_SPBR_SPR_MAX, &best_clock);
 
 	if (!best_clock.clk_rate)
-- 
2.53.0


