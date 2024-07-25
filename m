Return-Path: <linux-renesas-soc+bounces-7499-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C54A593BE1F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2024 10:46:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 474DFB22D4C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2024 08:46:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB02718FC6D;
	Thu, 25 Jul 2024 08:46:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03D8D18F2D8;
	Thu, 25 Jul 2024 08:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721897176; cv=none; b=dclKomOWL7yOcH0dD/n3PE2Iazft4d9YSyUxeAvfquU+0XvN2cD0lKvyYKUUuipGFdW1cMRI9BPAK5pCRUsv2Gjqhjclf8MoljSsiYXnXzIH+7IRzws8onw7tPd+2wKCVrlAT/ykcL4b3oUrA6qgfqUhO40LCBTfjquc0mdC99c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721897176; c=relaxed/simple;
	bh=wGAZU2yqDpZfKOrhqC1x/f70NPQammtgWeTD7KHeWYE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dG3yZHJ2RJwSsPJiriy643RzLqkg/LSe6komMaO2KkEBP/mnxB9XaVrt9k4L0nrrlru3KL609ovxFM9DAsBmLShgn+MrYC9HBLWa+ypl7ipVTsUibJLhIteBHE98XDBU7m3dq/6B+WauJ2CAY/eOCrMFT6GaYKazMVxtYlXM81Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.09,235,1716217200"; 
   d="scan'208";a="216694943"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 25 Jul 2024 17:46:07 +0900
Received: from localhost.localdomain (unknown [10.226.92.190])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 465474010092;
	Thu, 25 Jul 2024 17:46:03 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 0/3] Add HDMI Audio support
Date: Thu, 25 Jul 2024 09:45:53 +0100
Message-ID: <20240725084559.13127-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series aims to add HDMI audio support for RZ/{G2L,G2LC,V2L}
SMARC EVKs.

Biju Das (3):
  ASoC: dt-bindings: renesas,rz-ssi: Document port property
  arm64: dts: renesas: rzg2l-smarc: Enable HDMI audio
  arm64: dts: renesas: rzg2lc-smarc: Enable HDMI audio

 .../bindings/sound/renesas,rz-ssi.yaml        |  4 ++
 .../boot/dts/renesas/r9a07g044c2-smarc.dts    |  3 ++
 .../dts/renesas/rzg2l-smarc-pinfunction.dtsi  |  7 ++++
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi  | 30 +++++++++++++++
 arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi | 37 +++++++++++++++++++
 5 files changed, 81 insertions(+)

-- 
2.43.0


