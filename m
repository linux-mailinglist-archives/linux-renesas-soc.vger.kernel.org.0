Return-Path: <linux-renesas-soc+bounces-14185-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92250A58869
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  9 Mar 2025 22:14:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B43C616A5DA
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  9 Mar 2025 21:14:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A05C21D3F7;
	Sun,  9 Mar 2025 21:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FG9Zsm1v"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7D01DE4F8;
	Sun,  9 Mar 2025 21:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741554866; cv=none; b=sWE/IZunGH0XZ6cuOUFMfhesSxpj6xkD/b0fSc2QeVvRc0ULEj8yzDF5oDg8rKUy/4VKdVQ0xjbnk4VYHug84FXn/O0HddzHvyTKP7uOAHmuDNxL8YOb6v4ZGF4KZAr3B8aFoesSYlege2aX2oRoR7Z0RVy+4L1NeCpei+xqwho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741554866; c=relaxed/simple;
	bh=5uHd9xjXdEZaXObU+4SbLN+Np/GQfZbqf4wISMCElIw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TsryF9AB4aAtnQAeEyAEj6Rb9bf2YzoXNkECijVzyiwMcKk6q7ZR3FtYFx42Su0cYeAlj9clGxh6RDLNL/GuNVLH9NA3uIj1uR2Jur1G1OPhR215EOa5/76P4xbUpvm1gYzmSJdwB+vIYDv7tbjQQqb29swq6ZW5DUb9//8pxYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FG9Zsm1v; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4394a823036so30243075e9.0;
        Sun, 09 Mar 2025 14:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741554863; x=1742159663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PIMTkiNU4zbDZ6B6FJBvAjPPAB3czQ5F/+urFnF7Kr8=;
        b=FG9Zsm1vQPr9gIkk3RWZrp1vgG7qPj+XPu9qz3UbvNxsx1Wa52dkdmA6EqjGD+wTb5
         vqsRQ8qADPtzfJLAH3r3T76D06hqLGUibCg/G8XfNSK9n1i6NCkMmeyvMFuNKxoP2iop
         Ff1yZ31ImB6V59WX53xjHzbItFypqGnTw7MvSUVwO8VuFkjtcY6mLZvh3U9AjJPhoTTQ
         rtrPwApdLAGTSf1h1hKJOc1g6uJaiM71Xd0uG2N6fMd93iX9q7Y/dXzhy1uL8qUpJ1SB
         IFNriYkD+YT3q8kgTSbdhcqlE/KQeGF9Je5Am55gUHEu/wYQjbET/EhM4KhUq5rks5I6
         8yCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741554863; x=1742159663;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PIMTkiNU4zbDZ6B6FJBvAjPPAB3czQ5F/+urFnF7Kr8=;
        b=XbS1lKdP7jvg0xl7VbYMpV0KPj4RNzX18hw1EV8Uz7E4Gz7/x13vCl4l4CXAs58MMU
         LGuS0WjYQR2DnXC+idkb1SI8EnRAlCYEKZU0v6wc7prWIvuv4FLuHUItQHhRJOqWwHUw
         BEZhdFKEC2g+lmG18/0lkbsVqH/rzDp1W20IsXaOUUE/XQjhApT3BJ38Ay3XeYGkAUYP
         7bK+HSjibdEag0ajog+WynDrg5FMeA2Ihh436fZaJ/Ppnuzl9wwknXMKgLu5OzjsegHr
         2ioDI4ndor3lIvIblZ1tDhu7Z/f5ZwlltmiZF/z73mL4HOOJCRRNkYT1f6H8zTCoBEN4
         Gw+A==
X-Forwarded-Encrypted: i=1; AJvYcCUSELYTjrfTXIjTz+8LdPA24lfP6SYS2IJElNWYjZlfW5jz3AZ+UpIbBuePGj8KYmGceLZVIyEgsSfvC3Y=@vger.kernel.org, AJvYcCVffBw3YNNGqBtzEYLI96IrFMc/zFrNXW2gDT7KHWxuYsrFguIDWoJL7NSkUQle8X9QW1IFBXWbzk8jlaaW0aT6FRo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0wDl8IBNs8PZ4H7Xvj4RS0+kBKhcuF8JgZjvj6bn/tiZho8ow
	Sv8sk8yp4FOsz2cv1597TnhmcVC5Be8Mof74NWrqBI4wD8xk4mCm
X-Gm-Gg: ASbGncvkWSvqxupyhIOnUa24r2OIE3YVMkHaamSddktXOuoORlCXd+dlUN8i5i7FL4m
	wJsWdNwgmBcYUMS9tjpnmHkggPD7g4VmSqjpwd7/VguFGJf6aYDqHkindBGCG3xvsFZyrxt4WjD
	rGctdpBnneDCyc34mPH5huDs2KoaU5XTRFmjITsU14d9p4ZaFTsCUP2BitzP4YDsX6sdkVQWwd9
	e2XHj19d6omR+08lEtd7whDCQ+NC31PBIQz+1CVKEOQWnrSfze1GNMNrk1msFVDzTroh5Pg3rBE
	k3FtYpyp6LOvr71QNwhQ5p7jEcGBJHE+1AJk9NhSO9k10EyF3PThmH8Ww3P6w6Udk6Uda16mJ3U
	ETRRUlRJt
X-Google-Smtp-Source: AGHT+IG2F8lX5fIXy6wPtRbfBu/tBQnjoxJwHKLJzikjPZDRdW0BtdhcidK7IEE1J97FIM9STrXR/g==
X-Received: by 2002:a05:600c:5248:b0:43c:ed61:2c26 with SMTP id 5b1f17b1804b1-43ced612d1amr27931675e9.17.1741554862719;
        Sun, 09 Mar 2025 14:14:22 -0700 (PDT)
Received: from prasmi.Home ([2a06:5906:61b:2d00:e951:ba7a:6a53:bac5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ce70d13b4sm64443845e9.38.2025.03.09.14.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 14:14:22 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/5] clk: renesas: Add GE3D clock/reset entries for RZ/V2H(P) SoC
Date: Sun,  9 Mar 2025 21:13:57 +0000
Message-ID: <20250309211402.80886-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series introduces support for enabling PLL clocks in the
RZ/V2H(P) CPG family driver and adds clock and reset entries for the
GE3D module.

v1->v2
- Simplified PLL conf handling as suggested by Geert
- Updated macros to get PLL configuration offsets
- Minor cleanups

Cheers,
Prabhakar

Lad Prabhakar (5):
  clk: renesas: rzv2h: Refactor PLL configuration handling
  clk: renesas: rzv2h: Remove unused `type` field from `struct pll_clk`
  clk: renesas: rzv2h-cpg: Add support for enabling PLLs
  clk: renesas: rzv2h: Rename PLL field macros for consistency
  clk: renesas: r9a09g057: Add clock and reset entries for GE3D

 drivers/clk/renesas/r9a09g047-cpg.c |  2 +-
 drivers/clk/renesas/r9a09g057-cpg.c | 16 +++++-
 drivers/clk/renesas/rzv2h-cpg.c     | 78 +++++++++++++++++++++++------
 drivers/clk/renesas/rzv2h-cpg.h     | 32 +++++++++---
 4 files changed, 104 insertions(+), 24 deletions(-)

-- 
2.43.0


