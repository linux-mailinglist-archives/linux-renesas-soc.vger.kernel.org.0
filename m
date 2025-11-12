Return-Path: <linux-renesas-soc+bounces-24495-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39227C52A37
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Nov 2025 15:15:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D90E3AAACA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Nov 2025 13:59:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EA40339B28;
	Wed, 12 Nov 2025 13:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mH5g/mvo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2F63396F7
	for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Nov 2025 13:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762955862; cv=none; b=iNiNY+k/Omv3toh9/aNS033R+WJKf6rvzKtaHXTcWPE1UFMuUE00lpyKljYL7ct7oMtWfqr2BVON2NGCRIB6eZgki6NcgBHfQ8d7OR3hiObozPDFrzXmsDZTYnsXnkuAr1snm25CbtxzIIlxjqad1n6ZNAglz3dTrRuRT/sy7hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762955862; c=relaxed/simple;
	bh=x1YSbtYbRyTPSIhv0/6W+8ceVWJJTyabUu/t8xJbjYY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o8/niv9KPmeMDVnG7eWQf1Xzhj6RyOx89UsSTvmI4xq/r4Pe+uBb9Wr5sbIFW/lReKC9KDOXHRUTJM/3SkCgD1vNU3tP1z1WL++NCTFr1mFDjK8BkoRsHxgVJGx597jKTQtrDy1vUO9CTki3Esw5RQuOclwP911ynCay+qaJkMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mH5g/mvo; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7af6a6f20easo812453b3a.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Nov 2025 05:57:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762955860; x=1763560660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iSrL1EoqDUfnyHQYh0k/jlWwCZWampIQnukH68EzSFQ=;
        b=mH5g/mvo8k/a/WwAJJt9PSQAQFLYAC0cqhaA7TwV5ElIHX0pTFAN1/MG2YyiIQdPrM
         ay44YH6e2Wb9fzij2PfoWALQ0QeaG4v9QWJVTOPb+yTKbKnxFQmXRxjjfigIwIXBaa6L
         Oxtpw8Q6mDm8O/GGFFFpykzAzutcWkw2chJbckiChhLl+JvKr9o4IqRDovJviMq8zlEk
         RZx6HAoMrKM7dL8wNQE9bG2NcCQfKVZYHz/btbIXhd3vJZnvEi35/kLM8VKnNl01DQeL
         YRRmI0MhbVjjJMjF3zSu1lYePRqfBBQRl6ZbIlAOtc1Wcl1aj+9MM9F9cSXdMgtkYsd5
         GT0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762955860; x=1763560660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iSrL1EoqDUfnyHQYh0k/jlWwCZWampIQnukH68EzSFQ=;
        b=wtKXOfVdDwSpJMC0t2JqSSWxtsoSJkfvpR/x5nsmDkVIU8fSJVmaoDPfYhBg01El+R
         IJ4C06RWmhlsz2Lfwg9vGIowPJFPtmzYcWd30KAR6A+lwvvlGE66LFsG7iw4AAt7oHBm
         XUfxu9qEVrg1FCXMeiWw45jhZ92P9AZjR47yQDzpx/cqBa56GcWELTy9TgTBHdcpKZyW
         c0l6f3BAVSMPPdSBODzOCojQ/pEIEdZWkiMpyJmQhgCABMA/bOk5LyhLKBA7Z3iLgOvv
         GNTsqHTd6TCDjq5Ou42BtpDHngtFjX5YGeya//Inx2U40oQXjyigd5i2L3jklXl8FiW0
         eXKg==
X-Forwarded-Encrypted: i=1; AJvYcCXdNMC82R8VLhyU46WLYkJ4wlSCNf9LZBFC9bxOczHCs2rqEfbVnEvQOLun3EQgWs4zGQpBuR2AenzZCxPpJCWcWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyD3ftzxQg4o14236NqZ9FS2u+6q96h367wtY+ao45BoR+7vdKz
	WiHwRZC3QE9yxpBzp9m8fDyyO6qK2PkfsnogGVIhSlMJlUfngOA0vt1w
X-Gm-Gg: ASbGncv4oihBoguHyf5y0YjQmtwOWSzIIaeSbbjTbdisXhboHMQC5j0vdIuKNnRhHWw
	t1rxjYDbCNCkPI4nKRe+sBpnXlNchAZiqgx1vE4og8HV+ky53jvAIyYWvqOM2ES1yUQDPQh7zli
	Y4RlLGIm1H25oxQSMjvRwg/eBnVAB7VYsPBkEFmEuapoIDBDj10sgIcIGqfpVN202yBgZgdgDkE
	0OPtEu1hnUp8ee4Lrf+/q+yo1DZQuga0HXwpAtU75yBT6+6fZaO9t2g9++KSNmrHuWWicP3dtU6
	i5MQjNpLfcZuHkf1lRgyvP5ldTTIstntQ0pRV+wtirPlW83fQOtCUoxQIiQGWBivHPhE3T2UsLY
	tnTyHVoKgSYzJfUtlLex1twbdudkRZaNWzivq59NAesbrXf2n9WeFyLPNfAGA55kSA1LJK8vftH
	sW1zTgRGtEU33rw6/op89A
X-Google-Smtp-Source: AGHT+IH8wA3xt+CQCkNui2Syc/fmlLx07b5o60cQDt4Q0PQIytlU1FHXoiYwxMvPJRREYg1Iq4EEZg==
X-Received: by 2002:a05:6a00:855:b0:7ab:78be:3212 with SMTP id d2e1a72fcca58-7b7a4af65bdmr3263452b3a.19.1762955859786;
        Wed, 12 Nov 2025 05:57:39 -0800 (PST)
Received: from iku.. ([2401:4900:1c07:5748:1c6:5ce6:4f04:5b55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0f9aabfc0sm18361299b3a.13.2025.11.12.05.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 05:57:39 -0800 (PST)
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
	Parthiban.Veerasooran@microchip.com
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v4 1/4] net: phy: mscc: Simplify LED mode update using phy_modify()
Date: Wed, 12 Nov 2025 13:57:12 +0000
Message-ID: <20251112135715.1017117-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251112135715.1017117-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251112135715.1017117-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
v3->v4:
- No change

v2->v3:
- Added Reviewed-by tag.

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
+	u16 mask = LED_MODE_SEL_MASK(led_num);
+	u16 val = LED_MODE_SEL(led_num, mode);
 
-	mutex_lock(&phydev->lock);
-	reg_val = phy_read(phydev, MSCC_PHY_LED_MODE_SEL);
-	reg_val &= ~LED_MODE_SEL_MASK(led_num);
-	reg_val |= LED_MODE_SEL(led_num, (u16)mode);
-	rc = phy_write(phydev, MSCC_PHY_LED_MODE_SEL, reg_val);
-	mutex_unlock(&phydev->lock);
-
-	return rc;
+	return phy_modify(phydev, MSCC_PHY_LED_MODE_SEL, mask, val);
 }
 
 static int vsc85xx_mdix_get(struct phy_device *phydev, u8 *mdix)
-- 
2.43.0


