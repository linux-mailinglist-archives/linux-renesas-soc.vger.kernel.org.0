Return-Path: <linux-renesas-soc+bounces-21140-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F27B3F11E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 00:44:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9183D7ACA8D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Sep 2025 22:42:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95C35286D61;
	Mon,  1 Sep 2025 22:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PSHoydf4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5354285CA2;
	Mon,  1 Sep 2025 22:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756766628; cv=none; b=bwasbQjjddQdBaZo3pG4dMMxXB9gAm78mP4hUzK2p4BTiDGaM7J7TGhPJetjScWqciJnKhwB0c1jGRLm9NcF7ii4rRYvIWhOQFDnVpDULPZ1Tvg6d0LodRs0rETPTrHxi2iZCNB+H7JhYOGNeIHHvhXuH8lwepsdTeO1c86Xobw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756766628; c=relaxed/simple;
	bh=wlVXDxSWItE7cOaNVUxlk5yJDRsf2onCqWK6Au+TPRY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uekvTy0ZuVzBDlfU28jsyhywaAufY6oOKsVTju8FAxZl4NVBpghxsEE2jScdttLv+Lo1BzibD2F1bm25+u/vGXv+kTBQyiAoxZjmDv1tlNJKzxBthh0x1VuVRduyFgjeua2KV1HtLSvD6p8NRzGe/JaHA1A6wiyMDTDGQLyEFtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PSHoydf4; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3da4c14a5f9so22805f8f.0;
        Mon, 01 Sep 2025 15:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756766625; x=1757371425; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dpf1HRIReBhclGaGoeU5lABskc0cPSkWsjSryTq94ho=;
        b=PSHoydf4a32M+9wVR96ZCoFkOrk+0oVJiHyStsQn10nr5zPStMQF1F4K4/y6mAvlYB
         SZA1LXD5FWNaSqZUh/tt+tp/Vr9vn9Us3Q/V2uleshZcQyN2T1ahNlm8M0IZVr0Yr6Qn
         Dem98WOCcSWEXpG84hIPZrfXS9TMBgbq7znjBmArcM5psz5V0xDktX53kyC7oev5KImA
         Kj4W9XMIMZ0mCbVeW4NaWyWbWTMvMr6rnTqdqq7Vvng8Go8R6xTH6AeZtDh0igYxxQGr
         /YKkrPoh2peIxknvSwJ1OSPN16mUhBqE/Ypz1Iqdsb7zfI7sxGRKn/ImDCXT5faIP2wi
         vPtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756766625; x=1757371425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dpf1HRIReBhclGaGoeU5lABskc0cPSkWsjSryTq94ho=;
        b=ELiGg8qRl8M6r0PmH5eG+Ggk7RO7QLAJHfz6/aWe/YBfcBNeIAx2aXP+cb6URqsG/v
         PhZsSaFsWN/XEKicrb6muljtJHSqkeN51IonoF4DBiDSrvypEnVVG+YYgtlB2X7JWUvo
         epI7r3b+qBAWDrwsgNUKm+AtIbEciOEsRnbHAYE0evPh2X5vM9JcBaic/wwv1oMjUX8F
         a5nwhQKyU7xhc24kndmN25wM41Hnua50Q3jT/71d/k26jov/0HvHcJRxMezY4Ffkp/sx
         6o/2uPKruR4GLzfz7E22g94y63lN1uDFlZXcqbBOEAaJCoffduBR4EelgEz8ICXaqSZK
         hUtQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8zshN//TYrS1rds4rHN5eCltuSlFRHBZndC5YRFgQBctQP9J9sxWj9r9KfhuGscJjqGDM7NqSSRWW@vger.kernel.org, AJvYcCXLSQtBQ3zPUZCqa+QykvrhG7MvSRBMPqYwSxx8E0ngMbNZsng20cgO7GABQNMWqB621Pi5Z+TIdP3fyv4R@vger.kernel.org, AJvYcCXXiqkr+CTa9iFO6ZHVPbfn2kWiymrQKa4v1MGehBWq1ilZSAT00hYdZXEZ19W7UyKlHB3ZmGZx@vger.kernel.org
X-Gm-Message-State: AOJu0Yys9KVOnIZy+r+L0Nji6EAqwU6nrg8VfPCvzhjcj1spL3bDMvq0
	H07j/X5mKmJj4IEVRpLofUbHZdHNpZO/CvUzL8b2i2zXRfwVlAWP/DUC
X-Gm-Gg: ASbGncv5VGorpgls9O4UKOisKzSxh81yUPTMQRCm4hvSMllmdZgPYZJTBcPzbo5Tp03
	5fT0kXPNkEJN+Wr9WdpobJY63JdstAxqvtuH1PR+s6/CqAt6BP4Q9gnWwxuV/wjUp/8AoxvBWCn
	qp8kwZ2uaziynD/5IPwATV82lMEanFAoKlVTPsTG2o3hiPNXLYCWgtlWnyIMbk7JEBz0hvHdfaC
	4Ijf3bsn0QuXEacJkTtBekVc0MkKkf3/kjarvDN0MnHdasnIhzuM54N0A4DSFfZQ7Bs52TIqR7R
	oyBkBhJKSqWyTw5NH6fgHNfLmohkpGHDy/p65wnoTfOB5M03hQfyEeNidPqhTPccPPKVQzPK1ck
	dqqzIxMgOQW6egQJSbTGM7E8ftxTe/1JDebBIcp7UOW7/Vw==
X-Google-Smtp-Source: AGHT+IFQ5s2CZF43iW9WLb+4YZLcpDojaIyp2A+g1jFQJ0oPOYqt2voW7VHUkGCc1JKAEI34+vNjHg==
X-Received: by 2002:a05:6000:144b:b0:3d9:70cc:6dc1 with SMTP id ffacd0b85a97d-3d970cc6f4emr1191422f8f.6.1756766625104;
        Mon, 01 Sep 2025 15:43:45 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:ca6c:86b2:c8f:84d6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d2250115fdsm11532607f8f.40.2025.09.01.15.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 15:43:44 -0700 (PDT)
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
Subject: [PATCH net-next 03/10] net: pcs: rzn1-miic: Add missing include files
Date: Mon,  1 Sep 2025 23:43:16 +0100
Message-ID: <20250901224327.3429099-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250901224327.3429099-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250901224327.3429099-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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


