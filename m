Return-Path: <linux-renesas-soc+bounces-20783-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C61B2E60D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 22:07:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 28F2C7BA684
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 20:05:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 279D22765ED;
	Wed, 20 Aug 2025 20:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jh3vppxj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D03936CE19;
	Wed, 20 Aug 2025 20:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755720427; cv=none; b=SQi1OldE2hiLCfyZvDS4L+IFoHWV9vMyGp0/YW7tDIdjXztm+UB/8nDCkTt1+suo34BoZ6UvG3MFQCopgurFOKc+KpPrX3RriRr8v+sXjESYwn1A6p7CPLqZBZgDthVBT0kbuTN/qT9vMlcveeSvNqZ47XCUtQl9nhagMe71h10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755720427; c=relaxed/simple;
	bh=3gXciDHf96cHfHxBRvrLeajqxwFXAc6ddN57y0LB4IU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tHC79XDnPpmjVLUCnuhySVayagH2CMv4q4BwXWUzf2CDW7OSadoIQPKgvhx+xl9IJPxZ3NXkdp6harvWH3OZWQ0zybbpwj+j4g4X8zwx9KqsaVEgqAGv3mko+UkstWLW4xHgK1jO5+P+cRhSVhmBm9ulN6zThkWCGM71Yffb5To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jh3vppxj; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45b49f7aaf5so1536505e9.2;
        Wed, 20 Aug 2025 13:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755720424; x=1756325224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hGdx81zu8mbzTejHRuI0a0QsTgQl5GSh7deJkiKL8ZE=;
        b=jh3vppxjl89TB2Cg0GAsCVz1D1x9dN70EE4yvyT7/B4T9c6y5iyv+bigmidghEy8e5
         j2MPMOOnRr9aZZbFFJY3oOb+DXng4bOj7uSiiHfyXaxH0oAKq+bYX9E8k1spPNZtVodI
         Yn/U84dRR7M9UxqPbAh+SpLhppnYjVz/gHevehwN+VVwEnRQNb/3Nec2fpEowzDtSkm5
         bPM3u01PYa8D/jFIHy0ndqvbEnuqyL395AulQfnfNxDoLCUT3uO/XRxE6hS/pre4oorm
         BiQHo/Bq0HzZek67/GaD8v934+JlZPI0auV4cS8pTLAURyPTlfAKFJqDe1UjBA8z/HfT
         gGug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755720424; x=1756325224;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hGdx81zu8mbzTejHRuI0a0QsTgQl5GSh7deJkiKL8ZE=;
        b=w+X9+wxMQOK/YoBMR6gXuM4wL3da/VnShPiEpuilBF+EAIOJ7FYlcJTD7jFy7s0AoQ
         KEuvzLZLy6Ooa7I0guhROIwBxnyZM4hSTxqTH+bnznoh8gRFSbmm9QwFtA862kEeFnxA
         13Ip4kJmsHQZUeAnEKQvcyBsx47lu03xMdxHSPN1olKtZ/7KyOdjm82bAt03Oqma7Okm
         tz0BAQidQq4kqNanjokZSezISNnWqhISYQublyq/YAV4eYU91zD7sFGAjdbzitHXich9
         +kqjnmRHsXmtE+pciu4ps2BOLKL6acBwfEFiCZ6flQ/5ehUhafD3sLYZN5mNU6NcrhlV
         r8ng==
X-Forwarded-Encrypted: i=1; AJvYcCUzSbZj4UZ41+MfnbgbRvR7GpDhBo7MNZF5MLtaUuy5LQSw+2x8320zoU+MnNKkElPpPYRSf+jRJKiX@vger.kernel.org, AJvYcCXYXPIc7XA0LVQpxO8sAZCByLMRz/TB5xtihSIQaG+iXx1H4RTbyD4SCos9OjfbgT5ivrL2q6ffo+YGli90@vger.kernel.org
X-Gm-Message-State: AOJu0YyFJnQ0jStNnOYHLk5PhYaJQzXkzzPdaRx/l2ojip2CxiWiqB2e
	8NfqJxYEub7QDj389jJ7YsLWqoCorx+Ya0rVVFWuOfvigyZGytAqmAkbzarfErCS
X-Gm-Gg: ASbGncvkYKNZ+NxY9TjTJU7eJQJd6INB5A4beZ1wMBBIzjLLcU/73DSNo81BTfvu+Lb
	nwsCMiR996B39m0ypbQs+HKtLIw0jOOqRkfmtEIFWmR+wYWBxJ2f54VunTrLCEU54tlmcOVrgtw
	AI8Dh1GmdY5IGQKtTnGDifApKy7BxBbwp4fS+oBT0rWunx1YT7UC55UbhE1LSm5WE8zmeqqGQfF
	xchtUqDzl91W8EBE5lFozcBykEx1CWPp+JfOusQcEA83qnsTJr29sr7BdojOKQvnGmhE/F8+LW3
	qqZbGDKCmHITv3tBlIlk7kctJdJ08BXAUhXMgex1OcRRcHtDCYvsPJhx5AN4WjmM4B180Sxq0Gv
	nG7oQsj8j8l+8vzvgCRWCnKJqIoZKxXBeUe1kvBJAgEv4P2jSvDVssRlm
X-Google-Smtp-Source: AGHT+IGF454H9VjRobp+KMDijyGma0XwVoVBh0JzN4Wob/gUgYZuREoyBNxCM15hNZYowyXttLZUCQ==
X-Received: by 2002:a5d:5f8c:0:b0:3b8:f318:dc61 with SMTP id ffacd0b85a97d-3c495d47a4fmr63838f8f.40.1755720423546;
        Wed, 20 Aug 2025 13:07:03 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:9b1:f84b:89f6:b00e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c077789c92sm8810302f8f.52.2025.08.20.13.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 13:07:03 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/9] arm64: dts: renesas: Add support for LEDs/I2C/MMC on RZ/{T2H,RZ/N2H} SoCs and boards
Date: Wed, 20 Aug 2025 21:06:50 +0100
Message-ID: <20250820200659.2048755-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

Extend hardware support on Renesas RZ/T2H and RZ/N2H SoCs and evaluation
boards. Below are the features added for the RZ/T2H and RZ/N2H SoCs and
EVKs:
- Enable I2C0 and I2C1 support
- Enable EEPROM on I2C0
- Enable LEDs on RZ/T2H and RZ/N2H EVKs.
- Enable MMC on RZ/T2H and RZ/N2H EVKs.
- Enable MicroSD card slot on RZ/T2H and RZ/N2H EVKs.
- Enable SD card slot on RZ/T2H and RZ/N2H EVKs.

Note, patches apply on top of [0]
[0] https://web.git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git/log/?h=renesas-dts-for-v6.18

v1->v2:
- Dropped patches which are already applied from v1 in
  the renesas-dts-for-v6.18 branch
- Dropped RZN2H_PORT_PINMUX and RZN2H_GPIO macros
- Added Reviewed-by tag from Geert
- Changed led node names
- Added color/function/function-enumerator properties
- Replaced GPIO_ACTIVE_LOW with GPIO_ACTIVE_HIGH
- Moved header file inclusions to common dtsi
- Updated switch settings for led-9
- Replaced RZN2H_PORT_PINMUX with RZT2H_PORT_PINMUX
- Corrected switch settings for I2C1
- Added comment regarding DSW17 settings
- Dropped sd0-emmc-prefixes
- Added alias for mmc1
- Dropped sd1-prefixes
- Dropped sd0-sd-prefixes
- Dropped DATA4-7 from data-pins

v1: https://lore.kernel.org/all/20250812200344.3253781-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (9):
  arm64: dts: renesas: r9a09g087: Add pinctrl node
  arm64: dts: renesas: r9a09g077m44-rzt2h-evk: Add user LEDs
  arm64: dts: renesas: r9a09g087m44-rzn2h-evk: Add user LEDs
  arm64: dts: renesas: rzt2h-evk-common: Add pinctrl for SCI0 node
  arm64: dts: renesas: r9a09g087m44-rzt2h-evk: Enable I2C0 and I2C1
    support
  arm64: dts: renesas: rzt2h-evk-common: Enable EEPROM on I2C0
  arm64: dts: renesas: rzt2h/rzn2h: Enable eMMC
  arm64: dts: renesas: rzt2h/rzn2h: Enable MicroSD card slot
  arm64: dts: renesas: rzt2h/rzn2h: Enable SD card slot

 .../dts/renesas/r9a09g077m44-rzt2h-evk.dts    | 100 ++++++++-
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi    |  13 ++
 .../dts/renesas/r9a09g087m44-rzn2h-evk.dts    | 172 ++++++++++++++++
 .../dts/renesas/rzt2h-n2h-evk-common.dtsi     | 193 ++++++++++++++++++
 4 files changed, 476 insertions(+), 2 deletions(-)

-- 
2.51.0


