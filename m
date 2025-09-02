Return-Path: <linux-renesas-soc+bounces-21149-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 998FAB3F17D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 02:13:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A6FF0201483
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 00:13:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A939A2C0279;
	Tue,  2 Sep 2025 00:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i0fHVGVw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557A52BEFEB;
	Tue,  2 Sep 2025 00:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756771990; cv=none; b=YQOaMMAt7tJYPT4puMI2EPJYMUKydAMOyWFGT6ud5bWadGYUlRij12IMBQpJpk1Z3CTNuAqHhIQ54TasRhkMjoUHr6iBelb0dWO9+HeXorlFaG0fkVi7aRVHkF2SwcuDlb1wxHMbUdNAhmxFoJdSgGWFZpLcB95+pa+I+zGNBRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756771990; c=relaxed/simple;
	bh=q13jDoBacNruUmINfRn1N+CSPhkzJg45QwqqWKj7NqM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H57t7d2uwuOK12bwb0pXcvdV5kRINVS55xA4OYc26MgR62UVp5cSVQoElxOFz/hiebfwfWpDXXkzNsGnGpkiHfxqeIewCsEfx9r84ioTsw5xOy520Q3S5VuvLjARv1AQ53IgK7QwqnJ2//oW/K9WE8OW2QMRuEjZm/IZr5DXVyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i0fHVGVw; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3da4c14a5f9so45133f8f.0;
        Mon, 01 Sep 2025 17:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756771987; x=1757376787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9AzoOdR6sJDHEcKW2yNQOC2NaWtXxFSPPgG0odQCnsE=;
        b=i0fHVGVw0FkRt9FGDwr8G5wJdShwm91O6UI/6Ot/VbRSfVZNdDKPHVQDCTYFoBXrnf
         gNiO4+BEtyz9S6aJUtAovOSqo0u8dom2VK2WuDpny0HN8MWmEROzARHXDLzu3ETEHOC9
         giPEbILN48KZbvzSaOwXZJ5YbuSlMh+wz9aNTpuAduNfM9ReQuwE5ZD5R3QJdkoKfUP1
         xojkLYVplVKQIBU7V2Rj/UzMdo2ImYVUuyxLisFfqEOX7JChkDLxIJ7C7VjxSa7gmNwX
         06Cpv/fD7jwhN7lsdnky0p1kxnTmSk1d7SPuhKWbRJcvv25FbfXsTLDu16JNPUjeZpvO
         3Ihw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756771987; x=1757376787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9AzoOdR6sJDHEcKW2yNQOC2NaWtXxFSPPgG0odQCnsE=;
        b=LyOXTaHdTpKhWU7SvoXpb1fplcSTnXdJFISf8qP8VL+heaFUVnfN3SRhy/MGsHYTFX
         RTnIWkMCdgaE1diPMhPAKQHEe/OEKw9jSB9briAA13iSwx60mUFNXnoKD/AnuCfi0bSi
         h54IDgGrcGbFt7jPlT2lNcX2uaTxCrVKiG3ZJPEEmqXW+V8Ufcm6dXnpuiq/wcYBwhg/
         NiJPXOLAoEomS6cl6dG9+NMmUR6V/ALyzUYccO7Ntqi2EtnSit/OjWJD0MZDgmx70wsB
         AWQ0FNR2bzUjdf/OqKuWwWFX+GYniPh9gfw7ouyUItQJlaI+dnMnoR+bdzsRSEh3o3bI
         54VA==
X-Forwarded-Encrypted: i=1; AJvYcCWhrcdMnzOsUrbdifyJCIbuQfY2J9Mq2+oN2/vdNrg//Z2OkQatmoi3K/6qcyjyUpA9i5zFDZnI@vger.kernel.org, AJvYcCXMrhbFsWCHj/9qTnozqjeUwexiAuGLl/Ig0RrgVOYQX3W7JB0BGcc0vbyND7eaedCaoqiMe/miIr3JIPSK@vger.kernel.org, AJvYcCXuzqn8YfOYOWeke1j9zMId7nYdbu2TkaldTMX4O+k6EafhSf/jQm+K/waYDBqx41bjxz2gtcKNEkw7@vger.kernel.org
X-Gm-Message-State: AOJu0YyGoN+euEzAn+EpFwK4NPgqIwMjxS7Sz4MSru14sPZpZU8WIe6V
	TIFMcx+iutSi2GgUrcdt24L4OZh59ZO1SghbVq/O1ZVYeAx45mye42Nh
X-Gm-Gg: ASbGncvOODXHNu30byeXYdMomBT7OWeBcl1Hc1o+GALrxNRfiFLNm62BDiXZY7/X9vR
	aeZmkd6sahQVd5dHf/0bw+O/9yDaZLyGzfc1/3rIOgz020MG3778SoJUVVHz95qLy5zRjuSwLJ6
	Mg5+gll52CnqdVzVOq6fW/jkp9coRR1ocEcvblbpybejGOiNz1Ygx0qjafgc9XHvhjvQOEk9dgO
	bvz3gdEC/GL8w6t+ExL2scxcQpkHtgLN/Ddc7euFWeBvQzIv48QalaiNp5SFo/0nPmBCB3jg6JH
	oiTIUg0LfJjjRaGSCtiWBHZXW0t1+F2DWE+QI5f9onUGtBNFjVauiKGGNjHMt9keGwZhPeoFQ1w
	R/WIfJ4c+YuAsbpnimjDJLOGiD5HAiib6Adi6PxpfPDd8Zr4CD7A/Ix91
X-Google-Smtp-Source: AGHT+IE3uKhYEY1h+tUV59URGGBQIgTcoq1CY3L+zPFZ/Z3aqPfVSo0apPvIpocUjyJSk/XhqU4+ug==
X-Received: by 2002:a05:6000:248a:b0:3d9:a7b3:1b05 with SMTP id ffacd0b85a97d-3d9a7b31bfamr745722f8f.25.1756771986610;
        Mon, 01 Sep 2025 17:13:06 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:ca6c:86b2:c8f:84d6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d92d51982bsm2138153f8f.21.2025.09.01.17.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 17:13:05 -0700 (PDT)
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
	Russell King <linux@armlinux.org.uk>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next 1/4] dt-bindings: net: dwmac: Increase 'maxItems' for 'interrupts' and 'interrupt-names'
Date: Tue,  2 Sep 2025 01:12:59 +0100
Message-ID: <20250902001302.3823418-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250902001302.3823418-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250902001302.3823418-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Increase the `maxItems` value for the `interrupts` and `interrupt-names`
properties to 19 to support additional per-channel Tx/Rx completion
interrupts on the Renesas RZ/T2H SoC, which features the
`snps,dwmac-5.20` IP with 8 Rx queues and 8 Tx queues.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 Documentation/devicetree/bindings/net/snps,dwmac.yaml | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 4e3cbaa06229..578553840c9e 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -118,11 +118,11 @@ properties:
 
   interrupts:
     minItems: 1
-    maxItems: 11
+    maxItems: 19
 
   interrupt-names:
     minItems: 1
-    maxItems: 11
+    maxItems: 19
     items:
       oneOf:
         - description: Combined signal for various interrupt events
@@ -134,9 +134,9 @@ properties:
         - description: The interrupt that occurs when HW safety error triggered
           const: sfty
         - description: Per channel receive completion interrupt
-          pattern: '^rx-queue-[0-3]$'
+          pattern: '^rx-queue-[0-7]$'
         - description: Per channel transmit completion interrupt
-          pattern: '^tx-queue-[0-3]$'
+          pattern: '^tx-queue-[0-7]$'
 
   clocks:
     minItems: 1
-- 
2.51.0


