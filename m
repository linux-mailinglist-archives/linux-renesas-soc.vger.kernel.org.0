Return-Path: <linux-renesas-soc+bounces-24451-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 091E0C4C932
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Nov 2025 10:14:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBED41881E41
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Nov 2025 09:11:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB89F2594BD;
	Tue, 11 Nov 2025 09:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YHBTgtD5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D46A29CEB
	for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Nov 2025 09:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762852263; cv=none; b=Y7g+QvW+i9/f4kunzeuZYeJ0J82yAqoqXy27RGMLzQP6JmY26Uuk8z+WRODa1Expns7AI+W7NYt7S6drVLW4ppF5MszxuEm1Pt9RRqeOssWuRLli8Zo/SGxvyJ2DU8ztH0/feRqtO/Vm2emUSisNa3ZOCgyOxj0zRVzKHYhwxQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762852263; c=relaxed/simple;
	bh=fUOYNNreolSQ2Ets4gWNGuLIPUyRj7lgKk+P2qLqWj0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bFg8H7tWP+h2MdF7lYi3RRDAH9ka/4CIflD5MM+slPM1v2hyN3pDS1x60yPuYJAOD23SAVyj74nwJxnjIRMUfEQGMjf3OYNEMk63YrU8wqAq5Aeir0urmQMEwZWjW3KoEflUVHPqvKbxt3uCKk8LyHbsJuOeHWL9FSiWu8qCnjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YHBTgtD5; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-bb7799edea8so1319208a12.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Nov 2025 01:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762852261; x=1763457061; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ei4lp7raydfScBEQVjNRebdWHLQLG3vpShzDTlbzIUQ=;
        b=YHBTgtD53VWa28QoqyU/xr+HxzMXqLzPV/kT6Dfo1+nff/dI0l/wkRGU9YpdfnWRmb
         7Ya304UQDc4orCHJjGWhs6WoG+wTXGipnMX/+NoK8xcDMKr60jyV9nXQSpr9uB8m3aWz
         alJz5UfND9/sbKFJCLVO4FXBtH7I3AO7UZv51qlqHW1QG8XneytOrpY5LKzT0bmlxMBA
         SPmj+2Bvy8SsGNvAtaZFwZvuPwIIp11U3K/oly5xXPUwsOTmdD7kRyDw9nP6ow/rOXg5
         hYg3SAcpFG/Uwc6t3S3nWivEEuom3gRYGtZBa4r+VTsVSEU4EgCoHDK4yf6Y51bToVQe
         rk7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762852261; x=1763457061;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ei4lp7raydfScBEQVjNRebdWHLQLG3vpShzDTlbzIUQ=;
        b=g4OJSRo901oHBp5Nv+y0/7XRp8OF38vAmuCzhioStRFkmkBEMAGI/+JO8YHhGOkGqq
         +wIdedbBMOApODKEVleuFgvI1P1z6oKMDyyBIykD+iR5xq05f5soibCfJt7/aG/O1/Yu
         Lur/DyrTDX6ofKBnbBklnDUwWLUyij+5tyl4OXx9qs/VpVw1YWi/BH4AYI+7Um/Z6JFR
         ThE+HbtsLtjTQ94ZAubSTxpxWFu59tEhofZeyRkoCJrlVXOELUnOF31dr4TdfpJ5EOmr
         i5AZPXeesR1fn+kNptefyqbt7ux3o1rGVD0w8b/WNoeP+FiM8GzR5w7EU9O3drlJoOh3
         qOfw==
X-Forwarded-Encrypted: i=1; AJvYcCVq83woWRckgaUNuiV89WPVKq67ctVtug9uslB/31VN+n06nljgWJ+IjwE3J6ak7sc8OZeNUZuwMxlVjYNvCMlESQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ3fC0i2Z8HEieijosspvoBSnfX9E5dQDf4AP9PQeDhUVRrI8j
	XiBBEDFlLgeuurdblHj+qaTki5eNDB5y9tOIJ/5KD3clzmCaanekoYCH
X-Gm-Gg: ASbGncuxuH7ay5+OqS0YDI2DWPpwMuuVCan9nUCoVJtbqsnV9/Trsoc3QeUmammJSy8
	+HGFWOHV4z8zwxPlzjoIplKGZVeXqz9QZ0axJkvc9MhyqQD/1UDZJJi9lxdPUEP6ZH8EyQDyuy/
	OJLapbCbmswUTDeJHzGh26DIULdvRER6rN9p0XOVMeej9qJAkTxJFP+2JQescw7Ybeud8oYQQp3
	27ximCGbn9Zwenjfqlf+YESxE4La2djExUiFdQiLH1B92c47oto8wcHW1coGWm1IrKECrhOWj/5
	GuLJEOj7ixgsDWhW/DeGZ5rsBL3FEamW3REeLqwOOtBt3L/KHlsptFY+/lKXqZ1ueKQIES28rDD
	qSNDy5Z5Bu68RE4LWn778z3RzVPqZA/QcBtcJaJk8N2MI/V9JI1a7qdFcnSXaKHcrWxn/IKz4YU
	AoJgyvr+TQyUTmq90+9WQ2pw==
X-Google-Smtp-Source: AGHT+IGOmhwf1aKWxS8ebaRXye3bUHf6DXtaZFP/uLYDWfPSSFe/z9UKAR9ho824eGYpyhhdq6AzWA==
X-Received: by 2002:a17:903:9cb:b0:298:1422:510d with SMTP id d9443c01a7336-29814225524mr93955685ad.48.1762852261420;
        Tue, 11 Nov 2025 01:11:01 -0800 (PST)
Received: from iku.. ([2401:4900:1c06:79c0:4ab7:69ea:ca5e:a64f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29650c5cf37sm172715415ad.35.2025.11.11.01.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 01:11:00 -0800 (PST)
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
	Vadim Fedorenko <vadim.fedorenko@linux.dev>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v3 0/3] net: phy: mscc: Add support for PHY LED control
Date: Tue, 11 Nov 2025 09:10:44 +0000
Message-ID: <20251111091047.831005-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series adds support for controlling the PHY LEDs on the
VSC85xx family of PHYs from Microsemi (now part of Renesas).
The first two patches simplify and consolidate existing probe code
the third patch introduces the LED control functionality.
The LED control feature allows users to configure the LED behavior
based on link activity, speed, and other criteria.

v2->v3:
- Added Reviewed-by tag to patches 1/3 and 3/3.
- Grouped check_rate_magic check in patch 2/3.
- Formatted the patches with `--diff-algorithm=patience` option to
  improve readability.

v1->v2:
- Patches 1/3 and 2/3 are new.
- Added LED control support to all VSC85xx PHY variants.
- Renamed led callbacks to vsc85xx_* for consistency.
- Defaulted the LEDs on probe to the default array before parsing DT.
- Used phy_modify() in vsc85xx_led_brightness_set()
- Return value of phy_read() checked in vsc85xx_led_hw_control_get()
- Reverse Christmas tree in vsc85xx_led_hw_is_supported()
- Updated the commit message to clarify the LED combine feature behavior.

Cheers,
Prabhakar

Lad Prabhakar (3):
  net: phy: mscc: Simplify LED mode update using phy_modify()
  net: phy: mscc: Consolidate probe functions into a common helper
  net: phy: mscc: Add support for PHY LED control

 drivers/net/phy/mscc/mscc.h      |   4 +
 drivers/net/phy/mscc/mscc_main.c | 494 +++++++++++++++++++++++--------
 2 files changed, 376 insertions(+), 122 deletions(-)

-- 
2.43.0


