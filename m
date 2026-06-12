Return-Path: <linux-renesas-soc+bounces-33936-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lcHNCmcZLGqTLQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33936-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 16:36:23 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C0767A3E1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 16:36:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=WfnQaYKo;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33936-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33936-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AC381325978C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 14:31:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7DCE3D75D2;
	Fri, 12 Jun 2026 14:31:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51ACE3C2799
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 14:31:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781274663; cv=none; b=dEqcqOYDzkfafglYFv4X+aF2rnLehMFQey1EWxAAA20yZusUHSEz/81MHqhRUQLd15sOGzWH2JaoKkJ3nYhphvutOjpNlV+rrISBHfpfrNGxdcDK57/kNqq4h1oQKSYG4vNoCP5/QOikBu0DWjCHrJ6NmDwj5R/DlGAq8rYDB8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781274663; c=relaxed/simple;
	bh=SxTM6VRQ0YMFjzDqrZ6PIDgXoXZRNr5erd8yR6hxoD4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T8Wst/ljpwbVaZ7DLzCn9waIMYaecXvs7s8jU8ZZYA5hj114+wNvOebgCzCmr5HjuCxphDCJTu9Q6WmfQYg3i5I+zxRFeswb/40S7wKDu1kEEt46bhd96bCSrweN64MWuRQMR3NQYQ81HnyJoWuda6EpsBSXCZB9O9FYVrbM3Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WfnQaYKo; arc=none smtp.client-ip=209.85.221.42
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-45ef56d9b67so830058f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 07:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781274661; x=1781879461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3PS6UrnYbPHUhkh2dJtXOKFyRqOtNX0OJoH+34jYxBU=;
        b=WfnQaYKo+sTpVe96cK6qRsK+xzIoIT7VDCcmJX9xQU/2vJX5AFRdgEJ6o6rqaPMm18
         B/FP+OhyB8BHmg4bLqnB7NrOU2l81dRjxcfXcB/kSvhBovajaW+me3XBrm1ktGayCMFc
         yuwLTdjy+sSrBJeCpDOOYre9BWHmFpBdvJ1wLw918Mt3PVxdyXAcTmotROou8yuTGl2Q
         3BY+YLoDITqps4lSgpwMXhbaTFEhwIgwp6X7AqiQJ+Z+95UGWbewQSVRcibrNUtv8j1E
         2f1QSR29UcDvuPV3omEFKR6UelYkQwV+v0ccDBC2gofCM6roXWY3ZrokFuPkIXHmnKoU
         uWxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781274661; x=1781879461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3PS6UrnYbPHUhkh2dJtXOKFyRqOtNX0OJoH+34jYxBU=;
        b=irnOPfi1Z7Y+A4M2k0L1f/ghSLgGJbySOCGcfPD2no72mQYFHpNwA2/voBFNWYbv+v
         c05AbWIpF8u9TAEufofsu0TXAObnIc0dgBeMN4c7ente+5COvTM09fiD8beATe6L/VIj
         sx4VVo0+CkD/xXf0XK9jjYqYdemBaeXYlKzkfwmPT9WePbNtTw3qOx7BVmdKrwycak9Y
         Tp6X8k+ILrM9fvb97Vn+0dlp9lYcidhsck5qZa65q31B5+6hRq19UbjUSGsyPb/7Qg6R
         lWebZiEOg4Yx/qZle+SFpYIZNUFq/VwnLJpcPcuxhBA7zkxKOU8gRqkyAxbnqPKpskYp
         OLjQ==
X-Forwarded-Encrypted: i=1; AFNElJ/bvkmKVDhCHpvOqtB/JziONHxUoWOvlZZtH0Ma0YEndGxdFZVqetplHxyQpEzlXzOPz8lTSLdddbSk+h6vWsL81Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRqECiDB8StnUUZYZ1qhBGGikq0RfgGkg344KlQbOEFnP0h6oL
	1jxlNC1WI7z6wYoFlcQOfPDxElmWVtrwUFUESHACQqEH9RG4Q5QY7wjM
X-Gm-Gg: Acq92OHaVmvB86NYX/ZsBz5sf/A9E/UkGEFd43EKhD133MBYWlGbcGIR5CWhRQFecWQ
	plf7Uow/1OOdV1P+NuS1JCf79MbvpstU6jIDDHmPDj2L03cKxqy7JxxYLqL/QJnYr18psS5cQyy
	ufcyg9ML9i1QjCU4DEUxqsBCh8vK4RW94mfLgWDBK7OeDd4AFzvROsDb0f5xI1QqDJtOF8PqfYg
	7DUj0qYSHhMj6+bB+WpdswXjdJ1z/3cmJq2yOee899bWGWyh1+CDCFFQmrNzFoYZfrwmhYTBUlo
	TkhEqUew9VsKPQH+dUFVP39Efs0sQZAN48sEmsxrzdInJdmVIGKMBeeZAkmFxcbQvtVWdHeVzz5
	ghH1/BUu9LMb8nxavub9IykmMCL9IP/cou/oWOTf61/c3/wNg5pZUWdEHqXex531DcRZFFw06hF
	aYmdq/H2g2CMeC9AdVoZcrujH1aKFOvqYnjto+pZ9395Vm50SL
X-Received: by 2002:a5d:4605:0:b0:45e:f381:cd8c with SMTP id ffacd0b85a97d-4606dba5075mr3406307f8f.30.1781274660401;
        Fri, 12 Jun 2026 07:31:00 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:c72c:50c4:8b28:9a3a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2c3782sm5850016f8f.25.2026.06.12.07.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 07:31:00 -0700 (PDT)
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
Subject: [PATCH 10/11] arm64: dts: renesas: r9a08g046: Add USB2.0 device nodes
Date: Fri, 12 Jun 2026 15:30:38 +0100
Message-ID: <20260612143048.317907-11-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612143048.317907-1-biju.das.jz@bp.renesas.com>
References: <20260612143048.317907-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33936-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:biju.das.jz@bp.renesas.com,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B4C0767A3E1

From: Biju Das <biju.das.jz@bp.renesas.com>

Add USB2.0 device nodes to the RZ/G3L (r9a08g046) SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 103 +++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index 85e409ac8d5c..45aa41467e08 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -1198,6 +1198,109 @@ queue3 {
 			};
 		};
 
+		phyrst: usbphy-ctrl@11e00000 {
+			compatible = "renesas,r9a08g046-usbphy-ctrl";
+			reg = <0 0x11e00000 0 0x10000>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>;
+			resets = <&cpg R9A08G046_USB_PRESETN>;
+			power-domains = <&cpg>;
+			#reset-cells = <1>;
+			renesas,sysc-pwrrdy = <&sysc 0xd70 0x1>;
+			status = "disabled";
+
+			usb0_vbus_otg: regulator-vbus {
+				regulator-name = "vbus0";
+			};
+
+			usb1_vbus_otg: regulator1-vbus {
+				regulator-name = "vbus1";
+			};
+		};
+
+		ohci0: usb@11e10000 {
+			compatible = "generic-ohci";
+			reg = <0 0x11e10000 0 0x100>;
+			interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_USB_U2H0_HCLK>;
+			resets = <&phyrst 0>,
+				 <&cpg R9A08G046_USB_U2H0_HRESETN>;
+			phys = <&usb2_phy0 1>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ohci1: usb@11e90000 {
+			compatible = "generic-ohci";
+			reg = <0 0x11e90000 0 0x100>;
+			interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_USB_U2H1_HCLK>;
+			resets = <&phyrst 1>,
+				 <&cpg R9A08G046_USB_U2H1_HRESETN>;
+			phys = <&usb2_phy1 1>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ehci0: usb@11e10100 {
+			compatible = "generic-ehci";
+			reg = <0 0x11e10100 0 0x100>;
+			interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_USB_U2H0_HCLK>;
+			resets = <&phyrst 0>,
+				 <&cpg R9A08G046_USB_U2H0_HRESETN>;
+			phys = <&usb2_phy0 2>;
+			phy-names = "usb";
+			companion = <&ohci0>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ehci1: usb@11e90100 {
+			compatible = "generic-ehci";
+			reg = <0 0x11e90100 0 0x100>;
+			interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_USB_U2H1_HCLK>;
+			resets = <&phyrst 1>,
+				 <&cpg R9A08G046_USB_U2H1_HRESETN>;
+			phys = <&usb2_phy1 2>;
+			phy-names = "usb";
+			companion = <&ohci1>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		usb2_phy0: usb-phy@11e10200 {
+			compatible = "renesas,usb2-phy-r9a08g046";
+			reg = <0 0x11e10200 0 0x700>;
+			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_USB_U2H0_HCLK>;
+			resets = <&phyrst 0>,
+				 <&cpg R9A08G046_USB_U2H0_HRESETN>;
+			#phy-cells = <1>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		usb2_phy1: usb-phy@11e90200 {
+			compatible = "renesas,usb2-phy-r9a08g046";
+			reg = <0 0x11e90200 0 0x700>;
+			interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_USB_U2H1_HCLK>;
+			resets = <&phyrst 1>,
+				 <&cpg R9A08G046_USB_U2H1_HRESETN>;
+			#phy-cells = <1>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
 		pcie: pcie@11e40000 {
 			reg = <0 0x11e40000 0 0x10000>;
 			ranges = <0x02000000 0 0x30000000 0 0x30000000 0 0x08000000>;
-- 
2.43.0


