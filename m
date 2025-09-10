Return-Path: <linux-renesas-soc+bounces-21747-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3A9B5228A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 22:43:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 59F661C85C21
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 20:44:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37F5F3081C4;
	Wed, 10 Sep 2025 20:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FZOBlVaq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0F630497A
	for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Sep 2025 20:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757536910; cv=none; b=AZbXAvMjwU9AJ7y8qp1XIkaCxsmeLve7ZzlWYlmRLCpYVrnIKC72C3VVuctRxp4HNF3NFr1cVP4qG0Qc89vBBoDHU+/2pW6XaaZdVY5Lfntm10hSCiJ18rol+fBxb/eZ/Cql82HLoaYaiH/lg916M2rcroyLP2RxpU/za0BMjg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757536910; c=relaxed/simple;
	bh=k2U0NYyEKHtgpAev2ghnZsb3/qPyjZBLMwoarsWqCG0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dy5Wl0Mmcig6cux2eaJ++fQNIb+fA3nyqpgUFYUxlaf50rczOT1u00Vigp/0TiwgloKeJfT4qVAcRfW3CW7bgSSpo6h3aRlDQXQPqdjvtaoqmzoxH4FJwYP/YlhkeY/YCg/JUeB4nqd7l+F2/1vupOV7Ya8DPQ/u9ly7qlJBqyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FZOBlVaq; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45de6490e74so174975e9.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Sep 2025 13:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757536906; x=1758141706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uWelwUVBuuos1qOHG9IBB45ilO6ZU4Ljr34GA9uf6EU=;
        b=FZOBlVaqqcC7OsBLBCQh7FyCql5u/GW4sz/rtfTNS14cJc99R5oQ4FHwq/9AImeD6e
         kNJzlH+gpAw5PIB/6y47XxMBOdAbgG2W8Rio16LLi15xzGbQq6iUS1pROKdBkGtZzbKl
         SdFD8a/LfaZ6OX6BHd0HoIJTPcReVF68OPbipUDScNtwCPUZwxf5fs80KKYekKuVKGuF
         qjHQsoM0pZi0vqaWtD4cVekVbMvmnkK0Dtpb8zqqder8ex9SNIsSbqGo99KG8MeIhT4H
         m6ZrxaGtk+EKVInwbpjJfw7Optnj51wNkxiGRXZXpdNVFgAL8s6dxziwVmERp+iEqGMc
         Cuuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757536906; x=1758141706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uWelwUVBuuos1qOHG9IBB45ilO6ZU4Ljr34GA9uf6EU=;
        b=J5P9tWvi/zHxVvjAtv5wiu7WH4sj0WX+skSp3NaOz7Y5iPQMOmzrWQPmqZNOVVnA7+
         MLsq3WiHWL8xEPLX2I6vAAQnCx3AR6dA7/j1Nz858LHSwgVpuWog5U9Mo1H1ylGv3KRd
         wD4Gab9jg6ZIqxeGZiiVZ4s/l56eTo2DgLsSR8S1LH+Q9Z9TW4zEe7RFISBaPh36dwBy
         eb4QyklB6KBCm+jInFxCupyH6P4z7ozP7WmeUqohgdQxf+XTusOBXyp3J84VVVyUgKZc
         5BTmgEFaXD0wUxdse7UVgngwOKWn8AI6meErdE/3SqmQ+1oVCqiiFnLuGf0FUNOkcVBo
         yrpg==
X-Gm-Message-State: AOJu0Ywn+8g2yv77xFFA+KzVu8Q42UDCd3zrO+56XE7Jh7R3rTaDTo+P
	HwRDq14uA7DI784TBwPEUUxwg6B4WX9SpXRv0S8a49bHvH0bDyH2aYEh
X-Gm-Gg: ASbGncv1UqZ/jZ1lRTBqdv5zKSqoMugJSeVx6tuhUNi3XTTMMFHXzMFss/MymqZE2gt
	jsWyXkGWzhgO+xzV4HdLim89YwYeqtqYBsPUygtNQhPamxEOowMH3Sw0RoHR8Jzh8IpoGIJq4Bn
	pR+Wto31VPPL5V8xt3jijXhQy/+0ZsIfHWTSIGpnX/+Z6H6ULs4dfD/mQr1/Kn5Fd+CRJtOV239
	b4IThCvhoAq/pyIFn+/a9kcO5Yj0gbiu1xzTvlkUwAEuSUK/d3ZfHmOKbXp4wkTW/uZ9GzQk2QC
	en4fq6nqrXhOH6MctZZQGCOU1qQnu6uiXYRMRFcWmHF0niOAws+sz274rHQ2EnEiABvuTtJuARZ
	X6eBTgOO83QRF3L+2N1eWgCL8/szKYDFshsAOMbLZI6RRcno=
X-Google-Smtp-Source: AGHT+IEx9TgeKssRAdhlUZivpFswe+DpuuWCCEbBX19Y4It+DwJLIOvtm0Q7IRCVZgXGeqHIDzir1Q==
X-Received: by 2002:a05:600c:3b23:b0:45b:9c93:d21d with SMTP id 5b1f17b1804b1-45ddde957e4mr179410105e9.8.1757536905783;
        Wed, 10 Sep 2025 13:41:45 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:ee64:b92b:f8fd:6cd8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e0157d68esm320085e9.6.2025.09.10.13.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 13:41:45 -0700 (PDT)
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
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v3 8/9] net: pcs: rzn1-miic: Add per-SoC control for MIIC register unlock/lock
Date: Wed, 10 Sep 2025 21:41:29 +0100
Message-ID: <20250910204132.319975-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250910204132.319975-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250910204132.319975-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v2->v3:
- Dropped inlining of miic_unlock_regs().
- Fixed checkpatch warning to fit within 80 columns.
- Added Tested-by tag.

v1->v2:
- No change.
---
 drivers/net/pcs/pcs-rzn1-miic.c | 29 ++++++++++++++++++++++++-----
 1 file changed, 24 insertions(+), 5 deletions(-)

diff --git a/drivers/net/pcs/pcs-rzn1-miic.c b/drivers/net/pcs/pcs-rzn1-miic.c
index 75009b30084a..ef10994d8c11 100644
--- a/drivers/net/pcs/pcs-rzn1-miic.c
+++ b/drivers/net/pcs/pcs-rzn1-miic.c
@@ -155,6 +155,9 @@ struct miic {
  * @sw_mode_mask: Switch mode mask
  * @reset_ids: Reset names array
  * @reset_count: Number of entries in the reset_ids array
+ * @init_unlock_lock_regs: Flag to indicate if registers need to be unlocked
+ *  before access.
+ * @miic_write: Function pointer to write a value to a MIIC register
  */
 struct miic_of_data {
 	struct modctrl_match *match_table;
@@ -169,6 +172,8 @@ struct miic_of_data {
 	u8 sw_mode_mask;
 	const char * const *reset_ids;
 	u8 reset_count;
+	bool init_unlock_lock_regs;
+	void (*miic_write)(struct miic *miic, int offset, u32 value);
 };
 
 /**
@@ -190,11 +195,25 @@ static struct miic_port *phylink_pcs_to_miic_port(struct phylink_pcs *pcs)
 	return container_of(pcs, struct miic_port, pcs);
 }
 
-static void miic_reg_writel(struct miic *miic, int offset, u32 value)
+static void miic_unlock_regs(struct miic *miic)
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
@@ -421,10 +440,8 @@ static int miic_init_hw(struct miic *miic, u32 cfg_mode)
 	 * is going to be used in conjunction with the Cortex-M3, this sequence
 	 * will have to be moved in register write
 	 */
-	miic_reg_writel(miic, MIIC_PRCMD, 0x00A5);
-	miic_reg_writel(miic, MIIC_PRCMD, 0x0001);
-	miic_reg_writel(miic, MIIC_PRCMD, 0xFFFE);
-	miic_reg_writel(miic, MIIC_PRCMD, 0x0001);
+	if (miic->of_data->init_unlock_lock_regs)
+		miic_unlock_regs(miic);
 
 	/* TODO: Replace with FIELD_PREP() when compile-time constant
 	 * restriction is lifted. Currently __ffs() returns 0 for sw_mode_mask.
@@ -645,6 +662,8 @@ static struct miic_of_data rzn1_miic_of_data = {
 	.miic_port_start = 1,
 	.miic_port_max = 5,
 	.sw_mode_mask = GENMASK(4, 0),
+	.init_unlock_lock_regs = true,
+	.miic_write = miic_reg_writel_unlocked,
 };
 
 static const struct of_device_id miic_of_mtable[] = {
-- 
2.51.0


