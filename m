Return-Path: <linux-renesas-soc+bounces-21137-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E614CB3F113
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 00:43:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B0891B2129C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Sep 2025 22:44:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC5F42848B0;
	Mon,  1 Sep 2025 22:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UP9Y8CBg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B012673B7;
	Mon,  1 Sep 2025 22:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756766624; cv=none; b=hEIthX9U8S0yfQzv71X81CaxylRAGDjY0JrvG8TpkbF7NWYa/CMbcS7P/KY76Ox4O/5JNCQFObchiVDjDYipj2fwY6MjKTLp2TzNe7uSWBzBKRL/BpGD01zKqJwEBbyMPhmHRygAna7H4PXPfweXW5o761Q/29gu2dzQjaemdbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756766624; c=relaxed/simple;
	bh=Vq2UxiNlmamtFa5vD+FFU5U+qndVWS4rG3PWFy2I7Mc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=upbEmTH1HRMrBEwiIdyep1XGLJ752EdeI7Gd5v3zR/LJJalxLSxQdYGjwPMHTBuA3fwjcMbGbEICLen9CcUTENEjJrrlBkyZSRl4n1LvES3J+edBazzd97sjtf41Jl3G+24PlOj1tqbm7UM+HOiwe+sTD3D0yNreOtmT+MCr9OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UP9Y8CBg; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3d0b6008a8bso1689651f8f.0;
        Mon, 01 Sep 2025 15:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756766621; x=1757371421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vQwlvdM3yntIS2m0mx9hBvGY1P/gMbdEn5SRgRXvS0c=;
        b=UP9Y8CBg9Yu9IwW/EQWg8e5mV8y6PDF/zX80Lp/1VndctyJtsc3tg+iFLFvLutubnb
         tjcohBCHx0AwP7hVyJzEMFtlscac3SkXjX9Jw8JsMaMSZXSD+eTQglPEtuI+v6gP1bbn
         VV3TxeGwBLy0gUC9cqE6kKNNMa57uxf+lHvbWV1YkXHcsJU2XzEc/B3Z/f1l9jE6bUz2
         S0mM9tsgXRNQAPQ1xPlPEEzbfw5BjgniKGlS0EehbVfrDX2tMOU1j2NOYFMd3ZgNwzrv
         9iR3I1hb1XM9VslbuNFNcPrnWddLJV7Licf0MIuVH6RdjhVQiale5sjqcdRxHTQ3++Bu
         jTzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756766621; x=1757371421;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vQwlvdM3yntIS2m0mx9hBvGY1P/gMbdEn5SRgRXvS0c=;
        b=t1OzdzDZYZ4zJ3G9nrVEmL2UdZBuglRqBmz7wmm7DXyutEKwPGYfuXkn4snreSrVvE
         I0QE5JMxIwzDZER2GqrdVpGN5vlKFcTL/cCrxkohmgG1yO7vBGIFGukRnS7+IrmLOqlZ
         8RsqsXyv7YjIKgjLYRQmNqBq08hQ5ltkVvtu0oE9lCqBlIUPM6dzWtg16rYezkMj6+OC
         JsQz80sf46l9wKRfVKGgUk4VcGSZUpySgk2Z2Q4GfreJKASKOMVuykuGSy3Tg3TBL/Zs
         S8cr/aAGTqFcjfIXAavghydziUKJE1RJuYLUSwqjyDcKoJLGslWI0mjcsfIML/O1n9Ud
         mDWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdiEwVKKim4v0TgbVgxlLX4WP5ZT0i8t2c/bIg5CI3LwsFJrLcdDRbhoiNMVQ43OGUiUBKstnlHYDSxu/H@vger.kernel.org, AJvYcCWzZmngA9VNikdFA1KkKSfzAkg3Fy9Z3cVkB45IenpybF7YiWtds9Fleeme2uNnU9A4WnieMOsidf+C@vger.kernel.org, AJvYcCXqFqjGHQ4/xKvAsSRvVHtY9uRBmcTG0tQQUnGon6/rECPeF5XoTelcH+SoOhEx78agy8LodDZ+@vger.kernel.org
X-Gm-Message-State: AOJu0Yxbx9vhtKdgbwNS4PGxdrnzNU86DJ4+d64R3enrJ4m7t+hzK9Zp
	TQH37Y9u/uDGwvsBaqm/u/Dj43ot/LGrbTezcgnGoS3izo27TVj/McPA
X-Gm-Gg: ASbGncsTag+EKUec1jFlobF2QqLNnqYHwWSmYsl89+Us5LrCPvGmyDGD47TtCpEORVx
	mA4Bl+Rqi3mLIeSrQ3IPOuAPg/qs1nfbsHb7creFPM3LJ7lM5rj1kg0aIQE1rxddRLSXfcKzGCF
	WGqlGrcD0+r+xnJxiB3AiAZ4So/IYmLLKXLXTe3kLH91pzmJ2fZm7jXdpjJDxHvjolStPqTY4hs
	/OZdQhPr+vRFRWhys0VHYS/uEShepI/4CfpEbN/CGBmKg/b0K/rHJj6KdR03MDVDDPhrAOp/W5+
	7G8M/JDjvcDs9mF2G6xUjYoiuQA9d790omDjgqmPuAQNfU/pyujOS3GQt2r5MglTYdaOrVGINCw
	ax2F7FnzjGE1cDlQmDBDzJPEjPVB/ek8wK+bv7XmVEkiPr5WUISgB1BdA
X-Google-Smtp-Source: AGHT+IFsoxOFpRjG0b3CHG2D85MSOexSs1C9xuuGb7XwFnXObdmZhe4eg/D+R7tnGX10034LvaFcgA==
X-Received: by 2002:a05:6000:2586:b0:3c2:95e7:c77a with SMTP id ffacd0b85a97d-3d1dfa183b5mr6432751f8f.32.1756766621216;
        Mon, 01 Sep 2025 15:43:41 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:ca6c:86b2:c8f:84d6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d2250115fdsm11532607f8f.40.2025.09.01.15.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 15:43:40 -0700 (PDT)
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
Subject: [PATCH net-next 00/10] Add PCS support for Renesas RZ/{T2H,N2H} SoCs
Date: Mon,  1 Sep 2025 23:43:13 +0100
Message-ID: <20250901224327.3429099-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Cheers,
Prabhakar

Lad Prabhakar (10):
  dt-bindings: net: pcs: renesas,rzn1-miic: Document RZ/T2H and RZ/N2H
    SoCs
  net: pcs: rzn1-miic: Drop trailing comma from of_device_id table
  net: pcs: rzn1-miic: Add missing include files
  net: pcs: rzn1-miic: Move configuration data to SoC-specific struct
  net: pcs: rzn1-miic: move port range handling into SoC data
  net: pcs: rzn1-miic: Make switch mode mask SoC-specific
  net: pcs: rzn1-miic: Add support to handle resets
  net: pcs: rzn1-miic: add per-SoC control for MIIC register unlock/lock
  net: pcs: rzn1-miic: Add RZ/T2H MIIC support
  net: pcs: rzn1-miic: Add PCS validate callback for RZ/T2H MIIC

 .../bindings/net/pcs/renesas,rzn1-miic.yaml   | 171 +++++++---
 drivers/net/pcs/Kconfig                       |  11 +-
 drivers/net/pcs/pcs-rzn1-miic.c               | 320 +++++++++++++++---
 include/dt-bindings/net/pcs-rzt2h-miic.h      |  23 ++
 4 files changed, 425 insertions(+), 100 deletions(-)
 create mode 100644 include/dt-bindings/net/pcs-rzt2h-miic.h

-- 
2.51.0


