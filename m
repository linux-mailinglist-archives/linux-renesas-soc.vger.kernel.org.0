Return-Path: <linux-renesas-soc+bounces-18492-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 525DDADE752
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Jun 2025 11:41:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A11B83BE51D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Jun 2025 09:40:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EADCF285045;
	Wed, 18 Jun 2025 09:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OL8OH/38"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C1B28469F;
	Wed, 18 Jun 2025 09:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750239627; cv=none; b=jZly5xWmQK2r3FIuwMSOf4iz+EqFjbmXWk0a7QlQGWflI3MWdOgFnBGr37Ce/zITkQ3PSgN5KGtA+45Mej4auOrlSO7pN8+xo94SAlGDvp1n7+jqFm+Wnpn9arkB8Wmmy20vIFzJ/Pea6HNroWY9eXltJRUcwbytOCcUIoshPsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750239627; c=relaxed/simple;
	bh=GnJuV3HZHZ5dsfk5omBq556B4S6C3GeRW49ZlxKiQm4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kRRJZMnVSLKyrCF8hvXQYT1Kss8JCPvmXr8l7rc3sec9goy0n1Qi/es7pBky+PtwCk5Q/DDAaJ4z9m7J34P/EB1Y45GW0cEl3HRmDzJSNZ9ASHYZWbxkXzN0yVk0dW5pZeYMd4YFuBtefkDIVfaWAFE7akuP5schs8Wn9o+DJ4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OL8OH/38; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-748435ce7cdso5646098b3a.1;
        Wed, 18 Jun 2025 02:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750239625; x=1750844425; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yxyNJvaFnNxHerMMufs0K/uUcVxpSEfQTxbEEXxGd3U=;
        b=OL8OH/38QUviJw5cAfqXKZ86L2nBVEdyiXwWYF91Kkxg8qGEQJzjOg0At6nknGEUTU
         5/WvlG8gjGcJ6xIEUUSGGSTkT74C+T/vJkDbihzetuTN88NfF12lCP/MJxDyT92ZsQP8
         OJSoibKz27SuZaiNcx9mfhinjGfUNONRq9hOUtwpRCXUmKfAhDbwSYCniRFvN5u0ED9X
         e26NxrpT6jmIVxfoHvBvq2yvmMSpHkdKKsA4enR3eokBS+5kPBReb+t/oI4an/G5ylVn
         skJ0+1LMPbMzUbSrVXuzmaCkehddlBSQvXmUT4P/kHduhPkfCT3G+sldpX1ap6SJYzaA
         Abfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750239625; x=1750844425;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yxyNJvaFnNxHerMMufs0K/uUcVxpSEfQTxbEEXxGd3U=;
        b=UWF86yQa3d1hbsOTb0ivLYPogAqHRTlS16WeJZI69g+5e21e9tSo3P5XTa5ijydCKv
         Y6wIV02uicYbU2rLdkG8pQkQ+9ru/YcO3cUB+1h+K+LZdy7xZNBwcTvMVtHmdoqPnm80
         svKe6Bqh7icHc1Ildma4JQshjtK57c1mqppcbG1ynEO7/6d/eVjSYriGcIeVzfQv3AP8
         YEnz2Uw+zqmig0ID4xTj8dEe+4X88QEvMeruvPq4BT8SVl8Prxx8sdaclURWwgWNn+9X
         OB1yEKfuUzqV/DZcC/YPoRM6IWFV1nDYdvnssnQBqBiDRI5pQP4XPgWxtq8UF10W1aeh
         A4Kg==
X-Forwarded-Encrypted: i=1; AJvYcCUMOF9ZS3BoOFn4pZ8I1TyUu38rGfcn9945E5lPNLO0N35ozcl0Mz1iaAMtnvlaKzU2NHPAk1gt0m1HPFRy@vger.kernel.org, AJvYcCVPdJChpbcm7YLS0AwoxxpcsmJKFdw/KivbPkBRv7UVtHGF2Ouue2r2Jv7vIf8/Fs3qO+1ZnAqbcYuaNAV7WN4=@vger.kernel.org, AJvYcCVa1dObz0dvcJEQ1qPKOX/40meimc/bPGhJhl13Kyq89OFwFBsbnuCH4uBe24bHNv3mMSXRlDoPIGArY64KOPWTDYg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWqj6Xhw/MJtv3HBMhAixU1TTBvDqnUckkAADhLxD5iziRKEn5
	+7+RBUsKkY/Akgu+yNm+9z/8vxYdnRxWPBH+/+DF3MALnJPHGZqKkHzp
X-Gm-Gg: ASbGncuquFOUd2Wqa8Ic54eH+jovNyFYNEIjViNlyh1tZT3fcwLo2TM7JN8UdFGf4Nk
	7r6iEb1JQ43F9umLdBF6Mc+Pr83ucs/QoME2sE4rr+V5yg0gB/29b2JfleN5ru1jxPJxRfW163e
	sYcskEkAl49J9cP5RyaO2LUwFLPdicV/jsf6nIfSfEdFFpLV8NZKmK681MumYh93Xn2nA8Ut4LX
	r2K4p8PDHWaaIuFLf2FKIl3exKGSPRX/Xm2cqCNUBouY7qSYm2K9yQjjJgS55ifGVGtAXumTHkM
	YuCsxLAjeRxYY0T7N5j+mgUmcmDAi7Ay1roEyExw+Ufq1AKXo8hkFnnHL3udclbJ/MnWBykEvCN
	uGgtRY3v6dqDs7b2SHDvMpCB26sKQTukLqai4lBSOuA==
X-Google-Smtp-Source: AGHT+IGIFkT9F9++RE5EjOQYpeKdGxSShR/I1mIh5GQ/Kl0wHl2IVWy44QjHga7/1JaOEFqYchwQqw==
X-Received: by 2002:a05:6a00:893:b0:748:2ac2:f8c3 with SMTP id d2e1a72fcca58-7489cffb9ddmr25901716b3a.24.1750239625553;
        Wed, 18 Jun 2025 02:40:25 -0700 (PDT)
Received: from [172.17.0.2] (125-227-29-20.hinet-ip.hinet.net. [125.227.29.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7488ffee2aesm10527123b3a.24.2025.06.18.02.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 02:40:25 -0700 (PDT)
From: Leo Wang <leo.jt.wang@gmail.com>
X-Google-Original-From: Leo Wang <leo.jt.wang@fii-foxconn.com>
Date: Wed, 18 Jun 2025 17:40:02 +0800
Subject: [PATCH 1/2]
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-add-support-for-meta-clemente-bmc-v1-1-e5ca669ee47b@fii-foxconn.com>
References: <20250618-add-support-for-meta-clemente-bmc-v1-0-e5ca669ee47b@fii-foxconn.com>
In-Reply-To: <20250618-add-support-for-meta-clemente-bmc-v1-0-e5ca669ee47b@fii-foxconn.com>
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
 Leo Wang <leo.jt.wang@fii-foxconn.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750239618; l=939;
 i=leo.jt.wang@fii-foxconn.com; s=20250618; h=from:subject:message-id;
 bh=GnJuV3HZHZ5dsfk5omBq556B4S6C3GeRW49ZlxKiQm4=;
 b=kKncC1/JfGB/N2IhW8rVIODlEvFaJAyarQUMd5sSJNJUJOeW9FTUDNZ+HazhqmrGqkNcIPgk7
 1Pq8/J1gtwtDKVQlAfgt2NZ9yC/3HZC2ixJ9zGBeriuVgFpHIe0dvQ1
X-Developer-Key: i=leo.jt.wang@fii-foxconn.com; a=ed25519;
 pk=x+DKjAtU/ZbbMkkAVdwfZzKpvNUVgiV1sLJbidVIwSQ=

Document the new compatibles used on Meta Clemente.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
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


