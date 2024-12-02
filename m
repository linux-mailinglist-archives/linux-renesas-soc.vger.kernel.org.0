Return-Path: <linux-renesas-soc+bounces-10785-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9249E0DEB
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Dec 2024 22:31:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4D993B3834A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Dec 2024 20:39:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F05201DEFC1;
	Mon,  2 Dec 2024 20:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZEJmH/KS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD881DA31F;
	Mon,  2 Dec 2024 20:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733171971; cv=none; b=m1isL9dEGs/bBxSPyA07BSaJVvu8VkcuradCBjbuICufBiCykTGELuMrGQyzxssy3eNHQoEFIzrGZ/Z3BTGPaCiY6lWwr4HR3IRvoIJkTlfNupYZ4jN6+lAPTOu/9bVMMQNJqW8IwyOoNL9YRfIAHR3k8Ibw2oNCEd04xLmf808=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733171971; c=relaxed/simple;
	bh=5WMW5fPxXuqw0IhuEhzOfF7R8KKFqPAqwtU3yZ03Uaw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aWEXPN7UGip45qtgOFcjQTHbIumdocg/sB6dR56x4QdbrsxY9jamGs8W6S7d/QW0W6+V/gfI90zBHw+wOeTOQlAjIxYAfmuohIOO8UPRO0ScnbFCPdrwY6trYd1zEofx1LY9JvFf6u7hPyNG05MmPMocbHlKA5rnKqDYylAHFps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZEJmH/KS; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-385f07cd1a4so1389563f8f.1;
        Mon, 02 Dec 2024 12:39:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733171968; x=1733776768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y/ozqNVGQY7GHKDtYxU0ut9giD5Jftfjm82IatSd658=;
        b=ZEJmH/KSXRfxQ9ne1Kr1Na5X8byVpbfSKzSHsOTwd90cpPhuiK5+LpkL8QlyFUa2Oj
         WtoUWYLkHZwr+Hw6yzwNTV3Z6TtyLF9nQb1xiLO8htXuTCE/o8xq+bqPxZmmchCGC5cK
         kXC9tGWClYIF4IuUsGBdI9NkdOXjU7np9zGNC/GKSyK08Drfoi5d/zZF43N2705uA7p0
         6fu/ILhqSnQuEYcgbub7ld7ynQBlijSEQFJrJhBfu0yQBqUpXaxXmaeP/YEpoM6ifQN6
         fccUYSQ/wrvhm/TAQ8qiPMxSh60Uud8R2d3LxTekXN1Go4QuKtY11CHpD6Ia5C4mQiXC
         hTvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733171968; x=1733776768;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y/ozqNVGQY7GHKDtYxU0ut9giD5Jftfjm82IatSd658=;
        b=lBk/0yPP/GOjyUdxV7smIVT7u9VnsjEC+6Ijrn9nvOzNMfb9Mp8B5rNEAVo1fYPOKp
         PBH4CXaKVs3nEcl3xlTiZVDkzpIekTU4GNLl8FincJI6K4IxOflNsoQpdBCTcRY8vYEG
         LkeP9IJl74OgmBJgxMRAUWKNiylJ8wIanEepmBEG6+n3n7gO52ZLE3OzcRkklumOhRft
         H0AGksiNi6dbc5sULyRDkv1ykeYhBQDkFRFq0G+Usl4PCDvwTZbrwr4XzJ5oPZ2iKTEN
         Dt4RWr/PrBPZhvHhamhQp4m2/CjAxu1da23kyct7mBVQM4CnF3Qcjq2aPFiUua3Lvibr
         BD0g==
X-Forwarded-Encrypted: i=1; AJvYcCUbxtSyUq6gBWBAta5StXcA4i3bR2jEEyBEpDjw2mKnw8cwThwsq5Uxyul4wtS4yAdbBW6eig2oV9Y=@vger.kernel.org, AJvYcCX/vrAsPJFFf68rTRixbvjkDMHMyJ9S8le4F/kV4GBsHHTcd4Ov85ccA99ABbixDfSBm2i1P/QjdYN273RZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzNt8J8APrTunkEer/hV0YmA/0fJjXBxw1YiQ35ow4/nUZ1oYkG
	9CJgyV9WfU4sN88/lUWHTZxn72M4yz7MrA2Y6g/w25HXkTcLXakJ
X-Gm-Gg: ASbGncv2V3TIUfyspLOthuvAxZYSDnWGl1eOSPUNat0xRG3fzjI9LOVWTQJ4cez9cUW
	VLbwQT2fh4WMDr0oXaGf/GZXahYIkNc9kVfZrAS1aL/uT2D6Nnl0Rru+Z/hYQniQ5UmXswxLnPd
	EIib8KGig+0+i//s8FETyHxirbMh17HDqIEcgGDKLH5Gx3e7EFbPtztW8PWA8ItvwxBDbYZsVLj
	OhqxWrrc1XBWxSKLCaJEbjECpwuwsl+d9Vpj/oczRZ4YrdTuWqsFO0yVNFIo9QI+FV82bYHEBOf
	4Q==
X-Google-Smtp-Source: AGHT+IE4Xz2qkPhRkKwhfCCeNARiYK9ReaN3//dm+RUIJuMPxYYyM8ENIxNczG82xeKTlM1LpMbiLA==
X-Received: by 2002:a5d:5887:0:b0:385:f470:c2c6 with SMTP id ffacd0b85a97d-385f470c631mr4642809f8f.11.1733171968337;
        Mon, 02 Dec 2024 12:39:28 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:7f2:1e67:9db5:ea0c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385e8783843sm7640201f8f.4.2024.12.02.12.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 12:39:27 -0800 (PST)
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
Subject: [PATCH v3 0/2] clk: renesas: rzv2h-cpg: Add CRU and CSI clocks
Date: Mon,  2 Dec 2024 20:39:14 +0000
Message-ID: <20241202203916.48668-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series aims to add CRU/CSI clock and reset entries to the
RZ/V2H(P) clock driver.

1] patch#1:
 Allows exclusion of external and specific RZ/V2H(P) clocks, such as those
 in CRU block, from Runtime PM using a new no_pm flag and helper function.
2] patch#2
  Extends the r9a09g057 driver to include PLLVDO, its related CRU clocks
  (CRU0-CRU3), and corresponding reset entries.

v2->v3
-> Replaced `rzv2h-cpg` to `rzv2h` in commit header
-> Switched to use for loop while looping
-> Considering core clocks to be non pm clocks

v1->v2
- Update code to skip external clocks from runtime PM

Cheers,
Prabhakar

Lad Prabhakar (2):
  clk: renesas: rzv2h: Add selective Runtime PM support for clocks
  clk: renesas: r9a09g057: Add support for PLLVDO, CRU clocks, and
    resets

 drivers/clk/renesas/r9a09g057-cpg.c | 45 +++++++++++++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.c     | 44 +++++++++++++++++++++++++---
 drivers/clk/renesas/rzv2h-cpg.h     | 18 ++++++++++--
 3 files changed, 100 insertions(+), 7 deletions(-)

-- 
2.43.0


