Return-Path: <linux-renesas-soc+bounces-19579-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4583B08FFD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Jul 2025 16:59:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 848D8A47A6F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Jul 2025 14:59:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEFD22F85F1;
	Thu, 17 Jul 2025 14:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f1gcU95t"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC472F85D1;
	Thu, 17 Jul 2025 14:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752764365; cv=none; b=AwQ0bLI2r3lqrMUeiVIcK4bZDjwk3snCgjebQDNL/ak9s+ak6q88T620HeOnYSvPVUBBnxAJHdRhQGRAdj3WqddQ5kUSJJ3WGAsnaMCr31gMTAC1wqc2w28Cu+6SNO0LvmN00qDfeQPbbsg99HAGwB2JQn7pWaJMrgDxF51bJMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752764365; c=relaxed/simple;
	bh=JMX/QgUhmqLWxuEkWEUiV/WuMSD4F4bRfw4zHmMzWUw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IexqzRldm0dAeA+CQvXXEqs6AV+HktE91Hs2CzA2yJBq6sAvoXnBgqYHQdvnjcdPXCyR9VHyFmHTCOkX9j03VLdoZy8QkDgEi2cx1o/ruSqKOUxna7yFQskQIiUQ/sbxtMV+2zxT/PBKOEINxviDbQgkl67/r7R9/zdNJHstOT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f1gcU95t; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-23e210ebd5dso16100645ad.1;
        Thu, 17 Jul 2025 07:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752764363; x=1753369163; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vnmPbk+SzjnQUab3zLiOuEdr6xig/TglCXCOUdlG6xw=;
        b=f1gcU95tNbxCA9FrYQIQkVdoIKcB1FKAj4/u9/qomR0cHXTpOm5T6Q0olzsh/kIBH4
         T2+EvUJ4sFfIk/473icxVUGfa3W4wWcP4rbT04T6tR7f6Afuvtn/b7ZciTlE/TVP7j51
         KkqQWOUh2OdnjZtE7+dCxKMgSLeXTqLFeCj2j7g9jB1ODb/LOuGATL9X+382DJ0DAC7b
         eLbDLhlVc+o/HUHNOQ7r57K8F2wcFuUMBEm0Goe7XNJhfEIoXcTwlY7qTa+nL3CO85GN
         1yHOo6RJMfBvfSebQC+9Ir6mHj/GW0GvmiAIZDjJdiLiTz3lnhGYUlpzpIb2kAy3G0+5
         6dpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752764363; x=1753369163;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vnmPbk+SzjnQUab3zLiOuEdr6xig/TglCXCOUdlG6xw=;
        b=qwxpzxivG7BnSLsLZR+yR0LTVO4FnQIT+JeKbPTAIP2Nlf0d070iw7+OKCkbGshw0O
         JCTre3UyJrgVSCspIEPG1KrC133MGKbATmBT36hYM91BpzhRsjnn6aLKHLREYBXRJVut
         4ct7qF3XFFpZaYoOO1Sp3gOsAZDr85bdnWRbYqLjU/RJ8iF4Yt3yBmGDc2geNVpwPw9U
         OGM9M9cJ9+Ymub8vnur9XY+1L30GN9pssX8TTVAn5q2urrgMg8GtxF87VPWuid5/M1fO
         aH5plZr3jj9WA0ElQ8LVpwI6z4Lt2guEaLBkHpLUV6+/xDs40wmxWMC8LILdHlzMq6Kw
         zrBg==
X-Forwarded-Encrypted: i=1; AJvYcCUnsTJ2oLt19FqQnGPlRkjX47ciwPMmD1AlaGerbNsSZEfVs0nxKhDUrVp/ppWHc5nEOdV3+LjQ3st+09l6RRc=@vger.kernel.org, AJvYcCXFtpxcE22xKFyT7KPc54gxSplyK7IYl8M1ckKD+uBvIUkeB9Hk2rm/sfiUbpT3PLeZM4Ea/+Z2F2mNOlbh@vger.kernel.org, AJvYcCXlYJS91StJAZlC+o9/3pgQbEtnlKPE38aeFU79I6W/7RXuxJV/qYp0EhJ5iY1jqsIUxpIC2H+OwoHdUbABC8kZacg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkmTEzVpkJd82yh+CBbpZAtGPtQiTz2I4pBtjb2kAeEZk8Jb99
	wxx/bYnsCfum3B5n7uFw0QvJ4J4n5EP/8ek6l2Xn4Js1t+FPhV3NIwdJ
X-Gm-Gg: ASbGncu8BSgYFRBRtZ9LGvNBRcnk92HK2HoS1GwvXOznbWAgPpT6QjfcyqeQGECxakm
	bf7y4v2gFRSYa/ZSOgE6TdhB7AXTBFA1Urv4++YNvw5dVhOsWBwyTSvwQ46zQwDDPVGNjhuSgCG
	5dvbpHcRSK1Vo1aka+wsNU9tJwHb96NMG35BCVZDCdVRU7ztHFOdtU4iPmq5T330hCMHmTgNR4w
	zUsV3YgMBazbN+6Di+RzkBAJZBA9mNGk9D6vcYeoNqciGJiBdPQP2sPRw3hvxg9DeOQYXQkIu1+
	NpgP1311FzEEcNTzVDQ9CojzXmO7I6xfzmuV0p+b8bK0gA3H0NaFEl/fO0UdYvsHszhXGrKDA5R
	hu9JiXknXKOrx58EIpOW6RlVOMWS8zTbefITZZwZ5QAGKyMxBvDWCRDUWRwF6djUzGAk=
X-Google-Smtp-Source: AGHT+IHgkzEOYEeBylkMIDMLWlCKIz9EjBVWlMOVczHADMYS0NEj3G6AuhDKx5MYpE25LRvaHDKgNg==
X-Received: by 2002:a17:902:d4c1:b0:234:595d:a58e with SMTP id d9443c01a7336-23e38fb11efmr1511875ad.25.1752764363108;
        Thu, 17 Jul 2025 07:59:23 -0700 (PDT)
Received: from [172.17.0.2] (125-227-29-20.hinet-ip.hinet.net. [125.227.29.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de42aea81sm144603915ad.82.2025.07.17.07.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 07:59:22 -0700 (PDT)
From: Leo Wang <leo.jt.wang@gmail.com>
X-Google-Original-From: Leo Wang <leo.jt.wang@fii-foxconn.com>
Subject: [PATCH v8 0/2] ARM: dts: Add support for Meta Clemente BMC
Date: Thu, 17 Jul 2025 22:58:58 +0800
Message-Id: <20250717-add-support-for-meta-clemente-bmc-v8-0-2ff6afb36b0e@fii-foxconn.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALIPeWgC/5XRTWrDMBAF4KsErauif0Vd9R6lC2k0agS1ZWTXp
 ATfvXI2NdQFZ/mG4XsDcyMj1owjeTndSMU5j7n0LZyfTgQuvv9AmmPLRDChmeFn6mOk49cwlDr
 RVCrtcPIUPrHDfkIaOqBOca+MC6CFJM0ZKqZ8vXe8vbd8yeNU6ve9cubr9BF95pRR1OCNcYjKh
 teUc9u9Qun7ZygdWTtmsXEFP+KK5hrQmJh2XDnYd+XWlUdc2VwQQqYESRlI+67auvaIq1YXbUp
 CKsNA7bv6YVc3l8kzRpM4BPfPvebXtezQ30xzbZKobYhMSrPv2o3LzRHXNjfqEKzSDrT3f91lW
 X4A8/ldSugCAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752764359; l=2456;
 i=leo.jt.wang@fii-foxconn.com; s=20250618; h=from:subject:message-id;
 bh=JMX/QgUhmqLWxuEkWEUiV/WuMSD4F4bRfw4zHmMzWUw=;
 b=O7FZv7SmN+3mZNqZcFF0E6+kINF6Do9tG1Je+dkH5V0XJWXbF2wApr0D+XWg6pkWRwXAS+RhJ
 tgITsqyOYw1AMNw2JUBAAELEhjLPkzXTNYi7iabDimDhxy6AIb8bJbp
X-Developer-Key: i=leo.jt.wang@fii-foxconn.com; a=ed25519;
 pk=x+DKjAtU/ZbbMkkAVdwfZzKpvNUVgiV1sLJbidVIwSQ=

This series adds initial support for the Meta Clemente BMC based on the
ASPEED AST2600 SoC.

Patch 1 documents the compatible string.
Patch 2 adds the device tree for the board.

Signed-off-by: Leo Wang <leo.jt.wang@gmail.com>
---
Changes in v8:
- Relocate IOBx_NICx_TEMP TMP421 sensors
- Enable byte mode for i2c11
- Link to v7: https://lore.kernel.org/r/20250716-add-support-for-meta-clemente-bmc-v7-0-d5bb7459c5aa@fii-foxconn.com

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
 .../dts/aspeed/aspeed-bmc-facebook-clemente.dts    | 1295 ++++++++++++++++++++
 arch/arm/boot/dts/aspeed/aspeed-g6-pinctrl.dtsi    |   11 +
 4 files changed, 1308 insertions(+)
---
base-commit: 52da431bf03b5506203bca27fe14a97895c80faf
change-id: 20250618-add-support-for-meta-clemente-bmc-941a469bc523

Best regards,
-- 
Leo Wang <leo.jt.wang@fii-foxconn.com>


