Return-Path: <linux-renesas-soc+bounces-15700-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEB6A83A91
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Apr 2025 09:16:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F1F01B82B0B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Apr 2025 07:15:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B551207E17;
	Thu, 10 Apr 2025 07:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="U2VrtSWH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD48A207665
	for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Apr 2025 07:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744269277; cv=none; b=VBWVjKAD7lu9Th5sZUUkMrM/8bd0ro8zBuHDJSKSUnbUwBI1Lizk91e58oY4HjCNz/wiDw4kpGRzQJTo33Cy/mNO82t7oF28ZERBe4DPFK3uaDvj8YITJesyT9q5/6ZRXeRqMQw9RAhW6Z+LPyfcMlwmGNBPN6bDs/JGzqhVczc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744269277; c=relaxed/simple;
	bh=DI8+V7nELfkp39/M11BFR/XwXd8b32oSimd4PrQco1k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fGwxxi4zMJbjMp/z4QwFL5sEnOW9jQQ4JBavv5EOlkpyrKUd9NGmZspZ6gNTvHewRdyLf75BPhrgr1ipwFLSJwx7kY4lnjnlwlRgu1vCXdtyoqmGUyMFDx5rbBRDhyC5CMiqI4rcz6FL3p4UHK+fDBCnSXHgM8m2H9YXIOTIFV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=U2VrtSWH; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=yTj4Bzw4urWlip
	6cyxXGZ1ZCJzBrSVlc0X7g4KrUnJM=; b=U2VrtSWHCIPYr1jNbcQjKKnNON7eal
	54ljkaYuAZxGdjptPFHKCM2JhJIwVkHlis/ab+cCatH/nl+/tNSfnIH/7dSWhWu9
	t+tJyowO99yiCK1GuOcMKTsV2QSXuRHK3gBs8ePIG6/EmcU+v4bk+nhW4ivid1Hg
	x0OmRQaMMlksUgFGp0Cr69pgMCC/YxJkXBXyefOuq/oaO0tbeBIFChbM4G7Tpz6/
	FVIPaLCco6eiAEpNTdHYZycomcker0jIuaO5/ykLnEohzS+gYn0X0Qa+MZTdKU29
	Mu9FDwYUiYZ+fELwhZC7MdsUxUJxZ3h9TbFjybN/G/NB1VKOes33dDRA==
Received: (qmail 783770 invoked from network); 10 Apr 2025 09:14:24 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Apr 2025 09:14:24 +0200
X-UD-Smtp-Session: l3s3148p1@YZ3gVWcypq0gAwDPXyfYALbiJ46yNPq3
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH 0/2] ARM: dts: renesas: r9a06g032-rzn1d400-eb: enable SD card port
Date: Thu, 10 Apr 2025 09:14:07 +0200
Message-ID: <20250410071406.9669-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As the bindings for RZ/N1D SDHCI controller are now in -next, the DT
additions for the extension board can now be added, too. Again, to match
datasheets and schematics, the instances are numbered from '1', not from
'0'. The wakeup interrupt is only described, not used yet by the driver.
Parts are taken from the BSP. All double checked, rebased and updated by
me. dtbs_check is happy, build bots, too.

The series is based on my I2C enablement series [1]. A branch can be
found here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/n1d/enablement

[1] 20250328153134.2881-7-wsa+renesas@sang-engineering.com

Wolfram Sang (2):
  ARM: dts: renesas: r9a06g032: Describe SDHCI controllers
  ARM: dts: renesas: r9a06g032-rzn1d400-eb: describe SD card port

 .../dts/renesas/r9a06g032-rzn1d400-eb.dts     | 22 +++++++++++++++++
 arch/arm/boot/dts/renesas/r9a06g032.dtsi      | 24 +++++++++++++++++++
 2 files changed, 46 insertions(+)

-- 
2.47.2


