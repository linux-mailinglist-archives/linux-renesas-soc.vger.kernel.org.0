Return-Path: <linux-renesas-soc+bounces-31060-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4JujCHJs12myNggAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31060-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Apr 2026 11:08:02 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DDF3C8350
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Apr 2026 11:08:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9446130786DB
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Apr 2026 09:04:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97A643A9625;
	Thu,  9 Apr 2026 09:04:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A4293A875D;
	Thu,  9 Apr 2026 09:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775725457; cv=none; b=MWMloGfCPuDFgokX6Kp2/y+pICMsjf/LGSA/In1qQwAhcCaN/NTtOaOJNanlabeMsowhJKG99pHTa6PmM4LUWYmyZIOefdAmMzJPcIwt4yG24c+oq3Or4RlVFDfpA7Tdxh0DgM8OxwCSkHorkYKRGppebEqLA3c1Zy7JsQ/mFPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775725457; c=relaxed/simple;
	bh=j+e2gtcNDn0Tjdt1t8Q0/HqIxNs38EKQWCTBged4THs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KwOjrqmcA2xd0QJG1QoO+j4PfBpIhmvOa401XfTf3o1w4W589gbzoAAuRLhSNqjEqiFyeTsmmwpqPbs/I8J2ufs20WAnL03OpKAtYceJDhefQ5a7/rJhVvHBlTln6lBLVAUyfNew0IJxv4JJiHp7AvRI9PN1VnrRKgcTrQr9zYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: x2ONObH+ThK5LlhKk0bE2Q==
X-CSE-MsgGUID: cNvcBCwMQS2zNf22aRdlFw==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 09 Apr 2026 18:04:14 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.218])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 64F944015D82;
	Thu,  9 Apr 2026 18:04:08 +0900 (JST)
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
Subject: [PATCH v4 04/12] ASoC: rsnd: Add RZ/G3E SoC probing and register map
Date: Thu,  9 Apr 2026 11:02:53 +0200
Message-ID: <20260409090302.2243305-5-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409090302.2243305-1-john.madieu.xa@bp.renesas.com>
References: <20260409090302.2243305-1-john.madieu.xa@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31060-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,perex.cz,suse.com,gmail.com,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	FREEMAIL_TO(0.00)[renesas.com,kernel.org,gmail.com,glider.be];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.605];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 90DDF3C8350
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

RZ/G3E audio subsystem has a different register layout compared to
R-Car Gen2/Gen3/Gen4, as described below:

- Different base address organization (SCU, ADG, SSIU, SSI as
  separate regions accessed by name)
- Additional registers: AUDIO_CLK_SEL3, SSI_MODE3, SSI_CONTROL2
- Different register offsets within each region

Add RZ/G3E SoC's audio subsystem register layouts and probe support.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:
 
v4:
 - Fix RSND_SOC_MASK to (0xF << 4) to avoid overlap with RSND_RZ_MASK
 - Add comment documenting flag nibble layout
v3: No changes
v2: No changes

 sound/soc/renesas/rcar/core.c |   1 +
 sound/soc/renesas/rcar/gen.c  | 180 ++++++++++++++++++++++++++++++++++
 sound/soc/renesas/rcar/rsnd.h |  26 ++++-
 3 files changed, 204 insertions(+), 3 deletions(-)

diff --git a/sound/soc/renesas/rcar/core.c b/sound/soc/renesas/rcar/core.c
index 28467e45acab..4544791f3883 100644
--- a/sound/soc/renesas/rcar/core.c
+++ b/sound/soc/renesas/rcar/core.c
@@ -107,6 +107,7 @@ static const struct of_device_id rsnd_of_match[] = {
 	{ .compatible = "renesas,rcar_sound-gen4", .data = (void *)RSND_GEN4 },
 	/* Special Handling */
 	{ .compatible = "renesas,rcar_sound-r8a77990", .data = (void *)(RSND_GEN3 | RSND_SOC_E) },
+	{ .compatible = "renesas,r9a09g047-sound", .data = (void *)(RSND_RZ3 | RSND_RZG3E) },
 	{},
 };
 MODULE_DEVICE_TABLE(of, rsnd_of_match);
diff --git a/sound/soc/renesas/rcar/gen.c b/sound/soc/renesas/rcar/gen.c
index d1f20cde66be..05d5f656fb01 100644
--- a/sound/soc/renesas/rcar/gen.c
+++ b/sound/soc/renesas/rcar/gen.c
@@ -464,6 +464,184 @@ static int rsnd_gen1_probe(struct rsnd_priv *priv)
 	return ret_adg | ret_ssi;
 }
 
+/*
+ *		RZ/G3E Generation
+ */
+static int rsnd_rzg3e_probe(struct rsnd_priv *priv)
+{
+	static const struct rsnd_regmap_field_conf conf_ssiu[] = {
+		RSND_GEN_S_REG(SSI_MODE1,		0x804),
+		RSND_GEN_S_REG(SSI_MODE2,		0x808),
+		RSND_GEN_S_REG(SSI_MODE3,		0x80c),
+		RSND_GEN_S_REG(SSI_CONTROL,		0x810),
+		RSND_GEN_S_REG(SSI_CONTROL2,		0x814),
+		RSND_GEN_S_REG(SSI_SYS_STATUS0,		0x840),
+		RSND_GEN_S_REG(SSI_SYS_STATUS1,		0x844),
+		RSND_GEN_S_REG(SSI_SYS_STATUS2,		0x848),
+		RSND_GEN_S_REG(SSI_SYS_STATUS3,		0x84c),
+		RSND_GEN_S_REG(SSI_SYS_INT_ENABLE0,	0x850),
+		RSND_GEN_S_REG(SSI_SYS_INT_ENABLE1,	0x854),
+		RSND_GEN_S_REG(SSI_SYS_INT_ENABLE2,	0x858),
+		RSND_GEN_S_REG(SSI_SYS_INT_ENABLE3,	0x85c),
+		RSND_GEN_M_REG(SSI_BUSIF0_MODE,		0x0,	0x80),
+		RSND_GEN_M_REG(SSI_BUSIF0_ADINR,	0x4,	0x80),
+		RSND_GEN_M_REG(SSI_BUSIF0_DALIGN,	0x8,	0x80),
+		RSND_GEN_M_REG(SSI_BUSIF1_MODE,		0x20,	0x80),
+		RSND_GEN_M_REG(SSI_BUSIF1_ADINR,	0x24,	0x80),
+		RSND_GEN_M_REG(SSI_BUSIF1_DALIGN,	0x28,	0x80),
+		RSND_GEN_M_REG(SSI_BUSIF2_MODE,		0x40,	0x80),
+		RSND_GEN_M_REG(SSI_BUSIF2_ADINR,	0x44,	0x80),
+		RSND_GEN_M_REG(SSI_BUSIF2_DALIGN,	0x48,	0x80),
+		RSND_GEN_M_REG(SSI_BUSIF3_MODE,		0x60,	0x80),
+		RSND_GEN_M_REG(SSI_BUSIF3_ADINR,	0x64,	0x80),
+		RSND_GEN_M_REG(SSI_BUSIF3_DALIGN,	0x68,	0x80),
+		RSND_GEN_M_REG(SSI_MODE,		0xc,	0x80),
+		RSND_GEN_M_REG(SSI_CTRL,		0x10,	0x80),
+		RSND_GEN_M_REG(SSI_INT_ENABLE,		0x18,	0x80),
+		RSND_GEN_S_REG(SSI9_BUSIF0_MODE,	0x480),
+		RSND_GEN_S_REG(SSI9_BUSIF0_ADINR,	0x484),
+		RSND_GEN_S_REG(SSI9_BUSIF0_DALIGN,	0x488),
+		RSND_GEN_S_REG(SSI9_BUSIF1_MODE,	0x4a0),
+		RSND_GEN_S_REG(SSI9_BUSIF1_ADINR,	0x4a4),
+		RSND_GEN_S_REG(SSI9_BUSIF1_DALIGN,	0x4a8),
+		RSND_GEN_S_REG(SSI9_BUSIF2_MODE,	0x4c0),
+		RSND_GEN_S_REG(SSI9_BUSIF2_ADINR,	0x4c4),
+		RSND_GEN_S_REG(SSI9_BUSIF2_DALIGN,	0x4c8),
+		RSND_GEN_S_REG(SSI9_BUSIF3_MODE,	0x4e0),
+		RSND_GEN_S_REG(SSI9_BUSIF3_ADINR,	0x4e4),
+		RSND_GEN_S_REG(SSI9_BUSIF3_DALIGN,	0x4e8),
+	};
+	static const struct rsnd_regmap_field_conf conf_scu[] = {
+		RSND_GEN_M_REG(SRC_I_BUSIF_MODE,	0x0,	0x20),
+		RSND_GEN_M_REG(SRC_O_BUSIF_MODE,	0x4,	0x20),
+		RSND_GEN_M_REG(SRC_BUSIF_DALIGN,	0x8,	0x20),
+		RSND_GEN_M_REG(SRC_ROUTE_MODE0,		0xc,	0x20),
+		RSND_GEN_M_REG(SRC_CTRL,		0x10,	0x20),
+		RSND_GEN_M_REG(SRC_INT_ENABLE0,		0x18,	0x20),
+		RSND_GEN_M_REG(CMD_BUSIF_MODE,		0x184,	0x20),
+		RSND_GEN_M_REG(CMD_BUSIF_DALIGN,	0x188,	0x20),
+		RSND_GEN_M_REG(CMD_ROUTE_SLCT,		0x18c,	0x20),
+		RSND_GEN_M_REG(CMD_CTRL,		0x190,	0x20),
+		RSND_GEN_S_REG(SCU_SYS_STATUS0,		0x1c8),
+		RSND_GEN_S_REG(SCU_SYS_INT_EN0,		0x1cc),
+		RSND_GEN_S_REG(SCU_SYS_STATUS1,		0x1d0),
+		RSND_GEN_S_REG(SCU_SYS_INT_EN1,		0x1d4),
+		RSND_GEN_M_REG(SRC_SWRSR,		0x200,	0x40),
+		RSND_GEN_M_REG(SRC_SRCIR,		0x204,	0x40),
+		RSND_GEN_M_REG(SRC_ADINR,		0x214,	0x40),
+		RSND_GEN_M_REG(SRC_IFSCR,		0x21c,	0x40),
+		RSND_GEN_M_REG(SRC_IFSVR,		0x220,	0x40),
+		RSND_GEN_M_REG(SRC_SRCCR,		0x224,	0x40),
+		RSND_GEN_M_REG(SRC_BSDSR,		0x22c,	0x40),
+		RSND_GEN_M_REG(SRC_BSISR,		0x238,	0x40),
+		RSND_GEN_M_REG(CTU_SWRSR,		0x500,	0x100),
+		RSND_GEN_M_REG(CTU_CTUIR,		0x504,	0x100),
+		RSND_GEN_M_REG(CTU_ADINR,		0x508,	0x100),
+		RSND_GEN_M_REG(CTU_CPMDR,		0x510,	0x100),
+		RSND_GEN_M_REG(CTU_SCMDR,		0x514,	0x100),
+		RSND_GEN_M_REG(CTU_SV00R,		0x518,	0x100),
+		RSND_GEN_M_REG(CTU_SV01R,		0x51c,	0x100),
+		RSND_GEN_M_REG(CTU_SV02R,		0x520,	0x100),
+		RSND_GEN_M_REG(CTU_SV03R,		0x524,	0x100),
+		RSND_GEN_M_REG(CTU_SV04R,		0x528,	0x100),
+		RSND_GEN_M_REG(CTU_SV05R,		0x52c,	0x100),
+		RSND_GEN_M_REG(CTU_SV06R,		0x530,	0x100),
+		RSND_GEN_M_REG(CTU_SV07R,		0x534,	0x100),
+		RSND_GEN_M_REG(CTU_SV10R,		0x538,	0x100),
+		RSND_GEN_M_REG(CTU_SV11R,		0x53c,	0x100),
+		RSND_GEN_M_REG(CTU_SV12R,		0x540,	0x100),
+		RSND_GEN_M_REG(CTU_SV13R,		0x544,	0x100),
+		RSND_GEN_M_REG(CTU_SV14R,		0x548,	0x100),
+		RSND_GEN_M_REG(CTU_SV15R,		0x54c,	0x100),
+		RSND_GEN_M_REG(CTU_SV16R,		0x550,	0x100),
+		RSND_GEN_M_REG(CTU_SV17R,		0x554,	0x100),
+		RSND_GEN_M_REG(CTU_SV20R,		0x558,	0x100),
+		RSND_GEN_M_REG(CTU_SV21R,		0x55c,	0x100),
+		RSND_GEN_M_REG(CTU_SV22R,		0x560,	0x100),
+		RSND_GEN_M_REG(CTU_SV23R,		0x564,	0x100),
+		RSND_GEN_M_REG(CTU_SV24R,		0x568,	0x100),
+		RSND_GEN_M_REG(CTU_SV25R,		0x56c,	0x100),
+		RSND_GEN_M_REG(CTU_SV26R,		0x570,	0x100),
+		RSND_GEN_M_REG(CTU_SV27R,		0x574,	0x100),
+		RSND_GEN_M_REG(CTU_SV30R,		0x578,	0x100),
+		RSND_GEN_M_REG(CTU_SV31R,		0x57c,	0x100),
+		RSND_GEN_M_REG(CTU_SV32R,		0x580,	0x100),
+		RSND_GEN_M_REG(CTU_SV33R,		0x584,	0x100),
+		RSND_GEN_M_REG(CTU_SV34R,		0x588,	0x100),
+		RSND_GEN_M_REG(CTU_SV35R,		0x58c,	0x100),
+		RSND_GEN_M_REG(CTU_SV36R,		0x590,	0x100),
+		RSND_GEN_M_REG(CTU_SV37R,		0x594,	0x100),
+		RSND_GEN_M_REG(MIX_SWRSR,		0xd00,	0x40),
+		RSND_GEN_M_REG(MIX_MIXIR,		0xd04,	0x40),
+		RSND_GEN_M_REG(MIX_ADINR,		0xd08,	0x40),
+		RSND_GEN_M_REG(MIX_MIXMR,		0xd10,	0x40),
+		RSND_GEN_M_REG(MIX_MVPDR,		0xd14,	0x40),
+		RSND_GEN_M_REG(MIX_MDBAR,		0xd18,	0x40),
+		RSND_GEN_M_REG(MIX_MDBBR,		0xd1c,	0x40),
+		RSND_GEN_M_REG(MIX_MDBCR,		0xd20,	0x40),
+		RSND_GEN_M_REG(MIX_MDBDR,		0xd24,	0x40),
+		RSND_GEN_M_REG(MIX_MDBER,		0xd28,	0x40),
+		RSND_GEN_M_REG(DVC_SWRSR,		0xe00,	0x100),
+		RSND_GEN_M_REG(DVC_DVUIR,		0xe04,	0x100),
+		RSND_GEN_M_REG(DVC_ADINR,		0xe08,	0x100),
+		RSND_GEN_M_REG(DVC_DVUCR,		0xe10,	0x100),
+		RSND_GEN_M_REG(DVC_ZCMCR,		0xe14,	0x100),
+		RSND_GEN_M_REG(DVC_VRCTR,		0xe18,	0x100),
+		RSND_GEN_M_REG(DVC_VRPDR,		0xe1c,	0x100),
+		RSND_GEN_M_REG(DVC_VRDBR,		0xe20,	0x100),
+		RSND_GEN_M_REG(DVC_VOL0R,		0xe28,	0x100),
+		RSND_GEN_M_REG(DVC_VOL1R,		0xe2c,	0x100),
+		RSND_GEN_M_REG(DVC_VOL2R,		0xe30,	0x100),
+		RSND_GEN_M_REG(DVC_VOL3R,		0xe34,	0x100),
+		RSND_GEN_M_REG(DVC_VOL4R,		0xe38,	0x100),
+		RSND_GEN_M_REG(DVC_VOL5R,		0xe3c,	0x100),
+		RSND_GEN_M_REG(DVC_VOL6R,		0xe40,	0x100),
+		RSND_GEN_M_REG(DVC_VOL7R,		0xe44,	0x100),
+		RSND_GEN_M_REG(DVC_DVUER,		0xe48,	0x100),
+	};
+	static const struct rsnd_regmap_field_conf conf_adg[] = {
+		RSND_GEN_S_REG(BRRA,			0x00),
+		RSND_GEN_S_REG(BRRB,			0x04),
+		RSND_GEN_S_REG(BRGCKR,			0x08),
+		RSND_GEN_S_REG(AUDIO_CLK_SEL0,		0x0c),
+		RSND_GEN_S_REG(AUDIO_CLK_SEL1,		0x10),
+		RSND_GEN_S_REG(AUDIO_CLK_SEL2,		0x14),
+		RSND_GEN_S_REG(AUDIO_CLK_SEL3,		0x18),
+		RSND_GEN_S_REG(DIV_EN,			0x30),
+		RSND_GEN_S_REG(SRCIN_TIMSEL0,		0x34),
+		RSND_GEN_S_REG(SRCIN_TIMSEL1,		0x38),
+		RSND_GEN_S_REG(SRCIN_TIMSEL2,		0x3c),
+		RSND_GEN_S_REG(SRCIN_TIMSEL3,		0x40),
+		RSND_GEN_S_REG(SRCIN_TIMSEL4,		0x44),
+		RSND_GEN_S_REG(SRCOUT_TIMSEL0,		0x48),
+		RSND_GEN_S_REG(SRCOUT_TIMSEL1,		0x4c),
+		RSND_GEN_S_REG(SRCOUT_TIMSEL2,		0x50),
+		RSND_GEN_S_REG(SRCOUT_TIMSEL3,		0x54),
+		RSND_GEN_S_REG(SRCOUT_TIMSEL4,		0x58),
+		RSND_GEN_S_REG(CMDOUT_TIMSEL,		0x5c),
+	};
+	static const struct rsnd_regmap_field_conf conf_ssi[] = {
+		RSND_GEN_M_REG(SSICR,			0x00,	0x40),
+		RSND_GEN_M_REG(SSISR,			0x04,	0x40),
+		RSND_GEN_M_REG(SSIWSR,			0x20,	0x40),
+	};
+	int ret;
+
+	ret = rsnd_gen_regmap_init(priv, 10, RSND_BASE_SCU, "scu", conf_scu);
+	if (ret < 0)
+		return ret;
+
+	ret = rsnd_gen_regmap_init(priv, 1, RSND_BASE_ADG, "adg", conf_adg);
+	if (ret < 0)
+		return ret;
+
+	ret = rsnd_gen_regmap_init(priv, 10, RSND_BASE_SSIU, "ssiu", conf_ssiu);
+	if (ret < 0)
+		return ret;
+
+	return rsnd_gen_regmap_init(priv, 10, RSND_BASE_SSI, "ssi", conf_ssi);
+}
+
 /*
  *		Gen
  */
@@ -487,6 +665,8 @@ int rsnd_gen_probe(struct rsnd_priv *priv)
 		ret = rsnd_gen2_probe(priv);
 	else if (rsnd_is_gen4(priv))
 		ret = rsnd_gen4_probe(priv);
+	else if (rsnd_is_rzg3e(priv))
+		ret = rsnd_rzg3e_probe(priv);
 
 	if (ret < 0)
 		dev_err(dev, "unknown generation R-Car sound device\n");
diff --git a/sound/soc/renesas/rcar/rsnd.h b/sound/soc/renesas/rcar/rsnd.h
index cd7e7df62298..7b50e0456cca 100644
--- a/sound/soc/renesas/rcar/rsnd.h
+++ b/sound/soc/renesas/rcar/rsnd.h
@@ -143,13 +143,16 @@ enum rsnd_reg {
 	AUDIO_CLK_SEL0,
 	AUDIO_CLK_SEL1,
 	AUDIO_CLK_SEL2,
+	AUDIO_CLK_SEL3,
 
 	/* SSIU */
 	SSI_MODE,
 	SSI_MODE0,
 	SSI_MODE1,
 	SSI_MODE2,
+	SSI_MODE3,
 	SSI_CONTROL,
+	SSI_CONTROL2,
 	SSI_CTRL,
 	SSI_BUSIF0_MODE,
 	SSI_BUSIF1_MODE,
@@ -622,14 +625,28 @@ struct rsnd_priv {
 	struct platform_device *pdev;
 	spinlock_t lock;
 	unsigned long flags;
+
+	/*
+	 * Flags layout: 0x....DCBA
+	 *
+	 * A (bits  3: 0): R-Car generation (Gen1/Gen2/Gen3/Gen4)
+	 * B (bits  7: 4): R-Car SoC variant (e.g. SOC_E for E1/E2/E3)
+	 * C (bits 11: 8): RZ series generation
+	 * D (bits 15:12): RZ series SoC identifier (e.g. RZG3E)
+	 *
+	 * Bits 16+ are used for capability flags.
+	 */
 #define RSND_GEN_MASK	(0xF << 0)
 #define RSND_GEN1	(1 << 0)
 #define RSND_GEN2	(2 << 0)
 #define RSND_GEN3	(3 << 0)
 #define RSND_GEN4	(4 << 0)
-#define RSND_SOC_MASK	(0xFF << 4)
-#define RSND_SOC_E	(1 << 4) /* E1/E2/E3 */
-
+#define RSND_SOC_MASK	(0xF << 4)  /* nibble B */
+#define RSND_SOC_E	(1 << 4)    /* E1/E2/E3 */
+#define RSND_RZ_MASK	(0xF << 8)  /* nibble C */
+#define RSND_RZ3	(3 << 8)
+#define RSND_RZ_ID_MASK	(0xF << 12) /* nibble D */
+#define RSND_RZG3E	(1 << 12)
 	/*
 	 * below value will be filled on rsnd_gen_probe()
 	 */
@@ -708,6 +725,9 @@ struct rsnd_priv {
 #define rsnd_is_gen3_e3(priv)	(((priv)->flags & \
 					(RSND_GEN_MASK | RSND_SOC_MASK)) == \
 					(RSND_GEN3 | RSND_SOC_E))
+#define rsnd_is_rzg3e(priv) (((priv)->flags & \
+				(RSND_RZ_MASK | RSND_RZ_ID_MASK)) == \
+					(RSND_RZ3 | RSND_RZG3E))
 
 #define rsnd_flags_has(p, f) ((p)->flags & (f))
 #define rsnd_flags_set(p, f) ((p)->flags |= (f))
-- 
2.25.1


