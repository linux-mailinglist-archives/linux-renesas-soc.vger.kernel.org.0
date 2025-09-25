Return-Path: <linux-renesas-soc+bounces-22353-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BB356B9E727
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Sep 2025 11:40:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B267916387A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Sep 2025 09:40:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C891C2D6639;
	Thu, 25 Sep 2025 09:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="SiBEcO/a"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6FBE2676DE
	for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Sep 2025 09:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758793221; cv=none; b=TIwV4AgMI6bexyaiZBrz2RfHi72R40tFi8yuMLPwwqP8Ek+XmToDyzat1TYm/6wvojvelSMQEFwpBvKnvvZaBQgWcHRl7yf19AMLiTNX+6sItT2E6Ob1jjKRzT15K98mq3gYg8dkFhEfNw2DrrQDn9deorPIz4hBk2ifvQ0yjn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758793221; c=relaxed/simple;
	bh=U7eVJSAru9kzRXDWqlhZazxz6FZ3m/U403wLAf0AZ5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kY+cB1SB+F7jhZmlC66QOXML17Q/ux1LGehLg3klIOCBLDEhACfT+Q4rnNPtffeIR+HKcMN9o8EagupaN46WM/uXcQJ3nssnNm+gmpoFGgsp7eak89gT0oOpq4QpeXDnDh+nWLIQx4+S1fb0Q5u+6OPVV9CLGLYqVucxALcVVaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=SiBEcO/a; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=ISNWxZJcxwjIcr
	rpSC3fp4GblzUztxvwW1PVhJ6DUZU=; b=SiBEcO/afxbWpov483/8m0dQOIE2vf
	PXp+poRW6/vLFBWeAl+sd3rCxZBVdIya6XmIFHx+Oads/cDMG4u1bHq1TYIS5LyY
	IYQ7V3sZx3VwQAgNpLNnvpG4qfsXfh5IOlcWxYvFrRZtHQiMerGoyF3uT6qM+SWE
	AcwkSCU+uBu8n5/amC+bZx6HxEB7LEVVvt7X4TM6GDwFbqrvhrarGiRX26MTZHhm
	vs1b2jeBfN2US2oqoaYnuNKCTzaOoiIUV4rWSk16u43azBaSIMdNnexBk0jP0JZA
	mjg4ieItv9NZqVz9Zkd9RZs3DbJxrjpqpUn+Cl8Azy5ITdBz/2YT+Ihg==
Received: (qmail 1813101 invoked from network); 25 Sep 2025 11:40:14 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Sep 2025 11:40:14 +0200
X-UD-Smtp-Session: l3s3148p1@K+209Jw/msQgAwDPXwQHAL/S9V79e5yL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH 00/12] arm64: dts: renesas: gen3: handle SWDT
Date: Thu, 25 Sep 2025 11:39:39 +0200
Message-ID: <20250925093941.8800-14-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since the general approach was acked by Geert in the RFC[1], here is the
(nearly) complete version of the SWDT series for Gen3: it adds the SWDT
node to the SoC DTSI and then marks it as "reserved" in the board DTs.

I left out V3H because it doesn't have the reset bit documented, like
some Gen4 SoCs as well. Before handling this, I want to refactor the
Renesas watchdog binding file first. It describes various different
watchdog units in one place, leading to IMHO unnecessary complexity
using 'if'. I think having distinct bindings will make maintenance much
easier.

But for now, let's get this off the shelf. It passes dtb_checks here, so
it's hopefully good to go.

All the best,

   Wolfram

[1] https://lore.kernel.org/r/20250920064428.5544-8-wsa+renesas@sang-engineering.com

Wolfram Sang (12):
  arm64: dts: renesas: r8a77951: add SWDT node
  arm64: dts: renesas: r8a77960: add SWDT node
  arm64: dts: renesas: r8a77961: add SWDT node
  arm64: dts: renesas: r8a77965: add SWDT node
  arm64: dts: renesas: r8a77970: add SWDT node
  arm64: dts: renesas: r8a77990: add SWDT node
  arm64: dts: renesas: r8a77995: add SWDT node
  arm64: dts: renesas: salvator-common: mark SWDT as reserved
  arm64: dts: renesas: ulcb: mark SWDT as reserved
  arm64: dts: renesas: draak: mark SWDT as reserved
  arm64: dts: renesas: ebisu: mark SWDT as reserved
  arm64: dts: renesas: eagle/v3msk: mark SWDT as reserved

 arch/arm64/boot/dts/renesas/draak.dtsi           |  5 +++++
 arch/arm64/boot/dts/renesas/ebisu.dtsi           |  5 +++++
 arch/arm64/boot/dts/renesas/r8a77951.dtsi        | 10 ++++++++++
 arch/arm64/boot/dts/renesas/r8a77960.dtsi        | 10 ++++++++++
 arch/arm64/boot/dts/renesas/r8a77961.dtsi        | 10 ++++++++++
 arch/arm64/boot/dts/renesas/r8a77965.dtsi        | 10 ++++++++++
 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts   |  5 +++++
 arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts   |  5 +++++
 arch/arm64/boot/dts/renesas/r8a77970.dtsi        | 10 ++++++++++
 arch/arm64/boot/dts/renesas/r8a77990.dtsi        | 10 ++++++++++
 arch/arm64/boot/dts/renesas/r8a77995.dtsi        | 10 ++++++++++
 arch/arm64/boot/dts/renesas/salvator-common.dtsi |  5 +++++
 arch/arm64/boot/dts/renesas/ulcb.dtsi            |  5 +++++
 13 files changed, 100 insertions(+)

-- 
2.47.2


