Return-Path: <linux-renesas-soc+bounces-19525-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B85B02AFE
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 12 Jul 2025 15:40:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5741A42E88
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 12 Jul 2025 13:39:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43685276050;
	Sat, 12 Jul 2025 13:39:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA1D275110;
	Sat, 12 Jul 2025 13:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752327591; cv=none; b=RVtGHSqX4wulXL+eXQ7P7iDhixFQ5FS1F//QXykaOYtVpJe+OUl2y9ZjT03ePokyP78Pyek+Ox47DCdqcmlrTtVlP+n3HCAsi6iXZ2+PfLxWO8TnrgBLrpWBmPhzOq0JTuYsNjGZv5iZCxmrg2rHUV8FIsaDTbfgpq+URdSqsuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752327591; c=relaxed/simple;
	bh=kEe0uX9ZpjRARzTb/QPHSkxTIqc2PISCD7H+ZEv9jvU=;
	h=From:To:Cc:Date:Message-Id:In-Reply-To:References:Subject; b=TW7vR3bDtcySR6JdmxwAXMe11d1T+oRv7Brl1//2SZV157zLQxQZZZHxIrS6K5WGYetkkLe+0gEiue4cf8/fw1opqq7Pq5fXi7XBbFPaEtI57z2GImOnEl34+mSuzkJ1j80JVbFJnBgvpP08RRqGieaYQx+V342tfokOI1ztsPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=opensource.se; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=opensource.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7e169ac6009so20843385a.0;
        Sat, 12 Jul 2025 06:39:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752327588; x=1752932388;
        h=subject:references:in-reply-to:message-id:date:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5w8B5B+ZHf2NQJpJozV8SDih1Tib1LPw+wFlSZUAgNM=;
        b=mfwBwOOnAEH+aQgqmONbRnORr8Kya02nhLX9D07W1uX77w/Xzp/l6tQY5+4du3PAPl
         B1u2XIzMl2wdlumh9cFJACeknhy3wE/msxbAmqzNuz02+M5BoheWHSD1vQIDZsI+RyMT
         kC+bwBgufjs1Mwxg4ZHWxqRwyypm38Y9d777wp0QHDQ9s0ZHP8wtNuq6674tlq1L5ZFk
         HG7BB+Z4mi2cixUgDlZFKmSKdVigPXTIA6iOqCxsLiN5osCXozZOVNKcmSpc99gi/BLv
         627H8nmtgnGTB9Xwf8tAa+WSEIE31ndLH6BOb/H6CzCrhwKZcWnM3YbkP9tOqeFdLX88
         sjTg==
X-Forwarded-Encrypted: i=1; AJvYcCUtRudc80ZO51nzC7+QVPUatn1MvcZHY3cuMAaEdk+8Ff4HLM2CziVUnhRw3USqERBatI+JrWX+Cb2Y@vger.kernel.org, AJvYcCVuRO3c6++csKJP0cT3k8e3IeKsRSsCau880VldmsHngFPFC/Dr+PBSV/S3ETk6GQZy0Jpnoxz4hJnOfYu/@vger.kernel.org
X-Gm-Message-State: AOJu0YzL0Mh4q9SXHbp+ntv1Xy/7DM9lY6127FlwHT6Cx0ZaBgtOqJXw
	8Lx0HBcGWAH1FtSkdWcOMrz/8flW+PWldL9IcWTrUxhYbYwycwqIC0Plo18yC8Fz
X-Gm-Gg: ASbGncvOVmQYXUIiU7Ikw5UkrziC0pZlHt95l2UwJRDK0lHVsEijP5hCc0gCFnvuV+Y
	Q6Bt+A/0kT8Ujq7woZd0pv0vgPdmVoOEZvUQPH7UbUq6/Ui2vphgCBA8MiSEiCcHZexZU+O44RB
	ofNx5MUsnbiAYbO7/NtNg5Rv80xEoVy6kfzp4pujotlkRsNQudbrllHwK9zPgV6QMoCVV5MrDsg
	Cnp3xtihdAWhqeW/cVAf8hrlE/7T+ixdrbEH2T4RBnE6tQ/kgqf2jOZ+4pasK8nuprZAQUnyH7a
	MqMvdTMTypCcHf/X7ysbaV5JkjawFc0+IGDSM+iBWSB/7UTRCQ0jMpSTa+JFiqcxzXV8CLCq7UH
	M1WBF9Mr4dcGA89SedET+xiLChlsBYq9d4IHNkzpX5/4=
X-Google-Smtp-Source: AGHT+IFNmiKmqmqBOs0uiUJVc62k0Og5KK3KDQzCmnE1ndw3G3t9Jhsf8f1XryKGsm4EtwJDA3jtIg==
X-Received: by 2002:a05:620a:1a28:b0:7d4:536a:c0c5 with SMTP id af79cd13be357-7de049dbd11mr920699485a.2.1752327588148;
        Sat, 12 Jul 2025 06:39:48 -0700 (PDT)
Received: from 1.0.0.127.in-addr.arpa ([167.99.4.198])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7dcdbb1dc64sm321384385a.6.2025.07.12.06.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jul 2025 06:39:47 -0700 (PDT)
From: Magnus Damm <damm@opensource.se>
To: linux-renesas-soc@vger.kernel.org
Cc: robh@kernel.org,Magnus Damm <damm@opensource.se>,geert+renesas@glider.be,devicetree@vger.kernel.org,conor+dt@kernel.org,krzk@kernel.org,linux-kernel@vger.kernel.org,wsa+renesas@sang-engineering.com,sergei.shtylyov@gmail.com,p.zabel@pengutronix.de
Date: Sat, 12 Jul 2025 15:39:44 +0200
Message-Id: <175232758473.19062.5154901385305519621.sendpatchset@1.0.0.127.in-addr.arpa>
In-Reply-To: <175232755943.19062.8739774784256290646.sendpatchset@1.0.0.127.in-addr.arpa>
References: <175232755943.19062.8739774784256290646.sendpatchset@1.0.0.127.in-addr.arpa>
Subject: [PATCH v2 3/4] ARM: dts: renesas: r7s9210: add rpc-if node
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

From: Magnus Damm <damm@opensource.se>

Add one on-chip rpc-if device to r7s9210 (RZ/A2M). This kind of device tends
to interface to one or more on-board SPI / Hyper / Octo flash devices.

Signed-off-by: Magnus Damm <damm@opensource.se>
---

 Changes since V1:
 - Added reg-names

 Applies to next-20250710

 arch/arm/boot/dts/renesas/r7s9210.dtsi |   13 +++++++++++++
 1 file changed, 13 insertions(+)

--- 0001/arch/arm/boot/dts/renesas/r7s9210.dtsi
+++ work/arch/arm/boot/dts/renesas/r7s9210.dtsi	2025-07-11 04:26:10.383216792 +0900
@@ -198,6 +198,19 @@
 			status = "disabled";
 		};
 
+		rpc0: spi@1f800000 {
+			compatible = "renesas,r7s9210-rpc-if";
+			reg = <0x1f800000 0x100>, <0x20000000 0x10000000>;
+			reg-names = "regs", "dirmap";
+			interrupts = <GIC_SPI 445 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 83>;
+			power-domains = <&cpg>;
+			num-cs = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		ether0: ethernet@e8204000 {
 			compatible = "renesas,ether-r7s9210";
 			reg = <0xe8204000 0x200>;

