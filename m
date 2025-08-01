Return-Path: <linux-renesas-soc+bounces-19825-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 127CEB17E36
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Aug 2025 10:23:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 537D17B5A50
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Aug 2025 08:22:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E9AA221F24;
	Fri,  1 Aug 2025 08:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="abDB0PJG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D93221739;
	Fri,  1 Aug 2025 08:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754036603; cv=none; b=PU0kKsD1+vzacwGj9CK5+RE3zRQPmFEDDLLDcgmlbTolsnTB74aJRKXydrcdI+wlZdYoHh6PEBgypnbv7POh/G/wgWjoN9txRz50FzNpzkJOVEIXn49sLj51MOIa7APMu57FWJYlZiYGp2m0K5jTMDRZENt12nh/kaII70Vf74s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754036603; c=relaxed/simple;
	bh=7cyKFfO+WQV7K/VYFsCYXSa99WPzN+d+c5at0wiDCjY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pxvxrLaIcZ8BWXm9yvqn54scIErCRfCfhKyaB7ef5g4xYbqQPRPd5Rew5Yqv+6mjjoPhZFAaCrsO35YFMnKYqEm9aYo7eVlWyMcl6Yo0w76RLlpoRVRIcF1iwGLg6FIzJBPZfpqfBKpcmgCxIAWqLza5qEBmaSiCzp+A6YOKawQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=abDB0PJG; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-31ca042d3b8so1563278a91.0;
        Fri, 01 Aug 2025 01:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754036601; x=1754641401; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QrW+x1kwa+TliZEBde/ju7PT5X6BHW9feGK4JCdzymE=;
        b=abDB0PJGb6R6rqrWsxUKTJk2kHZ/5JTI1G3XNsh3JqzNnJ0ioNf1S9VB1wIqU/N318
         Mgzxo1kUSIQOXVFxMMo+/aXxq6/qY8JsmzPZiJjzySR9gCGKJj8H2BTiCIRLbSy+YSCi
         Sp7EH+p9ePquWuGuGeEpPL2pJ5YxnOVR4Td3RCZlcuo7olMIUu5D1IgcBtqQ8DvrGS62
         Oe97or0ldSqua9wNAw2XcfMO36n6ahEXMKl/swYucOPPMInDbuddqgg8Ap5an+/MRIOX
         q1cciYDIh3xd6z15sbr0o0xuoEpVJO0zVpewnlAy8llIiTSwxPZVD3FK0jxnMBEBiThx
         X7ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754036601; x=1754641401;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QrW+x1kwa+TliZEBde/ju7PT5X6BHW9feGK4JCdzymE=;
        b=idtiNdvplDHsC0oWB1vnZq88WZsC5JPzIPu+kkekWM9rhFHUC6K38CXZ2D/hshNmh6
         rLom2sWwyU2OgBXgvT/WDkPUYBZZtVnBYg0xhA02FAg6Oy8Ws15REgb/a0KJh25l71r8
         uX4asGMRlhR+ViOKcta1jkGjo5GL8zych8zc8XtBJ5LpOvERmaAKNSd9JKvdmc3qrf4A
         7HYKppj2NS0qCVtxF1ozKazvztmv505G+X7uMdKWwhgaevHLTphWpV1Q4a5b8p0797fi
         pCtMukB0SWB6dLrnFZPeZQE+wrKDWUoAuHTv2myctDR/rRmH99uIm/IZq7WuSo1gXnxd
         Y34Q==
X-Forwarded-Encrypted: i=1; AJvYcCWGD+PBx04/ux7L2y3aAgnpfU4Xs1UtRznU+o1qk/KxCNp2rMf0AsJQejeLSoMqeoBW5dpg92aZH79hc6obqy8UpFs=@vger.kernel.org, AJvYcCXDluqlPMUf7NykDVYi4dPYeNJCM3yVjP4lYSU1Hed71TGAcZSQUJ3xl0+4elqeo6cgxW2CRX1/z4lAMEjb208=@vger.kernel.org, AJvYcCXYYhpVyRX8K7d/O7j+DzJWustuR/aZwUjgJX/Kt1U6d0KoM4eR4RanCw/9bRiguzfbYttFWQ0UoZE6MX3B@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc3JxuqVCZIAq8uSpg6YZYoIFMBNzmh/zxOM42hULZHL+dsN1T
	fGqPwQyHfmKkRWmCLy6AKuKqii315qKdOypHz9/ITAofeJLBPNm9RyZn
X-Gm-Gg: ASbGncsrKH83iTRmwz5a42wtQIHcQgSp0oq160UdpxQBw7hrYB87H48G2kc639Tn1Y8
	IIC9p9z2TU6Anlyv6lhyVFlj+wEobHA2SEPE9zozW0spJBwYKo9MB08oaf0hFzHtKNpTC3jo0h6
	xv4yjifsygmSW7BsZLEqtl/CAjGRoazzxzXQNmeGkAKe3+0gVOmIbOvogpbz7NfaRbpBzx/tO/A
	rv51zGsN6NWnQ1fy/7nCu2nYko+3Gi+NTZOrWoiCTO6X4qHWV9A0MbHlXZDhfpT8gB+zC0L43Tx
	BDIyPJLgOb63L8KNbP9yDjx29/IL9paB3tn47ugt1soHbb/mVgdL7bpa8yU87cGTjgHnxpB8ctV
	puxbBrimumuBE2XficqLYnaCcgP0zF5g/89yUGbhX72JUlQxpBpH3tvSNA/wZaLBr5P8=
X-Google-Smtp-Source: AGHT+IGiIL2eH39WyYmfW50peWzdYWtx0H5u++yPtj2JON83tXPpf3wufQnRVFpTduqX8zM5mjgdBw==
X-Received: by 2002:a17:90b:388a:b0:31e:f193:1822 with SMTP id 98e67ed59e1d1-31f5de4a5aamr16005459a91.28.1754036601052;
        Fri, 01 Aug 2025 01:23:21 -0700 (PDT)
Received: from [172.17.0.3] (125-227-29-20.hinet-ip.hinet.net. [125.227.29.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3209a850417sm3992725a91.35.2025.08.01.01.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 01:23:20 -0700 (PDT)
From: Leo Wang <leo.jt.wang@gmail.com>
X-Google-Original-From: Leo Wang <leo.jt.wang@fii-foxconn.com>
Date: Fri, 01 Aug 2025 16:22:49 +0800
Subject: [PATCH v10 2/3] ARM: dts: aspeed: clemente: add NCSI3 and NCSI4
 pinctrl nodes
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-add-support-for-meta-clemente-bmc-v10-2-c1c27082583d@fii-foxconn.com>
References: <20250801-add-support-for-meta-clemente-bmc-v10-0-c1c27082583d@fii-foxconn.com>
In-Reply-To: <20250801-add-support-for-meta-clemente-bmc-v10-0-c1c27082583d@fii-foxconn.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754036588; l=992;
 i=leo.jt.wang@fii-foxconn.com; s=20250618; h=from:subject:message-id;
 bh=0XkYbizVBKY9WI9Q/nF7gZY7Z8IkaJEB3NQ1RTG/C8M=;
 b=yT4zUHaZRPVLgHM5/hrcwMugrlznwdbZhwsee67hhcUXifJSdMZLLxnZUJ4mD0vXlcKfTLteO
 f/3PIDkjuklAKPVwCn+AUPDVPBhMj6vPhHZK3iE/k848ZOE/ZZexxd/
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


