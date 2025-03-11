Return-Path: <linux-renesas-soc+bounces-14299-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B2297A5D272
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Mar 2025 23:18:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 477F07A72D5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Mar 2025 22:17:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C2D9265621;
	Tue, 11 Mar 2025 22:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fung2OVC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548EC1C3C1C;
	Tue, 11 Mar 2025 22:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741731472; cv=none; b=R2d6Kw7n/tjbwrgTO7SeOKR5QBMaRq3GC9CCTcPFIMVhy0DdSwQ5+4xgzIsAuTWossTK+kdPs/gxF8t7dFakeLbOo8L8OnkMcQXykWJF3cyZdidC4XICOWvRvH0Opnzl5jW+Qgz+HcsP0clDgOp48t9p+/dGhIFXZg9boCGMXhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741731472; c=relaxed/simple;
	bh=7RxlJWSgPkJ8GDA3+bapdd1XXMdhPk3GgLugdoQtHJE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b5TURyMDXl9pzG1LaVnoevW/9twVjVR4Hzma4fdXFBp1sd9MZMxCo1dYsGek83MFGbcK3/CxIiKfxb5ttpK1SIYqGBiGE076zccOiFFc2HbfRaN8XYybELOKoSDM4u6/uh/2lF4dvg/VsIlJ/+UJjnjZ3OYFC08AEM0aqSw5ouE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fung2OVC; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-390effd3e85so5159911f8f.0;
        Tue, 11 Mar 2025 15:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741731468; x=1742336268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x5PWMvix/guFGnvP3d4qqqFOj8j0eY2c6/9EeqAlZ44=;
        b=Fung2OVCbdkE0WLms25Y1Bx5OR4ksFkkRsFePVZwy+NI/iNwIRaCPyJfGihbDkGhdq
         Dx2dhXkgGjBMau/hVvKXwgTID0i/6Jfi1mVb1RHXEayr1XbKtX+zaxRe3nf8i8DGurIK
         3wyp3XqwXsDjba1Z+Udc6daPP+z75rkB5vnQgdTs+u1F+f9Ajz2dI70FRMZYqaf+vsP1
         ikiP+9XaR7Fb/rY8Lep9iRNYKA2F4YPqZbaEPn87IZ+LxlBDtwco3d0dOukXcFac4p4T
         c4jM3eavjr0LibPUTt0Epb37c661PoI5UNCeKHqrWKmvQ+FiZ0aYiVFPieiE4hqSx33n
         JInQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741731468; x=1742336268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x5PWMvix/guFGnvP3d4qqqFOj8j0eY2c6/9EeqAlZ44=;
        b=cIImR07WTEEXFOTnY/dVQjDJ417xY/8YtcznXxrZzjo4VjYQStoNniESGLz7qNrXrg
         okGvrOrg75wiq/rAIJ17MC8S8Sk7eoonYPnE3Q8+8nifGkRi/LGW1I3cKzqe+D9eofCw
         k9+QrGziTDttkqbgH0ztbUUm2bh7g8t4T9q8Ei55WAsJBvmcnwezpmDAsIcXVOFRoxh6
         1TT7+4fCXkbhBXvE880d6rFSTDUXN8DcDo2Z9trTmylL5vu+OOZ7DhfQQG4TjvpApa2N
         evfGkAn+mmfSNtHmBauGJHYG+N9q8W303OYAW3Fj8+joKbUqarVVyWXhKAmaSzhBlhdE
         vJmA==
X-Forwarded-Encrypted: i=1; AJvYcCVw+ix5riUnIqCEJ29jFreZ7ev+Pr05zW97c/N2tOrj7h0z54LUWOxkp+r02xmubFGOJJKxsIP5Y3fWyRaB@vger.kernel.org, AJvYcCWSjcFQvk5sI3N4OKuqjPPqyroxgIrYK87zBUx8KegODKDN+kFy+OsI3o3bFL1I/sQ2gJ5F05tdcZL9tktiVzvByFU=@vger.kernel.org, AJvYcCWeCrhu3dA2LPdC5p11nCHmhERHJckAE1JerNxzzhj+ttCMH3ri22mUUOdwUmKsFKZgPdcvoeNxZZ/w@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/cZwvIUO5Sq6mgf21Dy7VNfydHE1JeEQVvXfV2Mm2wwZBL/W+
	424kLheBGIV7mRRKas9tIyUBaTrhewLD9OKHj21+HiXZgUhZmf1X
X-Gm-Gg: ASbGncuboH4ZKR4QUpBACrhLlzGv6AxDzXe9GO9mgM1w1qvPh28jKz+D7xc1gXeZSv+
	GWJBcorou0AAr8nxLineHe9bnOjj2Wbb6MZDUtWGIO+ZqSD/mCW7Yh9r96b1WH7p7CQJ5PDCNjW
	XpamFFUplgITKeOzMXVDfNplaJ9pmNjz+tpNDv/AHPg/MSiqQofXQJS6R1bRPz217pk9JJ1gnaB
	D3AFSTn5cI8yFADQ/3tS7USfSZuFmZrJSgbubAVZnFxFCbvLYkSd7L+33aWax9Pv+TIoACSLhQ+
	kdE4dwQtvPlqa+ZKHiuda+RC3yKOSnFJq9xgY8jhNpmha8Wx7eyxEZeaZiFQmS7O+8BnJJ6I
X-Google-Smtp-Source: AGHT+IHaaY95fdUgLTOSOI0PZnsQytM+A0H34PSAPBDt3OfNhR6n2ntxhI2F2oTbgxbbxgFRyduL/Q==
X-Received: by 2002:a5d:588f:0:b0:390:f699:8c27 with SMTP id ffacd0b85a97d-39132d4d155mr13513808f8f.12.1741731468462;
        Tue, 11 Mar 2025 15:17:48 -0700 (PDT)
Received: from prasmi.Home ([2a06:5906:61b:2d00:a6ad:9216:2ab5:120])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfdfcfbsm18782252f8f.28.2025.03.11.15.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 15:17:47 -0700 (PDT)
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
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v3 1/3] dt-bindings: net: dwmac: Increase 'maxItems' for 'interrupts' and 'interrupt-names'
Date: Tue, 11 Mar 2025 22:17:28 +0000
Message-ID: <20250311221730.40720-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250311221730.40720-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250311221730.40720-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
---
Note, for adding constraints to vendor bindings patch [0] has been sent
out seprately.

[0] https://lore.kernel.org/all/20250309003301.1152228-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

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
index 78b3030dc56d..bacec6e6514b 100644
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
+    maxItems: 26
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


