Return-Path: <linux-renesas-soc+bounces-21116-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5A8B3E15D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Sep 2025 13:20:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6788320024B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Sep 2025 11:20:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37CDA313E2F;
	Mon,  1 Sep 2025 11:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ACrmQi/6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBCD242D72;
	Mon,  1 Sep 2025 11:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756725630; cv=none; b=eqszxzPjoiAY13Knjnc8oPybxXIjl68qs5MaKrAbrmV2RoXMr+BYshc8CGHKCflHYkbD7qvM5Dt+wMx3uoOKnIR3zNoWe5D2w75DUD5ovRiDaDxSm8YCmaOEf9/h91xbzot8vpifRDVRIQaMaxSz8NhBvKhuquAloHUpvMRwZCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756725630; c=relaxed/simple;
	bh=IPhZUxZEvQtUE0FgDVjnEFAeW5GD5N4tJyxUeZ7XkJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=neUmQDsZOGzfN37KifM8etQvez5jLRmQ8v36wU/+wCGQ1T5GiWpgnP9HJ+4DSUCpWGeKWEN51/DtwtSmpSpyqve8ODLBqN1lNtYhxL3iWQ4EbZh2bsZG8pYZokEbXyJM39xL9EWNSvnfBUG75/tk5LyrG2HeDE8/YBgt/OB9evo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ACrmQi/6; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3d0b6008a8bso1370069f8f.0;
        Mon, 01 Sep 2025 04:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756725627; x=1757330427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RSHoFyJn+Yap9IxU+R0pI9UF/LQIV/JZEsxiIz7pRy4=;
        b=ACrmQi/6ND6UmRphc2MnIL5giJSEjQJRbWb7049prhZEbpsKM79kjaeBtlX0WcHQ9E
         T3iVedF96dF+BeOU7XLhuJdocD5eL9ZY0O1PAaLL6b5SJSv3B621OW4VTquYRJ6l8w/k
         HdlwzSfbJpzWg+DBtrQarCGOZCtjBg49dZyaCEDrUoyirCiiHFANvQqAdZUviEX6S5w7
         5VZDptSwPi0SMA22R9mrT7CcoIy9NvTcGQQIeNZVqNE+0wi3Wiis8fLj0UWmkdrqfe4o
         Z8Wjqa60/tOsr2zFubhRmw+9EAwA8v5aEk7q8uvDQ4EO1V/qcLuC9nEP7jWVAcOjSzfM
         eqxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756725627; x=1757330427;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RSHoFyJn+Yap9IxU+R0pI9UF/LQIV/JZEsxiIz7pRy4=;
        b=tQ4ewqsP+nFeCh2TeJDn3V1WpUI3Lfqpw8TVM8IFalvA3lK0zhv4MFf0cWYABYWiGO
         +zMBl5qqQVEQGptWJhoNa0UyMGZk+uw80Os09T6S1Mcd6XpuMgAcdADOAzCRY2umLJz1
         ImFEK7BDR9Rfffn5FvMHKOL8j2tmekBD1ILk7B1uyvpVpaR6owO2/PrLePdcblMl3dvC
         Jmqs/B3WHkPpHBgRVV+MSfz3RtB7fA11tkP1zHEvFrJSHWy+u2T4unfBZvYdJA/Td5l0
         vqYrzCid9T8bdG2V2M59cUCaK0ucJA/dFOcWypStlgaIzBYS6yo/l/e2w5XHOYg7Apkg
         9/lA==
X-Forwarded-Encrypted: i=1; AJvYcCUE+TxXCZd4BKfzzDxVYO8BOgK8tLF6A4xF9kcC8J99u8icsTdjNRMMbbh+SbBChLSO/0J+TQO/zlp8TGI=@vger.kernel.org, AJvYcCV6ebEm1HVy6O6uJ83TeUo++Va/si4jbIIJZ9Ca5bSMxewrqqiOWt7HP5I+Sjo+8LERMqSmpNY0@vger.kernel.org
X-Gm-Message-State: AOJu0YwTKzcIouqN8eJCIBnXV7DMylOfeebBfv7KlQukbH/QqhkzUQOc
	U2R7ZlWppAU1HCESHIGz2nm7+dBEK43T+JnbVM986HrU0wA96CAjES7O
X-Gm-Gg: ASbGncsmF7DJgTDT4mUiLIU4Cc5etzbrP9Gp6miLidOpVsVNNgpzxqOuChoFODCSSFH
	b6+fQOnNDbv09H5UUS6iCfaxpiwREKSvTTwNi3zw1ecq5fxM+hM6eOR3N5XsOjGjoO3RVH3p6Xv
	OrVAlLng2G5ZU4RflVaIBFfLV8HFrugc4NBvI+pKgrrk1cqOOvueXkDHMwIBs9JE99jpHKN2W7f
	1kyNcmvkT6XT3UGH/1k1U9KDaq08RKvaF9NKcV2qXTLs5fwg9uOmr2RW57afF2DtimfPFN+xmXx
	VbOq9/DWwjfjwap+ACzk9e/bnc3e/3Fa/vhccaa/pXLCZh1f+0HcyjwVEVZw/1cDMBCLN8EaEih
	ZzWTcCN6Lz+PVZHy3B+gzvob6OWKdI6LRJv/6ezpShLA1GUN+qkKq0Egn
X-Google-Smtp-Source: AGHT+IG5U8mwhyymgDUr/F8sj+IWl+J4XI4TAAqLmLYpm6Muo/tUhK+s3c4TsHItuVGOqdSgNsf1LA==
X-Received: by 2002:a05:6000:2007:b0:3cf:3477:6bb7 with SMTP id ffacd0b85a97d-3d1e0a9424cmr6667805f8f.60.1756725626386;
        Mon, 01 Sep 2025 04:20:26 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:ca6c:86b2:c8f:84d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e68c83asm161625395e9.20.2025.09.01.04.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 04:20:25 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	stable@kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3] net: pcs: rzn1-miic: Correct MODCTRL register offset
Date: Mon,  1 Sep 2025 12:20:19 +0100
Message-ID: <20250901112019.16278-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Correct the Mode Control Register (MODCTRL) offset for RZ/N MIIC.
According to the R-IN Engine and Ethernet Peripherals Manual (Rev.1.30)
[0], Table 10.1 "Ethernet Accessory Register List", MODCTRL is at offset
0x8, not 0x20 as previously defined.

Offset 0x20 actually maps to the Port Trigger Control Register (PTCTRL),
which controls PTP_MODE[3:0] and RGMII_CLKSEL[4]. Using this incorrect
definition prevented the driver from configuring the SW_MODE[4:0] bits
in MODCTRL, which control the internal connection of Ethernet ports. As
a result, the MIIC could not be switched into the correct mode, leading
to link setup failures and non-functional Ethernet ports on affected
systems.

[0] https://www.renesas.com/en/document/mah/rzn1d-group-rzn1s-group-rzn1l-group-users-manual-r-engine-and-ethernet-peripherals?r=1054571

Fixes: 7dc54d3b8d91 ("net: pcs: add Renesas MII converter driver")
Cc: stable@kernel.org
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v2->v3:
- Dropped net-next prefix as this is a fix.
- Added tested-by tag from Wolfram.

v1->v2:
- Used correct subject prefix
- Updated commit message to clarify the issue.
---
 drivers/net/pcs/pcs-rzn1-miic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/pcs/pcs-rzn1-miic.c b/drivers/net/pcs/pcs-rzn1-miic.c
index d79bb9b06cd2..ce73d9474d5b 100644
--- a/drivers/net/pcs/pcs-rzn1-miic.c
+++ b/drivers/net/pcs/pcs-rzn1-miic.c
@@ -19,7 +19,7 @@
 #define MIIC_PRCMD			0x0
 #define MIIC_ESID_CODE			0x4
 
-#define MIIC_MODCTRL			0x20
+#define MIIC_MODCTRL			0x8
 #define MIIC_MODCTRL_SW_MODE		GENMASK(4, 0)
 
 #define MIIC_CONVCTRL(port)		(0x100 + (port) * 4)
-- 
2.51.0


