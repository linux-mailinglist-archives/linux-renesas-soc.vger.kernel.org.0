Return-Path: <linux-renesas-soc+bounces-19362-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AB50AAFC01F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jul 2025 03:41:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F2AF17D929
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jul 2025 01:41:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 773631F130B;
	Tue,  8 Jul 2025 01:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QUtRqdFg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEDCBE6C;
	Tue,  8 Jul 2025 01:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751938909; cv=none; b=VWQDKtpNpliuLixpCR53vL9mp3KsdlzLnziKQ3ubkBqhy5ruo2cqZIwbabwbz68xzOQnDmOThHiOyrbmYlTdWv6OnchrGvgKOpv1ljwAqTc4HjHs3i4BdYHtmun96w3dzZKbFOOhmEIeyqaN8tcsXBFgJjQoSX+pFIFmj2REEX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751938909; c=relaxed/simple;
	bh=S3y/WuFAiIo7m4T5b2jYL2QN9NkxkYEUb8Fdjn2R1Nw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W5J6kx1Pi7DzU0T0TZVmHLv/IB3pbuNtk+8tzhLrFGrbdf/be33EchOEwDhwUdPBB6ptdt4SN/eGOeKeyZOWz+YkRnaVreXCcj8K5/qVFxrqwEiNYoCX0NSgLAN0ZJtL9r1lw6djrKWfx5mLe0kjItbhHROJPhS6uaMSzlEDroU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QUtRqdFg; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2349f096605so55437735ad.3;
        Mon, 07 Jul 2025 18:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751938907; x=1752543707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IakO4W35TSMY6u1/w9JSMTmWeBzD16gb0pScrOwb7Ck=;
        b=QUtRqdFg9KOe21uf9Gwrdtm61KLbOF6hXfpUnOxqXAzQeyVWlxGXecfrwMr3i/w3GG
         Ftt0cdKgEISgqlXw+lqld5CK8ZrQfQDlqiwLTXwvq+i1ISuWVXy5gKBu+0d+vd21Zyvr
         78Pq80p+AmCyNHaIBY3++nFAqsAbRkgbxlYaJa+O0KEV3POYBdx6Xz3fZH2rDimxBTlT
         472Db9dPbfsDUbRt64Ez+u8pNdHVXPoa+juqbLTB4J0KcVireTkF2FUe6AbidpOME/Xt
         JZmwOR4OG5xVoHGX6EDtTYnY0m5DWrUfQp+GwSiTFAPvaMMksu0Oubpow88LiVvJxJrn
         fcNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751938907; x=1752543707;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IakO4W35TSMY6u1/w9JSMTmWeBzD16gb0pScrOwb7Ck=;
        b=NUI03y+AglGK2ERBbvZIDqFQe+xrFz+l/cu44fuTMIzovAS1GGhFCULNuIHuPwBdCt
         KtNqbVwuCewl5OtNPxxQs3Utlb/JN5WzxxI/9Gfm4iPyLFCtvlzNxGfRMgtu0sWDMOX0
         1iU1dntdgXHz9ElGBItQNtigCBSivKi8UWiKpLe9AigFj3ITa58GXkcfDdFlg41bJoY0
         AF8nwwYjUecIoFtF6qlGRL/goTdphIL2QnjtRVZOdaUI9cRgZeCUbTruw1/MGvMgJnPd
         NFAkI266VlGD0X1uJ422LqiwrPGqjZV70kHF8x/KAlWiF/CWNemHzbQkuyVVgR0tw35X
         av0w==
X-Forwarded-Encrypted: i=1; AJvYcCXDYTC5hpA+repyXzMnoO7OzfZ+Rezeisul/4O7QZDGStDR06PwpF65HcQGEVREjk4qY0Ppt4k2rd8VeYA=@vger.kernel.org, AJvYcCXm5JZ4b5+F1pA4YcUxrWlwEbDuGkGUgFWB0H+Of8Fyd19A0mCDv4Jc3njM7XbavaiEBFth28ftnXxiMAfLAkZV4ak=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCVnSEWn8m2M6MfQu5hYhUiFm92L4b+4Fb7vklINlnwsEgx9NT
	78kDtJZ6zyyu9pvaOUADEBBMW7slkHOq+AuMfnZWbWRlQR6sE1ZFbCnhEvCjr1mTRUg=
X-Gm-Gg: ASbGncuAGOomzV5R+TXzHAjhTI1VPuFuYImlHYI8EC+SFg5icg0oodA93L0HNEME9/n
	UFTqrE4GyGhsSR2hsSr9qgUgwU2r68K0LVZJp6kgkluKBHvUXKQOyRXHkF/C5vZyQnmbVfDQijI
	CyE7E3LlYclwD34QC9Ph1CLkJAOyCrLKmcmDefKgSgmTeHtM8njtEcKm9BzuAK/XamzLE1JaQo7
	ZK8PUWW8J7WLfhIHWoEFUzHlldUdqO3qVLrC34KnZM58cXSaSyR1zb8+/ZFeg2k2EXuOERoNnEc
	1U0gJW9ETsm8KIRPGEtu9m04IhdNjAtsJQrtikmL59E=
X-Google-Smtp-Source: AGHT+IEoEeKwhtHThcBhfzCyDdKwWEsoAlC/o9w5SAkBFWOcK9I3ckuovCLHaByZafysiBJjMdWgEA==
X-Received: by 2002:a17:902:cecb:b0:234:b123:b4ff with SMTP id d9443c01a7336-23c87484434mr269524945ad.21.1751938907170;
        Mon, 07 Jul 2025 18:41:47 -0700 (PDT)
Received: from archlinux.lan ([2601:644:8200:dab8::1f6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c845922b5sm95773395ad.199.2025.07.07.18.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 18:41:46 -0700 (PDT)
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
Subject: [PATCHv2 0/2] net: dsa: rzn1_a5psw: add COMPILE_TEST
Date: Mon,  7 Jul 2025 18:41:42 -0700
Message-ID: <20250708014144.2514-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allows the various bots to test compilation. Also threw in a small devm
conversion for enabling clocks.

v2: fix depends on line to match rzn1 pcs driver.

Rosen Penev (2):
  net: dsa: rzn1_a5psw: add COMPILE_TEST
  net: dsa: rzn1_a5psw: use devm to enable clocks

 drivers/net/dsa/Kconfig      |  2 +-
 drivers/net/dsa/rzn1_a5psw.c | 22 ++++------------------
 2 files changed, 5 insertions(+), 19 deletions(-)

-- 
2.50.0


