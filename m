Return-Path: <linux-renesas-soc+bounces-18621-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA91EAE3C52
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Jun 2025 12:29:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 88C8B175215
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Jun 2025 10:29:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90E7D23AE7C;
	Mon, 23 Jun 2025 10:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SgbPBOWF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E52201261;
	Mon, 23 Jun 2025 10:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750674577; cv=none; b=iavfBD2f7L/9/r2UQ4teOoXOMocBQ7IHBOjNw70rDZHxOmh2AIztSiH45+uiYBrFarx+nmRuUg331p0/bghAZmfGbCZ8/xvgps1BBbxYAsjr8G1Ns+Zmuee9LpOzo5Zl2uw+qo0663MgtX2hqExsmyUsI0Ndh6XeWGlwfMeGPAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750674577; c=relaxed/simple;
	bh=+GW4fgeA+xKGchuTpQBu6jwVxlJTWxJyFy/i+RiAaek=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XomwX4rXCwWZ3lAuOei2s4joSjYo1mjdWxMoEsQvcNRhTB6O9c6/wskw7Pi2jZCDGUMxEOIDbvD10Iqt8sqqGcl3iO+VY2yZKI1h/dJz7WyCnCDYPgUptJmQW2LH2Ac3whcLnHrztzX4CSmghrPMlISBvzP7EExuBpNnS8kHZck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SgbPBOWF; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-236470b2dceso40635015ad.0;
        Mon, 23 Jun 2025 03:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750674575; x=1751279375; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LNA9piZjlRKT0wGiiHkHTEOKa/CNGuXgOq/W48NNgPc=;
        b=SgbPBOWFbqhi3GVRHIrwh6I+gB8bXvFhmAX6yand6mqYrC8XIaVXAjXUx4EKhv9w0q
         2/oG4UMvbnDflYRoEN8+5iP+jHiORmkoe7FX1xZmij0u0uDilX8AakAadxTMPf9kpzLw
         l2KD4SkSirrIGB2rl4lIrp9cp5qzefJEe3MzQ0zP47oGdIUBpdO1lMXbdwXC/0S6xgMB
         JR8VH60/IdlRJa5owat2fhYG8djysZMeTV7wPnhFRe76/K19jyjd51ueSn8Kqhh4iurf
         hTSMaIVlAO9Qms6dpu3hzKCz+YZ0Qz3Z5ZGn7aTdF8saQaj9uFEl7u+1Bs6VeKtVGZx3
         5RtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750674575; x=1751279375;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LNA9piZjlRKT0wGiiHkHTEOKa/CNGuXgOq/W48NNgPc=;
        b=adl/CWY7jt2DIW8cwIPCqDPKyPal9Zy1gozIKkDTnKEL7N4pquZxSAEV6eJlPD5NzZ
         mYUWOhjMYQOPYnp5S2C2u7tXwZh0mYqmtuKVBOgZMzMu1iqvJCtISIzLT00lvGf6s8Se
         SzHxvgDZnBVBAcoZFO/Ad75eBNeN7c8DU/b/0nBZtq3S2tDq21Qqkr2wf2GVNU5uDQji
         R2GKRo9iNhF+QXFwE79ss9kf8DyttQK4XFvLRWQRMv0WzOkX4AjIlzxkqz/2hNKWKfUI
         18dyke8QMK4TXKw5BlNsalpupzrGvxQBuhcz0Vmw5nytp4R3xefkobjCBcqDvQ2c4Sdv
         5Wsg==
X-Forwarded-Encrypted: i=1; AJvYcCURyZ79C7VWK2cVjssDZVCyONmz4Cbjmzz9ZTasoo0AXZbRhbqTLPcLPlnXr9IrqJ+CopF/+m6kcJ43b7rCfcQ=@vger.kernel.org, AJvYcCV9XjArZuUYNgIyUFUTDulTYm85G+sVXNeQHw2Db2kxkouApR8emMA/2C4PWHbEG4B0UWRkUNQBNAietYm+@vger.kernel.org, AJvYcCX5sgfxEHXBQOy2TPQjVyFxDULkujJlTnaKrIPi+yi9jh7KbebqoFXFLn7yM1RFZePQLLAmKwBRCNbclfaUb+Y/QMY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5vXqbAUfI74Atq0crB5qPvy2u3pUKN84O6BEA4n731udp7P4g
	YVKCydGlVBy+yBGdj3cXtFkjWimJLEIZ1+93fPsqPyFYdxuTfO3gDFEH
X-Gm-Gg: ASbGnctgeuFWAbHHzZTbm5be+htvuKQ/bdAH22+Vzeeq31FafEZp0WPduzhvhksc46V
	hSS9EOZ8yKyQZ9ioA0bD6ujB5s7D5ATxjLpPTynjdTLcfTI+nW+MRVijq4Rc3MQYYG2k3v3tvch
	DC8hqXjw7EtIhJMG4oxRt884G5fXCUDTxuDsYvgHoNax2LdWyvpzMq/cz72HOFNzm4V1X1+eQ2E
	T1Ps6eqY6l+FfuhqdeRllkjzr7rtRfxlpKSaD/v8WZSjMgCMa4l1/JcJ7h00s40T+ZtTIailuin
	symb+pzM+f6+xfLF0su2s28M3Ag0Ef8biuO8jBDlXQciLWN7sWchpi1aj6frdJKbjtK1mJB1bD3
	AM12QdPIffrgV22ZyIE2xd8Vmeje+MYs=
X-Google-Smtp-Source: AGHT+IGu/olQd3gCQ9n8b1T0IY/BOseKz/yROaIShRCjegUE1QktPgjGuNH4gxysfO4C6lOdqqk82A==
X-Received: by 2002:a17:902:f642:b0:234:c549:d9f1 with SMTP id d9443c01a7336-237d9bac013mr160443415ad.47.1750674575287;
        Mon, 23 Jun 2025 03:29:35 -0700 (PDT)
Received: from [172.17.0.2] (125-227-29-20.hinet-ip.hinet.net. [125.227.29.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237eec29a77sm39901125ad.165.2025.06.23.03.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 03:29:34 -0700 (PDT)
From: Leo Wang <leo.jt.wang@gmail.com>
X-Google-Original-From: Leo Wang <leo.jt.wang@fii-foxconn.com>
Subject: [PATCH v3 0/2] ARM: dts: Add support for Meta Clemente BMC
Date: Mon, 23 Jun 2025 18:29:00 +0800
Message-Id: <20250623-add-support-for-meta-clemente-bmc-v3-0-c223ffcf46cf@fii-foxconn.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGwsWWgC/5XNQQ6CMBCF4auYrh1DC63WlfcwLsowSBNpSVsJh
 nB3CysTN7p8k8n3zyxSsBTZeTezQKON1rs8yv2OYWfcncA2eTNRCFkofgLTNBCfw+BDgtYH6Ck
 ZwAf15BJB3SPoiptK6RqlKFl2hkCtnbbG9ZZ3Z2Py4bUlR75e/9FHDgWQRKOUJqqO9aW1Nv9O6
 J07oO/Z2hjFhyv4L67IrkJJbSE1rzR+u8uyvAG3SOkwMAEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750674571; l=1272;
 i=leo.jt.wang@fii-foxconn.com; s=20250618; h=from:subject:message-id;
 bh=+GW4fgeA+xKGchuTpQBu6jwVxlJTWxJyFy/i+RiAaek=;
 b=btkegG8seakota/9EBKZL2P1m9hbYQ7NcEdNGd+Iz8G8tbLqCymMYqAzZy0D7nJsbPbeG6fVy
 yF1S00pOaEBAlGU31LLYn+ehfvKPiteZ5u+ZO0/xuwC9i50JSo2Nnnf
X-Developer-Key: i=leo.jt.wang@fii-foxconn.com; a=ed25519;
 pk=x+DKjAtU/ZbbMkkAVdwfZzKpvNUVgiV1sLJbidVIwSQ=

This series adds initial support for the Meta Clemente BMC based on the ASPEED AST2600 SoC.

Patch 1 documents the compatible string.
Patch 2 adds the device tree for the board.

Signed-off-by: Leo Wang <leo.jt.wang@fii-foxconn.com>
---
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
 .../dts/aspeed/aspeed-bmc-facebook-clemente.dts    | 1254 ++++++++++++++++++++
 3 files changed, 1256 insertions(+)
---
base-commit: 52da431bf03b5506203bca27fe14a97895c80faf
change-id: 20250618-add-support-for-meta-clemente-bmc-941a469bc523

Best regards,
-- 
Leo Wang <leo.jt.wang@fii-foxconn.com>


