Return-Path: <linux-renesas-soc+bounces-6139-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD2590684F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jun 2024 11:17:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8200A1F238BB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jun 2024 09:17:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E855713DDB2;
	Thu, 13 Jun 2024 09:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RJKU80hL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBBB29AB;
	Thu, 13 Jun 2024 09:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718270254; cv=none; b=ANTNutRZP2ctk8w8OSAn/NS+MGo9SsrbK5a+ejrIRY+t2fkMvaLUTVFgMr473O1kNnVCjZgGWfDus6IPeE1a+FclrW3e+TlBmHR62lGs9ky75tBmT1cURxl6vhnab6/UB90x2es2GNArHSYozn3gy63a5ZwxF4IBhXzosEfUyRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718270254; c=relaxed/simple;
	bh=KbnkV0SD4g5Mp/sP4h44iZtb3FWDCYS6YjGAN51Z9So=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=D6nUSDjTL2vo9IFbQ0Xm6QBMHc38Zj/Y0FpjBhqPz4g3tcskBJ/I4+ZydGWY1HZb99TaCGDquKzM8WW128ZX5DnSeFq4g7PTGF8mXgI/7jYCR/8/QQX4ztUOtFRmgnJlDkQu5uqshEDLQLFTIycZpS1LJ5WjmrSRVE1gJ/o3FeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RJKU80hL; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-35f23f3da44so841188f8f.0;
        Thu, 13 Jun 2024 02:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718270252; x=1718875052; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7TaK/OjOBuBP0ls8DyduVAGj7mly5BxuoV52mKhBf8s=;
        b=RJKU80hL4ox5ctAw03xFtjEqnqR1mP2rWRj2NVNxqUpqM8GqsNRhoVSXmBvBXdq8i/
         EUkflPdxL5+dZ73gy+Wkm7RD7z7p9hOe9z5YKaDS4hXYEHhTkQDUkdu1dKz8XDx4HOCX
         0mk0g+wDrEyDDD6OFP2wKc73bC5MpJ+yFg97A2thFb1mb/NvYi5HIO9PKNTIJ/Tcli7v
         WNc9pQmOsreutsmCyT375BR6gjmsP9y5DoshAALYD3Cte2IEH948vPLbYN2j2GpRk0Z8
         vU0rghE+fyFbSgPdcNheCL4GEKDFNAdvcBfIWYyOX79vDO7bFgIizyxJVGddJhzRQ1GZ
         Ynhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718270252; x=1718875052;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7TaK/OjOBuBP0ls8DyduVAGj7mly5BxuoV52mKhBf8s=;
        b=hFQGYKTeE4nieffdrHaFyn3Ctlr6qCWvGSOAYZxmn4JU+AhWV83k/aZtLa79vYcazd
         WEOQml6Iup8hiH8liXgO6rtfGYqPcz1cZlC5kDo+c6ehHJMV/btijHJH5qVVdy6Sv1Mn
         iQ/SmjmZCgr8cv4aTPRyWu5aX7Zg1SUPCQxAJjFkLNr1qt58zHaFRqNvpfwTcjStVaTU
         eLU3xLY7vX/30dBhDNZMwMbIpLNITx2RzuIwp3AQOdJaU/U33w/WYfzHaXfAwIo9XI3U
         iUKwhDjm9ob9+Rm7Il64534HcGjNNyUOdazPQ2tSkj5yG5uWAC2rO/WtWv3ATu2jD7C4
         KurA==
X-Forwarded-Encrypted: i=1; AJvYcCX+Aokt6/YME8CNbFkpMdh7+a2zr/eUv/K/jPa3Wzezi9DEcaHdFuJixlXLNsJnx/Ie5xywykxRbu7xy9r2t+LVozIxYHQ9FtmFUurEBH6W+3AQhyRCf4hatNBWV6hXfJfEI8DJrRHMgfJtOfir6of6IueQbJ23pF/w8ewOafX68OsY26Km7O8pvMnH
X-Gm-Message-State: AOJu0YwTp2zz3KJbj9x4rwCusFXehW3X6u8OGgH17ZdAnA8nHLjMVE/F
	qKQXjcSPpkAHmqS36oIY5zpyvPYlz2kOLnlPBIvPhnEZc4DC9s3S
X-Google-Smtp-Source: AGHT+IHVxRXPhSV2oZHczdAWoDg2kZ6dDgE2zpuweqWtBTGCUQp64pLCzzP+iRURZ5IW+OhJzty+nQ==
X-Received: by 2002:a5d:5245:0:b0:35d:bfe3:1817 with SMTP id ffacd0b85a97d-35fdf79cacdmr2723036f8f.21.1718270251407;
        Thu, 13 Jun 2024 02:17:31 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3607509c79bsm1108122f8f.41.2024.06.13.02.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 02:17:30 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH v2 0/3] Add SD/MMC support for Renesas RZ/V2H(P) SoC
Date: Thu, 13 Jun 2024 10:17:18 +0100
Message-Id: <20240613091721.525266-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

This patch series aims to add SD/MMC support for Renesas RZ/V2H(P) SoC.

v1->v2
- Dropped regulator core API changes
- Updated DT binding
- Now controlling PWEN bit via regultor api

v1: https://patchwork.kernel.org/project/linux-renesas-soc/cover/20240605074936.578687-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (3):
  dt-bindings: mmc: renesas,sdhi: Document RZ/V2H(P) support
  mmc: tmio: Use MMC core APIs to control the vqmmc regulator
  mmc: renesas_sdhi: Add support for RZ/V2H(P) SoC

 .../devicetree/bindings/mmc/renesas,sdhi.yaml |  20 ++-
 drivers/mmc/host/renesas_sdhi.h               |   8 ++
 drivers/mmc/host/renesas_sdhi_core.c          |  43 +++++++
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 120 ++++++++++++++++++
 drivers/mmc/host/tmio_mmc.h                   |   5 +
 drivers/mmc/host/tmio_mmc_core.c              |   7 +-
 6 files changed, 198 insertions(+), 5 deletions(-)

-- 
2.34.1


