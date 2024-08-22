Return-Path: <linux-renesas-soc+bounces-8012-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F5C95B39B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 13:16:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 19B991F21DEB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 11:16:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39A701B7900;
	Thu, 22 Aug 2024 11:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R/fhxvtO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710561B655F;
	Thu, 22 Aug 2024 11:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724325406; cv=none; b=lgAvK3SC1c2aoXDWxNTAS+ZKJs2LmpPdvNHO9YmN7NHD77HBh+JH1SV7QMmv1hQY/uANCyBmAU8Z8zvw/VOKcWg1vq2UbwycAshwRkaubHUI47yq6aV7RkZYfN/k3IR5fDTGcYwYtgvMcnM4mDFg611I4RIVO2ZudBa945I8MOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724325406; c=relaxed/simple;
	bh=MS8drOrpkprDQggPjDXBcrvOXC+E14lM29ac1WHkjMs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=q/Pvd9SoqbOdzQ3GpqyaRE1FtcADi93PZBZoGkFogTgb2fvYmy1dv4FE++Fe8aULEi3blLq/7d9c7gjeoM7yqAQ7EmbtaRUArojP04c87GAkbax8H9p0ZeZP3s3jE4IMDEpGU2nmBr0VWRpOah/nA4IAGKY9ecmCF4vvpQSi5yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R/fhxvtO; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a868d7f92feso96779066b.2;
        Thu, 22 Aug 2024 04:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724325403; x=1724930203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0xLWHCW9+tYtIK4g3T2wlbKqyAP5xWhxCIz1m/bwt7Q=;
        b=R/fhxvtOR4j/JG654IrzFi4sFvp3kamONuFbaKIbm+t4E0CWDTLtlM37ZJ0GQQJoTt
         m8rx/d4RNbbk2ZD62eVpajvkwpLAu1zr4ataqBLtc2yayjGCjFBxB8sk1wX9yDpH2CI5
         VGyg69VjXGzP45Z5cHhR0p9HQqUhyAyaVMxxRMfECrahgPCzZ4XG4y/LXbyDOSXDLPGn
         AVcwSk8SXkMPC60o2Ggmj+G6BAxEM3frxS2q/TcymHsAusE2BaCbsmhC/qz3OrIRs4F/
         DNz5lZnyGG6IaRPe4wbG8/kkLUHmKE4H/C6zNsDy45jHniWiec/rFfe8S8BjibxPTxZf
         Ra/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724325403; x=1724930203;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0xLWHCW9+tYtIK4g3T2wlbKqyAP5xWhxCIz1m/bwt7Q=;
        b=ijtUDpRpoZ6gIez5iWOTXOotlsuq3hkNsyTx+YmXW7J563t/i/hYXsxHTHi29Vd3Gh
         iZc2AicpOFjRHxca+/t1RReg029pq3OrS/DwK0MkJ7jF5m5RsHFz8HQbTE39Q1hZoOqk
         fZQyPrrl7UD8YohUA4YsH80nkwlM1ERbI3gJ/G/1HnTCytPSyxlsgvDrWINviRisCDvQ
         fZhhcWoijgvIoQatoYYxgAB5LyYKTLW4Cqk3nCo3u76+26vInPkdJVz3/D9LZKJWivpM
         HZmxlxkfuy19KhhOP/e/sZ9qSl8EEzkPWCjCr+cfMTtCJ+rJ/v/deETT5DvrrbUVTKmW
         wbUw==
X-Forwarded-Encrypted: i=1; AJvYcCWJnHQzYyusOwxtRwVWWHeBR36bTdrOURO052QHuIyzeBNw2GhWfbRO9baA8rGyfZ+k/j+5J3kZayj2Iz50@vger.kernel.org, AJvYcCWLDzT/1liVn2xN3N2KNbmYsOzq8VWrYe+jcZO4LCQYkD7hJ8CxtKglMd/Wu2xBMcM+6KaZ0UJfWtI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGEH1tll7IQHMZHepv4nIt7SI9StuWJQaGKoFq/RfGDd+rnsoy
	RbeEfDhKYwU324XbObOqTARsCBYe7o2mc2aa9JXCauvdsPX+FYgi
X-Google-Smtp-Source: AGHT+IFhzGOOXgwsvNnpYNrFz0I3p4jjwtLkwh2w09oW0/0IKFVRPWg1zTOitjJxD/Qf8gWxZoj+2A==
X-Received: by 2002:a17:907:e294:b0:a7a:a30b:7b93 with SMTP id a640c23a62f3a-a8691abaf6bmr131501866b.2.1724325402325;
        Thu, 22 Aug 2024 04:16:42 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f4f46a2sm104479766b.208.2024.08.22.04.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 04:16:41 -0700 (PDT)
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
Subject: [PATCH v2 0/2] clk: renesas: rzv2h-cpg: Add divider clock support
Date: Thu, 22 Aug 2024 12:16:29 +0100
Message-Id: <20240822111631.544886-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
 drivers/clk/renesas/rzv2h-cpg.c     | 165 ++++++++++++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.h     |  14 +++
 3 files changed, 263 insertions(+)

-- 
2.34.1


