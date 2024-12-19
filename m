Return-Path: <linux-renesas-soc+bounces-11572-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9EC9F7DF0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Dec 2024 16:25:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 904DC1887A8E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Dec 2024 15:25:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A55F9226183;
	Thu, 19 Dec 2024 15:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kp2vhVH3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8837214AD2B;
	Thu, 19 Dec 2024 15:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734621919; cv=none; b=s+BDpVPKnZRT1+2e36KRseQanWijK97QwKC2MIUBg0fQWgXtGdaHPUr4Ngr3PLmzmFxLhxYjGlq+G4oJCYwrsTROgfrDjQ+oNqEaKIqINwU2AwScPWpHmOFbDDYdxtdMNgkQa0dFod3FmVfd8DyU6WA8iXkMjKzay5CzTatLjl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734621919; c=relaxed/simple;
	bh=8CenElWxsrQM+5q5jUKzqdqA9U9JpdH7i598RKM6JOY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Es+vXUw4Y/kVuW43j1MCaeIlqQbrGZ3wMy1lsDX2eT+z2CJmMyClatTe4LWcBkUEKGLDDqbCVxcme5UqW+VPyREkDgD3QbN+FT+ZWSQ6klujrphoCN2Oe1aaKIG5dhsQRr7w15koWsjCobT1kzKVxxm1n7xAvGLuhUADNdNre4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kp2vhVH3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.104] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5C291163;
	Thu, 19 Dec 2024 16:24:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734621877;
	bh=8CenElWxsrQM+5q5jUKzqdqA9U9JpdH7i598RKM6JOY=;
	h=From:Subject:Date:To:Cc:From;
	b=kp2vhVH3egWy+0/jOA4/v8ovM6RY2VfkFUQuQ47tdSaWLEaCB6LQM+ZDqqKZuNPKD
	 fz1E+kc+XsFzgdFwfWefXbVf3iWMxvip6lL25MDJNuZxfbINpzcFJ4swd6764sAtTj
	 6fyh3jzers4NV4rd6lT/4OHlvpT22qAxSJumbgcU=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH v3 0/4] renesas: r8a779g0: Enable VSPX on R-Car V4H
Date: Thu, 19 Dec 2024 16:24:48 +0100
Message-Id: <20241219-rcar-v4h-vspx-v3-0-8fe8d2afb268@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMA6ZGcC/3XMQQ7CIBCF4auYWYsBiqV15T2MCwqjnYWlGQypa
 Xp3aVfG6PJ/yftmSMiECU67GRgzJYpDiWq/A9+74Y6CQmnQUhullRXsHYtsepHTOAkbGtl2Vip
 vj1A+I+ONps27XEv3lJ6RXxuf1br+k7ISUgSUBp00BoM5U0CX4tBFx+Hg4wNWMOtPpPlGdEF8b
 ava2NDWqH4gy7K8AcP9B1P2AAAA
X-Change-ID: 20241217-rcar-v4h-vspx-7d809b701c75
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=1502;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=8CenElWxsrQM+5q5jUKzqdqA9U9JpdH7i598RKM6JOY=;
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBnZDraU4K7ZtuQ49pFq5JwvQVmMpYKLOqzBkvxP
 RmSoW3dzfKJAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCZ2Q62gAKCRByNAaPFqFW
 PO93D/95gfskUIilPphp9pqSOtIhY6kTH6R5j7PpXAUyh7yzBT0MbtZT+xRSlqFuyTwPgbsGSh9
 L4xtnL5ANfQLI+xLqLfMbE4/x6pfs7XS2x1dxFRIosqqleTTO696F6UDHYjTvYJiDsltiNmBtXE
 QD+w6WKROe3PMDXUa292Koberdb/ngpEs0VosJIIGVC87CYO1nsMQvOcRpU/Kkdc+Oq7LNfiPEq
 CQB0Rw1Ur0Ao5LdszLazK0DEgpWxuyA0KNSZJzgJyXI1W/H+9NfWoQg1C3lwcYrRApG+tr4SjOU
 dB0vjZDLVE25eABHQxIcrnUfx4VgpNHrbDgsBByj6CYoA8Po8inR/BdatomgAF1pD0sFsXr+ISS
 HmcuYE3OzcALp2z5p+E/0siOpQjA7KhAyBH1YJ8rrgleUFRwQHj/msBkJKXhMny0120wx0hnYZF
 KdHaH3bj8bg4n887waRDQcGYHhRYa00X0WWwEmG39QQLtR+4VOywRu1UnGBfybJgSsXXF7OitU6
 Yg5qMZTABXHx8bj62iepgMa0rBMbffo7SeukGkRrH2wg+YUST3hoZBW+vHAuuCpDStANX6I6V4c
 jI6DR2FphWKVwoutRIfKAPCXcaxecBFEPa58uUsczfruA+saco9Ct4Bc2zy9R/8skfVSuGh0RwF
 eN/TSEeVmoPIsHg==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

The series enables the two VSPX instances connected to the R-Car ISP
on Renesas R-Car V4H. Define clock identifiers based on the MSTPCR id
for the VSPX instances and defined device nodes in the V4H .dts file.

The VSPX modules interface with extenal memory through dedicated FCP
instances named FCPVX. Before defining VSPDX, define and enable the
FXPVX instances as well.

Compile-tested only series.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
Changes in v3:
- Test on an actual board and fix the VSPX and FCPVX power domains to
  use the ISP power domains
- Re-parent the VSPX and FCPVX clocks to the 800MHz S0D1
- Link to v2: https://lore.kernel.org/r/20241218-rcar-v4h-vspx-v2-0-c673647d96e1@ideasonboard.com

Changes in v2:
- Collect tags
- Re-sort nodes by unit address
- Link to v1: https://lore.kernel.org/r/20241217-rcar-v4h-vspx-v1-0-de04ea044ed4@ideasonboard.com

---
Jacopo Mondi (4):
      clk: renesas: r8a779g0: Add FCPVX clocks
      arm64: dts: renesas: r8a779g0: Add FCPVX instances
      clk: renesas: r8a779g0: Add VSPX clocks
      arm64: dts: renesas: r8a779g0: Add VSPX instances

 arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 40 +++++++++++++++++++++++++++++++
 drivers/clk/renesas/r8a779g0-cpg-mssr.c   |  4 ++++
 2 files changed, 44 insertions(+)
---
base-commit: 50d451b19cc58cf374160e30cbf72a5ed5b1b129
change-id: 20241217-rcar-v4h-vspx-7d809b701c75

Best regards,
-- 
Jacopo Mondi <jacopo.mondi@ideasonboard.com>


