Return-Path: <linux-renesas-soc+bounces-21330-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 464A5B43A81
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 13:43:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 997E858118B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 11:43:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6352A30147F;
	Thu,  4 Sep 2025 11:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rgh/Q/bZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935EE242D6B;
	Thu,  4 Sep 2025 11:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756986142; cv=none; b=Jr2K0kWw5JOOWeoflbFsagy4DptRxtvcS+jlTNz4CyPBFYHUYVMqNSLIR1dlGs0OOni9MxYl8f6krdkU/d3dKYl/mC/snS+Vv4ua2nQfDqk4n6qecaVneL6cTBnygD8sNvE1S9s4E0tstOdcY7QNCbHi1lNajGOeIwMRQTkpvtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756986142; c=relaxed/simple;
	bh=aq0+ztHTlBLLd49MSNXqUVQfJPnrZ4nWwuUmzsAWEvg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SvmBItK7jsn2xyJAGXfWECjK8eFg4GDHQvheBzs/BQSWyLi3eQSoUKPepurEPvlISjebFTfEfWYoOBhVh7Z4BmYNA5pfowWNqSINMXsUBEaPCjfTz/21o3Pr5+qgRydx2hpPZURHIOOg2Sb4DaTRpfG7Z+LsbyOwsKU/YJT3zGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rgh/Q/bZ; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45b4d89217aso7024695e9.2;
        Thu, 04 Sep 2025 04:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756986139; x=1757590939; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ztvT559LRcamadz1R2KUwiDzV+z6hKtayjXRAQFMkM4=;
        b=Rgh/Q/bZ6sAAfL3zS0SOhT4xp+bITKgyL83aZfVcSGsEC75pi9ee5GI+o31dnSNv4h
         fa2iO9n1Od+C1M5Z/0JrgDUNZJLQa3ok0mDRQcDtwfJZf0fVtiw9U5obAEBvaUJ/OXDu
         9I9DCkekgcMTIvNyird470XQjjHfB4OGWMWZmimWR1HntWJVfladedjX6Z7sDzZuNac2
         xR3cKpsaqmiSG6o9527+CFsynQeTCe0B5SfC8YDXag/HL2MFu4ncsSQ6SM4zyTv/pZXo
         gqecdnWaqPj+7s1Jbz51nhblrJtHibClGCjL1QgrvNQfzeM22YavgulZdbEIMkSJ+nqn
         iHng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756986139; x=1757590939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ztvT559LRcamadz1R2KUwiDzV+z6hKtayjXRAQFMkM4=;
        b=mC2VDU+x0gaI2OLk7zVBVLuAzBQBEI2OJfv295VSv0LF9KX1x3vQjh2y7I4CMcU/JT
         iHNQqG4+cNa3DV6dzFd/cDDE9aw+tRev1ZlxGxRcx3OMLesuhqbF1wo/X3SK9FycHwso
         jywrL3JcYUD8MDpQ0cosEOJbQO3OSBaCKLu6GlE5Nk1er3V9CHggYV2NqBjVIOntNNnR
         yUve6Vr4Zdu0rawpC0KO88WiFn8du1dEb3pOKLlNX/WAA92RlGbxIDMG9za0u2KK/O7h
         CI4/0gGxj4+cgxkPT1HbwCawlISDs0KEds7LMn7ZO8pwwQ0CMQur/CB5IqM1aQWOAIOU
         2Rdw==
X-Forwarded-Encrypted: i=1; AJvYcCUzOZzep5aCxTlkFyenYv90VQCzMEIaL/ThFXv3ntq2edciNWJBeO8Nwz9X3NBWOxvJspSt1ZcvzPIo@vger.kernel.org, AJvYcCVHwo1avNd9Q+sYf2hs+83aA4bdkgUvAd1eTxC7aDcy1xnJhNCDYtvZgjlANBn2S0wW8HPqkicgoRJX9/Kn@vger.kernel.org, AJvYcCVnTZ5tMeSEa9iLEbqooss+ApG8+UAtM4YTWw2BQh491PhMWnBvZdXwdqCLvZaf3eZ1EFca0cpN@vger.kernel.org
X-Gm-Message-State: AOJu0YwC80lkdd2ZmF25MJNZfPu2ImJUON3RYeGGZ0WhAg7vQvvdL7sn
	4U6THUTW5S9vrkfyLll72fgHMID/aBGUQUmyLlC6oYyBJCQ7JK/xPjzYa3exkbxs
X-Gm-Gg: ASbGncvtDvt5CV4ySdLHRsnksdkDozQHDL1eLOkcABK09ZC464doJ6uJgq/4A4gEkjX
	CEGe2eilG7UNdpWMJqo78v2Xg2u4KnDvPVqeb3rQbpl+OhTcukxDtMNhBzieArN4xhzab+ungwe
	sGWkHwyqNa2pqc/tLrl145pUcMOirb+liQVGh0j8ULy0IXbdPGBH5Nv/NyBf2HLv0HNtRl4y/1i
	w7XYVRrlhfu32utjQX7QJNQObxAv5j+Tur2HeFYgBAQLxkeXiA9N4+b4rT6vV8JgeiLFydEsn5Q
	DYl2zQ46rr9+R8aRtK2Uc+A7MupnC78QANgzyLgEQ9qViafjfxAsyf6BwIT720Eld/2X1uNOHvq
	9Wjv0ks6ylGO7Ns0YuYsBcdZMOi4QwjW/Xa17aT3zGFLR6ig=
X-Google-Smtp-Source: AGHT+IFqIW5Qxmz4+L9VjmjZnkvdqrW1zZMD+CQYAIHN+SrgBcPW0mh2tlXGhC/mCNUpBB/LVLQo4g==
X-Received: by 2002:a05:600c:3b0a:b0:45c:b5bb:7b49 with SMTP id 5b1f17b1804b1-45cb5bb7d79mr59578945e9.17.1756986138801;
        Thu, 04 Sep 2025 04:42:18 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:904e:70c8:edf3:59a4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dd0aec70dsm14658475e9.0.2025.09.04.04.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 04:42:17 -0700 (PDT)
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
Subject: [PATCH net-next v2 6/9] net: pcs: rzn1-miic: Make switch mode mask SoC-specific
Date: Thu,  4 Sep 2025 12:42:00 +0100
Message-ID: <20250904114204.4148520-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250904114204.4148520-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250904114204.4148520-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v1->v2:
- No change.
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


