Return-Path: <linux-renesas-soc+bounces-19272-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DA020AFA14C
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  5 Jul 2025 21:09:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E0DE3A825C
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  5 Jul 2025 19:08:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96EF81C84CB;
	Sat,  5 Jul 2025 19:09:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB7820FABC
	for <linux-renesas-soc@vger.kernel.org>; Sat,  5 Jul 2025 19:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751742552; cv=none; b=ZF7KkWw3eQlNhPn/V4NcG4qaqf7b5E2rm7VMfYSCL8FzvewIvTRFjvdG0EKOdOrK/s1Lrhx7mrY9st76af8gn8oiIFB1R4tO0hMlDPirrILG2mnzLQWKoDpwz+YJvUWJ0xbZQv2rfI4fNHrpxL1AKIb/v160t6uJuKEpG6BrEXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751742552; c=relaxed/simple;
	bh=ZXt87xzOrBgqnb0DrSjAv0N7WnMG+bbcu04I+yW9sn0=;
	h=From:To:Cc:Date:Message-Id:In-Reply-To:References:Subject; b=kU18cfe1LdGxs/9Io7oJ2qDoUYdWWb3K4s2+toNHSCnIybpcbe7rvCJatoxl8VX/uxacM08JOff6JNjq54QFHk0dxkD6qsjSsgcIoF34cdeuiQ7vJI6Cka6AgW9Olrrk+o7rtW71l+lZ4Y2/2Tk2WW+iT7mt/Xfz2jdCkZVgKrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=opensource.se; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=opensource.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6fafdd322d3so23701796d6.3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 05 Jul 2025 12:09:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751742549; x=1752347349;
        h=subject:references:in-reply-to:message-id:date:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tHexrXVd/DNLEUxgGqRATcyDoc82A17HyT5dnv9nz2I=;
        b=JZRcdCHcqQ2RrlDUxUdbeppyDHF+fSF8eE3ePU7auOhSSG/krAYEZAQ3XFeAJwvbHR
         kSDwZs5Y3XoCgoofZmzEOz0v1swZkxUtPo/UpT8imTjVjAEMJioUVvGG8B5ww4A44ES+
         sqqEGgyba4/n6+PKShYvj/zD5neHV05zGKgigxzX95L8a5+EkwkafCNsA4UVqDJZkqFA
         NzgkDUXw92D8mUO5iW0ux4fNB7P3bLJ9JVR5TFq/wD/QfQqN3HnIj09tJEhppHeh0X5l
         OhlNe+BGS2JokSnloFqbfMERbKVqfdylLzGPDwrPbwIFhk7LarvG3LHTjZGl/Q2YQs1m
         VqBw==
X-Gm-Message-State: AOJu0YyaSSd4R/w2csmUvN4HnmhgIGDHSm7qlxcNb3w4ptCFxXPZj+6V
	1NP/A5PeRFFXmlio+++gCOFJWUpX335TYwOJKC3oMIe+BxgMbhDnAIAA78Yx6Zce
X-Gm-Gg: ASbGnctdgOC4kWUFLjQe5bdj5o184Id3XGmSqpV4Ub8LXIMQXVOFZ658YKww9YHefic
	PqvWXPiUuNqL73jsqK+h7v6hYL1UrPdgl50nXvEZX2DTFxMPmnGpimPyiMoM/JKknC3QTloKpu3
	evuKpS4QlVh8sis7SE9R1HQOxUMVASMvmXTgO7WbGQtKGLkT2X3R9MnaPTbJ9342NP+GSLIjj+z
	D4/KV284ykkuaPw8pBfJsDESCDpsIbxi2oJHVy4TDqXd3a5UgpCnhk4s6dbI6jn0idiiRsDOab1
	0UOsjgOcCGuRgc2fdrzpxxeIEjaDR9cAj3xiyZzRBCiC05QpDh1BL51Xz5Lif8QyAuHLV73RF9d
	EhecQpHg3w6v3j9W7KpXwgf0=
X-Google-Smtp-Source: AGHT+IEm80AonvaMhfJLkhSI4oOLaw9GE1Wmy0OYeat/lRwqlBcu+njFtzX4LqjtGz+Am1hW8lzNZg==
X-Received: by 2002:ad4:5c6c:0:b0:701:78e:333 with SMTP id 6a1803df08f44-702c8bcf0d8mr92945316d6.34.1751742549398;
        Sat, 05 Jul 2025 12:09:09 -0700 (PDT)
Received: from 1.0.0.127.in-addr.arpa ([167.99.4.198])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d5dbe7c311sm347172685a.67.2025.07.05.12.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 12:09:09 -0700 (PDT)
From: Magnus Damm <damm@opensource.se>
To: linux-renesas-soc@vger.kernel.org
Cc: wsa+renesas@sang-engineering.com,Magnus Damm <damm@opensource.se>,geert+renesas@glider.be
Date: Sat, 05 Jul 2025 21:09:06 +0200
Message-Id: <175174254678.83411.2579358874698418215.sendpatchset@1.0.0.127.in-addr.arpa>
In-Reply-To: <175174252387.83411.17393827352291413834.sendpatchset@1.0.0.127.in-addr.arpa>
References: <175174252387.83411.17393827352291413834.sendpatchset@1.0.0.127.in-addr.arpa>
Subject: [PATCH 3/6] ARM: dts: renesas: r7s9210: add rpc-if node
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

 Applies to next-20250704

 arch/arm/boot/dts/renesas/r7s9210.dtsi |   12 ++++++++++++
 1 file changed, 12 insertions(+)

--- 0001/arch/arm/boot/dts/renesas/r7s9210.dtsi
+++ work/arch/arm/boot/dts/renesas/r7s9210.dtsi	2025-07-05 21:49:14.741533688 +0900
@@ -198,6 +198,18 @@
 			status = "disabled";
 		};
 
+		rpc0: spi@1f800000 {
+			compatible = "renesas,r7s9210-rpc-if";
+			reg = <0x1f800000 0x100>, <0x20000000 0x10000000>;
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

