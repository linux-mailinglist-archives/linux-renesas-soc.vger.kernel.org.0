Return-Path: <linux-renesas-soc+bounces-15751-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D00A845BA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Apr 2025 16:10:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F78D17365F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Apr 2025 14:06:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1493C28C5A3;
	Thu, 10 Apr 2025 14:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="AjHQi5o/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09F12857FA
	for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Apr 2025 14:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744294003; cv=none; b=J2emtV/b+rckRGA0nuBqMXUFjdlk4CzsDmNrSvqJyUPRWuicMEYzcQbFnQtO6qCHrgk2VsEqolRJabMQh6EYZCFmUZZPdiCAggyuHI2V+Mv+L8Hey6baYZxyWk5NNCthmlMKEUhWNlk0VDS7ja7/Y0TCVLn098K9fh9QSaCRIh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744294003; c=relaxed/simple;
	bh=70O+m5jMJQAgg9qe/fZx0v9qZJUtTNWbcE/fmW9fTHw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fDviTaRpFfZ8810u4OI9nEulPDbEBYLqe9+E7plgqe54MADARTv8/5WnrxtN07C4047k5kBS1CORMEyEQ58WP8xCi+T5jVf0rx+MFX7KW0tmdj5N/z0PoDM4DD9lqKe2pOTciB03fKMVcagTqVU25RwDNd2eRAsi7QqRLCnOWpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=AjHQi5o/; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so7423525e9.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Apr 2025 07:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1744293998; x=1744898798; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cqmxZUvPf6V2A1Cezn9tnOYvckuzJKW+Y/kXwIn43p8=;
        b=AjHQi5o/hILZFwDbG7swqyT6AchVDQctb6uGJqopwsBDZiXdCkxoY0nx8nIpakOGWt
         MGhlGlqe7P5ZK0E0ul7J5VGQkjgG6kjs6xRZasrA7Ab2CZFNrDTmwoRwX2wso2CG8izI
         9EmmDEbxShbeQNpadwCJ+uD2VOTdwWVwL716j6acSxWyNBzLI6IdNlHuC0wRY6+92Sw4
         Q86U6NIU3duTyHJTNwqeOcMWPuUI5gMl3bqTdLjol1XiLv3YTMH5tihkOm4iINcv/RmG
         K0afDbjfCnEDPFUr9eyG8ge+R35hcA5CvG37/Tez8v/seeDBGnMx7k1qObjwODYYgM4G
         DXXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744293998; x=1744898798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cqmxZUvPf6V2A1Cezn9tnOYvckuzJKW+Y/kXwIn43p8=;
        b=mLMURBdE9HjgtO6jcntwdnwhGuTngwda4K9E498cjVquyHcuDXj4jnEFjSYOi2zII0
         +SzJ8yzI1w2mlzD/zmLAebUwnn0REddbigJ1t1YwEJ0RmtismFLUOQtrM6c55laSfhA8
         zRBm157LO3XHPfox4/FbIzecaWvxyxhLMsxfSqLWeEHOcguO2NVqdtkwvGuHlxdMoIJr
         W9MKN7kYFagNtV3n6EKpL2WE/QNhfzC/2qrwx4ff/DJGvGJDH/ErM1wepnLg0LS+sAGM
         eqGh5HiCUGP8BZIqGAOX7eo5NipyOrFhoYCIvlfxh8lBVCWv6Cuvhl/vRmWTUV1qBjVC
         LKJw==
X-Forwarded-Encrypted: i=1; AJvYcCXjYysUqPEvvgWg7a78vAOdhaMmQtPMR+yTfNrniCVUrYlUj5lqKv99+vNSYAdlVX5jRtDciEUsHElq9fTMs9oF1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEOD8u/s/oron0zqbTXPWL9SNy9Vql9iOF3itsPCqC6f56MaP0
	dFgUpHNaLHn3u9jWoNDQrojavMXKAv1qePRWktAsqMWGnx6LvFBugGr6XOp/GII=
X-Gm-Gg: ASbGnctaZQxDmd8l+o/FcBvhcLOGfb+HM54SintLaghvUIPmDN5AhoFwDBSnF/Q+cIX
	sM6NR0qmUH6blvx9x85MRVZc1PJ/vcb32RNlPqTbV35motj6vB1s9IEv6u/cVQSEjP1905UpsWb
	5a9+6V2AKmAJZmKdZ3nywSdIj1ZuHmeMZP+uhyXnBs9+BYSxRvfa5mgZ5tLhd6G7dps3cwsJxFY
	f1k1WITxHkAv9mLNZd07Ew83pnpokF8T31RGzrxAi/pJ2sc0mRdH8UQ5gHrs4SXHbszjzZiQ+uL
	FU6NE43mJvBiaPPjB7uUULAmKBS1ANPSXGnCRQytmfb9ZXcTi0m1/6pvhdwRfBir5VgQJQ==
X-Google-Smtp-Source: AGHT+IG3Kkwoiog4nj2/Gc1J31GMD5PU0317zNvjLp4mPJY4J5I/eRdRLPfLN1hG/KXOYT+0675X8Q==
X-Received: by 2002:a05:600c:1d20:b0:43d:160:cd97 with SMTP id 5b1f17b1804b1-43f36c78b22mr2008515e9.25.1744293997785;
        Thu, 10 Apr 2025 07:06:37 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d8937f0d8sm4806913f8f.40.2025.04.10.07.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 07:06:37 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 0/7] clk: renesas: rzg2l-cpg: Drop PM domain abstraction for MSTOP
Date: Thu, 10 Apr 2025 17:06:21 +0300
Message-ID: <20250410140628.4124896-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

Series drops the PM domain abstraction for MSTOP to comply with the
requirements received from the hardware team regarding the configuration
sequence b/w the MSTOP and CLKON bits of individual modules.

The initial MSTOP support for RZ/G3S was proposed here:
https://lore.kernel.org/all/20231120070024.4079344-4-claudiu.beznea.uj@bp.renesas.com/

There are no DT users of this abstraction yet.

Please share your thoughts.

Thank you,
Claudiu

Claudiu Beznea (7):
  clk: renesas: rzg2l-cpg: Skip lookup of clock when searching for a
    sibling
  clk: renesas: rzg2l-cpg: Move pointers at the beginning of struct
  clk: renesas: rzg2l-cpg: Add support for MSTOP in clock enable/disable
    API
  clk: renesas: r9a08g045: Drop power domain instantiation
  clk: renesas: rzg2l-cpg: Drop MSTOP based power domain support
  dt-bindings: clock: rzg2l-cpg: Drop power domain IDs
  Revert "dt-bindings: clock: renesas,rzg2l-cpg: Update
    #power-domain-cells = <1> for RZ/G3S"

 .../bindings/clock/renesas,rzg2l-cpg.yaml     |  18 +-
 drivers/clk/renesas/r9a07g043-cpg.c           | 132 ++---
 drivers/clk/renesas/r9a07g044-cpg.c           | 168 +++---
 drivers/clk/renesas/r9a08g045-cpg.c           | 227 ++++----
 drivers/clk/renesas/r9a09g011-cpg.c           | 116 ++--
 drivers/clk/renesas/rzg2l-cpg.c               | 498 +++++++++++-------
 drivers/clk/renesas/rzg2l-cpg.h               |  68 +--
 include/dt-bindings/clock/r9a07g043-cpg.h     |  53 --
 include/dt-bindings/clock/r9a07g044-cpg.h     |  58 --
 include/dt-bindings/clock/r9a07g054-cpg.h     |  58 --
 include/dt-bindings/clock/r9a08g045-cpg.h     |  71 ---
 11 files changed, 622 insertions(+), 845 deletions(-)

-- 
2.43.0


