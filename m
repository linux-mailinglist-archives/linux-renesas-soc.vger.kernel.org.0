Return-Path: <linux-renesas-soc+bounces-16103-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9718AA916A8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Apr 2025 10:42:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 122FA19E1157
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Apr 2025 08:42:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E36A222590;
	Thu, 17 Apr 2025 08:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RPqKSJcY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B901F3FE3;
	Thu, 17 Apr 2025 08:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744879320; cv=none; b=Xuz41RTcVbSoP9f4R4pFHnSdgyoV3rcB1iyxUaUEpYO8rW+gmqbwA6wJlm7+oOJUxZS/uc4HbQfxOdldH4B6iyTFjmxBqJgV5yPWowfzTHDoiB4QV4/XyyLHqkmBUOJgeiVK6MQJcjztASsLyaFmcLz35kfRsD170pX9dCHtjWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744879320; c=relaxed/simple;
	bh=uVwo6amo6zkXhHED8eHbbbX+u93QJ1BEDv8D4fVRyRM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LtEPL4ZCVUhHMOW1o0G+w6/EiMxfuXmVHnfqMYonsBzwM/yqesvDIWxfdketQuufD7P6vPbvK//lqv6ynG09NV/4Imx4Kqk4gGbzeqvPkYoC2rciJN5JKnSqT3ikdHdz+X1ASE12XnIbAQxAzFUHcyJ2oL/ONtfy/R4Jay8DnLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RPqKSJcY; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso3059115e9.3;
        Thu, 17 Apr 2025 01:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744879317; x=1745484117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DXozyqUJ9d4xtCCzMWxO4QOFhe8g2i4PdCmKZX1X/X4=;
        b=RPqKSJcYsZVsnLkjzlXY5Yykk3yKeARpCCxg2GyYVSpWnXHrjJkQIs6nq75PV92ith
         Pul7atLhZIRwFgX2ieMiZpFeS7GgcWerrLbjhB9fEM61/a5oGh7Y5v9QqjmKnXPvyD9i
         aavivEFni7RfgmjK15XZD/lBSfACquQqHLR0alw8m0PqJeHevbSE8g9WA5VF9sm+Qwht
         ttLood1OxM/Wp1aTkuEcLujQLYtpGDeF4uGpAd7QERo3U8wuAW6B5HKefnQJc9q8McrS
         1bztAdNuVFdvn0xSECpMhv9I3u5/IUnv+pjUCVoGxc3YCTYZH4X2ZOg9Dbo0T0AiOzKV
         YlVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744879317; x=1745484117;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DXozyqUJ9d4xtCCzMWxO4QOFhe8g2i4PdCmKZX1X/X4=;
        b=ZFI5Z6TeInSz4mFcN2KK9KMsru+PC7CQsf/uzBTHjypzFFrH8kIvrvTPYnol3Ll0Tb
         OUmYH2ws+UjEM+kkibxvcnh7RNxWAgDfTCPdg9nCmXd8jdu8iGVp8WzuRwSPhkzOFUi1
         9Q5tqfJTvtskYtj1mjwSMtXd0kGxQu9rySc8xo1YIrecsuB/2/+2JntiDYx2WbBZL0P1
         zeEWUkglLi7SZ+/oBJvih3ggyQZ47W8Pw20k8uwsrhXf6tk1IyvfqsmcI7ZIG8MTsmJ0
         W9qjnIJqsOe+wJGDnqdxBrjyseN/DFUhWnkKDW6ga2Wcn2Uc80/JH5AyndXNTOpjZu5Q
         OwAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKw1IVYf4wTbImbtiL273lYc6wGY95mHqR2gylwcwqHBRV2f2pQG6vLugRQyWHn0L8T6Y8d4JstTP8@vger.kernel.org, AJvYcCX7rYoUArJAlB9enrs4Xmpy1qAos/J+lO1BTSFdycv02wc9nIVBTMHl8U2BWRo6IAALU8OMDmzcS9J5DDZN@vger.kernel.org, AJvYcCXHh0BNbJz5NKwqwvGHKVhHNmDE9iiW9AgHJRMaXa0iO39Wcvx0S3bYBdIF6K/ltK5adn6Xc8graCXPkUv21bLsoxA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTGt5EdvaM5CFxLmiYgUgovM7ZFHmkwE3z2115uul3mKgFPAww
	ixLdtWczI3Hw8VD2/excq6LmZPQc8UOJf7saAbFfVw9r9Nq3rqUe
X-Gm-Gg: ASbGncvzokRPOUNeXrhsc7XtUxhg3LA9yGRvasrxSaOTtQAWFQRn8gabK7tK+teKRZI
	LJpcxSuDvSzUr3lmzxdkOs/4omfYBqE0VONV9PdkXQupoKB0ASn/xPW4geA3UqEyOSTWuAoRAJa
	RdsRaueNItiW3YitkRxXKrPPBvAlY6OSs9YX3ard8zbfjYAnpsQRKdajePc/Vnv2aOkJA1oZosN
	3hxO8z8vkwXhIZv+otKrlYy8kGdPZfoHJz/uSKC/mgKNpLVqKDBEzir4RAucXjiZSw/9dEwhCp1
	N4uyXeDmCSObkbXigmrH7nwi1ZEtZ6F70ZGfcObvhTgH6I0hPs6ulhwT32BWRM1w
X-Google-Smtp-Source: AGHT+IErRiAS0z3JNyUleWBdVl92EfrzdQ3pXN9rJF3OKf8o4ZU/wUUqjoSjXJtkv9PYKHE0yGdVDw==
X-Received: by 2002:a05:600c:b8c:b0:43d:94:2d1e with SMTP id 5b1f17b1804b1-4405d61c914mr54409795e9.13.1744879316325;
        Thu, 17 Apr 2025 01:41:56 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:3f0f:d684:f4a:34e6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96cf1asm19657712f8f.39.2025.04.17.01.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 01:41:55 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v8 0/4] Add GBETH glue layer driver for Renesas RZ/V2H(P) SoC
Date: Thu, 17 Apr 2025 09:40:11 +0100
Message-ID: <20250417084015.74154-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

This patch series adds support for the GBETH (Gigabit Ethernet) glue layer
driver for the Renesas RZ/V2H(P) SoC. The GBETH IP is integrated with
the Synopsys DesignWare MAC (version 5.20). The changes include updating
the device tree bindings, documenting the GBETH bindings, and adding the
DWMAC glue layer for the Renesas GBETH.

v7->v8
- Rebased the changes on net-next
- Fixed return value in renesas_gbeth_init()

v6->v7
- Rebased the changes on net-next
- Added Reviewed-by tag from Russell
- Folded contenets of renesas_gbeth_clks_config()
  in renesas_gbeth_init/exit() as suggested by Philipp
- Dropped regs member from struct renesas_gbeth

v5->v6
- stmmac_pltfr_find_clk() is now used to find the clocks
- devm_stmmac_pltfr_probe() is now used to probe the platform device
  and dropped remove callback
- Switched to using init/exit callback to configure the clock
  instead of using the clks_config callback
- Dropped pm callback
- Fixed checkpatch warnings
- Added a new patch to update the MAINTAINERS file

v4->v5
- Rebased the changes on net-next

v3->v4
- Fixed maxItems for interrupt-names property
- Maintained reverse christmas tree order in renesas_gbeth_clks_config
- Returned err in case of success in renesas_gbeth_probe()

v2->v3
- Fixed review comments from Rob and Russell

v1->v2
- Updated commit description for patch 2/3
- Updated tx/rx queue completion interrupt names
- Added clks_config callback

v1:
https://lore.kernel.org/all/20250302181808.728734-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (4):
  dt-bindings: net: dwmac: Increase 'maxItems' for 'interrupts' and
    'interrupt-names'
  dt-bindings: net: Document support for Renesas RZ/V2H(P) GBETH
  net: stmmac: Add DWMAC glue layer for Renesas GBETH
  MAINTAINERS: Add entry for Renesas RZ/V2H(P) DWMAC GBETH glue layer
    driver

 .../bindings/net/renesas,r9a09g057-gbeth.yaml | 201 ++++++++++++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   |  25 ++-
 MAINTAINERS                                   |   8 +
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 +
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../stmicro/stmmac/dwmac-renesas-gbeth.c      | 146 +++++++++++++
 6 files changed, 383 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/renesas,r9a09g057-gbeth.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c

-- 
2.49.0


