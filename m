Return-Path: <linux-renesas-soc+bounces-21326-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E6989B43A70
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 13:42:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C447580E2E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 11:42:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2629A2FD1BC;
	Thu,  4 Sep 2025 11:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cyxgi1T2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6088D2ED170;
	Thu,  4 Sep 2025 11:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756986136; cv=none; b=uvn/mN8ajaRIpmaFQrBoiJ/OPuOrYrZoP+/MEUTM0zWkBK7eeEXeGx/YzhwWRyHwxPtyS6RkLKesks+Fu9lvthu5E9e8L1n2MvFAaqL7npUxdpRHsMxqMib4G2dycnaqF/0XrVLEYYx4n9PGDd8KpRkOk7Y7xPC2cxYmB0xM95M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756986136; c=relaxed/simple;
	bh=CwhmBlyC0qvVqF/G7epb4UCN6X0UNZty021S+ki7K84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QVewqmzB8WXOmwDftr/UvkeRjMBTH80B5hEP1euBW27qOydcrQjA1Sb3lQ/7bEwFOGD3J5Accs8jMzDCDz6pdi9m48kzYoHz34ltWWT+gjKRU30zFf1TVQwEWfTkgDgg6FW+jQgBXpGMKAyr+sX8AVTA1xfmIoVZ9fv3w9ebWJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cyxgi1T2; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45dd513f4ecso11435e9.3;
        Thu, 04 Sep 2025 04:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756986133; x=1757590933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EiskG7ip+Sn5uNaRuk7x96d3D95CuuIRPhQ43cdE01k=;
        b=cyxgi1T2XVb+KaP4Y7WyEql6ET7x5enTcRNh/Tj6iFUu5GGs2bcdNgAMDUcLm2w7i2
         ZoXPhJc0FIpuawkvzUjhSaxwZm+nOJJT8mxgl9fKwGAo2CdKpMDQaSX81cFIhTsIyoU2
         7zLQT7z8V+2Ju7ja6cwcLMrw2hBkrT7j13Qj77nf5uUFgmLx1WDI6MlSLkE6CAeTzcG1
         vnfKsrbRZekSVUmjNzUSXS+jriEGZfRPki01LvHMNDU9FeVz3giJbKTO5ccbBxxUNdUW
         Tdqyy4VbsairO7aW55sjj3gmDv7xDI8uJcxVVA2SFof+FNVIEGpu20F3FLD198umQC3O
         7OzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756986133; x=1757590933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EiskG7ip+Sn5uNaRuk7x96d3D95CuuIRPhQ43cdE01k=;
        b=M5AXKIc7nmXHFXyIzL1LVuxqwsFkfP1fIRDDdrmyHezXEFLOFoaHEl+AUhaXHJbROx
         XgYK4ClFgOPGndtoNBlQnH8abByub7LCwZ074ZYfmMUnA8EyRJwrvUpEE5mbVT9boGzT
         0K3MlH44UqsSjw9eKbC7+IGXIZ2XWTOLzNDzIe6mh9rbmpPTCqdYIyuurS26Ae9ZcF76
         3amVKMn/HHSp9yxaIYNFk3Q5fqA1lRnlNMcGEd/hYjWnNSdE6rvlZ9R3SKYWkoTkhPcN
         oeptF/tZiOQeZBuyZ5fuJjKdL/Rzu/ggzFFh1AQzYeRftd06iSM5Le+qiJPNcjV8uDwK
         Ci7g==
X-Forwarded-Encrypted: i=1; AJvYcCWI+kfzYalFoXLBeg+Rg7PxHi1IPDEHIzv9htkw57zwAG0eJmtkow8rAStd7+CCGw8KTexvl5YC@vger.kernel.org, AJvYcCXJ4p8sq1XhE0hWXSwNjzUX/+YPkj0rUAGeYUmHPOsaMZ0zuuIojW78m/qVrJ9Lewz2XUmMuaZWkh8Fepbi@vger.kernel.org, AJvYcCXJwMeRz0aFJfepK7vXeOT6U8sA0Wwn08Ggx20kmJLPTbaEr148nAPXLd6pNBanSRTGz/IRhPXqa2Kc@vger.kernel.org
X-Gm-Message-State: AOJu0YxIZSbD8K7Iha1vsFmiHntmXtxRt64+19ixfvsQLvcji82EPWH8
	qkNioRejykvJtF8mmWrcGCkvpWdunfiCOzxHC5GD5RYK7jhnUK61bNvT
X-Gm-Gg: ASbGnctfbaYvFXkd/pTtNtmwEJmRv2MOXNiTYXSkxpXIwzO3UWLhtIRWJD3z8jNjplu
	dai3gzsM/jbV8x/AIdFUTCxpGdhMi4uUgwNxbm1KAx1rWVgIBL8PV1Pe9wCleC6f+vGjsxFwiWe
	4w0VHqwiC9d0wecVU8UgarxUrd+DVEwhiKD43sLSM+4/OIQ/YdXl931ZDnsWgts6T0nLuHeZzEk
	1376uB23Es1Fsvy8yteLvSpkBvIwFuW/d2PB6IBlLW76jYHsJrtDqaHfJF0zN4Tff9LuJtLI/HI
	1NLm2Ts60eGMaNnxO0m9Dwg1ONHzbmYJ6oO9YyUqODewLe1K5GwYzyFf2ETwOKBeLlRbrPeH/Ml
	ZFydgPPGQnIDBIxCcFsiGbbKuY8a9O9yPdjP39D8bPPwNDGBBzDrFTz5g0A==
X-Google-Smtp-Source: AGHT+IEF5HJ2Q9ZVNS1dBnaOZLbbNcKoC8c7OnyJoiBxlGKSFwR3uBoDPwbyW+SLHuN3Rfra460D3Q==
X-Received: by 2002:a05:6000:4210:b0:3d6:4596:8a2c with SMTP id ffacd0b85a97d-3d645968ca5mr10643219f8f.50.1756986132361;
        Thu, 04 Sep 2025 04:42:12 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:904e:70c8:edf3:59a4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dd0aec70dsm14658475e9.0.2025.09.04.04.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 04:42:11 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v2 2/9] net: pcs: rzn1-miic: Drop trailing comma from of_device_id table
Date: Thu,  4 Sep 2025 12:41:56 +0100
Message-ID: <20250904114204.4148520-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250904114204.4148520-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250904114204.4148520-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Remove the trailing comma after the sentinel entry in the
of_device_id match table.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- No change.
---
 drivers/net/pcs/pcs-rzn1-miic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/pcs/pcs-rzn1-miic.c b/drivers/net/pcs/pcs-rzn1-miic.c
index ce73d9474d5b..c1bd7cd58478 100644
--- a/drivers/net/pcs/pcs-rzn1-miic.c
+++ b/drivers/net/pcs/pcs-rzn1-miic.c
@@ -529,7 +529,7 @@ static void miic_remove(struct platform_device *pdev)
 
 static const struct of_device_id miic_of_mtable[] = {
 	{ .compatible = "renesas,rzn1-miic" },
-	{ /* sentinel */ },
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, miic_of_mtable);
 
-- 
2.51.0


