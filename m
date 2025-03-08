Return-Path: <linux-renesas-soc+bounces-14169-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 661E3A57DF5
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  8 Mar 2025 21:09:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 626737A70FD
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  8 Mar 2025 20:08:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 217BB1EB5C6;
	Sat,  8 Mar 2025 20:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HDp/DdYN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B63ECF;
	Sat,  8 Mar 2025 20:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741464590; cv=none; b=tMbLK+SzciaZgHH9z7V1pHb3P0zONFMOFbTiapNhEZKBP/+wlli23uwPNNtvOGVwFBFRebgcIyPUuGpsMTueEVJmDfN83mUNoO2oGKD1ulk5DMl9xayEotBmG0ZL9Vso5i0NPuDBnqg8Jqehsd3uSQFjYPudddYpXQUlWZWLrOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741464590; c=relaxed/simple;
	bh=7DbSfqfG0OJrAlmTX/0lgkV5+HY7VTxbQGptLaJkJPo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nce519zc8sH0Pr0idzlMABM1bdKU1V26RGncOF/zY2HRsVB2FLdDabiz953t9SlB2l20nEFYcU8gzSHxslSd+QjnPGjfOTZ9mDcdyenihbozgbCsYcKFMpn23c9+qT4GAf8/xVSbR4IUSlxCKG1eIXoVkrnxbBARK/0ldJgYnTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HDp/DdYN; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac202264f9cso557248766b.0;
        Sat, 08 Mar 2025 12:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741464586; x=1742069386; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OTrUFD6ZSyRMB0wCSziCDfkXlxW30EZjxre+ifvNxBI=;
        b=HDp/DdYN3yU2rFzdjBnVUdpAW1xJQaxSeWucoMlDUaRPHLiDdyEnYVdFGT2OY4xQiS
         KPE2q0iiRmn9hKKKM3DiM78SqNme+sKf2w4sfd9tyZ91FdtWfQljhZ4xSKkAVpbeDCJb
         KzjkOytSe5xLiiOmpAA7+LBuOuCGUH93kutCkjvH9JZXA0hl8ht7kf86bfPAlcbZZ7it
         bcVAagD7XASIQve6hLtQXLJiTlz003WuF5USxJoNTp2uUfUHME1vVszoJ9K2eczRyIhp
         VGFVRadkLO0Uk40/hMI5dBUJlFgHv8JHLMmdqlkO0Mj0SRCn2hFERwj8ElsnZWoLZ5HD
         GMXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741464586; x=1742069386;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OTrUFD6ZSyRMB0wCSziCDfkXlxW30EZjxre+ifvNxBI=;
        b=jZkzPx7ucnr/BnZdno74WwgMuL1jbI9fdybOe1FJgIPEv6WXYvXfqj401c8QtrMnxZ
         kVyaP/yARZnJs3AcPTVzWbD092t9aaO0UDD2nXQZS29898/pEMPHaLtXF3N2Jg8PMRkb
         nTsEHHci5VlfRc0LWuUkRMIiwUGe1sZFWDvq/iz6sIza81V2XzcFhTVokG4JwJvVTq2S
         moxgIppSBhpTfzuzsqMXz+jIxeVBl4H+18OcfvOK2LlRz9EIzpCg4ozmxTcJftd8vold
         7duQrslefXI3nMMdEFfQ6UfV6z0eOrETPgezp6/fcaXarvYB+zB8dOPeY+OTNbsKc8VF
         lhOA==
X-Forwarded-Encrypted: i=1; AJvYcCVarHhHJxdnNZ4estljaBdakMpaEpxCVj/70WICw7/kJBY5Z821DL48dWQICiDWJ2m8j2X9riDmk9bPCA7u@vger.kernel.org, AJvYcCWSU+OOCPAiwv/tLjWCis1PrJyPa1EZ9rkGjV2eWUcnWpd9s46owu8EtRVuHMn2MfuE4h22Z6BFgafAieFXnzGDuWc=@vger.kernel.org, AJvYcCX+IgI1mS/gjzlnXeiFyOsThi6NNDkZZXOpjrsg7cRae7tZ9qO0w8t5PnSQ32OPTKw4vxLLnxeElIs2@vger.kernel.org
X-Gm-Message-State: AOJu0YxYEwwNpP0mOWd9HV+tsYoYUxGm/CT33w6abiErGB+5VL5rPWPr
	iMFgvO9UeIo/LX7D+NqRH/CG5HFA9GMIGS6awtEjlYutaeCCzyla
X-Gm-Gg: ASbGncvDSFik+jPE6W9TuUvAnNJlzlN2VicZBy3Hgckg1RqDI3+1+ugs+bx+rXC4Exg
	F+sGTDlEeU881mpGgtYJ8N7iuNY/+tMjvWonOuJfOKKuVT1qpU2XFwWtey9guwy3M7Gvxw3FYpL
	RzFjIAGeEi6ZOf6lVMV5TZUpclvZ7AHwb3UPP5b347DmnRPHtBXE5JV0xEM5YYHv2Wy/PtKDIJy
	jkfD1hmtDCrT24uokWt4+UAHfRRx41DC6eYUCAdTiDor9w5vn51Nx7mvgaJ+cFQ1Vk6zuqVLAVD
	Sjg1aglqKPgwG9nMWqdjb4Ub0VEGiqgAKYbzqJ1zMb7CsNj7KKnq048aTrNXzN3RDP0hMUTvQQ=
	=
X-Google-Smtp-Source: AGHT+IFmLPH2ghjiTWtO7YGrC+OE0mPpUY+wE7bzmV3kCuNx44mWlf1z04daaz8OzN93OZ1eR28nZg==
X-Received: by 2002:a17:907:970e:b0:ac1:e07b:63ca with SMTP id a640c23a62f3a-ac252a9d0b7mr756393066b.22.1741464586226;
        Sat, 08 Mar 2025 12:09:46 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:238d:d8a2:7f2b:419e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac254346ce8sm340766466b.177.2025.03.08.12.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 12:09:44 -0800 (PST)
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
Subject: [PATCH net-next v2 0/3] Add GBETH glue layer driver for Renesas RZ/V2H(P) SoC
Date: Sat,  8 Mar 2025 20:09:18 +0000
Message-ID: <20250308200921.1089980-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Got to the root cause of unbind/bind failures and fixed the clock driver,
test logs can be found here https://pastebin.com/nJpNkysf

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

 .../bindings/net/renesas,r9a09g057-gbeth.yaml | 213 ++++++++++++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   |   7 +-
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 +
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../stmicro/stmmac/dwmac-renesas-gbeth.c      | 165 ++++++++++++++
 5 files changed, 395 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/renesas,r9a09g057-gbeth.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c

-- 
2.43.0


