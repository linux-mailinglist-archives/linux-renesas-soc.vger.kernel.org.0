Return-Path: <linux-renesas-soc+bounces-21147-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B293CB3F13B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 00:46:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1AF9C1B2181E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Sep 2025 22:46:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CFCE29BD91;
	Mon,  1 Sep 2025 22:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bhsO2/q+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F013299957;
	Mon,  1 Sep 2025 22:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756766637; cv=none; b=CVaFm7WM58aE4ZMwdYfgGgi1pKLBkQYa+c0EEJMSoxt5NcfCtmX/fmFqhRNFKsuwd80MzkrQ06m7vnI6gXCZ1TK9loUrHmbni9EX1xvQIL4N3+Hu0DHHlMzC4IxtpfkRACGVw7j+K+O41jh7nOo4LReRbw9ZUv7brT+diMm8UT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756766637; c=relaxed/simple;
	bh=uXQiqD3bAp36ytO9RFr3KHkmWopvyJp/k2yAFl41jjk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ThoROjWeUvKeIooDbWQjm8WFMiZ46pgp0i0GXpBrf4DHz1dCuj4xTM/XnXSTDUZ7Gw0Ey3NfpNQthE+dRAAkTKoWU9Z6HATXLRW4GNTazxBxwcTJtTW3VEzxQGLzKv/a+n+GowdtWzVjWEnAS2CJvpGtZx4v+Hkaim42lqSSjb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bhsO2/q+; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45b7c01a8c1so37609545e9.2;
        Mon, 01 Sep 2025 15:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756766634; x=1757371434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/D0zIK/90YKRqjCv1wm+ESOlhgTGD5ibtI3Ci4OU4E4=;
        b=bhsO2/q+1BC5v9FnFbStW7KS0f/jTg7Qrw5LgvfdK2ULNlovREX2PJc79HXbxH8BOA
         WeBI3vavFh25b+wR/M2aE2EyJHjdgGpY0dBwXZrpua0CCCCFdZEbgfG0GSdNCWc+QyyY
         aCgoFv3YSVyqQU9JQXf/AmExkgrK0nfi0sLNVCWbORnpT5Q64jmsQxvFi+svIX+1DF4O
         9l/P3upcTwJPGqXvGuApmpUyqgAoSViDAjonG0O2ev8KUMe+JxUkqx2uu1y40K27pebK
         pqLwdLhjeTPvaaByj0Wp7NhFcb/UFfAMcvwbyfTxPLvCFlnsucklvb9qcL71u6U3GCfF
         S/3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756766634; x=1757371434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/D0zIK/90YKRqjCv1wm+ESOlhgTGD5ibtI3Ci4OU4E4=;
        b=Kd3H8HXXqH5p8aH+GYoK5e1a0h9TjmxAOcjqQLKI6ej06z59Dyrl2OzWs9P4fOF9kQ
         Hrjl4WllAvUKVeLOO+dA8GiAHo0SqL5aXPoyKbDVpCxu505zbhn5DXYkmrEOexUUirck
         329CWmSQicxgShC5esOx25JXKANzl6L5qeZmNWpeMagjirl2n61ijYMY0usheMz5VZZS
         5xW/nNnOsWykz5bIRR44KOWoM5Ys7AKMfG+0ZN2UMb+AjNA4QeeK/c49DSNYTBPsbiqG
         qw5vgZT181aHITTorMnyLhnP986mWc6tEVLKH6POU1U22mOdqp5Ha4+/I7AZakQ77m09
         kGHA==
X-Forwarded-Encrypted: i=1; AJvYcCU7IHcpzsvhv6Otcz7Exm3aOjVnHPAzwUU81YiZIuGDsPkPiOziI3ddRZN0O04TcxGYkh9/OT1J@vger.kernel.org, AJvYcCVJjixSGYgo4WGIBSdnZeMIf8RkhnDcrGPNJqSKHZmP+gIT7oLFmZOsr6SxVa2L8KLR/Q/pQOXIdQ5Y@vger.kernel.org, AJvYcCXj0rP80xkJdxtQSLTreOkFttrHcWZ0rswh8gxCm9Ox/Wwj70XQcLznJDbdgXojfwfO3vkQcGk7AxLDAIds@vger.kernel.org
X-Gm-Message-State: AOJu0YxsTPkahqn6D/Jf6s6ZvQHdHW+vXStzl8mv7KoQAaVS2Xt40Rud
	JZqy3JzhCn4hOUKe37BWZ34mH7lWBitJLdG1vTzvJAg098YcVz+SDK2yGebKjJaC
X-Gm-Gg: ASbGncsVeBWx7sKj6fueHKnJqqHrpgoSfrw47kF8Z5cXYGOaNztaaL4YE8tzvnQwfM/
	XKkxWdeQKCL4Z5rAk4gqsnZkiLF/eFMu/Ecdv+/pZCpm6iNl9N1IGHUsW7L7jEJB2Z+btEDtCcZ
	0WY+QWIgGADfYDaK4M+kB0lj9CPSVoQ1RuqfNgKafGZErqihscWLrqB40oyNLsePdxfXrm7ioqP
	/en5yR0uHhdyJQ50j5951lk2070VAdefen2FPFZwuiA8VO590JCqw/c1ZdimmVjCXg9f4NKAw//
	YwDAombUEBJSmkImmumyf/e4ixdxv9gDyH1pfAINTxdotGDfmv8oDViIWtleLa/hfyRIRquF/H4
	0kHg+5kIgtc/WcMU3jM851JBo1t3ioOT/Cx/BpWbFJxWHrnrXz9x+AccXCgBV6r7hcRA=
X-Google-Smtp-Source: AGHT+IEj5HYSRuIEFDmct01GRAuX5FjvzMWfN23JgVD0VzHd8Rizrk4/l1Yi1jINnhV5dPW1g1SSFw==
X-Received: by 2002:a05:6000:188d:b0:3d9:70cc:6dcd with SMTP id ffacd0b85a97d-3d970cc6f97mr998103f8f.1.1756766633670;
        Mon, 01 Sep 2025 15:43:53 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:ca6c:86b2:c8f:84d6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d2250115fdsm11532607f8f.40.2025.09.01.15.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 15:43:53 -0700 (PDT)
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
Subject: [PATCH net-next 10/10] net: pcs: rzn1-miic: Add PCS validate callback for RZ/T2H MIIC
Date: Mon,  1 Sep 2025 23:43:23 +0100
Message-ID: <20250901224327.3429099-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add a SoC-specific `pcs_ops` pointer in `miic_of_data` to allow
custom phylink PCS callbacks. For RZ/T2H MIIC, implement
`rzt2h_miic_validate` to restrict valid interfaces to RGMII, RMII,
and MII. Assign `rzt2h_miic_phylink_ops` with the new validate
callback to the RZ/T2H MIIC SoC data structure, keeping existing
PCS support intact for other SoCs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/net/pcs/pcs-rzn1-miic.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/net/pcs/pcs-rzn1-miic.c b/drivers/net/pcs/pcs-rzn1-miic.c
index 024562204d7c..ee0805c82141 100644
--- a/drivers/net/pcs/pcs-rzn1-miic.c
+++ b/drivers/net/pcs/pcs-rzn1-miic.c
@@ -209,6 +209,7 @@ struct miic {
  * @reset_count: Number of entries in the reset_ids array
  * @init_unlock_lock_regs: Flag to indicate if registers need to be unlocked before access
  * @miic_write: Function pointer to write a value to a MIIC register
+ * @pcs_ops: PCS operations for the MII converter
  */
 struct miic_of_data {
 	struct modctrl_match *match_table;
@@ -225,6 +226,7 @@ struct miic_of_data {
 	u8 reset_count;
 	bool init_unlock_lock_regs;
 	void (*miic_write)(struct miic *miic, int offset, u32 value);
+	const struct phylink_pcs_ops *pcs_ops;
 };
 
 /**
@@ -307,6 +309,17 @@ static void miic_converter_enable(struct miic *miic, int port, int enable)
 	miic_reg_rmw(miic, MIIC_CONVRST, MIIC_CONVRST_PHYIF_RST(port), val);
 }
 
+static int rzt2h_miic_validate(struct phylink_pcs *pcs, unsigned long *supported,
+			       const struct phylink_link_state *state)
+{
+	if (phy_interface_mode_is_rgmii(state->interface) ||
+	    state->interface == PHY_INTERFACE_MODE_RMII ||
+	    state->interface == PHY_INTERFACE_MODE_MII)
+		return 0;
+
+	return -EINVAL;
+}
+
 static int miic_config(struct phylink_pcs *pcs, unsigned int neg_mode,
 		       phy_interface_t interface,
 		       const unsigned long *advertising, bool permit)
@@ -425,6 +438,13 @@ static const struct phylink_pcs_ops miic_phylink_ops = {
 	.pcs_pre_init = miic_pre_init,
 };
 
+static const struct phylink_pcs_ops rzt2h_miic_phylink_ops = {
+	.pcs_validate = rzt2h_miic_validate,
+	.pcs_config = miic_config,
+	.pcs_link_up = miic_link_up,
+	.pcs_pre_init = miic_pre_init,
+};
+
 struct phylink_pcs *miic_create(struct device *dev, struct device_node *np)
 {
 	const struct miic_of_data *of_data;
@@ -476,7 +496,7 @@ struct phylink_pcs *miic_create(struct device *dev, struct device_node *np)
 
 	miic_port->miic = miic;
 	miic_port->port = port - of_data->miic_port_start;
-	miic_port->pcs.ops = &miic_phylink_ops;
+	miic_port->pcs.ops = miic->of_data->pcs_ops;
 
 	phy_interface_set_rgmii(miic_port->pcs.supported_interfaces);
 	__set_bit(PHY_INTERFACE_MODE_RMII, miic_port->pcs.supported_interfaces);
@@ -708,6 +728,7 @@ static struct miic_of_data rzn1_miic_of_data = {
 	.sw_mode_mask = GENMASK(4, 0),
 	.init_unlock_lock_regs = true,
 	.miic_write = miic_reg_writel_unlocked,
+	.pcs_ops = &miic_phylink_ops,
 };
 
 static struct miic_of_data rzt2h_miic_of_data = {
@@ -724,6 +745,7 @@ static struct miic_of_data rzt2h_miic_of_data = {
 	.reset_ids = rzt2h_reset_ids,
 	.reset_count = ARRAY_SIZE(rzt2h_reset_ids),
 	.miic_write = miic_reg_writel_locked,
+	.pcs_ops = &rzt2h_miic_phylink_ops,
 };
 
 static const struct of_device_id miic_of_mtable[] = {
-- 
2.51.0


