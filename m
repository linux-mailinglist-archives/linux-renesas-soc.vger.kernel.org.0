Return-Path: <linux-renesas-soc+bounces-20450-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 14422B246A7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Aug 2025 12:09:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ACB9B18946B8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Aug 2025 10:05:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 557002F49FB;
	Wed, 13 Aug 2025 10:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ldXfmSG2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44562F49E6;
	Wed, 13 Aug 2025 10:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755079480; cv=none; b=dL0QBiN242KBMe/TKv1Xq9Lu6ct2MWLaQ37B8XB5jJnPBgLr3zPfkD1su6867SbHlSmJEgUXECbzJLPVQfjK//WOxksxfocrby267YjnBTRjG23VclBOod1ETFFINaQ2Oe/UUOmMMt4bZWIjDnYioT9tiKZQ2Yhe22idOvFEaWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755079480; c=relaxed/simple;
	bh=7cyKFfO+WQV7K/VYFsCYXSa99WPzN+d+c5at0wiDCjY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hoFE83U7lnAJ/BaKe3LqVdcRLmTVqmwy0xQUOD7B9Z1U0YKf0jxXq83cDZNpTrkmN+zvLJTPJ3uFr31PIk1gBXHTo4dWOo4d+vPZ3T9J0gWHUlG+kFSmKoJhrMsnwUnbZG1O91vE+pBeUagZ1hjbemwTHG1pGDWO7OolHQ1ObTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ldXfmSG2; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2402774851fso57265035ad.1;
        Wed, 13 Aug 2025 03:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755079478; x=1755684278; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QrW+x1kwa+TliZEBde/ju7PT5X6BHW9feGK4JCdzymE=;
        b=ldXfmSG20Z0O5l8aWMFCnEMWTNUMwYDqwBNlS31Z6IsGrIk8Trex9dhHJNCgKjQvfh
         3CllJq4Yz2UwzFKexz0C0+pBKa6s6V0++ltJsrgeFIegy1A2alONAxqf8thxXlVKjk4R
         zkz1J7UGvqaUOm+PRv6YZdHbDTF07WtQeZIhr1410MKshCxiXQrdeqNdcFQqhWGg1UbF
         /U06yLMEkwWdPd8fKqF0t9bvNFc7RYDtuxGHmcESG8LnAHte2v7gtlx/Q8ZWWH448Ouu
         clKrh0GOWW5uySzncPAEPUG9WRNwIsl7DysdA/+/v5T15bHq1Nlw6AivvSECbu1/U280
         +uCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755079478; x=1755684278;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QrW+x1kwa+TliZEBde/ju7PT5X6BHW9feGK4JCdzymE=;
        b=Lzc0YJF/Fhehxk7ZIi7ZF7cqTEIrPkeRaLMbOQJmE57fwRYSIUcYEI7S+XO7//wTM9
         CnzobvWKilNSZ717OuxGly4UmJbYkMqorQzFrywcGWWi9qtJDab9o5x5AtbBRxLw+Id/
         tnSkicP9ee6w3DColiwDfPurh93ycI4AaCOAY9P+yzyKgfDqzsBtbF5RSWzQbYIGekHF
         5hj8yrMkptY2MtaHJ6OoiK5MQB0Y/zf46rfNLTx9yCZyeD4DfPDW7Ra45YxT8O9a7z9R
         X+MICbUXS2IyY+BTvl+roVwQ9vuBTeSv5RzO06uJQtRPA9buyCpUY+jjA0UGnj3ei8+a
         qOXw==
X-Forwarded-Encrypted: i=1; AJvYcCVpS+wnuScxPUnciqU5b10bGMjmE9Zuqwn7M4T47At56sSWB6gLlaJcDDVRf5eaIruPjNjRsYhIQxNoc33UXeA=@vger.kernel.org, AJvYcCXn7rbXCSSVe0Q/6u/u0xKDAN719tO8sF1x4Li5uSeEuTBGUkVQnlA5y4+v6nScoG3wqAGaqIG+1+OFMp7N@vger.kernel.org, AJvYcCXqy7JnWvaFmJxuvKlPWBVPCFQ0hxQ4f72I2z/IdXn6u0eAiINkh4CiZ6RdYHWlkojRonE9k9p7V5usQ5k8/Ux6uIU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8tX+yKztoCqsmj+RscXnRcwgZzcE04meJbfZF4dzMYpkYeGKt
	wk8UwhR3dRXvcgrOgldny40MGFqwi7Oizc2c55VjtU1QSxNkY5nqw+4i
X-Gm-Gg: ASbGncumgGrH9zbGwSIbgzVt70/hNy576l04JlSjCf7jm4oruP47RhDkD114BUws0q6
	lUoMcZ5Fd9WD0VnnUVpk4k4Eb6T4fA35/m2ordV2UZtpNE+4a2ewXaZ7zttxtaxF19NtX2f3Mt1
	QKU7nFc2MyxfNNcvP6M0UZ2uYM19v4ZLbczZpuwvHnB9o23CNKnmA+YoXJr0cX/9vaNNsWiCv/0
	8dhFTjBZ7zdl1abi8zdhEi49YWs5wcgAlc/mF1W+KrAzhpNk4bOMj32qDkDmcRCerths43V1oM0
	nFOQkWjIrQtjVLTUaaSizCVOPrxqNekN7EdiDpXWuFsPGv53SQdZSGUf76P0zUBo+hMReUNId/T
	cyvX3J+osg4FAP/UKnqxOLn0gsPZmPaEVuspya0RRBogu8LbVkn1sSjyP1JKvHIgYEnE=
X-Google-Smtp-Source: AGHT+IGelUIMCLH/6tAhQk/cnhctQEprBN0ypo3UWDci9hqE88+bnh6T+CG+4JKD4zlV0xkaaGYPMg==
X-Received: by 2002:a17:903:11c6:b0:240:48f4:40d5 with SMTP id d9443c01a7336-2430d1f5b1dmr36623355ad.39.1755079478041;
        Wed, 13 Aug 2025 03:04:38 -0700 (PDT)
Received: from [172.17.0.3] (125-227-29-20.hinet-ip.hinet.net. [125.227.29.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8aabdedsm321545335ad.167.2025.08.13.03.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 03:04:37 -0700 (PDT)
From: Leo Wang <leo.jt.wang@gmail.com>
X-Google-Original-From: Leo Wang <leo.jt.wang@fii-foxconn.com>
Date: Wed, 13 Aug 2025 18:04:14 +0800
Subject: [PATCH v11 2/3] ARM: dts: aspeed: clemente: add NCSI3 and NCSI4
 pinctrl nodes
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-add-support-for-meta-clemente-bmc-v11-2-8970d41f88b0@fii-foxconn.com>
References: <20250813-add-support-for-meta-clemente-bmc-v11-0-8970d41f88b0@fii-foxconn.com>
In-Reply-To: <20250813-add-support-for-meta-clemente-bmc-v11-0-8970d41f88b0@fii-foxconn.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755079466; l=992;
 i=leo.jt.wang@fii-foxconn.com; s=20250618; h=from:subject:message-id;
 bh=0XkYbizVBKY9WI9Q/nF7gZY7Z8IkaJEB3NQ1RTG/C8M=;
 b=8NFtXkhvEhwb3LTNeWPtrGrZ06tX2HEIza1oBDSY7eNjoQ2OsAiRGn59mEA1hRRXYdfeWDWQA
 ZbyFDG6X6W5B39BS9ytnr++zFZ1s+ftnxvGHxAqw2LcuGQB7yM2bFgn
X-Developer-Key: i=leo.jt.wang@fii-foxconn.com; a=ed25519;
 pk=x+DKjAtU/ZbbMkkAVdwfZzKpvNUVgiV1sLJbidVIwSQ=

From: Leo Wang <leo.jt.wang@gmail.com>

Add pinctrl nodes for NCSI3 and NCSI4 to the AST2600 pinctrl
description, enabling support for RMII3 and RMII4 interfaces.

Signed-off-by: Leo Wang <leo.jt.wang@gmail.com>
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


