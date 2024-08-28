Return-Path: <linux-renesas-soc+bounces-8422-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DD39623AB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2024 11:39:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 46C951C23F60
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2024 09:39:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ADFA16BE04;
	Wed, 28 Aug 2024 09:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O5emQEza"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A86166F37;
	Wed, 28 Aug 2024 09:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724837913; cv=none; b=J+CJqpQLGGFUWXcFMxicNIEsr8PVexFJm5uQgYZFdTEaTvvftN2YpyaTIzXmg4rUNhn1zD+j46aYrEQJIzEu5Qz02LAwbgjt2k3oJ2lkkw7bpjEee2ASapU21rK5ztH8LHYU6hjtVCtT45IUys8rdUt4ChN3XF+56Lhi1eqR2p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724837913; c=relaxed/simple;
	bh=+qA3GjPhmQm0gBlLtsF1WjNxna5DBK6mvirwve4hO7c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=doezn49Me4e78ev8Bb3cls1xkpe6e94wogEUy+6ToCS3LMXeR5Cwbbokqw1TUuMc+XfU8OORAp4Eqj+vZHto937pNgFeI0E0D6vip2CofgJz2AiJd8sD6RrbN1xV3xEcWXYDuDvM4+uOWRiXiP8XCs2+j0jaenblc6kqBsLHgGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O5emQEza; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a80eab3945eso666637066b.1;
        Wed, 28 Aug 2024 02:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724837909; x=1725442709; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YQezADUoPBzO06uzl8Fep7IgE9TotWNgh590G82EupM=;
        b=O5emQEzahAumS47UF1ptNCYsR7egBkt0ODGp73OUKix/9zX/42Mn2JvdepLrANNB4w
         Y6LFf1hFs8B2GxmSsvPTRwjmZYHjZTKzZ7PlAkFwm/hLFNsvNTh2dclM+bS48RBYVoWe
         7MkFM93R6259vxpVASxgvaP8+WlUtNha8my6zlSaZaH9TytZvLnSNX/m3XozU2HLSfey
         XEdGcAc1Qf18Ow6sMQ1mbrHHtcSI/FkTsk120oOjW04WRMirsq1w69RWmrPUxoY6gNcu
         8so63vcdWItOWqQg87Q15q3T6Uiu8XY7PB+1jDq9KwADltJsfRaloC+PdAD1dFtcQvnq
         cJZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724837909; x=1725442709;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YQezADUoPBzO06uzl8Fep7IgE9TotWNgh590G82EupM=;
        b=E7/6V79kcvecUEt2hoNq/UcEKZMRIZ5SwoEVBzxKcnuZ1VS6235A721Bul5CGxurSd
         gxgXdY85tYLsyupgKQUhc94xTh4djevCkkOy7p97KRiEr1uWwBpesvw54uv+s5jGbuNP
         f3sy8qI0rOUYVqu8ZSQWqAjTyPgRULND7t6TY9YqI0sxj077+0wGE3lUZESioGRs6nkW
         vnL2MSR1Q0shLP7WnsQnld9DN6gegfyU+RaONXorEkf2n02wJPk1U0EV4cu4inaT3OhZ
         EgouJ9NEnh3LQLrwZRZSxDTNpQ2JzJZnhQl4Qq/zZBKntOq/YuxErg93uZxCTQ7dxQ8s
         ATow==
X-Forwarded-Encrypted: i=1; AJvYcCV/9Gw1br/cUD8YTSSnkc75ftnkqkzU+dOuEMNPN889w6/bBZuZdqmtFEBoWXIMPPlSYnXKTuHKk7A=@vger.kernel.org, AJvYcCV9FcC9awL0GJ7C+o1IWfv7+ZYoH1vubdNToU4LMXixVVAJfnBTYeF4rx8e+OFhKLGe057ZSudpZH/TX/Fh@vger.kernel.org
X-Gm-Message-State: AOJu0YxDe94sqoiJUOdJ65nAQojjIKhbOwMYRo+F+KjPG948R1QAKSLB
	ZiPh4FBh73Wzwx0UW3T/TEMCsjV3Oh4RZc4rQUss35qTTbT7ZlmC
X-Google-Smtp-Source: AGHT+IEpsZdR/mnaGMNQLn/MYL46svVGXIjUPQt4XnItVARSLKGHdQuYG4gZj4WquWP6KXgaYlq0+w==
X-Received: by 2002:a17:907:f15e:b0:a86:b923:4a04 with SMTP id a640c23a62f3a-a870aafff64mr107463066b.50.1724837908939;
        Wed, 28 Aug 2024 02:38:28 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:5ac5:89a0:20cd:42bc])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e548967fsm222634366b.19.2024.08.28.02.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 02:38:28 -0700 (PDT)
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
Subject: [PATCH v3 0/2] clk: renesas: rzv2h-cpg: Add divider clock support
Date: Wed, 28 Aug 2024 10:38:20 +0100
Message-Id: <20240828093822.162855-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

v2->v3
- Updated DDIV_DIVCTL_WEN() macro
- Introduced struct ddiv to pass divider config
- Updated DDIV_PACK() macro

v1->v2
- Updated DDIV_PACK macro to accommodate width and dropped DDIV_DIVCTL_WIDTH
- Updated DDIV_GET_* macros
- Now doing rmw as some of the DIVCTLx require it

Cheers,
Prabhakar

Lad Prabhakar (2):
  clk: renesas: rzv2h-cpg: Add support for dynamic switching divider
    clocks
  clk: renesas: r9a09g057-cpg: Add clock and reset entries for
    GTM/RIIC/SDHI/WDT

 drivers/clk/renesas/r9a09g057-cpg.c |  84 ++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.c     | 165 +++++++++++++++++++++++++++-
 drivers/clk/renesas/rzv2h-cpg.h     |  43 +++++++-
 3 files changed, 289 insertions(+), 3 deletions(-)

-- 
2.34.1


