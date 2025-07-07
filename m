Return-Path: <linux-renesas-soc+bounces-19289-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D44A6AFA8A2
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 02:39:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D83FF16571E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 00:39:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF92F188CB1;
	Mon,  7 Jul 2025 00:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BQ6Hlyf/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646B63FC2;
	Mon,  7 Jul 2025 00:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751848765; cv=none; b=cSAWNqHGnY3sxA2K/oW5NCoOFULJw5eQv8lNeVwLu+tqkTKNCkj76/OKsFT5gI+fSIlrE0Lg0pHhhsiOPADIpYJcVlRPegCvyo3EjzXga3v9ZtfbAloZVZgReYJmBK2qyX929jrf6RvCKBl8R433mfn784VEicfrHKMwe3UCRFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751848765; c=relaxed/simple;
	bh=SVPLbWyca1a4OSB2CVSlsEh7UeHWhuXf15YL7JaYkk8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=es0Ja11v/zTuVc2wuAqrlaOIUqq1VGXTI82dGDDRXoMjOyYxWSaYvb4SNNbOP5oYPvlBuKivyR8DG5Z/C/tjyN672oG4IESg/YCTf7+IDhHZXLmV+FSz5lZ0vQieZ5uETZOK3oSUhyOdaYFcrsi6BDVyrx/9BIZRhZag7WEVoII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BQ6Hlyf/; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2366e5e4dbaso26373775ad.1;
        Sun, 06 Jul 2025 17:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751848763; x=1752453563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I7hm52P1SEWpg9h7PZbwwdMMD03gIGKekWyft7S+Peg=;
        b=BQ6Hlyf/KanDiLBz7ixs1Lt+ATOdp/uXrgDseYnieJhN/yqIFJ8cL7W9FzvQvrxx3l
         3AfFRQnYClCTbKcjaL+frqes48lV3KJkqQaXg1PaH1wEWATKcmz7qHPsDozcNRW8E7cZ
         SRZvLCP5rAUbdhnW7/+5DKV6hE3/lBLsVZsZWa2KV4MfqaL3DfKFNp/jtPlTsQsNZtnE
         vC6X6pixadU8Av/6poZsFkOHhkX9Qln6G4gHgL/T2yskrRMupqyMGrZYT4Xij1UDVhna
         NwZA3/Zh8825cGew9N6S3PyBOSKEPQX8Tknwgd1nUjy3Ss4Db920WeRHQtC5eYmZRlJd
         lRLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751848763; x=1752453563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I7hm52P1SEWpg9h7PZbwwdMMD03gIGKekWyft7S+Peg=;
        b=DXPwgU0cHtv3H/fHOCG5LCuumyyNi/0m/pJRisWWsEuZW3Ump/oyWITXrMjAgL/vDX
         3WleUqgNYA36sVw9AzPYvR0a1sPy6DHxfUL1yfMOhk7EvnhYWZRvn10CAI1tRMzekXoQ
         XgG+b2bITOU6CpWz/FcDh+sarBmZIU2yz/oWiJnhzm6l/f4zdjYgGcwrwHrgrz9X5gnv
         MsXO+6t2j1kNWheG8j638MPIbnfrv0/2yHa6pOnI4/um/oI9uENg/zhSj4c7Llbrl0St
         HKDG/kE/HcB9V9B/El++uNGeX9r/w/eSfaJT0wyzsZarhC2pXdp3twmX8ONyXNTvXIFr
         GjFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVToA7lES0U3//biGXyZhlzKKVXOFtwU9gjL63gn9+DJpA3J6JSns/RaQ9u5FALp9rotGOB0SErwOeQIOUEIQ5DdHg=@vger.kernel.org, AJvYcCWxUH5SFmnHDzky5Kn4qb/5rs+HU9mck2OpeXGr+kEhuAr0q66dXv7ovpR9srK65hwmhPuFwUu1bPTHKcI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6hBowxl98KXAmZ/aswmEhBZXS+RbyVtCUW5IJZBA7x8TRjVX2
	JEJGkrLMN51ImWeWTq3sU7RUTMrN77UT/fqNnrOeLfCb8TEIjHfvnb5TrTQfH5XYAwY=
X-Gm-Gg: ASbGncv5XBrWb6gF+OtGLUyYPjRtME3ThLhb3sellZ0p0q/O4QKljCuYm1r3DT41UZf
	ZtyPYyluO0H4E3YM8KrzmlfQjLfQx3JyyS2bS1evlA2ZvIKfI6idQjOU3u8D+h82YgFu5iq/ftP
	9HEqji+8mR5INjf9Ors4/DAV8/4QziBgf5N1ES/kGGcxN4eHwhZcZRujVSl9k71I58OvZONWWLg
	sh48L6mPUZofduzIy8WVjCe0XRBAOkDjXgsAdj3/6fKC8j9GsLUCZEyJcV580GnMo02TkN5dLCs
	wNBq/tgkuu2W46a5ytoLQfU78Uv0GZZuiItcw+JiwZ4=
X-Google-Smtp-Source: AGHT+IH0J2mJY9AqKBebyRUlUD4JKQb7MStpNssN95JlO9+RVi6mU61IjqWEOg9BDlKQbW5NBbN30Q==
X-Received: by 2002:a17:903:2385:b0:233:fd7b:5e0d with SMTP id d9443c01a7336-23c858866c0mr181839245ad.5.1751848763550;
        Sun, 06 Jul 2025 17:39:23 -0700 (PDT)
Received: from archlinux.lan ([2601:644:8200:dab8::1f6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8431e2a4sm70308085ad.19.2025.07.06.17.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 17:39:23 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: netdev@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-renesas-soc@vger.kernel.org (open list:RENESAS RZ/N1 A5PSW SWITCH DRIVER)
Subject: [PATCH 1/2] net: dsa: rzn1_a5psw: add COMPILE_TEST
Date: Sun,  6 Jul 2025 17:39:17 -0700
Message-ID: <20250707003918.21607-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250707003918.21607-1-rosenp@gmail.com>
References: <20250707003918.21607-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There's no architecture specific requirement for it to compile. Allows
the bots to test compilation properly.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/dsa/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/dsa/Kconfig b/drivers/net/dsa/Kconfig
index bb9812b3b0e8..f872236d5af4 100644
--- a/drivers/net/dsa/Kconfig
+++ b/drivers/net/dsa/Kconfig
@@ -92,7 +92,7 @@ source "drivers/net/dsa/realtek/Kconfig"
 
 config NET_DSA_RZN1_A5PSW
 	tristate "Renesas RZ/N1 A5PSW Ethernet switch support"
-	depends on OF && ARCH_RZN1
+	depends on OF && ARCH_RZN1 || COMPILE_TEST
 	select NET_DSA_TAG_RZN1_A5PSW
 	select PCS_RZN1_MIIC
 	help
-- 
2.50.0


