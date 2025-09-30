Return-Path: <linux-renesas-soc+bounces-22474-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 458AEBAC6FA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Sep 2025 12:17:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C239E192447B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Sep 2025 10:17:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 570872F8BD2;
	Tue, 30 Sep 2025 10:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="j4mjXbdQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C754220F2A
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Sep 2025 10:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759227446; cv=none; b=Yjqh3gWGcLRXxe1dnCs8TtlET5Qf9W0SJBRmlpwkWaDTtkvdJM3xT43oFOwpJPPNzok4QUvLuUTNFX3YeUBs60KLIKBSP9fyFhz8dxft1IX5FEXFL30egSQdgrWWpEY5E33ryha8kOLUBEDGiCC/dV+urM3fj/WkVeCfNys/N3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759227446; c=relaxed/simple;
	bh=QpTHS24KTj4cIRYxN1LSQAGQKuJnfqovn8dUC6jttp4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ndArm2a9xuZvjAstOMMqxd/AQhpS7bRUrjAcGfXaQXNv/TRIrpCwsXU4vwBvHKD4RHb+lmxxS+JelvOVP+EWos6Fs3BANwmzxlkka1xhtJottpxfmk8CyhG9kXuMGBu6Fy7aD5hMg0Xf5kxGzAU/TGlptg0QKTAHYPqBkfUsFFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=j4mjXbdQ; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=uIskVg/BsT4hjo
	k20VUYA/XhS0HXaUY1LXMNa7yBSAo=; b=j4mjXbdQ5kFEeeGrsHgPr2SGVvJgMN
	3mgAAla8bDhpD8bcWbEyX64vXeEGC/fZlXvIUkXGOZp8l7d3er5GP4KmVRkwL7/r
	dlAF3RYeZEREsgQuuIERqAjO1d5aVBuBbbovKIhRjFnUgWu+KQA1swnq5o8IRPpZ
	cPBw2pY0O4aMmnJhYnun7zJqwJYQmZk00HfMaGKy7Sg2/riVYnR/LyON+pgRhZZQ
	8fV1BBBm6K8cCcwXyA0cKwjRq/Kjd+8Jw7i4QxxKXnVsVZrkrZIZayw0NntdASiH
	YhJzUSdL9qGL9cOPpx/hTJT7WlDE+33ns6UCWwpVwlVtPh2KBGAEK/+Q==
Received: (qmail 3595797 invoked from network); 30 Sep 2025 12:17:14 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 Sep 2025 12:17:14 +0200
X-UD-Smtp-Session: l3s3148p1@dnVGDgJAJr8gAwDPXwQHAL/S9V79e5yL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>
Subject: [RFC PATCH 0/4] ARM: dts: renesas: mtd-rom has no clock and power domain
Date: Tue, 30 Sep 2025 12:16:56 +0200
Message-ID: <20250930101656.33435-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Addressing this dtb_check...

arch/arm/boot/dts/renesas/r7s72100-genmai.dtb: flash@18000000 (mtd-rom): Unevaluated properties are not allowed ('clocks', 'power-domains' were unexpected)
	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#

... I came to the solution proposed here that the clocks we cannot
define will be marked as critical. We could also try to add 'clocks' and
'power-domains' to MTD physmap but I could understand some objection to
that. Opinions?


Wolfram Sang (4):
  clk: renesas: mstp: mark 'spibsc' clocks as critical
  ARM: dts: renesas: genmai: mtd-rom has no clock and power domain
  ARM: dts: renesas: gr-peach: mtd-rom has no clock and power domain
  ARM: dts: renesas: rskrza1: mtd-rom has no clock and power domain

 arch/arm/boot/dts/renesas/r7s72100-genmai.dts   | 3 ---
 arch/arm/boot/dts/renesas/r7s72100-gr-peach.dts | 3 ---
 arch/arm/boot/dts/renesas/r7s72100-rskrza1.dts  | 2 --
 drivers/clk/renesas/clk-mstp.c                  | 7 +++++--
 4 files changed, 5 insertions(+), 10 deletions(-)

-- 
2.47.2


