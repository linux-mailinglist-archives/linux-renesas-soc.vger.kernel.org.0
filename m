Return-Path: <linux-renesas-soc+bounces-26963-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D65D39576
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 18 Jan 2026 14:51:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 58A6E3007ECA
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 18 Jan 2026 13:51:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 085C132B9AD;
	Sun, 18 Jan 2026 13:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="LG/UH7x7";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="wx9SJXwH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213A11A256E;
	Sun, 18 Jan 2026 13:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768744278; cv=none; b=E90B8Ki/GsD5YTt+oyjptIkR9ZJvTdBhmWx1cVUVuUbz5oripPK62EySThE4mLHqRl6tH1Oj+1ItDQGV11hhsG64SxZVdByDRqALluwe4B92tJ4dAuqH6QkiOhtkLJg/BSlPjOa10ndIkXO4fMzF40toOgSgMMPmnAhJMOxV14Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768744278; c=relaxed/simple;
	bh=x3DsOWWJy6edg1F/10BJa5xm9IiiAiyPLGSU06E7uFs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TqrW5PfZZ9hUk74i9KcW3obECJk8rZ98nNSJyHPKzokbGAPpjoL+WKqbHDu2j2g5wOYxx7YkxDrPQtAIRFK45VzczMOF+v6jHQmVmZObW0BsPNv3nMXHm0wlMRA8uy9BO2VCGCyIeRO/BhbOW9+Pqw3vgcQJwooaWBzcwdnlvjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=LG/UH7x7; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=wx9SJXwH; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4dvFNx6R4xz9thH;
	Sun, 18 Jan 2026 14:51:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768744273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jtJ0JHkBONXN8QFPUokfERKmqgzusHvWZDDChLmbMm8=;
	b=LG/UH7x7IzsqbvD5MbwNTy1O/ghryF3obqHx1GvSzllD43dOamqzVxEkU35cqW2MJYgY0H
	IfVj6oBjWfViXgAJITuzM574P/q+Odq1rzrlKLhiQI1XeYC0u0ZdGiJAjjYHNXewuW3+3J
	XXYw39pGvec5e1ty6ldEPivJV0LL2ik6lVAVwHH2oHTwX7umRCA1LzDK1TrLvK60gbzBqN
	MHn4+CjIicFcvrFru0IOi6R0rEcaPAPweX1HgivcJ54TbOlCrYJA1RsRGDOMQnx/s5+Se8
	qPxZPIONwaWRRvwSyNAt5ECKz/xI/PGzd/ctOPKGIiJFgfuEad0yWIap5ix1XA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=wx9SJXwH;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768744271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jtJ0JHkBONXN8QFPUokfERKmqgzusHvWZDDChLmbMm8=;
	b=wx9SJXwHPUrYm7huy1+FQ3XdlH3yeE2gGXkdsgEtDUgda8Sior5juch57dY65xrPo0lufG
	7/YZ45pQy8PmOBVo2btZpV4dFPYBCgeBG1Hke4TyBMfDVnAf80rA7rDiTdws5+KplERruv
	QD3/upfIwzYc93ay4VOpz0kuefVHxYHzDPEtRfE+sNjU642AOZn3+WqJIXmQo1gqvZyEHz
	fIniWPVcSLHvq1RXPq4yldDmBOCLSHGdyrZYGFayxM0rSfTspH91sq1JWAB1nu+RwffxHe
	aHfIOgd3f0eO5vmXCCh6JBshuxonxUBEv4OoIxxMd8tYUneJJLN7jpo0tSM3Qw==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	devicetree@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 0/9] Describe PCIe/USB3.0 clock generator on R-Car Gen3
Date: Sun, 18 Jan 2026 14:49:48 +0100
Message-ID: <20260118135038.8033-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: aeaf430141668aae5a9
X-MBO-RS-META: z7y9zyqpix9wcqxp6nkri4jzedid9w9z
X-Rspamd-Queue-Id: 4dvFNx6R4xz9thH

Describe the 9FGV0841 PCIe and USB3.0 clock generator present on
various R-Car Gen3 boards. The clock generator supplies 100 MHz
differential clock for PCIe ports, USB 3.0 PHY and SATA.

The series effectively has three parts. The first part is description
of PCIe root ports on R-Car Gen3 SoCs where applicable, in this case
that is H3/M3W/M3N/E3. The root port is used with PCIe port power
control to also control the PCIe port clock. This is needed on Gen3
boards, because they often use separate clock output from the PCIe
clock generator 9FGV0841 to supply clock to the controller and to the
PCIe port.

The second part is a single patch, which fills in the missing USB 3.0
PHY on R-Car E3 as usb-nop-xceiv, thus aligning the R-Car E3 USB 3.0
support with the rest of the Gen3 SoCs.

The third part is enablement of the 9FGV0841 PCIe clock controller on
the R-Car Salvator-X/XS, ULCB and Ebisu boards. The boards use the
PCIe clock controller outputs in a slightly different manner, all use
the outputs to supply PCIe controllers and slots, as well as USB 3.0
SuperSpeed PHY. The ULCB board also uses the 9FGV0841 to supply SATA
IP, but this is not yet described in DT, therefore it is also not part
of this series.

DEPENDS: https://lore.kernel.org/linux-clk/20260118025756.96377-1-marek.vasut+renesas@mailbox.org/

Marek Vasut (9):
  arm64: dts: renesas: r8a77951: Describe PCIe root ports
  arm64: dts: renesas: r8a77960: Describe PCIe root ports
  arm64: dts: renesas: r8a77961: Describe PCIe root ports
  arm64: dts: renesas: r8a77965: Describe PCIe root ports
  arm64: dts: renesas: r8a77990: Describe PCIe root port
  arm64: dts: renesas: r8a77990: Add USB 3.0 PHY and USB3S0 clock nodes
  arm64: dts: renesas: salvator-common: Describe PCIe/USB3.0 clock
    generator
  arm64: dts: renesas: ulcb: ulcb-kf: Describe PCIe/USB3.0 clock
    generator
  arm64: dts: renesas: ebisu: Describe PCIe/USB3.0 clock generator

 arch/arm64/boot/dts/renesas/ebisu.dtsi        | 43 +++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a77951.dtsi     | 20 +++++++++
 arch/arm64/boot/dts/renesas/r8a77960.dtsi     | 20 +++++++++
 arch/arm64/boot/dts/renesas/r8a77961.dtsi     | 20 +++++++++
 arch/arm64/boot/dts/renesas/r8a77965.dtsi     | 20 +++++++++
 arch/arm64/boot/dts/renesas/r8a77990.dtsi     | 27 ++++++++++++
 .../boot/dts/renesas/salvator-common.dtsi     | 26 +++++++++++
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi      | 21 +++++++++
 arch/arm64/boot/dts/renesas/ulcb.dtsi         | 13 ++++++
 9 files changed, 210 insertions(+)

---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: devicetree@vger.kernel.org
Cc: linux-phy@lists.infradead.org
Cc: linux-renesas-soc@vger.kernel.org

-- 
2.51.0


