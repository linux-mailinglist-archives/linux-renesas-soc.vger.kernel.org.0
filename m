Return-Path: <linux-renesas-soc+bounces-22226-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9412DB966AE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Sep 2025 16:51:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59902167981
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Sep 2025 14:46:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2C3526D4D4;
	Tue, 23 Sep 2025 14:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W3oiPW/a"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00D9258EF3
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Sep 2025 14:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758638737; cv=none; b=Y3vHsV4p8x2hx7NjDX1v+LeSEQG3dSgI5NbDCW7y2s+HmiGTyoFEk/C8MXdpUpBU6Et7l9HkTOPfd/edb9/uPZ+WuvCg9/Q8YCTzg1/yH2tONaL3TWhMSD8XSS6pXuDZwZanCEmeNLRJgSsDd8FJaY681VbSdCZDt9DMW12yLe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758638737; c=relaxed/simple;
	bh=PC08gB/w+egRp5QGS5q1tZdtfmPuAMJz7z2nsCmwUpE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IdboaPE89JJC5L9JHE5QizSROIfBSbAdmaF2GFU1HjzBqHasb8ciWxJ1KxqAVoOzl4G7qgbQTSpDhNeG1/swI5Rpxcd3C+wcrMX7wFbqezuGfaSZNPBulsI3hvLDRwCydevRDv2dBiKtmqwgLfxx6erOAROd7r1/V3/ozMdGo6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W3oiPW/a; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3ee130237a8so3206783f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Sep 2025 07:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758638732; x=1759243532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G80ItpmxJpnUoRL/kfIZ5sW+AOj0ITPN400GcF79LCE=;
        b=W3oiPW/aNZXRC58A1Awz7/eORgFUQuDw0pu0ykMOp6TK0ItOs0+bB3wBIFLbxw2kTv
         YovNxUXvltX1ca7PEC7D2P+cYWrLv/QALAWbTCw4wL4av4yQdPnV6qSKf2X4CrzPNr9l
         8Ez7kF3IYIneb3JL/hUiyITr5j7Q7oLxCplZVPVFtTIs6xiYJw79PJY4XvoVz0m6+iZp
         cTwl6bjcNL4YIzxN5GJXcjqoVw/DY+R+fzAXblBb8eM1GZLS+i0ZNwyiDDo7yKJ0RVOX
         suDDDcD2LDG/gyK73Fzg3K84a9CQV8x4HtYK/Aqz3pBzbHYCkqQk7uYMdKZJ9oVGXHK9
         IVhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758638732; x=1759243532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G80ItpmxJpnUoRL/kfIZ5sW+AOj0ITPN400GcF79LCE=;
        b=X7w2xEn1rDHNf+le1GXQfrkzcL+DIeaSFWbOtPBl7Nz1ShbPq1c4GGN+AJOr36I/EL
         9KjzPaSlw142Hu89Sxw5iJcw6kK7Vg3Hn1VAou7+PBVopVMzGbfO6Vg5PpzJFtHgQYSG
         2CWYvpSryFWuFbSA5Wk7YSlZ13cL9/Ypx3NTQmuXCrUdyJuoLqxbeSldaFlTqb85wU0y
         wGZx1XOVIWmY9Fh5cRFHLAMEnl4pP3GsbgYF3YvbVjiDOtMKTSbgmcWPYeIO+MEODTan
         kD3WMSzp8BrXi1gkI+pU2nvqWcS6tvCnu3LEmwH/ZX3ilWpqWTEvyeMIioBNbNRdQOcV
         SIjA==
X-Forwarded-Encrypted: i=1; AJvYcCU41rzakkV+lZvvNpJ94zVC8QR1T2nfl5z1W3udkVJZUYd21rbzBpt5d7Hp4Kzo+3EI41KTk2P9tVr3my5mkmoOGw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz+RehV2lo+4G+mNdUUxFHo2c57tBSt7/RD4sTc6xOidIlr8Gt
	wv8/gNIRiB1bB8eTNeMW3PrJuaWlaKgKhH882+zug38oc5kQUh3ddokY
X-Gm-Gg: ASbGncvMbH/Xakgltgc4NAT+ovLCVFDoqMV82zJ+3i8Knz5WVFcmgsI6eG0JRr/czeJ
	pBQxhUKOS8lZV9XvPc06mQYJhW5+5gHA1bLp1Ipx1lmHXUCEEsMcwDgOKUf6tJUmPq1+L0+FGVW
	dzmM+fB+qVPowm/l+rl+UdxthMhWoInAMKWibTxKwcUNBzSHyX4D0Hftis+15H3Vzt6Xhsdw2lR
	7U7mOIm6K5PsIWa6KvHBrdPOudUDK3anLFz6nnLsNnzjsL0No2Uu//sMhxPlOR7XaLAXIVWFmEK
	DaeFgv0NF6iSWX3s+Hb0am5OfS3KYilxtNdrtcqYut1vcdDPJqiDDdd0P26f0xn2+28DjajDK5y
	1/gD4WEnFSkz9jF1nat/ppavR9+GH252XuioU8OoBnypzmo13U9+nWbYklFLdvCFLzHhvZCFMZ+
	NBWw==
X-Google-Smtp-Source: AGHT+IGYJqg3g59q+kGLJJp06XQ1vqNuniExnf+RSDw2EEI792G/PGnzGmPNDfsYQ83ycJ6V10rFpA==
X-Received: by 2002:a05:6000:2907:b0:3f4:a9f5:c10e with SMTP id ffacd0b85a97d-405c9352242mr2984554f8f.36.1758638731818;
        Tue, 23 Sep 2025 07:45:31 -0700 (PDT)
Received: from biju.lan (host86-139-30-37.range86-139.btcentralplus.com. [86.139.30.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-464f0aac3fdsm238940435e9.1.2025.09.23.07.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 07:45:31 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 7/8] arm64: dts: renesas: r9a09g047: Add GPT nodes
Date: Tue, 23 Sep 2025 15:45:11 +0100
Message-ID: <20250923144524.191892-8-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250923144524.191892-1-biju.das.jz@bp.renesas.com>
References: <20250923144524.191892-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The RZ/G3E SoC has 2 GPT's.  Add GPT nodes to RZ/G3E ("R9A09G047") SoC
DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change.
v1->v2:
 * No change.
---
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 184 +++++++++++++++++++++
 1 file changed, 184 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index 47d843c79021..73331874b57c 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -587,6 +587,190 @@ channel5 {
 			};
 		};
 
+		gpt0: pwm@13010000 {
+			compatible = "renesas,r9a09g047-gpt";
+			reg = <0 0x13010000 0 0x10000>;
+			#pwm-cells = <3>;
+			interrupts = <GIC_SPI 538 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 546 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 554 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 562 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 570 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 578 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 586 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 594 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 539 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 547 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 555 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 563 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 571 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 579 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 587 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 595 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 540 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 548 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 556 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 564 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 572 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 580 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 588 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 596 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 541 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 549 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 557 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 565 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 573 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 581 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 589 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 597 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 542 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 550 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 558 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 566 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 574 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 582 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 590 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 598 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 543 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 551 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 559 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 567 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 575 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 583 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 591 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 599 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 544 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 552 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 560 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 568 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 576 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 584 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 592 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 600 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 545 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 553 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 561 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 569 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 577 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 585 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 593 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 601 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "gtcia0", "gtcib0", "gtcic0", "gtcid0",
+					  "gtcie0", "gtcif0", "gtcih0", "gtcil0",
+					  "gtcia1", "gtcib1", "gtcic1", "gtcid1",
+					  "gtcie1", "gtcif1", "gtcih1", "gtcil1",
+					  "gtcia2", "gtcib2", "gtcic2", "gtcid2",
+					  "gtcie2", "gtcif2", "gtcih2", "gtcil2",
+					  "gtcia3", "gtcib3", "gtcic3", "gtcid3",
+					  "gtcie3", "gtcif3", "gtcih3", "gtcil3",
+					  "gtcia4", "gtcib4", "gtcic4", "gtcid4",
+					  "gtcie4", "gtcif4", "gtcih4", "gtcil4",
+					  "gtcia5", "gtcib5", "gtcic5", "gtcid5",
+					  "gtcie5", "gtcif5", "gtcih5", "gtcil5",
+					  "gtcia6", "gtcib6", "gtcic6", "gtcid6",
+					  "gtcie6", "gtcif6", "gtcih6", "gtcil6",
+					  "gtcia7", "gtcib7", "gtcic7", "gtcid7",
+					  "gtcie7", "gtcif7", "gtcih7", "gtcil7";
+			clocks = <&cpg CPG_MOD 0x31>, <&cpg CPG_MOD 0x31>;
+			clock-names = "core", "bus";
+			resets = <&cpg 0x59>, <&cpg 0x5a>;
+			reset-names = "rst_p", "rst_s";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		gpt1: pwm@13020000 {
+			compatible = "renesas,r9a09g047-gpt";
+			reg = <0 0x13020000 0 0x10000>;
+			#pwm-cells = <3>;
+			interrupts = <GIC_SPI 602 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 610 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 618 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 626 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 634 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 642 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 650 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 658 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 603 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 611 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 619 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 627 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 635 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 643 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 651 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 659 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 604 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 612 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 620 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 628 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 636 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 644 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 652 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 660 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 605 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 613 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 621 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 629 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 637 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 645 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 653 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 661 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 606 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 614 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 622 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 630 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 638 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 646 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 654 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 662 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 607 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 615 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 623 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 631 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 639 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 647 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 655 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 663 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 608 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 616 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 624 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 632 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 640 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 648 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 656 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 664 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 609 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 617 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 625 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 633 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 641 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 649 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 657 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 665 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "gtcia0", "gtcib0", "gtcic0", "gtcid0",
+					  "gtcie0", "gtcif0", "gtcih0", "gtcil0",
+					  "gtcia1", "gtcib1", "gtcic1", "gtcid1",
+					  "gtcie1", "gtcif1", "gtcih1", "gtcil1",
+					  "gtcia2", "gtcib2", "gtcic2", "gtcid2",
+					  "gtcie2", "gtcif2", "gtcih2", "gtcil2",
+					  "gtcia3", "gtcib3", "gtcic3", "gtcid3",
+					  "gtcie3", "gtcif3", "gtcih3", "gtcil3",
+					  "gtcia4", "gtcib4", "gtcic4", "gtcid4",
+					  "gtcie4", "gtcif4", "gtcih4", "gtcil4",
+					  "gtcia5", "gtcib5", "gtcic5", "gtcid5",
+					  "gtcie5", "gtcif5", "gtcih5", "gtcil5",
+					  "gtcia6", "gtcib6", "gtcic6", "gtcid6",
+					  "gtcie6", "gtcif6", "gtcih6", "gtcil6",
+					  "gtcia7", "gtcib7", "gtcic7", "gtcid7",
+					  "gtcie7", "gtcif7", "gtcih7", "gtcil7";
+			clocks = <&cpg CPG_MOD 0x32>, <&cpg CPG_MOD 0x32>;
+			clock-names = "core", "bus";
+			resets = <&cpg 0x5b>, <&cpg 0x5c>;
+			reset-names = "rst_p", "rst_s";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
 		wdt1: watchdog@14400000 {
 			compatible = "renesas,r9a09g047-wdt", "renesas,r9a09g057-wdt";
 			reg = <0 0x14400000 0 0x400>;
-- 
2.43.0


