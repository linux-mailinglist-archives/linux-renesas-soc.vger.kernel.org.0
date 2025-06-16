Return-Path: <linux-renesas-soc+bounces-18394-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59800ADBBFD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Jun 2025 23:39:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 564223B5542
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Jun 2025 21:39:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BE80215191;
	Mon, 16 Jun 2025 21:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ia+BdPOW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F481C54AF;
	Mon, 16 Jun 2025 21:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750109972; cv=none; b=cgqQtfh8xcncqtzPXALFBHgTEiZf1mLm3vlre9/hMKXIwpGY//sgqnxcU8NTv7Vnb2q32jKiYa0Dr218vgZ0Fw7DPTHvWN6Kavd+3cJfBg52jY8+d7ufMQQEOF5HYtDZ/o7UlyIwf1QmTT6Bn5MyYZ+xNVBwNTJG+tFkK8906K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750109972; c=relaxed/simple;
	bh=dMANp4RYRR1PlbR+3xAKlhI1wXnGkrP0d+toLijllaA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KlqlziIkWa0VoYCOGzvjEjXOFMCnO69/jj3dVBCRm6oP8AKuvDJPybWUjALjZnIcTvBH9izOTF8dxB/pbximUZzhhLXvEUFwpv7uCy31rhParm/UCamYo+eKX14MH7DUAOcedzkjR7psQ0Vjuy4RoW4stsRkq4jI3bk7ut2xMeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ia+BdPOW; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a4f379662cso4369577f8f.0;
        Mon, 16 Jun 2025 14:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750109969; x=1750714769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ftn+00a1LmneeOh5VpLw5LtCfyTkHHrQ+fYbzdf4uyE=;
        b=ia+BdPOWebOG2E2ovKWZef1vxL+/c3UVgSnveQNO29dX4BfH9hRAyqCVX82dvnUuDW
         Qr3ERHh1OB0a9i6bCjP9uzH5xUh8z+rAewTfQRHmqLmuKjVof3iCsRhkh626KjTNfzMO
         lHAekBYVgDEFk+KJF0BTKIElx/+wExjs7EQOFXlul/EH5x0x/aZ/yfkpFn4Q5fwOX69C
         seSvduk4kgsS7qf1X0J3Ckch3YxI7gmvJFMYbVlK4uWDgE50xeu+LJqJbBf77YQ5pF6n
         PIrYdb4LystxENESclGmlCgk40qehgakpTI2hebFryOPVDhjsQYufLCYQPp+UwckP7/r
         Zv0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750109969; x=1750714769;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ftn+00a1LmneeOh5VpLw5LtCfyTkHHrQ+fYbzdf4uyE=;
        b=UILsyxGDUxE6pIrhf7grOUGF0Lou0+2m1SVqTz0HXh4wSbLnHpd71wvv4APycJv9eN
         7gtezpFELir8Tmc6N/J9pFuL9ELuqoosaA9pB9rjbSghVTEMSFv2aNFGveKqx3JANLcQ
         XI26kFC9IMbNTLpaAUwr+u725h9Hz46yJnZu37mFrweo5EPgcs/FofYXytOXNOiuglPB
         CV9lGZLEEoXxE6roEI2UNjRYiRuJHub4OjKYIYoHCVzlO6EETM8teWa0rAHoiegARKeW
         IKbq7rgtvBAdPxpJi6KQUYof1geTcn+T1sHE0tevMGQfiiguO+IR1KtrKPPCqn3GSzEh
         wC5A==
X-Forwarded-Encrypted: i=1; AJvYcCUTbQ1Q4tLEtLDC1vdVpEDKrh6RJyYiJR6BGoNq/HiZYt/fZMBt30+0Tevqg/ZPri6FsK1OzoBbnlwVv7ym1WmhcqU=@vger.kernel.org, AJvYcCVQKabGaevty1SkX/CRmTVcdBnaqwx1Nh5tHamrTi2t73+/g2UlOsryWn3+4ubsDrtkYW0ZRmS5CGev@vger.kernel.org, AJvYcCX3gBJviY7QL/D5nrcxJYQ03/iteHh926VGVXD1XcnswrKIp+McCqAhdn79ikgv2VQBKK7rkTyVkcVlbP+j@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2JgcaeM6JJ2yIvzreC1nNoxJDbsPduIWZmXV9gqBA6jDXU53L
	76XCwZuY+YmOA1FqAKrakAwMPWUSQkzLnboKNV3cRPA2n36eKrwdR/FZ
X-Gm-Gg: ASbGncvrGjAa/54GiAXOcxXQws/QbEIePRzNFVj7NDIWswWyaOEgjLm/2FQ0x/9t3T1
	n5M2jdr8KeyyIfQa65kTqzWzkHMscLIBh4QmWl9IXPMKtTnBHu2T1i8olnGklrFZHgKCO7feg3M
	vvALrDTVY5HA30ohMCuEcv8UVslGeDaEJeOU0UWwEvVlJgOrzgSwKBOvGzBsGJJcSpWW0tCFzHC
	sEzEBvsKS4gnKk+H8Bc3Cg6hBV4EsoswddvxNLPSwezTfOxjE9sgts/TRs0r/ZRfr4xVaSlEpMe
	7JGWnZSiyRTjrdlsxQKI1yk1hlo05RTolqfoQhbxr8vMuIQjWTO6wtPwRoZ+d8zMb9i0ya9dgk9
	X0ElnrTEliXYTNTJM1B+C
X-Google-Smtp-Source: AGHT+IH5e9MpTUXvR5lT+TeQX6hIfCC59J8c61jtIZiURU0W6UQc2eem6wclGiDoXDL65CZgVM69oQ==
X-Received: by 2002:a05:6000:3106:b0:3a5:39e9:7997 with SMTP id ffacd0b85a97d-3a5723a3b38mr9192619f8f.34.1750109968912;
        Mon, 16 Jun 2025 14:39:28 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:4135:3769:337c:8a0c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e2354fbsm153211625e9.15.2025.06.16.14.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 14:39:28 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v11 0/5] Add support for RSCI driver
Date: Mon, 16 Jun 2025 22:39:22 +0100
Message-ID: <20250616213927.475921-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

This patch series adds support for Renesas RSCI driver for RZ/N2H and
RZ/T2H SoCs.

Note this patch series is split up from the series [1] to make it
easier to review and test.
[1] https://lore.kernel.org/all/20250523142417.2840797-1-thierry.bultel.yh@bp.renesas.com/

v10->v11:
- Rebased on latest linux-next.
- Added a new patch to update the dt-bindings maintainer entry.
- Added a new patch to use port ops callbacks.
- Implemented shutdown_complete callback
- Added reviewed-by tags.

Cheers,
Prabhakar

Lad Prabhakar (2):
  dt-bindings: serial: rsci: Update maintainer entry
  tty: serial: sh-sci: Use port ops callbacks

Thierry Bultel (3):
  dt-bindings: serial: Added secondary clock for RZ/T2H RSCI
  serial: sh-sci: Use private port ID
  serial: sh-sci: Add support for RZ/T2H SCI

 .../bindings/serial/renesas,rsci.yaml         |  19 +-
 drivers/tty/serial/Kconfig                    |   7 +
 drivers/tty/serial/Makefile                   |   1 +
 drivers/tty/serial/rsci.c                     | 483 ++++++++++++++++++
 drivers/tty/serial/rsci.h                     |  10 +
 drivers/tty/serial/sh-sci-common.h            |   8 +
 drivers/tty/serial/sh-sci.c                   | 219 +++++---
 7 files changed, 655 insertions(+), 92 deletions(-)
 create mode 100644 drivers/tty/serial/rsci.c
 create mode 100644 drivers/tty/serial/rsci.h

-- 
2.49.0


