Return-Path: <linux-renesas-soc+bounces-23513-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CFECBC01A21
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 16:06:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E13885644E8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 13:58:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07EA8319848;
	Thu, 23 Oct 2025 13:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Bc8m/GIH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88CFE313E04
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 13:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761227907; cv=none; b=dIJhRwrNVs4AxPcX6Lwtc6DLX0M9EAZzl/j7cV1RqfmHjwsgRhrS2XjO54u2ldPaOpXNV/pS2+L4E+hdu/FbY0EwhrN6oJ+QkWJxiTCN3yLUtaN1WZa1hQTPLGoCXfiXWRdm25+VDQUY3SQ+xn/i3UyicYi0XrFhRV1wBZ0Fgz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761227907; c=relaxed/simple;
	bh=g6CVHaLMWorkE5f1oYDzlb1AnPkj/bZHP6uxaos3Agw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Q3nJ/gf3R82G7Y3jLdfi6vlXnnnqe2XL2lMcNiBI8YAXcaD/kZbjE9VYH6QbYdbAhLSZ4Vs2mUtuhZjDiLPKyC/T9DB3LUFRfNcHq0uVCRFuyQcgPQE9skGnJgnn7ZkYrWhRE67qmy/+LWKtdudZmR+v1RupaVNgzjzP1tkOctA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Bc8m/GIH; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b457d93c155so180286666b.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 06:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1761227904; x=1761832704; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k+CJA/yttcEWE329t4x7y0QQYUGKS/VYwA6kfJw1v8Y=;
        b=Bc8m/GIHnwyfAe05Dp6YyE2KakhhboVIynG6z+RIURwWiOXcvbE8rYAdlo1hRdXqIg
         gR0+3tSqTIi8Qhv5GYNxjcZ8LBiyNDbCsFyP874p1LMusTpibwVyKwlKPQZ8lKXe9ZCS
         NeZkvxA7H0w9x03m4jkI7weTPiQIwo5pDs357+6EeO/dEU9hNWdXv7AbR99uFhyzYOpk
         b2Ri5TV7M/aPhtUpqqw/xRcGW+3RDqKmMJt55aNIw08Vut5SS/Pv7LYOafMlcU4O8AaE
         ySLwUC+MZOK6Sz+mQQYUaSmC8P25Wt8yxacORWaFtXeHobxvlGAA5Okd7bUtX8ICABq8
         gJbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761227904; x=1761832704;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k+CJA/yttcEWE329t4x7y0QQYUGKS/VYwA6kfJw1v8Y=;
        b=p2y8XvtsWvwF/gGEDI/yR2trfFTtWz6TPmtAoJbDbTHawoE3pNAd5LdnRvM8+eZ5TB
         t4Rbdwpp5sXfWX6yPb3p2aLIVgyy8FJVoc7G2rrjPdfmzM7Z3JZqe7ZMGec7ukmOBYli
         zemycwFgTSEJL0N2xratBoTUFlD4MqNGOzvZ0Klm347iYykJ+bmvlVsZdctem9DjWhsG
         LPTugM72lUz4qEBzJnDm3jbqjL6O6y/pIN218CcpQK+WsWoQyAte27bU9mQVupyGcFMi
         +97QUNCnLt9B7f2h7LORMASWnb11wdp90U0xCD/XBiIUmqGuR4XgRmbMV4pIF/rFgUEI
         ZxFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuCYm9zZWWgp0rtBTSVsZVqvVQb7bVsadfWu66nBf0Vis7pQJFrVSnOAkeToL/FD3WLnEgtuZyIYwn+rsnPsMbzA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzNN0fFwvC3yeS19H2gv1GIVZDzhwCkVVbztbe9aeOJfzLA5gC
	c9GflYC/Eues0xGsvBmYGr6QYHQqry8mNTBF2OefR9hwdxQ1j7K7hxahTicVGlcg9Sg=
X-Gm-Gg: ASbGncsVsWuomgMxD6nCys+f2qDmw/w7YnzDuFdnJfEEW6ZsMofW8nQUa7x5WY5jFJT
	k5Ub0rR+atbejhJBT+qLZcBJQkciflmh8GwP9oB4r4gVPkNd2PU8a/CczN9R26Pn9t+AGHKGmzS
	rsGjcXY3owoKEbVDG43xTKdXuhArSA3oIeglzQwM7DPPsjP6upDronboQinm5MdXLwriWVwYYsR
	L/FDpocOUNwXdiVN2c3MlHE88VxoA17tiWy83dj/qLwfDXJNhkj3De8TRHadspw5vVppr0pp3jV
	+G4BBlAumHzzI7KXCZTK5Ur3UHrttwxmS4T2pacBQ4AYstnLxw9xpmoVwpakn7z+qHA4cieJXUA
	4T/UIDm0AeJpzPJDWbzN7E8fBpUdu8zAXoyiEtz0nq9rj98sglh7njnQW4g4GIO3J9mnq5IsAjq
	V1wJu1F4JGjqEw2Q6eZIM+zDJ+E4fs1JeHwqyisEXi
X-Google-Smtp-Source: AGHT+IE0HOq8wtrB6PmzEqA/w7kF+MiVvfd/RggY6M/Zy5oz6h4QHBB/DlWWt/YaXvmWMvKZptSp0Q==
X-Received: by 2002:a17:907:9622:b0:b6d:55ee:506d with SMTP id a640c23a62f3a-b6d55ee5232mr231552866b.65.1761227902719;
        Thu, 23 Oct 2025 06:58:22 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.151])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d511f8634sm226114066b.29.2025.10.23.06.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 06:58:22 -0700 (PDT)
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
Subject: [PATCH v8 0/7] Add initial USB support for the Renesas RZ/G3S SoC
Date: Thu, 23 Oct 2025 16:58:03 +0300
Message-ID: <20251023135810.1688415-1-claudiu.beznea.uj@bp.renesas.com>
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
- patches 1-2/7		- fixes on bindings and driver for USB PHY
- patches 3-5/7		- updates the rzg2l-usbphy-ctrl driver and documentation
			  with support for setting PWRRDY though SYSC
- patches 6-7/7		- add device tree support

Merge strategy, if any:
- patches 1-2/7 can go through the PHY tree
- patches 3-5/7 can go through the reset tree
- patches 6-7/7 can go through Renesas tree

Thank you,
Claudiu Beznea

Changes in v8:
- use regmap_field in patch 4/7; as a result of this the support was
  simplified
- per-patch changes are described in each individual patch

Changes in v7:
- used proper regmap update value for PWRRDY
- collected tags
- dropped Tb tags from dt-bindings

Changes in v6:
- in patch 2/7 dropped the struct rcar_gen3_chan::rstc as it is not
  used anymore
- in patch 4/7 used syscon_regmap_lookup_by_phandle_args()
- collected tags

Changes in v5:
- dropped patch "soc: renesas: rz-sysc: Add syscon/regmap support" as it
  already modified and pubished also at [2] with the latest review comments
  addressed
- fixed the documentation

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
[2] https://lore.kernel.org/all/20250818162859.9661-2-john.madieu.xa@bp.renesas.com/

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

 .../bindings/phy/renesas,usb2-phy.yaml        |   1 +
 .../reset/renesas,rzg2l-usbphy-ctrl.yaml      |  41 +++++-
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi    | 118 ++++++++++++++++++
 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi  |  57 +++++++++
 drivers/phy/renesas/phy-rcar-gen3-usb2.c      |  20 ++-
 drivers/reset/Kconfig                         |   1 +
 drivers/reset/reset-rzg2l-usbphy-ctrl.c       |  60 +++++++++
 7 files changed, 286 insertions(+), 12 deletions(-)

-- 
2.43.0


