Return-Path: <linux-renesas-soc+bounces-24823-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C27C6F5E1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 15:43:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id E5ADD2EFB4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 14:42:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0CB426C39B;
	Wed, 19 Nov 2025 14:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="lTQU/QDs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E9A26A1B9
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Nov 2025 14:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763562942; cv=none; b=QYysYe0uUuhmqYzpFCGQ6sAIQMeHdCgMdMRP0p2YUniFxwBsG6gltv3nsobjpqi9drmF3CRFv9h1im1SdL57yrVZuIFkFwfdZWvKvJdSb7nul3EVi+xD2lssEezFlvR0OC/jXTSG2Y1AENpZLWJGUsqsFfpX5tz9mUhbGME08cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763562942; c=relaxed/simple;
	bh=boggqE6/veB48X8E/lvoV0UfcqfofI/pcszr4XTLAjE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NeMGLG8X3sPt/e7aOlAHmVshzv3gyutp6Vti92q1LuXggzlOtpBHQEWlvCRxY1ujGNoMWqssgm7a0tIlFEneJ0GZ4VuTqFtI4rKFHXelQ/5NFjb5KACbsOzypH1N63+BrQKF3FY36MQWmFxF1D40WldEfuFQ3gQ0K9y0FFz35+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=lTQU/QDs; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47778b23f64so45834165e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Nov 2025 06:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1763562938; x=1764167738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QFSAHjs1Q3yjPqY0JE3fglKcK3wZceel7CWAQdCxWzo=;
        b=lTQU/QDsszZxAOn3IhBTo9fLJF/jW+SOgIzlm13F5T4Ugq68wo+aqGJrdZpIqNAlLV
         QZDL4tGrkzCMhaLbMIxXKw5N+swQ4X7AIl1OODZEgvWbnfWbTuaAphmVclYrH4Ox6g86
         b++KBwsqrXa4HMZec/kgLfpSpY5DhKDU6kavHibHys2fDxmyxrYOteFzk23xobkpE//H
         VCLZ81bubsMpGyaXZTlkiImxe780Ye2Voc4IbqoP6aZ/AckEonjjffP/uYSzmI4Xb0sX
         mQODm8nvRt8utj8KiN7Nv/zI6ujro9CKSU40zKhpdCl6bO8lnt4gdcO34OgzZHsOnLf0
         FGxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763562938; x=1764167738;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QFSAHjs1Q3yjPqY0JE3fglKcK3wZceel7CWAQdCxWzo=;
        b=fGk4Rub1xSZ78VbFeodMcgYrx34u0fBZrWaghycez57rhoY5fFMNKElCIwgYqLrtH7
         t/aosfEnUFLAYMIIqtLx2SCUCnHpch2C4DziOBlUt4SqMKOPlNl/qd1mZrxY2AgQL3Pq
         td7qiH/FcnBrmmXZjYEL/A/fjRRaisn5tIgqk7LchGgwaPKbfePXw80VfrBOFCW7O6Z6
         GIHLLhLss1UaGUZRFnCyrt/Df1JA5kp5RoUqJfezpYSn5OC178j5ydpzZnATSgG6lNbv
         9lzXo9b9tlhz3MP4mN3ZcI1jsUm1jGb4ZHmmNGx/t+mr/y2EkCwjEnLxEqKAGLAyG+4S
         MKUw==
X-Forwarded-Encrypted: i=1; AJvYcCVJyje5xX98lm51XcNI8Qnaq53NyuNjzLQCzyyhfTI6AZB0W40iSl8faxjDXaI3/h2hSu/qWZWz3YSlGIp9o7XoOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxbaLWjvRghJwdHmLZes1zz3EIoUA4U/YJFgciNdUZhSfv6W18
	WpG7d2GRDBVeN1JF/HdKUfOi/YCucwRRSnGRdner9o5D3STKZ6NH253YT6T5Zcw8u+g=
X-Gm-Gg: ASbGnctOXfeHdOZdInKBGQOQpx2OjwI9mBASGa/6W6ZGPksX4lxHK3Mql5uGn2fQFMN
	Hf4IhJS6XEd2wLzrkVzlWYj2gDbxFiI+rzMZsqgOkrPKqR/8rzHwNXP5FmSjRvWbElXWGMlKidJ
	rpXwNHqx3ZSilp7c60NHoB/UOdTEk9bzXmOq/xmE4+MUOnwk4pErGVNDTbGO4mv9Kn2HKKFKdOs
	uQiTLf7Y1JjQRfgkaptricZzZrVMIaoK3Ao1eLs9C61m1jZ99M/1DUxVesSZuxoDnzFO4rt2toc
	JxgWRmQrTvusm+7CMsgLjPKvZq4lWVcJOVn83ib3dbcPzy3dkaHP6+rKSNErT39D1IRWyqu3caw
	H8+kzQu6Nxia9yjCh5oiMjS4j26y1sVxjCrKzKiXP5KapdXgoWw7H/qnQFPI0D7d7VaAzgN8nSo
	ggAxsVzN63Cn4COzJwm8sIm+uqqE2K/x8xon/tSZuw
X-Google-Smtp-Source: AGHT+IFO6BsXXVDJxAXEje/PrbZsUHhCrC1Z80Km715d+vZyDyEog2lAh8LmDiKcmJPGfC/W0ZSFpw==
X-Received: by 2002:a05:6000:22c2:b0:42b:2eb3:c90f with SMTP id ffacd0b85a97d-42b5935df10mr17441026f8f.10.1763562937170;
        Wed, 19 Nov 2025 06:35:37 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f0b894sm39973399f8f.26.2025.11.19.06.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 06:35:36 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v8 0/6] PCI: rzg3s-host: Add PCIe driver for Renesas RZ/G3S SoC
Date: Wed, 19 Nov 2025 16:35:17 +0200
Message-ID: <20251119143523.977085-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

Series adds a PCIe driver for the Renesas RZ/G3S SoC.
It is split as follows:
- patches 1-2/6:	add PCIe support for the RZ/G3S SoC
- patches 3-6/6:	add device tree support and defconfig flag

Please provide your feedback.

Merge strategy, if any:
- patches 1-2/6 can go through the PCI tree
- patches 3-6/6 can go through the Renesas tree

Thank you,
Claudiu Beznea

Changes in v8:
- in patch 2/6 corrected typo, used proper variable for IRQ in
  debug message

Changes in v7:
- rebased on top of v6.18-rc1

Changes in v6:
- addressed review comments on DT bindings and driver code
- per-patch changes are described in each individual patch

Changes in v5:
- dropped patch
  "arm64: dts: renesas: rzg3s-smarc-som: Update dma-ranges for PCIe"
  and introduced patch
  "arm64: dts: renesas: rzg3s-smarc-som: Add PCIe reference clock"
- addressed review comments
- per-patch changes are described in each individual patch

Changes in v4:
- dropped v3 patches:
  - "clk: renesas: r9a08g045: Add clocks and resets support for PCIe"
  - "soc: renesas: rz-sysc: Add syscon/regmap support"
  as they are already integrated
- dropped v3 patch "PCI: of_property: Restore the arguments of the
  next level parent" as it is not needed anymore in this version due
  port being added in device tree
- addressed review comments
- per-patch changes are described in each individual patch

Changes in v3:
- added patch "PCI: of_property: Restore the arguments of the next level parent"
  to fix the legacy interrupt request
- addressed review comments
- per-patch changes are described in each individual patch

Changes in v2:
- dropped "of/irq: Export of_irq_count()" as it is not needed anymore
  in this version
- added "arm64: dts: renesas: rzg3s-smarc-som: Update dma-ranges for PCIe"
  to reflect the board specific memory constraints
- addressed review comments
- updated patch "soc: renesas: rz-sysc: Add syscon/regmap support"
- per-patch changes are described in each individual patch

Claudiu Beznea (6):
  dt-bindings: PCI: renesas,r9a08g045s33-pcie: Add Renesas RZ/G3S
  PCI: rzg3s-host: Add Renesas RZ/G3S SoC host driver
  arm64: dts: renesas: r9a08g045: Add PCIe node
  arm64: dts: renesas: rzg3s-smarc-som: Add PCIe reference clock
  arm64: dts: renesas: rzg3s-smarc: Enable PCIe
  arm64: defconfig: Enable PCIe for the Renesas RZ/G3S SoC

 .../bindings/pci/renesas,r9a08g045-pcie.yaml  |  249 +++
 MAINTAINERS                                   |    8 +
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi    |   65 +
 .../boot/dts/renesas/rzg3s-smarc-som.dtsi     |    5 +
 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi  |   11 +
 arch/arm64/configs/defconfig                  |    1 +
 drivers/pci/controller/Kconfig                |    9 +
 drivers/pci/controller/Makefile               |    1 +
 drivers/pci/controller/pcie-rzg3s-host.c      | 1759 +++++++++++++++++
 9 files changed, 2108 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
 create mode 100644 drivers/pci/controller/pcie-rzg3s-host.c

-- 
2.43.0


