Return-Path: <linux-renesas-soc+bounces-23843-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 60204C1AF4B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 14:52:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E999B5A964F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 13:45:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC35828DB46;
	Wed, 29 Oct 2025 13:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="F2bbbbDZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82D829AAF3
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 13:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761745038; cv=none; b=KqR4S6iagKCcIRIbZ/EAqW5Fnp0W642x2cQM3IiwWItntHHh7Ev/rmerQGiDOcl3/I82KE8ydE1BIRx040PxvEjLILEFcxalsZSrUdhQ9B+zF+NcZ3hMi3RpLp+mOzHj0iJ0gc9Ni+hNZ2ajbrU7fOcw701X8OJRwd6iZvZklV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761745038; c=relaxed/simple;
	bh=g2UzYoQMmBvyP0vqBmIs0mbCNRIvDuiSiZPQPavWlvA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jsthSdI/YlBreW/6ZiPxSJ3vLO0QH9brjwz7wekkv9OQU3g6UbiMSpdU72LoPCndkfTQA1d9/eXthznup3ggIntilQl0P9RRlqClY6XeELBoEOZG1rz9w+kiN1piWqw6VFDymANPWFIg0EduXcZfx4iIpjvy2/ku6EmKFl2eGTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=F2bbbbDZ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47118259fd8so56685105e9.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 06:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1761745035; x=1762349835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=raFhMoNXeeTJ+YCRDYZfwFJY7Igi8rgmNsUQLFF8MJk=;
        b=F2bbbbDZKTCaOoUpcw2VGBy7Aghruf8zK9B1d2kLJsYAXtmw2YAHIsGXPQyDAUFESc
         NOJRsepT5zuw6aHLGLPqI1g/l23+3izT+hn10ksddwQdcD8FKETVIHP41LrC/rVGom3h
         GsaE1NgFSqnINoHHjO7fYSDZR5is26ENLbWMmXDcC17mh8uLV9+aORoN6qwjHGulRb3u
         n5mqtJwMxHra0NlXSd7FOvAjwNYsP720RT1IMRhxCDeFVsfMTMIFe7Na/iizd/LQGfER
         Z3byexXy14ja7nCFJUkRjmzPlD0tfyUqJzaWuxqXOS4fa9ieS+ynJPTPvzOkwfO40yk4
         txvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761745035; x=1762349835;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=raFhMoNXeeTJ+YCRDYZfwFJY7Igi8rgmNsUQLFF8MJk=;
        b=trg9MUHeNR+prXhnwki8Dcxz95lgiKeIrJXHY9LMhVZkd1iwKVcgmbOfYMKY/Zux3O
         iK/ac5AIYt1vEUroTNBOA5l1WHnWRqGMKbitsW3HVn5/yUtspVneQDLhx1P0ETug6xQ4
         L1nIljso65lcby1hCKy9vxvSx/X4MHV7MSzmZGkkjRTqWkljHcM3kALvD20JVjLzw5WP
         8Rd2t7kF9ky/Ov4bNexYNd0rYER9NCDwaskBpQC/MzVUqBf6NJRFqdY7kN2M9FOpbm74
         7jUcE73dUH5snmoKrxZ1bECHgldbNP30skKRF2PLN8RIYTH9fi482u8mxzywcI/PMM8u
         NMsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdwEBhGZSEKk6rpa2Y8KWmhffi/g9aP9nq/RRp7D9hOdL15Oi/eBibvthA3IwcITbXixKssGgakN09Mzt/sXa1EQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw26CbySfgEajpboxFO+iNkzyeaiiIudQDUe3JWG8h1bLaKmpN0
	Myd/2o1dSSeladreve9dKhdrjBhpriy9UAx8SuyLCyMlsSgKKim8kQLL1LCow0wiNRQ=
X-Gm-Gg: ASbGncvbYzq0Xuk/k3zbg8Z9JjMjvyAdDMG8Advo03EF2I5q414/kpjFPKNwCEO2vym
	ebcLkJjQ9ehdvIO5NLiMFFug1TTf7keA4XJfRND7q+uMiTDIi2FhnSqq576lvUy93HhK3uPcmn1
	TpF0FW0p/nI+oWmaXPBwK6zKNeTSwsixf0RQIAq0w3cEhYgt7eIFUO6nJxF4U+4rIdhoZxpceTJ
	F6Q6akCKsgEiefoNM+DNq9OcL7Y4DTe3/6Jx+CsRS5TB8x/gj1HSnYQ7EBcuG9deWb+EOSNUqeE
	xwIwHZfZVlxQAQKGFcQEKzhrFG0x79MLlVy9OnPSMzmE9QSteU1+WmJ5WyP2+OAQ8449UJEsZUd
	3CugklRyXBXavJAdgmJD3LXGF9pqqmkf7r4rWBvv2+SrlZbWv9XyU9KMj7QC33Qb7jXCBQ/WwDW
	X+34ZjYvnlsO7NoQ0T3ezbFVSM7W2GOl2AOp9eKKxiKlnID4e3vIqaCRCCG2iw
X-Google-Smtp-Source: AGHT+IF9Ytr9phXCmFUbowfCjA8FrDjdRUcYYY+EYbpC7X4xEFDfts0q9wqBeybqLp87Haw2oAS9Og==
X-Received: by 2002:a05:600c:6089:b0:46e:4be1:a423 with SMTP id 5b1f17b1804b1-4771e19c71bmr24184595e9.1.1761745035168;
        Wed, 29 Oct 2025 06:37:15 -0700 (PDT)
Received: from claudiu-TUXEDO-InfinityBook-Pro-AMD-Gen9.. ([2a02:2f04:6302:7900:aafe:5712:6974:4a42])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4771e22280fsm49774795e9.14.2025.10.29.06.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 06:37:14 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	bhelgaas@google.com,
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
Subject: [PATCH v6 0/6] PCI: rzg3s-host: Add PCIe driver for Renesas RZ/G3S SoC
Date: Wed, 29 Oct 2025 15:36:47 +0200
Message-ID: <20251029133653.2437024-1-claudiu.beznea.uj@bp.renesas.com>
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


