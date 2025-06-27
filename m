Return-Path: <linux-renesas-soc+bounces-18817-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EA298AEAD1A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 05:00:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 89B151C22428
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 03:00:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B44B919E83C;
	Fri, 27 Jun 2025 02:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bbb/fc4D"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443E7199FD0;
	Fri, 27 Jun 2025 02:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750993192; cv=none; b=Jyu1SaBvnbiCcxM3tcn0YSa1ZQEQEcnYPGVowWXrcKnpolf/NF5Api6/NpHD63cIsoLeh7B3q76mwgBVDWdiKJ7bK5JNnoZFbgfMmMCBgK8Sxggx03W0yjMVIPIYO96pmkRr+e+2cor2cq1/QKApZkwUEqx00X9x5ghE1eL3+2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750993192; c=relaxed/simple;
	bh=B5JXGZGmMiWSQNghFqgfsxwqKjADuBDCng2oC7GG9V4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P6FQfhpEyavmOJ7+hedLkSYqk3tIrqsCOAZi/l34vk5fp+euNtNvWlkBe4C64I4eRa1moIRmiGky6yjH2gydZpB2/pXu9X3NpWyKWWGK60z53rPq0Wf9VmOn5RrvvyRhWiRjqAZkQRp5dSeP6S/4prWHLQGV738Qfs7stS5fDR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bbb/fc4D; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b31d489a76dso1511584a12.1;
        Thu, 26 Jun 2025 19:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750993190; x=1751597990; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SKbBTi7IDp31OkTJ6cIcfFVheRI1s9qIcPf1iWX2qRU=;
        b=bbb/fc4DptXAiAUhqldDuk4AbATG9SgtQsxSqpMZzzFiUq1L+wi+K+fdbsmQa/XROk
         TfapPrV9hA/nVYj2CrxKvO8xi5DD+aphTK8yYzOkC8wICqyXDhQT6WKFNWe0voTrdyq8
         Hv5KyhnezwtuS6yahP4SamaeInUW1oDQ20tgiDNzaCddCi9EWzfwxc035cT5ZzGMn8vu
         iraqMaiejtZa76+fzgoPcPpNl432C7hGiFr48AgzC3VI2uTNXVEqC7N/Ki7E69hvEIuJ
         l8HN0flQU7+wUFqHtG+OscIO6AEZOzylzYsI1Dx9CIGoFlJUSGgjEKjFuoo4F6x990js
         nvrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750993190; x=1751597990;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SKbBTi7IDp31OkTJ6cIcfFVheRI1s9qIcPf1iWX2qRU=;
        b=Iy4c/bUr+DaQb/nWS/lxFnjmtQ25WCDPk0fNNlTnPSlDWE5EWNMnXXvs1uP/UvXAe5
         L58KFRFviVkG56xL5VnVLMC7Zj8WRqov1UPPVe1nAcY4PToQNtoDE9yfllueZpKyKa8V
         UlDicZHAXGLk1e+W6/iGrUPPq7MopvdYHUdfPvGtMaUdCKkz/bMcdSqFjfujwtTKTjDg
         niep19Yx4H2VXdfkFQnv05AB0x0BE+0LZwqEPBPO5OloTZmQ/mssVWaJZxADR6O9Sq1P
         v21EdJiael6xj2bv8SjydUMgA7W0T3sol2MZUoKL4SpbIpdfUixHixu+U9bMLKzs0ybg
         Y1mw==
X-Forwarded-Encrypted: i=1; AJvYcCUPtsj3IOijvkut689vXB+lcow4u4ucbvkqsybLTsxb+ak1qwxqV8kkJKtXZsMSA0RqNeUu2ixILWs5+cf4@vger.kernel.org, AJvYcCUYBSUkYzelGzfcD0YbuQD0vL0TzIOh8U2rrmumSH4WVI4Hj478QvrAfb982Qgt3fmipmY88Xq+NQzGZigtlHBbkWM=@vger.kernel.org, AJvYcCXfjLPIthCGiLbyQiPWsDHVl7vCKhHGUW4YAyCGLSZihne94aXjlb6aBSUsvAnAGgIay6V0mLHOt97co4NQwTU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyal/qO4jfJW1v7bB8lTLssvQD34MZg/lXeqRBMKT7PaYjjfWmV
	xe/UuM1IvRINljSW1tV68FO8FlMlEx6DOLqJBxbHMcpx9LT+V9aSlsM6
X-Gm-Gg: ASbGncsYv6mmV7FmE62IHQpxfzCb/51D+h/Um0Jovv8N3GHIH2k8M5YhJhUDdPyVn9P
	fC2Bb/NRAIaiUxHnTYbMNSannmrn6Nr0VGBZy5yhWZBoret+bwZGXTXks5wX6amS800EwGWXUPL
	wmASQ3rqeLTPSHJ1qyMwR72hfOhT7GHu90PZ1GE6qZRskoPD8Pgu3TD0tIKhaNkJC4pnsT27N2K
	MpR1/JTwFN6db7tspWD3JKhXOSsMgYa+2rVMjrNRuPAWIqxkLjKhyc0uL0AtOJ+FOJwBbs+sTVa
	GVBD3TIUTIDVnEe0SRD4QfZGfeYvvVFTOPsEui4WG0cxl1pyPJe48sqKNqq0MjtgG/p0fsi8fki
	EJwktfEVEr2vScsm+XaX33uAKaxqHCTm0PLCrDXAtqA==
X-Google-Smtp-Source: AGHT+IGKG91ljITMzoVCW+bBbL43wOYsdAmeiGbGiZjPAqk6qOf9V5tPOGCVNlv/03ppyEr4tpG14w==
X-Received: by 2002:a17:90b:5212:b0:311:e731:523a with SMTP id 98e67ed59e1d1-318c8ee570fmr2178372a91.11.1750993190514;
        Thu, 26 Jun 2025 19:59:50 -0700 (PDT)
Received: from [172.17.0.2] (125-227-29-20.hinet-ip.hinet.net. [125.227.29.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f5426bd9sm5358186a91.27.2025.06.26.19.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 19:59:50 -0700 (PDT)
From: Leo Wang <leo.jt.wang@gmail.com>
X-Google-Original-From: Leo Wang <leo.jt.wang@fii-foxconn.com>
Date: Fri, 27 Jun 2025 10:59:02 +0800
Subject: [PATCH v4 1/2] dt-bindings: arm: aspeed: add Meta Clemente board
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-add-support-for-meta-clemente-bmc-v4-1-ce7ff23460c4@fii-foxconn.com>
References: <20250627-add-support-for-meta-clemente-bmc-v4-0-ce7ff23460c4@fii-foxconn.com>
In-Reply-To: <20250627-add-support-for-meta-clemente-bmc-v4-0-ce7ff23460c4@fii-foxconn.com>
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
 bruce.jy.hung@fii-foxconn.com, george.kw.lee@fii-foxconn.com, 
 Leo Wang <leo.jt.wang@fii-foxconn.com>, Leo Wang <leo.jt.wang@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750993183; l=886;
 i=leo.jt.wang@fii-foxconn.com; s=20250618; h=from:subject:message-id;
 bh=jaJuRFuiQIpQeCgkDZC/ZckoYXAyyJRWtir3QL+VwYw=;
 b=AYHEHTRIFy88S1GjWZDWK5NLlxMnwupBgtb6qjRHYkPO4trM6o6fQKG9w+vESOZJ2Pi2UwYu3
 5RmXtrrudpSDo/PwJ0dJJo50AxHwE3iiQYAc+uKcT3OqY9VjtELAt4s
X-Developer-Key: i=leo.jt.wang@fii-foxconn.com; a=ed25519;
 pk=x+DKjAtU/ZbbMkkAVdwfZzKpvNUVgiV1sLJbidVIwSQ=

From: Leo Wang <leo.jt.wang@gmail.com>

Document the new compatibles used on Meta Clemente.

Signed-off-by: Leo Wang <leo.jt.wang@fii-foxconn.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 01333ac111fbb076582a6c0e801903c3500b459f..ff3fea63cecd99ec2dc56d3cf71403f897681a98 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -81,6 +81,7 @@ properties:
               - asus,x4tf-bmc
               - facebook,bletchley-bmc
               - facebook,catalina-bmc
+              - facebook,clemente-bmc
               - facebook,cloudripper-bmc
               - facebook,elbert-bmc
               - facebook,fuji-bmc

-- 
2.43.0


