Return-Path: <linux-renesas-soc+bounces-23184-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7E1BE5612
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Oct 2025 22:25:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBB1A1AA0862
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Oct 2025 20:26:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B48632DCF51;
	Thu, 16 Oct 2025 20:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z/qiCvfE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD6828CF49
	for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Oct 2025 20:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760646345; cv=none; b=sPNz9W7/afUz5lon6sJeO9D6XUmkyJdBlORYCGYj/xRgAAfBSphIC5R9Nznb9WfhGJttRNQOZ5nS08n1FVmtsnSzyw+qRF6ccNm1UMfYe1Aqo3evFbOi4JU9AbDyBkiDlfZQF6KYPTsN0zKuCpQu43TgSDiy5oSJpT8sGkdt0aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760646345; c=relaxed/simple;
	bh=xzMCfBofaf4XHkgbk8F4fMxam7uappNgmG0GSVXRwoY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kGjswnVUfbChlv5bo4LD7mySBDK9AxwHtXWkB8nMiPTfuL0vyKf9N97iEp4Jf9ybIbCYPvT6RkEoUUWZMnkCqI2V47Mh04cvB0CeARkZ1MneKiiSdDXqXxdMrhdSbAPgO6p2r9avhEKs9LtafY+dRlflP9VTTIxg+0VU8mB3938=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z/qiCvfE; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-26a0a694ea8so9257675ad.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Oct 2025 13:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760646343; x=1761251143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5sM2OUSBW/7DJRiuJ3co/xCNYS5XBVYrFpTjYZpSMgI=;
        b=Z/qiCvfESzFYw2aUKPefxj7bcpBv14QsgXpKcLUPIQ+zM6H3eq8UXMPqBVQGUZpIho
         4UZL8+ecSkwlALhAaH3It57NCB46Na0V3ZgPzHV3aluhDKrO9Ud4EntXZr8vbZTYUwva
         Ar+Jgj13OKLaag7hRXyHyNsxgOrmSOg1S20JOZ6NgTmJ6jqN70O6UFitb6rCf4rhdLE0
         ygMP8muMfMS7qKQrEb1owCGGrn9QFBpLC1oYLXjUKfHP8ZpltvtL9xBpnswTQ/HSL5zN
         Ww+Eo1pUzmQy6tltZzYiGmjgJZoMmW8l1moCPUdxJFBpkUJ1ZnDEGOoKJctt5CrP9NHS
         Bv9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760646343; x=1761251143;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5sM2OUSBW/7DJRiuJ3co/xCNYS5XBVYrFpTjYZpSMgI=;
        b=aQ6b/EVY+sSI7ObIJHsHm9Zz7GqERhgFsJU0vSAAWJ1pc1VpKPnwFKBwKZGjO5tO0S
         +huFka7T3Fco8d6t8SFOc6rCdggNNJ2T+hdX43F2xY2pHAga+NBt27ypaCnJcI1U00TI
         r/vN+MhGRemQc56ALwlFEAGM7nZusbdgXxJ8a6LEucQyC9qDhPnnK51xN7VOhxHFJiTb
         i6grIaY7FMlJElOsXnUeiL2fk4I3sPQqjCYyRXG6Dau9h35iuYW+kLwdxu1SZlLJ28IM
         o2p+/veMbwwShQRyqIRlGvBWqzo7woT1PQoNass+B5HOPVJpQbaJkiX7i36Oeo6C3elM
         Q11Q==
X-Gm-Message-State: AOJu0YwPF+tzSYM8SdxWtVV0K65OFDyl80TIXN9yy6ZdWvB81Vn+bLIK
	zU4SI/jLkI5RX8Srp4cvGkp7de2aGqP45mkafFaCWTUo7XgjklJ/K2UD
X-Gm-Gg: ASbGncvtxQ9qVRbi1wm95qM87IatrsM7/7YdczYGEHdIe3fJUJRmIpo3Ej3vshu0Vnw
	aWvNxnhTD6lurX6fl6rOk/JSRgTQU1TmovHqHEfsu/aLCmmZXSFZwthE0eHSgTR3prF0CTP35nw
	SJOYda9kQb7ijt+vTIRC1VbPUSib3XUm+DNVKGZoEcLze1/GWo8xrO53sKxUc6PYlxRCU8WYH3a
	uikxjfC5sTqnrnvYXvgZdM9BWXV8xdSm5PG02GcXNWgs3HfFPXFH9yHnxQ6RYWcSu3f9KfkdrVD
	avW7B2ZhXLkfsSogEDN1K6yy+/8hQpL/RgUWQo2zNhzv5cyDHdR6run0L6itCcKddCgUoHpFZN3
	GaxFmtb4DdUrX8hpZnv7j+5wwvm86FEjj0FLuvOIy4A6G4ovbWsKc57+3tktshf//rCDfSa2QPP
	+a0Ic+hJvoLIBMvVc+Ex9ThQ==
X-Google-Smtp-Source: AGHT+IGs54Upiel/Ao5NcK/hfJnpT2pOUEtODPp/RACbAL82uRfTJvEpomnmEP81ZtMTAH9e6PZGeg==
X-Received: by 2002:a17:902:fc44:b0:26d:58d6:3fb2 with SMTP id d9443c01a7336-290c9c89697mr14011435ad.12.1760646343364;
        Thu, 16 Oct 2025 13:25:43 -0700 (PDT)
Received: from iku.. ([2401:4900:1c07:c7d3:a396:54ac:a48f:c314])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099af9131sm39577735ad.103.2025.10.16.13.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 13:25:42 -0700 (PDT)
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
Subject: [PATCH 0/5] Enable Ethernet support for RZ/T2H and RZ/N2H SoCs
Date: Thu, 16 Oct 2025 21:21:24 +0100
Message-ID: <20251016202129.157614-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,
This series of patches adds support for Ethernet on the RZ/T2H (R9A09G077)
and RZ/N2H (R9A09G087) SoCs. It includes the addition of the MII Converter
(ETHSS) node, GMAC nodes, and enables Ethernet support in the
RZ/T2H-N2H-EVK board DTS.

Cheers,
Prabhakar

Lad Prabhakar (5):
  arm64: dts: renesas: r9a09g077: Add ETHSS node
  arm64: dts: renesas: r9a09g087: Add ETHSS node
  arm64: dts: renesas: r9a09g077: Add GMAC nodes
  arm64: dts: renesas: r9a09g087: Add GMAC nodes
  arm64: dts: renesas: rzt2h-n2h-evk: Enable Ethernet support

 arch/arm64/boot/dts/renesas/r9a09g077.dtsi    | 482 +++++++++++++++++
 .../dts/renesas/r9a09g077m44-rzt2h-evk.dts    |  70 +++
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi    | 485 ++++++++++++++++++
 .../dts/renesas/r9a09g087m44-rzn2h-evk.dts    |  79 +++
 .../dts/renesas/rzt2h-n2h-evk-common.dtsi     |  94 ++++
 5 files changed, 1210 insertions(+)

-- 
2.43.0


