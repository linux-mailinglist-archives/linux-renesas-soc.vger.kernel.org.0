Return-Path: <linux-renesas-soc+bounces-24940-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF09C78DDD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 12:41:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B1FF7349788
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 11:38:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D10534FF42;
	Fri, 21 Nov 2025 11:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hpy1b+Pz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6F634E746
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 11:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763724981; cv=none; b=G5JOsa4FGatGyYyS2GLHJ0UtyYwdX+vk4mWArgSdoCsQJel4T3rVBoGgyDD35qnkJNzhYOw0LeGmwlvzNUte1jFSqnaOEEZgcpmspUfcs4CNAE6sbUxy3mN5BNILdCP0b3BIGpWQQW5l7NiFYnnjEb6srP3aVLuyAkCJQhZPLiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763724981; c=relaxed/simple;
	bh=hchXSgygJWBcEWG+hD4fRh8j8Qkfp0pxrBvdqBRJ3ko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ox+LwXDcYHSYdI7vZndf0+FI/Lb1XUJFCHXJ3AyspOIAoukvb5MKI3oQKNm/RGia/2Cu4t55rrT0eq/wIcDZy45ugYvFJNRbS+dm0oUr/S81SPfoTkPye6FzveNeuMMYpSs9QEw4C7imaOmc8SE6H+HsckMFK2kXE7hoFR8srKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hpy1b+Pz; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4777771ed1aso12981285e9.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 03:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763724976; x=1764329776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nacbc5WMY0LOOZ8qaHyu8WlhOPDhH+6WVnm9Wyr/V+w=;
        b=hpy1b+PzjxQSWT/euyRXu6nYKCSF4IB5UCCXN65JFfcfEPzxIN9lhjI2J7PrVB6tPb
         MhyFK1u3urL/IqlQW30E07/lQP5x0hnuhjvANm0P84IbAjZJ62MmxFD9j0eCC4YySWOo
         cV3S/jtEwOkdnyK2s7N4WHO/6Yh6EWhXBCdwuugs8OrYI2odVPoQ1pIW6WJcaN3dkKZO
         yXLum70BSh9zAT0mtS8wgEBjPeGKHutTfM1mpZ4UTwdmyeY1FWw2YLX9Iz4G0mrGPaV+
         a1sNd4ex7UpNGj/CYAMuhDIa0R/QEZtdP6VX76aGOv+dwX5aj1TxI4VBKUbRmM7cEMYy
         Rw6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763724976; x=1764329776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Nacbc5WMY0LOOZ8qaHyu8WlhOPDhH+6WVnm9Wyr/V+w=;
        b=l3TciE8dH3P5xxmDkxlS5xEJh16VF7NAhOgujWgJWYdZNTk2g/kUK5qM1DbkJKZjok
         8oZmpegUsvB1fm62U/uyntQ6xbLlNiOUtiGiNi2p4wG0xikLSwo0+n6Mtv22flU6OvaY
         fRxtnyXU0eb5VkKjjKRaBaTyblzWDhK0cE6zQioNfqptLkWxx5BeVSZefKC442RRz9/P
         2yZiEPHy9yD2j/tmYZS/euETjhPBen/FVmZa39HM28UPotExSfxlxBk7OlkSYJ4uxHQm
         Mw552qS+QmaHnHDuO2k8IH5QLdAgk/wywC1Eqk9bMWYmSgXeqD04yPcH96mi3/Oe7ata
         kYpA==
X-Gm-Message-State: AOJu0Yx0IupfQXuf2BBC0iol2d3cf6S0x4aa9stUXmYyRUOWTOFC0Gn6
	jLj7j9QOIpv/SxrFZGvuO96wNZDZdxYcpcoIS5tpa9/Mz/kD/Os3l+QV
X-Gm-Gg: ASbGncshUtWqPhqsa0wj7A9X2tBu+1vJBij0UslqCxWpTbAzjxYhw8B76+ypvhrYBdl
	cCDJMRYmD72bhQCxaVpMDHEcbALbdv/VXq3yJ2CEVJvqVEWFLz5LtgrVtHn56coOymCsg9XipdW
	ozzx6I9o1aWy28IAY6dFE2tbNI+ubPikQsNLaNSHToz/WPK9scmQOoV3E1zXTQH+CztmvlZr7tZ
	Eqy+xCNydnJRsl3PqG3GGZNlkJD6ozRGfoWs1GU7T+VlQPaqOLhLJEeCvPfI838vwd6xdAMm9YO
	tO61SLwCYesrUhsqugax68P7O9vYyG5tjLzMIlu+nBIlwUQpPATn+4D4XHdervdY6BiKglpzOA+
	5YWMP7U9cnoskEthXFVLC36XDs09dY4qo+uklxd6vbrLGg9+8Ob2dSwuq/iPZMF7eDKvS+b/bIT
	Eg7zk8pq11W53iTtLCftiCIHzS7SsUOYWw+2I=
X-Google-Smtp-Source: AGHT+IG2HURpS3BsfaEjL3nAImQmP3zOqLnyYh4zvU/JiS2Ijzmk0gOHYb3O9eu50FjD0hI6GGLg8g==
X-Received: by 2002:a05:600c:3593:b0:46e:32dd:1b1a with SMTP id 5b1f17b1804b1-477c0162f1fmr24084985e9.7.1763724976029;
        Fri, 21 Nov 2025 03:36:16 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:9cce:8ab9:bc72:76cd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477bf3558d5sm38732465e9.1.2025.11.21.03.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 03:36:15 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next 11/11] net: dsa: Kconfig: Enable support for RZ/T2H and RZ/N2H SoCs
Date: Fri, 21 Nov 2025 11:35:37 +0000
Message-ID: <20251121113553.2955854-12-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251121113553.2955854-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251121113553.2955854-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Update the Kconfig entry for the Renesas RZ/N1 A5PSW Ethernet switch
driver to depend on ARCH_RENESAS instead of ARCH_RZN1. This allows
the driver to be built for other Renesas SoCs that integrate a similar
Ethernet switch IP, such as RZ/T2H and RZ/N2H.

Also update the help text and prompt to reflect support for the ETHSW
variant used on these SoCs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/net/dsa/Kconfig | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/net/dsa/Kconfig b/drivers/net/dsa/Kconfig
index 7eb301fd987d..9c44c530ebb1 100644
--- a/drivers/net/dsa/Kconfig
+++ b/drivers/net/dsa/Kconfig
@@ -85,13 +85,14 @@ source "drivers/net/dsa/xrs700x/Kconfig"
 source "drivers/net/dsa/realtek/Kconfig"
 
 config NET_DSA_RZN1_A5PSW
-	tristate "Renesas RZ/N1 A5PSW Ethernet switch support"
-	depends on OF && (ARCH_RZN1 || COMPILE_TEST)
+	tristate "Renesas RZ/N1 A5PSW and RZ/{T2H,N2H} ETHSW Ethernet switch support"
+	depends on OF && (ARCH_RENESAS || COMPILE_TEST)
 	select NET_DSA_TAG_RZN1_A5PSW
 	select PCS_RZN1_MIIC
 	help
-	  This driver supports the A5PSW switch, which is embedded in Renesas
-	  RZ/N1 SoC.
+	  This driver supports the Advanced 5-Port Switch (A5PSW) found on
+	  Renesas RZ/N1 SoCs, and the Ethernet Switch (ETHSW) found on
+	  Renesas RZ/T2H and RZ/N2H SoCs.
 
 config NET_DSA_KS8995
 	tristate "Micrel KS8995 family 5-ports 10/100 Ethernet switches"
-- 
2.52.0


