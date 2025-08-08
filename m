Return-Path: <linux-renesas-soc+bounces-20121-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CAB6B1E215
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Aug 2025 08:18:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED20A72290D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Aug 2025 06:18:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E05731C5F27;
	Fri,  8 Aug 2025 06:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="auuxo5UR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D87B2040AB
	for <linux-renesas-soc@vger.kernel.org>; Fri,  8 Aug 2025 06:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754633906; cv=none; b=gfZNqWiwtlZbFMm60HkoXR47rCzJYTNP1q5ZdZz0XVVi6JeaFmnO4VaHK3GDP6oSoCkEg0bJiXtD1N8rxjUtx3AzqDm6/1vv2gNqKvQ4oAotqHGy+XE3xsBejjH68KCxOqsX7sUlaO2d0BgvtRmYo1+7P8suRuaouqIoytGJn9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754633906; c=relaxed/simple;
	bh=JyAjUtDuOImnbZKLQT/nhzrv1gzP3ETZmP1dR9y04u4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=g98XMtVp1bKtgIMqYsWjOYM0crK8yBwzHz+AD2HYEJ1C9jGz+1fr00+5/u0VCnZ4fv8Hph+QkUvpNujKZKoIlCSraTaCBIdAKZZzKBwcRbsYEw0Yj7yF40EEzl9PN102CWxfLe4Nvz8ZZSkl/lJ9YGWFgTY6gKUoQ80NRTcq7Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=auuxo5UR; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-af97c0290dcso325586266b.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 Aug 2025 23:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1754633902; x=1755238702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nuZ2X2uvDZW/QwJVtuhRwQb+8gAZBCL2rYVGCJvYNxc=;
        b=auuxo5URIeAsB9JKE8e+p9Jx2OkGJw+7tVn+hPIciJV0cD7ynFDSu9mrQQv8S2e+mr
         /HpkPNUmyVlYdt4WxlvyEHJP6ERqmxY4t57/l4ajPvHfzIxC8ByomRD/xaJN2UZ/tt3b
         tQjxMz3epZTM9hD+jhX9vi6vNqPLD+jos9IEIKaT3ks594ATU+8Uo7KYXFqENR5CHwbm
         mE4jDoB3IlPFd6PZtjbUPuGbK7ku7BtjhZJgQGP4aVHsK1/XqVDuy2ZspZwUD5uBKIAo
         d4kuDbffizoNJhyfNGw7RuO2upKVM3USgpwseToZDhZGzXajxTV0eY1tkVcDG0YtnTqa
         MgHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754633902; x=1755238702;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nuZ2X2uvDZW/QwJVtuhRwQb+8gAZBCL2rYVGCJvYNxc=;
        b=pUK9S5JCNG5u37zEnTjv1Qq8HVBIbHsRW4WjiY8fVLhiohrWRv00NUEEIO2PTVo+Ct
         zzU5gpQXztiRasROLKZP8VdkMUn+bzuSq+htoXUCa3kgkNCGQkaiExhNIxvnhoC88zwE
         uFYvgjmPLBQMk/0/I3BL3evvvQiknfMl5EvZm+DKzR69h2u6hlZQYozFP8jfRDZ9asOR
         WBj+W0k1Q+IqrEAKhVEn2+k4eWhIh+Hs7YP46AmwoYcwKxs0D9F7mlLDruZIDCk+891w
         EshZf83DjrzTUn8bkiJTPVFOU2G06qcgUs1+xxbwE6q8TfrAtqhNaYNWzxXxjOjOoepg
         ZUGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeDJZmoF7DuxLdAaly8N6bTlZ4maGlr8NhGGl3LM4r2tyAz7zZ+/X9YCh8h4JTEfCCVNnfDwobj2+orixfNpJoJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJZ2bUaMUO9+ScHz0YMoOeAK0IWKCP/mRLzZQI7rjKSL0xz1IK
	RhYnhOH+ufr2nPN+1urEuDu7bqNRg7hx0m/6HC1KBcOKUTFnG6FkNuXHaE1daf8IH2Q=
X-Gm-Gg: ASbGncvEgAIQDX/iD8AUOawkZX9s0+jOXatHXKvGbvgMjCezwHCfN748zRzsm+DXBTi
	QBnvVCVDlol5pNk9OX2SqM+IHvsdbD1beeBfnkEdRg3Qm2hDxBsQiEn8OLyUBKPJLA1trwBXymV
	C54656dPuTYcUAyWi1L48+smr6MlQBBgrtgiViYCrIOe5Lx4vSctBf/aXZvAgmmfw7QBSTfSkJ/
	henRAM5RXFd+OrfJAA8OkvEL7lutatLBXxKfKkyo3994fMRVY25berCMB6QGgBBZe/t404yYfyn
	zHPfy3Y7WNgidBIBFLJGwFcpijkOpMBfvqNezGEeejGwj1tkWus/5aBB8EArvcBatbqpyBMtxlB
	mJGiFN+Q4Pu903gCLNM55aLCO5tKLBRaemdqopv4la++U0bfDodmGnhGiRM9JKLQ=
X-Google-Smtp-Source: AGHT+IEwGK4jwyrQfta/yTZ2mn/vNBgF8FmAnOkamToNajt0a9aA/7FtQL3YSpLxw7XC3zyWoozhkQ==
X-Received: by 2002:a17:907:980b:b0:af9:a8a6:d5eb with SMTP id a640c23a62f3a-af9c61ef700mr156526266b.0.1754633902453;
        Thu, 07 Aug 2025 23:18:22 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.188])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a218ab4sm1440488566b.92.2025.08.07.23.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 23:18:21 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	yoshihiro.shimoda.uh@renesas.com,
	biju.das.jz@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 0/8] Add initial USB support for the Renesas RZ/G3S SoC
Date: Fri,  8 Aug 2025 09:17:58 +0300
Message-ID: <20250808061806.2729274-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

Series adds initial USB support for the Renesas RZ/G3S SoC.

Series is split as follows:
- patches 1/8		- add syscon regmap support to SYSC driver support; this
			  is necessary for the USB PHY CTRL driver to
			  set the PWRRDY in the SYSC address space
- patches 2-3/8		- fixes on bindings and driver for USB PHY
- patches 4-6/8		- updates the rzg2l-usbphy-ctrl driver and documentation
			  with support for setting PWRRDY though SYSC
- patches 7-8/12	- add device tree support

Merge strategy, if any:
- patches 1,7-8/8 can go through Renesas tree
- patches 2-3/8 can go through the PHY tree
- patches 4-6/8 can go through the reset tree

Thank you,
Claudiu Beznea

Changes in v4:
- replaced "renesas,sysc-signals" DT property with "renesas,sysc-pwrrdy"
- dropped the "renesas,sysc-signals" property from USB PHY (as proposed
  in v3) and let only the USB PHY CTRL driver to handle it as on RZ/G3S
  the USB PHY CTRL driver needs to be probed before any other USB driver
- dropped the signal abstraction from SYSC driver as there is no need
  for reference counting it now
- adjusted the "soc: renesas: rz-sysc: Add syscon/regmap support" to
  comply with the latest review comments

Changes in v3:
- as the basics of the SYSC driver was integrated, only the signal support
  was preserved in this series, in a separate patch; patch 01/12 was
  adjusted (by addressing the review comments received at [1]) as it is
  necessary to build the signal support on top of it
- after long discussions with the internal HW team it has been confirmed
  that the relation b/w individual USB specific HW blocks and signals
  is like:

                                   ┌──────────────────────────────┐
                                   │                              │◄── CPG_CLKON_USB.CLK0_ON
                                   │     USB CH0                  │
    ┌──────────────────────────┐   │┌───────────────────────────┐ │◄── CPG_CLKON_USB.CLK2_ON
    │                 ┌────────┐   ││host controller registers  │ │
    │                 │        │   ││function controller registers│
    │                 │ PHY0   │◄──┤└───────────────────────────┘ │
    │     USB PHY     │        │   └────────────▲─────────────────┘
    │                 └────────┘                │
    │                          │    CPG_BUS_PERI_COM_MSTOP.MSTOP{6, 5}_ON
    │┌──────────────┐ ┌────────┐
    ││USBPHY control│ │        │
    ││  registers   │ │ PHY1   │   ┌──────────────────────────────┐
    │└──────────────┘ │        │◄──┤     USB CH1                  │
    │                 └────────┘   │┌───────────────────────────┐ │◄── CPG_CLKON_USB.CLK1_ON
    └─▲───────▲─────────▲──────┘   ││ host controller registers │ │
      │       │         │          │└───────────────────────────┘ │
      │       │         │          └────────────▲─────────────────┘
      │       │         │                       │
      │       │         │           CPG_BUS_PERI_COM_MSTOP.MSTOP7_ON
      │PWRRDY │         │
      │       │   CPG_CLK_ON_USB.CLK3_ON
      │       │
      │  CPG_BUS_PERI_COM_MSTOP.MSTOP4_ON
      │
    ┌────┐
    │SYSC│
    └────┘

  where:
  - CPG_CLKON_USB.CLK.CLKX_ON is the register bit controlling the clock X
      of different USB blocks, X in {0, 1, 2, 3}
  - CPG_BUS_PERI_COM_MSTOP.MSTOPX_ON is the register bit controlling the
    MSTOP of different USB blocks, X in {4, 5, 6, 7}
  - USB PHY is the USB PHY block exposing 2 ports, port0 and port1, used
    by the USB CH0, USB CH1
  - SYSC is the system controller block controlling the PWRRDY signal
  - USB CHx are individual USB block with host and function capabilities
    (USB CH0 have both host and function capabilities, USB CH1 has only
    host capabilities)

  Due to this, the PWRRDY signal was also passed to the reset-rzg2l-usbphy-ctrl
  reset driver (as it controls the USBPHY control registers) and these
  are in the USB PHY block controlled by PWRRDY signal.

  The PWRRDY signal need to be de-asserted on probe before enabling the module
  clocks and the module MSTOP. To avoid any violation of this configuration
  sequence, the PWRRDY signal is now controlled by USB PHY driver and the
  reset-rzg2l-usbphy-ctrl driver.

  As the PHYs gets reset signals from the USB reset controller driver, the
  reset-rzg2l-usbphy-ctrl is probed before the USB PHY driver and thus,
  in theory, we can drop the signal support (reference counting of the
  USB PWRRDY) and configure the USB PWRRDY just in the reset-rzg2l-usbphy-ctrl.

  However, to have a proper description of the diagram described above in 
  device tree and ensure the configuration sequence b/w PRWRDY, CLK and MSTOP
  is preserved, the PWRRDY signal is controlled in this series in all the
  drivers that work with registers from the USB PHY block.

  Please provide your feedback on this solution.

Thank you,
Claudiu

[1] https://lore.kernel.org/all/20250330214945.185725-2-john.madieu.xa@bp.renesas.com/

Changes in v2:
- dropped v1 patches already applied
- added fixes patches (07/14 and 09/14)
- dropped the approach of handling the USB PWRRDY though a reset controller
  driver and introduced the signal concept for the SYSC driver; because
  of this, most of the work done in v1 was dropped
- per patch changes are listed in individual patches, if any

Christophe JAILLET (1):
  phy: renesas: rcar-gen3-usb2: Fix an error handling path in
    rcar_gen3_phy_usb2_probe()

Claudiu Beznea (6):
  dt-bindings: phy: renesas,usb2-phy: Mark resets as required for RZ/G3S
  dt-bindings: reset: renesas,rzg2l-usbphy-ctrl: Document RZ/G3S support
  reset: rzg2l-usbphy-ctrl: Add support for USB PWRRDY
  reset: rzg2l-usbphy-ctrl: Add support for RZ/G3S SoC
  arm64: dts: renesas: r9a08g045: Add USB support
  arm64: dts: renesas: rzg3s-smarc: Enable USB support

John Madieu (1):
  soc: renesas: rz-sysc: Add syscon/regmap support

 .../bindings/phy/renesas,usb2-phy.yaml        |   1 +
 .../reset/renesas,rzg2l-usbphy-ctrl.yaml      |  40 +++++-
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi    | 118 ++++++++++++++++++
 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi  |  57 +++++++++
 drivers/phy/renesas/phy-rcar-gen3-usb2.c      |  11 +-
 drivers/reset/Kconfig                         |   1 +
 drivers/reset/reset-rzg2l-usbphy-ctrl.c       |  70 +++++++++++
 drivers/soc/renesas/Kconfig                   |   1 +
 drivers/soc/renesas/r9a08g045-sysc.c          |   1 +
 drivers/soc/renesas/r9a09g047-sys.c           |   1 +
 drivers/soc/renesas/r9a09g057-sys.c           |   1 +
 drivers/soc/renesas/rz-sysc.c                 |  29 ++++-
 drivers/soc/renesas/rz-sysc.h                 |   2 +
 13 files changed, 325 insertions(+), 8 deletions(-)

-- 
2.43.0


