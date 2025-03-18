Return-Path: <linux-renesas-soc+bounces-14607-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95363A67E60
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Mar 2025 21:58:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F12C03BB9FD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Mar 2025 20:57:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B6B62139D8;
	Tue, 18 Mar 2025 20:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LuoIWmfo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD3817A30D;
	Tue, 18 Mar 2025 20:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742331475; cv=none; b=MsgIyeSwJoIhJn8oj8y9+ZWLiKmWlrhcxtvSEM6TkCYnUaSvAdaES9QHTA0OtWi3F8NnSEAN6AaWMXIbIN0x+Xr9wMwwQQpqO046y+6NW/4ammYCEL81UeabewDTBibnFpN4PDZz+fBrAC8pyqhpr8AS6z3wshdTeFf7HKM1e/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742331475; c=relaxed/simple;
	bh=D8zXftmgooMNEuXwEGXh7eQ5bSdZLKmudwqSE6iqe3w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mzYkNo1zUxNQd1nX1W1315aK1Z4whJ8WERviZb3Kg/6Zf2VHQQMS/xULPrW1ah3rnL5jDS4kkrRsbOC/hS2wzooQhEmzIVneLS1y/YJq+zmfnDN/SJCxQn31O8PZaEAffAikXNSfNhAQPvuU0lGhnjR05VdUKRrnF5rhazVxrhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LuoIWmfo; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39104c1cbbdso3532055f8f.3;
        Tue, 18 Mar 2025 13:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742331472; x=1742936272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rOqWRXBRe2pqifdU7Acak1KZR++C20ubnAdFSNcNptk=;
        b=LuoIWmfonpAZbHQjnGPcMmhpZ4Fi86XUIcDd5gi04UR70ia7bVc37lmPC5SDNkK4Sp
         JVb2q75eWwWZGEa35JGezZL/pXjGYjWAhm0N+LeM3K56rG90npIiFoMM2Xwh6GhxTR1e
         6gHT3NVnlwzBGPvPS+kYzcd5Vhrmi1CUjKzxVbqe1ID3pGmHbWbbCcEMW+/lrrMDFnSG
         VYtJ7o9FM2Vw0KofzXru/Eorbuu0k72P/EhPAMEoo3wTrg8qIsYXtzrbZ5XT05FTQwus
         gjF+Msftuw1gA9IoFU1gmYd3bptihLCOjkpenCZBRUMjGJQh6QPdeuUPgpxf+CLLOn4u
         ub3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742331472; x=1742936272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rOqWRXBRe2pqifdU7Acak1KZR++C20ubnAdFSNcNptk=;
        b=ck48YGo2nBgeWFTELOPaxAo6XTsJnAlC9ppOBAfczKL9htGjktHZ11A+3+Fp+qJdNe
         NjoRRMEtfVHthpsQTl2UBD2PunxDwdRyIfJEw8iC/YS/4+Q/WIlxdKxUsGYNP+oPOp7o
         6AdJl7MSfxbUSTqKqDlIPbAZUuGYOslUDVRNdB0/Z2r2vp1m98HY/B9UcTJSYR3IbdmW
         A+uaP7UP0kOx/eGpjdq2vgpESIkNsCI+DiRQKTJqru0SvPb1nqrMB+GHzrc3nR9CspFZ
         fCj3g8d6KlhDWJZzX47ZG9+4boWCNeYNXUOREUvZScGqNkBc40dJMcsdCVodDxtyzGxL
         kPeA==
X-Forwarded-Encrypted: i=1; AJvYcCU7f9svMDrV6ExP0NHep/AFNH4x7AboEvFtnUyjoqMTzo3SOq3rb3e3WzTVzh2qRt3ucMiz1wXK@vger.kernel.org, AJvYcCUIg/UnsQTn+T2LqGBhH8AqYEvIvoQl295+TKA+aVaUELa1ytwX/KMI90pdhaKKxKgaIpvdrUr/jUj2xH0FBoKBsqE=@vger.kernel.org, AJvYcCWjVdj7/cJhne5h8TR5ZVGS8z7flp6sifPOU7osIKIZVBQzwerCe8jwr74EC9BvhkIovz5db5LL3aM/XN0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywlt2K8NpH5/LGdSvnIiNOGJR4UkQya79MyQi4GkwcjsosnzQ/v
	uN38q6bgAcnDd+HcYte4skUtSb5EVZAd2Wuyh2aoZdzg04jNk+Nu
X-Gm-Gg: ASbGncuv0tBnCpout/+roa/EYuARit9c6Lg263pvqjSgJ594nuw8B55dOCXR+95qrww
	axyrozOR21Uk9L/D3EZVd6fwSuEt9B1hjfK4787iVzdTDl2DIXocE+GMlHUcBmhpGEhq71TPwE2
	iYHfACtWcMLukOzQajMD0Hkzz3+PVf2oxnHhUXZ8O/WLIhyHcxxujMIZTt3mTN7/MPy4g1ROoGS
	TEWtWwzDylg02jpGCwe5/GAEqdDmfxMCXXBn0DfUlzquC5cfigQDNqOuWOimrw+xEjwHy7AGaBj
	8oWF+zwJitGo6o5S/kpFXP/d03U0ZI8CEEu+ZwYWSSGZX+Qf38jmc9/nJDq74po5zklMHw==
X-Google-Smtp-Source: AGHT+IHdGog0XJhc86+9+5MvyCOjHWnyT0IqtRxaIhNO99BGj46bimLiGEem31ojE8KbEcAcoXE7Qg==
X-Received: by 2002:a5d:5f49:0:b0:391:27f1:fbf8 with SMTP id ffacd0b85a97d-399739b4becmr176145f8f.4.1742331471565;
        Tue, 18 Mar 2025 13:57:51 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:9ebf:9797:69d8:2d33])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c7df3537sm19212864f8f.8.2025.03.18.13.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 13:57:51 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	netdev@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v4 1/3] dt-bindings: net: dwmac: Increase 'maxItems' for 'interrupts' and 'interrupt-names'
Date: Tue, 18 Mar 2025 20:57:32 +0000
Message-ID: <20250318205735.122590-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250318205735.122590-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250318205735.122590-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Increase the `maxItems` value for the `interrupts` and `interrupt-names`
properties to 11 to support additional per-channel Tx/Rx completion
interrupts on the Renesas RZ/V2H(P) SoC, which features the
`snps,dwmac-5.20` IP.

Refactor the `interrupt-names` property by replacing repeated `enum`
entries with a `oneOf` list. Add support for per-channel receive and
transmit completion interrupts using regex patterns.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
v3->v4
- Fixed maxItems for interrupt-names property
- Added RB tag from Rob

v2->v3
- Dropped adding `additionalItems`
- Moved interrupts description into interrupt-names
- Replaced enum with a oneOf and added Rx/Tx regex patterns

v1->v2
- No change
---
 .../devicetree/bindings/net/snps,dwmac.yaml   | 24 ++++++++++++-------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 78b3030dc56d..4d4fcaeca8a8 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -114,19 +114,25 @@ properties:
 
   interrupts:
     minItems: 1
-    items:
-      - description: Combined signal for various interrupt events
-      - description: The interrupt to manage the remote wake-up packet detection
-      - description: The interrupt that occurs when Rx exits the LPI state
-      - description: The interrupt that occurs when HW safety error triggered
+    maxItems: 11
 
   interrupt-names:
     minItems: 1
+    maxItems: 11
     items:
-      - const: macirq
-      - enum: [eth_wake_irq, eth_lpi, sfty]
-      - enum: [eth_wake_irq, eth_lpi, sfty]
-      - enum: [eth_wake_irq, eth_lpi, sfty]
+      oneOf:
+        - description: Combined signal for various interrupt events
+          const: macirq
+        - description: The interrupt to manage the remote wake-up packet detection
+          const: eth_wake_irq
+        - description: The interrupt that occurs when Rx exits the LPI state
+          const: eth_lpi
+        - description: The interrupt that occurs when HW safety error triggered
+          const: sfty
+        - description: Per channel receive completion interrupt
+          pattern: '^rx-queue-[0-3]$'
+        - description: Per channel transmit completion interrupt
+          pattern: '^tx-queue-[0-3]$'
 
   clocks:
     minItems: 1
-- 
2.43.0


