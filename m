Return-Path: <linux-renesas-soc+bounces-21139-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 80884B3F11B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 00:44:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64271487FD9
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Sep 2025 22:44:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75D8B286425;
	Mon,  1 Sep 2025 22:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="REgN2tW/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01F228505C;
	Mon,  1 Sep 2025 22:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756766627; cv=none; b=uLtv1BEubYa/Q4gr1WWExxHkoOVmJsiS/KEqUICJ4pGtflN51UtN0uJ0SZ/nQDxItZqVmCwVwuU2xTgOegO/0SqOY9XCahzcx0nnGmw5W3cQxFXurRrT4jp7bz8y8bT5UBYiQepvClKHf62pbtDtEQHP+p5gdBW/GDeGlEHn3Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756766627; c=relaxed/simple;
	bh=UI3CRtkshl1AnoCq+kLhk5wvlAEGqmE3Dv37ID9sLIU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hbVK7KfhFDKyJDKOox5WzH+V5tEyZXYHNjOX1HXPR4QoPnZZbo8nKfDktQxkOL/D+Mvsy1MpC5/Utdil7CikExBe3HoqH6CNWc56aMfpdkfxQwEictjWyYFesIjopQMGe4X/NldlSi0aMPH7FuNS2rcdvMZhK8saswYctQZFh/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=REgN2tW/; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45b7e69570bso23337815e9.0;
        Mon, 01 Sep 2025 15:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756766624; x=1757371424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LRxsjA1/FhLHHhjYL51G49JTjlgrH5OyGIJZg1vJb5Q=;
        b=REgN2tW/Nad+b+Mpb3xm9RoT3FtGIVywfLblQSbFdhrpo66Or9ad3qzflhWUqzm4hx
         JJbXpaV7lsPolvq4Nh1pTvYat2PDaMr96NMth0+RBouVKPPdFC9BSOSv5hKHtlfJ0KGB
         kAJg2FYfw9TM443muBDXdNp9l+UIAjfrPnP6P0bjiJ8fhOBxQswk+fys3uVt7Tlht81Y
         kDVVHBDevgeo1uVKR0HgzRuZWZJIetHfz8k+IcRfJ6WjVGoGco+sIXKuZgdj5qR2PXPg
         Vz1wFyx0i+aIiKsQAqv+yNgrVp8+/dt07ZdcDKsAI5QnGFBgoZ8jJCKBactb8h0hpRV3
         jpYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756766624; x=1757371424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LRxsjA1/FhLHHhjYL51G49JTjlgrH5OyGIJZg1vJb5Q=;
        b=b+u4UIr5n0vS6XYa88rwrAdxFVhKLq2qUvpJncj2yg6YDNjUc6wUDRiKp7pQnFNh/p
         3o1Ry942ZiR+QvuFYVSh2PrDJEqtY/9FF86d30V8gXGyykghbAW08sED9MPYOHTGauWK
         LvphE1dUcJJnJTj6KtfZ20Qv9eHiOOBabAajfQAPZZ6sBa4gdwtKW/ZzYiG5kHjTUn6n
         TsAZfQQ8AJEy+aEc2r2jWFfJI+ibtGoMqSULeVlWI52eej7XVv93J2exdHV95xq/H1pL
         mA9SuPfGumAfSS/FPW8ECNSChpaxVGAa9EHPl9j6mXY8XP3wqTo91t2Xo+toWjYmRhfo
         rO+A==
X-Forwarded-Encrypted: i=1; AJvYcCWxFeD88iLq0BcUk6X+CmrnYzEKbCoEwsNm/FjYR5gG8YRJSySUtrrknmnIFR+ysyY//7ucSQnTj+p7iJjW@vger.kernel.org, AJvYcCXnbikQqAb8nd+ovO1SGKD3D6ENUKNLJbnMplErlBbgStbtVO7Cl3fHO0+TLUXRnGecJB9rBZQtAVCo@vger.kernel.org, AJvYcCXu8TR329yPKEDXLmEz9RJJUNe703CgAsBouTXHe6EAZdWovN7xu0R0fCB0Hax9tvHUzdKG/u3r@vger.kernel.org
X-Gm-Message-State: AOJu0YwzAWcWadtfGilxObSuvu4EULPPk4jFFLD2RQrbvIXmkMRwvme5
	3xg8UdphxOJV/ZU2Z9wEiGfKoT3T7sag2CZZ5J8ziHvXxPAY5OuEB+Tx
X-Gm-Gg: ASbGncvk3Hoh0ENykG9wRXpMSUoac6oFBGbZHT46mFqvds/Pox35QQFCnOHz63v/kQT
	tM6qbUvOEp6FOryzqvw0GEYZoNMi94i6E2T7j3s/GpTlyNGUeCQpjd1iskuKAiy4GZ9O4R6jngQ
	jJAEqCCMIZ44Xw5PyQJhql5eKMQ3Q1pCMU+flkEOIz5rZsWOSH5hQuU8MpaEVahnw14e2PA3hTh
	8k4N2i/xFqEHgyLOWx6IoX4sTqLzhJr56nsOkHHVohbEprqzphDffdbXlfYUbRGu2aMQnRLlUmD
	zxdpOS5BSFmErOs8kSoHwyEx6RIX1lKRYBpi0D5KEEN6SDvs4W+1Cyvt0GNuOKUIAWOmPEqTbD2
	aE8juP/maWXHtvDFo21Zi+mBsIyGYUbTUlBoTPu1U2n6FCFE6MscPrr/C
X-Google-Smtp-Source: AGHT+IHb4kHTEmj2bQZ2Om2KAmxngtW1m5OIbnlXWgqEHp6W75PVRI0ojABGojtcwHGw/Dt9iptNEw==
X-Received: by 2002:a05:600c:19cc:b0:455:ed48:144f with SMTP id 5b1f17b1804b1-45b8c85802fmr42594855e9.14.1756766623972;
        Mon, 01 Sep 2025 15:43:43 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:ca6c:86b2:c8f:84d6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d2250115fdsm11532607f8f.40.2025.09.01.15.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 15:43:42 -0700 (PDT)
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
Subject: [PATCH net-next 02/10] net: pcs: rzn1-miic: Drop trailing comma from of_device_id table
Date: Mon,  1 Sep 2025 23:43:15 +0100
Message-ID: <20250901224327.3429099-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250901224327.3429099-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250901224327.3429099-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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


