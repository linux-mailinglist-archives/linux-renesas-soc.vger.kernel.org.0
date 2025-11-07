Return-Path: <linux-renesas-soc+bounces-24345-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 088C9C418DE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 07 Nov 2025 21:14:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 000684EDA96
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Nov 2025 20:14:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 566A830C37A;
	Fri,  7 Nov 2025 20:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="THw0g3s9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D58B30DD00
	for <linux-renesas-soc@vger.kernel.org>; Fri,  7 Nov 2025 20:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762546377; cv=none; b=DuluNjL01Alymd8ZKvaXBtY3xVSR1BYDYSEgbWrys9BXMSwxKFqkGTixtGCoyZMKP+0LG7x0HXPx9K7GFv901T8uuAXgn0PRMg7H3dNN487UQ0I14bVPytYVvJRmDcveNam7o5J0zDNrbF5YtrrtGIaCd1PxHR+n3ldwTeQguFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762546377; c=relaxed/simple;
	bh=v8yHUl2VCCuFa3tLr/Bqru4Xwe8KeevfdbbJgX94SXE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XAQGMcImwXKf30LbNgKFifxNtkcF0qJuKDs6nscOduPS48N9gC4Xu+RWIJpHi4P3MmKzWSp+19KSVVSJDPJmEITVf4sDUt+yacohIot2k2icvQtyf6ETneM1KrJ78leyTARx5S7f3EAyFlbFEa3ZXkX/6NXx+RXnXT336QdxWG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=THw0g3s9; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7aca3e4f575so989930b3a.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 07 Nov 2025 12:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762546375; x=1763151175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+2jIm/CZCkZaBbDnD9nBZsgOURxlF1+5kGMORETVnug=;
        b=THw0g3s9UQva+8taWcK6ba8UJMs1DBvHYodryLlafUTTYVlRjvXFotDRAYOFQqqrMN
         o07BobtetTsBgomyv0rTGFj10qRzehQhgjx4WuidbnpnuHpVs5DgLILTAJN1yaUME6Qz
         3odAEfZt0QaZlfDMsBffUw1VaxFWUhSfI8gQYXIct8w90k77lVKfpyjL3ARFZoVI8hVO
         5P+FgtDt5eVg6fxGZPpAJA/OX3UKPLA1X9ATCPixKjLa3TfiLue2yopk23DwUdBlLMlW
         5sZN+X6NfD6p9Xdb21GdPcnDNZJhRH5XxrFkVLvpEQjfbmevtWdxcv4TI3uzfLXojGnk
         IfRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762546375; x=1763151175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+2jIm/CZCkZaBbDnD9nBZsgOURxlF1+5kGMORETVnug=;
        b=Wd+irlE+ELDKWfniGflyQEg9p4msmDFUgR5tAeY6R7vUCVzQVWJulEpfkxyGuD8mxt
         S8zhW3y3VEv8DHSK4BaQunAgYtZGgxeh8J5LE64QDD+iIULv88KKXfhEbkBU/2f3jG4Z
         wbZZxYPg3OjDGdi0kv0IFD7ZcAX8rGF4VHrGmPCqbxtdVW1tZpbnuqaTIe55ixCm9S4z
         uEzJM0eFvxz6fvltXYA1h3DhKwN4bgCwWiVZ1YlM4EpSJs/KeTCFvb7bE4D0pj1RcSdH
         AvgHT6V0vYkgnXt6DBSeSkbBMvIbg2RYF8x4aURgOOk/p1RK2vm3IM4XOmJ4Vi4i4oOp
         /QNQ==
X-Forwarded-Encrypted: i=1; AJvYcCViopvPW//93miRfLbAeJ8+N1EEdPzhI8E9Kb791zsezD/jzFz7jmamqB8xTeC0AJPD5yFAkB9wytPqYMZUc2juGw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyubIh2lqpWYKPuiue6Qwy7c8tX750T8FSHEiJktLlnoDaVeBms
	g3QprXFWdpZqzWCL0qNYVgqVFlqoRsmrNXqMZJQCCrAmZjtvsRzN2v7LYNehQQrgxYY=
X-Gm-Gg: ASbGncswFeKT+x58kl1A6cPo3nOKdzFgSJp2eN3580CNQ0Dv+3jqJ3SO3ipbTewX21U
	X3JkAy5+nQaMiONLWu2RGgY/ejoRPxWyoKvwAIPdKGAZ8unL7I6ixGFmu4RnBZjtgbCMltHHdQo
	01t9Zthw9+lCUBqKWgHROtMf79Fi/aDOGW+6Wzn0nL0sKDlC1PYQ0nKDbYXpjb5AwFvkeC/KtaY
	YnQHz6pB802eqBjsHkticKnPRx681sODB3tbKAGNgumBJXy7DezYkBUiMEhMprxj6kjjK2yiKxC
	5QpPCZu+zc84CohoRVlLV6ARgAS+taq6Zz1s1UUzdiqnWKZFus2n7iGCT+3dEJa2nnxFuxvh2kk
	GRtu8h8qTOH3DBQgGJlvspnuU5MQNHMGR99xDS96lFZEBNRFAznmWU56c4digzB7RIDWywa45N1
	MrKBm28zwT4QcRv8bwktNEow==
X-Google-Smtp-Source: AGHT+IH8khfZJBhTJpXLTO5Gb4RSM+k9uIEQChjCn5mDLXBQUnyR83c66GjH4StNfJo9F5kUwk9slw==
X-Received: by 2002:a05:6a00:1892:b0:7ac:6c3e:e918 with SMTP id d2e1a72fcca58-7b225b50453mr562311b3a.11.1762546374902;
        Fri, 07 Nov 2025 12:12:54 -0800 (PST)
Received: from iku.. ([2401:4900:1c07:5fe8:9724:b1da:3d06:ab48])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0cc17784bsm3828553b3a.47.2025.11.07.12.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 12:12:54 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v2 1/3] net: phy: mscc: Simplify LED mode update using phy_modify()
Date: Fri,  7 Nov 2025 20:12:30 +0000
Message-ID: <20251107201232.282152-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251107201232.282152-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251107201232.282152-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The vsc85xx_led_cntl_set() function currently performs a manual
read-modify-write sequence protected by the PHY lock to update the
LED mode register (MSCC_PHY_LED_MODE_SEL).

Replace this sequence with a call to phy_modify(), which already
handles read-modify-write operations with proper locking inside
the PHY core.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- New patch
---
 drivers/net/phy/mscc/mscc_main.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/net/phy/mscc/mscc_main.c b/drivers/net/phy/mscc/mscc_main.c
index 8678ebf89cca..032050ec0bc9 100644
--- a/drivers/net/phy/mscc/mscc_main.c
+++ b/drivers/net/phy/mscc/mscc_main.c
@@ -177,17 +177,10 @@ static int vsc85xx_led_cntl_set(struct phy_device *phydev,
 				u8 led_num,
 				u8 mode)
 {
-	int rc;
-	u16 reg_val;
-
-	mutex_lock(&phydev->lock);
-	reg_val = phy_read(phydev, MSCC_PHY_LED_MODE_SEL);
-	reg_val &= ~LED_MODE_SEL_MASK(led_num);
-	reg_val |= LED_MODE_SEL(led_num, (u16)mode);
-	rc = phy_write(phydev, MSCC_PHY_LED_MODE_SEL, reg_val);
-	mutex_unlock(&phydev->lock);
+	u16 mask = LED_MODE_SEL_MASK(led_num);
+	u16 val = LED_MODE_SEL(led_num, mode);
 
-	return rc;
+	return phy_modify(phydev, MSCC_PHY_LED_MODE_SEL, mask, val);
 }
 
 static int vsc85xx_mdix_get(struct phy_device *phydev, u8 *mdix)
-- 
2.43.0


