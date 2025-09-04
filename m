Return-Path: <linux-renesas-soc+bounces-21327-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABDFB43A75
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 13:43:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E2DF15821F9
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 11:42:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 897752FE586;
	Thu,  4 Sep 2025 11:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZArgeO0r"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5902FC886;
	Thu,  4 Sep 2025 11:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756986137; cv=none; b=QDvbn7R/Mh/G2an9MC3DbMqMoFw8WVfk7BpkG00KTYoUW/9I/68n2ZG9r8HRH6l0z6fNYd+YEfphNP7raaL8B8LvLBel4f4fb35vDWlDE0G+M6vJQcx44euKCUCv/iJsYPtPGGnsd7vti5/9V5TSZ+3uVV++c2Ie2S8n+szziLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756986137; c=relaxed/simple;
	bh=S88QBspoEo5uOdJkQcgMZha6EcNj57qrblWItO8/pu0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NzwRPMZhWF6+HQdEgTiVdjh+scUk5u6r8mLAcnTOt792rOCPnjKYZctQwtWtUbrindlDkb3nf4mQOMVKvTYT1OfMXVJdCK6Ez2wcXif5AsrA2j0uzl7mJpUyt/PomXY1xlrqvxIAzoAgYBDbLJhj1jurPttLWIqrmZDIU6wkPdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZArgeO0r; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45dcff2f313so4868635e9.0;
        Thu, 04 Sep 2025 04:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756986134; x=1757590934; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7VOFVWnlVOI1qQJy5viif80H4uziET0ECBfXBUJywU4=;
        b=ZArgeO0rHW8sfx0D2jrLWQPgvnIdb5u4brKIMNAV1hUc6kN0ZY4ucFmmYBgaJGfxPW
         H3MA1Wk6JcbGXF0LtMXpanZ9q1XMMiwNhaP2FmmhxS570QZMA9dRLH2fZvLgNTtJ6ShQ
         dp/+VFbGfmAU03rK0t/vW5ud9hHFVq4AdOlAoYc1w9g/UhBA0/xSKtIRBoiXaKRma+0l
         g0ORR5bvpsUqUABb07LJzpdT/v6Oj+2Cd3/U+lp4Jdz9GALwz8+jAfJun9CAPtqQvkHM
         V9BP7lxZ83dT5sKd/WdbhQTTgbh5HA2wnTR6fSbnuHVJLhd/h0Raj3JayFqbPCQlLYbX
         xDhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756986134; x=1757590934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7VOFVWnlVOI1qQJy5viif80H4uziET0ECBfXBUJywU4=;
        b=CgpLu0RDlVCkpEThBMb/GFWtFrG22igriUBHjZTMJ5nlCVnIn0+kRin2JrB1proloS
         NG4j610PXvBkElre1pATnRho7i/2MGdrAnkdZzTNbJMGmzCfBsHRxY7tUTFGuP2pgC9n
         DrxQQY1aJqtYeMdYtTyr0Gt/LhFlpFkgRU1Yxxd9ybHUMiYPZ/6lEjTPzOsN+J0N6Uhq
         TlMIXYb42jYGdOhw8gbgrbE4+2xNd0Wi59DXSqjg1VQ0wm5wcT3Zo8Bx3g9OhpBcF9C+
         MMlkw2+VxV1HhNh7j3FTcoHwnYzF3kB09PLRvi7OIDMY5I8QNDIGhzLKZuS2WGPA8ee7
         mf2A==
X-Forwarded-Encrypted: i=1; AJvYcCV0JtrCZ7KaVula386qw1lCnD+noLkFKVPcdlh4DI5t07r+nIqay6i1UvjJLPl4WxAIdGk40uwbZzVQ@vger.kernel.org, AJvYcCVfd3M8ljJaHJrNC3piwY4b+nurpGYSZWeju7MUItZztZkxNhWxK764GX++nJU7oj11HnqiF2ywWkDCj0v+@vger.kernel.org, AJvYcCWIkwJvX5Sn2a806PEwGUfxyPpjYzt2BPbFJZHJd5iNK4QoSFixpNz/aJJllSO4z8RV6Ubs5Bok@vger.kernel.org
X-Gm-Message-State: AOJu0YzqpXm0souZQv9cJ8sZxpT/9+LMIGhGgrKBiaTv5oFHcfhY2J4Q
	xe4z9LbLyThAGW5V1zYbdCNCg2filNHDeiRRNV6VmEHY1yjdxjH94KD+
X-Gm-Gg: ASbGncuqAdeFeI0GJu7H597tD8HDBSj9mreW8lUwlYY5VK2PDhb5n0s65tlu2f8qJ4Q
	CMrAQ5pSnT2igfbDfWyxZwM01gafFFQsbGEzxKv2IWzfBGQT4CO+m2kN7LEGMzsIT8I1eMBAPPK
	tJi2K+AGaXXE4WYASAY2pLisRiK6dDdMByGs9UTZTgOTxqngW7V/uvewwYULjngYAESevFp2Mt3
	XhCaLFBxHYDPwhCEMsOKNYb3f+D99syed4ExM2ttc9a4O26LUi7Kyahfh6EPll2hgTK8BvVxUK4
	tn6dWL2xqW2YgdutMsQHEKF+7xIbHs/zyJ/nCwEtovxqVvpZrME3iYCzsSzXO9muBWMA310Mbru
	aod7e5zAfYTy/VcrdxMp29h54K0RhxFIt1XhMNH2V8YyJVlS3lqlGt2cNQw==
X-Google-Smtp-Source: AGHT+IF10FgK2Y8orbR1gTsDr/K88YrLeVYHAAvWCwrXq4W0gDetumZ4U48zYDxPkziG5RUR/8z/mg==
X-Received: by 2002:a05:600c:1c8b:b0:45d:98be:ee95 with SMTP id 5b1f17b1804b1-45d98beefd5mr30608975e9.3.1756986133914;
        Thu, 04 Sep 2025 04:42:13 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:904e:70c8:edf3:59a4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dd0aec70dsm14658475e9.0.2025.09.04.04.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 04:42:12 -0700 (PDT)
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
Subject: [PATCH net-next v2 3/9] net: pcs: rzn1-miic: Add missing include files
Date: Thu,  4 Sep 2025 12:41:57 +0100
Message-ID: <20250904114204.4148520-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250904114204.4148520-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250904114204.4148520-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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


