Return-Path: <linux-renesas-soc+bounces-26188-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2112BCE9994
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Dec 2025 12:59:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E9FAA3031A3D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Dec 2025 11:58:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20A812EACF2;
	Tue, 30 Dec 2025 11:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="baiuzfF3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333582EB5BA
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Dec 2025 11:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767095900; cv=none; b=WMgOefLsZPgB026O2emGerFhS/kXTdj3IKWSetEP4qzXqf0m9UqXpDN2SeYptw++Xn7VePscdclomfa9nhfUGxMGx2peUPOrBqqZWaBqyrSMz0nHO/8wo7fC5vaKO8MAx3IyeBRuykJBxJG4BTlNHhtgjHz+E2xbNk+5TajOFMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767095900; c=relaxed/simple;
	bh=d+2xPnB7dGcuqosjk+/+C48fm/uyvYVZTjvqvtwvvhI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TLhNLvHUsonA9+uNDW3hKSfpkkKkuZKAYKJhtt72Pjb+0LMyD3qlikQ8pgPsn0zeutaz0xKN42H7dHfAI+BF7guBULUd8uBqT0KJygXZtD6z93Lm+/b80KZCLhWAqwZEj+MPk/Oi/CfObZHePt5xQojwR6LilDuwrCrFe1AJWTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=baiuzfF3; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42fbc305882so4705031f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Dec 2025 03:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767095896; x=1767700696; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W0jaMee74R6Jd9SG5nA70iiwro5sWea56YIglMn+Zr4=;
        b=baiuzfF3UU6ygGOIx9NyEzBfFfOpEOmfs+1BHCJiYrPyQQIbVuNwpJQWoW28v4+18y
         4EARyobDvE2LwiwDFKqR1S+xeaQBHlsIhzYhKSkiBKMYC47q6XiCUsQ4ejuBVs+bOzO4
         rDP7t5jY0EBH20PhusMFoiycuypUhQctd3WcftHvnEMsuFg8CPdtFJZDonRzVAcjCgab
         NArfLy3Z66//aFkkCj9oJ5J+r2W9T1MZ1iAbkO69ZyhLqZTCHWurrKTx4QDy9XAUEi1z
         iDsvZUNaGSjARUzZZa4qXQMGJ58wfeqJ7+8+cONG2yPLhJMuNGMavX3uKQG3Sh0ieRvM
         bBew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767095896; x=1767700696;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W0jaMee74R6Jd9SG5nA70iiwro5sWea56YIglMn+Zr4=;
        b=sLEXtadk8Qp1ty8HW0KV002o+QPPCn++MDR9kyZkxjErVlGu920s9GMOWKL7tw09Q7
         iiVC3lVq9C0Yr+AOYyD/B0tirRNJ4cyyweCy3650TnnB1m85MWkcefOTdhhAWMlgPCdJ
         gxA9nr3bH74USpv+Qy8T5kjGJgUpjlwztYu9Yk9l2IHtYgjm9ZgM2467UVKQFRF6F5aX
         21f+Z/jER8Pe40axDOOg48uMMT8PE0kXc5fArlecWMqdAsFpkTP2FEhb6gi5aIXdYkZF
         QwRWvGxAZ7QjDkd9S30WxuJbtr3cwxVdJYgPEZ/SOiFlxY5W+hSYLPmdSElR7j0aDp0c
         fb5A==
X-Forwarded-Encrypted: i=1; AJvYcCXR69HHqUR/IuIuQCDnbdzhEu45Ize+3tdC1QlOb9pHsAkyV2ZuoUeOCPQ40sUXuZKsc2NdvOHZZt6JYY84He/oqg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlHiPZ2L20VOt5UA80oO2M2LIGV7oF4zWctL7XnYnbm4vdrB82
	l/rnPjD3BDpx4wFffhP5Q9NXkPbPbaRGRbqSKNQUsaS5sRKvkol/RiDI
X-Gm-Gg: AY/fxX4KVBJ9sG/UmR7BuRZM/GUzdji1Xfjl0qzVcSEzsMziVqAD4Nj241T+8ubcWwN
	FASVLrgpXHCoFoSFJ2lMIB1Kpw6zMim5X5rgOh2MDJjn4SGGuXVvb0opvAlwKgRW4TtmNhoNakr
	VggN+rdKpGqaGj6fu/jew091dqagfMMgIHoSpqYT6gvPB3a+9CwmhO5Sgt1J1SGU0NOq4zMiHtE
	XdLMdk5/OZdesR4dWeFXebT6AqtAfRFzzrOrC8fnckSYz977/LO4xzdeJwdPiz4NJvQ2tZINUa7
	LjMNf+Qf4wSgMQVyfYvkFHZn/SRbC5Vk3I5Jiqsf1VuZdugqecvIC86j/L/Um+3qHc4UF07SRrf
	vFOrVXRPKeYpB9iEz59uWMeYTGYOfDY7sKOkdSfmQbtsuvrZZfl34GtUZ4XQjv2obmIVJEPTu2N
	J17RJd/gUFczDluHRP39QWO+EtzL8t9+YLo8i4CtpS3tqhjlKmYhHkA6ahbKMGK1CCUQHiJpOgb
	AjlEQmbaNhVmEQmasx8wyyaC7a0aBL7z2M=
X-Google-Smtp-Source: AGHT+IF+6i7CSCMBwqHi/Xt/YB4sbRzK+in76u0B0d54P5QGmXa5sdLX5u/TXPE8fZQwP1UlLp/jrw==
X-Received: by 2002:a05:6000:288b:b0:431:a50:6ea7 with SMTP id ffacd0b85a97d-4324e50685emr42413913f8f.49.1767095896306;
        Tue, 30 Dec 2025 03:58:16 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:efaa:981e:926e:8957])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa64cesm68337227f8f.35.2025.12.30.03.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 03:58:15 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>
Cc: linux-can@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/4] Add CANFD support to R9A09G056/057/077/087 SoCs
Date: Tue, 30 Dec 2025 11:58:10 +0000
Message-ID: <20251230115814.53536-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series adds CANFD support to RZ/V2H(P), RZ/V2N, RZ/T2H and
RZ/N2H SoCs.
The CANFD controller on RZ/V2H(P) and RZ/V2N SoCs is similar to the one
on RZ/G3E SoC, while the CANFD controller on RZ/T2H and RZ/N2H SoCs is
similar to R-Car Gen 4 SoCs but with some differences in terms of
number of channels and AFLPN and CFTML bits.

The patch series includes:
- Specifying reset-names for RZ/G2L and RZ/G3E CANFD controllers.
- Documenting the CANFD controller on RZ/V2H(P) and RZ/V2N SoCs.
- Documenting the CANFD controller on RZ/T2H and RZ/N2H SoCs.
- Adding RZ/T2H SoC support in the rcar_canfd driver.c file.

Note this patch series applies on top of:
https://lore.kernel.org/all/20251126155911.320563-1-biju.das.jz@bp.renesas.com/

v1->v2:
- Moved reset-names to top-level properties.

Cheers,
Prabhakar

Lad Prabhakar (4):
  dt-bindings: can: renesas,rcar-canfd: Specify reset-names
  dt-bindings: can: renesas,rcar-canfd: Document RZ/V2H(P) and RZ/V2N
    SoCs
  dt-bindings: can: renesas,rcar-canfd: Document RZ/T2H and RZ/N2H SoCs
  can: rcar_canfd: Add RZ/T2H support

 .../bindings/net/can/renesas,rcar-canfd.yaml  | 59 +++++++++++++++----
 drivers/net/can/rcar/rcar_canfd.c             | 18 ++++++
 2 files changed, 65 insertions(+), 12 deletions(-)

-- 
2.52.0


