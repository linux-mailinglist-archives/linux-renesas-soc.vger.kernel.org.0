Return-Path: <linux-renesas-soc+bounces-21739-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C0EB52267
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 22:41:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 44AAD1C85964
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 20:42:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46AEB2F28E3;
	Wed, 10 Sep 2025 20:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TQLy6yPe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6645F1D8DFB;
	Wed, 10 Sep 2025 20:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757536900; cv=none; b=bimTcCczJMhldVZw9V6Qb/KoD/jRUP6slH1/05H14ol3zEhxeBJawEvcWOxcZqNZ+qNDONkINLOpYEuuGBH4tc1E9KGK8e7F1Ojk36GF9p8IEoCZgaPAX3t+cQ17PNIIgX9rdMCttMRY/tY9eCtt5ZtM4xpxTLe1HBRRCBwuWWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757536900; c=relaxed/simple;
	bh=0oagLe8fOnXISlWeTa/kfm/g6uzMEFeSXwJhXsqFDUc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kAiyY4r/wTvoL9dnf2lib1U0cAUb1rDXUrHQIH8SY0mFiZW73cS3l4efB/DV7zFi2ec25R1dbS9+WGQ/9ypCowZA+CyCbbxAErI6SXJtGlnwn+I27pHnL7xCXdBWZEibQe3FVfiZHiSAF5tpk8nU6QOqEwoqG2BagD85U5Dv1eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TQLy6yPe; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45b9c35bc0aso191885e9.2;
        Wed, 10 Sep 2025 13:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757536897; x=1758141697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=onEVVy/te+kVlImFH7TVFonDeLnTecLrkLYITcBmYWk=;
        b=TQLy6yPe85DCGnmGSxG+3SNaR2sDRpaKMXWpYm4nQIl9tfwL2RFcLeZZog2yrbULs8
         iNyLmjD9wRl48uNqcM1C8F/D4eqvOetl/d2xu1fA1BNplmzHVHAaJAZZ9TpPH7wbkCPI
         bml9Vts9IdbhgSLqEqLZ7ac5r3wt71SRs4n7W/eN6I1lalckqYAnseIZF7l1xDGa7t4U
         YVYp28oohFr6mAr7bxAKrLLf+SBCRTxLydYlChbcG0GgF0Sa3PPvrXI1ViWFvlVHgMls
         0r6eBJp5IyZ8lQy4BznJqMx/QksSFmyFnipr2FTqLIQclFxor2xOJcJThXq1gAezQRx/
         Rv1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757536897; x=1758141697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=onEVVy/te+kVlImFH7TVFonDeLnTecLrkLYITcBmYWk=;
        b=LmJ4XW9QZ1x2zH+R3G2+zhyV8Tkwz+/ViETWD0xUfWLatno3q1yGfg8ZH8CI4yL4/s
         Sh7K8+LyrKrzIh/UE1H5OGFKlYf5yGWDhOssmslFdZq9a96cSYQzykF5jjsGc2jAkzZA
         L9lC/G7ONWsKiqGwZsGXMu5qFgWR8dnHigwdLY2k2B7Bsyjd3LvLlBcvnpQdVxDSuIWv
         3KxjUwTdui5rxV4HAWLF0FYuTXxvrbL06d1PH9axbLBH9xIS/gICf7yan3UkJZ4P8Dr0
         CAaRoDEe9ZZzzyy2B8+OmZfeRTr9BAQ0GGke6uY0GQXLa0tJwVT9O+thY2WBpYriUqQM
         Z/jA==
X-Forwarded-Encrypted: i=1; AJvYcCU/MRzKUkTTYWKLzdfeLGmay8/0M0JJCkjS9iCVc6Xq+/Q5fbdUwafahn58fXb4P8AV1aTPdYOWrUiHq+gN@vger.kernel.org, AJvYcCVPF1EPcwSz5rBXi3yXNua6dZWhZ4L+zRRdbPsqO6FrmiBZTaVRr5Lt0/cQNM/c0vNBytixEFF6@vger.kernel.org, AJvYcCVo8Lxvw63MWE8d1EoNvv6wlNGB/kAmvekMDiI2uHqXTifqCxexhJwhn9HGVKXVSypG5OXbQ2Rr5bGj@vger.kernel.org
X-Gm-Message-State: AOJu0YzAtmDr/iEWB0YvGUpGYiz6vEXRYigG2Aif0/2dEFyLHo8JyC6b
	mq4vEgq5f0DHmFKsCEMEz8WYLBoXUzDW7wFVeRisTykvrsg+GDFA7Arc
X-Gm-Gg: ASbGnctkf2DzlYcde/KeeiLGQB8X9Gn7Y4NkODVZKmIpfyLN4NJKQXIUuoOijqXWNwH
	0mtnXIoaQ6e5/Lx4DyUDQzwPEaBOyr0jWzJ6fwekHs7A6vdV5fkPpRxtBzw5bx5LR9XyDDBYmAD
	6+CAc8nHiFZPd9YYqsrjhDkSaf+8dIEu3b8zGZ4NweymcYLWFO2vkXOdypi9nuFAZeWgKN7mExj
	+6Jw132UgveCcAA4J5YLOjg3+MpIM5ELpv117vilPo0X8LHQQ4bfTKpqjoUOyq1NmpE+5/j5dni
	xd3CFNn52jFGaYwKfC4HOSL8k4aD71T2slngUassdk5vouZKuJcTPi70LQJWHmZpyyckBg8Yx/H
	fNFVXhX2RPNTNKz0mIS981isjhix6kD4Mqy6RApa6VaQc0n0=
X-Google-Smtp-Source: AGHT+IH0FrdKxhb/OfkMmU6nPKsme3pPVultPw48KOkIWOb5cvaoD/X9ldikvmsGnulePcw+v1BObw==
X-Received: by 2002:a05:600c:1c1b:b0:45d:e6b6:55fe with SMTP id 5b1f17b1804b1-45ded9fb96bmr70479505e9.34.1757536896503;
        Wed, 10 Sep 2025 13:41:36 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:ee64:b92b:f8fd:6cd8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e0157d68esm320085e9.6.2025.09.10.13.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 13:41:35 -0700 (PDT)
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
Subject: [PATCH net-next v3 0/9] Add PCS support for Renesas RZ/{T2H,N2H} SoCs
Date: Wed, 10 Sep 2025 21:41:21 +0100
Message-ID: <20250910204132.319975-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This series aims to add PCS support for the Renesas RZ/T2H and RZ/N2H SoCs
These SoCs include a MII converter (MIIC) that converts MII to RMII/RGMII
or can be set in pass-through mode for MII similar to the RZ/N1 SoC. The
MIIC is used in conjunction with the Ethernet switch (ETHSW) available on
these SoCs.

v2->v3:
- Moved reset handling from probe to a separate function
  miic_reset_control_init() to avoid checkpatch warnings.
- Added a comment about replacing with FIELD_PREP().
- Dropped inlining of miic_unlock_regs().
- Dropped inlining of miic_lock_regs().
- Fixed checkpatch warning to fit within 80 columns.
- Added Tested-by tag from Wolfram.
- Added Reviewed-by tag from Andrew.

v1->v2:
- Dropped regx in title and description in patch 1/9.
- As done for other IPs used T2H compatible as a fallback for N2H.
- Renamed pcs-rzt2h-miic.h -> renesas,r9a09g077-pcs-miic.h
- Added matrix table in the new header file.
- Corrected the resets check for RZ/N1.
- Updated the commit message in patch 1/9.
- Dropped regx in config description in patch 9/9.
- Dropped patch "net: pcs: rzn1-miic: Add PCS validate callback
  for RZ/T2H MIIC" is this already taken care in commit 508df2de7b3e
  as pointed by Russell King.

Cheers,
Prabhakar

Lad Prabhakar (9):
  dt-bindings: net: pcs: renesas,rzn1-miic: Add RZ/T2H and RZ/N2H
    support
  net: pcs: rzn1-miic: Drop trailing comma from of_device_id table
  net: pcs: rzn1-miic: Add missing include files
  net: pcs: rzn1-miic: Move configuration data to SoC-specific struct
  net: pcs: rzn1-miic: move port range handling into SoC data
  net: pcs: rzn1-miic: Make switch mode mask SoC-specific
  net: pcs: rzn1-miic: Add support to handle resets
  net: pcs: rzn1-miic: Add per-SoC control for MIIC register unlock/lock
  net: pcs: rzn1-miic: Add RZ/T2H MIIC support

 .../bindings/net/pcs/renesas,rzn1-miic.yaml   | 177 +++++++---
 drivers/net/pcs/Kconfig                       |  11 +-
 drivers/net/pcs/pcs-rzn1-miic.c               | 317 +++++++++++++++---
 .../net/renesas,r9a09g077-pcs-miic.h          |  36 ++
 4 files changed, 440 insertions(+), 101 deletions(-)
 create mode 100644 include/dt-bindings/net/renesas,r9a09g077-pcs-miic.h

-- 
2.51.0


