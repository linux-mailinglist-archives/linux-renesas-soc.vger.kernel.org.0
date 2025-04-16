Return-Path: <linux-renesas-soc+bounces-16055-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 609FFA8B6ED
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Apr 2025 12:40:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5679A445621
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Apr 2025 10:40:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8AFD2397B4;
	Wed, 16 Apr 2025 10:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cQ48uEDa"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE03B235BFF;
	Wed, 16 Apr 2025 10:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744800026; cv=none; b=P+eJNVaJZ/c16dq9dAyR1Lq1Y5DKvYL2pLWNNA3DGfdZICjcsbQsdr5SJfl1yydpfovusHgSMhLSyytZqoj+bP4d0f2tc+C88Id6o3/+oGKmJp5GsMcMdj+Fou2iNEu8I0tzleENzNalTa0c6D0i1fictHzLtWupFPwZ9VeoYx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744800026; c=relaxed/simple;
	bh=fXeZ9vQLNT9oO0trkSA2nlDeHAA0eITiPzNU3LLWSHM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q5yXgZIX5AtbGTGVscAw55FrcBIOWURGoEU6xKEt1gtK0wYciSy2T26f3wzqyqJdkiHzgR3iDOABhIqkEjt+BBs0+2KetRsdoE/CBSp0Sq+6XYzcXjYBXRWcobZbYQAvXUy2NyEiqhvcfT3/SJHeifL0C6UUTdPbm8hFHiPk5js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cQ48uEDa; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39bf44be22fso4266855f8f.0;
        Wed, 16 Apr 2025 03:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744800023; x=1745404823; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mv5JrbOdws3HwC8g5+UOFGbdPAGiQtrVxdnxmWTTx/I=;
        b=cQ48uEDay4YcSkPl3QcHdA9jkpMc8HYY501yHntKuaWovoiTFzML4Y/zcSuKPxvfA8
         vieD0+13foj2EKMDXBELL3eBDxtpORo1ufOSo4IWSeDIyWeMIirmBp7tGVbQ1qXCIqKB
         mLDJ1PJSRQ+mGaCc6JEXGxKn5XCdT1SkP1JcpB1gjQli83mGWxNc/i12L8SFnfgXfGjU
         0uol4SahMUtPH5OuekDb2zSTyUv5q+s1WsIcdTpjDY+X6r1UAzFPQXwKyS8hg+Qaglmg
         j2lFbUmEQ0xAE4ATQxjjezdRKGJevllurAdikTvx/1b5UfAoUjBPpIisu+UnIsgBP3Du
         Yrkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744800023; x=1745404823;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mv5JrbOdws3HwC8g5+UOFGbdPAGiQtrVxdnxmWTTx/I=;
        b=pm62qJhjrK2jshu716Fs/A1xrOPfi7c88cjPhA4t+cAtD87rnJpF9UuVkJPqxOv8ke
         wtST/seXLgaviyQJ/5+hI1d1rebFyc5x5dFCL6Kw/b0PBqqZKPheEIBcK/JdYs4Mac6c
         jmbeiRGDAValIxu9Ui+qBlTMqjiGfgRVp5iTRY6M8bUbKUmRPWLfOnINWPpJbHX8YK7G
         krkzPlMlyNBFRq5YNfIaPYq1oKkLwNdA6kHjwdbxBlRNnu/Q7M0z1RvfKkocMuOlHIum
         R/EFU0pdyYfO+KP6Lp1yIuyAH4zbIqeSHRYyacKmluhdDG4BvdwqNihPdpeqKDEm3ZRC
         hMyA==
X-Forwarded-Encrypted: i=1; AJvYcCVLQnolJZK3dJYjEhixX2urvf/zm6i9UIl0R9bwlDL5zRlIGG12C6wk/g/1hMmgbfAwUUqxNpQQawlyiw57@vger.kernel.org, AJvYcCViB6rx5xcZumiJClTgL9rkw9CknUOu0QEVyCo1mNv2UcnGWN5spUXMTzl9+p3GjnGobbZ5p4ibqAuc@vger.kernel.org, AJvYcCWpt+iP+57BXJXTCmaYFe5V1qjqa+ws6BiG+arWizIKYlMRxZc4Ms9z67ngJtpgZVhDU6Y5FCfAL2jbXK8w0vT5Z2o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLhWB3zhECP8zObH3w6b4RW07rlneKrwjgCfAxstIOCJZABlKn
	koAL8CdUE9RbnIOnhdwkrQm7r6xoBtd98Z25DDelpFAJE0iaDBax
X-Gm-Gg: ASbGncsD+kf8ZegWSWoTg8oNL6axyuZM3Wa3X/LCjFVi0L/K77sSP9mwWGRzQbt2nNu
	WsO4JkRX5REym2+MzWQ1CPOkM47N46NAl5QmNgNGDMHNeA0wPW4OKbMmH5nFtXN8Kk28lLoK0z/
	7M8gCingQAgfHkzbz8dkPn83vbBGgqgTdteFwjvzbJhIF50Ze9d+VlbN/Ty+vfAa8qDPSnc71HP
	9usBGS1Upn7u3ThLp8c1Wn0ru42THlhOaZSc1weSuNJrEg1JW62Fvm7GQSH1H/PS9QPB4Fd85W1
	ux5hZWaQIzWIpCc32cWouxLsd9M16FfVB0/MpKx7z9/uOnJECtkZkbV49YqOFICoJw==
X-Google-Smtp-Source: AGHT+IEmC1A8qA+sRExHfTeMoNJfkOFZQJ7/LGNEZ1U+WdFIhRlxg60Mb+7It31CYcz1Dh5JA30pqw==
X-Received: by 2002:a05:6000:4312:b0:39a:c9ac:cd58 with SMTP id ffacd0b85a97d-39ee5b1d601mr1003925f8f.29.1744800022869;
        Wed, 16 Apr 2025 03:40:22 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:b4a2:e121:10d6:ac54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae964089sm16824975f8f.15.2025.04.16.03.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 03:40:22 -0700 (PDT)
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
Subject: [PATCH net-next v7 0/4] Add GBETH glue layer driver for Renesas RZ/V2H(P) SoC
Date: Wed, 16 Apr 2025 11:40:11 +0100
Message-ID: <20250416104015.47788-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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


