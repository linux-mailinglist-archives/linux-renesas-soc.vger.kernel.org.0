Return-Path: <linux-renesas-soc+bounces-20765-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 868F9B2E2FE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 19:09:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 09EE31C27149
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 17:09:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74D84334390;
	Wed, 20 Aug 2025 17:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V8JHUcri"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F82B33438D;
	Wed, 20 Aug 2025 17:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755709763; cv=none; b=sTwRbvOPTgfvbkN00302h9dOKYR4iXlh08qOIzhbITWJnc6OPRagVTGjSPfXCDMc4gOBBjk9qMUkMPNmPzX4pZL48XWKcHjdPehZtYQ9wN849Ulk6c/vQVLn/0ZHJ8ri/xLNeS7QPSw9/SBpHM5YJ64aEOGI/DebQLVz6LyVnTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755709763; c=relaxed/simple;
	bh=onCZhWEZv0sN7Coawqrn23/OzfNd3gropWTNiiami5c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gcBeMT9Stl3qVE/EmYn6AiZk9WNuC4ONUNNuKny5UTO2Qc5H3R/B371SEiWb1FycXWJ8SoPCBSPY3HKhVu3A+fMYKi3EIh/7XWMlaWmf4s5Zaug2O417R9xqCLAc8zBPN9VGxf8cD1stK3OfQThdrEd79To5C2hC49rGDDCcxcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V8JHUcri; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45a15fd04d9so8213295e9.1;
        Wed, 20 Aug 2025 10:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755709760; x=1756314560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MPScU1ItNsuVBAeO87+rFDAEOXNN+q4yVoKKRyKs/Y8=;
        b=V8JHUcriW90da/vU6KZXDlJ9GE0hjG6J4p1pjE37Co1JvPN3pEHQAE0fviNjZeCeyk
         bk59hEEBdm1fHvYT46T6H0tuYZEe12hUKat2AxUzi+SinCDQg8akEylCo0k5FfGl7+C5
         Y9UhF+NKImQiWxinDopKSj+fe29babNSf9R5iOJY20vLs3qHEeB7u3C8DcdatAhflCfj
         eJu3tvwG8eNX5Kf9tgvqJ7U6JlzCtF1f2k7gH4MEa1jSHE/yz16Zx+PvLP1PMbVzT2XL
         Tos345Q73M8Na50BwLAlMt/ONEpFimK2Y+d5I45izw9HgutLeyg43d2C+hPPDsCAvABG
         JXHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755709760; x=1756314560;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MPScU1ItNsuVBAeO87+rFDAEOXNN+q4yVoKKRyKs/Y8=;
        b=mRHbkj3vSeObU5lzlSrxG48DcUryg+cEGTd7CN3CMuzJEKOO3/0Jb6hE+4o9gFwYn3
         V3Uww6CsRcZl5ltT0yVxYnEAhKjDqEs0FG0mG0pjaGnpQ3gaEaE1/IVqxYJB2721Unpq
         Ng+AgRRJF8UlxHUrOeWNlk2Sk7T2CEQf3LDExd6dUWZFi2+aq28+H0pCEqbQyASqaidG
         hrJP2NClDrWZWdjP3wsmvJJNe9N6pz8yzvptZI6SoWVm472PNidu7/WUSq18eETRNru0
         JkAJYq/ciDbpnTo3yhUG71FvsVRYAdnxm7EKqGXa4KAHuuO6orvPVNKWu+0IjrHGduut
         liCA==
X-Forwarded-Encrypted: i=1; AJvYcCU/YKyzLx3/eva2UVJMb/ZpPvmY1bWI49l9orb3w+2Gzc7WgR02e3idXiSxJab8eTPARhPR4Ms6FOQozRY=@vger.kernel.org, AJvYcCWKA5v0PSlhRG7OXhNmD63K3Z83vGv3+3kwUhYnIeMQEZim//LIIVFICdgxwW+EfHcEYAc1Pzl9@vger.kernel.org
X-Gm-Message-State: AOJu0YzuVpXdznGYQHP4RzsVriLr38I6dgAsrRBmhhQThtd5Lco2zzW6
	GiNs5FIEHh6e8nukksFB9OYquUesmGfAhCsfQnldZvePcD4mKOXtUFLp
X-Gm-Gg: ASbGncu90X3Y/Zs3W3s2t7RJQphBDK/AmnHm7vuhUlc5HcvT0fdR6/DmtUh/Q9vbB6C
	2aC3JR8RVWXwEWnD/leLEquXSJFPYnsisD7jK53zAjmiO8MwrtgLSIYhfJEdOaQ2CRZUab+f2Zl
	oWMV9aEaqc7emrMEfWb/2Q6/QsUnSn3qVQyR++OXmSZ9Bn7wklD2xb/s7zL+XlfQLNEbPlNNj8A
	Ut/XDyYpp9f21ZPTkGqFu/j63Spf8rIlUWrrlAbiCwu+PSNRA6iegLsX/R40Lp2/nyq34FvSecs
	Nb08iB+ZIVqjI0vhoOCQIP4r1JT65EPQa37OjaEzQuGplnaUY65RNp252MDjqhxDb5MrnEEkLHf
	XIgcnxmE98jBCO0tsuLRcPkxff7G11hotS+Q7IlZ0RE+IFWIFg4oqL260
X-Google-Smtp-Source: AGHT+IGMp/og93GJnnQsP8vZ8w4JEv8g3mF3aEsNkXrBBZYqPOCbIxmFaI1dS0QKUMPOwONj0CxqSQ==
X-Received: by 2002:a05:600c:64c8:b0:45b:47e1:f603 with SMTP id 5b1f17b1804b1-45b4c6449dfmr2721875e9.18.1755709759349;
        Wed, 20 Aug 2025 10:09:19 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:9b1:f84b:89f6:b00e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b47c605e8sm38532445e9.20.2025.08.20.10.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 10:09:18 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	stable@kernel.org
Subject: [PATCH net-next v2] net: pcs: rzn1-miic: Correct MODCTRL register offset
Date: Wed, 20 Aug 2025 18:09:13 +0100
Message-ID: <20250820170913.2037049-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
---
v1->v2:
- Used correct subject prefix
- Updated commit message to clarify the issue.

Hi All,

I've just build-tested this patch and found this issue while working
on a similar IP on the Renesas RZ/T2H SoC where the MODCTRL register
offset is also at offset 0x8.

Cheers, Prabhakar
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


