Return-Path: <linux-renesas-soc+bounces-18739-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E9251AE883E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jun 2025 17:34:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B2B09188503A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jun 2025 15:31:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8629B2641E7;
	Wed, 25 Jun 2025 15:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WwLBLA75"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6BC1D63C7;
	Wed, 25 Jun 2025 15:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750865456; cv=none; b=Oa/YhdMkkFPEY/Zaikb7TT3HgcJMtyowdh2UyYipStLZWoHF0AcmJMLkVZwMPkGg1g7jdCxNcBt8vMOL2g0+1oEKovCpgitPETl0ksPTLeB2TIyZBpJemkuK+BZ2XkrtySbB3cFdXspPZD9wY7or4E8CIP90DA9di/kDM2olkP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750865456; c=relaxed/simple;
	bh=fn76d1OT07aR5qMhS70rOda0WppW8FvGLdPQDYy2UrA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CNqy1Co3getZSLjlPByTxxt6MICrxb9eR+Xk5lGTVVgAYoFF4clPeJy0rBwj2kIc1q0juxcc1MckzuI6omW1v9xw1xIO/DFDJBrKkdPNj6BVNKyGVQkIXKooWcVzwh3S/a+/q/q/sc2JZkHAZiPQ4lUPtiydGD7n7uSiSg1Jir0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WwLBLA75; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a4fb9c2436so1255389f8f.1;
        Wed, 25 Jun 2025 08:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750865453; x=1751470253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pPydrEYqCEEDJzLImKYbu5KqQM5JsZ5hylWTlIASPC4=;
        b=WwLBLA75inmpOe5DguYNLmMwmTeyq1iHl5E6lPHtonghMevwEEd6mF7NnGrDO9wbkm
         wIIi+RYIl1xLzaQOSbAJuD6PDefG91M4KkxzmMYMkVr8WVEsICeO/c8pHeGVLurOkYo6
         bryMI66p2cfCsIu9tFtsh2Q/3EmlHxaclsynPOF2igNd5T73PvvJSG9diwxhaziwNDlx
         opffTC2FvX3RznjJjnamyEhMCVkA9SqPQLzw0OP8fgPtuCNaWYwht+fSE9IlW3kLNuUn
         q1YU3unyyywUnVYtZvw2UwE6Uq+1B2LbRGIxwCzOWWSnLJdYM4e90WwsLZkZF4LNMiFc
         3P7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750865453; x=1751470253;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pPydrEYqCEEDJzLImKYbu5KqQM5JsZ5hylWTlIASPC4=;
        b=oVJzM02/r6uHTcon5zW2TdX9e1iF1iQy6zg8yJdBRC01Uw5V6BlJNG9OMAMBtyjy/3
         1UH0fcbXCVoZ/wajAv0Z9R97GoxW4t0JjmIVYr8MvbXQ72z5z7OvUC6tpYb62efenecK
         yvxwxuledoX3W7xCCqFOUSzdTc3oMuA2Z0gXiYDkw96/HZXqgCAy5e9Hhc1oUMGF7bmM
         B/lA8g5nDcF/jXcQyluluKokzaorH8FfQLs5JMbXbIYBUUz0XaWP8SkhAs/ttfCSnurx
         6glHmVf9LC0budh+SrmBRKtJCOM2GQmguk+K+PNBwhJTZXxzDQZiHWwNJ4j4MaFz+uxw
         zbcw==
X-Forwarded-Encrypted: i=1; AJvYcCUEkdeI0oIosdxBC3mQoVGtQuO9k6cjmlmhhMimicDsFqGYlKKsson8pAZZbhA05lqQv0O/Y/XLWUq0@vger.kernel.org, AJvYcCXcnreZV9/SUPVa3TQ5ZVw5Frghi86TaA3YY1UqNwr4YAPAtGDVNZvUqB4QUOTRmOBoLcY9Qw06jhVjQHoj@vger.kernel.org
X-Gm-Message-State: AOJu0YwzJMJn5etjDLzPlBHfbe++Guk6SgSwWP4Q2RpZNsn9zIbZh7j8
	XKMrPpPUZPKWF7D0P+bXZmaQrUAi8MjiTFj5k80pAPLWAihja7LgurlF
X-Gm-Gg: ASbGncu8G/L3bIuIWRvA467QcFTj4UVAS074we9z8Ws7ulPJzZHhBn0KPdvSvtx4HL6
	Y2Baw3L7CZoN5UwzCvk4iPiux6RTMbHN/05r5Qkg0piNnyvI6x+UvbKmyO1qAs572GPAj8ssuRO
	b01l7xgS+SB2Fb+PcDA8TrhSKuL7/nKRAIKsp7fsD+C92OtpGFvhpG1TFUeqkrkZl6eqlY7DFqO
	h3nfoURU8dGPLNiULNedBrTOQ7cmSgpZepqtJ9QZy/Aa6cXGWXC4n6tgMqhS+myoh96z4uZICkf
	4z55g3L1AquKZK1fgz82CYoD2NhrH2eRhEwrTJGKJtxCVN9iQYlJOalMvAanP2X5ZfUn8xIbnIt
	SwF+1NrKCNe8wDwp3jvQ90C+K6lQX/qk=
X-Google-Smtp-Source: AGHT+IH+WHdgTTdUhNtpMR28teFc2LxiwcjuubN83yEUP5heQPe2O9PuWCIzbWnfcXOH8Fk5gplfRg==
X-Received: by 2002:a05:6000:2906:b0:3a5:51a3:3a2 with SMTP id ffacd0b85a97d-3a6ed66e23cmr3187422f8f.45.1750865452667;
        Wed, 25 Jun 2025 08:30:52 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:c47e:d783:f875:2c7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e80f296bsm4899180f8f.60.2025.06.25.08.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 08:30:50 -0700 (PDT)
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
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/6] arm64: dts: renesas: Add I2C and SDHI nodes for RZ/T2H and RZ/N2H SoCs
Date: Wed, 25 Jun 2025 16:30:36 +0100
Message-ID: <20250625153042.159690-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

This patch series adds I2C and SDHI nodes for the Renesas RZ/T2H
(R9A09G077) and RZ/N2H (R9A09G087) SoCs. The I2C/SDHI nodes are added
to the respective SoC DTSI files. Additionally, user LEDs are added
to the RZ/T2H EVK and RZ/N2H EVK boards.

Note, these patches apply on top of the series:
https://lore.kernel.org/all/20250617171957.162145-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
https://lore.kernel.org/all/20250617162810.154332-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (6):
  arm64: dts: renesas: r9a09g077: Add I2C controller nodes
  arm64: dts: renesas: r9a09g087: Add I2C controller nodes
  arm64: dts: renesas: r9a09g077: Add SDHI nodes
  arm64: dts: renesas: r9a09g087: Add SDHI nodes
  arm64: dts: renesas: r9a09g077m44-rzt2h-evk: Add user LEDs
  arm64: dts: renesas: r9a09g087m44-rzn2h-evk: Add user LEDs

 arch/arm64/boot/dts/renesas/r9a09g077.dtsi    | 85 +++++++++++++++++++
 .../dts/renesas/r9a09g077m44-rzt2h-evk.dts    | 50 +++++++++++
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi    | 85 +++++++++++++++++++
 .../dts/renesas/r9a09g087m44-rzn2h-evk.dts    | 54 ++++++++++++
 4 files changed, 274 insertions(+)

-- 
2.49.0


