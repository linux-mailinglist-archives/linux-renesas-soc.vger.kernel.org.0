Return-Path: <linux-renesas-soc+bounces-20768-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D28C2B2E3B3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 19:26:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2BD40586794
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 17:21:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68CE634AB1A;
	Wed, 20 Aug 2025 17:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XfiVLPU0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD0B23F291;
	Wed, 20 Aug 2025 17:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755710300; cv=none; b=csaIpcgm9aa6Yf+J2TkGNSTD73qsXYjRa4q/hpvofVNzl8ZNwnByzWqLEnyGlvs2x5hhv3FY8Cyc/whl1TKY3o4BJjbprhwQyyPpp7wmtFI6fZ5bh7l02sORD3MVJjmJ0OyR5B2kViAyntRUi+j0HhAOWNdd/LWuYKXuEbXAmpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755710300; c=relaxed/simple;
	bh=PZlnTE4OxDhXiMdhi6XOZqY16nd2E693m3bmYm7ur/k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C/X70l2kTZJFSdWBboFA1TbO8InetZUxz4OiYDnftROk6Hf4Q16VYwb3NpJ8grp2MZSYhJ/KEw7XyoyX8m9rNfSMpDItQlq1V9aE3Tm+OZWNF6Zl4ENEo7w9uijo9k6/w3l2l013XbLCwie/cnonAjEA+dCpOlZ7P3tEmgwR5uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XfiVLPU0; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3b9d41c1963so110735f8f.0;
        Wed, 20 Aug 2025 10:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755710295; x=1756315095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y6eiwry4yNjMS2EnLyC1PO1PH1RUJzWiKmADaSQUZe4=;
        b=XfiVLPU0p99Fvhcq3SqVy7czMBT6JWRpqImpbJdMabLfsmYZBTdITwbcIfujx+iPij
         n5EWepyyOu/i4MppyQzlYNpvgE4G34hJv6ikpy2+7oHQEiibJl9LTkZlZKmONKFw6LJ2
         f1S78/kLWRIGwVRJV3jdInCQCcRyyAbu7WhlJJP4XNaXcMM3yhUE84BNXKPjBQa7+zd9
         EUkHEud6/ssC+ujSuLCGiJ5oQx558umEveol41YOc/mk7fKVfztmvSz1y1vv7788rRR+
         6/NcYsetWtychqKGatlHV0bUH/y9qQvH+8Ot6SrhBun3/esO0EqSifNOy5xAx6wqrdj1
         RqRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755710295; x=1756315095;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y6eiwry4yNjMS2EnLyC1PO1PH1RUJzWiKmADaSQUZe4=;
        b=w0yhTfViXwn9CKetPyKvNTKsWWnXlOCy27w0ulfhebGczWNGDVj1Ij5W1pwShTQqoO
         MMew2KpAlwEzlLOHHlCOcmTj84kIIH+3HgodGEeTKd3GN9ilfSQ4/xCamUgfUoA3mjvg
         nvoPoQsCNSEBkOqZhiv/oWXPmZdn+Qtt6ZACy5w/L2gxPfl9LtCdukgfbQWfWh0LkEbk
         LwL0hsDDjIWqyT0JwppJXcRwNv3Nc2E9xhB59eIacctjqgu26pFtGXuNumGQcaHVxkVq
         cIV1/OUxr3+c3dSRn0bkV6qGSqbIQB19E/AxsdvUJ9Vg7cTM0FWXHTG46JxcAX070XhX
         n6NQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPqlm5yZ1Alapn/O/FY6DuetIpqyb1eYjaRsYvZunlQgSz7k1gq6+e0OkvaSZYN0DlArdWo4Pbe6oW@vger.kernel.org, AJvYcCUQ6QulUS+/0znviFKC+5NhAtH/7rK4VEODTqxM/sHXsaW23B8DVM9Aqu+CS57UeWPh76HVRkXWhMo+iKsgynurvqM=@vger.kernel.org, AJvYcCVZJT9K7w19yYZzTCR4zbEFJzV91TdB1x2FxqKN4d/mebCJPZJIj10VCBcbsiaLne2ZcYwM1PMXLwmj@vger.kernel.org, AJvYcCVt6x1VWPtWgETYjdNG3szNy+Gmr+hlQvm8ASZgqJIQNrdnels6oQ+K2D25n2AE+5MCyuAbtXOKd7EV@vger.kernel.org, AJvYcCW/uYpQGoNj/P7Tz+EJJ4Qrb+fe5FTnpM7vvNGSohsvwxXZRInsdbuy9x2TZFgTzxKWYf5VaWEr8ESYyUqK@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo82jkL2Dd4FDrN+Rl4/btsJT6mexEHMTW++GpPLCaKB29Ddqn
	haRlXoh7OOofKGMEMy86l0KzKC/4zsI8eTTP0dAZWlowv3ZphlnVTmUHgK+ogJUw
X-Gm-Gg: ASbGncskZWQhLJI9R0YlrZjKsvQ8fDmlOttBMcHW2Fk1SgMBPYWZIvu/SsKyLX0MabU
	Pd54ke2WYBP53ybcCLTnHD0ex4qK8Drc2QQXGYwwpLKysou2Sw2cPmtQnzwFh0wwdsOBRncEnfg
	3wCRcVdaAzrNrs/DXhwRew7ATx4msJ9rkZq4u7qI/iF7mtWFMZZ3U0OfyK/rPLE92e6VYIgUr+z
	MQJh85vZ7a6xhKqESS1O6MRo7dJK4xnKohtRu28Qm+xK1mCdVwE0iIIbvGBJ5YxHdNmW7MmQ//F
	fQMCOwqcFeL54y+EZk0xeqtrSiIYzfFEaAWgErOwzjwoq2WF4CTgKzr0WOe1z7df4VamkIYVZ+I
	IK1cZTi/74pK9n/hKDPHZhFqwjB7EQOucO4E8kMyNZxgF3ahvOpRyi0u5f56gb0zzxXUIfDEAKQ
	==
X-Google-Smtp-Source: AGHT+IHAzw9Tb//dHCV1SUgEIlrfejXuuE6OLtUtwQVU9JGdDqzb/YHaQYf+2dRfIWaqPfe+zZOltw==
X-Received: by 2002:a05:6000:4011:b0:3b7:792c:e8d9 with SMTP id ffacd0b85a97d-3c32c529609mr2661092f8f.14.1755710295076;
        Wed, 20 Aug 2025 10:18:15 -0700 (PDT)
Received: from biju.lan (host31-53-6-191.range31-53.btcentralplus.com. [31.53.6.191])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b47c2865dsm40319815e9.2.2025.08.20.10.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 10:18:14 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-clk@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 00/11] Add RZ/G3E USB3.2 Gen1 Host Controller support
Date: Wed, 20 Aug 2025 18:17:47 +0100
Message-ID: <20250820171812.402519-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add RZ/G3E USB3.2 Gen1 Host Controller and PHY support. The USB3HOST
is compliant with the Universal Serial Bus 3.2 Specification Revision 1.0.
 - Supports 1 downstream USB receptacles
     - Number of SSP Gen2 or SS ports: 1
     - Number of HS or FS or LS ports: 1
 - Supports Super Speed Plus Gen2x1 (10 Gbps), Super Speed (5 Gbps),
   High Speed (480 Mbps), Full Speed (12Mbps), and Low Speed (1.5 Mbps).
 - Supports all transfer-types: Control, Bulk, Interrupt, Isochronous, and
   these split-transactions.
 - Supports Power Control and Over Current Detection.

Biju Das (11):
  dt-bindings: clock: renesas,r9a09g047-cpg: Add USB3.0 core clocks
  clk: renesas: r9a09g047: Add USB3.0 clocks/resets
  dt-bindings: phy: renesas: Document Renesas RZ/G3E USB3.0 PHY
  phy: renesas: Add Renesas RZ/G3E USB3.0 PHY driver
  usb: host: xhci-rcar: Move R-Car reg definitions
  dt-bindings: usb: Document Renesas RZ/G3E USB3HOST
  usb: host: xhci-plat: Add .post_resume_quirk for struct xhci_plat_priv
  usb: host: xhci-rcar: Add Renesas RZ/G3E USB3 Host driver support
  arm64: dts: renesas: r9a09g047: Add USB3 PHY/Host nodes
  arm64: dts: renesas: r9a09g047e57-smarc: Enable USB3HOST
  arm64: defconfig: Enable RZ/G3E USB3 PHY driver

 .../bindings/phy/renesas,rzg3e-usb3-phy.yaml  |  63 +++++
 .../bindings/usb/renesas,rzg3e-xhci.yaml      |  84 ++++++
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi    |  30 +++
 .../boot/dts/renesas/r9a09g047e57-smarc.dts   |  10 +
 .../boot/dts/renesas/renesas-smarc2.dtsi      |   8 +
 arch/arm64/configs/defconfig                  |   1 +
 drivers/clk/renesas/r9a09g047-cpg.c           |   9 +-
 drivers/phy/renesas/Kconfig                   |   7 +
 drivers/phy/renesas/Makefile                  |   1 +
 drivers/phy/renesas/phy-rzg3e-usb3.c          | 249 ++++++++++++++++++
 drivers/usb/host/Kconfig                      |   2 +-
 drivers/usb/host/xhci-plat.c                  |  14 +
 drivers/usb/host/xhci-plat.h                  |   1 +
 drivers/usb/host/xhci-rcar-regs.h             |  49 ++++
 drivers/usb/host/xhci-rcar.c                  | 100 +++----
 drivers/usb/host/xhci-rzg3e-regs.h            |  12 +
 .../dt-bindings/clock/renesas,r9a09g047-cpg.h |   2 +
 17 files changed, 596 insertions(+), 46 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/renesas,rzg3e-usb3-phy.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/renesas,rzg3e-xhci.yaml
 create mode 100644 drivers/phy/renesas/phy-rzg3e-usb3.c
 create mode 100644 drivers/usb/host/xhci-rcar-regs.h
 create mode 100644 drivers/usb/host/xhci-rzg3e-regs.h

-- 
2.43.0


