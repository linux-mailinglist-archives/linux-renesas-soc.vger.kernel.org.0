Return-Path: <linux-renesas-soc+bounces-16002-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB0DA89EBD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 14:57:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C3F4189FB26
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 12:57:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DD332973D7;
	Tue, 15 Apr 2025 12:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ECMx26vD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244ED296D0D;
	Tue, 15 Apr 2025 12:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744721812; cv=none; b=J3j1SaD+kMs9qI6aD/zah1CsxMGn62MOiu6FKc4aZ9gqmn07ioGIaWksqFUIZIodaL6iCue2d/QCNInWrdtBGsyfmuRd4Q69sk8rAIGZQuLXR5oa6UTdfQAl75frh7R3uTNqqaZZ62eRTo7O4oLP76qqiH7S+NBdcfHfl3dQ6Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744721812; c=relaxed/simple;
	bh=JV6/Zd7jmLkMX3zv5Il0vw94EGousU0d+tw5mlhV1i0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jfbqhm7SxymlTzMj3vxMT+RbkDNqxmBLYwcaVPndj5BOtIKfkH4A85dKhRSASYGf7k4gaDFyQRu/pI+27AKcd/WIp8+rKXpvljGizSqrP6aOkkYseGbyk5SSU2jnVj0dDUBkqwT+xcuVwCJvF1ZZAYs7Gqo7dn2IM1DCSt3/1Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ECMx26vD; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3912d2c89ecso5193161f8f.2;
        Tue, 15 Apr 2025 05:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744721809; x=1745326609; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dxtx+wYgnayT5+SYG5cHUYe65nSDdAbTREq4fQgE5Vg=;
        b=ECMx26vDotUnt6pX1xc1Vc8G5u+r0ARgcRvfjvzbiBo7PoyG0amKyOPw/UfpvKi+Xm
         h24i82pShPE4yNnS07DTX9WoUloYGRtP7Y9iVfkW5G4jpkN122ykTm2iw6mQcyoGyllP
         89UoIVWeVNlJxt7Nx/MHin2Ixjx++SQZBReurHuOY2w5v6DJqOidNya6brRSR+FFhAeg
         3ngO4owk635i5LxArwY2GO5e3TNa46OCXB2XHUVJKRITVXxZXp3ecDwwrLgqeDynEFNT
         1MYADT5Na6u2MGxyIFdx1WvcZZOGITlPLMimXDhKMLySKnL40kgXWq01v8HI8/4U0STm
         MPCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744721809; x=1745326609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dxtx+wYgnayT5+SYG5cHUYe65nSDdAbTREq4fQgE5Vg=;
        b=QT4Ki9wmVip6TqvyI2BfArtb64KaRAAUbDCMM2kE3gVbHkRLuBy/3lxHMr/cMfwWP4
         OlOO8GdwoJ6hQ8suzNE3RLiXtpE+W/dSYb+aYWTm9sGC0QL1FewUm3irkaCBSmh4Ty4u
         kVUfz7pmZoM6sxRHP5Dg7Oj0QT0XN19vUVw7JLGYDJNGSK0BCInouhUXernqcPHjzzg7
         ArCjnmnXfQOeSTVqqs1m2SFJVncY/sDBMOtp0GmaJJyYPZNyh0mvyZJoKtxjqpYLwyPp
         mZKgAPdseD0uVDPLnpJc0/gqkPT1kzKYOvdce8arSL4SHX88ecwJx+/xBYFVW8Rw/+wM
         lIyA==
X-Forwarded-Encrypted: i=1; AJvYcCUHAfVvGvbQFhBoFN+6b+w7Pl63Dd0i4q08hkjScuJIKNA/VzumNQbDo3HGws3a6fVWNT+yj1SUsaYAEL5z@vger.kernel.org, AJvYcCUXt/m9KSwCjck5ph40W8FjP91+b6qgAmSba7TMAqVdA7SX5Gvp0niZXPvP8jP1Y3S/wMgR42JhXTGh@vger.kernel.org, AJvYcCXWDtTkDpYOTYWYXS3fuNR2FXir3ww4B8bNUpse/qSPYT1sftpnF5mhQ7RmHd1pwMuvZkZR6SmrZoEwi5aSkXar++8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1jfNOKqm9xj0zR6Jsylo9dN8GOzQ7Wwh8jT8atJpjqqsCb8in
	PRJqBWWX7Q+5Ns57v5amoOrQX5esIK1nWgqTVYo1Snmm3KZciBMW
X-Gm-Gg: ASbGncstz1/sR9NEzgoQFlaq0XtM8kdtfTb92PfEIYUGo0Il9cKgplmGHLoTnRTdt2R
	8kCJC3KgEh7tQYJKQCVDOjacyLGTyF8n9pRekzraf6nJ3NUTkK7Xc+YQAOj+cXR2fyqCyb68XS8
	9RnNfEbZcYMHMNqaH2QGkVQykhxXk0sQ9vvgvSL5u+lS8u2A18YnR4SvTCX4PqHr0VbgNkbgWyb
	JH4f5PP3T4PlK1PvbzQMZaw6uT+9qppUUAcaINSPpVJC4dykOXHuWT9QsXIjoz5DhgzFHT/EKmJ
	MW2GAXbFG0X3s11AO75P9IKV4iOhtHMMpKSwkUeAnCV7LKps6sS0CVaUnyJbnm0l
X-Google-Smtp-Source: AGHT+IHh1oHEy/id+2kXHtxdu/j3+e8kGj1u5Gw07xALuQpAX70pVHKbVNleZqFSuazAXcZb5wjYGw==
X-Received: by 2002:a5d:5f87:0:b0:39c:266c:12a5 with SMTP id ffacd0b85a97d-39ea5201e7fmr11010905f8f.13.1744721809254;
        Tue, 15 Apr 2025 05:56:49 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1883:aa4:a265:bc12])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96bf97sm13922334f8f.25.2025.04.15.05.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 05:56:48 -0700 (PDT)
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
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v6 1/4] dt-bindings: net: dwmac: Increase 'maxItems' for 'interrupts' and 'interrupt-names'
Date: Tue, 15 Apr 2025 13:56:39 +0100
Message-ID: <20250415125642.241427-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250415125642.241427-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250415125642.241427-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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


