Return-Path: <linux-renesas-soc+bounces-4458-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9883489F908
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Apr 2024 15:59:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 391731F28641
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Apr 2024 13:59:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A41BF171641;
	Wed, 10 Apr 2024 13:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="IzDMXIcE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500B716EC1D
	for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Apr 2024 13:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712757263; cv=none; b=D3Dp9JgGdeqn6f5R8w/opMWNTxyY3XnVLUv1ThYz/qCzqK/IOaWW55fha9NUB87O1Dm3AzVFA2HBSEwE5sSR3+6zPt/Dlod5kfz7ipEnSM1saV4bOTUef2zda2mylGhqADFfyPIhrhxMSrla5hO81g0uqeWO1/NYXiIiaYvcNNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712757263; c=relaxed/simple;
	bh=FA/JdKZlZ4wileZrc4xp1llDql17/NQkyQ+ez5FGdwI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=f0wzj7O8Mhz63F/TUhXp5qTKJB+lsjVKrNqdOsju9sWe1l5KJ5UoJbw4/wAfmjDmKPUWCjYXJwvyMvXzkUUN3NxphLERZjk/+lelqSZApEdmYgDZAfCM5oXrb06cFu0BDhdztDrjyRkkoy9OrBee6Q+3+B10cRK/tskJ/dHRvYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=IzDMXIcE; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a51b008b3aeso536753866b.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Apr 2024 06:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1712757259; x=1713362059; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=om0OP/V4nCTPs4aw/OiE4dwxH9wZZxHeDC9s7eqLnZs=;
        b=IzDMXIcESBv5IrpIpcW0X1lmc+XKu6Zt15PO4BYAj+k6KhlUY+rEaJ2/xfD5Zex8J9
         Va4A3MCsgWm6x+k5DyJrWn9mK9XN2mDe0UYfTnwAwmkwtkBv9zg/oLFtjokWoigLaDjJ
         8eSDhOAeLObXl6TgaUyNBC2iQCVOyt3bv/supk4Qiyvxq0DKhJLu/f2sh15iyplApeEl
         7FgAP7qMzVEWSY6ooCLvZuxnVLNcORaaj5F+x7d/5dgo/3N4IiXp+51vXXwwq/NZUY7p
         ATSIgp5RaLQvVU7RUmAPy8dM1qo9bIF/9XOliLIFyIfl4IJCgCiZ9AAtmVJ9uBRDpQBD
         9BnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712757259; x=1713362059;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=om0OP/V4nCTPs4aw/OiE4dwxH9wZZxHeDC9s7eqLnZs=;
        b=srEiZCgOs2KnssYdMzPb5rMYnDCajcBdpGvKxyum8/u3ftR3BdiTeZZpKn1VJpvOly
         He0AefGF5ugpK61/ZYEf2++ef7k2rcapEn5IZg/y7tZtA1KX2bWZdfTNVSPVt7kSo4LU
         STN+MBWyxXkDPX1nj9zzqALXORlInKpRppwO7a9szF1weZHPq21u7IfQzfKnYuPs6Dji
         7V7nizWznkwY3MHvJ98SIKOPm/uj6HGBoXJnHGfCNBYlhrlnvL6ZWvUAbLfSYwYbEGih
         XYdwnQUFNxPAAo+8FDJa9e+93rfVEBLDv2vsa1UoPtD4r1cjME8cpop9d4WHXhYCRH8y
         yoYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpzYTGB4ysSMYmVyCJe/265/+CTjTp061G0tMvklF9A2jKNcVA2p46rA2kJzFIjonyD09jKZgzaSHq997s/jFST5adfncX5AS0/OaS0SzPo8Y=
X-Gm-Message-State: AOJu0YyPe1cxWpIlJZPDIWXRC1Z9V9gAUpV9YqP+6v9298pgOP+nnLR1
	eLedSeyCsROaQ6bADPJvUW3BGir3YtxekuigeeMbTDE96vaMvcSTqUbN3m7x64A=
X-Google-Smtp-Source: AGHT+IGFaK7YauW3aftv+Qevb50NofJrq4hZ5pzMklC6FKomV3FAiFrZZzWTPk+ZoftKIoNvunVBHg==
X-Received: by 2002:a17:906:4a54:b0:a51:d1a7:ad6 with SMTP id a20-20020a1709064a5400b00a51d1a70ad6mr1598346ejv.76.1712757259608;
        Wed, 10 Apr 2024 06:54:19 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.8])
        by smtp.gmail.com with ESMTPSA id j24-20020a17090643d800b00a51d46c684csm3979691ejn.89.2024.04.10.06.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 06:54:19 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
To: wsa+renesas@sang-engineering.com,
	ulf.hansson@linaro.org
Cc: linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Hien Huynh <hien.huynh.px@renesas.com>
Subject: [PATCH v2] mmc: renesas_sdhi: Set the SDBUF after reset
Date: Wed, 10 Apr 2024 16:54:16 +0300
Message-Id: <20240410135416.2139173-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For development purpose, renesas_sdhi_probe() could be called w/
dma_ops = NULL to force the usage of PIO mode. In this case the
renesas_sdhi_enable_dma() will not be called before transferring data.

If renesas_sdhi_enable_dma() is not called, renesas_sdhi_clk_enable()
call from renesas_sdhi_probe() will configure SDBUF by calling the
renesas_sdhi_sdbuf_width() function, but then SDBUF will be reset in
tmio_mmc_host_probe() when calling tmio_mmc_reset() though host->reset().
If SDBUF is zero the data transfer will not work in PIO mode for RZ/G3S.

To fix this call again the renesas_sdhi_sdbuf_width(host, 16) in
renesas_sdhi_reset(). The call of renesas_sdhi_sdbuf_width() was not
removed from renesas_sdhi_clk_enable() as the host->reset() is optional.

Co-developed-by: Hien Huynh <hien.huynh.px@renesas.com>
Signed-off-by: Hien Huynh <hien.huynh.px@renesas.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- fixed typos in commit description
- limit the comment lines to 80 chars

 drivers/mmc/host/renesas_sdhi_core.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index f84f60139bcf..5233731a94c4 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -589,6 +589,12 @@ static void renesas_sdhi_reset(struct tmio_mmc_host *host, bool preserve)
 			sd_ctrl_write16(host, CTL_RESET_SD, 0x0001);
 			priv->needs_adjust_hs400 = false;
 			renesas_sdhi_set_clock(host, host->clk_cache);
+
+			/*
+			 * In case the controller works in PIO mode the SDBUF
+			 * needs to be set as its reset value is zero.
+			 */
+			renesas_sdhi_sdbuf_width(host, 16);
 		} else if (priv->scc_ctl) {
 			renesas_sdhi_scc_reset(host, priv);
 		}
-- 
2.39.2


