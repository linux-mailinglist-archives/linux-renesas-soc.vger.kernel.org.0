Return-Path: <linux-renesas-soc+bounces-24030-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EA6C2C5FA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 03 Nov 2025 15:20:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BDE26188584C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Nov 2025 14:20:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99D393148C8;
	Mon,  3 Nov 2025 14:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="X07LHIwP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1603148A3;
	Mon,  3 Nov 2025 14:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762179587; cv=none; b=QKNnGVQN/u4ThYiRWgAT5tc+pVxv3ccNghBbDgKZN1MF0tb/b/WgLumynklWwYtB2gRh66eZkE45eBUd3MKOAiPk9VgTUObBHaOWPuLn2COhomc1HRwS+W13esxPH++ebVR8Q22iawAki0/q2Z2nXfwEmXxDQPHo3MDDJAoSb64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762179587; c=relaxed/simple;
	bh=3Aa+fgQhdXLmlBHwfKVF+zrnnydGtI+5KOVHCkraqPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D9rD/IV0phIIAhb22PQQ0AbjgnC3p+wS6MeRW5JNT0+B/cXB6laESVZdeu/n/e6hxv8Yw58o3aw8db8d+rxurQ2xkRd7NXra3BcTfHYqbzgbbE7Kpy0j/9rX3CUtR090UqTwW+j6z95QrjEtcc5s+0vM4L4KVhF6xIiqrbr2H58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=X07LHIwP; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8C187C0D7AC;
	Mon,  3 Nov 2025 14:19:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5BE6860628;
	Mon,  3 Nov 2025 14:19:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7E59F10B50128;
	Mon,  3 Nov 2025 15:19:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762179583; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=qkvhfd+aBeHI1uCgJoi4uMlo/YG8LyAVwUYzHTQgZ9w=;
	b=X07LHIwP0uslNFLN3Tp28BRn5l84CTREQYhZUdS5P7jEdSwVgAe5TM3GDlXAGnc6jbo0Os
	iWU/Xpo35BknPPRnmytlNrqBhhIahEg3LYlxATw3NfgAxV4sqgNp1EumBoDsrW8UzzmXkY
	I1/W838VpUysSUI6xev90CEt9TQu/JZQTJDBAl1B29WtS4Iv5yA9PsiM06tHNbBPOFPivK
	bAXWk7G2uFMY9rrSLDj+otGSEy9zJK33Cu0o22FHzthr8x1ePl5Zx/z7Rcog6y3e3+yUB6
	H+SnjDlfLKbDI0yaxazl8x6xpQsk6f0DhWlOty70xMkU1SE2G5axHGUoyOmC5Q==
From: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v3 4/4] MAINTAINERS: Add the Renesas RZ/N1 ADC driver entry
Date: Mon,  3 Nov 2025 15:18:34 +0100
Message-ID: <20251103141834.71677-5-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251103141834.71677-1-herve.codina@bootlin.com>
References: <20251103141834.71677-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

After contributing the driver, add myself as the maintainer for the
Renesas RZ/N1 ADC driver.

Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3da2c26a796b..a67babe1a5b4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21900,6 +21900,13 @@ F:	include/dt-bindings/net/pcs-rzn1-miic.h
 F:	include/linux/pcs-rzn1-miic.h
 F:	net/dsa/tag_rzn1_a5psw.c
 
+RENESAS RZ/N1 ADC DRIVER
+M:	Herve Codina <herve.codina@bootlin.com>
+L:	linux-renesas-soc@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/iio/adc/renesas,rzn1-adc.yaml
+F:	drivers/iio/adc/rzn1-adc.c
+
 RENESAS RZ/N1 DWMAC GLUE LAYER
 M:	Romain Gantois <romain.gantois@bootlin.com>
 S:	Maintained
-- 
2.51.0


