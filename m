Return-Path: <linux-renesas-soc+bounces-17985-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA71AD27A0
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Jun 2025 22:37:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A11DC3A876D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Jun 2025 20:36:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25834221282;
	Mon,  9 Jun 2025 20:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hgtct6qv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A1E220680;
	Mon,  9 Jun 2025 20:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749501422; cv=none; b=qZJhJVSfiR9WJu4bVFgjGUv2tRYVpBRNZ9RR3MEXki/egYeLBOLQbmRio0gqW3Lt0qEWjTnnQVVVg4hTKPggeixf+Y1q3ND2tCp/Bwl2Dfb57pSE4niB8yHef7Suo9k3pLtEgpP8MYQ2q/JJQi1+m8LLoFWIQmsNu5DjV/CWls0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749501422; c=relaxed/simple;
	bh=bMo3wzMhKltZs7QMjn6YEMIpFXpusjz5hmvh1DJhHHw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y6Ds748HH4/3VV/eMesyCjKw7BO/zl3Gin3Z6/Jmg7Mnx9HZy2sygJu1NnagvaPez4XKuwOGlBNDNrT3Ns6HBrNlNatRl0l/skBNBcHSJ7JTMf9B97PNH6aacSqSprMLEL4nLowxfrMb4ORpv/PtErgrCEytbzYehJmMRXHnNgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hgtct6qv; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a54700a463so995670f8f.1;
        Mon, 09 Jun 2025 13:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749501418; x=1750106218; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PRRMZrP2oXiS+2iiPhUnuzFCLiBggFlP7GuSrH2c3mM=;
        b=Hgtct6qv2OsPW39Yo8Brm+pd//Ywv4ghcj0Xxr0i2Yt0hAXVd8BzUZAB1VB6zTHzHW
         C4Rz9mryTV68PsFeMfFt6WJrp+kzSGPsLP/UkzGAlNkVXbAZ4FKxGnTM+FxRhWp3e2ij
         6f4x4PL/iOalWpYRbAIz98eH8k4uWqm4rj9EH/o4sxGVCp1olGEQcFo9TxmDxO0VcgZV
         RfGXZ6Gceo6oXlLr4TZgEPe0UTQvb32FlI36e2qgacw6T1uYrFVI+LilPwapohdK1AEp
         MEieR6rwylxUold/TzrbldaCbhnwUeZ8ZoJR16BeCkD3qfUHCwbtVbK3Zw2wC1/zqpTF
         ioqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749501418; x=1750106218;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PRRMZrP2oXiS+2iiPhUnuzFCLiBggFlP7GuSrH2c3mM=;
        b=GO8/OUMKuJ4qPYorJqq3NKMTKGf7yQAYdiYAYiW1OBbw+fbcSIVI8FwGYoQ8qAyjIU
         rakcbaC8JgEm881/5yNOb4jMN54ONqGYFultyHnecK6ry7CGb+tWIq/PM25hkjleyLVH
         QLfVDdAaVekdvHavcTdK9pMjtfWHzNlRNt2bFQqZ7Mg2Dm104dBJTfy+8rQJgOiEJYBC
         9D1kzdQEUJzzHbe6ZEa0WUjRVXDrBVciokeNIpbVnF5E+ySK8R86oEKp7l/TRNwkrc6z
         3PCfRUhcYrIGuJk5quYwJJtXWmNEe0gjTsk63k/lh1Q1jNl00HHOeVoIxe4/WZchTS7s
         lnVg==
X-Forwarded-Encrypted: i=1; AJvYcCUztynf7nEbVYUoIMQgbqg5D+D3t75kVFeLjOU1qgPDBfQIZzhMAMWYciycmmGgv+wud81gouc8U+hR@vger.kernel.org, AJvYcCV+fzV40f1mGrhsvjWZZk00yhjI8t2tuHA7HrPKxyZ4XqsFBIocMj7ag/gO1uc9cqoqMtnQjXAQqcEcRh7v@vger.kernel.org, AJvYcCW3GKMqP+LEihATkmK8u7ryY/6sRwNChN4SMnEddredeKjAqD4Ca0tLnjji3wvcivoWeYYshXy1qJh5@vger.kernel.org
X-Gm-Message-State: AOJu0YxNU94RpmhwjNunjZmGEcG8QZvIMG23+UN3snrCJ/Uh+YF39ddm
	YNLOdnRSo+FyyCDmHaPsDkezAjO9CSc3pHXVe1b3vW/6GN116Bp3vgy+
X-Gm-Gg: ASbGncv5tovsqXnTMvlQNxUztAB5MNQXiA/edMRNF68urU7Drvg1L92N+iygEwfAuZX
	hHCNrWWIrZIM6qVuDEKibMzRMEDPxC9XE1Hz5kK7wSCXFx6t+8oRHTMboVnLbRknWrSPakWJOgJ
	jBHtdUBrcOx72Um+RAK8MOES2GiJwYHlyX2WuVK90NrnWK/PJxCQAdBAFXRyG8WgXQJQ9XOrXjU
	l4mJgi38PIQdwZnyEEpBH7cAdFnaXSlP8nwfCJN5Dkqz0Msnu1w6jcptwLshCDRysTCrjlTa7w3
	KEE08QiwjiU5vqo9UPfY2b22LajIwYXCYaQUK0tma6btpmXgxyZxBfD5Kg2XyLUbKMN+bCVMQqy
	r6QwQ8vNoNw5FAIT+WWk=
X-Google-Smtp-Source: AGHT+IHBEbEPbt855qQ4gJTaWfzJVvRxq98v+liy5baKejXU6miw8aenSf5+UBaR0KaKAp9o8Ref4g==
X-Received: by 2002:a05:6000:430d:b0:3a4:e238:6496 with SMTP id ffacd0b85a97d-3a5514174b2mr873507f8f.18.1749501417983;
        Mon, 09 Jun 2025 13:36:57 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3c26:913e:81d:9d46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452730c73d2sm118240345e9.30.2025.06.09.13.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 13:36:57 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/8] Add support for Renesas RZ/N2H (R9A09G087) SoC and RZ/N2H EVK
Date: Mon,  9 Jun 2025 21:36:48 +0100
Message-ID: <20250609203656.333138-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series adds support for the Renesas RZ/N2H (R9A09G087) SoC and
the RZ/N2H EVK (R9A09G087M44-RZN2H-EVK) evaluation board. The RZ/N2H SoC
is very much similar to the RZ/T2H (R9A09G077) SoC. 

RZ/N2H is a high-performance MPU that delivers advanced application
processing and real-time operation for industrial applications. It
features a quad-core Arm Cortex-A55 and dual-core Arm Cortex-R52
configuration, with security features, and is designed for real-time
control and high-speed communication.

RZ/N2H SoC supports below features:
- Quad-core Arm Cortex-A55 and dual-core Arm Cortex-R52 configuration
- Security functions (optional)
- Encoder interfaces
  * 16 channels
  * EnDat 2.2, BiSS-C, A-format, and HIPERFACE DSL-compliant interfaces
  * Frequency-divided output from an encoder
- Various communications interfaces
  * Ethernet
    - EtherCAT slave Controller: 3 ports
    - Ethernet switch: 3 ports
    - Ethernet MAC: 1 port x 3 units
  *  USB 2.0 high-speed host/functions: 1 channel
  * CAN/CANFD (compliant with ISO11898-1): 2 channels
  * SCI with 16-byte transmission and reception FIFOs: 6 channels +
    12 channels (for encoder)
  * I2C bus interface: 3 channel for transfer at up to 400 kbps
  * SPI: 4 channels
  * xSPI: 2 channels
  * PCI Express Gen3: 2 lane x 1 port or 1 lane x 2 ports
  * SD card host interface: 2 channels
- Serial host interface
- 12 bits x 3 unit (4 channels for unit 0, 1, 15 channels for unit 2
- LCD Controller
- General-purpose I/O ports
- Trigonometric function unit
- 16-bit x 8 + 32-bit MTU3 (9 channels), 32-bit GPT (56 channels)
- 6-bit CMT (6 channels), 32-bit CMTW (2 channels)

For more information, please refer to the product page:

https://www.renesas.com/en/products/microcontrollers-microprocessors/rz-mpus/rzn2h-advanced-mpu-delivers-high-performance-application-processing-and-real-time-operation-industrial?srsltid=AfmBOoro9kUrZ77ugeURFIlE5ToiFazSyzIsbjBDdGs83NHZfhlkFHlJ

Note, this patch series applies on top of the patch series
- "Add initial support for Renesas RZ/T2H SoC" [1].
- "dt-bindings: serial: renesas,rsci: Document RZ/N2H support" [2].

[1] https://lore.kernel.org/all/20250523142417.2840797-1-thierry.bultel.yh@bp.renesas.com/
[2] https://lore.kernel.org/all/20250609192344.293317-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (4):
  soc: renesas: Add config option for RZ/N2H (R9A09G087) SoC
  dt-bindings: clock: renesas,cpg-mssr: Document RZ/N2H support
  clk: renesas: Add MSSR support to RZ/N2H SoC
  arm64: dts: renesas: Add initial SoC DTSI for RZ/N2H SoC

Paul Barker (4):
  dt-bindings: soc: Add Renesas RZ/N2H (R9A09G087) SoC
  arm64: dts: renesas: Refactor RZ/T2H EVK device tree
  arm64: dts: renesas: Add DTSI for R9A09G087M44 variant of RZ/N2H SoC
  arm64: dts: renesas: Add initial support for RZ/N2H EVK

 .../bindings/clock/renesas,cpg-mssr.yaml      |   5 +-
 .../bindings/soc/renesas/renesas.yaml         |  10 ++
 arch/arm64/boot/dts/renesas/Makefile          |   1 +
 .../dts/renesas/r9a09g077m44-rzt2h-evk.dts    |  17 +--
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi    | 135 ++++++++++++++++++
 .../dts/renesas/r9a09g087m44-rzn2h-evk.dts    |  16 +++
 arch/arm64/boot/dts/renesas/r9a09g087m44.dtsi |  13 ++
 .../boot/dts/renesas/rzt2h-evk-common.dtsi    |  24 ++++
 drivers/clk/renesas/Kconfig                   |   5 +
 drivers/clk/renesas/Makefile                  |   1 +
 drivers/clk/renesas/r9a09g077-cpg.c           |   1 +
 drivers/clk/renesas/renesas-cpg-mssr.c        |   6 +
 drivers/soc/renesas/Kconfig                   |   6 +
 .../clock/renesas,r9a09g087-cpg-mssr.h        |  28 ++++
 14 files changed, 251 insertions(+), 17 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g087.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g087m44.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/rzt2h-evk-common.dtsi
 create mode 100644 include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h

-- 
2.49.0


