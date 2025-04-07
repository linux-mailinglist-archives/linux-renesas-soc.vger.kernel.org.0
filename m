Return-Path: <linux-renesas-soc+bounces-15440-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A05D2A7DD0E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 14:03:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E47F16B36F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 12:03:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD1722459EF;
	Mon,  7 Apr 2025 12:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vo6iqFwR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D697122FAF4;
	Mon,  7 Apr 2025 12:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744027410; cv=none; b=Qcb+w17+RQUhjDi3ubFVezH6fweRs2dsyYpz2htcn/iB3bhutANSinwP2XbIVRv53/x/Xa/b9Bvc1kw5EWefidynFVKX0tkqVqi6wVMCi2nKHLtkA2Eq5E3aYdil9PQfd+/mlk5MJmtRAIqRMo7EfK/mkZym5cU0MRvmHZXcT3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744027410; c=relaxed/simple;
	bh=ZyN/AKbobE4O5TsQyMKbKesPAa3qDUgNOgMjj/0s2To=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R0ymAZ5IHhRoM/FZmSOgBwkumIEtfBB0tDnGaifWj4vcDrfucnRC3cEXekOOKpRzP9u/U2Tn02qGvYX90fyVNa1jNH7RF2fLbPkIlJi0C/gQ0bnXUhOfSA2XQY4wQu65bpfkM2oDWnLczGmIPtYSU0DgOLSWJKBBbwDfLmogJh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vo6iqFwR; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-391342fc1f6so3815769f8f.1;
        Mon, 07 Apr 2025 05:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744027407; x=1744632207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fG6cklCkHNYJxMIIK0GDMVqFSaYHTVH2UbG4fjsK7gc=;
        b=Vo6iqFwRIUl80baYHy6/eN38aT0rCSfTa7r0waSkAOmTAwk20tL/shvuMKWlDE2Tfs
         o7Wmj1cYbxfv+8cufX/D2EMT1VMBYAdmC5knE9xctRxEzMqYWNc4ec7vtCPIJyOgPCIc
         npfe9/lvUPHldJgACaFvX2KUsuho/XDFOMIGwXvwDT9zZZcvB+Rwh3yCGfhjvRKFTsOv
         6Lp+E49QgVgj13EmthLbdTpuotLylgu/SszfEuN6Yb9P3B/t93sg9TfYi7mHNiU0Cxzi
         y6OkYVm+rj9jhZLheMQ83zwFkIMp8umS9LyJ8/Sp+pv2dIHRskR6ZYl886Xe4qEbAEIo
         z9+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744027407; x=1744632207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fG6cklCkHNYJxMIIK0GDMVqFSaYHTVH2UbG4fjsK7gc=;
        b=C93J1dSEnjDG1/Ck+St1EhoxGsaqlADHLkdV8X90XTYqAUmdJlUTdwVifwhETN7d4z
         chZi4HXGnUl42BcW5G8iB08pGTpmdy5fcFDzpki3oM3eY6gbCJvJTvvyEdB711NUTk99
         X8Xs9wyoPukxRisgjxdUTWS0gWY9VENwTbOWA6qv12pHyi+6xu6hj5RwkA1nu0dqsVVN
         k6ZnghEKyOWzU+i19fbbSP9T7I767dua/RpZYTuCatWNrD1lLw7XY29kZPdqAe4WV9dy
         JhO6eeoQ7FBH/BcqaCUHT2Danttz8GYcLHCiphfcvNIfuglVpWMA5NGorPuWGt7JgskP
         bHpw==
X-Forwarded-Encrypted: i=1; AJvYcCV9xkK1xT92u0vTDrvRraIXHgH6Ogs1KuFfQvAsBnRlu30410IWEFnWjsSxLUhRbd1kefFZ1UPDtcxSdbp1KBYZe94=@vger.kernel.org, AJvYcCXEFNi9bUciLYDk2b3QvVRAQ+ELYV8Rln5KL9JoNTz/Extr6oz1+Z9sdv3LPoxiuMtVTyrc/xdGkGS7@vger.kernel.org, AJvYcCXLtl6zML3DCexGBt2ZN0qi3ioqGek/T5ze7+km5l0rQIVLHsC4CuEOZfi8spMr7w9FrPGhNtzeFKkx3yLw@vger.kernel.org
X-Gm-Message-State: AOJu0Yye/U/DIW0W1FPuk89JWeiHK/CTvj2C1IQNuGqjEgD3EM+bu3+n
	roobf9BeHQmIxvowAUCbMl7DLgGxp3PqfEoWIKyVUM9u2D4yYwVX
X-Gm-Gg: ASbGncucsEhY9R1MMVI5RqiCpAaC44fC4AKZe5PYKVLI+PK+A8y2kAq3pSrUFPHzk5v
	oNtxbp7NOF0Uo5G67i11IRSn3XDaY0oYbpwJZv6R32/WtkO3VWI2VkMF6VblvXUFvm+9xlvdDwp
	c3QZYQDw9EBbl9F5Am0FM20zfZAyWX0DezfPkIUF1pP5yxwDM4Ita7X2XOd10+PVi7F3yRu5/7d
	ucw5Wsfu/M2o9tHpQtDbABMOVdKRenSw5tN1smsiiKCYdNCWpHF3m7At/Qg6l6cJHFMefx8NKne
	2EbmUW1Iwxol/ERdwHl0nsh8Dg4jex1EjdWgeR/AHjnKp8/HNesB7pKWL02obz5mXNoiyQ==
X-Google-Smtp-Source: AGHT+IEbZIVKSwKGcZGaZkVGFNqeu45TBBjhVhTZoMPStlgPwCbQmNhtEp6XGXu00ZWclskzPkReog==
X-Received: by 2002:a05:6000:2407:b0:39c:1efb:ee8a with SMTP id ffacd0b85a97d-39d0de67a97mr9832691f8f.38.1744027406917;
        Mon, 07 Apr 2025 05:03:26 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:78b9:80c2:5373:1b49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d943sm11986976f8f.74.2025.04.07.05.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 05:03:26 -0700 (PDT)
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
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v5 1/3] dt-bindings: net: dwmac: Increase 'maxItems' for 'interrupts' and 'interrupt-names'
Date: Mon,  7 Apr 2025 13:03:15 +0100
Message-ID: <20250407120317.127056-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407120317.127056-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250407120317.127056-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v4->v5
- No change

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
2.49.0


