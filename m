Return-Path: <linux-renesas-soc+bounces-19524-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C70AFB02AFA
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 12 Jul 2025 15:39:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F03CA42E74
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 12 Jul 2025 13:39:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A829527701C;
	Sat, 12 Jul 2025 13:39:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056A51D432D;
	Sat, 12 Jul 2025 13:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752327582; cv=none; b=WUyIg58kXC4NVHgwLFa+SY8s+6DaTfwLR/uGo1lGOH+0GfB21UdrtiSymRl3dPbnc7kmven6YHF+700B7GvIjNgP5mQCoFcZS5gcmb4wWfQwU47ECQ/oG6wtOxvcwmW/gGcTn+JLC66nFTcIEu4ak25FBCD6VpOvizBJCa8Do+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752327582; c=relaxed/simple;
	bh=u9zx57TnrBPJ8F5MZvJq2+biYZuzDTz3QrCOe9qU0JM=;
	h=From:To:Cc:Date:Message-Id:In-Reply-To:References:Subject; b=Dth9Fowq1Ct42xTMjyDj9vTvgas2FjNtvL5ZGMOXi6JGfpTUAn3Rcx8HeONdOe9Xa/kPE0+meNw/KicP4uOyJI7mmjcmA764PeHGa+3kTf6lDqGjkbMoonnmPdO6abppfLXocUNLXKQuwIRt3Z7/H+CyR1T3zoTXn1vyxP94HOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=opensource.se; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=opensource.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-702cbfe860cso29445256d6.1;
        Sat, 12 Jul 2025 06:39:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752327580; x=1752932380;
        h=subject:references:in-reply-to:message-id:date:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5AdgVL68d2XQy17lj/f/7mD7Vpcx+b1HnxbVl8cksk4=;
        b=cYpJWqw7S+jyAth0OcJWuuIbFELyWSSo/NY6r8Sfgk81gg5HJ+UqaRI/02ZmIv0jlE
         TuNeCCp/O8O4pqi/eEUaBb9tdnxv8P9dpTvgqrBuRryWyUyENE3NdDvNM47eDhvNpy/v
         YVZiCd9q17Pf28WINRm5x8EpmgySx+rZpm7CIjDep/RGFABhsNZYr5rweqvsSCGXhsFb
         teMzGdtHNq0Gc/75da6Mo5our7SN9v2VikYr5A9jOeriMdy4cItvWud+yStwqYxrnV0S
         KgabuaPS3HebbRuj+X5109E9hQu33wuvwk2UrADk9l4NbENcbV8MgXzM+I7cCRlkneI0
         5tgw==
X-Forwarded-Encrypted: i=1; AJvYcCUAxBp1yki+x5puTdzV10dHkKhwGx8steeTObNWZ+0UMcb/iV/gp1v3CxcQrSa3+Frmw0OZKlX44QGaftFW@vger.kernel.org, AJvYcCWsfi81P6vXGMTo6EUXkPngARwJQAf5JxqMO0+wKmt2QHlXx/qoHQU40L/FfOMTHhy4jcmiAMmtzI0T@vger.kernel.org
X-Gm-Message-State: AOJu0YxIuZEslrGHNW1nRYPs+dua3dPHFzxDEiScZ5LsBfJZWvaUfhNQ
	taO1f7LXkXNoNU14+6+/FpfiEkZhlTWDU65qE4rSXKBE3cYsDvyvHrQ2HSzEG8p7
X-Gm-Gg: ASbGnctFwa2UB71M/5foEGMyMc9sBelZ84wdPFD47v56OVftjZLRayh11yYTlOZrcKC
	WBjmxbgox3QD2X+ikYhVGFdUbZexKEOPAN6mljl2pJDrkxOI6j0jpEbBgXrSg9onVRSUJO0cNU8
	g4RxVxdt34Y4TdHgh/chGd7MquU295dQDMMDPTsQyXDhgEG1WNyfZ+Jmd77TZnK2e7zleKQk694
	2n8gAe4dJb3RgOS8P3+9tboYrurNzNDQ7UI40DME5hYKTTHWDpwhugQmxDKPva7cc1nxO0BzZFq
	p7GU4x21ljvUvROhktFW7nrtm0zIcBILAK/6vO58KuegFiENRoyD7qqf4EsjiZzn6y+c3Kq7aUZ
	HflMK8CkBzCvGeAvAHaaPdrFCkiUEOi4m2kZTH2wAA/c=
X-Google-Smtp-Source: AGHT+IHNnXBHuernCQ1zkIZVsfLQBFWHISI+wjYQpOj4WyfqGN5i3C+JSKSbeh8pGhK27zmEbGhdsw==
X-Received: by 2002:a05:6214:3909:b0:704:9275:a7c7 with SMTP id 6a1803df08f44-704a6f0a0b2mr97974166d6.2.1752327579756;
        Sat, 12 Jul 2025 06:39:39 -0700 (PDT)
Received: from 1.0.0.127.in-addr.arpa ([167.99.4.198])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7049799eaa7sm29255286d6.7.2025.07.12.06.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jul 2025 06:39:39 -0700 (PDT)
From: Magnus Damm <damm@opensource.se>
To: linux-renesas-soc@vger.kernel.org
Cc: robh@kernel.org,Magnus Damm <damm@opensource.se>,geert+renesas@glider.be,devicetree@vger.kernel.org,conor+dt@kernel.org,krzk@kernel.org,linux-kernel@vger.kernel.org,wsa+renesas@sang-engineering.com,sergei.shtylyov@gmail.com,p.zabel@pengutronix.de
Date: Sat, 12 Jul 2025 15:39:36 +0200
Message-Id: <175232757636.19062.13052029764275887520.sendpatchset@1.0.0.127.in-addr.arpa>
In-Reply-To: <175232755943.19062.8739774784256290646.sendpatchset@1.0.0.127.in-addr.arpa>
References: <175232755943.19062.8739774784256290646.sendpatchset@1.0.0.127.in-addr.arpa>
Subject: [PATCH v2 2/4] ARM: dts: renesas: r7s72100: add rpc-if nodes
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

From: Magnus Damm <damm@opensource.se>

Add two on-chip rpc-if devices to r7s72100 (RZ/A1H). These devices tend to
interface to one or more on-board SPI / Hyper / Octo flash devices.

Signed-off-by: Magnus Damm <damm@opensource.se>
---

 Changes since V1:
 - Added reg-names

 Applies to next-20250710

 arch/arm/boot/dts/renesas/r7s72100.dtsi |   24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 
--- 0001/arch/arm/boot/dts/renesas/r7s72100.dtsi
+++ work/arch/arm/boot/dts/renesas/r7s72100.dtsi	2025-07-11 04:05:21.133946837 +0900
@@ -315,6 +315,30 @@
 			status = "disabled";
 		};
 
+		rpc0: spi@3fefa000 {
+			compatible = "renesas,r7s72100-rpc-if";
+			reg = <0x3fefa000 0x100>, <0x18000000 0x04000000>;
+			reg-names = "regs", "dirmap";
+			clocks = <&mstp9_clks R7S72100_CLK_SPIBSC0>;
+			power-domains = <&cpg_clocks>;
+			num-cs = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		rpc1: spi@3fefb000 {
+			compatible = "renesas,r7s72100-rpc-if";
+			reg = <0x3fefb000 0x100>, <0x1c000000 0x04000000>;
+			reg-names = "regs", "dirmap";
+			clocks = <&mstp9_clks R7S72100_CLK_SPIBSC1>;
+			power-domains = <&cpg_clocks>;
+			num-cs = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		usbhs0: usb@e8010000 {
 			compatible = "renesas,usbhs-r7s72100", "renesas,rza1-usbhs";
 			reg = <0xe8010000 0x1a0>;

