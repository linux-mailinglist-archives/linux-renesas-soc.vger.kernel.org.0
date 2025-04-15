Return-Path: <linux-renesas-soc+bounces-16001-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C2AA89EB6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 14:56:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5AC7B3A62C7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 12:56:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62D9C296D3D;
	Tue, 15 Apr 2025 12:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hBhZ6Anm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999E6296D25;
	Tue, 15 Apr 2025 12:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744721811; cv=none; b=upfUG+M66VKs4BlFoMVl0Krc0mqWzUa8Z8qC9jKuoKbbILGnDOqmN5V47vO3waKP84p2024ucC4296tWquRfxBcvqJoe7s0SPZ69URDQcRD2lyb9IKeop18VI7auDfNSSokWjwftr5matYfruPM8tS/659leXQAkKyFxHErN47U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744721811; c=relaxed/simple;
	bh=OqgdnCTsrxAlu0VAvno9hDb09KI8HtAWrwOO4S0mKgA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eeIV2kBOKpj/6GbQAEUrcu1CBDPuzAsE39fwgDDFcHEiHwWYUKGuPvYzHhYp6t0Qm26ex3PEjTj9PuMezPgcFpJle1iyks2c6Gdi0Ae0vr6D3KUWGvYJu9MMwubNrxFDtmLK1UdfGoRKf5VD64EvNl7+C8YzSftnyTMBjMvKy3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hBhZ6Anm; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43ede096d73so39067985e9.2;
        Tue, 15 Apr 2025 05:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744721808; x=1745326608; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W5pt4Gvn4yUb3QxIoLfuNe/1WdZ6d8gxyQp1HcF2MJg=;
        b=hBhZ6AnmC/8fbavsED6K5e+8nBNbsRVXy9nnnO/bqYDBceanyOJyQBsr+7eJM4K5gP
         j8G2mo2w1noSiioOUgy/lRSuMQ/188vKjzdTKVkk1W38qCgwWDwXB0bsATrzqyIPbTEV
         gHOLrqOYSMji/qYkAllJI7qWdzcM6Q3lXwADVdE/doqO/I7ZupkoLctySegZFpGGTKya
         3wPGD5/gGjygreOQnQbpBXlq28zYZCTwhs4L8vEDDMy65zMSHh73BjpQETSnLP8qMM8E
         zqhz8Hgqbhmi29pR2uwePxtuFofj9i06nzZQeYjQR0PI6v2gddjICOhbLXpLtowlo1Ws
         cWIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744721808; x=1745326608;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W5pt4Gvn4yUb3QxIoLfuNe/1WdZ6d8gxyQp1HcF2MJg=;
        b=mb2qb9CoDEPzkLqenMrKZWn0nVs0NyHOFNnca+FIvsjjrAW0JWCNJojgL2LhK8UAwX
         4v4HNUkUyy/wt62GtWWLXTCPZzPYccQ6sJ42m016oBofqkE1oBrrpmRw/wvt4GwtRvIS
         nI6qRC3ScqALVYYj1T4xa6aP2cjsWGWhBOIckEsnA98aiZgl379FHjyYRYjwlT282Az+
         3ntG3B5aFgp3AXL1frtcAilaDw+fjGt4VAJpML34aG8DLXTesPiv5eaCBCQX7N18KRtT
         oBQwi8qKg3HFVXsLQ1+3VB6PjUXuFQDvkeuFqeV95hgGJYF4dxKJsTiPs2DIK7z8P4mb
         ffRw==
X-Forwarded-Encrypted: i=1; AJvYcCUOPy3EY/0xP+ycryG8zihDeKz8mK8ArxiZH1iLLN+Q6tK05wXT0AR8cfQfTdrU9ZWlW3qJQCPfHxPL@vger.kernel.org, AJvYcCV690vTkP5Pq12nFN91LbpD+byG+vJh0kVppSh1O3phwyy3JrG7IfkybcdPlANnZKDQ2o5qrFET/Pxd1ZgW@vger.kernel.org, AJvYcCVM2p87DqO59yroZAnUU7C9reUHh7XiMrOVL9b2mGAsavQ9HPE5uNpsyaJVYD4GSSUYzCWaWD3jMJI24Ye4oVbsqec=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHJvWDcu5vr7DAXZI/YYg0OYWfIOA3POMgrWsXpIvGxU97XPpY
	J91l3w6Udq20LoqyYy/UPEfFVuMYrVx+BYkHc/+Os3pi3J1zbZou
X-Gm-Gg: ASbGncuWaiVrT3GoDnCK412MYJV7V/6jE0/qUY8J2ddtUwWlu1UaGFSziRYftOCLnkK
	Z8G8A193WgFIxRzJyjnnxhh4t1WcTV0ywuMZR+i2R3fMREgBHENfRI8SZYHaBrc5FZLpAcZt763
	0fbNortknIeyavS8/vdHFuHhdg/eouk/G09OuHEyVC4yOnyV80gdGIEkCYa0YMavZwWmoip+sq/
	uXEOlXf6rIH16CYXzUzL6wGTAuuVYyREbR3dB16CxOvEy5MHo0fogGizXXsIg1UMlRiSVzidy5k
	3oXnEU0hBT1h90aUCv2DATj67hyax4jybDU/yythjITF76LLqtbZhVUSAHsa2M3i
X-Google-Smtp-Source: AGHT+IELhuDdfbIl6mFeNSEZkwV/cSRz10AvfqDx/26kpRUF4jOcOhkse6JnsntGo5yjX9aDqfZTjg==
X-Received: by 2002:a05:600c:3501:b0:43c:fa3f:8e5d with SMTP id 5b1f17b1804b1-43f3a926d56mr162646245e9.2.1744721807628;
        Tue, 15 Apr 2025 05:56:47 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1883:aa4:a265:bc12])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96bf97sm13922334f8f.25.2025.04.15.05.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 05:56:47 -0700 (PDT)
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
Subject: [PATCH net-next v6 0/4] Add GBETH glue layer driver for Renesas RZ/V2H(P) SoC
Date: Tue, 15 Apr 2025 13:56:38 +0100
Message-ID: <20250415125642.241427-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
 .../stmicro/stmmac/dwmac-renesas-gbeth.c      | 148 +++++++++++++
 6 files changed, 385 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/renesas,r9a09g057-gbeth.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c

-- 
2.49.0


