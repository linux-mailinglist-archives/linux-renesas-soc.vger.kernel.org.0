Return-Path: <linux-renesas-soc+bounces-16282-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AE557A9A08F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Apr 2025 07:41:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0C05443DF2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Apr 2025 05:41:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AEB51BC07B;
	Thu, 24 Apr 2025 05:41:10 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF75B1A23B0;
	Thu, 24 Apr 2025 05:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745473270; cv=none; b=KxunJGLpsC8PJsE802aCR0BnRfPKfzvWayAnIwJGGLgjXBni8HJ1XxHzphZG+95i9SxxeudKwx7Uq6S67Og1k9cKi/cA9dF2ALy9B1kfoxrBxBMVE4NicUJVHTzW3FygVC2Rk4fe3NKhtJcJN4VgopXVXXhr0pVtFSzwfmcvVRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745473270; c=relaxed/simple;
	bh=cpKYayg5uqZtFuMCZzZDwYLkPm1zwE1tTamfyJDniZw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rtKgmOHGAH1jsG/YvuDkEr5lQ+fadPxkTvcndQwnfdqYridJvekku4mf+ebqtDEpHp9eECP0afQH5qHmGTOcWo0hMynrClw+tuBjdnlNOD/xblapTfDjVT7aTJZsC0J8bOPbhfyM5tJY/oBRS69gV3N0bitSv9aPwr2Flw51Zyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: 73OlmSTpQvOyUUIYTzd2Kw==
X-CSE-MsgGUID: 1dBtIHOKSuWIWYyJAQAT6Q==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 24 Apr 2025 14:40:59 +0900
Received: from localhost.localdomain (unknown [10.226.92.69])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 591ED415FEED;
	Thu, 24 Apr 2025 14:40:56 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 0/4] Enable GPT
Date: Thu, 24 Apr 2025 06:40:43 +0100
Message-ID: <20250424054050.28310-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the GPT on RZ/{G2L, V2L} SMARC EVK by adding support in SoC DTSI
and enabling it on board DTS.

Biju Das (4):
  arm64: dts: renesas: r9a07g044: Add GPT support
  arm64: dts: renesas: r9a07g054: Add GPT support
  arm64: dts: renesas: rzg2l-smarc: Enable GPT on carrier board
  arm64: defconfig: Enable Renesas RZ/G2L GPT config

 arch/arm64/boot/dts/renesas/r9a07g044.dtsi    | 115 ++++++++++++++++++
 .../boot/dts/renesas/r9a07g044l2-smarc.dts    |   7 ++
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi    | 115 ++++++++++++++++++
 .../boot/dts/renesas/r9a07g054l2-smarc.dts    |   7 ++
 .../dts/renesas/rzg2l-smarc-pinfunction.dtsi  |   5 +
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi  |   8 ++
 arch/arm64/configs/defconfig                  |   1 +
 7 files changed, 258 insertions(+)

-- 
2.43.0


