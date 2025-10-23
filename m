Return-Path: <linux-renesas-soc+bounces-23546-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCFEC03852
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 23:23:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 529223A167A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 21:23:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4E3926E6EB;
	Thu, 23 Oct 2025 21:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dbQoZqYr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677F6296BD0
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 21:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761254613; cv=none; b=QsSDL/LH3kgxy4Q+64oAMRSErLwNPkzJTK3JYWXQBIJmnyIQuF+8BGxRCWtR9U5ITvch3xQWKcEx+qvUV/d1Wv+gTAsqh2bR9YF0GFrzCxpkb4XqeNOsdXNLyC63/pismTmKV69BwCfMSw79W6UghWskP1CSaOi5WcszipXEIxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761254613; c=relaxed/simple;
	bh=iP4ZDFq1INSnx7yBwMuJweZZLqEC/SAU2vNsxpWXv68=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hcQnAeAS9JXKxubfxEPRM2Tcsh3w17+Fm9RpbtPT9gaCZJBALLFIBy3IHif1HXKRUw2l03QB16K20xMjVcMtmfClr7Pv8jl6aXJGO6XNttnbOyDuEimh7kSS1J67se1Gc/RM/pi+PkJ5XWGLdk0ayjPURaETne9peN8s24eaHuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dbQoZqYr; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-290b48e09a7so16253955ad.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 14:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761254612; x=1761859412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z1seM1hvIEshn8BU43E+5LBK4A0vgUOVZMlNQ5n1LMI=;
        b=dbQoZqYrFqiXJViTr3yNsPvlf7xA030Km9P7gjLVN+sT0ZKLWyfSbwiE68kyZLo+5U
         1XABI+kvvkCIZ4XwRdmSb2LUkNV4y91Y4v5Uap0F/fDPhs/bII0DSbh7NDubD6plJM5M
         fblk0IGA0JceRQPVbkSuAHmPc/shETJ+y+J+gWqZ7d8A+RKW7nd76uwHN3GtqcQP3qG+
         RHGO5ctJ9MtK7ytkSc+0QFlKidVLpObrwb4x2+YvIwByapf0RUKJvcGG/3XqDE3+mfEs
         /qd48uTpFcSwOYK1vbP/YSbkGcgmlMhvmEz9034xDe1+G6tdQ2rHStn3B/MKaTWfKwO2
         ED+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761254612; x=1761859412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z1seM1hvIEshn8BU43E+5LBK4A0vgUOVZMlNQ5n1LMI=;
        b=oYZzHus9c4F3xEoNuoN7RduO0LCcSuVxxN+9iuZXDGOE6H+Bvt/7kJjGU4YghMYSBS
         e09qdFIGZ2nd9nBvbm0k/ZiKL89yb20YyixS7MQbDjXJYG+yGTipw295UoLVwFT0A9Tn
         Ko59AINy23M9QR/3Xbz5NiHBUBfOfA+QwXo3f0cE8lTBzGx03BRx3PgMVWy5gl7ZoYFu
         +zotFkzFqkbQ6pvGL1+VuDvA8X24FqMKW4rEYYzLO/kFZi4vZ/fyqZqd0ylNfT+pYbNQ
         5wRnXiobYmyjS6B0AJ+EzMjhSYX6KqfBTxqAJQTs5miHMXv9JgSJATKb6+5W8QmJxJLl
         e2mQ==
X-Gm-Message-State: AOJu0YyYt4FWY4mEXpUnDq1K0VMY8wQIQIBv2cz1wMAOZ3eFUSVlK99u
	Ocrinn5BlrLl1RlfFdnnxnkIEYqVzDKsnfEXk3WyVFjqYQoj2SzadC1g
X-Gm-Gg: ASbGncsPi1g5Pjmq+dpjP7ubSCFeIaw0vmAq1ugOzslFiPMEN08KLQDPzVT8x3+mbyn
	Bp0RR8ykjIc7xqa6QQfsAZ1Nb5YlLeF/XmCuxLKufppuUkvJGlfyQSUgSxPvv+jBrs1V+UzTtzu
	T6eQP1tgIpUdhEoIi5d5t6UtRkUGDQ/IG2aYWbmqAl442TbqPv3p+09CvqvSCKCJPHMSjF8XvDw
	/q0++N8QqgopAhTOv/fJ7mrA56y+niNMsipRRahUkg9JZPyg3P3rdglcOclqPyUAj/52hppQAUK
	NmI3ZaMTA4Qajf5wsYIlkDtokcRTbqmYlwnEqq+fLUkRftdWQJmAIok851WXGcJLWqU9af2EuFf
	uRMdUcIPL7FXvTyH5ablCdXn6EL1efKAgmbL3jjnFw5BmeU2f1KG/keXN3NMhqnKMZJPF+RjaZU
	7cG5ojhhmeDjInnN1uvw8qxgpX5ARdYQ==
X-Google-Smtp-Source: AGHT+IFQHRcbnegoHkxRL5BKLxnCZvQirOZChcfqu9A1/v4tEA40NBThc5X1UaiPmXR/ffXmqbVk8g==
X-Received: by 2002:a17:903:1248:b0:24c:d322:d587 with SMTP id d9443c01a7336-290c9cf3facmr318282275ad.26.1761254611807;
        Thu, 23 Oct 2025 14:23:31 -0700 (PDT)
Received: from iku.. ([2401:4900:1c06:ef2:36b5:9454:6fa:e888])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946dda7949sm34306965ad.3.2025.10.23.14.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 14:23:30 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
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
Subject: [PATCH 1/3] arm64: dts: renesas: r9a09g057: Add FCPV and VSPD nodes
Date: Thu, 23 Oct 2025 22:23:12 +0100
Message-ID: <20251023212314.679303-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251023212314.679303-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251023212314.679303-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add FCPV and VSPD nodes to RZ/V2H(P) SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index 40b15f1db930..47b3502846f6 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -1303,6 +1303,30 @@ queue3 {
 				};
 			};
 		};
+
+		fcpvd: fcp@16470000 {
+			compatible = "renesas,r9a09g057-fcpvd", "renesas,fcpv";
+			reg = <0 0x16470000 0 0x10000>;
+			clocks = <&cpg CPG_MOD 0xed>,
+				 <&cpg CPG_MOD 0xee>,
+				 <&cpg CPG_MOD 0xef>;
+			clock-names = "aclk", "pclk", "vclk";
+			power-domains = <&cpg>;
+			resets = <&cpg 0xdc>;
+		};
+
+		vspd: vsp@16480000 {
+			compatible = "renesas,r9a09g057-vsp2", "renesas,r9a07g044-vsp2";
+			reg = <0 0x16480000 0 0x10000>;
+			interrupts = <GIC_SPI 881 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xed>,
+				 <&cpg CPG_MOD 0xee>,
+				 <&cpg CPG_MOD 0xef>;
+			clock-names = "aclk", "pclk", "vclk";
+			power-domains = <&cpg>;
+			resets = <&cpg 0xdc>;
+			renesas,fcp = <&fcpvd>;
+		};
 	};
 
 	stmmac_axi_setup: stmmac-axi-config {
-- 
2.43.0


