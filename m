Return-Path: <linux-renesas-soc+bounces-21742-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CF4B52271
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 22:42:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E28C9A00728
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 20:42:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8706C2FB637;
	Wed, 10 Sep 2025 20:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FtSXuqAt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC552F6196;
	Wed, 10 Sep 2025 20:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757536903; cv=none; b=qgLrsgj2hAWzwa6gmUv5vW8TDT+IwUvFAyDUbZBRWKs9KBXXg3gk7mMRFRt6pV6UjJF0MKoNkhUCMPkMrHtQQuRwHd3iAk9MwFPW8mKQtrZWs8MruO9hYnymMDHctDAgW88VXfmSlLQTdiiE5x6tIt3RDN5IEf0yxy7TdGbYV38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757536903; c=relaxed/simple;
	bh=wd52M7ZvycMZeok3nf993R/Gz/djkM/7p/dIXrwHKzY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o4feNhnLyN4gk5fQwT7D+B/VappfZySFIQDqmyyiC84VjayigMsUhlS3EWWqxL2G9ndktVDasUXrDXlbK3ZTru0vCUunvotMVTd2qq1I3pJv/LHjSg7moY/oZje7zKRM3MJEanDDCjliyjo4naElixYr/06BYIJy//mp3G918fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FtSXuqAt; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45dd7b15a64so368605e9.0;
        Wed, 10 Sep 2025 13:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757536900; x=1758141700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I2lMZC0VIi99OHn5JC3VGWGdad27Ia0XB9ewWPzNuhg=;
        b=FtSXuqAtuuF6qWfYwD1HIl/y8dGhKZ5O7QrTZT8vSiOAFXbLpz4kiyGIHan4sLHHw0
         o3D3296u+L6CJ/Yc8dsRE/l9s7yl7TYtJbvStyN2uC/KyXzGU/QEoNhHsqEkuMn7jjM2
         Qo8CEINTgtJpUygcRKovvN4Wwa0O2sM0duZlhL2tj5Iq7Vu6dN3Z+9YS5KrXM5dXz4mH
         v/7blkHDqLYbF2hDewywd3d+0s60fulWznM+2u9WJb6zzjxqmknq3y71DWFHDBizyMCx
         22Q3RxJZiCrbrmaQMt0KZBgiPy29ZH25qeLTMqQofEnA1yBeQzuO+xoK4HjVlsRJ9UVz
         YDdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757536900; x=1758141700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I2lMZC0VIi99OHn5JC3VGWGdad27Ia0XB9ewWPzNuhg=;
        b=k8Si4CX5C8SPMAou2ahMLNjTLiu7QPad65ln6ZQYTzwNsRAae74thBOaG+7ZUHt/hB
         oVs6LuxkvsNzzUONbt2kUzv4SeQzvYgWCDQYqVBxf+365yBegSkD1jQfGDJs7VCg2GgV
         JAamO3JFBiFZlCmNgUbz+p1ZsVys7Ffn0wN63Dah4qSHrpeOI0j7n4AItm380MQXtRhp
         /SjNZCZn2RAxU67teJr9ahpkusPd1QE9qMhVHVwseXf6VzSLU+Zng6IafWG74hJUFOoM
         WV4ndPAI4sIKgdXY8UzlvIMSzb+Nqxl0OyxEKYfboNzoEzogOUJaFYSGThW4laf+O7eQ
         qrBg==
X-Forwarded-Encrypted: i=1; AJvYcCW06+HIe4suVLNqOvvfJFF8FBWJsX1wVkHWVX3ZAG7hFLGaBxjeE0t8clyqNdIRv0ymZI1qGn9qfXMA@vger.kernel.org, AJvYcCW3TOR34I26tGklRgrdfsdxPGTTi/4v78yCmUrZcmIWxW/aZSh9dAuJIgto/OfoVwatEfMp4NM5@vger.kernel.org, AJvYcCXNwX8AJwiboWWuO88PPuxcHcr9jvTpjWreDyMu2+Sa6gqseKNjZqa7+aECQuOuPj9qDmx+gJ57yPeAh5Yj@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh3Mig5+BFfDp1AwT3H+ZfwmhAgFe9B46vVE0zx6YBppFLaqg5
	mvgjaXu8SWPMyq4iS6L3XqWrFwga2oN68SN90UWnUGU+MJ3GaUavLC3+
X-Gm-Gg: ASbGnctd8Tls7lGbGhq2xrv9ZGJx1R3e6UJET8seWshzQYppjI2MI3A9NsH/bnJcWPL
	d59bgRGjZqFISKbrExIVDeWUQXNgYxv9Maj2lvSal9n6dN/fjRc2Aehq9vG5KiwPHrnoCPjf++u
	EXzUENkP3f/Ohlr+gCRvBTLBKLH4PpWxn7027b/J0JbdkLrav1YDlY3m1mpTIDsQeGhcZ0IzxU0
	u4OwBIgydbeZAhbZ5tXYe0VUoT2myjKjtAYcwul0JjeqvcrE3ttbjnT6hjRG64twY5NJ934i1Fo
	qfvKj8UAjqtN4sTNlRtX7D1lPL6J3J6zo47skSQXmvn3zm7SklZcc6VgbeEOeeBF3rxg9XCUEgj
	nYQkzaPfTpgvmTw4XxGsLRUs+DDfdly7B0vxWMuUYE9FbdkE=
X-Google-Smtp-Source: AGHT+IEgRbR1uBa+DxXnxFuxUrekQ7iL1V77QfVxGjccSYmDdbJcwqVjF/J+jPW570375x1M8BIY2A==
X-Received: by 2002:a05:600c:3504:b0:45b:9c97:af8d with SMTP id 5b1f17b1804b1-45dfec8882emr5222365e9.4.1757536899999;
        Wed, 10 Sep 2025 13:41:39 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:ee64:b92b:f8fd:6cd8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e0157d68esm320085e9.6.2025.09.10.13.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 13:41:39 -0700 (PDT)
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
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH net-next v3 3/9] net: pcs: rzn1-miic: Add missing include files
Date: Wed, 10 Sep 2025 21:41:24 +0100
Message-ID: <20250910204132.319975-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250910204132.319975-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250910204132.319975-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The pcs-rzn1-miic driver makes use of ARRAY_SIZE(), BIT() and GENMASK()
macros but does not explicitly include the headers where they are
defined. Add the missing <linux/array_size.h> and <linux/bits.h>
includes.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v2->v3:
- Added Reviewed-by and Tested-by tags.

v1->v2:
- No change.
---
 drivers/net/pcs/pcs-rzn1-miic.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/pcs/pcs-rzn1-miic.c b/drivers/net/pcs/pcs-rzn1-miic.c
index c1bd7cd58478..adf4b5e4741c 100644
--- a/drivers/net/pcs/pcs-rzn1-miic.c
+++ b/drivers/net/pcs/pcs-rzn1-miic.c
@@ -5,6 +5,8 @@
  * Clément Léger <clement.leger@bootlin.com>
  */
 
+#include <linux/array_size.h>
+#include <linux/bits.h>
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/mdio.h>
-- 
2.51.0


