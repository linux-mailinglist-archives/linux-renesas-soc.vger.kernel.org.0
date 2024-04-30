Return-Path: <linux-renesas-soc+bounces-4951-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 72ECA8B6EA3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Apr 2024 11:40:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A5014B246A4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Apr 2024 09:40:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA07C1292F3;
	Tue, 30 Apr 2024 09:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Y47kbsDL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3807128833
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Apr 2024 09:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714469852; cv=none; b=U+iWeUjM27mB5eBmU6G4R9xpIFsklBpJSc2DQb3vqXk6wr3okFTHLv0tzPoFeIAB/F4E5h2bo+gBuqMJJPq4ADQEiZbapCb0fn1jxfb61ELwqaXHH3EUP/vTvbuSIdywcRkG5IMJJKNF/IxxjQGsLJNboFEzJ0McrNMvHuofKFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714469852; c=relaxed/simple;
	bh=uhKdkmK31MXKrfFbEk2DLsbTDwgGQVf30ZHxv26DDAM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Bkb5S5jEy0ku8+3MZPKgbX1LEx4KgGv8lEkUhh16ROgiG+yzmup14qt2d4VYtYalpmjgkNFInkDosv02mGEPjcGAlWY05DfiRs1FDfsrvI/QBwWId93drdttPoa5/N0GTLs0Yuq4EY5f0yVP11uUz2S180faOdMtgTTKVuaPWOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Y47kbsDL; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-571ba432477so5797924a12.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Apr 2024 02:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1714469848; x=1715074648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3StYaHb+jugcbYETWpU1s1DMvudTBsQ5hJ3Pe6RKnEM=;
        b=Y47kbsDLY60xGN0JqDz/swP/KZyZbEv3Eu7eweo7KQTjPYRybZ44zPeoIuFdQ1t0C8
         7ixcexpVZSUixS/4grmk0EA433PAV1+cPBgKppdR3yYtfoKrZx6C35JnP/mbuvzP6+tV
         /eia6X5zAdAc3Z06XgYiyC0gLOVZsrT6d6L6zafI08pvJQKOU7MCIpum3uDz5xvEn/QT
         oGklWH9dFRZcDkE4bxhXtI1uRpHctVc+gAojjt3fPcG2tvCINQy/cnKWYwGcksY96HGh
         6psM9TT2EYSqIfjej8HkjTteYTMLODuDD4XkmL0blClAj6tUobXRkWLnSuT5XoCNURmI
         O6uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714469848; x=1715074648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3StYaHb+jugcbYETWpU1s1DMvudTBsQ5hJ3Pe6RKnEM=;
        b=PIVunZN5sGeW4jGp0I+nKQ6Moc5BTehHlhsPAauG2wf8oq50NLkYWnw8t8gYIfdbmQ
         KutHqAnZJzMpHCZpLiwmgUw3rXuEYnlrcP8rQzbwigPJjlORSSgoV9B2kcgp5sufqg0u
         hf7j+owxzuvwyQhiQaMLv+w9CQMeJQqsNFYMcCFWkTqk8ry8O7r929pjF0ZlNzR4OG7G
         wiTBMoErLOGNEEnjCtA9izsdsXO8J9k7n0PT+cDfECK1bA4o9aCEXj9fkva9foL9fkgW
         zqFNrHWTQ0eGjD8SCl8B4zSzKwIcVXGjE9kBiPBO1pZgIBJLYO9/vDQfOIwJISlKL5yY
         O18w==
X-Forwarded-Encrypted: i=1; AJvYcCU2cN3Jqwph0B9YifBI0wSDLn0i5zdqwS93/vCPIcOUZ0Y7EQ/Qi8t85p4CONfXy/wkfQGs+wPj8vfx54DGXrMJaT1BJnB7egtXDB0o4i4FJCU=
X-Gm-Message-State: AOJu0Yz5AZ5ICbP1jzmW7cnJo53sqPEBxukIn1aKHjzFLGjxQC/Lq8gU
	SE1m5SWAcbVmANyeYSk4O4G9zYe1VBojCBDsHwdoq+sUM1cTivk3AjjefUx8KqA=
X-Google-Smtp-Source: AGHT+IF791IVTgQYCkDZyT5QfKzOiH/FUM1qkzc17ar1STLr7dQzsY+zNJl2I4gZet00wmrxDzyerQ==
X-Received: by 2002:a50:a456:0:b0:571:d380:95fd with SMTP id v22-20020a50a456000000b00571d38095fdmr1506622edb.28.1714469847790;
        Tue, 30 Apr 2024 02:37:27 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.53])
        by smtp.gmail.com with ESMTPSA id cq6-20020a056402220600b005723fe809f0sm5490448edb.80.2024.04.30.02.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 02:37:27 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: wsa+renesas@sang-engineering.com,
	ulf.hansson@linaro.org
Cc: linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Hien Huynh <hien.huynh.px@renesas.com>
Subject: [PATCH v3] mmc: renesas_sdhi: Set the SDBUF after reset
Date: Tue, 30 Apr 2024 12:37:24 +0300
Message-Id: <20240430093724.2692232-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

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

Changes in v3:
- shortened the comment introduced in renesas_sdhi_reset()

Changes in v2:
- fixed typos in commit description
- limit the comment lines to 80 chars

 drivers/mmc/host/renesas_sdhi_core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index f84f60139bcf..d9503f9f6e96 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -589,6 +589,9 @@ static void renesas_sdhi_reset(struct tmio_mmc_host *host, bool preserve)
 			sd_ctrl_write16(host, CTL_RESET_SD, 0x0001);
 			priv->needs_adjust_hs400 = false;
 			renesas_sdhi_set_clock(host, host->clk_cache);
+
+			/* Ensure default value for this driver. */
+			renesas_sdhi_sdbuf_width(host, 16);
 		} else if (priv->scc_ctl) {
 			renesas_sdhi_scc_reset(host, priv);
 		}
-- 
2.39.2


