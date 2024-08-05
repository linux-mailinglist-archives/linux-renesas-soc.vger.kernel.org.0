Return-Path: <linux-renesas-soc+bounces-7737-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CA54B948264
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Aug 2024 21:39:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E1942813F4
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Aug 2024 19:39:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AAD416B391;
	Mon,  5 Aug 2024 19:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L1We9UPR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F4C16B739;
	Mon,  5 Aug 2024 19:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722886774; cv=none; b=gOuL7KaTClMy6DZ26WAn8ZZc+QhehRjBQzHemrQ1yZ6yDFCvINRl27bO2uUb4JZNU7gsdRS4xSnyKcvk8hffD2fX95ZyofhnTYkfvYpELsc0JBF4w/YM8zI7DPtzluwi41c8tb9az8h+a96e+4KMTSs/+oLC6TQUd56tEiqVvf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722886774; c=relaxed/simple;
	bh=OxuyHbgKtn6cZOLBlKqkMf8yRw48usAvfLC8uNpU9Ws=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=svJq0EpeVVsJOhdYR6KooBIKwXSC46+YIjQ/P+XfxVjcYYtYhWV9fWKLnTd4S0XVy2R5AlHAf8xFY4T6D06xfJM/KUL21/VgbKLKtAm8cwXcNlPHqQLbZno6BhPZoEHvqOp8IDy98e/eGwe5RySo3QKO236HNe4D1oKVG5hui04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L1We9UPR; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-428243f928cso51268315e9.3;
        Mon, 05 Aug 2024 12:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722886771; x=1723491571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dGEyfP0mV/DHEVkY4LGNl2J5dpEukWhK6gzaXB0a4PA=;
        b=L1We9UPRd3Gs8mU4oM73otT2CRL4KTrsHfRuQRHZHsYysSv8eF3dZtcXe6iNVvMa+9
         pT3M0FNIuiETbuw/BXVeJKrxmxEQh936aPvqstVTBzWvjYbgLI7FQKEyRwcaN92Mkj6S
         QbLNlBGlWd3ieO5rcASIsh6TSVjs4GHDumKpuKTLvoE/vfJ82YGjSgRDk3860TuJfApe
         eGkaGcYRPqG5y/9IttSIJQGV5OLxrU/OBq6T549rWWvdiDGtRvRsivOaWpwPu2WlctB1
         d7WyzaawxLwRlau0Ay9VBFPqvaOAra1wlg24jSTlcdaEVUb7XUYSP0V75K2KpfA88bLK
         2K3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722886771; x=1723491571;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dGEyfP0mV/DHEVkY4LGNl2J5dpEukWhK6gzaXB0a4PA=;
        b=HGj2uaLxZqJy/bUlxTMV+XTpBOcUO6PwyX4qcQcxjPC+A7QtrVyc3DT1e2wB/9mD1q
         iPnLbZ3UzpWMcu1sR9hJW5wtC6gFJSDy1ynX1XLxAXW6+uJ7Qtoj16ecIFNqdkrz+m+k
         D2+JwfpE4vU23h3zKQVkA8B9cSbMBUiVHYHt/AZblVtczfsdpjikmpWXrYG56IntXFVd
         KbbLOEPQCCOb+DQF6yAIjFbDAUnDEEqv+YTGHeYoITkT2IpZ3GAlwywy3ztEdwkG2KPp
         7nQQ2Ub6/2XJQnOtovHceMVpwKWp/10xd1gnCcJyiVrgORz6G/m3wryPJ8pJfwCiriNF
         TNuA==
X-Forwarded-Encrypted: i=1; AJvYcCXX3AM4TaPehR4Ty/GyIrw2QvIDAgZwB0GjU4HJ/FHOGEQ/DAMdBbu0l+Oxs2T5TeswxTo0YLMvrcbcbdkGrdVHT2FAIuKNgVtMEsNaTm8b07xrQIoqC9vtKP/c9Z9Tfg2CpP+tNbVK
X-Gm-Message-State: AOJu0Yyz3IDO5W+kULobt59oo5ENsPX+33a+oUJObNnxAonBu4rdOyow
	q4tuR0Bi92H8jbp99tQ/z/kIZoQZsusSiHvk4XgG/vwwEXk3jQDi
X-Google-Smtp-Source: AGHT+IELmjxvOLpZpyjp46/lip7mAwMXg9akl0FqzFsJbWjnkaKfABQ4ySxCm4fWC9qv/tPvchwLfw==
X-Received: by 2002:a05:600c:1987:b0:426:641f:25e2 with SMTP id 5b1f17b1804b1-428e6b7e80bmr78356715e9.25.1722886770257;
        Mon, 05 Aug 2024 12:39:30 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:25b8:5324:d26c:319c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-428e6e4f5b6sm151496395e9.25.2024.08.05.12.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 12:39:29 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/2] clk: renesas: rzv2h-cpg: Add divider clock support
Date: Mon,  5 Aug 2024 20:38:44 +0100
Message-Id: <20240805193846.52416-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

This patch series aims to add divider clock support and add clock and
reset entries for below IP blocks for RZ/V2H(P) SoC,
- GTM
- WDT
- RIIC
- SDHI

Cheers,
Prabhakar

Lad Prabhakar (2):
  clk: renesas: rzv2h-cpg: Add support for dynamic switching divider
    clocks
  clk: renesas: r9a09g057-cpg: Add clock and reset entries for
    GTM/RIIC/SDHI/WDT

 drivers/clk/renesas/r9a09g057-cpg.c |  84 ++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.c     | 163 ++++++++++++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.h     |  14 +++
 3 files changed, 261 insertions(+)

-- 
2.34.1


