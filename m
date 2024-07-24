Return-Path: <linux-renesas-soc+bounces-7486-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F3D93B3CA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jul 2024 17:35:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D707284148
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jul 2024 15:35:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CDFF15B13D;
	Wed, 24 Jul 2024 15:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y4ixcv/K"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35AE54759;
	Wed, 24 Jul 2024 15:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721835309; cv=none; b=GoanFrR3Y5M/1QE1umH8PPGw+5Bz/s/rH4WisbF5pqJ8uGbqQjBqUtwP3m+ZoIsDNO1mTAW+c7TrWFB+Eat4W5VCWSxPIWsoc8gbKrT0KomITS1GPjNj5iKkpnOKFalDqjHZAMg58/htpNUO7qhL4gkzmmZ+tTdRF1oW88GBV6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721835309; c=relaxed/simple;
	bh=LueIaqy3Q0j8fN4ues5sGnm8L0r16hoVxCOfXozdzfk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QHlXmU1+mLHLqVtN4ug4pMyU9bZgV6X+j1MirPybOpNvQdhyl62GIGd0PV2yvlbsnUOinatNmGSmjIr5h6RnfjD9SQJuWBAsEJebTy9+okusK3osiunpylSvOSW8K1td9Ps0TtgZVoYg7L6P3YOOIplrEeCfGK8FnUkDnok3CC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y4ixcv/K; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4266f344091so51340305e9.0;
        Wed, 24 Jul 2024 08:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721835306; x=1722440106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rUj6GbLkyY4yBCtFy5bfIuKGv+kwHnS2SEUOPXf1qU4=;
        b=Y4ixcv/KMJEWJrHlsOdBC7v1URZFkeq4WRsmVYp3Gu8sMqWNF6op1n7J5U0YYFoNW1
         9rRGn3JqPK7PgH8rv1QaWesfH2JIZZS0Eb32S2D1CGj40cp9dl4FHsCI9RGtqUkwRd4w
         gddfVyT9VsfIqXapgfH0t0ppphw3rwgqTUhbfQ+u1hoAdnixi1kixmMpIwUi1uUoU5Ja
         z3xNnUGVhCDFhmLTWkhE/N2CBA4nDkcrct/4tQKCnNQgeU0HPiSfaIPsY9VO98NoG9bt
         Xkt4QaWKsQGt+nvsXS3iQgGH9SXvcv1+4WwSPr1TKtfP+nBRYJLV+JZP3/YbfIVe/fVP
         lwUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721835306; x=1722440106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rUj6GbLkyY4yBCtFy5bfIuKGv+kwHnS2SEUOPXf1qU4=;
        b=Z+7OgjWjkYEvZHtXlmI07Xz8LAbUJ1N/7Ox9JIe5fHNSdcfpuUJ4pXzDvCmasGG6W/
         GDFLauW6LGtPyddkbG7hvC4z8mZkLdsPgWZavZREoK13TdJ2JeLMXfF6kqdjPkmQa0j9
         X50f9T141Vgm6y6WOY3RumVkVGGoq3HcZeGthk9b5uuhemgGHFIxKDpnW8hpef+RHuH3
         BH4DTrM7xbx4FXz/oEFW4E1u/puwriMK/4qMxLv6mV0ag633rgC/b7oterekVMl5XvTs
         wtMM6CChdS/ynK4ShL2vzxn3DCriyni7UJusBVfbb4sUKEkSLZeQdH1EfSx0h+E3W7E8
         ilGg==
X-Forwarded-Encrypted: i=1; AJvYcCWlQhwFelWKrkv9ekUlMqkSz1oBeZ92mirs+QxixyBOwM+UvRj7CdBwJg8aBFhdjd4mx0yXlawzXvRGSJs/RIFs+D6KiVJUxsOLBZtFSzUQzHDd9WGq35zZnl8UvW6etTxh7D2R+MwQqA==
X-Gm-Message-State: AOJu0YyTxsN46FYD8ujbmZM1HkvnCW1KrLQl13woiRuM5nIe99ss5Xq+
	qSZDoRZaUl4OuZbMB+5yrr2Q8N7LKEUx+4kEzQaUwo0TRnUBNzn9
X-Google-Smtp-Source: AGHT+IFGecbpg9mGqnfUkHGeenSXuq52mdNzJsLo7P3GdgZyq4NhI/n3qLCgJHUsXurw22H8uvU1Zg==
X-Received: by 2002:a05:600c:4f06:b0:425:5ec3:570b with SMTP id 5b1f17b1804b1-427f7a93eb4mr19383485e9.35.1721835305902;
        Wed, 24 Jul 2024 08:35:05 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427f9397337sm34609565e9.23.2024.07.24.08.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 08:35:05 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/2] Add support for Renesas RZ/V2H SoC
Date: Wed, 24 Jul 2024 16:33:37 +0100
Message-Id: <20240724153339.626460-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series aims to add initial support for Renesas RZ/V2H(P)
SoC and GP-EVK board.

With this initial patch series we can boot up with initramfs,
boot log: https://pastebin.com/CLcjgZfZ

Note, the patch series is dependent on below series:
1] https://patchwork.kernel.org/project/linux-renesas-soc/cover/20240715125438.553688-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
2] https://patchwork.kernel.org/project/linux-renesas-soc/cover/20240724094707.569596-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (2):
  arm64: dts: renesas: Add initial SoC DTSI for RZ/V2H SoC
  arm64: dts: renesas: Add initial DTS for RZ/V2H GP-EVK board

 arch/arm64/boot/dts/renesas/Makefile          |   2 +
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi    | 165 ++++++++++++++++++
 .../boot/dts/renesas/r9a09g057h44-gp-evk.dts  |  61 +++++++
 3 files changed, 228 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g057.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g057h44-gp-evk.dts

-- 
2.34.1


