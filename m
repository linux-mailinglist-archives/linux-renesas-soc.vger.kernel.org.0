Return-Path: <linux-renesas-soc+bounces-17145-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CE3AB8EC9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 May 2025 20:22:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 242BC1891F54
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 May 2025 18:22:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 104A725C6F7;
	Thu, 15 May 2025 18:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XTAq7pur"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E6425A2C5;
	Thu, 15 May 2025 18:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747333336; cv=none; b=km8aGVSU8hrobniuKjskpf/suTbWmfEszww0z6WCcsUa1GxyrASY3Wb1UwdJK/YMJACIqNFljjulk5h8G3cudDflrzVpsKOSoDnuYr+ayEwFVhgFlaxNQafL+hUuWsaFZQFe1NfOy1jQU/ZdHSV4Eb+bwgDwHO+mtSZGcqTA1Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747333336; c=relaxed/simple;
	bh=luRCAMdJdVHXkV2KkDPMdLwLjfllAKpb3MhWMTjVV/M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qZGij6s23Q+x7oMsAzhJQoU5AOY3CdC3P39PFdV2Ep5dRmuc/Hiw+wSjH0WaYYRFTv/ET1ugx6uKeyRXCqVLBE1+XafJRcCc+ISwR+nuLgAwru9BZPLDkQQRZZZP2qnZCfqVAf3WJablXywuSEiqPOJ7Zt9x9uHDkPwneSxZ0ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XTAq7pur; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-441d437cfaaso7935895e9.1;
        Thu, 15 May 2025 11:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747333332; x=1747938132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yAQPUlazwxUoIHDbZ2y6Frkhw5As3L7EqQJ2gVvyyoY=;
        b=XTAq7purL1c9CVaerokcmpt122uu3/ZCVGfntbrZuPSizC7oxRninDFtmtZDILLmJG
         k2LSKptMDfB7lqES2h8Faa2LXaDvdb0+urNuAArnyPFkcFiu2EJfs1sz3GrO62OYW8pB
         3wxq4FHItdkxyql9xVmPEQd0cXcJoy/QiK4NBdGIxJbRcon7/pjHPTu/v3mGl99N9Woq
         elq3Xo4EuO3ydkcpG3jte5Gj6Xenl74vpQteZv7mAi+YsHjflA7zUztZw/KHxy8KkNq2
         6mZKLzNGTR6bjTPO4zN5hfFl/+W+cYMFDnsEAQw5ya3OxWPGuWBNv0zBdOTy8hLSF3L2
         d2+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747333332; x=1747938132;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yAQPUlazwxUoIHDbZ2y6Frkhw5As3L7EqQJ2gVvyyoY=;
        b=VjSaswcPgtpBZAifvLVO633/7PRjOuOrR1Yi+nTevwyBk+Z8LS/FiCVo+VxA7ZSFs0
         aI6W/K6l+hGIAOFhEByqSvNtXLqmyv1dLIEjaMFoUa5izYIJYrqCKZ+TQWBMZ9Gk7vxW
         Y0BR7PsomDZDE4lEc0P1FoB+cteswAbaDjzHRA4tGs19APzCfuklc/vJPVXitQWogVbc
         oN/vN8znbTuNPFWL6iSDvAWwdEmzHsljt1Wh5qXXP1CuXm0O2AZn2f1ixYwiMwx8Y+3k
         wT77LTthtabS59hdc0p+HmkDqbJNH5hKvmm6NR/IOhy5LN/FryzDmXJXGukiwBV3SNJY
         LzTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOD34cs8W1ghbbbuZCjW64B3NDLiuPMp48FKiObdcgwhU+UzHblITRu9mrtmRmZrociFpLcUlcBWxtxjS9tTbuUVQ=@vger.kernel.org, AJvYcCVKN/jNVOKEp8XX9XVurGeA8giwvDCCuiDzfn9vBLgnNF0X7RNn5O0znSXpb0+U9SgTsNVGk/vXelEr@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3t8FkKq/DFKciARm1UWkdaSULKLZ9Cxk0ONYg6s+9RxxIcMmj
	3gEbaZ0TwLLb1G24GqTbGP+FnyU36jj/vhRUH/hVcbToiYyJ6jRameMS
X-Gm-Gg: ASbGnct0YOW6zwVM5FqxuRuU/Un9MkeyIe2SyPrTzXG+aAzSkq/2GSTbHauDJHJ957y
	f0WbAiMfKajio5xDBzP6hbrj2bUv3S8h9ySsOO39CsmBgWRzFhWC7lfvIlrdotyiQIEoqGIuWJJ
	Yv9YN1DxcppI2R5UH1pPT1HvocOC9bR/9EdTSTQVYPEEeHrLUmOxubmnhbjCcwMgNTFob1UGQ6l
	OZ6SQzhUrAs4uWHZw9xfHdg32IoKN9N1PyoPkZVMPVcWCSV7l+cNuUhunsbkoI67h8ZRIneu9Me
	kkm8vnx9Zsl9MngpSfTAMrxvwc23+XFgEQvf0vtttI/WtTnpF1piGkiw20cn+N54mGnSEqtuYaG
	FshIMCsoL
X-Google-Smtp-Source: AGHT+IEdxsvYrXg4MZ9MrhFl2c/AvaYeZ00NOmpZwOccgoStuDdYQZs0PtZRXjp5OTdWelb6F0a2dQ==
X-Received: by 2002:a05:600c:35c8:b0:43c:fabf:9146 with SMTP id 5b1f17b1804b1-442fd63cba3mr6819785e9.17.1747333332122;
        Thu, 15 May 2025 11:22:12 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:7b5:b9aa:961b:d080])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442fd4a0a5dsm5828155e9.0.2025.05.15.11.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 11:22:11 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Chris Brandt <chris.brandt@renesas.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 0/2] Add support for Renesas OSTM on RZ/V2N SoC
Date: Thu, 15 May 2025 19:22:05 +0100
Message-ID: <20250515182207.329176-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch series adds support for the Renesas OS Timer (OSTM) found on
the Renesas RZ/V2N (R9A09G056) SoC. The OSTM IP on RZ/V2N is identical to
that on other RZ families.

v3->v4:
- Added __maybe_unused to the of_device_id table to avoid build
  warnings when CONFIG_OF is disabled.
- Added Reviewed-by and Tested-by tags from Geert.
- Updated commit message to clarify the change in patch 2/2.

v2->v3:
- Dropped config check and unconditionally enabled reprobe support for all
  SoCs.

v1->v2:
- Inveted the logic in the dt-bindings to require the "resets" property
- Instead of adding config for new SoC, changed the probe condition to
  `CONFIG_ARM64`.
- Updated commit messages
- Added a Reviewed-by tag from Geert.

v1:
https://lore.kernel.org/all/20250501123709.56513-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (2):
  dt-bindings: timer: renesas,ostm: Document RZ/V2N (R9A09G056) support
  clocksource/drivers/renesas-ostm: Unconditionally enable reprobe
    support

 .../devicetree/bindings/timer/renesas,ostm.yaml      | 12 ++++++------
 drivers/clocksource/renesas-ostm.c                   |  4 +---
 2 files changed, 7 insertions(+), 9 deletions(-)

-- 
2.49.0


