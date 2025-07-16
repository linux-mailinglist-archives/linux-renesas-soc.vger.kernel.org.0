Return-Path: <linux-renesas-soc+bounces-19558-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FED4B06DD5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Jul 2025 08:24:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD05F16B108
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Jul 2025 06:24:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB75B285CB2;
	Wed, 16 Jul 2025 06:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y6Rt8SUG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E91221544;
	Wed, 16 Jul 2025 06:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752647071; cv=none; b=QLU6D8U002aZJwvDH+wPxONX8/93NC5JiXWO5hS+mgaQQvGsEwsg/3jB9uMVKDQAUuPQ5GKPKGxiH6wikkZDt49zmT0V1klONsc6IIKbw0DFpno4jmg1jqjAgjao2xCnV9J/d9IFwYPjVK6SWzwNBig5OZdqdw2xHEuWJZF5D3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752647071; c=relaxed/simple;
	bh=W6r72LmSQKxnB3NxMfqcJSeFdWoREW67QPymehaZIA0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nEXwCXUpAs7Ddh4qfzoAvswPMBpdI4VDsjHugh3omjf7yrbX3IV5DbTmiMJlMmMi25z4zf9ygI/WfjsNn6M4Oo8AiUYbKOAhsLTyz9U2KBtAMvQmtDv7hv8ilw29ExqxKVKCC8lJLeNc0BCzjT83/7QgNV83BgvlGcP8bH1bJAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y6Rt8SUG; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-237311f5a54so53452595ad.2;
        Tue, 15 Jul 2025 23:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752647069; x=1753251869; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ixmx0d+ZX0XcwmYFgmX/CAvbk5ppzzZpsXvym0428IE=;
        b=Y6Rt8SUGWLcmdvp8kyi5U5X5hamtM5waTWcay7rfBIrRqdoQ+pb+F7FtiKXgTFS5yU
         sfx77YAifaEUMpH5cuNJa2oRObMubX9+ygzCiP6vnAIPDYhxP8LVv5rzRTzRpZCL3E7Y
         K6vgCtguU2Ql/K5q+lrsIobLvImITXBlrMqolcyEWVz5Gt9560tLnIGCaDeGR9gimGY7
         wGaMm3nGf8LLychHzbEnVdEwQHCLBrsktBWF+FwzM8znnauLXCx+po04tHVBgKBopaBB
         Il+1eP1wpnOd1b94hnUL8e2phOwQnmFDWCOP1PGDm1XVpTeOnfi0aRc3Rtug5fqdrh/6
         +OUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752647069; x=1753251869;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ixmx0d+ZX0XcwmYFgmX/CAvbk5ppzzZpsXvym0428IE=;
        b=kB5ngnxHjVPQNkGkMMyh+VfHB1sJWbWvbIO2Ev8OgTqv8fgLCwHLlj/natCbRg/NWF
         SkfZnjbLRc8Px28LaiVEGaiMp6vvmZB2285UPNqBv1QWVzDsuTKaVC4QzDXC8wzntDNv
         FnDqF0YyjkURznJr8rKmAB7X2s/8N7TU5EKoEAK5LlwqHE2HDm8KNeX3hSNkL4G6Ov3/
         2seYY5+hcIeLnNuNGf2Q8hdJk5AbFgcaBKizm0oIKwnFxCJ8bMcoGWhH3gjMqlVJNb+v
         XaGAxj1+z2VflwEbbYS1TgYb6rI7bra6G7LKVFqH4cL9dN9QJpgHK0F/Kb0m9nMjnruZ
         4+hQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwkGDEry3kV41TXqddyYwD53jaHO5EbEkBNAzyqBz2B3p3J9HYIi6OB18qrbj82odzxh4c5Wue5+ZcE+6x+q4=@vger.kernel.org, AJvYcCWUCx8mwt491j4sE0ZzeFPNNn539VgIstv4eFiMD6qVq5Ayi02VdVBMDnvyn1Ow8TRdaocXXcLbtN9YUT0vbucYX2U=@vger.kernel.org, AJvYcCXWhNbVcjsPc2QNpVVGPBhJk/9p24NwuvxU+yC31CcZ+dJrTaG5ZVv+JZI+a/dCoREV4XhgHLzSbTOaIR63@vger.kernel.org
X-Gm-Message-State: AOJu0YwH2Vm8hR3Km7CQcVb2QSVrmdr68yJF09ap6w3MwVIbgOhngDjm
	NUjCRwW9yiUKXQl72oIXCb1JUXMsyLVdg6bXorgRsWEPrwjnldxdgPKU
X-Gm-Gg: ASbGnctBZikmRvmbKioVrJlkYre/qZyysyLo7PDNqSAbTKbGdvWuGzuUCuJLutaAZp5
	XGRYhf9veLd44ckD16voWGTTkcPvjt18+BKt2yuFlTJwmMHMzeJFqMW2p+aFJ6IWyyO0U3LotOA
	foguD3dlV25C0FrgjWFxamqJxNGPTD/7S7daOYyG9RbkrN9C2Le1Finx5diT3OBvuBe9vMK7E5Y
	v19ngWLqBRHXkq2RLFh2hbQ4rwXZJhtZPAvxSrrw6TgXNbwKGLgMhS4zmzqfhXqzwRA2Zn+ggr/
	mDJbKNVWdB3XEV/G1wzCI8BWlz7O9IjvkkeYfGAwU/5wE7YLJUTXgkiy/t6KwKrZ09V3VLdA/Cz
	14rmsVkfW2XHSesC9BJvA7Im8TUZlu2nQJzzERSXwWkJt87bQBsRRFWijLA09MeBVIQg=
X-Google-Smtp-Source: AGHT+IGm4cJ+T3HY2+WuL/rqcwTfbyVXKPV0HvI1TYx1fR1w0T8QhNT4nMZujHcDMajbIK8BJ72cvQ==
X-Received: by 2002:a17:902:ce05:b0:234:c549:d9f1 with SMTP id d9443c01a7336-23e25770c34mr20051935ad.47.1752647069238;
        Tue, 15 Jul 2025 23:24:29 -0700 (PDT)
Received: from [172.17.0.2] (125-227-29-20.hinet-ip.hinet.net. [125.227.29.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4286081sm119060955ad.1.2025.07.15.23.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 23:24:28 -0700 (PDT)
From: Leo Wang <leo.jt.wang@gmail.com>
X-Google-Original-From: Leo Wang <leo.jt.wang@fii-foxconn.com>
Subject: [PATCH v7 0/2] ARM: dts: Add support for Meta Clemente BMC
Date: Wed, 16 Jul 2025 14:24:13 +0800
Message-Id: <20250716-add-support-for-meta-clemente-bmc-v7-0-d5bb7459c5aa@fii-foxconn.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI1Fd2gC/5XRTWrEMAwF4KsMXtfF/x531XuULhJF6hiaONhpm
 DLk7nVm00BTyCyfEN8T6MYK5oiFvZxuLOMcS0xDDf7pxODSDB/IY1czU0JZ4eSZN13Hy9c4pjx
 xSpn3ODUcPrHHYULe9sCDkY1xoQWrNKvOmJHi9d7x9l7zJZYp5e975SzX6SP6LLngaKFxLiAa3
 75SjHX3CmkYniH1bO2Y1cZV8oirquvAIgkbpAmw7+qtq4+4urqglCYCMg5o3zVb1x9xzeqiJ1L
 aOAFm37UPu7a6Qp+xcyShDf/c635dLw79zVXXk0br205o7f66y7L8ANRXyaSQAgAA
X-Change-ID: 20250618-add-support-for-meta-clemente-bmc-941a469bc523
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 leo.jt.wang@fii-foxconn.com, george.kw.lee@fii-foxconn.com, 
 bruce.jy.hung@fii-foxconn.com, Leo Wang <leo.jt.wang@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752647065; l=2248;
 i=leo.jt.wang@fii-foxconn.com; s=20250618; h=from:subject:message-id;
 bh=W6r72LmSQKxnB3NxMfqcJSeFdWoREW67QPymehaZIA0=;
 b=8vhHKoKK7lvo1KdZwHaApUl0O8pnWGj4MKV8UhTeUKzY8y58117CJrT3tf2h2MPLhz4Nyauxa
 rwUzvGqJAkIBN6PqtnrPWjEtFfojOJfps2cVGhHxQKZkXxL9qRlMKI/
X-Developer-Key: i=leo.jt.wang@fii-foxconn.com; a=ed25519;
 pk=x+DKjAtU/ZbbMkkAVdwfZzKpvNUVgiV1sLJbidVIwSQ=

This series adds initial support for the Meta Clemente BMC based on the
ASPEED AST2600 SoC.

Patch 1 documents the compatible string.
Patch 2 adds the device tree for the board.

Signed-off-by: Leo Wang <leo.jt.wang@gmail.com>
---
Changes in v7:
- Relocate CBC FRU EEPROMs from i2c13 to i2c12.
- Link to v6: https://lore.kernel.org/r/20250708-add-support-for-meta-clemente-bmc-v6-0-7f3e57bd0336@fii-foxconn.com

Changes in v6:
- Correct Author email to match Signed-off-by email address.
- Link to v5: https://lore.kernel.org/r/20250627-add-support-for-meta-clemente-bmc-v5-0-038ed6f1cb9f@fii-foxconn.com

Changes in v5:
- Remove accidentally pasted texts.
- Link to v4: https://lore.kernel.org/r/20250627-add-support-for-meta-clemente-bmc-v4-0-ce7ff23460c4@fii-foxconn.com

Changes in v4:
- Move properties of nodes defined in the same file from label ref back to where they belong.
- Move pinctrl default configs for ncsi3 and ncsi4 to aspeed-g6-pinctrl.dtsi.
- Add properties to i2c10 and i2c15 to enable MCTP.
- Link to v3: https://lore.kernel.org/r/20250623-add-support-for-meta-clemente-bmc-v3-0-c223ffcf46cf@fii-foxconn.com

Changes in v3:
- Modify leakage sensor to reflect current design.
- Link to v2: https://lore.kernel.org/r/20250621-add-support-for-meta-clemente-bmc-v2-0-6c5ef059149c@fii-foxconn.com

Changes in v2:
- Fix patch 1/2 subject line to match dt-bindings convention.
- Reorder device tree nodes in patch 2/2 to follow upstream DTS style.
- Link to v1: https://lore.kernel.org/r/20250618-add-support-for-meta-clemente-bmc-v1-0-e5ca669ee47b@fii-foxconn.com

---
Leo Wang (2):
      dt-bindings: arm: aspeed: add Meta Clemente board
      ARM: dts: aspeed: clemente: add Meta Clemente BMC

 .../devicetree/bindings/arm/aspeed/aspeed.yaml     |    1 +
 arch/arm/boot/dts/aspeed/Makefile                  |    1 +
 .../dts/aspeed/aspeed-bmc-facebook-clemente.dts    | 1297 ++++++++++++++++++++
 arch/arm/boot/dts/aspeed/aspeed-g6-pinctrl.dtsi    |   11 +
 4 files changed, 1310 insertions(+)
---
base-commit: 52da431bf03b5506203bca27fe14a97895c80faf
change-id: 20250618-add-support-for-meta-clemente-bmc-941a469bc523

Best regards,
-- 
Leo Wang <leo.jt.wang@fii-foxconn.com>


