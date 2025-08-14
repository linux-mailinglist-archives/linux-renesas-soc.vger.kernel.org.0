Return-Path: <linux-renesas-soc+bounces-20543-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FCBB26F2D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Aug 2025 20:44:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E0FD23B5634
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Aug 2025 18:42:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6540F29D278;
	Thu, 14 Aug 2025 18:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iYHJoNzY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36946239E9D;
	Thu, 14 Aug 2025 18:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755196885; cv=none; b=H7K1p4HHEbeI0TJ6a8ww351IfctnOKnMpYv/ebhZFjH60/sYD91IMb5FeHE8UhUNNgvJd5pkw684yfCGFqVR5pDNUwtAKUnq4QtZ8yaPNFF4JPtB4g1Z6yx6ebvMndpDyVmC2TMpeCEf2MUj3bBrGq5TbiytqxRvCFhOLZzXv6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755196885; c=relaxed/simple;
	bh=xvR3TsK62JtvHesRS90geQ7W0CpLMgQstB8ZNQnfZ1U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BTYvX3W5kNzXjS2KB4lNy5/Oq1xchsXldw0iCzWhAO//XfpZPJDWmxDI3wEI7ZKYGxHNUqgnRmuNfviW2ev8J1kXhbQpNYbCtGdHgEDsOF6DQG8D92cKJ5D14h/K3o02I4KEPhXtJXLwEx5X+tpcxvDCa835BGOmk+t//TCI+Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iYHJoNzY; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3b9dc5cd4cbso947410f8f.1;
        Thu, 14 Aug 2025 11:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755196881; x=1755801681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NKWqikBV86gt6LNr+VLwEoTNrpwy45Hxqzp4t9ZmWN8=;
        b=iYHJoNzYwh9ziJpso3k2RAffuzl5WIbl9YvSXugV1OudzQXI5TL43gonbSNFdvtP/2
         ZPqEe/5zc0JPAGp6CVM9aEo7svr7RIppxbyZF/IUBaXgBsz3x8ovdPOIHg/kySCETIcJ
         WoqtxBAVXQN6Eq860DqLNg5GTt71bEV4OwiJg5fXYf8l7wkQqFZQ7oxqcfMTUw/Dp4Ze
         l+vDJ00oqcpGBx/bW1H1gVq8JSn/DaH742vSbR8I2kxSqVF072pCIEYKkqmx7XTaiZiL
         osslSJEKCHrNAuymZ80qMzHR+/XftgJ/FG2r6WVRNI4yhK9c+GA2s46MbnjUXADHBkWO
         gGbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755196881; x=1755801681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NKWqikBV86gt6LNr+VLwEoTNrpwy45Hxqzp4t9ZmWN8=;
        b=JTHjqmynPN7ixHgcROx48hh978ZXdD4Wt3kmjPWfYpF+hfX0LrIQApbYeZuFsoN8um
         5LX8s6WYF6xgSCpl7TYjbxUI3xFSU3pkhgxJyY6cNhX1IdoKNsfxmI+UApgBm4Fm+i7w
         EwtPskgEoGZSxorsbW4nm1UR06q94IBjbdJpI6zmqOodY3SV3StoW2zqOWfxD6v+iPSn
         i+pS0oPU2kfXjaHQVdDzcL7Vm1TZcaQcO2kDMp7CPvT7aJkKBjP10oP6yabAaI1I7SAy
         VcKftM/L7GODCc03BuZHT+R276CRB0/x4qR8sADnkPKv051A4gn2CIfr0B4wi9G31oDd
         +gWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPPTmeqCmi7EBXcgeGuO+aCpBrzJQbFHqMkL8rkKBoCspL7mTSefnOk3N2WOjIetHOPpKHzFuboqvc82Jl@vger.kernel.org, AJvYcCVQpIBPJU2e23Js6KGMuTjApUWQgwpTDq3fYAlEgm3OcojeBxNb8IGgb4Bmcl/6qWL5t8VKKEdjmCvHqQbwvy/SyJc=@vger.kernel.org, AJvYcCWHU2plqunmsJsxfJWToEV4rX9/WcRlUgUfc6kCbywiticM/VvzpAei3ldHjKaiWA83fEwKuNXNIyOz@vger.kernel.org
X-Gm-Message-State: AOJu0YyjyQ0MzkPDhT2iGe4feB98V4KSaXaxKWdFcHym2Qj6DReXviOD
	yjIJl31vRXQow/p+kuhDgtiRFWFZd/Ba/TmeEZOUEHcjFXSrDhlp6d/zSyLEF9KcfYI=
X-Gm-Gg: ASbGncu7HxXIyGWEgXGvfhe7eIIn9LhgaZuYzbsihuQqYPEOG81YEjIM7CUvWvTgq5n
	VMjSSX8BBRvKMroOXlAXFgjF9Uno/9rRvHFjAk6n3Pnmjca48L73matuP3Sv41aWRpR1x5oetF3
	RhZn7lQCucxa5d4fOw8ENMU6r8TwYzW7w26HVWWGt2VexsOiDpNtGhiGrbj1mqYt0ZW/1EKNrY8
	g9E2ztmK77nEamzKCe/KbTqdqLxQqlNGXLhI1yMFTpcAo3ZgEKVYYAFl7K72tcCUxYkWWMPMSFa
	THLtj5NkHjABRE3uRDrYVJn3gmhCakxzQX6eInVju/T9wRTT90DBwkmf6mvoociezDnrRQohVff
	8hFRhEjxtcug6usojCyAmQmTifHQZ6MtTv844P5FfwYgX0E1jksioe5yDtptDtFWZqcKAnTf0h0
	yk0K4Pl7kH
X-Google-Smtp-Source: AGHT+IGvHzc75mh/OkQN1oMT54n9zn4caG1bYfChjsKl+MmItlP3r8mKEM/OKC3vvWlowdAIbOv+/A==
X-Received: by 2002:a5d:64cb:0:b0:3a5:243c:6042 with SMTP id ffacd0b85a97d-3b9edfcc6fdmr3689691f8f.2.1755196881413;
        Thu, 14 Aug 2025 11:41:21 -0700 (PDT)
Received: from biju.lan (host31-53-6-191.range31-53.btcentralplus.com. [31.53.6.191])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c453aeasm53744383f8f.40.2025.08.14.11.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 11:41:20 -0700 (PDT)
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
Subject: [PATCH 6/7] arm64: dts: renesas: r9a09g047: Add GPT nodes
Date: Thu, 14 Aug 2025 19:41:10 +0100
Message-ID: <20250814184115.192930-7-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250814184115.192930-1-biju.das.jz@bp.renesas.com>
References: <20250814184115.192930-1-biju.das.jz@bp.renesas.com>
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
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 184 +++++++++++++++++++++
 1 file changed, 184 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index eeccd1345f71..0e6867ad112a 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -552,6 +552,190 @@ channel5 {
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
+			clocks = <&cpg CPG_CORE R9A09G047_GPT_0_CLKS_GPT>, <&cpg CPG_MOD 0x31>;
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
+			clocks = <&cpg CPG_CORE R9A09G047_GPT_1_CLKS_GPT>, <&cpg CPG_MOD 0x32>;
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


