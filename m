Return-Path: <linux-renesas-soc+bounces-21143-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D55B3F129
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 00:45:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B7A22C084F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Sep 2025 22:45:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CDAA28BABA;
	Mon,  1 Sep 2025 22:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k7D22pzf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DA3288C02;
	Mon,  1 Sep 2025 22:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756766632; cv=none; b=WkHTsnMqpyDKDUwG1edsFC/+pdOGfeWmgcr0T1tQYPYBA/gxGeiIU7W2cSZUlVGtTgstozUUvgKoYff1Du/9eLVQm9SyydZ8+mezNlqv2rtneiEXtfr/5p5ia6eP9VLCRoPPPvuFp0zcMbpgsFGzkTko7l7JRb5JHKX7sHpRdBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756766632; c=relaxed/simple;
	bh=8HshSuEiNlD+DPs2hJsobLcN/4dGYvXtUBGZfWl4190=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ma4LYX6b02yfpjTH1FA8vHSMhAINPaTHkoklygcoL8gNhJ6vrZUA+Lt0DLEkPOPeSJo4ukeVMTQlHCzMyGbggYunZ2b/AOg3NX82SX/MzCedafgeX1M7pfgApQQFC0JPD372e5+4bjnLItIj8J/fYizuZJzc3w3TxWXo1qxRyAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k7D22pzf; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45b8b7ac427so9318745e9.2;
        Mon, 01 Sep 2025 15:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756766629; x=1757371429; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kVC9j2e4zOAf/fwuoB3wkppFNpvmnksdRiWPMuNeTcE=;
        b=k7D22pzfSVARowsvsRXzylJuGkmQCClh52fjK2HZ/3X08h3M87iCqkSVz/XNun8S+K
         eINZH1bygbqFHStRKOn4gJ0CYNTGo0r0rW04d22YDYuUIqch3wIFEQOye4yuB5kyZYaz
         SoASQK55uTjQUzBj6Jcb9s9qsbqyFx+Q6NDJXfZCzSwpvl5K3cg1Vjq8JrTaPeKLEj1W
         0A9cfMqHdhk27d7LsB8lunRR9agEPcF+KjHZ1Hq+x5i1ggq4jw6Hh2IlaucNqCS/sgb6
         rhLJ85AvfoTBQoAqDXJzW3SAlmelGnEilFnVj4PJjJrp8NgosHi4/wgv2x1YKAH9UdKt
         DJIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756766629; x=1757371429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kVC9j2e4zOAf/fwuoB3wkppFNpvmnksdRiWPMuNeTcE=;
        b=iIDHEtIFU7cqdUTb1z/rIf7Zz80hHC+JmVGoImxmc9FE740TTU7G9l3tPt9nifSSR1
         xo7BroBmKdQTqMq4IVt+LYW1lY0VAYZMUJ/PkrNVZCtZQku8rOcV7ofN4A6C2Hrhg/nI
         9PUkE76xx2r2kVVn6OFsv4oehL+taMldM2ed+u2Kn4KRh8AwcYCFMWsmedbuDUj28ZMi
         S/z24p/ewNIrZtFgElPMnDOLHSiwuSeVIuMYRwGTGBZUvPeul+IaOzge1p5T1kBAoOxD
         ADw2wJW35aeQpSOekscSbFaVpz7OheyN6ibvGImjG6mXxG8hRB3mI1DVUgeYvAyeptI4
         YqfA==
X-Forwarded-Encrypted: i=1; AJvYcCVCUc/ppEwdE/zE4HebdYe31ih1wqG2ASFUfo6pGVnp6Gvg0d2LA9aXF85Nn4PhXbFjIB7HJD46@vger.kernel.org, AJvYcCVxIy7A59QYrnXmkjeyjQETi5w5C5c8ME/FM0DJybdcW8inmu/2UOtVI8OucGxDT6Cb96LKkNLA+n83k6HF@vger.kernel.org, AJvYcCX0D1jt0lObHsmhduoO0i8VYTe7VgDAe/iUM/prXiNSfvAAKHYwOpM2nnig+XBTZ8IJWauano5Zvy3J@vger.kernel.org
X-Gm-Message-State: AOJu0YwEhf1W7q7K3GWHoiORe8gaZrvg1uSnuFFkG1/NmJZvEY2x5wiu
	llYeXaF1lXM4gq8XjIkvhCmG8qaTXseVOGdyACqoigSpLqbIiz6UH6aq
X-Gm-Gg: ASbGncuSHVoyjZrsV7oOnR+kQPtfvZ1LgzsGJBPA7nUQwZz4TkxDodKx3yIZ6zOUtvN
	yp8YYTmqTOE/V+uJn/QHT4EDOepMfcwIYe8mTIu0Op0VBSGFcFdjjMPHbOvi6dBvEF9U/V1SLnW
	I1GCGiA30uPMT00cC41ip1wfbZMa1z9JNwrTZI7fLFG19mh77H3VWtmryBCeE5vR17CYguMFJjd
	lG8PZhYyy9IKtzbTxOdigSgS1xXPSAFPXJNio7c920G7oGp0JzW1y7uKldeptSolZMukSKdDGuc
	JiNdlG32MvRPVkD4AbrUEUq+eNywV5xp1OHkE2i0TM4LmyKgnzRtiQsSy5BTkCCfV32ogrc1R4k
	PKCr20fasBTiw8kGGLoNYmFDd1rncr5IAZm36PHZonNXm/TAR9hmrQOJL
X-Google-Smtp-Source: AGHT+IG2LRv5fpxxjmsAnZtNymcmWMBkEQbeL5ddyrq8GeK1i1Te8g6l3Ri3I39l5G0LkrxtH7Gewg==
X-Received: by 2002:a05:600c:45cd:b0:45b:8453:d82 with SMTP id 5b1f17b1804b1-45b85532f4dmr79821915e9.10.1756766628904;
        Mon, 01 Sep 2025 15:43:48 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:ca6c:86b2:c8f:84d6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d2250115fdsm11532607f8f.40.2025.09.01.15.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 15:43:48 -0700 (PDT)
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
Subject: [PATCH net-next 06/10] net: pcs: rzn1-miic: Make switch mode mask SoC-specific
Date: Mon,  1 Sep 2025 23:43:19 +0100
Message-ID: <20250901224327.3429099-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Move the hardcoded switch mode mask definition into the SoC-specific
miic_of_data structure. This allows each SoC to define its own mask
value rather than relying on a single fixed constant. For RZ/N1 the
mask remains GENMASK(4, 0).

This is in preparation for adding support for RZ/T2H, where the
switch mode mask is GENMASK(2, 0).

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/net/pcs/pcs-rzn1-miic.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/pcs/pcs-rzn1-miic.c b/drivers/net/pcs/pcs-rzn1-miic.c
index c119ec66fe95..c0aa93fd7274 100644
--- a/drivers/net/pcs/pcs-rzn1-miic.c
+++ b/drivers/net/pcs/pcs-rzn1-miic.c
@@ -7,6 +7,7 @@
 
 #include <linux/array_size.h>
 #include <linux/bits.h>
+#include <linux/bitops.h>
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/mdio.h>
@@ -23,7 +24,6 @@
 #define MIIC_ESID_CODE			0x4
 
 #define MIIC_MODCTRL			0x8
-#define MIIC_MODCTRL_SW_MODE		GENMASK(4, 0)
 
 #define MIIC_CONVCTRL(port)		(0x100 + (port) * 4)
 
@@ -146,6 +146,7 @@ struct miic {
  * @index_to_string_count: Number of entries in the index_to_string array
  * @miic_port_start: MIIC port start number
  * @miic_port_max: Maximum MIIC supported
+ * @sw_mode_mask: Switch mode mask
  */
 struct miic_of_data {
 	struct modctrl_match *match_table;
@@ -157,6 +158,7 @@ struct miic_of_data {
 	u8 index_to_string_count;
 	u8 miic_port_start;
 	u8 miic_port_max;
+	u8 sw_mode_mask;
 };
 
 /**
@@ -402,6 +404,7 @@ EXPORT_SYMBOL(miic_destroy);
 
 static int miic_init_hw(struct miic *miic, u32 cfg_mode)
 {
+	u8 sw_mode_mask = miic->of_data->sw_mode_mask;
 	int port;
 
 	/* Unlock write access to accessory registers (cf datasheet). If this
@@ -414,7 +417,7 @@ static int miic_init_hw(struct miic *miic, u32 cfg_mode)
 	miic_reg_writel(miic, MIIC_PRCMD, 0x0001);
 
 	miic_reg_writel(miic, MIIC_MODCTRL,
-			FIELD_PREP(MIIC_MODCTRL_SW_MODE, cfg_mode));
+			((cfg_mode << __ffs(sw_mode_mask)) & sw_mode_mask));
 
 	for (port = 0; port < miic->of_data->miic_port_max; port++) {
 		miic_converter_enable(miic, port, 0);
@@ -580,6 +583,7 @@ static struct miic_of_data rzn1_miic_of_data = {
 	.index_to_string_count = ARRAY_SIZE(index_to_string),
 	.miic_port_start = 1,
 	.miic_port_max = 5,
+	.sw_mode_mask = GENMASK(4, 0),
 };
 
 static const struct of_device_id miic_of_mtable[] = {
-- 
2.51.0


