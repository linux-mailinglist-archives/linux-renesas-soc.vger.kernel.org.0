Return-Path: <linux-renesas-soc+bounces-18816-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB881AEAD17
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 04:59:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C08EC1C20F22
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 03:00:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8713A19597F;
	Fri, 27 Jun 2025 02:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LLoI+182"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F6A219E8;
	Fri, 27 Jun 2025 02:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750993189; cv=none; b=eyA6pEM4PuH+nJzyrGqWdLL3J039mwKEZek5/qcl99NotvgocD04s90SOn8tkqwQti6h4+bZc9LghRu+PRY63B5QzQn+562qrtTWbv9bLMFEbEH54EoxBKAlPLmT/B3/zeabAHssliJ+EP8Vmc+e/ZjndjrNMZvLe6a6unVA9po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750993189; c=relaxed/simple;
	bh=iElNKH47dFr7cEuSYr/PXBozji92kqyZzzl41GE5XUw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XNmkzcx6GqNMl2DC8AOqGrfqEzcYUxGRGQ1AZezwvQRlQFZcG+MhnUxzdMBUU02/i4YvIjVgls7gk6jZTAKUcjQuZrxOhx2m1xWBipCTzPGXwBa7LugUw2VcZyuxKGL4/V5l9JQp5mdMSSVMTVSO//eUiNLcJs6ysdjrZb35Mgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LLoI+182; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b2c2c762a89so1473712a12.0;
        Thu, 26 Jun 2025 19:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750993187; x=1751597987; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UM8inYvwxYcJMQtjXe+UEuLSqBg2GM1eujKN8koXR4c=;
        b=LLoI+182QQKf0Djh+mOpSxbqdeyrop2hYxVBKxaOGMaJWrHpwPGPgoXE3R+YNS18qy
         QJ3AtQB9zPDdGu/4D3wltfgV0gZAOW8A8QEKQuW1yMyaouv5Fbx1mrmut3FEBM5uyFYC
         TQITsXJHEDi5ZA5m4RYM0SlTy6I6Plt9RQ8Ve/sq1tGBNJByZfv94iRe7ZmRGQ34yqGd
         X/07f3HRJaBexmlB5DJ/pIDpi7qNmpSNNAHFLDihzcMPQ0y4ptGSbjNtd9ewD4GXnoRy
         RFURSKlxe1bFpZjE07nEPTX7J0doH+gqNvx4e2YhyH8Qlpkfa+cBLd/cwhsTfJNq/GwP
         P7LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750993187; x=1751597987;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UM8inYvwxYcJMQtjXe+UEuLSqBg2GM1eujKN8koXR4c=;
        b=KNxf8SDFJtFHCwfVdlTVj0X1oYUxalFr4rdRJEQsx/PObUxrr5ZkItGgTY4ScumWUE
         3qZmpXK6ve02MOxRpFAnXg2b7LZwleaRjR1e8pLT4ST4KckFSoARX+CSulZiUYAMmLat
         0By42i2l17EE7tzs8BOEBrgZsfohlTKBNoS87T4C7Vo2if3ZMZAZlYH3VNePmkbbL9fU
         R8cZzp9OJ9MAkr6oYxO0It+EdxaOO5YI6caAacKd/huaD7wgcmK1v5dGhv/3L8iY59mD
         HCjXCDlNzNDwsEnt0ukum580l7/D62ms3SArGeg612k62qL/V4Pyt4CebtDKq2HPGAsU
         +egQ==
X-Forwarded-Encrypted: i=1; AJvYcCU64hl38AKSVP+NZGdiMpd7dJBI7hso0za3c2cxhIUrtxfjhrvyCVlfu2t6sLpKlGdSExpMjTou9hCo74zB@vger.kernel.org, AJvYcCUoXixStFQdgtfDI7xStiCWrf3g5WUiNR5NRJi3KqG2jyp9pWE0/WbzPjfevxD0jK7qnp9rswSKxBIT+eEyXkw7HLU=@vger.kernel.org, AJvYcCVVn28em9I42hvP7XGFriizB4mGH64wH5yrOWq+O7qb+r6m7hmQfID8ddZay7KM6J+vCHOUuQewKE5GqOsdLtI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwMw7tJuQwcpkrOeTU6FbRBJLtBlGbKfb3NwCqMuaFUyJvPfkb
	73uPV0Iwp4vssvw05MmsuKhpNzWIeDF7ZFYE5sn//3NYeM+klElHNMYf
X-Gm-Gg: ASbGnctrZKhfR4ISroFT1S+AfVGVpvPbq81y7gC6+WYZrD7ZY1rRMI7UOvSSQkB4Ibf
	K4DPUMFggSp/7+hAII9+/4QBIGThRRT0j0U9ULZ98/SZaWLhOmUY8RVRiTSBYcQUtdgE9hBPONl
	5pGmfMy9suspPEOSsLgyCix8xTz9UTiXfAJYCK4zDUdV9IJx3hb9amu30mMB7HLmO/sBx1zc0GW
	72iVd0dxtAoJmjN+qMM0dfkJIveMfTe72SKo+3JtaQhRcoRsy3RYs/Ye9O2sQcx8tf+kK1S/KSq
	LBE7HPW5utm+DmhQ62+yzBruRw3vGQme6TtGXwhMs5DwNqjA5q7SCwsDVMW4PSVv+g4b/yiBDIk
	566U4O44m+pq2om4B7LAD3Oxn6qVA/kXescmsemtkuA==
X-Google-Smtp-Source: AGHT+IFoDN8qLfLeTBIPOwa7sPJd2PCjUeJWH1WcwtLhHFRMtIYH77B3tlxBJ9aajx0wAOSTXR2YVg==
X-Received: by 2002:a17:90b:58ed:b0:312:e6f1:c05d with SMTP id 98e67ed59e1d1-318c8eb9aa8mr2246427a91.2.1750993187197;
        Thu, 26 Jun 2025 19:59:47 -0700 (PDT)
Received: from [172.17.0.2] (125-227-29-20.hinet-ip.hinet.net. [125.227.29.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f5426bd9sm5358186a91.27.2025.06.26.19.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 19:59:46 -0700 (PDT)
From: Leo Wang <leo.jt.wang@gmail.com>
X-Google-Original-From: Leo Wang <leo.jt.wang@fii-foxconn.com>
Subject: [PATCH v4 0/2] ARM: dts: Add support for Meta Clemente BMC
Date: Fri, 27 Jun 2025 10:59:01 +0800
Message-Id: <20250627-add-support-for-meta-clemente-bmc-v4-0-ce7ff23460c4@fii-foxconn.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPUIXmgC/5XNTQrCMBCG4atI1o40vxpX3kNcpNOJBmxSkloU6
 d2NrgRd6PIbhue9s0I5UGHbxZ1lmkIJKdahlguGJxePBKGrm4lG6MbwDbiug3IZhpRH8ClDT6M
 DPFNPcSRoewSruFPGtqiFZNUZMvlwfTX2h7pPoYwp317JiT+v/+gThwZIozPGEql1u/Mh1N8rp
 hhXmHr2bEzizRX8F1dU16Am32jLlcXvrnx35S+urC4KIb1Hrwz6T3ee5wcuQsH3iAEAAA==
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
 bruce.jy.hung@fii-foxconn.com, george.kw.lee@fii-foxconn.com, 
 Leo Wang <leo.jt.wang@fii-foxconn.com>, Leo Wang <leo.jt.wang@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750993183; l=1697;
 i=leo.jt.wang@fii-foxconn.com; s=20250618; h=from:subject:message-id;
 bh=iElNKH47dFr7cEuSYr/PXBozji92kqyZzzl41GE5XUw=;
 b=PxQX6epia39JyezSIwOl8kvO2UxGdecuVsTKr4L1dZkZzWZeGL1DCZ7IW5u4C0IWWbswU/k6N
 GYEeJIqGln7ClrW3occr47U7J5jPhyR2KsFaWdL/lSbiymy2AXmpYGn
X-Developer-Key: i=leo.jt.wang@fii-foxconn.com; a=ed25519;
 pk=x+DKjAtU/ZbbMkkAVdwfZzKpvNUVgiV1sLJbidVIwSQ=

This series adds initial support for the Meta Clemente BMC based on the ASPEED AST2600 SoC.

Patch 1 documents the compatible string.
Patch 2 adds the device tree for the board.

Signed-off-by: Leo Wang <leo.jt.wang@fii-foxconn.com>
---
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


