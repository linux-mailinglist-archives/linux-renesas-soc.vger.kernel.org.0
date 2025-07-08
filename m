Return-Path: <linux-renesas-soc+bounces-19374-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32736AFC817
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jul 2025 12:18:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6558716CBF5
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jul 2025 10:18:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C72DA267B89;
	Tue,  8 Jul 2025 10:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dWZRC75l"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492B420E033;
	Tue,  8 Jul 2025 10:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751969903; cv=none; b=UvpfN1bgyrwGrwj5zkSj7sGkplDStM1IKlJviyoU+MiZVBGN7TRMSKFIbbLZpKtX8yrbh9CzWejtXQwpc8UhrZEgEfxknwNaaJKDNtNoCbh4d/N/kNX0qNa10Kitr2KM4aIRqznytyyjShA/bWRT8nfAy5tI6yOj13g/Ah34FW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751969903; c=relaxed/simple;
	bh=lQzrd3v8IVLh9gCaLq7WUnZF8AHGYqftBF79jT2Lra4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qJUcun038wilP5GJZRVR2yoDQlpa2N0o4mpU0+U+fJRXOIbXv8muEdGtYN2YGCsdSYzhEjm6wBNChXpU0pfaZOcHQmPapBrOjxyNFve+aipB3zxtDdPqn1T/PalXjfXqSksRJhreApDhAw9j2k9dkxsvMeM+wTtAOCTrosETRk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dWZRC75l; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-742c3d06de3so4865129b3a.0;
        Tue, 08 Jul 2025 03:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751969901; x=1752574701; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dLtaJj3z2oPY1ShSlkHP1j/IqOzaduHiAyYzCbRo9Ls=;
        b=dWZRC75lO3U6R7ZT3ccb6hBu/ZitOAVCN7UDdXa/uz5pnFzBkz/7d6YJlwgrH8JRSA
         tYtwzyQzmReVMxKIBKJSyVF4KBh8fS0wNLUWI1q+voTItqeUdCLFa9gxuZ29mQehtCw2
         OSBkmYf0fwayzS/xtHF1YqUGCI+NGWOfFlieL0QrAGJg1r0VI0OBaUWO8h1VVGu+EYMI
         R+JGRR0deWP4YTraMTMEqe1vV1m3CLIZIf3LbnQLeX1wrtxInfO+1mqvvTNo8a36+sF8
         gDPTllTQpGYaazYX67pmYrwQ/JsT4ZKG0kFZMZSqUnJ8WITpeNI6/outUP6N5Y5Vtukq
         NUJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751969901; x=1752574701;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dLtaJj3z2oPY1ShSlkHP1j/IqOzaduHiAyYzCbRo9Ls=;
        b=SeTzYPwZiXam/S+Fyf7tu/CSeQtzFrdIUDNJ+y+Z9MTkximq0m4Ftvr3UsZmRTId0C
         qzOYUn/IhvWhsk6mNx7AbF9xTvpuc/1lPmWHLcGTgUEKGDCceZs5ayMeflZ6/KkxcJVi
         ORAy55mp/tg6PRQZjv7YyapAbHaNgUi+ak0a/nRH7tP6SMdZRYxqxXGUeg1ytmKiEIGO
         fgAMQgro91VYegmnWmFdUMKurQQn6MD/yuEkAThOp7+LZCoPZBWZol0xuwZ3adcaK4vM
         y6BOYMkAQgsH8ZWQ5o5RfFGP8vQz6maxFcYJ3wnkGWFGfBLqx/tNmWoiyOTfI/EHaoMo
         JXkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVY7AZP1+Q88hgJ9HfL79Iaqmzo/Kx9Ddwo9LAbxWx2Uo/xxTXjrdkKHa14RAE3udA09S5/2noOGwRYYjm1OVFdklI=@vger.kernel.org, AJvYcCXVXTr8emj1pSNgqSJDrc5IujbAx/IRXrK5ThFNCi6OqKzk9Epg9w38+2OaiCmYPzWAzGXU9b1axxYKhB44@vger.kernel.org, AJvYcCXppYcHM/z5IydpjbPtEcNqY3r9ATY14ePI9tToUZdARtwf6Yba1oDKHTBvhxqK3X0Dnn8+1K3ejhdVLwi/AP0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf0bwqLpph/zjS1W508pMugHQnufCfyognz2LVqW66wLGLx/R6
	Dz6IkJDT56Yw3Nuf9s34BpJSAS6cGUAT7XFSSe301WFQ702RPIRTx3bWnADNzw==
X-Gm-Gg: ASbGnctiINtB5oBN005Blc3+vPdcEi8eey9yHwmSjh/2lZrxh6dlZoYJVWsY6prMBFU
	kp+8TVlANhvhAjIsHgHyqonZ2OLjKNGp/Xc6xl314Q/jyZ58UL6RXyJd7VAPFx9XWgfd43ugpKW
	qkd9qmOmvPlxSKEf4oq4jIM/MMchlZ8OQXmAklYpvjQLpskYbNCxGwERJSR6R/bP84HS1WhsgcN
	Sr/Be9HwykDHSB1NNz90HoRu6noKIiuXMEPnbyGb2uS4oI7FIhKjnLFxNAu0SdVnA8nh534eYA9
	4wVGlrsejxCweXqh1x2Cb8hrFDtpNdTafG6CAf8hrF1ZpZrtG6JqqW8aMFNO9sLAOfSr4scbEaR
	/xgK1Er/xj86e0+pIQ5qT53cMgBvHVhM=
X-Google-Smtp-Source: AGHT+IHFTbQU/uYOoMrihd+GoWidRAGLXPHYkD16HziD5MyIKSHN6gIaJzOtsuNhgeCshtOg1HOW5A==
X-Received: by 2002:a05:6a21:a44:b0:1f5:9024:3254 with SMTP id adf61e73a8af0-225b7f19724mr25324211637.6.1751969900609;
        Tue, 08 Jul 2025 03:18:20 -0700 (PDT)
Received: from [172.17.0.2] (125-227-29-20.hinet-ip.hinet.net. [125.227.29.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee4a40e3sm11114709a12.34.2025.07.08.03.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 03:18:19 -0700 (PDT)
From: Leo Wang <leo.jt.wang@gmail.com>
X-Google-Original-From: Leo Wang <leo.jt.wang@fii-foxconn.com>
Subject: [PATCH v6 0/2] ARM: dts: Add support for Meta Clemente BMC
Date: Tue, 08 Jul 2025 18:17:59 +0800
Message-Id: <20250708-add-support-for-meta-clemente-bmc-v6-0-7f3e57bd0336@fii-foxconn.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFfwbGgC/5XOTW6DMBAF4KtEXteV/4mz6j2iLMww01gqGNkUp
 Yq4e01WLFiQ5XsafW+erGCOWNjl9GQZ51hiGmpwHycG9zB8I49dzUwJZYWTZx66jpffcUx54pQ
 y73EKHH6wx2FC3vbAvZHBON+CVZpVZ8xI8fHauN5qvscypfz3mpzl2r6jz5ILjhaCcx7RNO0Xx
 VhvH5CG4RNSz9aNWW1cJY+4qroOLJKwXhoP+67euvqIq6sLSmkiIOOA9l2zdZsjrlldbIiUNk6
 A2Xft266trtBn7BxJaP3Ov8uy/AOXrcBoOAIAAA==
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
 Leo Wang <leo.jt.wang@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751969896; l=2063;
 i=leo.jt.wang@fii-foxconn.com; s=20250618; h=from:subject:message-id;
 bh=lQzrd3v8IVLh9gCaLq7WUnZF8AHGYqftBF79jT2Lra4=;
 b=KlqQpQVMjrnLsTyzdw9K7byzDuSgHRV9Z3mimvYYtAWncmVd2YRbbCEniIfrILAVU2LEhX156
 mgdNooJdzBbDK0eYj+sxgUbJ1UwgKhLdxEcF+FpXccjYalJHvhtPZBC
X-Developer-Key: i=leo.jt.wang@fii-foxconn.com; a=ed25519;
 pk=x+DKjAtU/ZbbMkkAVdwfZzKpvNUVgiV1sLJbidVIwSQ=

This series adds initial support for the Meta Clemente BMC based on the
ASPEED AST2600 SoC.

Patch 1 documents the compatible string.
Patch 2 adds the device tree for the board.

Signed-off-by: Leo Wang <leo.jt.wang@gmail.com>
---
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
 .../dts/aspeed/aspeed-bmc-facebook-clemente.dts    | 1291 ++++++++++++++++++++
 arch/arm/boot/dts/aspeed/aspeed-g6-pinctrl.dtsi    |   11 +
 4 files changed, 1304 insertions(+)
---
base-commit: 52da431bf03b5506203bca27fe14a97895c80faf
change-id: 20250618-add-support-for-meta-clemente-bmc-941a469bc523

Best regards,
-- 
Leo Wang <leo.jt.wang@fii-foxconn.com>


