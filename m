Return-Path: <linux-renesas-soc+bounces-19623-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 38665B0E933
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jul 2025 05:43:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9E6C1C25EFC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jul 2025 03:43:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 077622494FE;
	Wed, 23 Jul 2025 03:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SF8M5dl8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74172248F72;
	Wed, 23 Jul 2025 03:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753242188; cv=none; b=rGbGLvXc5xAOaWILYfLw/DxZIglkylUiUnbtCZQGZq7Jbyc0ZQ+VhDrmFZ+nL1Jso2RgmpD7Crr5Eg+zwR1MYBm8rgYdEaQzUG0Du92mvNW2TX8pJqqzp491HKjhBDzIe61oUaCmAIU700hupgFMllDOTNusloigvK7Ktf226Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753242188; c=relaxed/simple;
	bh=hi/PAdJ6bxER/R9rOhwjyW/uXI7cI32IlUrsv9ex63I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dMTa8LW7Zd1gvamcfSiZWgLSRAabfdvSegSieadZMrnQhmrVDdhCH9D7hw/XtoSF2IOAq46XBm9Tp1Bj0z3wrsPSv94O5l/YS5pMxevVRABC/tjRCOja4HGVGMGKbIE7iDFNHbXo/EiCwc04d3TtTicJQytjrdSNnecHPGzUzwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SF8M5dl8; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-235d6de331fso73295285ad.3;
        Tue, 22 Jul 2025 20:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753242187; x=1753846987; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w/eos1Iv+JJoIEFFCBL+Da2J2v0o9eRaLw9+DKJIo1Q=;
        b=SF8M5dl8xI6+z8cPNRFLYkWLIJr2JRUpewkk7F4ChLLaSMklpm/UB8Kl+lCPJhsQMK
         J49kSV8Z0hq5rsANWENIZlfWjp6xdBLtLPw2w/KAW7M3hQYxRK+7WdyPr+o6WudFOBOQ
         lol72DSXq+Ns540GXNwjB7eQOXKM6sbR8+WeT+Rfp8Tj+ioG9S5xY48/twXSb7JsbGMj
         fvfZ4rTcZnnna59v0rjgO53tcmaRxrFUpoYHmEVQSgfqbVN69lUppWlNnxI9o5OMcltE
         kRYre+MOL7H1yFauTWh575wztzNwhI6w01t50jKTcrVCqxsFuIEuo/NXwHGCeoTm5QrT
         Zi/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753242187; x=1753846987;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w/eos1Iv+JJoIEFFCBL+Da2J2v0o9eRaLw9+DKJIo1Q=;
        b=C6J2GJQWglBJoVq2X+weIVGHL0UliCXuNcrdfh8EbwKh06CGWy4ZCLnEusdc3JZ0FV
         mYK66HyT+xnIItQ0bjA0OTm8tQWUNZHX5GZhduVxQ3CAkGi0qnLJGgsFf/zGXg8CjaG6
         Ix3I9Z6oBr/XJ0NVoYy/xJP1Gxkx730JDMTJu4f1/n+P2dj89Gw8tuAuVRdZZFjPFugh
         FrCtn8iUq6PByOcnhh0D75Hc2qgPDkyYedwYmyAEfX8Vbud4A8pT+ZFVz6/DaulmfiLF
         oTXCKLwTUKH9ix2XS2JxzjDqJp7Matd/uW7Nl3/ax5wJLyqMBfOcPk2uPC3zCVJRMa4c
         1qNw==
X-Forwarded-Encrypted: i=1; AJvYcCVyfQuYT3f+QOJ41MAKwpTwKB9uu58q1beNtNOY/Ij85uIvp6aDU873pU7HMr0axkj+mNFpIDNDBuDJct7/hbE=@vger.kernel.org, AJvYcCXJ+TF++Uc+jJtt0JxqpzLojNuO9IqDxQyJVQw//pLkyntjCVcQV+0nh6HMvEHBUK9simRBHk6d/C0Uyfd8@vger.kernel.org, AJvYcCXm9VWopWFWZXie8a7AA6qTOeGyFA2DHkLnW1x7BRkR9WduJ3vuG+i0sSMbE60ZE6I6+Tj7EODTM5gm/fMM1XLK6Pc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9U1PsWGXbEGLcmYMt9Ex+qcoPqysmeGvGSDUjVqX32zYytQ/y
	kPCAw89BrCpgXJMWxbi+uRTmwKXTjXZrtdyTZWfN9eadDayNEVKugvo5
X-Gm-Gg: ASbGncuzlJlPtuElVxBld8FG2YcSdpZGid7WPnPJ+rceKu6j2nE9+U1RJdduhbKQP8O
	6oqFZgzDBCErFt2dD2clxI+6A9duXCaQZcn4hqGdhBDNhQp2v1jy1gjBzqTwZnaEl3KE6z6ncq1
	j86gih5f0/n/2sYkOAJmzfNDpPZs8sG26e0FBHlmboIgUEajn65HLJxSvnPnpsX8o2rjq8MaXUp
	suE3iP4MyKxgRghxJXZNIJaQ28G2I/y4gkYbkMYrzBEISWaopgyginTdQrKBODzRfSkFdHOMBgw
	kei5eDI5MSnWh6Vn2TJ7GqlzNBR8GwYAgLC4U8H2u6qy6AT2uPXLjdiRiIXvAoCNJ73nH/y07q4
	Z/AGex2oc0khJahpsbprv07DqingfkP+URNqNQYHy+1oF1H/2LmV5S8NimePPthVfv40=
X-Google-Smtp-Source: AGHT+IFUs+bNPR/ApG847/dcTAVEW96jKv4IioRlAvKP8jVS3JRjCWVIBr79jzQ0RqfNHkVXPiEhNw==
X-Received: by 2002:a17:903:946:b0:235:27b6:a891 with SMTP id d9443c01a7336-23f981a83c9mr17116365ad.28.1753242186685;
        Tue, 22 Jul 2025 20:43:06 -0700 (PDT)
Received: from [172.17.0.2] (125-227-29-20.hinet-ip.hinet.net. [125.227.29.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6b4d47sm86197605ad.99.2025.07.22.20.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 20:43:06 -0700 (PDT)
From: Leo Wang <leo.jt.wang@gmail.com>
X-Google-Original-From: Leo Wang <leo.jt.wang@fii-foxconn.com>
Date: Wed, 23 Jul 2025 11:42:42 +0800
Subject: [PATCH v9 3/3] ARM: dts: aspeed: clemente: add NCSI3 and NCSI4
 pinctrl nodes
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250723-add-support-for-meta-clemente-bmc-v9-3-b76e7de4d6c8@fii-foxconn.com>
References: <20250723-add-support-for-meta-clemente-bmc-v9-0-b76e7de4d6c8@fii-foxconn.com>
In-Reply-To: <20250723-add-support-for-meta-clemente-bmc-v9-0-b76e7de4d6c8@fii-foxconn.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 leo.jt.wang@fii-foxconn.com, george.kw.lee@fii-foxconn.com, 
 bruce.jy.hung@fii-foxconn.com, Leo Wang <leo.jt.wang@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753242171; l=998;
 i=leo.jt.wang@fii-foxconn.com; s=20250618; h=from:subject:message-id;
 bh=hi/PAdJ6bxER/R9rOhwjyW/uXI7cI32IlUrsv9ex63I=;
 b=kihku6zIwBO0LFNgqF1bX/J2ndiQu/2V21i0gTYkTS71k8iN52bF0HnmmT0NL6p8te3NQezO7
 BoSboi3lRPaC1P0FHR6xTZ2l5RtNyQzpo80y8WTx2j+I5p6SpBr0JhM
X-Developer-Key: i=leo.jt.wang@fii-foxconn.com; a=ed25519;
 pk=x+DKjAtU/ZbbMkkAVdwfZzKpvNUVgiV1sLJbidVIwSQ=

Add pinctrl nodes for NCSI3 and NCSI4 to the AST2600 pinctrl
description, enabling support for RMII3 and RMII4 interfaces.

Signed-off-by: Leo Wang <leo.jt.wang@fii-foxconn.com>
---
 arch/arm/boot/dts/aspeed/aspeed-g6-pinctrl.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6-pinctrl.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6-pinctrl.dtsi
index 289668f051eb4271ac48ae3ce9b82587911548ee..e87c4b58994add33938792f732420ade7ea5c23f 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6-pinctrl.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6-pinctrl.dtsi
@@ -412,6 +412,16 @@ pinctrl_mdio4_default: mdio4_default {
 		groups = "MDIO4";
 	};
 
+	pinctrl_ncsi3_default: ncsi3_default {
+		function = "RMII3";
+		groups = "NCSI3";
+	};
+
+	pinctrl_ncsi4_default: ncsi4_default {
+		function = "RMII4";
+		groups = "NCSI4";
+	};
+
 	pinctrl_ncts1_default: ncts1_default {
 		function = "NCTS1";
 		groups = "NCTS1";

-- 
2.43.0


