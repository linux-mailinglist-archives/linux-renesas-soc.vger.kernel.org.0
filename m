Return-Path: <linux-renesas-soc+bounces-22685-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CBDBBD575
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Oct 2025 10:29:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 18EC64E5148
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Oct 2025 08:29:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FA4D25D540;
	Mon,  6 Oct 2025 08:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Nou1ub7g"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6AE25D533
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Oct 2025 08:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759739349; cv=none; b=V5HBmjtM7Qn+yF09M4zmidnQd39/KqkAQyq/QLtCMtooTIXaKcpKpDzbNJIsUE/GMZRN1dPwEcw4rCyL48zWxtKklNJ5z8v+sdqqAF1LMbBkDwxlKZRMHijwuyEo/fsAOdiPoaAIYAKKOr0OVNTsubr5u2Wml/GQFdoaoUL+ugI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759739349; c=relaxed/simple;
	bh=hiqfOh+gup1VonmZM7I3cgEwhLU2LPQakfM4LAIU5JM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JAfaQE7UfTRAE+7aueSL//Thgg0DBafqIKkPwAgT+qHc/S1zk7oLTxF/x3EIXSoJcrqGzw9zoZcyFHCP2AB0SqWf/E75AR3zAHRhiRvgpRBVgIxpfAiwWwRCb94oLc/5Ks14bEGsqBBfsMitmvX1uH6GEIlInu4+qKFEy4+S38w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Nou1ub7g; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=IiRpNme2oR0Q39
	OFmKAZ9xvAi9y/YQyhdK79VfoxjdI=; b=Nou1ub7gpgQbvC7EyMzeEAaIi8U09D
	Sw84GLTmW1yXuSjhdXQXY8XO14zcm3gXSBu4Ad05hghxV0XiuDaOSjaJvRqr+1G/
	MhOrydUAs14Smkl0MRDu5G2ajNrNvGC6S65AmPmMCnJrKxFSMXyHrRfX0WpOc8tM
	jINQ8Q6yvsAwVuuS8nQsGvRrwWa+xa7t4Y1Gat4I91OiHyOd+oy5dU44LVL+MCHB
	DuCaF4c9VCbAVcHDTP/QcPlxo81xHIZ/UD43yQ4gU6Wp8lBEkqBzORC6/+FFD7AN
	mvd1lEf0ZdAWLnjE29DGD18Jy5nl+8OQeO9aS3/xRpMBC6MdBMmZmZ8Q==
Received: (qmail 1689719 invoked from network); 6 Oct 2025 10:29:02 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Oct 2025 10:29:02 +0200
X-UD-Smtp-Session: l3s3148p1@PVFePnlAXOwgAwDPXwQHAL/S9V79e5yL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH 0/9] arm64: dts: renesas: gen4: handle SWDT
Date: Mon,  6 Oct 2025 10:25:18 +0200
Message-ID: <20251006082520.10570-11-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Here is the SWDT handling series for R-Car Gen4: it adds the SWDT node to the
SoC DTSI and then marks it as "reserved" in the board DTs.

No bindings update is needed here. My previous comment about some Gen4
having no bit for reset was wrong. I found them in the docs meanwhile.
This only leaves V3H as an exception. I will add it on top of my WDT
binding doc refactoring series later.

A minor irregularity is that the RWDT was not enabled for V4H White-Hawk
yet. This is fixed here as well. Of course, this series passes
'dtbs_check'.

Thanks and happy hacking!


Wolfram Sang (9):
  arm64: dts: renesas: r8a779a0: add SWDT node
  arm64: dts: renesas: falcon: mark SWDT as reserved
  arm64: dts: renesas: r8a779f0: add SWDT node
  arm64: dts: renesas: s4: mark SWDT as reserved
  arm64: dts: renesas: r8a779g0: add SWDT node
  arm64: dts: renesas: white-hawk: Enable RWDT watchdog timer
  arm64: dts: renesas: v4h: mark SWDT as reserved
  arm64: dts: renesas: r8a779h0: add SWDT node
  arm64: dts: renesas: gray-hawk: mark SWDT as reserved

 arch/arm64/boot/dts/renesas/gray-hawk-single.dtsi      |  5 +++++
 arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi   |  5 +++++
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi              | 10 ++++++++++
 arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi   |  5 +++++
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi              | 10 ++++++++++
 arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts          |  5 +++++
 .../boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi      | 10 ++++++++++
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi              | 10 ++++++++++
 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts  |  5 +++++
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi              | 10 ++++++++++
 10 files changed, 75 insertions(+)

-- 
2.47.2


