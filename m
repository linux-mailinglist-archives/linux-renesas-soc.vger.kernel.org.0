Return-Path: <linux-renesas-soc+bounces-18444-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBDBADCDE7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 15:46:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2DDE9188DE39
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 13:46:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7274A28C5CA;
	Tue, 17 Jun 2025 13:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JHqsDQM7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D922E3B00;
	Tue, 17 Jun 2025 13:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750167909; cv=none; b=KvJdZy7YbrktKzddqISCQfGnVj/6gPKNb8jhWxjXJx4iz+zO5qTWglLapDmuWOHu1z3pe99Y4+7oLkBBycb+jdiZ7oFsi7+fCP/3diLU50DDOEa08f4+U7uva10PJ3Z4NWk11hgekJGYu0I2J3+7pn0SdKLtzQeh25vFmqGi7Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750167909; c=relaxed/simple;
	bh=dvm8xNI85YR7mYpQnwoNestsK4G78rjB+tALdRxWgmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Tl9FOa7nqgicxXNmJ3mXY/MmLAkTtnKp/r6ZJv85ggsNrjc5Mm1jeLtkEzGst0HBRqlPlO5OrjAi6T7U6d0XsFkiwgQ4UFmMyudBNCXyuD2uxwFs1dNY/ugaLbEteI+2s+QJH0Mv3Fxn2Bik9w4atxaNPFqQMszPwi7A26VwVBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JHqsDQM7; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-450d668c2a1so45728425e9.0;
        Tue, 17 Jun 2025 06:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750167906; x=1750772706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pnlmn8Lzqxdh9sPxgTMxZddcdk8Ng+ng6Sm09cUpkbc=;
        b=JHqsDQM74CnuCEzYLGdhTDOcX17OgzU0lUEBh3nIheMc1Gxo0VbC4wCFFla+ogs3Yt
         VcEPACw+LfP8WB7XgWATZahjmTLA8mDgStpVCvxRqK5Tanw+FdYroWsUG9zeLBYfIf/y
         mI9hMWrT34oDiKJZMF5RfapouECj/z6myPUrNT18qDpUuIcwc9eM6byYiM83gQcU5JWe
         oft+DX798bkwwUlE0O1Y8g24FbqIM1FDLe7S5A4J9BYbRzVGfaf3cdyhv3yX3Obaj3Cw
         QznxHtvoj1j1NPFsNumwn21Sz1K2fOCp+ZOfTIXKpysIImJPPKzt2H8A9cTI+DvZ2BUA
         OXtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750167906; x=1750772706;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pnlmn8Lzqxdh9sPxgTMxZddcdk8Ng+ng6Sm09cUpkbc=;
        b=QQexw/A1rnNVd0CGpRuKq62jsHg39HsEiCDnUvNkccTmlp8395nHgLHusM88vbh7Le
         7lu3EGXxWSQGZd73fd8kPd5yLsKDAEkbomI/8BG5HmqC4x+LglsE6+A189RokFeXqQiK
         RSE9sR/aLsZpDF5Ziy4XxSkpEbS8On5FFWvDsHWN/CM3NB+7H7zc0Axi1Iwh9aodZvwr
         GnoMthcXDB8LHZ6RegzuXF9Dh3tJdza1zBTq8X0DCqsKpNNw8m3H2YnELqZ8iZNNJytJ
         LWhnRt4CxndexxlG24a82kSDCRUQ2EYwx2LuFnc50Xj1TV0S6C/HPKVkO/uvG9Jype23
         8qqA==
X-Forwarded-Encrypted: i=1; AJvYcCUoW0H/e1YW1JIZaHY7yUCAmQUFKitkHRiF5FIIMVzUJu5t/enl93oVC6hlklh9gB7CX3rXDF+5ggoEKJJD@vger.kernel.org, AJvYcCWGQOd6rrQXvgOGDUy8/IiuswvEfRg3hPr9rmMhSZi3voQaKt7k+bSy0ndAFtU/Z/oPwCJUN8oODLeR6oAH@vger.kernel.org, AJvYcCXBMui2K7odf12KYeHmLOA32TiImwoohrlED3ANfjwXBCI6VcOcYIV7mrgIK1zZTRnGJN6vZdkvECK/@vger.kernel.org, AJvYcCXtZVWfkLUcB1EGhLlNeNsdF1DTSE6C8W1ZMEEQgq/MP5YgmoPRkyCdhW5XDUBZ9bSkcM3pVYBGWSDEpEztlC1eQZs=@vger.kernel.org
X-Gm-Message-State: AOJu0YySIHhWLmhwuCB5ZN4wvNF1mh6WyaekCzHk4PKUzRBQReW4Krhf
	02Z913zYsuWxZA2rby7922QKRWxtLOSTq1sBfZlcIKBaxgW28tnxza38
X-Gm-Gg: ASbGncvRsVQZAyMSbXKHpB1hzOKa4VEmkRddj/GUlR4JG6cKvPVtektYGOpN1pKUsM3
	JV2wJkyGvegJEqcgf9mUqgm9aWAIeHHXOFpUlTKtATf95DdXOtqJ/FH1JcZE4p09/zXx3HuDh2w
	pP9duDF1dVnJnM4xYsQ27DUEyUjF9dXtmH0hTH7qw3d5VfAugCQkmKEprpM1sARYxsFypD0nJc8
	MAvpXVtyz3GW/Abgk9pCBpIRb5SXNtPSE6zMbFFr3EhUwBrWNXWuADJXOv8tyv6uf8Qywzsgwks
	OMMxKgzcP7v2I78T9ovLA5jV6sjpjStbN70aeT/3olhsC1irWWKdIc7m0Bt/5nPkdsF0Wd9R/y+
	iqlSoBkJaPnw=
X-Google-Smtp-Source: AGHT+IHCtEFS8GzQ9Jzl6qP9zWaGOsHpYn8vtBkAqczxW1urVL0oMFvqxpp+QY6AejM1vZ2do47qRg==
X-Received: by 2002:a05:600c:a01:b0:43b:c857:e9d7 with SMTP id 5b1f17b1804b1-4533c8ce774mr133642045e9.5.1750167905615;
        Tue, 17 Jun 2025 06:45:05 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:a081:30f1:e1c7:6f28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a54b7asm14239728f8f.16.2025.06.17.06.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 06:45:05 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v12 0/7] Add support for RSCI driver
Date: Tue, 17 Jun 2025 14:44:57 +0100
Message-ID: <20250617134504.126313-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Note
- This patch series is split up from the series [1] to make it
  easier to review and test.
- patch 03/12 was sent out individually [2] and is now merged
  into the series for convenience.
[1] https://lore.kernel.org/all/20250523142417.2840797-1-thierry.bultel.yh@bp.renesas.com/
[2] https://lore.kernel.org/all/20250609192344.293317-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

v11->v12:
- Rebased on latest linux-next.
- Added defconfig patch to enable RSCI driver.
- Added RZ/N2H support to the dt-bindings
- Used port ops callbacks in sci_shutdown() to allow RSCI driver
  to reuse the core shutdown logic.
- Added reviewed-by tags.

v10->v11:
- Rebased on latest linux-next.
- Added a new patch to update the dt-bindings maintainer entry.
- Added a new patch to use port ops callbacks.
- Implemented shutdown_complete callback
- Added reviewed-by tags.

Cheers,
Prabhakar

Lad Prabhakar (3):
  dt-bindings: serial: rsci: Update maintainer entry
  dt-bindings: serial: renesas,rsci: Document RZ/N2H support
  serial: sh-sci: Replace direct stop_rx/stop_tx calls with port ops in
    sci_shutdown()

Thierry Bultel (4):
  dt-bindings: serial: Added secondary clock for RZ/T2H RSCI
  serial: sh-sci: Use private port ID
  serial: sh-sci: Add support for RZ/T2H SCI
  arm64: defconfig: Enable Renesas RZ/T2H serial SCI

 .../bindings/serial/renesas,rsci.yaml         |  27 +-
 arch/arm64/configs/defconfig                  |   1 +
 drivers/tty/serial/Kconfig                    |   7 +
 drivers/tty/serial/Makefile                   |   1 +
 drivers/tty/serial/rsci.c                     | 477 ++++++++++++++++++
 drivers/tty/serial/rsci.h                     |  10 +
 drivers/tty/serial/sh-sci-common.h            |   8 +
 drivers/tty/serial/sh-sci.c                   | 210 +++++---
 8 files changed, 652 insertions(+), 89 deletions(-)
 create mode 100644 drivers/tty/serial/rsci.c
 create mode 100644 drivers/tty/serial/rsci.h

-- 
2.49.0


