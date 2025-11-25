Return-Path: <linux-renesas-soc+bounces-25118-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F57C85B60
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Nov 2025 16:14:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CD19C4EFFC8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Nov 2025 15:08:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AE28328260;
	Tue, 25 Nov 2025 15:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HKSc0f55"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39087329C41
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Nov 2025 15:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764083211; cv=none; b=mA/kTzsB3n/5pn50q0Feyh1lKRROICy91TSnv2Z1qptXBRZaeJVMas0hOrDG6Yhhpb+xkQMJ8QGd/f5uWOesGyLz8mbive2q3SM4UzbKXXsLRNf+cwEBGZvdJpdMKeEoU12jESTAD5UNCWXFr6kdcg0wGaRQEN2tp1ewOEyfJ2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764083211; c=relaxed/simple;
	bh=xIPuy2AVoMcOuThGQUd2vsGav+08nP3KI7MIQ3gZGTc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WxOklhGOoXjL+DuhEhNQbSicwTDbTT5zcfFVY7fC6qmOiaXDVYUCzUfdQQgDVn7XZ3lUzKBztHOjD8TaJpjDdiOoDaWJIfKsltWXCNsRbgPD1s7saO/VMdOsdcizuEFUg/VAyky2AMMggfh6J1BGnvgYY2TGOfIIgfYx/ytKnQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HKSc0f55; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47118259fd8so49555795e9.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Nov 2025 07:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764083205; x=1764688005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EoUcpPy/VhJlkw0mixzg7KI55t0x2bZGdTWh+eiAOlg=;
        b=HKSc0f55trZDx8pjRUSNalOe5SWBnTNzpxgZ8JA5lzZNRm9uiqk8/3y/HUr5WLXwoD
         IVgBwxB7w9qLF+Ccd+OSD3Vy0UGF2IrHoJGf+sRZcOtdq2dm/e5A42aaihOwvnvL4gBq
         tRloEs72ULcDzje5nTsF/E9flpZ9o3OZr+AQbaCbKSXOQXRAPoiPn1oEnP9wlOf1jq3K
         zumkN8BxsUUeiuj1Sw2Pm1oHqmMH1icIyoOe1q2dP1BSPeNSRnMSouS7L+5x9Ix5xUh1
         kqDS351wmHxV9fHjOcLAj81oEETCEpE0zdz5yp5owZitK0j0Oew+NqdP1ndGIHD/db5j
         d+SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764083205; x=1764688005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EoUcpPy/VhJlkw0mixzg7KI55t0x2bZGdTWh+eiAOlg=;
        b=QLEZC4xLWGIELSl2AJc2puHwIAQCELq/ceiTlwGFy7zSyPNPHa2eqMigLdNE7F5USi
         HCTuIeUxIUPKwLsyR5T/tLpvMb+llKzPapIsRIHrwGkoxrOKMMIOg6OlnF6Dz1sWX5RQ
         fbAmCxBSX1XiejVGq9oSUNxJxmaRqH1AlINao01mVXK9SS7JjcFWvEURmJ6Zwr5bpXDb
         hQ/0iKo/g+InEfMDiB4JkViC14shvM5zEvmGh4GuVeCaL76xY1zw86+vlk7XnnXeUiRz
         AIxD28hHxjnHBKCUsiB2Pc4qHvGfUIjdL6OlhlZ+OUcqKN675m90yxOVxoXGSriK6shA
         NW6w==
X-Forwarded-Encrypted: i=1; AJvYcCU71irXMAu3EdLZoSdOuzroq9acnsSzszrHHWWJmjfia7izJerEoEfcmVOOnsu2ADj/xVkCNuoBS04yBbfbmc8i6g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFDXLBXvpj6B319meKJpyQGC4g3eofCdIg9FeBOXH84c9ZBwPZ
	J5Dvpqd1eAQ+QBVx/akzanrMZZPuGSQlQskOVXXhVx4+ElN4pRbO6Bx1
X-Gm-Gg: ASbGnctMv8ZCWUoezDOhl0qfFUX2RfPt8rCBQj8tyf7tz8ln0bfu0cr0sc0NKGVUCI2
	2Pz+FOlbXfFr/CUK95lEVmdj/Ytd7Nr0HvK3eDhdzW5j6dN7ui82kSuft0zkUCqPXdlLVop35yC
	N81He6y6a9oyadD+HJmUUpT2slI4ABBMnp8CBOuxVeiV/K16xKFLZZJLjsdANQy3oqHw3yvinl6
	UcBOMaS40XCQi2/dtybnrbqMZBisRIzweNrQnlQhpncH/HDf9fnibkHyilC3p8AW/ndEXz0dBhI
	ck7bE5iN586nXnZ4D2nw9KmxCk+wA+PmlxpjOPIL/JRydWJn5ba9YbC0/oIgyMHNBSK6IW5G2U/
	p1zMhRIvOplvNaJe2GcSxVFCs+pTT8uZ3ExBR/XRNqbd5puAGDTjbbd6fWt4UpB/REg83TIJ1xU
	X99DnLzbOxCYOcr16C0uKcixleXAcWuHJb7lp/FFWyHhaCBBK2uPTmWTMg6dFhOCdxsXMJkOZC5
	aluqQWMHve9
X-Google-Smtp-Source: AGHT+IFpusnzk4BRnri2FE8OMEBlx88fWJcmGapVeYq2gIFQvpFMinK+o5GyvlxplqNXxaWlj/0VUg==
X-Received: by 2002:a05:600c:1c0d:b0:477:9a28:b0a4 with SMTP id 5b1f17b1804b1-47904a6867fmr39604245e9.0.1764083204866;
        Tue, 25 Nov 2025 07:06:44 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fba201sm34797809f8f.32.2025.11.25.07.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 07:06:44 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v4 13/16] serial: sh-sci: Make sci_scbrr_calc() public
Date: Tue, 25 Nov 2025 15:06:15 +0000
Message-ID: <20251125150632.299890-14-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251125150632.299890-1-biju.das.jz@bp.renesas.com>
References: <20251125150632.299890-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Make the function sci_scbrr_calc() public for code reuse to support RZ/G3E
RSCI IP.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * Collected tag.
v2->v3:
 * No change.
v1->v2:
 * No change.
---
 drivers/tty/serial/sh-sci-common.h | 3 +++
 drivers/tty/serial/sh-sci.c        | 6 +++---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/sh-sci-common.h b/drivers/tty/serial/sh-sci-common.h
index 5d30771278b4..976e394ab968 100644
--- a/drivers/tty/serial/sh-sci-common.h
+++ b/drivers/tty/serial/sh-sci-common.h
@@ -169,6 +169,9 @@ void sci_port_enable(struct sci_port *sci_port);
 int sci_startup(struct uart_port *port);
 void sci_shutdown(struct uart_port *port);
 
+int sci_scbrr_calc(struct sci_port *s, unsigned int bps, unsigned int *brr,
+		   unsigned int *srr, unsigned int *cks);
+
 #define min_sr(_port)		ffs((_port)->sampling_rate_mask)
 #define max_sr(_port)		fls((_port)->sampling_rate_mask)
 
diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index d7c25635bb2a..0cdaed2e1b90 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -2573,9 +2573,8 @@ static int sci_brg_calc(struct sci_port *s, unsigned int bps,
 }
 
 /* calculate sample rate, BRR, and clock select */
-static int sci_scbrr_calc(struct sci_port *s, unsigned int bps,
-		   unsigned int *brr, unsigned int *srr,
-		   unsigned int *cks)
+int sci_scbrr_calc(struct sci_port *s, unsigned int bps, unsigned int *brr,
+		   unsigned int *srr, unsigned int *cks)
 {
 	unsigned long freq = s->clk_rates[SCI_FCK];
 	unsigned int sr, br, prediv, scrate, c;
@@ -2639,6 +2638,7 @@ static int sci_scbrr_calc(struct sci_port *s, unsigned int bps,
 		min_err, *brr, *srr + 1, *cks);
 	return min_err;
 }
+EXPORT_SYMBOL_NS_GPL(sci_scbrr_calc, "SH_SCI");
 
 static void sci_reset(struct uart_port *port)
 {
-- 
2.43.0


