Return-Path: <linux-renesas-soc+bounces-19576-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E524B08CD0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Jul 2025 14:25:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E4DC177CC1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Jul 2025 12:25:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3D912BDC07;
	Thu, 17 Jul 2025 12:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="EAl0qA9m"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6C52BD033
	for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Jul 2025 12:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752755117; cv=none; b=uMLNByX9uZgjVIxXidJ1RdVkJZzfbQlRfvtYuZzWayR/hoUJPmdAMdUsTjYmHuP9XrLektI2gnsvazgPD7I0hrwopwvjIZH9U/dQwLg1kunalnOIWmM/egYzMghZD8YIVf2JXS5rQit6uYxFNopIgflYn0Lyix5xRjzp7xbM3Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752755117; c=relaxed/simple;
	bh=YcINvDLfHkGzyANlr1ZupfWjKFva7tSMisQVD/2gG+4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HY2GLnbFumE/Lwnl4aB5W7ieBItpWGNTNY4BcgyzpPK1seh0HDCpKyIMMTamA2+lnUaeyESMz5JbocrgwB2v6spZGm1Qx0bnuzOzUHOa/mm4URkC0PSFgQWtbZM7SacWULxkGpTmCi2FeltZi09W7Snfgzi+8n+mIlqzWhEEN/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=EAl0qA9m; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=bNx8gllGSe/xy2
	vLhCn0cAXNpGel+OqdtdLDQBiWdoQ=; b=EAl0qA9mbot7pso+VTslj4rNQBSt56
	66eiK2vjlv0+lnmxGqkjxz5RT6YfksGS12ls5HmBACf2IlO7i2YD6zi6qixXSJ7t
	/JMMvGMjzuFdMNN43pYrPNWnzFajR5o9u2su7oWMatEPIyCHpCX0hy8X2J+8DCYk
	xXox0gCwEoIBjIV5B0Pps6cIXu3kiFzw1I/+ivaxd75Wto9Lt/eMsQws89o6pDGH
	f8dtBk+Xza8Gv2MCb/U6k3EV7Vf3VCcOl7uGdLYduE3QPJToTBLm8q8nbvwgLtZ0
	iZFo9WNPXlnY74dwRs56GJgFPQKFJuDuM7aCZQ3BGcdaUUipo2dz/9JA==
Received: (qmail 3671446 invoked from network); 17 Jul 2025 14:25:12 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Jul 2025 14:25:12 +0200
X-UD-Smtp-Session: l3s3148p1@HWbYGR86GMcgAwDPXx+vAAkEB0lWxGP4
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-hardening@vger.kernel.org,
	linux-i3c@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: [PATCH v2 0/2] i3c: add support for the Renesas controller
Date: Thu, 17 Jul 2025 14:24:51 +0200
Message-ID: <20250717122455.9521-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Here is a basic driver for the I3C IP found in various Renesas SoCs like
RZ/G3S and G3E. Missing features to be added incrementally are IBI,
HotJoin and maybe target support. Other than that, this driver has been
tested with I3C pure busses (2 targets) and mixed busses (2 I3C +
various I2C targets). DAA and reading/writing to the temperature sensors
worked reliably at different speeds. Scoping the bus, the output from
the protocol analyzer seems reasonable, too. It was created by merging
two versions of it from two different BSPs. Then, improved according to
code analyzers, cleaned up with regard to coding style, and then
refactored to hopefully match I3C subsystem standards.

Changes since v1 are described in the individual patches. A branch with
enablement patches for RZ/G3S+G3E can be found here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/g3s/i3c

Looking forward to comments,

   Wolfram


Tommaso Merciai (1):
  dt-bindings: i3c: renesas,i3c: Add binding for Renesas I3C controller

Wolfram Sang (1):
  i3c: master: Add basic driver for the Renesas I3C controller

 .../devicetree/bindings/i3c/renesas,i3c.yaml  |  179 +++
 MAINTAINERS                                   |    7 +
 drivers/i3c/master/Kconfig                    |   10 +
 drivers/i3c/master/Makefile                   |    1 +
 drivers/i3c/master/renesas-i3c.c              | 1425 +++++++++++++++++
 5 files changed, 1622 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
 create mode 100644 drivers/i3c/master/renesas-i3c.c

-- 
2.47.2


