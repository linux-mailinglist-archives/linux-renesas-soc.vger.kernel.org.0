Return-Path: <linux-renesas-soc+bounces-29253-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4LNjEr3BsWkwFAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29253-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 20:25:49 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E8487269456
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 20:25:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A312C302FFE3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 19:25:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7818E3EC2D2;
	Wed, 11 Mar 2026 19:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fXGpFVJ0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7A132C316
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2026 19:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773257115; cv=none; b=MWEhX4+mXUZN7e1I6N9oVpYW+xy4gADTTXunyKqXbSA2sAwpsvzowku84jcrShjpxUnNbg624KIEMTIUW19spF15VBhiZXuvqJKH5bLa0wBWIRkVISMY5GE4gKfAv0yc6Dw9uSn8tVLPu88g+vvVfj03DyJgQONFGR/J3c8Fsks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773257115; c=relaxed/simple;
	bh=RGEFLeZprAzXHTAuVyZ1B1wl5+3LF/ppblArnU0Djxc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sB+vZMMTila0cSSOx6PBFPesQmWve21cpiUYCKOoxt9Mr2CzYjXty8/nW2tZ8KAFE4ZLRfn04nT6RrQ0SjBPo755b/WL6NEGpcAtTSGco1oRjKGISn+AzJb1i4CjtCvfTqd8QnAxtwgX0ep9m2cTEl07JxS3okIRr7qDbpMkucg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fXGpFVJ0; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-439c4a93841so185483f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2026 12:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773257112; x=1773861912; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ccnQJiQDDwmMLyjjIQklaHHj6cTbTf20mcruQYwCWJI=;
        b=fXGpFVJ01gO7UXwhhU8zt3kaLlBd6H+KnKA5VH1qMLZKEKyCqGPto+2rSkyFF3j1PE
         R+XCxr3+TfCvY6UXcdGNPQqc6jLHbCvgW8zY22T00V0BAOmRGhnNHyY4JRIfyq10OKUJ
         Be2AWPYNO49PsDRzXohrCYHEGpczmENfmICxfrBDoxyNOC53qHoKuxMbueVwNTpn3a7Z
         GtSrD0o4eeY4m3C4pXrWL1LYE5TASMor4Yy0M1YApsthCprqtQNtJOBWNlHxfXIlWciu
         xwyxM215UQDfAxXddaJP07LAuR7FiE7lGQdp8NVLN+Ori93Gfb3X3TUZM460E2Z2NCxq
         tFTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773257112; x=1773861912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ccnQJiQDDwmMLyjjIQklaHHj6cTbTf20mcruQYwCWJI=;
        b=Pl/Jg5txzIyAdi2TSyMctNWbPtR75odz0U3GGkTiOJwGN4MZwkbp6ECcAu1gmMmU28
         j99U3DKdYNRLEmWU0RKXSvhgowKqBvaEtQcF9IFNhZW1FVxBm70knD+lq6V+NFQmYQ4y
         mEJXv4GW3Max4Sy/4oItUMXAkKCfCi+na114ECyEEKQteim0ZU7wjDgu9SMFbXBIKc2r
         PLcGiFmrTbXeusrGFtSttv4ex6XjptVZRe6/PxVtsiUvrYZsETmj3sKau4zG/kH2t+7A
         yCHq1YMlRUyWP+ks1cCKVYXQ0dfeI6M2mqGD64FjXzb1UHUvFJTl7WFhXBgF/X4q2xqZ
         sgUA==
X-Forwarded-Encrypted: i=1; AJvYcCXaFNxcldnL2y5CA3Q8hASMG6M8dH1q69KitukBUMAxokyfWjKPhR6s3iih0uEaNxz37Nsa54CHLcmso5HZXaVQeQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAtb8kv4S6Aw0v18le9rVi9BtexVPoy8v1C2J7+SAV8PaBHXoj
	LWiQiykkdrtYLoDivLuCp9J9TbxVjqg/Rn3nUGhqjzyAZpZ/mRZye8/w
X-Gm-Gg: ATEYQzxmwibznEOM6bBGrN1QSNl4G+TyEek1zwHbe9QCIWNl4hXN9JQEZ3awDwomhiJ
	elsTJ1XdFOvuIM701nVzh10BL5IRQ9bkWGobNMfxsujROFCUsOqgcA6q4ABYCT3pjMdzo70Xq5V
	bQFokHsdGW1n0itDQSrfapkqC0NZ4zQDi0lv52eZn3PESmvZMQzNw5lsC+HJscAuQ0tx1BiCNmt
	CuGXUPx7jUk2EqT2lqRrNt0PP/NObjqsgqNnOm800y23AT/JBx/FbDmdl4TYVv/NYyPqn75+QsK
	IklJ9mft5yWDf09TH/ILUgb/Kx7HGD0JKF7jd7ozeMaYeKtqODiDBgEYWXAzwo3Lo5oE6ynNtGF
	1qws1KO9HuRQpu6OdFkMPPL5LTerMnfTaQtBjxSWbKiSNCQzczh46C/MdWgujM1QWcKjKgeztN9
	tnj4MLlA7ftMEnnsgGb1Mbdeh4J3yLXGCjICgLdGR6tZWEcTKR3cVVPYxVOVE=
X-Received: by 2002:a05:6000:2301:b0:439:abcd:b2fa with SMTP id ffacd0b85a97d-439f842c122mr7096186f8f.38.1773257111712;
        Wed, 11 Mar 2026 12:25:11 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:38b7:8ca3:cb55:d344])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20bd9csm1323210f8f.21.2026.03.11.12.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 12:25:11 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v5 12/15] irqchip/renesas-rzg2l: Drop IRQC_TINT_START macro
Date: Wed, 11 Mar 2026 19:24:43 +0000
Message-ID: <20260311192459.609064-13-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260311192459.609064-1-biju.das.jz@bp.renesas.com>
References: <20260311192459.609064-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29253-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,glider.be,gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bp.renesas.com:mid]
X-Rspamd-Queue-Id: E8487269456
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

The IRQC_TINT_START value is different for RZ/G3L and RZ/G2L SoC. Add
tint_start variable in struct rzg2l_hw_info to handle this difference
and drop the macro IRQC_TINT_START.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
 * Dropped the hw_irq nage check involving info.tint_start
v3->v4:
 * Updated commit description 'this differences->this difference'.
 * Updated tint_start variable type from u8-> unsigned int.
v2->v3:
 * No change
v1->v2:
 * No change
---
 drivers/irqchip/irq-renesas-rzg2l.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index 11fff8fdf4b3..ca495fb0d1ae 100644
--- a/drivers/irqchip/irq-renesas-rzg2l.c
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -22,7 +22,6 @@
 
 #define IRQC_IRQ_START			1
 #define IRQC_IRQ_COUNT			8
-#define IRQC_TINT_START			(IRQC_IRQ_START + IRQC_IRQ_COUNT)
 #define IRQC_TINT_COUNT			32
 
 #define ISCR				0x10
@@ -69,9 +68,11 @@ struct rzg2l_irqc_reg_cache {
 
 /**
  * struct rzg2l_hw_info - Interrupt Control Unit controller hardware info structure.
+ * @tint_start:		Start of TINT interrupts
  * @num_irq:		Total Number of interrupts
  */
 struct rzg2l_hw_info {
+	unsigned int	tint_start;
 	unsigned int	num_irq;
 };
 
@@ -125,7 +126,7 @@ static void rzg2l_clear_irq_int(struct rzg2l_irqc_priv *priv, unsigned int hwirq
 
 static void rzg2l_clear_tint_int(struct rzg2l_irqc_priv *priv, unsigned int hwirq)
 {
-	u32 bit = BIT(hwirq - IRQC_TINT_START);
+	u32 bit = BIT(hwirq - priv->info.tint_start);
 	u32 reg;
 
 	reg = readl_relaxed(priv->base + TSCR);
@@ -180,7 +181,7 @@ static void rzfive_irqc_unmask_irq_interrupt(struct rzg2l_irqc_priv *priv,
 static void rzfive_irqc_mask_tint_interrupt(struct rzg2l_irqc_priv *priv,
 					    unsigned int hwirq)
 {
-	u32 bit = BIT(hwirq - IRQC_TINT_START);
+	u32 bit = BIT(hwirq - priv->info.tint_start);
 
 	writel_relaxed(readl_relaxed(priv->base + TMSK) | bit, priv->base + TMSK);
 }
@@ -188,7 +189,7 @@ static void rzfive_irqc_mask_tint_interrupt(struct rzg2l_irqc_priv *priv,
 static void rzfive_irqc_unmask_tint_interrupt(struct rzg2l_irqc_priv *priv,
 					      unsigned int hwirq)
 {
-	u32 bit = BIT(hwirq - IRQC_TINT_START);
+	u32 bit = BIT(hwirq - priv->info.tint_start);
 
 	writel_relaxed(readl_relaxed(priv->base + TMSK) & ~bit, priv->base + TMSK);
 }
@@ -255,7 +256,7 @@ static void rzfive_tint_endisable(struct irq_data *d, bool enable)
 	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
 	unsigned int hwirq = irqd_to_hwirq(d);
 
-	u32 offset = hwirq - IRQC_TINT_START;
+	u32 offset = hwirq - priv->info.tint_start;
 	u32 tssr_offset = TSSR_OFFSET(offset);
 	u8 tssr_index = TSSR_INDEX(offset);
 	u32 reg;
@@ -302,7 +303,7 @@ static void rzg2l_tint_irq_endisable(struct irq_data *d, bool enable)
 {
 	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
 	unsigned int hw_irq = irqd_to_hwirq(d);
-	u32 offset = hw_irq - IRQC_TINT_START;
+	u32 offset = hw_irq - priv->info.tint_start;
 	u32 tssr_offset = TSSR_OFFSET(offset);
 	u8 tssr_index = TSSR_INDEX(offset);
 	u32 reg;
@@ -392,7 +393,7 @@ static int rzg2l_tint_set_edge(struct irq_data *d, unsigned int type)
 {
 	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
 	unsigned int hwirq = irqd_to_hwirq(d);
-	u32 titseln = hwirq - IRQC_TINT_START;
+	u32 titseln = hwirq - priv->info.tint_start;
 	u32 tssr_offset = TSSR_OFFSET(titseln);
 	u8 tssr_index = TSSR_INDEX(titseln);
 	u8 index, sense;
@@ -686,6 +687,7 @@ static int rzg2l_irqc_common_probe(struct platform_device *pdev, struct device_n
 }
 
 static const struct rzg2l_hw_info rzg2l_hw_params = {
+	.tint_start	= IRQC_IRQ_START + IRQC_IRQ_COUNT,
 	.num_irq	= IRQC_IRQ_START + IRQC_IRQ_COUNT + IRQC_TINT_COUNT,
 };
 
-- 
2.43.0


