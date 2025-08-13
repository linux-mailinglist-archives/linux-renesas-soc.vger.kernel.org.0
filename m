Return-Path: <linux-renesas-soc+bounces-20449-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DC5B246A6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Aug 2025 12:08:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B11AF18880FC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Aug 2025 10:05:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BBF32D0623;
	Wed, 13 Aug 2025 10:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ti5ISR5H"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184312EFDBD;
	Wed, 13 Aug 2025 10:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755079476; cv=none; b=cDRSOBaR05qB20vZGc+Ziu3evYYBru2puRm+3nZrWyPNsG8B33393aSNcgl3CZ85+QbxYAhUjdiDyrqckWnDv+XBJPjMK2ny355ZdGzuaZQBmjsw+hQ5fyZQ4TxzwYhmwE75SQQCdCBIpUPNb2sxHCS8uJTtAd1wb3HUQp/V1yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755079476; c=relaxed/simple;
	bh=EMrtnKHCeBPiNgHS+U3LPwMpQttslBmsr2dN5fHguu4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pon+JgJsUtvAUhryE/rTiuqPJIsqyBWbFpLa5vTP53+3ZbmVYrPBzIHdY33i+0ZWdZD4smACgxzp4z6f6VHLXsWAuHBTQe6sMxijtGR31pBKVaS/McuhYeZag/rpy1hWDah0MerpJIPJUAiSPCrSHHwfJ8Js+qifuI6gbisdOFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ti5ISR5H; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-242ff06b130so16004055ad.0;
        Wed, 13 Aug 2025 03:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755079474; x=1755684274; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WDWyXMYmlYyqkjQ5tAi1Mo+9H+BsqxqH2MJaH3c+pQE=;
        b=Ti5ISR5Hj5045isFeU0lo8mVFyl+al+ix6xNJW4cOyjA9hvWAvjJkSP/a9e1Kw3OHZ
         F8WcSfvN6ifzpQcnWF5aaCg/YTMnQFGai4Tkeb0Otm5myGLCwYewVtYpy9qlHt6QqCwr
         iSY7KNGVspllnYc0i3yik5DRQCrGdKdqdf2zL9EQdpef220kJCo1Glec++5WdmxCvDey
         Piu1lbgLDjkwlMnFtriiWjk8vOAAWuvOlmejtqRGfOAn1ay3NTlIGEo0RYNMn5fu5rlU
         fUwiSnWyKp0XuuwPNCNUX9YGTBYLbsHyEKzpiIAj0W2rnx/qMCofkNepQCfF6ojwNMA0
         iKoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755079474; x=1755684274;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WDWyXMYmlYyqkjQ5tAi1Mo+9H+BsqxqH2MJaH3c+pQE=;
        b=OD2q2BVOfIKkVKrBiSoxNvElmcQr/kUGd7enJyfKscUmMtJ3hW3qZcotuiMwXNnKe7
         7MwZ6ldqt+8FFLHmG6sKDZLjrgFyf7IHhnvXwfP7j/KYSCeNmNli8UN14e9EnYxMOp8b
         Nes/SiCV6Fgz6E4YBydu8/XUvBxQ61XWP04oNY8kftUQiC5PhL9Zzu08UGhHudyXn5jl
         wv58c2uowYs8X47Y1mnnjJLsGgF++eQjShHSsX3hWN21UfMwmrfXnvPWb5qrGCqd/JYk
         rOO7vyz4skajD1zu59WR9OiZrx/DATAZdveIaVQGzsOfNDbGLiVAGAvGbPOI+TtQg60m
         U0ew==
X-Forwarded-Encrypted: i=1; AJvYcCU0wVfDSZY0beOREXGAE4ImMo2vF4g/ut3pjTldfQ7bz0vhPRto/yu5LDAZjqhgyXfmJfuPE6OjfiJUet1L@vger.kernel.org, AJvYcCUqeb//rprhACsuhHoUM42h94848i5A4j05QF2NzM/DzQgB/x7iqczjYFJQygefRHhJT1qidAHHV+zQpvhhqH/AmJE=@vger.kernel.org, AJvYcCVNH8hVi6T3ehjzUGUhW7L6UKhod2Xz2od3Gvhq1cOrNhHcWtXh/TAmuZ5F2R9K/3v3MbKMDEzwUQjgMnnA1/s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWusMaTvsgP5iPXR13eoa766oU57DgiXtXHvyBfxRDP9zL+aM1
	xAiTnXk6ypNtASqdXomh5gFAJpVPUbe2K2G8nMJc4cTso/ZKax8YQomB
X-Gm-Gg: ASbGncsRDS7H0Nl0KX3STtXG950HspsgmAZbFpMkPVt5CAyUW12kdR8V4n3rdySygpR
	nKNXtNoF/OtjhZc7YjrRHggABFNGEXGHtQF++0I+rG/qEWqhFTwUbml6ygsCB4dY6/kTzdrT4GV
	UI3qjw8EO3/sm5F9JLES7Gy+CYtOnrQHZhcZJ1tI/+RLIwDk9iZStRJ6GbNCR9x5GfcokRjWKhg
	O82zHVeHH5o/bFwSINq6fC9YmB3+/CVgMZXolgregB9ho7kxr7fmYdjoAAzguRj6C8h4DfYDGZL
	DPojwG5CATQmnMsWTDuL2CuNf1+4EKu/wLhN6dcwvyg84Y/fdhHFZT4rdWL9qqncr1YkJajJ98z
	lUwh1dPoWI3CM6960GOX3NSRAcrvjNttn1SlSR8Eoy7Wn6jb1LWleVchtBNzSYaMR0Fow6pnf8f
	NM4A==
X-Google-Smtp-Source: AGHT+IGT3aAhDjpoio/fVFfqmIOKN4CEmb3nnrCVJEFLXp1M8jEYK3v6BzGjhuS8hShYz0ZD8JlaDw==
X-Received: by 2002:a17:902:db12:b0:242:a3fc:5917 with SMTP id d9443c01a7336-2430d0dc67bmr45068265ad.2.1755079474310;
        Wed, 13 Aug 2025 03:04:34 -0700 (PDT)
Received: from [172.17.0.3] (125-227-29-20.hinet-ip.hinet.net. [125.227.29.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8aabdedsm321545335ad.167.2025.08.13.03.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 03:04:33 -0700 (PDT)
From: Leo Wang <leo.jt.wang@gmail.com>
X-Google-Original-From: Leo Wang <leo.jt.wang@fii-foxconn.com>
Date: Wed, 13 Aug 2025 18:04:13 +0800
Subject: [PATCH v11 1/3] dt-bindings: arm: aspeed: add Meta Clemente board
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-add-support-for-meta-clemente-bmc-v11-1-8970d41f88b0@fii-foxconn.com>
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
 bruce.jy.hung@fii-foxconn.com, Leo Wang <leo.jt.wang@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755079466; l=935;
 i=leo.jt.wang@fii-foxconn.com; s=20250618; h=from:subject:message-id;
 bh=+J69e5YqTj9k0Q13XCuEnilTg/3SIAicfVR3jNTVkYE=;
 b=W00fAaXOnIiR/l9ZRnJcClS1vfLntgZc+ygrhDBzU+WRFiaQLz8OR+xeA5TrFS1TEUl0Noci9
 +Xx83IRKylaDGTK+9a95nhTQAKVaVg0PhuVGMJ3HoxhQ8Vu3njwx103
X-Developer-Key: i=leo.jt.wang@fii-foxconn.com; a=ed25519;
 pk=x+DKjAtU/ZbbMkkAVdwfZzKpvNUVgiV1sLJbidVIwSQ=

From: Leo Wang <leo.jt.wang@gmail.com>

Document the new compatibles used on Meta Clemente.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Leo Wang <leo.jt.wang@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index b3c9d3310d57c065215054211cf5bd2af816906a..aedefca7cf4a80b5c9d14098b60ce277391fcdcb 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -82,6 +82,7 @@ properties:
               - asus,x4tf-bmc
               - facebook,bletchley-bmc
               - facebook,catalina-bmc
+              - facebook,clemente-bmc
               - facebook,cloudripper-bmc
               - facebook,darwin-bmc
               - facebook,elbert-bmc

-- 
2.43.0


