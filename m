Return-Path: <linux-renesas-soc+bounces-15903-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A71A87EC4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 13:16:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 336C118979AF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 11:15:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F5142D3A9B;
	Mon, 14 Apr 2025 11:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Jy7KsT7T"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215A02989AC
	for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Apr 2025 11:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744629165; cv=none; b=Bvt4EwGaGEUA54PQ4ptcauy0AILqi6uAtDrxtHmKVHor3ViKiG6Pk0od8UbCq3o3M1YssRWNCneqIpJ0zjy0yxBAjBv77aGUpQ5luv3x9ybU6b/3DF1R5WGG8vm6r/VgbegLNDy8aOHSg+8KjRByiUrYctOw2ChDH2HjlUu7cjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744629165; c=relaxed/simple;
	bh=dortTU+yJBLsP5gkHyoSI9rkyc/vP2fYW0eCLR+36mw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YrmCeJZ20blQqNGzVW6ehQHiyMxRRwc15zpZxr5DmgVbW42/oPyrwjdcL6lHIYNLFSRj+MZlWtO+uisc9B+k6xG4/eemQX+7ckkcHziqhhWYCa+WLhQakguSB7joCCPg36Xp5GzDqyXBVHlYZtfZNIzRhLe33ze52h8BxfVIYuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Jy7KsT7T; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=jeuyOoKfBW6dzL
	2II+vz4GMreRmAuX8fAw4x9taGFcI=; b=Jy7KsT7Try/illiyoGw/XEd8rICle5
	MJeSPSjFVOP/EEpACpDnq9Jyjdi1LrQSsi8hvC1wCtajCO6K2X51ZHImVc82zYbZ
	a0Jg6Qf2lrPRvg8b/f7qRxvcsvA9BE8jXGw24I8FKazrgGl07EkTCXBbzf7eW0mD
	zFWUlSY4ZeUCVqoUO0cA5X1NgURkfuMj0zgE9tPcy+Xek7NDTW8MQGKZJvFUwp4x
	FGtvWhkTP0qkKjc1d1AhWNc/VnjYLTsmg2wx9fWjUNMcsw/jXfRZJBRsrZ6MS1ZE
	cG9xIw7XO2HQMomujjMcsDW11nOg3lEGOMf59tFuJl9Y21xYF4osLu1g==
Received: (qmail 2268485 invoked from network); 14 Apr 2025 13:12:37 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Apr 2025 13:12:37 +0200
X-UD-Smtp-Session: l3s3148p1@hvA0IbsyaJoujnth
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>
Subject: [RFC PATCH 0/2] ARM: dts: renesas: r9a06g032: rework UARTs
Date: Mon, 14 Apr 2025 13:12:18 +0200
Message-ID: <20250414111218.7641-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The intention of this series is to enable the UART attached to the
9-pin-SubD connector on the extentsion board (patch 2). I got confused
while doing this, because currently the uarts are counted from 0 in the
SoC DTSI while they start from 1 in the documentation and the
schematics. Thus, patch 1 renames the labels accordingly. However, the
series is still RFC because I am calling for opinions if we maybe also
want to fix the pinmux defines like this one 'RZN1_FUNC_UART2? to the
official numbering?

Looking forward to comments...

Based on renesas-dts-for-v6.16 as of today + my GMAC1 patch sent a few
minutes ago.

Wolfram Sang (2):
  ARM: dts: renesas: r9a06g032: rename uart port labels
  ARM: dts: renesas: r9a06g032-rzn1d400-eb: describe 9-pin SubD-serial
    port

 .../boot/dts/renesas/r9a06g032-rzn1d400-db.dts   |  4 ++--
 .../boot/dts/renesas/r9a06g032-rzn1d400-eb.dts   | 15 +++++++++++++++
 arch/arm/boot/dts/renesas/r9a06g032.dtsi         | 16 ++++++++--------
 3 files changed, 25 insertions(+), 10 deletions(-)

-- 
2.47.2


