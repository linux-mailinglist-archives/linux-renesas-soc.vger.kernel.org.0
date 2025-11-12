Return-Path: <linux-renesas-soc+bounces-24494-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FCCC52A3D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Nov 2025 15:15:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2FBEA3A9947
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Nov 2025 13:59:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06E6426ED3A;
	Wed, 12 Nov 2025 13:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fkQAr3bH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F576229B12
	for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Nov 2025 13:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762955854; cv=none; b=FUaAoE+OAHurUGY5EvERI/XqFaXGJhKc/T9btnDzPN5RQp4FWDqeiwkYrm7VpzF0CCiyQVIQoj7sllg9/ZaKWan7lqeb8nbbVa18lzbAQq7W6jTsga12CRfGrb2YdAnV0x7ykwFlzGxaUF0RHb6+T4HywOkyY1f4SjZleSnmMC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762955854; c=relaxed/simple;
	bh=k2G+UAOlxryfN7Ts6BKG6DLQwr8X02cUPkX0Arp69f0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WK9zLKTSn/EtRNtvn0j97zezMf8gE+tTeq+5RrBmweWXOPQ4n/enNp+T4NKjlBxX2p9x5IWTILDSfwDAou950uDB1EyC2mewRlOPEqVC3k6DIcJ/QERrsHzNYDlCOwuW+OkE2Ap1poRbm7/55eWiMcXXFPs/1C65fdXS2FD4oSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fkQAr3bH; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7b852bb31d9so445688b3a.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Nov 2025 05:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762955853; x=1763560653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Lt/l+8Leq/bLhALiuQnMosDsUZRfKXTeoOFBaF6JTLw=;
        b=fkQAr3bH3AuLuM0DP7CIc02Zg9Iq30NQIVufcrlpZTNRJisyIoHQu0IH88lHd2OtvW
         fxIKN/UFOiaJMoJ7uK0huTo0Nc3tSZ482+NC1P3hm9Lrl7pmeBbG9TEzKn2eaoyW6Xnf
         ipWc+7HAg/cWq1sbT91iLPpKRzJfByYX8d5LOTGrNfTFZHUluCdYuvILV2g6Jfp4m+rp
         nelLGlEmNzpmLhMKKruPNID52ikJIOabNbhcI2Yc48Tr5/gSqn1Vo4/S8mLQfqUrgfMb
         ny7VR4kKGeL9/34SUfi/jhIy5kaFkAliBx4GmBUpTQaEekLftmJ8kzdc+cYjScV1BYSs
         JTqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762955853; x=1763560653;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lt/l+8Leq/bLhALiuQnMosDsUZRfKXTeoOFBaF6JTLw=;
        b=QutWlLIzmZCdlfIUkRfGo4zdqlrmQ1ZcX4MIYxfhREZwmlBTkCy3e6zp5wV8Ot1kfE
         h95KWqZVihGp7g6pUtWuboHTlD8cl1yBjdFSYtUyiRFP/61wEESR+9DX/XyGR4KPAUsf
         LEe8BCmEeMDWVUddb2pWzg+CYHeuRl0zYfozBpnWpAA7sIq2HHCsfSpAg77zkhJgPu0X
         2T0AphOWqXwHsIbOmvpubW147dDLziFlB8HQTgrigza3cIYncVwcZLXZSKAxcziYM3kv
         nloCC9T7l1kBInH4pHtqe3jKJYIBF6RlpsTvYpKPwodVQ1EbcpCqAZyLVlB67fXcgHkK
         xhiQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8JrRR0AWgmGPhCXyiXuT4/ReKAExv9L7jIUEQd/lKOKzG/Cv2T92ZeDK/FQfBx1c48JugpTEPbwPb09ZRJjqUVA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmuyZYcTRHsur+rg1w0D/D/V3Bj5+Ni2usKCj44eVvEMsWpwLV
	5PHndzYt00tKuVG+7COz1VvDMrxSuOeMX73y3Az7r023scHUSaDLVrKY
X-Gm-Gg: ASbGnctah1hj1effzA7u1w/ksYcoA6TOn66lY0WGq70k881h71RGOZOqFQxPIdMu87t
	KE+yDIe8zlbbpmJt5Xy7G6GuYpaqgs6W3SEj9t5/Dv8AsW67K2KgU2zMp1rFK+l9jRkk1aLyTG+
	VuFpHMpexKW4RkrAqiPlNSwRyl5Joa5BjlIXuhe2D7huaE2sg7q6tBsTR3OL+5AdyTkQNa9YFEt
	ymZ9k3aKlgmnKUoqoA/qdERcW/X2SaeJTYv66CKwYEtWkKgRTj3NsOSASQJ2F8m8mTGCpHDCfrp
	pWDTOBvG7YbnN1R40XEPsJeRm3hPV7AAgBKue20jnr9GAGaDo0euxYpmmbl0drSgvHrnIgnyn5a
	JfWuLT5MEEuI74kZRxrMHmNHzNEhq0dnA5g7qgNuuTbYwRqy6mcaUKMFTShu9HGVCUNbXbiXXYf
	h1VTsjUcWr/H3yIAEnPW5/
X-Google-Smtp-Source: AGHT+IHZ/VsvfL1qBauYYeHFVM1I2oce6UrmCkeGZ0waGhdgmzOFEbz48XMrpfJQfxZr/VfEUub6bA==
X-Received: by 2002:a05:6a00:124e:b0:7b8:758c:7e86 with SMTP id d2e1a72fcca58-7b8759bc702mr941901b3a.15.1762955852653;
        Wed, 12 Nov 2025 05:57:32 -0800 (PST)
Received: from iku.. ([2401:4900:1c07:5748:1c6:5ce6:4f04:5b55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0f9aabfc0sm18361299b3a.13.2025.11.12.05.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 05:57:31 -0800 (PST)
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
Subject: [PATCH net-next v4 0/4] net: phy: mscc: Add support for PHY LED control
Date: Wed, 12 Nov 2025 13:57:11 +0000
Message-ID: <20251112135715.1017117-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

v3->v4:
- Sorted the members of vsc85xx_probe_config struct to avoid the
  holes
- Fixed Reverse Christmas tree in vsc85xx_led_combine_disable_set()
- Added Reviewed-by tag
- Added new patch 4/4 to handle devm_phy_package_join()
  failure in vsc85xx_probe_common()

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

Lad Prabhakar (4):
  net: phy: mscc: Simplify LED mode update using phy_modify()
  net: phy: mscc: Consolidate probe functions into a common helper
  net: phy: mscc: Add support for PHY LED control
  net: phy: mscc: Handle devm_phy_package_join() failure in
    vsc85xx_probe_common()

 drivers/net/phy/mscc/mscc.h      |   4 +
 drivers/net/phy/mscc/mscc_main.c | 497 +++++++++++++++++++++++--------
 2 files changed, 379 insertions(+), 122 deletions(-)

-- 
2.43.0


