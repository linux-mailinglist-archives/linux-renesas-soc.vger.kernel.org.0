Return-Path: <linux-renesas-soc+bounces-35163-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xWC2HqcmVWoykgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35163-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 19:55:51 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D29874E32B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 19:55:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=M8x+REp1;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35163-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35163-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C058631490AB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 17:52:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83AC0356754;
	Mon, 13 Jul 2026 17:52:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5568E351C04
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 17:52:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783965137; cv=none; b=Ge1D2DS4yFIKWL9VaAhK0wYd+F0efK/QvSAFNpmpaznQdkAcGl6ySiiwPxJ/4KWk5/d/1yOkSDDMtPU7yVg/0EV8X42J8ICZQEyRGEcOBSSp8PFccD5kfKPQb1Gy04NpGfnfFRLvV2VjJyT8m2gGQeE8RnhSNoJ8TxuV8rFs7H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783965137; c=relaxed/simple;
	bh=F53C1iqXRlAlwJORWbbo5ELuNRayWLZ/7gJR9Tgg2wM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VYGxtT1069tYeNh5HyLojdI2bcvcSXBCW4oNvMaR7y856G+DMZBJ1mTJQmIKSNrkIcczonHhDPEhmYqXA8shgVYb7hLrTYIl/mzdkxZwkZ+oWKrrEsTxnvE9ZW8px2EoDkRIYer8uOCNCxzIPmHd1k64e4hf0QG5QIIaTnXxDW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M8x+REp1; arc=none smtp.client-ip=209.85.221.41
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so3123250f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 10:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783965132; x=1784569932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r8hQtV9FPcGQLOAT5ebUGqKZF7X40ZDKPlKwg5vLNog=;
        b=M8x+REp1+4vmBxJSpgY4JKdSxcYUDGtINh2IVxShgmFKfrpx6w5uLxr8VpdpTsUW4M
         9+VLpNTs8S78bnljLbfxoWZfDsv40tV7EwkDD0NnHp7dPXSs1clrhA1AbtLkQ5yw9Nyc
         09//tn7+7Rx25rbDAbLp9Ihk7TbKS+WrC1zm7uLACpijE6xMtpeSTUExm3dJPcOT/U51
         K4kTZyykHefOgoAkncHybHXmDmaworQDt9XI72UakQEV2d4y6I1ttil9+rzGOWKi3gQm
         ubKMG4XdN+2O9ZkYcJ+S8+APO4GG9fobHHtKjE2Hs/hW4Qu4dvXMgBPiusynqRpCcwaf
         SwDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783965132; x=1784569932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r8hQtV9FPcGQLOAT5ebUGqKZF7X40ZDKPlKwg5vLNog=;
        b=J6pZnFJHgOl9G9VUEWiwp6RQC2Y1+ErcK/1i9URiaIBdtMMxZSIwhK/B02uvNX7zwD
         Rbp/RpcU/iLT1LZ404XYVRk83UjIxHpEBAae4oLRvpIj42h9IDh2hpl8+R3adiaNMky0
         LjnGh2Wd6XH8ogr3h6B1avCJXcy/sPkvSEH/UoWmu68tk8Vz9d7trwMJ7RuQlHjSanbd
         ryXIwPYgpkIOeLrxDJIOGgJgTFly5nFzpIRKDodv/AoD443CGXpLwa41EdxoqIQdaxh5
         Q3jb/724haDtxoWbxq75UM1/o83mJCzkmeqXqLXdNHnqVceW83U6rfEJH1UAuqs2sZKv
         Ct0Q==
X-Forwarded-Encrypted: i=1; AHgh+RqIvFg6UenHdhpphFzuBnYGKB+MkKWXPw6iAAOwHxrO1oXmgIYc3DGZfX28wMpu6W6hLrvHXDYWGDqVNypdbC479Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxef7WqBxuySEabS7TbhU8+g1LjVlgPp7wNq4iJK7ndFoV+ErI+
	wgf7zdVVV6hX3bt8nY2J9ouOHUcUcwYIkLZgOXt17MrESy/4r4+w/xNY
X-Gm-Gg: AfdE7cm5u7eshXu171vFjIbOPvwlBGSEZL20OqUTzVR4vrXMV4hma5Clab0pYdm/er+
	WPbgbeD16ZJN/VP1TkXbdNlAQ0a2aNDXYrI1+J/eZZ4jd/FU962L/8HRTfknLYcz8Toj+j9O7mA
	osJZcRDJ6625A646tEYYSuueiGjhdgKmgnCtU7gKKozfH1Hr62VjCAUIIORicHF3Hnxu9nmg5xG
	/5tygDyfL8AqJ7TlsjfqXs/oy6yiXsLiC+KQ3kNK/l9/MCcIFTGEVtfWHQ8v9PglCt4Ibmc2bt9
	rY/KZMSHEdCtfKGmv98lQdTwcxRXDk6x2s7tVXUKXsBEXk7Pz1A5Cz+9CSjoH8Dijmgk+5mQjOT
	+vJn/oHHzlyG0H6XQk89bWuxs5nz6RYlVIIypSrwCkQ/9ffTRBImq8UP4+Xx+aIygsruuVCos73
	az20XY+ODJxJlwUwqaM6OoRTCSvfAybJbn0ertd/BFJaM3NBerc4sgAvSqgz4=
X-Received: by 2002:a05:6000:2310:b0:47d:ef38:260 with SMTP id ffacd0b85a97d-47f2dcbf3b7mr11365717f8f.27.1783965131808;
        Mon, 13 Jul 2026 10:52:11 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:c899:4fec:2bdb:b719])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464d6fa7sm1011037f8f.37.2026.07.13.10.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 10:52:11 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulf Hansson <ulfh@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v20 11/12] mmc: renesas_sdhi: Add RZ/G3L HS400 support
Date: Mon, 13 Jul 2026 18:51:52 +0100
Message-ID: <20260713175159.138334-12-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713175159.138334-1-biju.das.jz@bp.renesas.com>
References: <20260713175159.138334-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-35163-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:ulfh@kernel.org,m:biju.das.jz@bp.renesas.com,m:linux-mmc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:geert+renesas@glider.be,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:wsa@sang-engineering.com,m:geert@glider.be,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,glider.be,gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1D29874E32B

From: Biju Das <biju.das.jz@bp.renesas.com>

Add HS400 support for the RZ/G3L SoC.

The RZ/G3L requires a dedicated HS400 enable register (SDm_SCC_HS400MODE2
at offset 0x020) in addition to the existing TMPPORT2 path used by R-Car.
Introduce a TMIO_MMC_HS400MODE2 flag (bit 16) to identify controllers
that require this second register.

When this flag is set, renesas_sdhi_hs400_complete() additionally sets
HS400EN2 in HS400MODE2, and renesas_sdhi_reset_hs400_mode() clears it on
exit. During tuning, when both TMIO_MMC_TUNING_DELAY and
TMIO_MMC_HS400MODE2 are set, the lower 16 bits of TMPPORT2 (TMPOUT) are
masked off while preserving the upper bits, replacing the previous
unconditional write of zero.

Enable the TMIO_MMC_HS400MODE2 flag in of_data_rzg3l to complete HS400
support for the RZ/G3L SoC.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v19->v20:
 * No change.
v18->v19:
 * Updated commit description.
 * Fixed extra space in HS400MODE2 comment block.
 * Updated the comment HS400mode2->HS400MODE2.
 * Dropped the updation of clk handling as it is taken care in
   previous patches.
v18:
 * New patch.
---
 drivers/mmc/host/renesas_sdhi_core.c          | 21 +++++++++++++++++--
 drivers/mmc/host/renesas_sdhi_internal_dmac.c |  3 ++-
 include/linux/platform_data/tmio.h            |  3 +++
 3 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 57c7ec5424b5..4cab7a85d517 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -292,6 +292,7 @@ static int renesas_sdhi_card_busy(struct mmc_host *mmc)
 #define SH_MOBILE_SDHI_SCC_TMPPORT5	0x018
 #define SH_MOBILE_SDHI_SCC_TMPPORT6	0x01A
 #define SH_MOBILE_SDHI_SCC_TMPPORT7	0x01C
+#define RZG3L_SDHI_SCC_HS400MODE2	0x020
 #define RZG3L_SDHI_SCC_HWADJ4		0x022
 
 #define SH_MOBILE_SDHI_SCC_DTCNTL_TAPEN		BIT(0)
@@ -324,6 +325,7 @@ static int renesas_sdhi_card_busy(struct mmc_host *mmc)
 #define SH_MOBILE_SDHI_SCC_TMPPORT_DISABLE_WP_CODE	0xa5000000
 #define SH_MOBILE_SDHI_SCC_TMPPORT_CALIB_CODE_MASK	0x1f
 #define SH_MOBILE_SDHI_SCC_TMPPORT_MANUAL_MODE		BIT(7)
+#define RZG3L_SDHI_SCC_HS400MODE2_HS400EN2		BIT(0)
 
 static inline u32 sd_scc_read32(struct tmio_mmc_host *host,
 				struct renesas_sdhi *priv, int addr)
@@ -459,6 +461,10 @@ static void renesas_sdhi_hs400_complete(struct mmc_host *mmc)
 			host->pdata->osel_tmpout) |
 			sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2));
 
+	if (host->pdata->flags & TMIO_MMC_HS400MODE2)
+		sd_scc_write32(host, priv, RZG3L_SDHI_SCC_HS400MODE2,
+			       RZG3L_SDHI_SCC_HS400MODE2_HS400EN2);
+
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_DTCNTL,
 		       SH_MOBILE_SDHI_SCC_DTCNTL_TAPEN |
 		       sd_scc_read32(host, priv,
@@ -600,6 +606,9 @@ static void renesas_sdhi_reset_hs400_mode(struct tmio_mmc_host *host,
 			 host->pdata->osel_tmpout) &
 			sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2));
 
+	if (host->pdata->flags & TMIO_MMC_HS400MODE2)
+		sd_scc_write32(host, priv, RZG3L_SDHI_SCC_HS400MODE2, 0x0);
+
 	if (sdhi_has_quirk(priv, hs400_calib_table) || sdhi_has_quirk(priv, hs400_bad_taps))
 		renesas_sdhi_adjust_hs400_mode_disable(host);
 
@@ -757,8 +766,16 @@ static int renesas_sdhi_execute_tuning(struct mmc_host *mmc, u32 opcode)
 	if (!priv->tap_num)
 		return 0; /* Tuning is not supported */
 
-	if ((host->pdata->flags & TMIO_MMC_TUNING_DELAY) && priv->tap_num == 8)
-		sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2, 0);
+	if ((host->pdata->flags & TMIO_MMC_TUNING_DELAY) && priv->tap_num == 8) {
+		u32 val = 0;
+
+		if (host->pdata->flags & TMIO_MMC_HS400MODE2) {
+			val = sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2);
+			val &= ~GENMASK(15, 0); /* TMPOUT MASK */
+		}
+
+		sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2, val);
+	}
 
 	if (priv->tap_num * 2 >= sizeof(priv->taps) * BITS_PER_BYTE) {
 		dev_err(&host->pdev->dev,
diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index 6a1b59d2e837..4000673ed7f8 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -174,7 +174,8 @@ static const struct renesas_sdhi_of_data of_data_rzg3l = {
 	.tmio_flags	= TMIO_MMC_HAS_IDLE_WAIT | TMIO_MMC_CLK_ACTUAL |
 			  TMIO_MMC_HAVE_CBSY | TMIO_MMC_MIN_RCAR2 |
 			  TMIO_MMC_64BIT_DATA_PORT | TMIO_MMC_TUNING_DELAY |
-			  TMIO_MMC_INTERNAL_DIVIDER | TMIO_MMC_HWADJ,
+			  TMIO_MMC_INTERNAL_DIVIDER | TMIO_MMC_HWADJ |
+			  TMIO_MMC_HS400MODE2,
 	.capabilities	= MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ |
 			  MMC_CAP_CMD23 | MMC_CAP_WAIT_WHILE_BUSY,
 	.capabilities2	= MMC_CAP2_NO_WRITE_PROTECT | MMC_CAP2_MERGE_CAPABLE,
diff --git a/include/linux/platform_data/tmio.h b/include/linux/platform_data/tmio.h
index 6443ba01c723..8a5dc18d43da 100644
--- a/include/linux/platform_data/tmio.h
+++ b/include/linux/platform_data/tmio.h
@@ -59,6 +59,9 @@
 /* Some controllers have hw adjustment delay */
 #define TMIO_MMC_HWADJ			BIT(15)
 
+/* Some controllers have HS400MODE2 */
+#define TMIO_MMC_HS400MODE2		BIT(16)
+
 struct tmio_mmc_data {
 	void				*chan_priv_tx;
 	void				*chan_priv_rx;
-- 
2.43.0


