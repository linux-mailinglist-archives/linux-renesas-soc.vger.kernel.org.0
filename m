Return-Path: <linux-renesas-soc+bounces-268-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5496B7F9C51
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Nov 2023 10:05:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 005F42811F0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Nov 2023 09:05:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C69F168B9;
	Mon, 27 Nov 2023 09:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="mK2+XRTf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E342C1AE
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Nov 2023 01:04:49 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-544455a4b56so5211692a12.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Nov 2023 01:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1701075888; x=1701680688; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mlwN1qAsHWca5scAvNLuwE5lxsRTiu67SGgg4R0r8Q0=;
        b=mK2+XRTfjLkVysJyfdFGzgvus2pb0IBOCv6sWeT19Po0xmWmXeF1fnURbwfgrXTZoh
         mXUzckH4CPLdA0SPT3d33BmXpCTqPx9tEeE4V3hKbwncMAmSCzd5N7dackSvibWFhtBU
         777w/QINmqmeNPb0gMNzogDgRQjo3sxsyO0t8jic6+uJquqkoiy+eYw5MkEC/V3NO0fE
         S1PFx7PVKkA9FRhyof+DNq38cie0OWM1J7Iej1lxVWIBephtRBsUJebF+99rBkzDtCMh
         X8O/Nlib/4jFfj18+lHStyX2BDPEF14M6Zqaxh1LvA/8Icm2yUR0d+EFLahRGIidh9EF
         B/Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701075888; x=1701680688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mlwN1qAsHWca5scAvNLuwE5lxsRTiu67SGgg4R0r8Q0=;
        b=apqkGE497449G9j+DaSroQW59GOFbIJETAkPGPJN3UtF8RFze7Spd8k7r5xDny5P0F
         3+1HuDnYmBfabxQpaU8O2VmbPurchEPhpq4AxF+VORg5R4ddiuSUMcBQOfr4Xd/Z77P6
         gaPLiD4b2Zs6VM8Ch9C2ZCAt9r+nnFU99++TsVzevCtnN9rHzlShCKNbitPdyeb8prJg
         cPMqmOweHhL/uV87nQaxBWfedbL3gL2k9qfxv5G0czxeACcnktZ2gpPh8O+5S7HDf42i
         TJ+gKUsyU1pgcRE5BLQeGnMTdRaEzMy+dTDF+GmVAuovvYdViGT4fbsfS8R5MXN4VHX8
         OffA==
X-Gm-Message-State: AOJu0YwusCXwhZRbFFpzINMGIjPwyXXx8U9cY9elZO0p81xO3BCQfoxx
	HRyZs6FvukNb2AZ8S3KzogFpiQ==
X-Google-Smtp-Source: AGHT+IHDt74vApXNuokupSF97i72AROOdDfRVSFnhGnDr0hpPadcCYRP9B7Fma+bCxtiohowOhGS1Q==
X-Received: by 2002:a17:906:5817:b0:a00:aa23:34d0 with SMTP id m23-20020a170906581700b00a00aa2334d0mr7398772ejq.68.1701075888425;
        Mon, 27 Nov 2023 01:04:48 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.125])
        by smtp.gmail.com with ESMTPSA id ay14-20020a170906d28e00b009fad1dfe472sm5456539ejb.153.2023.11.27.01.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 01:04:48 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: s.shtylyov@omp.ru,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	richardcochran@gmail.com,
	p.zabel@pengutronix.de,
	yoshihiro.shimoda.uh@renesas.com,
	geert+renesas@glider.be,
	wsa+renesas@sang-engineering.com,
	robh@kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	mitsuhiro.kimura.kc@renesas.com,
	masaru.nagai.vx@renesas.com
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 5/6] net: ravb: Stop DMA in case of failures on ravb_open()
Date: Mon, 27 Nov 2023 11:04:25 +0200
Message-Id: <20231127090426.3761729-6-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231127090426.3761729-1-claudiu.beznea.uj@bp.renesas.com>
References: <20231127090426.3761729-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

In case ravb_phy_start() returns with error the settings applied in
ravb_dmac_init() are not reverted (e.g. config mode). For this call
ravb_stop_dma() on failure path of ravb_open().

Fixes: a0d2f20650e8 ("Renesas Ethernet AVB PTP clock driver")
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
---

Changes since [1]:
- s/ravb_dma_init/ravb_dmac_init in commit description
- collected Rb tag

[1] https://lore.kernel.org/all/20231120084606.4083194-1-claudiu.beznea.uj@bp.renesas.com/

 drivers/net/ethernet/renesas/ravb_main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index f7e62e6c9df9..805720166ef3 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -1825,6 +1825,7 @@ static int ravb_open(struct net_device *ndev)
 	/* Stop PTP Clock driver */
 	if (info->gptp)
 		ravb_ptp_stop(ndev);
+	ravb_stop_dma(ndev);
 out_free_irq_mgmta:
 	if (!info->multi_irqs)
 		goto out_free_irq;
-- 
2.39.2


