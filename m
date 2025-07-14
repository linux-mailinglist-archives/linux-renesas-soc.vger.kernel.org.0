Return-Path: <linux-renesas-soc+bounces-19540-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3A3B03A91
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Jul 2025 11:14:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 197D24A057F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Jul 2025 09:13:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 076D4242905;
	Mon, 14 Jul 2025 09:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="TnBs9jQd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4584242928
	for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Jul 2025 09:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752484350; cv=none; b=bFmzWtRBrVG7Yk88SCBRVbRhG2W3MyiDk/QWXVq9u8IuCHp0kcbydlfVW8vY4NV90WMsb6PXis5p9a+cAT6JyuPGJj8ENoGzOuKpHQzaCbsalZnAMU3JirGxedX9UqApFNQoz9tMuYXtzmM+GfA+8zo0AKYZlHr/FDul/jJN7to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752484350; c=relaxed/simple;
	bh=IDA+1A64+hS9RTzWYRwLy7lXuY/sOh514fCkmrhMVCY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=smSqsj/QDO+X5YIwrl3i4J5Ta/IxR3hplH3nRa/a4ni7RUcmsaPRexh6vd6T05PgkvTbHGjOHKxERR1b4VBsvzolZMSpABi71TrWXqUKRwKfyUiEPa9TLnsiq/VlNgHfHXAKuHzgXHHLOBDt4++cEt2u5tvuNMSrLZ5zEuAG3xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=TnBs9jQd; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=xC3Ooo/eMtEmsx
	oVMthubZ43cLSq+KXHCw/RPK4BkGs=; b=TnBs9jQdA1955Sah4dgnBsHA/shzIg
	cjbHUUtug3K2d3RgdfPVib39hLBbArzd8JPnhonz710BHmzRBYlbDosRv/ciaI1D
	R8/2ZxmwOQKs/9P3hTX6Gw01AAXBM9iFHnl5psJcd7CfW4PstCwek8p+2OM+Ooky
	rzGRn3KFLW9Oaafowb8SSfCQtk+txVELGiQfqXfPSQ/jA1p7S5pKdm1cAqh/CmlB
	GNX3CWV2AUiBCQRhkYgjQOyZ1z0hfKSxX18LR32NgAqZN8yb4bR8Nv6WGSEVLiTW
	q6y3ljw+ZrSxHnNWKLkQ22wUNdgS/9KAg+s8wxWD4MN4ipq7dtkyAdAg==
Received: (qmail 2399766 invoked from network); 14 Jul 2025 11:12:23 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Jul 2025 11:12:23 +0200
X-UD-Smtp-Session: l3s3148p1@qVPBDuA5dOYgAwDPXxNjAMIr4MhSGEU6
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
Subject: [PATCH 0/2] i3c: add support for the Renesas controller
Date: Mon, 14 Jul 2025 11:12:07 +0200
Message-ID: <20250714091211.20497-1-wsa+renesas@sang-engineering.com>
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

Changes since RFC are described in the individual patches. A branch with
enablement patches for RZ/G3S+G3E can be found here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/g3s/i3c

Looking forward to comments,

   Wolfram


Tommaso Merciai (1):
  dt-bindings: i3c: renesas,i3c: Add binding for Renesas I3C controller

Wolfram Sang (1):
  i3c: add driver for Renesas I3C controller

 .../devicetree/bindings/i3c/renesas,i3c.yaml  |  180 +++
 MAINTAINERS                                   |    7 +
 drivers/i3c/master/Kconfig                    |   10 +
 drivers/i3c/master/Makefile                   |    1 +
 drivers/i3c/master/renesas-i3c.c              | 1433 +++++++++++++++++
 5 files changed, 1631 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
 create mode 100644 drivers/i3c/master/renesas-i3c.c

-- 
2.47.2


