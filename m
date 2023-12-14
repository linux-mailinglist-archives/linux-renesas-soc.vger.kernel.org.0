Return-Path: <linux-renesas-soc+bounces-1039-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7621D812EA7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Dec 2023 12:35:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C79C1C21541
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Dec 2023 11:35:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D35B405EA;
	Thu, 14 Dec 2023 11:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="XlBkhy2X"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DF2211A
	for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Dec 2023 03:35:23 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-55114c073b8so6172981a12.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Dec 2023 03:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1702553721; x=1703158521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jKjeAY34llcGOWUq2lKYylvmKvhjwRpxdh2PzgtUzQM=;
        b=XlBkhy2XpWw9PEY6gUXcvcKOS9DJWtbpAMhBhU++2Y0Vter51xEydZEZwK/AMP09sj
         VdHjisE8wFD3q/UbyArxhR9/QojwJju5Q+hHj+g7SlUBiFUhUOb5c0tGFEyrXlN3hb5O
         n3iIeGWN/7VoDIk0E4hCqNO0AlT9LrEs7j+ILM31SqRYsx2ltVkFPdQbzX3SxFlFssXQ
         h0hfUGo8n5Y9N/xGcd1XZp3HFvE7QVHftcjiLF4f5muXccPWBqpO1IBn34r3DwjTehNE
         0a2dR8kxCN79/e0LzF5PWtKoCHH3hb/TlErmqGLj13aRDcvASBG9Mtbu92xupkYvxIe5
         U4qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702553721; x=1703158521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jKjeAY34llcGOWUq2lKYylvmKvhjwRpxdh2PzgtUzQM=;
        b=WTqI9wSeV2VtbUtc8gUtLkS+31KlFguSf4BdB1mPmecAF+MNHJaxtoSsShBC9vLZ7E
         /HhSVDIcYne4BRKdPGmYe6uuz3qAbvoMpvDfbeLJPnBVnkNnW/L1FjkMhpx1uu3cGmFu
         VUrRbrXZapqPD1d15/qeA9OxqwIPhdoigHmyOba1N/FuXEJHk7h6XzRr5Ws3gHvFtYtW
         kDIxiMDXbTfBYrhKJvAzwpeQZd+97kf++IUnkwSugRY0Q7PcKRRHfWPGB7SNwy5kNgms
         IGRrvfkNEcULOir0OQVjMVW/r2ELskEfzdNidQSvkia4MHYPV1GSv6dc2igsYeNZG6mn
         Z5xw==
X-Gm-Message-State: AOJu0YyrFBEiEwAjIEmDZg+a11lIPYXeVAssJsRiYMEdEKHF/CPMn6jS
	kxEMQojpLrQNUdUCdAG6f08gTA==
X-Google-Smtp-Source: AGHT+IHVKCNMY9YBEDCrCTyqOqL3DNWn2qqH3wXx2mquhgdz/j50tlo3i1QCOR6Gnh2H4SupB1aloA==
X-Received: by 2002:a17:907:2da1:b0:a0d:39c6:1f67 with SMTP id gt33-20020a1709072da100b00a0d39c61f67mr3996296ejc.76.1702553721371;
        Thu, 14 Dec 2023 03:35:21 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.103])
        by smtp.gmail.com with ESMTPSA id vx12-20020a170907a78c00b00a1ddb5a2f7esm9290656ejc.60.2023.12.14.03.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 03:35:21 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: s.shtylyov@omp.ru,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	claudiu.beznea.uj@bp.renesas.com,
	yoshihiro.shimoda.uh@renesas.com,
	wsa+renesas@sang-engineering.com,
	niklas.soderlund+renesas@ragnatech.se,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	mitsuhiro.kimura.kc@renesas.com,
	geert+renesas@glider.be
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net 2/2] net: ravb: Check that GTI loading request is done
Date: Thu, 14 Dec 2023 13:31:37 +0200
Message-Id: <20231214113137.2450292-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231214113137.2450292-1-claudiu.beznea.uj@bp.renesas.com>
References: <20231214113137.2450292-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hardware manual specifies the following for GCCR.LTI bit:
0: Setting completed
1: When written: Issue a configuration request.
When read: Completion of settings is pending

Thus, check the completion status when setting 1 to GCCR.LTI.

Fixes: 7e09a052dc4e ("ravb: Exclude gPTP feature support for RZ/G2L")
Fixes: 568b3ce7a8ef ("ravb: factor out register bit twiddling code")
Fixes: 0184165b2f42 ("ravb: add sleep PM suspend/resume support")
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/net/ethernet/renesas/ravb_main.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index ce95eb5af354..1c253403a297 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -2819,6 +2819,10 @@ static int ravb_probe(struct platform_device *pdev)
 
 		/* Request GTI loading */
 		ravb_modify(ndev, GCCR, GCCR_LTI, GCCR_LTI);
+		/* Check completion status. */
+		error = ravb_wait(ndev, GCCR, GCCR_LTI, 0);
+		if (error)
+			goto out_disable_refclk;
 	}
 
 	if (info->internal_delay) {
@@ -3041,6 +3045,10 @@ static int __maybe_unused ravb_resume(struct device *dev)
 
 		/* Request GTI loading */
 		ravb_modify(ndev, GCCR, GCCR_LTI, GCCR_LTI);
+		/* Check completion status. */
+		ret = ravb_wait(ndev, GCCR, GCCR_LTI, 0);
+		if (ret)
+			return ret;
 	}
 
 	if (info->internal_delay)
-- 
2.39.2


