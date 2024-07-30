Return-Path: <linux-renesas-soc+bounces-7626-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0689411CE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jul 2024 14:26:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 569721F24AFF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jul 2024 12:26:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3906D19EEC8;
	Tue, 30 Jul 2024 12:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AB7e7vPM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9711991DB;
	Tue, 30 Jul 2024 12:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722342384; cv=none; b=Mp+xJTJIXqLG/SkfCvZqblArmO+p1/5TnQhc2ZUotv6qkI7kuxXviYArWhnERbazliXto7qU1PjP8F8DlzdaIQy/FRzXW6PYX6l8wgsKGyu6wCYXDPfsSmvzJ0sQeSqJlIUy/7qWoCbhHd0Jjxg76PecJACFZodht9SV7I5MZqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722342384; c=relaxed/simple;
	bh=NOlPlWdsWE3TEPi+Wnc+BdcP9zdABevgIYMV/jX93DA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tmpMCEgDOX5BKq9V1C5X476Ac9jJxP0tqpYthkD9m3fFJKO7mG2w+w6h44oZPO7/E1tR4oq2tm/ao7+S1+z1rMGyVh5j5KcrL9h4+p6oMxLLsGmxzn1HzhlQxGWLRZAFpW9eGZs4/y1nIJ3J0jz6tvaKuME0CSJvjA2tMCGNgIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AB7e7vPM; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42817f1eb1fso22211515e9.1;
        Tue, 30 Jul 2024 05:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722342381; x=1722947181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YsAyLwMfDlSRT84Qw837baNPQYkwTWKyfaSAz+wuG/0=;
        b=AB7e7vPMYKAcF+JqdxhgiDPtebisLvf5BEvJdkv26TuHuemUGqvtw+JYJnEfyhMPV7
         t4W0rUUlddiRldNZKJEZ6NHoIqeNDe0FARu7KaLwNMdL2nDO73CxpSG9gPNIsdLvRUBd
         B9ZQs3VfK7HhcA+DlAhpxue3/euIVkNl9NxPta6OT4F5+qzD2k7AQGXhRvsZUzRSWa1t
         70GegR9wbFqqYOS014QcI2XkyO+Z0TzQMYLJ15FyIbZKpr+EZxdPRke07Qudss/K3TN7
         Rq64WLT8ynbp55fy6A8CYhGUc1Fd1cuXlKY23JjiBaWcqmYLnQUdx22NSCOoT/JjpX9c
         /QYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722342381; x=1722947181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YsAyLwMfDlSRT84Qw837baNPQYkwTWKyfaSAz+wuG/0=;
        b=hDE79ETS9f1Dne7LxhXcnCIoOEJt66Y719aPA2FXVbfIrmWo3t2vcivw2h5NHOg+s5
         BM288+YRxXfHNyQ5Y+3lA8rVqlCoN1G/EjHNaD1WVDz93olOylL0wYn3o5cCaq+Cr9wl
         ctDA1MzW5sTAkM0HO5lAVPsALfVw0JveIb8FHNVWQd/O8RZL+XSco0YqKUmzBouOp0mP
         mP8BTkdm+XkGnVDds4BecOdLBY1kUNtVnsPcieLgDLZob4JmW2HbN+ayH+nE2NcjoESs
         D5W3SSFqj2BOs1n8w1XEd7A0yKlntO2KN+tpcWAO97lNGF/3F1G1TnuxVuIXCuSAZfgB
         t8eQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSeaYCtEudQRktxWIXhVNtmJKFveQ0u7rzS/k8rVGTbM9BNdJ8xStwPCHmnQ69fymK0rgk6T7nJRF2gw1IiHymQq3Z8Kb9bmvBefEbKA2+QBESUl9Ssvig4I/VsRrz13J8EQHpKUU+rQ==
X-Gm-Message-State: AOJu0YzOyARoDEwBjI7CXgslZ5rFwbLLacXS1I5tvtIjVvJUXK17YrE/
	CW8U0FIKKePOE5gmsZtZVFAloVU3Or7vp4zwvt/uKj25dU9IyR5+
X-Google-Smtp-Source: AGHT+IE9h/j9vRasi1T0pYNNw6BUnEyofz6Ipy5tbNh06AY/1L9BiplAs+KDU/GhOTCtDBzGYCYkzg==
X-Received: by 2002:a05:600c:4f4b:b0:426:64a2:5375 with SMTP id 5b1f17b1804b1-42811d80105mr74380815e9.1.1722342380256;
        Tue, 30 Jul 2024 05:26:20 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:a2b2:16cc:b7df:405d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42813a5b3f6sm125366615e9.2.2024.07.30.05.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 05:26:19 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Marc Zyngier <maz@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 1/4] arm64: dts: renesas: r9a08g045: Correct GICD and GICR sizes
Date: Tue, 30 Jul 2024 13:24:33 +0100
Message-Id: <20240730122436.350013-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240730122436.350013-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240730122436.350013-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The RZ/G3S SoC is equipped with the GIC-600. The GICD is 64kB + 64kB for
the MBI alias (in total 128kB), and the GICR is 128kB per CPU.

Despite the RZ/G3S SoC being single-core, it has two instances of GICR.

Fixes: e20396d65b959 ("arm64: dts: renesas: Add initial DTSI for RZ/G3S SoC")
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2
- Updated commit message
---
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
index 0d5c47a65e46..34e29463a672 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
@@ -269,8 +269,8 @@ gic: interrupt-controller@12400000 {
 			#interrupt-cells = <3>;
 			#address-cells = <0>;
 			interrupt-controller;
-			reg = <0x0 0x12400000 0 0x40000>,
-			      <0x0 0x12440000 0 0x60000>;
+			reg = <0x0 0x12400000 0 0x20000>,
+			      <0x0 0x12440000 0 0x40000>;
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
 		};
 
-- 
2.34.1


