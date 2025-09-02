Return-Path: <linux-renesas-soc+bounces-21148-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 967D8B3F17C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 02:13:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F92B17FE03
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 00:13:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EE462BEFF8;
	Tue,  2 Sep 2025 00:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RqQR54Rj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BF22BEC5C;
	Tue,  2 Sep 2025 00:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756771989; cv=none; b=rGFLouJAPBkg73B8DZMpzkY7RIqQ6XLJkMx14ZTWFcS2rmeaelKInsBMjR6DlovFrWn48CwA6mMz0NnuPi+bRiA8gPuVcYvA06iSi0h4/0reHvSAtrBVfluwlI1+ayjBjF+SwHzH7ViDLRS6AKtzgLwGx4VsfgHDlbAMacI/g9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756771989; c=relaxed/simple;
	bh=YRndbIhGl3gdz0n/cTB2Ao4XyUrrIEeRH/EBdnuHHCw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AOBBmGyd8cUPpaKXsUljEbJdYqIKQIC0xmT082gzI4FnBTgK6wtoO8VVxg6rXRci/jFSfOOopuqAyhfrC/zgsNnvrYhsZsjNEqO362kV9yv2dxZNpIV8AdrnImRVIb7spPgduzWyBw+bFP+90uAk3tUL/uVG4MBBowGYwF2pVR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RqQR54Rj; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3ce772ce0dbso3200034f8f.0;
        Mon, 01 Sep 2025 17:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756771985; x=1757376785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q1mPp0F3Ah67cHyiE48MxxmEH4zAc3hcVRk+cgDLZL0=;
        b=RqQR54RjXPVqsBzEjlik/8OcA5pLeTneJ0UneHditHgRs0VonE+tQjHJrkfsPxyzfc
         4Piq6LekKa0GdnRFZefKbUjD/5RjY/jdvVnnzlJCLgek97oebE3HmN0/s8Kb2SgvYXMg
         7IWjSoV84pj2ihxfquHzqE4Pqe8SfkHRvr3D12/xTijSqK05RYzjdc387MsniWGHNJmg
         o2Jxd5PeQ2x9xcgNzs6Bt6vprMNYhSoNWsrV2tMgWD41CJdlBYsjJVFbnSGGWSmTny3I
         rmrPIjOiMmEaXmYXmErCnDYWOR3UkYfmMOjqPauiL1w1Mg8o0TgmxkenlXcJjYLrv0WF
         C4Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756771985; x=1757376785;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q1mPp0F3Ah67cHyiE48MxxmEH4zAc3hcVRk+cgDLZL0=;
        b=arD/iBbQTrWjvtyWdKfoq8QVBhRiprvP3NoJYHtN9BlVq1oA8d7kF78NJAnm1WTr13
         pTd3Z5GRejsbDDAfQAAl028nbR/46LIehB0Y+Qiz0atKWB11hNFSBLmybUmia22Vg/ts
         zE5SNQo8DvXjsZQ1WAt5idRpDDr2eZgC4S3UbN+Ti55Mvrk5T8fsuai2J2FofBvq3w3U
         2VGwIJSuqNZRzD9NbTrywa5hdokN2tMNw+38tfoeDY21lJjmXICaB8RAWkRo/FxFto6k
         BCNHl+kHRpsJYmosYLgX0L9a0EnPHsBmX0ZxcMQxMUn4heMLFADdV1CxcbpMFnzHg69E
         c19Q==
X-Forwarded-Encrypted: i=1; AJvYcCUJtm96ZP27eU8GmrCAIFf3hJEovtXZbYQAJ/nmzvZw7b6bAwjxEQEVGuudzhpqqTdtFok8AXQO@vger.kernel.org, AJvYcCVMfoL7djrONqWaY7bDlmA0MDfC3RG9qxrUxjhTzqcbOqU9BSF6X9Gx29UmZi6GystU7lpSjkHXx4G+oUSm@vger.kernel.org, AJvYcCWv8zXE6vbQ4nPuqum6oUa7blxpyM2wzV9oUw/RY7Q5HUfPYA29kZTtP0oedbk5yyK5D10gKLOEE8Zi@vger.kernel.org
X-Gm-Message-State: AOJu0Ywlhkr162eVSZ1LgXnPuPouEah98USO450fYwAzC25hKXi9mVKQ
	fUUQ8xDc1V5gZMfiTKEwET5Xy3q84XIipWyHAuFqg1s4EwztMwOuDtLC
X-Gm-Gg: ASbGncuCXv0mSNdqOu7kKWCUBPrupDgfhdnnIAbIoEvou8C6a8duaex0LrjgaRheYxP
	YippqgEr6nRbbx8JpK6CCSgCOrcsHR/qhwLC82cnTDD4G01poQTKKEKoevJQdgu4OevbwHxI23z
	AV57QXnMWOVBKLc/OKvk1G7r7ABu3ZvxUgm5zKgs1DVRuBZDN50ivyE24Ppozy0b/1pEj3ciDnE
	r2exHLTjG0ZtMpmhpHfSuns0iAJZHY6taGz5RllzDVetyQOyz9GKnd1hryRTH0/IY3rKru6hQLD
	/18jvSmzSuu1qvYT0NgFWDf/MgyAB2Fq/hUjIzXZmFJFV7zogZvobSb56XZ6kbOZG3vLY0j/HXc
	eqwHikWQ4L4hXCNgIeIrsBisv389KR2vwfqq+EBZhk28ltpvPYkAStKEi
X-Google-Smtp-Source: AGHT+IHlL6b2SMKKVhDDUJtZ+fYdvzkf8dl0zJkUIm+063lRCpw2Z5DZm3K8fgdPIHbsJgZXADiykg==
X-Received: by 2002:a05:6000:3106:b0:3d1:c805:812 with SMTP id ffacd0b85a97d-3d1d9ac1cbfmr6494920f8f.0.1756771985380;
        Mon, 01 Sep 2025 17:13:05 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:ca6c:86b2:c8f:84d6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d92d51982bsm2138153f8f.21.2025.09.01.17.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 17:13:04 -0700 (PDT)
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
	Russell King <linux@armlinux.org.uk>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next 0/4] Add GMAC support for Renesas RZ/{T2H, N2H} SoCs
Date: Tue,  2 Sep 2025 01:12:58 +0100
Message-ID: <20250902001302.3823418-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

This series adds support for the Ethernet MAC (GMAC) IP present on
the Renesas RZ/T2H and RZ/N2H SoCs.

While these SoCs use the same Synopsys DesignWare MAC IP (version 5.20) as
the existing RZ/V2H(P), the hardware is synthesized with different options
that require driver and binding updates:
- 8 RX/TX queue pairs instead of 4 (requiring 19 interrupts vs 11)
- Different clock requirements (3 clocks vs 7)
- Different reset handling (2 named resets vs 1 unnamed)
- Split header feature enabled
- GMAC connected through a MIIC PCS on RZ/T2H

The series first updates the generic dwmac binding to accommodate the higher
interrupt count, then extends the Renesas-specific binding with a new generic
compatible string "renesas,rzt2h-gbeth" for both SoCs since they share
identical GMAC IP.

The driver changes prepare for multi-SoC support by introducing OF match data
for per-SoC configuration, then add RZ/T2H support including PCS integration
through the existing RZN1 MIIC driver.

Note this patch series is dependent on the PCS driver [0].
[0] https://lore.kernel.org/all/20250901224327.3429099-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (4):
  dt-bindings: net: dwmac: Increase 'maxItems' for 'interrupts' and
    'interrupt-names'
  dt-bindings: net: renesas,rzv2h-gbeth: Document Renesas RZ/T2H and
    RZ/N2H SoCs
  net: stmmac: dwmac-renesas-gbeth: Use OF data for configuration
  net: stmmac: dwmac-renesas-gbeth: Add support for RZ/T2H SoC

 .../bindings/net/renesas,rzv2h-gbeth.yaml     | 177 ++++++++++++++----
 .../devicetree/bindings/net/snps,dwmac.yaml   |   9 +-
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |   1 +
 .../stmicro/stmmac/dwmac-renesas-gbeth.c      | 109 ++++++++++-
 4 files changed, 242 insertions(+), 54 deletions(-)

-- 
2.51.0


