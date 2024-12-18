Return-Path: <linux-renesas-soc+bounces-11540-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 640519F6820
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 15:21:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C8CE1892543
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 14:21:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27CCD1A23B7;
	Wed, 18 Dec 2024 14:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lA0r/f8r"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6207F477;
	Wed, 18 Dec 2024 14:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734531654; cv=none; b=te8sgFXkhiVpAn6WqLqxN2KuaDPlGORtRJP9dNPuQ3+1ipWI+cO81uYqFy3WKQdJKeM4fcYKhHh5KEVnANY1rXGUzP3U/iA9dhN42KP4CAxEgouXWDPcAsMLtKG3l60XrmHEUPyoDahEozWwMpilkb0BwpuM5KI6SEWrg83rXzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734531654; c=relaxed/simple;
	bh=zoTt0puefZv5r1LpvqPkZzp48Yss7QzAJe1f+q5mZ6w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qDAOmv0/26Z+35DMLQJnZeEiOjvJ+Kj1MJ7Oc9nvJmGJMZ4Ct806pxuAYi7jHzjGn42rmipKoNoDJ7MjcCBEmKPlELHDtVQPIv5kcRtM/Wo72ovog/F3r3/1oAfWjg2xZonvh6gXv2LYpTAG9AWx4gC2XwdPrY4bnF8JZ13VU1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lA0r/f8r; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-385dece873cso3098703f8f.0;
        Wed, 18 Dec 2024 06:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734531651; x=1735136451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FZJUUOcSLzYHcbWi3FJgaxrODJzDVHPPA/EOheJAVvY=;
        b=lA0r/f8rO3sbKoiOEG/DeWD7WOskqgETALtPrkYWnrhDfNN5r4g8M8bsUK2CmJA6Jv
         XnZP0mdaopc7pJmVfp7o3/su4BGtPztAfpD7e3UeRsz73HA+wpyTkeF2BrDXyjaCEw+d
         fCLUpfs/YpbTW6vNUzzQi/SnGhkgpzDGAIt6SZ0DIkhu/rKPW6ztsVfCgt6FXGv0El5k
         MFRnJHOTBI/Pa4rUNPsgoasXrzQSrjdMmvJfN66CQRdewR6JJMvBmP2h47NECArvlZHk
         kkySqeDsLIpjY0Bqb+Ua3J7j2kMKHW/WiEX7o6LZjBQtbJM1chgNe4gTciy+O2GSEyEc
         9ORA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734531651; x=1735136451;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FZJUUOcSLzYHcbWi3FJgaxrODJzDVHPPA/EOheJAVvY=;
        b=b/NnNP/FyXokEP5mrWFzY6mZVDTIlEX3QApsUQUgKEfeXTOOE/3zW2pBiqJquwzQad
         RytNNEAQFMRuKT1kZ1P2hRFpZz/gKMUdzYVTkVimaMntIjqMaiBD9qNTg9i0UP55/G0/
         q4AbQloWW64EX8fNAsNvr+lkoXj4+nvCWs+iI1MEVprMNn9nIWCKjQh0NPODgGhWz8DC
         CrIdX9LjZH1kIhkIWCO53otPXcwJQ5uWsjx2YPtpoksogZRBiU9RzvCByINpLWvmvb3P
         pXMBZLMlvQpXGhuKvi/gmFnGo+OV41nEt61x2hWnlVntpo3IDN5bMGHgBy7pshhdRqs7
         y6wA==
X-Forwarded-Encrypted: i=1; AJvYcCUvWQERFeAA6cj0tzB8+7Ws0iP1mCRouRaVXcVSTLm/WfvSz+5FzNLG0A9vsA+/0jgRsnmiUIf6YgQ=@vger.kernel.org, AJvYcCVF0NzzvGWHema49tytKh2F0FYjLQMX+USaR0iUrPgwe84DUEuMRO2Egto2rmhIICgL1R2bHx6RMbsx6ZNQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyqbVvtmK1O7lCSEDRoeqKe0lVOPmmuBDiK9lfNbkYP0bLC0YBI
	8WQxYIdjHdcue4IPTammRFGki1YfKc7Rpcv1Lv/nZS8werFrxltU
X-Gm-Gg: ASbGncsENyQ1PKtFD9BjzMv6P29Mha7zLf24j6E8YNggICQpytNLGY03tnysBlBib8d
	nabTS3okKQLUTUAj6Y7OmEd3BiIQJ8fx0h5c7l0SMcp7U7jyIsThLBa/Ut9t1EvSzdboqmAgd+K
	B1UFhqtlY9GaJ6itaCiSlSvW1nbUIFTU90/Ns1/1PjrC4V2nekIfXHsE+DC/4U8fi6DAsZlEkLY
	LGjv+uYdBiUUbhgUXGkOb1uPkVJVDHLJH20ogCxgR/XwSXM0ZNx1+84dtVWSXPh2lkV4UkVZfr+
	lLuexSvDYw==
X-Google-Smtp-Source: AGHT+IHQUNuEoBdI2jfXrvGZj17PLXDgsTNr71MBl4jwIy/9QuQzStIqEb0oBLGUDC2ShfHEQyHUJg==
X-Received: by 2002:a5d:47cf:0:b0:385:dd10:215d with SMTP id ffacd0b85a97d-388e4d8e695mr3228872f8f.44.1734531650526;
        Wed, 18 Dec 2024 06:20:50 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:9516:68be:c7cd:69f2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c801ac68sm14107033f8f.51.2024.12.18.06.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 06:20:49 -0800 (PST)
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
Subject: [PATCH 0/5] Add SYS and GIC clock entries for RZ/V2H(P) SoC
Date: Wed, 18 Dec 2024 14:20:40 +0000
Message-ID: <20241218142045.77269-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series adds support for clock and reset entries for GIC and
SYS, along with some cleanup and fixes to the CPG family driver.

Cheers,
Prabhakar

Lad Prabhakar (5):
  clk: renesas: rzv2h: Fix use-after-free in MSTOP refcount handling
  clk: renesas: rzv2h: Relocate MSTOP-related macros to the family
    driver
  clk: renesas: rzv2h: Simplify BUS_MSTOP macros and field extraction
  clk: renesas: r9a09g057: Add reset entry for SYS
  clk: renesas: r9a09g057: Add clock and reset entries for GIC

 drivers/clk/renesas/r9a09g057-cpg.c |  5 +++++
 drivers/clk/renesas/rzv2h-cpg.c     | 15 +++++++++++----
 drivers/clk/renesas/rzv2h-cpg.h     |  8 ++++----
 3 files changed, 20 insertions(+), 8 deletions(-)

-- 
2.43.0


