Return-Path: <linux-renesas-soc+bounces-30772-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFlPDfSZzmkBowYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30772-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 18:31:48 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 842DE38BE6A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 18:31:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6862E30D01F8
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Apr 2026 16:26:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F84A349B1C;
	Thu,  2 Apr 2026 16:25:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB0BB3F1654;
	Thu,  2 Apr 2026 16:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775147147; cv=none; b=qFa0Oe3DizGbrypYHpwZUvfxeOjcMuOZDZxU24yN9nLCyPTZv/IuV7Ljf+jHJp+k+mQPEpM6LTrTdMlTwUFQoywx/FwYawrmZ7H4OhrDCtjf4hKZXN4mhHdLA+aJxhUBRUvm12uk7Zxzld9XOxgVZ9r6SPVueS1O2W2zJtt7zHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775147147; c=relaxed/simple;
	bh=chkngnwmifKuH3qIaJOHEPi8dqqj/RG3JxKDKqOwA9g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KoxVVHN4ZZfisEHs8c6I4gignJ3c+VWhpUTGGfXSKQMuiXVWfbR9SKRLe5vBzNYq5x262Xb/9z5ggTTfOMO6JOxz0/bK4biMDg8mE/90RPthJf78MSM5BwbyKKMbtSAlOrg4eRa2iXxG0IQEBfuOGIpRcIJjdJclIMAhb6wHoks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: +lnWMd8LQFCra/wVT/b7tQ==
X-CSE-MsgGUID: Y5WFgv+cQpiWbMUOtU+/eQ==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 03 Apr 2026 01:25:41 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.38])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 76D4A401911E;
	Fri,  3 Apr 2026 01:25:36 +0900 (JST)
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	john.madieu@gmail.com,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCh v3 06/14] ASoC: rsnd: Add RZ/G3E DMA address calculation support
Date: Thu,  2 Apr 2026 18:24:28 +0200
Message-ID: <20260402162436.12059-7-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260402162436.12059-1-john.madieu.xa@bp.renesas.com>
References: <20260402162436.12059-1-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30772-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[renesas.com,kernel.org,gmail.com,glider.be];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,perex.cz,suse.com,gmail.com,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.873];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 842DE38BE6A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

RZ/G3E has different DMA register base addresses and offset
calculations compared to R-Car platforms.

Add dedicated rsnd_rzg3e_dma_addr() function with dispatch from
rsnd_dma_addr(), following the existing per-generation pattern.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v3: No changes

v2:
 - Split into separate patches: one for DMA address support, one for
   audmac-pp clock/reset management
 - Replace ternary macro wrappers with dedicated rsnd_rzg3e_dma_addr()
   function dispatched from rsnd_dma_addr(), following existing
   rsnd_gen4_dma_addr() pattern

 sound/soc/renesas/rcar/dma.c | 137 +++++++++++++++++++++++++++++------
 1 file changed, 113 insertions(+), 24 deletions(-)

diff --git a/sound/soc/renesas/rcar/dma.c b/sound/soc/renesas/rcar/dma.c
index 0afe4636b005..5b63206361ef 100644
--- a/sound/soc/renesas/rcar/dma.c
+++ b/sound/soc/renesas/rcar/dma.c
@@ -496,7 +496,35 @@ static struct rsnd_mod_ops rsnd_dmapp_ops = {
  *	SSIU: 0xec541000 / 0xec100000 / 0xec100000 / 0xec400000 / 0xec400000
  *	SCU : 0xec500000 / 0xec000000 / 0xec004000 / 0xec300000 / 0xec304000
  *	CMD : 0xec500000 /            / 0xec008000                0xec308000
+ *
+ *	ex) G3E case
+ *	      mod        / DMAC in    / DMAC out   / DMAC PP in / DMAC pp out
+ *	SSI : 0x13C31000 / 0x13C40000 / 0x13C40000
+ *	SSIU: 0x13C31000 / 0x13C40000 / 0x13C40000 / 0xEC400000 / 0xEC400000
+ *	SCU : 0x13C00000 / 0x13C10000 / 0x13C14000 / 0xEC300000 / 0xEC304000
+ *	CMD : 0x13C00000 /            / 0x13C18000                0xEC308000
  */
+
+/* RZ/G3E DMA address macros */
+#define RDMA_SSI_I_N_G3E(addr, i)	(addr ##_reg + 0x0000F000 + (0x1000 * i))
+#define RDMA_SSI_O_N_G3E(addr, i)	(addr ##_reg + 0x0000F000 + (0x1000 * i))
+
+#define RDMA_SSIU_I_N_G3E(addr, i, j)	(addr ##_reg + 0x0000F000 + (0x1000 * (i)) + (((j) / 4) * 0xA000) + (((j) % 4) * 0x400) - (0x4000 * ((i) / 9) * ((j) / 4)))
+#define RDMA_SSIU_O_N_G3E(addr, i, j)	RDMA_SSIU_I_N_G3E(addr, i, j)
+
+#define RDMA_SSIU_I_P_G3E(addr, i, j)	(addr ##_reg + 0xD87CF000 + (0x1000 * (i)) + (((j) / 4) * 0xA000) + (((j) % 4) * 0x400) - (0x4000 * ((i) / 9) * ((j) / 4)))
+#define RDMA_SSIU_O_P_G3E(addr, i, j)	RDMA_SSIU_I_P_G3E(addr, i, j)
+
+#define RDMA_SRC_I_N_G3E(addr, i)	(addr ##_reg + 0x00010000 + (0x400 * i))
+#define RDMA_SRC_O_N_G3E(addr, i)	(addr ##_reg + 0x00014000 + (0x400 * i))
+
+#define RDMA_SRC_I_P_G3E(addr, i)	(addr ##_reg + 0xD8700000 + (0x400 * i))
+#define RDMA_SRC_O_P_G3E(addr, i)	(addr ##_reg + 0xD8704000 + (0x400 * i))
+
+#define RDMA_CMD_O_N_G3E(addr, i)	(addr ##_reg + 0x00018000 + (0x400 * i))
+#define RDMA_CMD_O_P_G3E(addr, i)	(addr ##_reg + 0xD8708000 + (0x400 * i))
+
+/* R-Car DMA address macros */
 #define RDMA_SSI_I_N(addr, i)	(addr ##_reg - 0x00300000 + (0x40 * i) + 0x8)
 #define RDMA_SSI_O_N(addr, i)	(addr ##_reg - 0x00300000 + (0x40 * i) + 0xc)
 
@@ -515,15 +543,18 @@ static struct rsnd_mod_ops rsnd_dmapp_ops = {
 #define RDMA_CMD_O_N(addr, i)	(addr ##_reg - 0x004f8000 + (0x400 * i))
 #define RDMA_CMD_O_P(addr, i)	(addr ##_reg - 0x001f8000 + (0x400 * i))
 
+struct rsnd_dma_addr {
+	dma_addr_t out_addr;
+	dma_addr_t in_addr;
+};
+
 static dma_addr_t
-rsnd_gen2_dma_addr(struct rsnd_dai_stream *io,
-		   struct rsnd_mod *mod,
-		   int is_play, int is_from)
+rsnd_dma_addr_lookup(struct rsnd_dai_stream *io,
+		     struct rsnd_mod *mod,
+		     const struct rsnd_dma_addr tbl[3][2][3],
+		     int is_play, int is_from)
 {
-	struct rsnd_priv *priv = rsnd_io_to_priv(io);
-	struct device *dev = rsnd_priv_to_dev(priv);
-	phys_addr_t ssi_reg = rsnd_gen_get_phy_addr(priv, RSND_BASE_SSI);
-	phys_addr_t src_reg = rsnd_gen_get_phy_addr(priv, RSND_BASE_SCU);
+	struct device *dev = rsnd_priv_to_dev(rsnd_io_to_priv(io));
 	int is_ssi = !!(rsnd_io_to_mod_ssi(io) == mod) ||
 		     !!(rsnd_io_to_mod_ssiu(io) == mod);
 	int use_src = !!rsnd_io_to_mod_src(io);
@@ -531,11 +562,77 @@ rsnd_gen2_dma_addr(struct rsnd_dai_stream *io,
 		      !!rsnd_io_to_mod_mix(io) ||
 		      !!rsnd_io_to_mod_ctu(io);
 	int id = rsnd_mod_id(mod);
+
+	/* it shouldn't happen */
+	if (use_cmd && !use_src)
+		dev_err(dev, "DVC is selected without SRC\n");
+
+	/* use SSIU or SSI? */
+	if (is_ssi && rsnd_ssi_use_busif(io))
+		is_ssi++;
+
+	dev_dbg(dev, "dma%d addr : is_ssi=%d use_src=%d use_cmd=%d\n",
+		id, is_ssi, use_src, use_cmd);
+
+	return is_from ?
+		tbl[is_ssi][is_play][use_src + use_cmd].out_addr :
+		tbl[is_ssi][is_play][use_src + use_cmd].in_addr;
+}
+
+static dma_addr_t
+rsnd_rzg3e_dma_addr(struct rsnd_dai_stream *io,
+		    struct rsnd_mod *mod, int is_play, int is_from)
+{
+	struct rsnd_priv *priv = rsnd_io_to_priv(io);
+	phys_addr_t ssi_reg = rsnd_gen_get_phy_addr(priv, RSND_BASE_SSI);
+	phys_addr_t src_reg = rsnd_gen_get_phy_addr(priv, RSND_BASE_SCU);
+	int id    = rsnd_mod_id(mod);
 	int busif = rsnd_mod_id_sub(rsnd_io_to_mod_ssiu(io));
-	struct dma_addr {
-		dma_addr_t out_addr;
-		dma_addr_t in_addr;
-	} dma_addrs[3][2][3] = {
+	const struct rsnd_dma_addr tbl[3][2][3] = {
+		/* SRC */
+		/* Capture */
+		{{{ 0,				0, },
+		  { RDMA_SRC_O_N_G3E(src, id),	RDMA_SRC_I_P_G3E(src, id) },
+		  { RDMA_CMD_O_N_G3E(src, id),	RDMA_SRC_I_P_G3E(src, id) } },
+		 /* Playback */
+		 {{ 0,				0 },
+		  { RDMA_SRC_O_P_G3E(src, id),	RDMA_SRC_I_N_G3E(src, id) },
+		  { RDMA_CMD_O_P_G3E(src, id),	RDMA_SRC_I_N_G3E(src, id) } }
+		},
+		/* SSI */
+		/* Capture */
+		{{{ RDMA_SSI_O_N_G3E(ssi, id),			0 },
+		  { RDMA_SSIU_O_P_G3E(ssi, id, busif),		0 },
+		  { RDMA_SSIU_O_P_G3E(ssi, id, busif),		0 } },
+		 /* Playback */
+		 {{ 0,			RDMA_SSI_I_N_G3E(ssi, id) },
+		  { 0,			RDMA_SSIU_I_P_G3E(ssi, id, busif) },
+		  { 0,			RDMA_SSIU_I_P_G3E(ssi, id, busif) } }
+		},
+		/* SSIU */
+		/* Capture */
+		{{{ RDMA_SSIU_O_N_G3E(ssi, id, busif),		0 },
+		  { RDMA_SSIU_O_P_G3E(ssi, id, busif),		0 },
+		  { RDMA_SSIU_O_P_G3E(ssi, id, busif),		0 } },
+		 /* Playback */
+		 {{ 0,			RDMA_SSIU_I_N_G3E(ssi, id, busif) },
+		  { 0,			RDMA_SSIU_I_P_G3E(ssi, id, busif) },
+		  { 0,			RDMA_SSIU_I_P_G3E(ssi, id, busif) } } },
+	};
+
+	return rsnd_dma_addr_lookup(io, mod, tbl, is_play, is_from);
+}
+
+static dma_addr_t
+rsnd_gen2_dma_addr(struct rsnd_dai_stream *io,
+		   struct rsnd_mod *mod, int is_play, int is_from)
+{
+	struct rsnd_priv *priv = rsnd_io_to_priv(io);
+	phys_addr_t ssi_reg = rsnd_gen_get_phy_addr(priv, RSND_BASE_SSI);
+	phys_addr_t src_reg = rsnd_gen_get_phy_addr(priv, RSND_BASE_SCU);
+	int id    = rsnd_mod_id(mod);
+	int busif = rsnd_mod_id_sub(rsnd_io_to_mod_ssiu(io));
+	const struct rsnd_dma_addr tbl[3][2][3] = {
 		/* SRC */
 		/* Capture */
 		{{{ 0,				0 },
@@ -574,20 +671,10 @@ rsnd_gen2_dma_addr(struct rsnd_dai_stream *io,
 	 * out of calculation rule
 	 */
 	if ((id == 9) && (busif >= 4))
-		dev_err(dev, "This driver doesn't support SSI%d-%d, so far",
-			id, busif);
-
-	/* it shouldn't happen */
-	if (use_cmd && !use_src)
-		dev_err(dev, "DVC is selected without SRC\n");
-
-	/* use SSIU or SSI ? */
-	if (is_ssi && rsnd_ssi_use_busif(io))
-		is_ssi++;
+		dev_err(rsnd_priv_to_dev(priv),
+			"This driver doesn't support SSI%d-%d, so far", id, busif);
 
-	return (is_from) ?
-		dma_addrs[is_ssi][is_play][use_src + use_cmd].out_addr :
-		dma_addrs[is_ssi][is_play][use_src + use_cmd].in_addr;
+	return rsnd_dma_addr_lookup(io, mod, tbl, is_play, is_from);
 }
 
 /*
@@ -636,6 +723,8 @@ static dma_addr_t rsnd_dma_addr(struct rsnd_dai_stream *io,
 		return 0;
 	else if (rsnd_is_gen4(priv))
 		return rsnd_gen4_dma_addr(io, mod, is_play, is_from);
+	else if (rsnd_is_rzg3e(priv))
+		return rsnd_rzg3e_dma_addr(io, mod, is_play, is_from);
 	else
 		return rsnd_gen2_dma_addr(io, mod, is_play, is_from);
 }
-- 
2.25.1


