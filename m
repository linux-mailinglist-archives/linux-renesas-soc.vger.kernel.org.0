Return-Path: <linux-renesas-soc+bounces-7627-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 838669411CF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jul 2024 14:26:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 354901F239B1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jul 2024 12:26:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B52B719F464;
	Tue, 30 Jul 2024 12:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ht0wrIc5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034DA19E7ED;
	Tue, 30 Jul 2024 12:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722342384; cv=none; b=a/yTb5MmGd5taW1JDwMouT/2lb0dn13weaFXizDFgbqpwz9jglnLDnQD7VK/+XbTSAGjEHQnEHAqHnlzyLwF2zQFwxwu9THSn96PO63dgFa2w90hR/JqoEggDBIMwncjr2qoOrlfDdIyQp3bZDmlOqJKlQH0OuOsnPVx59uvQaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722342384; c=relaxed/simple;
	bh=D8efRMAYzk9orMBEW1fsP2w0sth895llepuzxO057N4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nPC/Md6rE7CD7Pf5BnoM1UY/hi8nKIwAFjv4xyod3vrKjU+751xewlKfRsCQpCnOu41pCee4Xwp3mCgSAlo6hsDNvUrB4fW/fg8FprWKZyy02lMWQxoJm855sKyjPUTFvfNLXyYd2i3jNcr7LEErTeV1j0DVRPn5B9nDJGcZWjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ht0wrIc5; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42122ac2f38so17299565e9.1;
        Tue, 30 Jul 2024 05:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722342381; x=1722947181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SslDiFB6vR4HIq/PCrpOaoM16gczqCD+fcENoLARnZw=;
        b=Ht0wrIc54bJTh+ozfZflzwwWwT6DYrSxIAuW1ZQujVxyX4f2fcE7Rjo5P/cLZZGA6s
         0ZDSaWbk5u7OYbclWARGh9NA9YGeJ9OL3J780To6eqZrln8eWnrUxAlt51CenUzKX1Va
         vcn7/KHHx57gLOB+DRAvmZ3lpY7cLa4vsXnuyBXHfwRPerGNHRUJyznuFVYEGKhfbpbw
         9Vppjhn2obspYynEgZX7z8UnlZyjjaMqSMVawD+mTvkAx8SONWPEBQnFAM5U3z2adhjI
         GO+Z+Qprf1tDcWY510H2bBrFBLKVJaW5XHE3GuLAbGXGi6gRkReoHiU1/YijG2WK2LTa
         UWyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722342381; x=1722947181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SslDiFB6vR4HIq/PCrpOaoM16gczqCD+fcENoLARnZw=;
        b=bT5XdIlNePfJoJZWYBtv8qbPRkEtlS06d892D8ZDZ9KGXyfQ5wr6lt4/BXrkS+aLY6
         ODQ6dyRNvXqqzA+9KaBIQX56nSD8sN3vQaE1V5s2sArNs2R/6CWg5/CuBKrGf+K0nVSx
         VRCLS8RAvTtTQvGfhVRvma1w7YdsuoYcJm06ziWT4fMp9LdJGYGEz87MyOqgbELgv+f+
         c53vwF16BH70tKhJsDM1JQSppxV3nLiTizlWZPEWXtD7sxlAqDqZp2T6Zx/BhBx9kwsY
         WL2ooY2CyJkGf3K7t4I3g6astepQnqs56Xeq++6ZvrZ/vBWNwJ5PoQmikcCuSom+cRi/
         sigg==
X-Forwarded-Encrypted: i=1; AJvYcCXMUKJ59Y1r6xXWbd/3N0f9nv0xCZ1huNlZDHzj4oWO9ZZiiB9Gp1j23XhHrDmkUF7MQbpSmmK7ikoYwd35wPWWa+E3fbelbkgbNYpl9p10FAar5dGgJJ+4Pd8pt1H620sR33tsI9RD1g==
X-Gm-Message-State: AOJu0YzGAqOjXquK7Edd0UzSivl+oZX/1L65IVT2043y8MCOcB61Hg9Z
	tBwSFpvPzPWj7cLF9Nt26qGJIXNSwml1IUHjEuTmhcLY4/xDc06Lu1rYOam3
X-Google-Smtp-Source: AGHT+IGb7yN1dD3SDk/C/zIlmrCO7f1xCMf4oF5BRleAsn9WR5r0oCGHM6Htd6kUGBWHTAfKRk4xRw==
X-Received: by 2002:a05:600c:3b17:b0:428:9a1:f226 with SMTP id 5b1f17b1804b1-428243e1b22mr13203595e9.1.1722342381138;
        Tue, 30 Jul 2024 05:26:21 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:a2b2:16cc:b7df:405d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42813a5b3f6sm125366615e9.2.2024.07.30.05.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 05:26:20 -0700 (PDT)
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
Subject: [PATCH v2 2/4] arm64: dts: renesas: r9a07g043u: Correct GICD and GICR sizes
Date: Tue, 30 Jul 2024 13:24:34 +0100
Message-Id: <20240730122436.350013-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

The RZ/G2UL SoC is equipped with the GIC-600. The GICD is 64kB + 64kB for
the MBI alias (in total 128kB), and the GICR is 128kB per CPU.

Despite the RZ/G2UL SoC being single-core, it has two instances of GICR.

Fixes: cf40c9689e510 ("arm64: dts: renesas: Add initial DTSI for RZ/G2UL SoC")
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2
- Updated commit message
---
 arch/arm64/boot/dts/renesas/r9a07g043u.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi b/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
index 18ef297db933..20fb5e41c598 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
@@ -210,8 +210,8 @@ gic: interrupt-controller@11900000 {
 		#interrupt-cells = <3>;
 		#address-cells = <0>;
 		interrupt-controller;
-		reg = <0x0 0x11900000 0 0x40000>,
-		      <0x0 0x11940000 0 0x60000>;
+		reg = <0x0 0x11900000 0 0x20000>,
+		      <0x0 0x11940000 0 0x40000>;
 		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
 	};
 };
-- 
2.34.1


