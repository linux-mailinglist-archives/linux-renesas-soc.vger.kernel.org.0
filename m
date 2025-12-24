Return-Path: <linux-renesas-soc+bounces-26104-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C916CDCEED
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Dec 2025 18:33:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 182EA30087BA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Dec 2025 17:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11B10309EF4;
	Wed, 24 Dec 2025 17:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EXtYOTNO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B01026D4C3
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Dec 2025 17:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766597612; cv=none; b=W3fcn044o9Mx6w99nB195WTOYoLUXl4eOrfED/ysvZ81Syp3xRjdJw7RKP8TeXG0eoF1ckfMawMDqbJFgw7E2JWH+X9yVU1vR64zjyq9F5XH03qWGmQRrU38TBQgaJt9seMqJsQp/v+bR6Dhz6f7y0wEv+2MpjCRB9cf7ZEHV3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766597612; c=relaxed/simple;
	bh=iQJDc5BjJvP9KF1/sFbPLA3orXtbN8fxDAmUVgi3DEE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aC41UauBvaVvkS+J4GDiIIhJ+U7hbhJj3c1ienAWCo0CIcG4iq1zgH5Ny3MnFhsA1wdcOhFahqzT4nG8Sna53vU/QaDNLgafuFBlr0oN+/RRXD2EtomkGu32NyzgFuj5r2uQhwFjkHdJXn1qGdkd+f9RMamdXhJy5ci2jVb03KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EXtYOTNO; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4775895d69cso26140785e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Dec 2025 09:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766597609; x=1767202409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RMK6RvtlrIjrfo/E3tzc/Jr4xeNGB2EO40kI4nwJnt8=;
        b=EXtYOTNOLiDPvwRGvEYW+OMQ3bOcrJTG4JsBeUdKPxOQftYtlPwSBSEWjd8/sGCsV3
         l4TJTrAXYW8dfpdBsrpEWJUsbVsklK7ifWVLKDbLTRuj96ObOQbtfpVOKCaP4/eNtbYS
         ZWBwijLv1WawlWiJ6ew4fTWQUrIhQyjb/3098yUxcCyWUULt0aHMCHHxU5tgcdamkWYl
         E4YiGYruOk04ZfmaqGf87ny9KVnIZymwNNu964Iv9prcE8k/8tRNEr55pPl8qwXdcCl9
         qrqP8JgCV+xslOjaBi9hA/N+EcYikfeEj+CeRHr03LAuIHHqusIEZpiAaXxgAmYaeTw3
         H2cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766597609; x=1767202409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RMK6RvtlrIjrfo/E3tzc/Jr4xeNGB2EO40kI4nwJnt8=;
        b=VBGPY+nKf20SXaQL7rTPbXy0eI9rThsLtm74ZNEXWaPwHMNpIlkfSfDcqGewTFa38A
         Nt6Hb9qQ818jXMEUDHxnJqGy5YoAGWzgqkMElpTijd/19d/t/eEShpUUobqHsvlFXz58
         ptJj8NxxFTcSetaNFRDIxXP3Qv+dxhinFmCVii5Sb9DpcVne9DNvtcmuJy634uKHkq6k
         qGFIWfD/UShfN5Z2AYn5t+DRP5xd0XZSxmYrdfgcyCHKl4Kz3yNOBQQ0K/wTvKL1W0AD
         3RL1RSucUstidnqZVC1rdxBQgl+lMR+vIlX6GKxg5sTzCD2JmyhctL+1DpVdQVZWRo2Z
         lA7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUAyT2wq5l5RDW/XjFWoII+vDbYhulNU/mC5sDBWSkORAvKa1z228onXIeR3bjK2ehpHAqXVlKQFZm6PEQ5ViriHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy2M55fh0RtRMoHmtB8sMjLFouY+IuuogSSFrRCjxP0v3H1AEt
	09Hn4xWAvR5ALewMQlmRfL3Pxnbw9QAkEudL/5FYj1EGZzex1j9qSVMN
X-Gm-Gg: AY/fxX4fWrhHq3ai0JbBHAnvuQw/eE6jY/iFNdPubNkilsnl2VSMblpPu1sAbzYXp4F
	zXDHNhk3THujVVDijTJr+WITKWUkdtjoox/sH6q1/2J0TrT23Sibd9K5xmIXMaIyMioExsd5nRC
	5RQTT6Ag968vKjlvUMvlLgHgr5yxNrknPjwvSjarLC4TgpOCW5TESSxUHdqpvfZC9H7dONzXu4+
	Qp/TW2351FLa7l2OYwG40aeev0z5PTcB3is2YwRY8crprMZvIpQ/XINMmaLF3InF1xfnohLiTON
	HbjGaRgv21GRE9G4jbNr29uo2TXhdnsTAjO5/32FK94873ienKYBWpgCk+jXc/O8DQJYAZ/vbUa
	LaTUqEFj82tEGSjrhipe0hSgycuM5Mm6hxt63tSan0LwmikR83TFR0G6TmCrdKhcdx4YqtvCcju
	A3s/ICWqY22K1d3KCKJ0q6bivyA/ip292uwLio4mmSQVyAQgt1a/u3Cze39jXVvkBTNxMx5noIe
	ttaimMm+4BBWWi5USeBunMu
X-Google-Smtp-Source: AGHT+IHC7G9p2+PyEAcKRLFlt6+KZPgvqnsDBf0vCbs3EhS3aOpa9h0pknAbR4+kNyns1nzUHdyLZQ==
X-Received: by 2002:a05:600c:444b:b0:477:8ba7:fe17 with SMTP id 5b1f17b1804b1-47d1953bce7mr155031505e9.7.1766597608592;
        Wed, 24 Dec 2025 09:33:28 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:3371:7b65:aaf4:d2e4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1af20sm33237553f8f.2.2025.12.24.09.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 09:33:28 -0800 (PST)
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
Subject: [PATCH 0/4] Add CANFD support to R9A09G056/057/077/087 SoCs
Date: Wed, 24 Dec 2025 17:33:20 +0000
Message-ID: <20251224173324.3393675-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Cheers,
Prabhakar

Lad Prabhakar (4):
  dt-bindings: can: renesas,rcar-canfd: Specify reset-names
  dt-bindings: can: renesas,rcar-canfd: Document RZ/V2H(P) and RZ/V2N
    SoCs
  dt-bindings: can: renesas,rcar-canfd: Document RZ/T2H and RZ/N2H SoCs
  can: rcar_canfd: Add RZ/T2H support

 .../bindings/net/can/renesas,rcar-canfd.yaml  | 42 ++++++++++++++++---
 drivers/net/can/rcar/rcar_canfd.c             | 18 ++++++++
 2 files changed, 55 insertions(+), 5 deletions(-)

-- 
2.52.0


