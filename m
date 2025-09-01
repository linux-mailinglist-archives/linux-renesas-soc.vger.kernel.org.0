Return-Path: <linux-renesas-soc+bounces-21145-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FC8B3F133
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 00:46:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC4A23B5934
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Sep 2025 22:45:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8A79296BCF;
	Mon,  1 Sep 2025 22:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nBdktPL2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BEE28CF6B;
	Mon,  1 Sep 2025 22:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756766634; cv=none; b=WOoWc0m5Gfln7DA7hZ+r6bi0C0RrihUncliIj/JtMVcWJap+pDpwgiC6QwSOCSFFHDS9+2A5OtwDsZQlxuzIZppV7CFM0cNiRvCbeMyCjxbzw7P5EJ5wdnqTJH0WrvyuuA2k/uXm2vRmUwRV0cq2YN4Z8P40harDOsk+D1aUWwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756766634; c=relaxed/simple;
	bh=0g9Y+fRiKtqlqtIPNtlUiVKwkkUcSq3rzj1NafZH040=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a6POAQuBFoUV1edkgPw64H6RKlmh39ttZcGjal0jKB6UFOpuQPHUNipNVyXqc6wUw2e7Vg4jrIfuoVev2VEAIiN1LaDeH08bCfkrihIf9RZKcRW4IywL6Sz6HO2AptesFPrqTnDcCpj6ATWobE//0PVGSHwWm/LxJVEN2zYZ5j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nBdktPL2; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45b7d485204so38115605e9.0;
        Mon, 01 Sep 2025 15:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756766631; x=1757371431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3UG4YQV+BnKD+9tuOZKviNK3qjMBfNAhvkY7wSqu92A=;
        b=nBdktPL2vzPTwgmqFNr8Gc3DwI2dGDZBWCfbnu4x+Q6uOhpxXwqGdmyJI4VmUBBp+v
         wFYHei8+kagmUs+Fu0QTQi6Q2N3MMBMUwTwFun7qJBfoOyMFsh8QdWdRif6e+Z+ie57v
         WWFOjWxCzLCMek8UCu0nokR6MIYK8U3aZONrhkipUWLe9LKjNlv4t6XG79NhH2Kl++on
         2KOEqph91Xpf/rJBuISOItxYvqV9luUtNuvD+8ldQidy+EcN1kabR4wq23xzfy2nPDg1
         Y1BUsvCaN3FATJAOFtRITo4s901rzoVJwx/h2Dk9/V6ZTaYoTOuC1AkOlHGFFA+ftWTH
         iZ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756766631; x=1757371431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3UG4YQV+BnKD+9tuOZKviNK3qjMBfNAhvkY7wSqu92A=;
        b=OhSbPijmLl14FGirXXoAyXfRwIF4+IqKgKy/XbtOHY82Y9XCUzdAV2VKHcHjVrDmDX
         ctZTGCacVep1epowxS4+LiewXHrOL0ZR8rT+E2TF+qWwPCmglKUG4Bf3wK9B/wxYsYhd
         ilwwlHujvqvOiCBbJCYYkT7eEvX86zKbmsY5FrWHTdTYNXgs+AeFIS1VPZtqgzk8oGfX
         JgPrpZcg3Xv1IH18LRnoE6mE6V8gmUFs7834hB5QPyJLAzRwGxb3bez5lvmbrIGsygTU
         ySQrP8Nrp481whjObCJHqz4+GQ7m//ngO3+idsvP5XTd+F3BbV9VfWXNsSind3yRTz2A
         FN+A==
X-Forwarded-Encrypted: i=1; AJvYcCUWGl6vd23AzWoT7vnKwVIzwwd+2trUBGQTFRiTlE0Fl/scbthe0OjGr5mt1ojAyNR2Ql+FAMBKVcoG@vger.kernel.org, AJvYcCW8abT9SuR3MbNOxLVEGGa2KnIoBSpkhp/tayv+HUsVX3BN4n2IYHzyztXYLJwOZB0smQha8PSk@vger.kernel.org, AJvYcCXuDhjIB1MfOle50yUWtd52wKOE/7bIrtmFVVf+JGNXuHiZj3MBj7hD0NN1twoKZxoo7wR6LhP63Qf58P9u@vger.kernel.org
X-Gm-Message-State: AOJu0YwrUlc2L7EHJGx4hPctiLhy2jS4OOPkuf7do84ipU0SxQx9dFO6
	GgPsKo867Ak034Qle4mKqqzpWzc+r18OMJebbktZtX999iF5FKn4Sdru
X-Gm-Gg: ASbGnctlwWe62oB5suguGRF0TNuYC7CkTf4D6qVuG8o4yi90JTTsc9YCXnvjxwFZFbP
	3zERL3omfkIins92wxW6Hv/IpVX6EdOtd+zbIgOeEPSXscUxHeyv++jiZHoSTtUVUSW1cbshX4c
	jQ5c031BvA7mxoI+M+YaNzw+LN2L7XpjWzdH3XjxDReorg/WNI98pQ9nMF/ZZKajfLZqe6fhQXC
	+yWtdEf0kZG57jJ+WEzNX01l94BYxi7k/fJQqzxc9wQmx9Hx8JCOj2sMt3tc1jDlo1L2u78yq6g
	ZUhaa2iJcY1exdM1lY/2u/xvzFgVjTx87ECqJOpdxdFAuNtRQKJGZGdTPy6+kjgQvAJJZYcyY2Q
	CKJ+7T+3YmC3qWQAMtGLZsNCztbecA/aU1iZrm6gdLziX3Kpgf9MlRdj4J8BNnaOLbJE=
X-Google-Smtp-Source: AGHT+IHiDcaGseOy3xIrzM3QHR7ZqscZnUr/b/bpsX2O/9rj8ksjhX6xLfZlnsbZ50rAiit34rbydg==
X-Received: by 2002:a5d:5888:0:b0:3c8:89e9:6ab3 with SMTP id ffacd0b85a97d-3d1def6a5bbmr9009436f8f.46.1756766631102;
        Mon, 01 Sep 2025 15:43:51 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:ca6c:86b2:c8f:84d6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d2250115fdsm11532607f8f.40.2025.09.01.15.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 15:43:50 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next 08/10] net: pcs: rzn1-miic: add per-SoC control for MIIC register unlock/lock
Date: Mon,  1 Sep 2025 23:43:21 +0100
Message-ID: <20250901224327.3429099-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250901224327.3429099-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250901224327.3429099-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Make MIIC accessory register unlock/lock behaviour selectable via SoC/OF
data. Add init_unlock_lock_regs and miic_write to struct miic_of_data so
the driver can either perform the traditional global unlock sequence (as
used on RZ/N1) or use a different policy for other SoCs (for example
RZ/T2H, which does not require leaving registers unlocked).

miic_reg_writel() now calls the per-SoC miic_write callback to perform
register writes. Provide miic_reg_writel_unlocked() as the default writer
and set it for the RZ/N1 OF data so existing platforms keep the same
behaviour. Add a miic_unlock_regs() helper that implements the accessory
register unlock sequence so the unlock/lock sequence can be reused where
needed (for example when a SoC requires explicit unlock/lock around
individual accesses).

This change is preparatory work for supporting RZ/T2H.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/net/pcs/pcs-rzn1-miic.c | 28 +++++++++++++++++++++++-----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/drivers/net/pcs/pcs-rzn1-miic.c b/drivers/net/pcs/pcs-rzn1-miic.c
index d97554e203f0..86d4dccd694e 100644
--- a/drivers/net/pcs/pcs-rzn1-miic.c
+++ b/drivers/net/pcs/pcs-rzn1-miic.c
@@ -155,6 +155,8 @@ struct miic {
  * @sw_mode_mask: Switch mode mask
  * @reset_ids: Reset names array
  * @reset_count: Number of entries in the reset_ids array
+ * @init_unlock_lock_regs: Flag to indicate if registers need to be unlocked before access
+ * @miic_write: Function pointer to write a value to a MIIC register
  */
 struct miic_of_data {
 	struct modctrl_match *match_table;
@@ -169,6 +171,8 @@ struct miic_of_data {
 	u8 sw_mode_mask;
 	const char * const *reset_ids;
 	u8 reset_count;
+	bool init_unlock_lock_regs;
+	void (*miic_write)(struct miic *miic, int offset, u32 value);
 };
 
 /**
@@ -190,11 +194,25 @@ static struct miic_port *phylink_pcs_to_miic_port(struct phylink_pcs *pcs)
 	return container_of(pcs, struct miic_port, pcs);
 }
 
-static void miic_reg_writel(struct miic *miic, int offset, u32 value)
+static inline void miic_unlock_regs(struct miic *miic)
+{
+	/* Unprotect register writes */
+	writel(0x00A5, miic->base + MIIC_PRCMD);
+	writel(0x0001, miic->base + MIIC_PRCMD);
+	writel(0xFFFE, miic->base + MIIC_PRCMD);
+	writel(0x0001, miic->base + MIIC_PRCMD);
+}
+
+static void miic_reg_writel_unlocked(struct miic *miic, int offset, u32 value)
 {
 	writel(value, miic->base + offset);
 }
 
+static void miic_reg_writel(struct miic *miic, int offset, u32 value)
+{
+	miic->of_data->miic_write(miic, offset, value);
+}
+
 static u32 miic_reg_readl(struct miic *miic, int offset)
 {
 	return readl(miic->base + offset);
@@ -421,10 +439,8 @@ static int miic_init_hw(struct miic *miic, u32 cfg_mode)
 	 * is going to be used in conjunction with the Cortex-M3, this sequence
 	 * will have to be moved in register write
 	 */
-	miic_reg_writel(miic, MIIC_PRCMD, 0x00A5);
-	miic_reg_writel(miic, MIIC_PRCMD, 0x0001);
-	miic_reg_writel(miic, MIIC_PRCMD, 0xFFFE);
-	miic_reg_writel(miic, MIIC_PRCMD, 0x0001);
+	if (miic->of_data->init_unlock_lock_regs)
+		miic_unlock_regs(miic);
 
 	miic_reg_writel(miic, MIIC_MODCTRL,
 			((cfg_mode << __ffs(sw_mode_mask)) & sw_mode_mask));
@@ -625,6 +641,8 @@ static struct miic_of_data rzn1_miic_of_data = {
 	.miic_port_start = 1,
 	.miic_port_max = 5,
 	.sw_mode_mask = GENMASK(4, 0),
+	.init_unlock_lock_regs = true,
+	.miic_write = miic_reg_writel_unlocked,
 };
 
 static const struct of_device_id miic_of_mtable[] = {
-- 
2.51.0


