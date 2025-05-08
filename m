Return-Path: <linux-renesas-soc+bounces-16787-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 000D9AAF4E6
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 May 2025 09:43:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC7101C03FE6
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 May 2025 07:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E92CD195FE8;
	Thu,  8 May 2025 07:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="KoP1tg8E"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799F8221D92
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 May 2025 07:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746690204; cv=none; b=ZcN+K557RgUF5C6XihYf7wu1FyQruR3cQbcYLyihKyjaC/uycbKdEsDZfH+kTvQ5mf9ob9jlm4HHaAa0akLNAR2kxFf+FHgU18nX6dphro0Tj3/DBthIlwmQY2HitUvwbL6QHjt3tCDNfodmS6KUYgxNkA9VdzyCYkv/SNelLTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746690204; c=relaxed/simple;
	bh=r4He/SbE13CQK7Ytn3b712lfUL6ZH2CQO6FJpHoww7k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FAnFe16IWbS9mY3zWoQxQJ8LFUnoQ+oBWTdR/kHuxotkhVfQ/mhezpwz65AwzLdw7UDOwRHrDQNeoXXgDMclFxdxqMLirgx2PfnEliizSv6ejEtdRB7XNBbUqOM8dx6MEVGJJ3/XlD9Vr0Zs4osBLnpKSP0K8Y2wiz9ka+FCT/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=KoP1tg8E; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=4pG7NQpNXvxmYH
	mRjI/0iVghcPUcTCsgebEDay8eIiA=; b=KoP1tg8EYXwt5pXcCCedbSBhPaDCoP
	dKju1Cf+Bkvm6/mmunMjbXyy1MXL5O885KPx4mJoBVipAJmh9uSEIQ8Cq4C64C8t
	AX7s/SXnroWCaTCSbAaZfjWbCB1ZeuFOC3z6jiipgY7mQplv8li+3tmYjOLkHXjE
	fvO8/sb+b47mD60CSFMiYNKThFllqAxJoOkxjrKn/aSQ5oNeWAa5dNBybS3b6Qwg
	LqCPHXofX23Ho0I5O1WEze4JY45R4a9hk9fcrZH9SEA0wThP43bvzwZVtonTdPkd
	DXZp/+3HUL8JluOWSswU4eHs2fCnLVo0+URcwWl0AGU0ZIYZuF8xcaQw==
Received: (qmail 3712177 invoked from network); 8 May 2025 09:43:18 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 May 2025 09:43:18 +0200
X-UD-Smtp-Session: l3s3148p1@cxHLAJs0fsMgAwDPXxyAAIlRla1HkD11
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v2 0/2] ARM: dts: renesas: r9a06g032-rzn1d400: enable USB host
Date: Thu,  8 May 2025 09:43:12 +0200
Message-ID: <20250508074311.20343-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After the previous discussion, here is my second take how to enable the
USB host port on the above board. Please let me know what you think.

Still works with the Rockbox player.

Changes since v1:
 * rebased to linux-next (USB device patch already accepted)
 * moved pinmux to a separate node for CPLD on the demo board

Wolfram Sang (2):
  ARM: dts: renesas: r9a06g032-rzn1d400-db: add pinmux for the CPLD
  ARM: dts: renesas: r9a06g032-rzn1d400-eb: enable USB host port

 arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts | 10 ++++++++++
 arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts |  4 ++++
 2 files changed, 14 insertions(+)

-- 
2.47.2


