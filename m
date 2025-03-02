Return-Path: <linux-renesas-soc+bounces-13862-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4941A4B3F3
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  2 Mar 2025 19:18:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B8D1316A5EF
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  2 Mar 2025 18:18:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 560B01E9B35;
	Sun,  2 Mar 2025 18:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hCaCzuPR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B31EAD39;
	Sun,  2 Mar 2025 18:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740939506; cv=none; b=cwvdut5pTp3xyIZ1CYcKqCO0DEXOu3zI/g1IDayldZYBJ4waTA+0T+BUa8pztYJ7g4zS9D6MXO8dfLusBPO4XtqRuZ4xsX4fVx3kb5YBqWi6KlI/GXevUg2anf10OEZJ2SLaH9yowMNhqIga/jG66iXOP3Ow/XzS6ytu5g4EDug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740939506; c=relaxed/simple;
	bh=da9Pi1D+SxCpTFyzRoBI0anziD4w2jaF7g3v8tBJb9c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FYCTU7lpiSC11mbZuLu2caaVA0de5QWWf7JAPGQS/E7esV7h1VIBB0YVoZP0/QzplvW6UEz4C6NYtzTGWk6AzHJQ6TjCZ3AB1nWHgQOxTenOWcb2UslDtx47J9hRUllWMPxC+8mqKJhOpFLAANKn0pF0ixMf25+g1UhkMNO8oY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hCaCzuPR; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43995b907cfso23222185e9.3;
        Sun, 02 Mar 2025 10:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740939503; x=1741544303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pWmZUAk3umBIzjV/bP0BmDq57J3C/hfv6T8fvl3vN48=;
        b=hCaCzuPRSD8Nq9910JuGLXwmoC+Nd5Mv99NPu/sNox6oiSksyaWcx1P4X13DYYB6ZV
         8fdHjyKcmiD0qAHrgvxk+VRFGQZflSFumajJAgfAuibR/dYMwFIwiT9nS/AXXRWDXPVJ
         SRK1zXY6HToSS9x5awKgrF6Hvz3+cLcG5Ed/n5EAejDDZgHbUJfd38odQxFgx1hlR8Et
         LN8J1Tgic3GTsWBZTD9UlJ6pbrSLabkbLxfQxdNHaFuBdVASK/23n6fZn9kx8fVb++E2
         kqZ7NB22uJ3xI502SLwROgiW5Nn3aSY2dhb6bZVsgrgosz9cdis1pBxnMq3cFf+kXMwg
         AiqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740939503; x=1741544303;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pWmZUAk3umBIzjV/bP0BmDq57J3C/hfv6T8fvl3vN48=;
        b=hfSkLvmt8vzH2TwzaooteIF6L0AqcHdJSAhJlN+wMD8fUlTzmcPc24SidOoSaTmkwn
         3eeLyv2hgNJu4tfnItsxn1FGiH/1l4povyQ9HAMFoZFwl73s2vWE3hBzgAyR//KFbHH1
         84KCKODAZIf5TQeYjPH4whRCk9oE7XremGUQN2HRJogQqzEwCCv/U/JUHGfyJyY4p58M
         9x5UiVRSkVY4kzu6ckjOk3AVtsv//gdsSmPVCchQPLE9Ho30ICWXqbt0OtnRrrZmIRjc
         tvxaHlZnrMRnWwhqcRCaELcX95C6LjD3ofEMweqhZ1VzFN+0bLi6cQx8R4otPn+y2l0r
         dYAg==
X-Forwarded-Encrypted: i=1; AJvYcCU5UqULcDv1o0vPbKe+58b34cI5EUzkrn6jAAr/zL1GhpmA0Q9WNxO35FbOdUcs6kS+9d5Ei/ChnKeJpv3u@vger.kernel.org, AJvYcCUBXbdo3kOGsd8gxAdUZQUlismeByrsD3wD36BiUqsh/Hm5CfM6wKx1OHlIkZYo4xLyZ5DI7DXdWPbZ+B9pUWTf7Zs=@vger.kernel.org, AJvYcCXuzyq3pTvY74VvWC2n/2KMdGAAMeIT/dE83SuL15ljDNxcKUcAw9qZjG18LBi3/4FMEGItbyUy6UrC@vger.kernel.org
X-Gm-Message-State: AOJu0YxXIVyWSbVLeZWSMI6BIqv/V1ua+9PCCpKJn9Dx5f+vCxYpwtof
	soC0vuxROPC1bL5xfvm+VwQf0N7wVxp5f6LW3C9eClWIJdOvlfSA
X-Gm-Gg: ASbGncvK0H0N2X4vm9e9gqm2uHhHzsWWIL9eW3v/fuKB23scNvGTmDs9zJhGdPMWHlg
	uJG0Wlo518wdoDShGOXQLdOwTDtyw5ufiMfTzf72QsEBzR+RgK2KfsFaHklQTe5nqR4PnMUgL8+
	3UJnDf4YGsMe9xanC4nSCq+az5XOFTKJMYG2tOkOrU2dq6wmT6lDKVr0vm72lASLulbRYTgyHGa
	1+M/3k+Ho0zXTWex4NJsKdZeOJCHDO3diGGhe1xkaauYnKCdUpTqxtzerpk5hKxtiOPCMDx1ewr
	P4WI5HZLV2P6E27legpE5AXkP6GaMfFslwgXb+0Em3+lLvV6VTx50A7WNu0RTuCf/UnLLrw/jg=
	=
X-Google-Smtp-Source: AGHT+IFxa0eGfi7jDjqlZWvKJxR8cMzmbVfSLVbquzveU03p+XvzNIJlWU+PIp421mDqaR6GooEPaQ==
X-Received: by 2002:a05:600c:1d20:b0:439:84ba:5773 with SMTP id 5b1f17b1804b1-43baec9c2c1mr52413685e9.31.1740939502500;
        Sun, 02 Mar 2025 10:18:22 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:989f:3a70:8430:2268])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bc1b5db02sm9552655e9.19.2025.03.02.10.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Mar 2025 10:18:21 -0800 (PST)
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
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/3] Add GBETH glue layer driver for Renesas RZ/V2H(P) SoC
Date: Sun,  2 Mar 2025 18:18:05 +0000
Message-ID: <20250302181808.728734-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series adds support for the GBETH (Gigabit Ethernet) interface
on the Renesas RZ/V2H(P) SoC. The changes include updating the device tree
bindings, documenting the GBETH bindings, and adding the DWMAC glue layer
for the Renesas GBETH.
 
Cheers,
Prabhakar

Lad Prabhakar (3):
  dt-bindings: net: dwmac: Increase 'maxItems' for 'interrupts' and
    'interrupt-names'
  dt-bindings: net: Document GBETH bindings for Renesas RZ/V2H(P) SoC
  net: stmmac: Add DWMAC glue layer for Renesas GBETH

 .../bindings/net/renesas,r9a09g057-gbeth.yaml | 212 ++++++++++++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   |   7 +-
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 +
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../stmicro/stmmac/dwmac-renesas-gbeth.c      | 118 ++++++++++
 5 files changed, 347 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/renesas,r9a09g057-gbeth.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c

-- 
2.43.0


