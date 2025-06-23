Return-Path: <linux-renesas-soc+bounces-18622-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 68956AE3C5B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Jun 2025 12:30:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 719321882CF4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Jun 2025 10:30:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2211423CEF9;
	Mon, 23 Jun 2025 10:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c3Jxr4a0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F2423C51F;
	Mon, 23 Jun 2025 10:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750674581; cv=none; b=Q85SWKpVIvJa6SsSUy++jnKbr40FWxMS3IgYavAxaPd6k0sX2Af6F2Qh5w6PxVwlcJBxtw0O7Zo+zITe/sE6+33OkwIwimJ95T7neufTcXPkPvhrlOmmNQOam4toWUYx+K3Qeb2oW2EUVI9A5SHO2Iq2lrhSn3NEckwtJxKiPdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750674581; c=relaxed/simple;
	bh=B5JXGZGmMiWSQNghFqgfsxwqKjADuBDCng2oC7GG9V4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=faJyY2H+DHSfl4j0adaXyFDeQX5zsPV4Xp1g7evwwbv5C9whjOxJxAMJcgdSeSn3yxmNEVOyQLn3+XhygeljutJxJGzuklTasHPafrcFyOA8uVhKt+xBXgm+1jtkqVtwp1SXYPwdz4eQlOZUlIadD1muvK2rgOb5aPi5+vpXKJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c3Jxr4a0; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-234b440afa7so40595695ad.0;
        Mon, 23 Jun 2025 03:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750674579; x=1751279379; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SKbBTi7IDp31OkTJ6cIcfFVheRI1s9qIcPf1iWX2qRU=;
        b=c3Jxr4a0/KZx1ar9dyMZSS09Dd3MdMDN2VQM1LhcN6dbleDJFWNab/5XUbwuOi8e2+
         Dn9Y2fLS4ddl6RStl1TiK5/AcRNtNvTxwdNyAlGV6nqFSvdgBYmJWjUvATcn+AujXNnR
         vZHUmEAjO9cPH7fExDfcBLpcIlU+GCFo0XjGd3Z71BXBpl41Mm/qiwH6fG9uNR4PNPXm
         zh6uUTc94xrN4yi36nbGsxaMyLctuUp21WvDNCUOdArtpaW120FMUJgfYmyNXiyHJQbN
         hjdwd3UcN9eh13lFWU/k8SN+uetkgvdF+qucNDoQqLKPMxqcXhBuR1ZdudwMVhRXJNGl
         3yRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750674579; x=1751279379;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SKbBTi7IDp31OkTJ6cIcfFVheRI1s9qIcPf1iWX2qRU=;
        b=MgMFClVjb7MUMYaM7vaz/NiYE2LPeEGf8FNK5r9tZBPatv89IfgIxqTWkurWkoeHpq
         LQf/4R0FIEnijfY/0kBYgAgjhw1ZJq7m5xluhc+Qxwhf+2dtAMGmyyBA/ZRwmfrDOf8y
         TSgZEulOW+HkPRBk9OgywcBhKA5juD51EH2IaaQqXxHaCYwH4xCuakM299j8vN0SidPi
         mDLxtui18ikZRjOscpR2SUFe/T9yZa2v2d/wsB3GlLDczMB6LsQpGc7oIznjcW8mY7NK
         E5jxwdzsMkfmcTPJNFjsShnAeWT/3kugVuo4t3ql86FEOv/uT79yVjqFWv3B38Kz82y7
         GYIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUN/uo+dXfTLwOJ8MiluirB65W1FVLwfSJ1WtxLFwyt5m7ElU2OE8T2dJAzYLMtEmyg8zZ7bAknFAeYvQmqVzbQINw=@vger.kernel.org, AJvYcCUtZWgWGrqOz0L6xXUIkzFeZi89Lzc4z+qu5NppA74Q2KDeBXcHmY/aAht/rbr5+UVd8c7DB/tCgylyAzmGwJ4=@vger.kernel.org, AJvYcCVB/6h85soB8kY3T7Ffd3yWzjsGglqtKX5RkQoHnHA9xNOFl+suCEBVv61G0RkCvreXi0u+i+3sZAzBfrrX@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9+OWYrZb4JgTQXXNFeyez6cmJOXentfS08RcEVxDjD0o/VhU/
	5bWkdc+8udF7IVqf/ovsYaqM1j2VuW3Szixp6FiNOZf5MJnTHtXVP9qa
X-Gm-Gg: ASbGnculR1lwaODxF28WuTZIV4Of08QRj+m4K4Hwi/Ie33wIdsgSw2H049wIsnEENd0
	8Jw3FvNS1fmMWH66hKfpYmILiApDaVFZSfKiK0YxFEEqWPhE8WH3ul6ry79UTFuIT4fAtnc4EXH
	grGK0ijJyrGXl6ZTx0EGPNSYyV68HQbJsaDyEzcYm4VgHMMqRgKvGhpY6ymmx5H7dBGsKnFqBHF
	F6tHYWns9Zh5P3xFz1hk6nGQ/h4OFTFtbgw0gMFaZmSqA50/3q+BWeaiUagPnGmesat54SJUD4f
	Ixw5Xzy6rdJv7T0KuZT5nzUgS7YJQ7+Sled1a+FLqINIgRjuAiWI/YTYrHFesV4GdcxLtGnpt37
	jfkyTsq6ADnhfCHA+Mw2Pi9WdEMZ653Y=
X-Google-Smtp-Source: AGHT+IEM86EF9nrBu/z1x3IbxT9Xm3rBZ+c5loqQcmDNcyWe1L+5KmtdP7tl5Xb0XGFSrI5YVvs/Dw==
X-Received: by 2002:a17:903:32c5:b0:234:c8f6:1b17 with SMTP id d9443c01a7336-237d9914c92mr190971635ad.38.1750674578719;
        Mon, 23 Jun 2025 03:29:38 -0700 (PDT)
Received: from [172.17.0.2] (125-227-29-20.hinet-ip.hinet.net. [125.227.29.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237eec29a77sm39901125ad.165.2025.06.23.03.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 03:29:38 -0700 (PDT)
From: Leo Wang <leo.jt.wang@gmail.com>
X-Google-Original-From: Leo Wang <leo.jt.wang@fii-foxconn.com>
Date: Mon, 23 Jun 2025 18:29:01 +0800
Subject: [PATCH v3 1/2] dt-bindings: arm: aspeed: add Meta Clemente board
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-add-support-for-meta-clemente-bmc-v3-1-c223ffcf46cf@fii-foxconn.com>
References: <20250623-add-support-for-meta-clemente-bmc-v3-0-c223ffcf46cf@fii-foxconn.com>
In-Reply-To: <20250623-add-support-for-meta-clemente-bmc-v3-0-c223ffcf46cf@fii-foxconn.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750674571; l=886;
 i=leo.jt.wang@fii-foxconn.com; s=20250618; h=from:subject:message-id;
 bh=jaJuRFuiQIpQeCgkDZC/ZckoYXAyyJRWtir3QL+VwYw=;
 b=SKqzHgYPQ7Ni2KNl1y7P+2ODxJOyoncuzZa0GvAoEHY7gKk26Z/Kibl+bR6P+55cRpMcqRF9L
 4hN7sj9jUWSATH9TH4C28UZ3RI0XXbKh+DvC+mnx3ZCpTpfLhEnPBrh
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


