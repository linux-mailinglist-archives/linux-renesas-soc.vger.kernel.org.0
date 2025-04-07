Return-Path: <linux-renesas-soc+bounces-15439-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B0909A7DD07
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 14:03:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 603B3188B196
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 12:03:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 640ED23C8A2;
	Mon,  7 Apr 2025 12:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DKxZIEEQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F21022B8A8;
	Mon,  7 Apr 2025 12:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744027409; cv=none; b=OHtrkPADDSZfrmtVmjjXxY8+i4QD6VQ69++5hIudmAbCZPLIREkvk+QUL2iGwWr1UAdgpJkgWvTYOVwI2PCDv2Onvqx966NVQyAmGDZk7j372ZBw3yilCSZ+DK4DeaswIdRyENO2XSmYkhb3tzRceodXt2evxLHlHhkSJWuyHZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744027409; c=relaxed/simple;
	bh=y3l5UOrJXBH5DFj8+hoj1oQK7HDPJgF7tLei5R/IaJc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C9W9zV7UhKfvfVjsJlNPalDZbVpZfJC6RNdDL15G6F3pktbt7F7e/arNlS/A63mKl362j5XpNOR7ZjvYBx8gORxMFcZ0aLjch7AyTAGa4bUNA7yG1mSF7r3GQv+rELrPvsYqei6UylBnF+ttW3Oo8DmECDtUxavuH7SU5bfHT8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DKxZIEEQ; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3995ff6b066so2248944f8f.3;
        Mon, 07 Apr 2025 05:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744027406; x=1744632206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SXx2rv9zT35RkoqKlgbg0mm3kdEQQG79f5HFBb1nhgc=;
        b=DKxZIEEQaNAj7Y5733CoCIWVVzbA9/f7r3vOKqzYX03zyJEtfLYMaNnKthwEhERV04
         6OlM2NE3D5B/UKxzkTFa/tNi4Q2jP1WhOmbYyE3ag141LseINRe3PrLKvuYrL98kPf+3
         9WtOhNcRve7R3FZSx0XTK9us6kg9SkhPSZUuojvZ/uFsmyyTnzXVjLBEUL7/fBs7TEaJ
         KR7GHfFfxA9bwKjNxd23h55F+e+5rQAUjh55GaMvZJgzYWb+Il35z9k1WtCm3MNJ3ION
         xQp45Ng9v7+1JkpTvyLEh2szxhZFTaYXvvoGyfkbbEq1XuMhh/XmeA0YgShCoPKnOllz
         v6iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744027406; x=1744632206;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SXx2rv9zT35RkoqKlgbg0mm3kdEQQG79f5HFBb1nhgc=;
        b=IaJkTgeWIUOpisrVfIclQ7qo98Rx7BxdSqq1HNqux5kry/NYSFQWQ+5heE8nYApE9S
         CbX+EZooYemdVI7UkoNDdPtNB63wPJHyd07MxKRUr2CIx+H8nDxxCWuKFfLIDB7YP2V9
         VRHOEXVMsoky0iCmTXf7BaUj5PCF6LYO2MRmQycouuRgamx0LQk7cy8nBohCXHF585NG
         JJbNogFe+nZPXwqjsbv2hCq3q/21ZN5ebfWAEOglPS5M/z/7bVsgVTHJbnx5RAlOijQh
         qoBVLSFHUYRuWWJZBgWZCSqy9pYbgY4WO2VSXeTNb3RxyS/iNK+PCV4cYnjnDSfRJlBZ
         8nNg==
X-Forwarded-Encrypted: i=1; AJvYcCUQrMqcMz1PfL+hv+TK2JXLn8v5VYfo0OcKrcAmPC1Qb0bf8dpoZQ0VT7/NCHJwXmngv0+yxnUDx6jlK2Uq/7VRh4g=@vger.kernel.org, AJvYcCVSdVoVUHQkQ4eGkt9ceVS/M0ktf9wmnEjgG1YUHPcFTxRyrh0IV30qrIfHmnvOlhk1wxyLNIMkF3u1@vger.kernel.org, AJvYcCW+1ZiojHSLwTCYtZq689sQvMy+XQgUDhXMwcDxP2tfP4SzoqBAOUUVXdsfIM9a6SrQxOs4l9m6TBkeKCNZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwmOmcwqdECW9a5Ap159PHNLYuCovGbN1p6Wk9WIop4n/w4AHRv
	DzfF2X/J89R63RB7uI+wBlAX1I4+nSznEe4ug5A+dT5yCclR6XkU
X-Gm-Gg: ASbGncvFRtvvzxz+khryM1o24XCQzkjAm2fo9gq2MxD0ZXaNv4+dnGzbaxHPYF6S0MR
	yDtlDlA6i3neGy3Ek2tOCVO4Cesb9iHerxzbSG4t6pFUOfAl7A52LKW/S8IbZnpmU+GlCheAgZQ
	+B3SL52Tv2F/TJH/WSYKlIDu5/UTteKWc2odbTR5Tzcd0E0oNww1aHal9LzQUPZduXSZfNatHFh
	rbf0nmhCYeFcJcpw+HD764HO95s8A3yzfgSZ/s+pqJoKLv/AVK8WyTgMc/0DmsGKkD3D5t6Dikq
	EyL7MIMmDMpHVcIqiBnvBzIp0nQggta5CDXWCF/Y0uj7m43dvgui4wXmP6LReL62HY2zt1UjXFT
	1p1j8
X-Google-Smtp-Source: AGHT+IE37bdrVUeb/XqXM/+1lhsEdri9+eE8Oa4q2uNN8bo1IG+kwjQxWy1YJ26YTiId2TriZ2pQ3A==
X-Received: by 2002:a05:6000:248a:b0:397:3900:ef80 with SMTP id ffacd0b85a97d-39cb3597eb7mr10077348f8f.22.1744027405651;
        Mon, 07 Apr 2025 05:03:25 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:78b9:80c2:5373:1b49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d943sm11986976f8f.74.2025.04.07.05.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 05:03:25 -0700 (PDT)
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
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v5 0/3] Add GBETH glue layer driver for Renesas RZ/V2H(P) SoC
Date: Mon,  7 Apr 2025 13:03:14 +0100
Message-ID: <20250407120317.127056-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Lad Prabhakar (3):
  dt-bindings: net: dwmac: Increase 'maxItems' for 'interrupts' and
    'interrupt-names'
  dt-bindings: net: Document support for Renesas RZ/V2H(P) GBETH
  net: stmmac: Add DWMAC glue layer for Renesas GBETH

 .../bindings/net/renesas,r9a09g057-gbeth.yaml | 201 ++++++++++++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   |  25 ++-
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 +
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../stmicro/stmmac/dwmac-renesas-gbeth.c      | 165 ++++++++++++++
 5 files changed, 394 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/renesas,r9a09g057-gbeth.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c

-- 
2.49.0


