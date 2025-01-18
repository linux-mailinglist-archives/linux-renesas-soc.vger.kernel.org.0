Return-Path: <linux-renesas-soc+bounces-12229-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 18AEAA15C79
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 18 Jan 2025 12:14:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A36F318891EB
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 18 Jan 2025 11:14:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 781AD185B6D;
	Sat, 18 Jan 2025 11:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="FNTGPpJd";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="pbYcVnBF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837847FD;
	Sat, 18 Jan 2025 11:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737198866; cv=none; b=Yr0Yw1yJ5uqbhqXnsLA//1EG90PaxbUx1w7vtv1h2cnNVlJE09S411dKaux/CL91wZ+ERCZ2iV6FjVKnD4bUXxFVNPkvi6ISNVCe2fPTszE3Pm4ObWF1LTb7PqmOJXVKCQ01gJiQlMnpaHhDUJZ0fFTP97ln3AJLe+fnyfBkCyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737198866; c=relaxed/simple;
	bh=RiQ1zZxFWWmeW/or5YbHKJw4ljXtd0Zw4Th/jv4tjcg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cg7z0/h/YYJe0aahONzsdpzI6tRIC+TW6APz+aH1+MPluw54wdoxFi7dMwjaiwLv3+venw7UFDwSbcaOnbG6pyGuY8WaeZMYh4EM8mkulWFLoDEGfJUHPy+d2maXmH5LOwfFPoKoQcUvHKFS4/kce8asp81F/H78bVjQ9SICky0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=FNTGPpJd; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=pbYcVnBF; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4YZvBJ6QDkz9sp5;
	Sat, 18 Jan 2025 12:14:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1737198856;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FBcw0LmTqDL6goZ9NmYCiCMKKyclPYew5eMg6NO1mcw=;
	b=FNTGPpJdjdxVi10wdAhpxdEr4KB5UzzIiYtpFOOjGX0DqC4/liMlCXf+kWOZsVvO9jk/iW
	Mghc3DbTLwVdfpY3dDzd0MB8xbOpwCrwOo0KWy+I4Es0oL6UHUjVUyD6m+VJnEuVTrNFqR
	R1xGWozMzUzxzwH8rWT4EqOD1cLmr02R9GSc+3ynyG7jdqohm9jmDpZQ+co/FMyPoCXPza
	Va6sZvZF1gKuxyzBL8AFTlx3wJ2m690bqJOCPEcSv7tia+4mJcZmvbn2N8/aRj75vFswQz
	1ruyNnIydMnh+c3pZ+rD55KoNiuZ79BZQuJOFywQraxDF6EadqYmRh+qvqbpCQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1737198855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FBcw0LmTqDL6goZ9NmYCiCMKKyclPYew5eMg6NO1mcw=;
	b=pbYcVnBFyvxJSQGYbyA9VxHSmYJJJZaSFbT04QNlmX52gh5Kija8g+LSA3FrPoMM1/fKIm
	phe8jrW5siwFzLpNeqgRCjH6mGXBsIMTeA2+Wk9qrmwc8niHWJ0ZFULH7W7QXSmJnMSYki
	p6OsewZMzKP5gwTtkCtYg13V5XrYf9cuey3Hp1PBw4Ux5uNKuxI6OJKiTNTDEplgeojmnI
	cZULUuA67HuUHseU4HxbxhH/6uFJ7Xc4kG8k0fzbZn3Clo1Z5EsteMyQ3I3+HzHQp+2EjX
	q1K08EkmBDIcPNwMNgEUGvyefkoxP0a8mB02ata6/vsdR/6uDhI51QUFUjMvyA==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 4/5] arm64: dts: renesas: spider-ethernet: Add ethernetN aliases for rswitch
Date: Sat, 18 Jan 2025 12:13:11 +0100
Message-ID: <20250118111344.361617-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250118111344.361617-1-marek.vasut+renesas@mailbox.org>
References: <20250118111344.361617-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: ha87ag9115gp9iwd53pa1ae9muffbu5e
X-MBO-RS-ID: 8ec3538ef4cec32a9c8

The rswitch has three independent ports which each can act as a
separate interface with its own MAC address. Describe DT aliases
ethernet0, ethernet1, ethernet2 for each rswitch port in DT. This
allows U-Boot to insert MAC addresses from its environment variables
ethaddr/eth1addr/eth2addr into each rswitch port nodes, so Linux can
read and use one unique MAC address for each rswitch port.

Note that it is unlikely this would break existing rswitch driver
operation in the Linux kernel, because as of right now, the rswitch
driver already calls of_get_ethdev_address() for each port to read
out the MAC address out of each rswitch port DT node, and if that is
missing, it falls back to MAC address settings read from the hardware
itself, and if that also fails, it uses random MAC address.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/r8a779f0-spider-ethernet.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779f0-spider-ethernet.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0-spider-ethernet.dtsi
index 069f36ba53a4f..55c7c54411be4 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f0-spider-ethernet.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779f0-spider-ethernet.dtsi
@@ -5,6 +5,14 @@
  * Copyright (C) 2021 Renesas Electronics Corp.
  */
 
+/ {
+	aliases {
+		ethernet0 = &rswitchport0;
+		ethernet1 = &rswitchport1;
+		ethernet2 = &rswitchport2;
+	};
+};
+
 &eth_serdes {
 	status = "okay";
 };
-- 
2.45.2


