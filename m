Return-Path: <linux-renesas-soc+bounces-14907-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F2187A72C07
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Mar 2025 10:03:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED76918858C2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Mar 2025 09:03:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A5E5200BB4;
	Thu, 27 Mar 2025 09:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mPkhvzSQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985132E3392
	for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Mar 2025 09:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743066214; cv=none; b=qLvMpKGr4FlNeAuyAnh4W+dgLqRkK/E7EPaKBMG760QO2UwbbGnszzlCKPvKED0gxs5IVvH7DTKWkiWHHToAgrrwQx6mCDfjs2R4AN7OgbTt3HsMbSRnvfiQMw0RIk+DcC26Vcn2U9+D3zaE3JCVC8QCDspXr5nMbRmxEG6aiJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743066214; c=relaxed/simple;
	bh=8/zn4fbLxfW9OORKNlkmBTYwuDwg3TlJq5eX505+91U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GKYDlViOdwRrhm1rHi0e7x80XB/cgvvxSlV3XrTW+wieXXMk3+pfoD1BFLijBkrBRvckZTU8h0EcnUiBQpSxC+eWxFwtR2VtdlYDqmgLi5grfWJCFqPHToVlnygcoxhS8ogd723raSwYJ3QZMY7G9Vh5fwTk8+7KEJ8QfEu4DV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mPkhvzSQ; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so4011695e9.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Mar 2025 02:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743066211; x=1743671011; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KDEOHX7seibVQ7iKuWN3AgC1GZLm4gPtxORBaanqQVI=;
        b=mPkhvzSQsKdRAr/KotgmPv/v51VVIhgH1s7CPvRkOYBVB+iLmDKMydv5gHPwp3cRev
         MB/u85Wta1Qr3X5f/TP9YRxC5czwgeVQ+GJ2lb0PxTPHk50W0ceW2/uQe4BJeHXZPSKO
         ULEflDc4YyI4GBM3cJGw/n6YKdnJhG04SGiqigTF/xGZE3aIivh3CXERLwhkOyZ5Ll5L
         /M/F5fXQ9v0+4BnCFiVo/1kzA6MJvSeeYXcrqh/kP4T0IuuKp2lXTCqrMdc0UpNzYciV
         Ic775ciKjCUq7S3OiIxfOmY4kq4Mf8OtzcAWrQVzBdNSP7dF5jMZlboFKio1TR5KSJMQ
         MklQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743066211; x=1743671011;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KDEOHX7seibVQ7iKuWN3AgC1GZLm4gPtxORBaanqQVI=;
        b=K/AwnXtl6GndAFwUNnt5vRoOv4u6N+z2Us+GY46OIV66yVGH0R9A/qkqKygBM3rxcO
         /Cm4bjRFYUgYaWnLTYOB0aFE94pO6/OdNM2K/7TNeInKr7jOclA2U8fAsAzLcBrNPRhE
         mIkQZiHZRsk4WXeorECQze1bdhMeZ+E3lmh0r7O6NM3m9C30uM9YKMMw7do9PHqcoExo
         DB3KGuExFGqxVG793GE318aeu0d+rA9xtGaS7F+Z+WDTDln/rvdc9gBDAbz/LhvyONXM
         GkRVmVCjrOPFMKQk68d4Za+hDxST5TtAWm7CI6ofDRUhEFoAErmw1lwmuz/bnTiycgic
         A2Ew==
X-Gm-Message-State: AOJu0Yy1XDYMIWbCZ5JFjkQlz7gzTfHCC0BnjniCNWW7NSllpaL529oV
	Om5vvOf/8RsCGhH/I/oxSNghv+Tt5DQNYjoUZraFtMxk/aEqxquX
X-Gm-Gg: ASbGncvTmaDMWlSRSasJlZHVZ3+S0RKAl57w362bJbxKPspiYpjMOdKGpeO7Baz/iy+
	s8GQAKyJkCK+VZai+59zez/sPIxnnhdpZeOE47X0zB1pnewJXZxeAWO+xc+NoxkrB6PFgVqsJ5B
	pv67ud9W+4AevGSguOnVQEvOmHDxp/Uh7TOxovbzBJswoHLeNH3qarkJc/cXb4z5V9eAgamoSl7
	2avv9/bYrvKgyb495azocPTPj8sQWF0DbXUgLnUVr0u+MxWeU2abxt8AHtIUg0fWB5bqUDDEtAg
	Mo1qtg9+Dvo6XNKB68JiX6Xpe9/7KVri+Tb9yj1Cu9M6pBj33f98aRqq0YiKzHr6DPrPP24IIiW
	AY7ua
X-Google-Smtp-Source: AGHT+IFfmXPI/qGF7niB+PM5OpfbEUpW2n7b5xHXy5poSryRUgogoLwbCEoieDI4IePYRhRc3FkM3w==
X-Received: by 2002:a05:600c:1e17:b0:43c:fe15:41d4 with SMTP id 5b1f17b1804b1-43d84fd517dmr30003405e9.18.1743066210618;
        Thu, 27 Mar 2025 02:03:30 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:c36b:2e01:9e11:8d7d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9efca6sm19490682f8f.93.2025.03.27.02.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 02:03:30 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH RFC INTERNAL 0/2] soc: renesas: Introduce ARCH_RENESAS_ARM64
Date: Thu, 27 Mar 2025 09:03:19 +0000
Message-ID: <20250327090321.15394-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This an attempt to fix adding each SoCs to ARM64 defconfig file
by introducing ARCH_RENESAS_ARM64.

As an attempt I have just added it for ARM64 if we are OK we can
proceed with ARM32 too.

Cheers,
Prabhakar

Lad Prabhakar (2):
  soc: renesas: Add ARCH_RENESAS_ARM64 Kconfig option
  arm64: defconfig: Use ARCH_RENESAS_ARM64 to enable all Renesas ARM64
    SoCs

 arch/arm64/configs/defconfig | 24 +-----------------------
 drivers/soc/renesas/Kconfig  | 26 ++++++++++++++++++++++++++
 2 files changed, 27 insertions(+), 23 deletions(-)

-- 
2.49.0


