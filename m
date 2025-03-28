Return-Path: <linux-renesas-soc+bounces-15031-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D81EAA75116
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Mar 2025 21:01:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73EC93A9E7A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Mar 2025 20:01:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 852891D61B7;
	Fri, 28 Mar 2025 20:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m5gvcytu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B2D38DD1;
	Fri, 28 Mar 2025 20:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743192086; cv=none; b=lvlQ6VRmtfT6xkfCYGRmr6hYaUfxhNNkZlNVJTJdbIqLemJzGBAKRyj0eNMNbvfWx+2Hdn8vIGRQo7hr4NBodvOroyPKikk2wcY+ZAlLPupahxN+dq5omCQMcvO04RwMAvYJPuqrrgycPHXicfBy5RIzPn0Cc5Zk1uS7M/q6lOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743192086; c=relaxed/simple;
	bh=F9lG5VQiBqijdc1BsSIAl5jdTQjId2FOU05kNe/eQ10=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fefDTTtcj8D8iy7PWstwHSgjNoIxdxCKYF1DosqwLr37+M1QNkTM41aNvBwWZRXiaeIyOy6+KI2XLNBY0Va5ZAW2ut4FdIOOxr/XkSxIF9n2H3d7/alpMVEZSqUUFM6XbKmCAn4ipmNLbSL40upI/eYcDsGn1IuKLq2E5nBLnbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m5gvcytu; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so25677415e9.1;
        Fri, 28 Mar 2025 13:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743192083; x=1743796883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CWlDjObtNCMAig2x0XE/n+rj8AXxIshTECeaANEV/mU=;
        b=m5gvcytuTzb+6WEl9rBqN7TlXQQglWNfiz9c3YrTAOxhUXS+mReAaGzRZ6uuGoyqNT
         qGc8eQjPpGjaaj3tR4qdsZ2wJWANNZvP5icWV6Dnti0dwaae53UL5QJFLfEllLAjg29q
         XrIQQfD32wu6JngbrN6W37clpEiNhdGdURVsX3Usr7WBr5sgfyO/OGYdFVLPlQTdoRga
         0lTxw2I5/83UYwnH74sVsTMn7lo2TJ8YxvbEO87Tcpl2rnlQc8CyNN8IIdOY6FnxhI9g
         vdnhm9Ofx9Cy4jAZOLK40M3JGwkR/EYrAsRLjhEVH+mmxssDMDP3DNykC70XNYLeiXTS
         8/nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743192083; x=1743796883;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CWlDjObtNCMAig2x0XE/n+rj8AXxIshTECeaANEV/mU=;
        b=tCOqTDpCem5UHHOi97KHMxbqjoxrhKDvqgMSRki4xoSl/ynoMvxXihebS2+Yw/pNBS
         l+GOWk6N72Ehe1SJJoDj+DigzComEr2686bBy2Wx7tF4ZVKSV0HFEv1ufADuzfqCBCjV
         ihKpeLP9i5dUZAT66UM0cVpKjpyGcbCeOf/OHSJAM4ALLL3rcR+MGvhJj7/EWaGmiKdq
         dM52kIfLONqnzr3G6RLknby/nCMMxQFTxoXXCeCxsuMMNtw9pd7uHooEisU2m7MZsa/x
         NpD9mC2GQ+XBmsaK0c/Tv1MkDiSvzYSzHUVa7z7ZnncM2VEleFoTB90k92RybUh+Q2DD
         PewA==
X-Forwarded-Encrypted: i=1; AJvYcCU0P9x9pVGw1R7aqFX/oBFNd9/RCA9khsgevcUHP/otjf59NrIWCU6Y5FFruEiY+1THfDk0djzV73db@vger.kernel.org, AJvYcCUad1xjAwqAYlyP7bzMktRQvGZ5S5J9jajYEbwj4p5BqyNKKoMzdc+W3bUk0oafE9DvZ4nWIY0ztffB@vger.kernel.org, AJvYcCUgfsTHhmIhwZvItRV/DRKhyIZoZXVgyAJ7Sln+JC16LGwt//KfnKeilzKBsWb2WwAmBq79+loqqVyvfUl4@vger.kernel.org
X-Gm-Message-State: AOJu0YyfFJnwzvPtLNP3HoXRMd61b4U5PWU07RIeaR8yiCGdCyk2XtQT
	dvy2OSvWj2JtbbZXVdj3ybaUmEne41wENiwEVP90AoXaAt3w/VZ3
X-Gm-Gg: ASbGncvyL170rAMPF9RzjcpBz3Obu4p4Q5bYmQWDRqBktHDvyX6ck1X668bXEqc0EL/
	RZ3FBafaGF/rrpo6QMv9hNoqZXKbOgi7CgTXob6syPnMR1lcDX0gy4g8UAxcN/TiWM+a11IVzsm
	fTkjkcU1XGp2CJDHZg8+RJ0yRSn86a1IhmUvYd9Kg9/R56wMkol11fBTMCWHlstn2RIJb8UgUSp
	GTSq0HjZzcXW+Onp8QcM6IgvVKR0/lwaKc5FGPkQ1mMxiauPU+qeH5CARPnX24Eb4qnh8SKzF2r
	iVVIOwtRBGIWCx0UMJJvdzR0GT9rpWvoOoDnNEiWpoh2qPqNphx2JgaNbxYg9lx6drg=
X-Google-Smtp-Source: AGHT+IG8hqXIrn97tmW/uHBB5qDdkcyinu5eWQt92U1S5xKjZO1U+G4x3Wv5X8+GrwnTs7rlRRWhZQ==
X-Received: by 2002:a05:600c:c08:b0:439:8e95:796a with SMTP id 5b1f17b1804b1-43db62bda6cmr6056355e9.13.1743192082378;
        Fri, 28 Mar 2025 13:01:22 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:b400:d08:873:badd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8fcceaaasm37930955e9.18.2025.03.28.13.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 13:01:21 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/6] clk: renesas: rzv2h: Add clock and reset entries for USB2 and GBETH
Date: Fri, 28 Mar 2025 20:00:59 +0000
Message-ID: <20250328200105.176129-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

This patch series adds clock and reset entries for USB2 and GBETH in the
R9A09G057 SoC. Support for ignoring the monitoring of CLK_MON bits for
external clocks is also added and the logic to ensure that module clock
is ON now checks both CLK_ON and CLK_MON bits. Also the core clocks for
USB2 and GBETH are added in the device tree bindings.

Note, these patch apply on top of the following patch series:
https://lore.kernel.org/all/20250228202655.491035-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (6):
  clk: renesas: rzv2h-cpg: Use str_on_off() helper in
    rzv2h_mod_clock_endisable()
  clk: renesas: rzv2h-cpg: Use both CLK_ON and CLK_MON bits for clock
    state validation
  clk: renesas: rzv2h-cpg: Ignore monitoring CLK_MON bits for external
    clocks
  dt-bindings: clock: renesas,r9a09g057-cpg: Add USB2 PHY and GBETH PTP
    core clocks
  clk: renesas: r9a09g057: Add clock and reset entries for USB2
  clk: renesas: r9a09g057: Add clock and reset entries for GBETH0/1

 drivers/clk/renesas/r9a09g057-cpg.c           | 92 ++++++++++++++++++-
 drivers/clk/renesas/rzv2h-cpg.c               | 36 +++++++-
 drivers/clk/renesas/rzv2h-cpg.h               | 39 +++++++-
 .../dt-bindings/clock/renesas,r9a09g057-cpg.h |  4 +
 4 files changed, 162 insertions(+), 9 deletions(-)

-- 
2.49.0


