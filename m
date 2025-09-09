Return-Path: <linux-renesas-soc+bounces-21620-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D82EB4A70C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 11:13:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D1B0D7A36AB
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 09:11:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A88A287274;
	Tue,  9 Sep 2025 09:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lAyjkPS9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D15928506B;
	Tue,  9 Sep 2025 09:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757409156; cv=none; b=YpWKx33shXYd8p0rs6D8voffhhKsKRVPBoE+4ogajMg/Jxik+nfmwGKMlsj85WniWKf1/7ypZS2W7JJxaGyG++vzLwKKf/VcPh7uIlttVGJsJl6D8CsVIih1vLRZ1K1btQRl4mRt4p0l0WdUlvfyU+RcP2SD6P82HvpcfQKoyKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757409156; c=relaxed/simple;
	bh=mLf9OpMUYcOZDIzI4MR9qZyaiUbLGDA+EeC/cLBWgKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZIEa1hUAF5aWjJhBCTKf3+i1GDP28SlW68zXSW5P7MKvOn0MOb65aMF+vulPVwYijT2n8AR51INNvRSm0SsLHIsrkM2eacoI/Kay2nIJSdr9h80EhsYaTjWTcyQzNjNKbg++d64MyGfR03j1NinFwIZb4mFdKoqYT8Q7AaSMBmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lAyjkPS9; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3da9ad0c1f4so3735892f8f.3;
        Tue, 09 Sep 2025 02:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757409152; x=1758013952; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ogf+02xjtKovVBhoXWpla27bMTyHlpze7CEeR3vrKsI=;
        b=lAyjkPS9jv2KYvacidIVTgvvP6oBJR9HJXocThwJz0wbFhd8Y1mxy9HhClhkQ2anyK
         emYgoyq+/L/KeWblFFI5PFOfzGrxmWK0eaQClVL/fzyiuKXH4ANA8F3qy+Cql8fuGHe6
         wwmK/sTkGzgpWo5rtw6Y3mqr15F9CkWw8osw3BbFKe3OatUv4zFKVxlWEWq+uOjQLxsm
         VY5bmddTXjApaYYiejwM1A9Q98rQeQuDOxv4FzXAyVf6va9CyCKe6R9bcj+434WNkTsy
         V7BpPOMsJQsVcWFIMf5oSr/jOSyYhPL58f23AkU/hVaLFH4Lzm3Q7UdsBDI8e4uLZCiF
         efcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757409152; x=1758013952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ogf+02xjtKovVBhoXWpla27bMTyHlpze7CEeR3vrKsI=;
        b=hD5JOfOg3PHyxniR8tIdI+VTV3a8EC1Mqv3gNM00jmzbPu/LIE6G7Js7a3Kuomu+T8
         JDSqtUOUV0ve0amW6fjvl993fHVPymlcIx8Q+UJ4RYgg7jPBeQk/H1zkBnwzXtVSOg4L
         yCJGZboA477kcvtp2hNpB4YLC8z32e6BxoIHduLrjPhJQO/qeR2EUc3mNQMG+mPLL2tn
         f5TWeYAzzfRJCMr7p8yokEhnZ/7D7c0Qq4OR1g3I6PSBOvJh7XR6VwJ/bgD20nP8fGBR
         NtD5FELlZba7T2nxBwTSsDIs+FndPpHgkOM2AJl4XXaOmjA4pWbcIk5ZHmzcBoM7WGaJ
         NmCg==
X-Forwarded-Encrypted: i=1; AJvYcCV5s4t+dhLBNfI5kzXUz+2fsuAs4xJlzKjOIrg+QwkCgW78e584tyfekhE1fqTUaHM+VWVxwqk2/1tPvFfrZcFC+0o=@vger.kernel.org, AJvYcCV8z2SyE3MhDGUr9Qja+AVOvBf8suZhD0PP4H5H+d8bRQFryFsZgyw5zhSWGCspkm8Vuqni4eT2LKz/@vger.kernel.org, AJvYcCWkEJrK3Ai1mcDPWVMtNcfS7kESrYKrCo/ygV64e/Wh5MTflkgBvuctrSjqSEicyVCuhN9jdmGrU53fsOXv@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7FFbuYytREfxLKsgOX+hgagsE/fxulu2QvtzhmmGoC+/CLqkf
	B1qCae5a/qmBYSDC8Ba6Q8olvk5supcKSj/iHA0GuLMy5sNj8spmN3fSNcmwD4Zp
X-Gm-Gg: ASbGncuybMBAOTOIetLfhwzPOCPIccBgeWusjd6yGoeTwU/Yi5ubuRvnS6Lp2FyGGl+
	NG9Cbh1i3qGtiDyM3xOVHwID9S89ecfwjbYKBHf0W5C+VMAk5sVBpsRhvUilQ7omwYjEQoGUj3K
	47pL78rWsB4S7xqqKXNPZsDBRqH0PtG3ClhM2CAWIoAeV6BpoQKOv1U7/BDi2bcJGqZY1K87QAM
	32pjDrHV1vQXKZ9GeHQP07uSJWqORwn3J0YvWL8LX4k7Mmk5K1HrKUS7o9FWFqXVfKTyFN+Wc6M
	BpB/idb0jS75Iza8DKws8UfSMld/OHhxcU4wIdSnZPmbal7rgO7TTKH+1lmcFspWbqq3fODQV6G
	RLaOwJLhDlc4LlP8a3XomurDZzvlBtXtb7r0VMbfaB2nYrmaI5Kaigm89tOfiPRgiV8+oK5EqcB
	YHJA==
X-Google-Smtp-Source: AGHT+IG6OEh7Zyg+WI3rIwT+ACl1ZBMz4BqRB3tVlPSYyPSExs9+6qrqpv1ZPqdCYIFkFIN9aji9Rw==
X-Received: by 2002:a05:6000:3105:b0:3e7:5044:4fee with SMTP id ffacd0b85a97d-3e750445599mr2082958f8f.24.1757409151852;
        Tue, 09 Sep 2025 02:12:31 -0700 (PDT)
Received: from biju.lan (host86-139-30-37.range86-139.btcentralplus.com. [86.139.30.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45deff68b43sm6975685e9.2.2025.09.09.02.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 02:12:31 -0700 (PDT)
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
Subject: [PATCH v2 7/8] arm64: dts: renesas: r9a09g047: Add GPT nodes
Date: Tue,  9 Sep 2025 10:12:17 +0100
Message-ID: <20250909091225.128658-8-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250909091225.128658-1-biju.das.jz@bp.renesas.com>
References: <20250909091225.128658-1-biju.das.jz@bp.renesas.com>
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
v1->v2:
 * No change.
---
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 184 +++++++++++++++++++++
 1 file changed, 184 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index e5b24e46d645..95d48a6fb7ed 100644
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


