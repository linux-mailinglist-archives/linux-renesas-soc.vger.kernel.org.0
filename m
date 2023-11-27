Return-Path: <linux-renesas-soc+bounces-263-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A30C57F9C43
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Nov 2023 10:04:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4439B280EF9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Nov 2023 09:04:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D2EF134BF;
	Mon, 27 Nov 2023 09:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="iZsU6h/H"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 569F212D
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Nov 2023 01:04:42 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-9fd0059a967so962898466b.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Nov 2023 01:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1701075881; x=1701680681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rn3FqN0gmZL0Ari6o42HZwHfSuSPYS/sbuJSeG1c90A=;
        b=iZsU6h/HsVq3YS2w4Nj4fMq137jbfL1HGWcW7eD+HSMg6KGqUGF7+p4FROQSJVE7Ui
         p9bhJ/c9gTwZuRcTx2J5A5bU6+cZguvvK2YjYnQO9vufsbsg8rpc9Jtla3wVlCLuNBpW
         NM8rcK6Yp9h19/SkTk1Em/51RW733LoG5CTMd9ssFlAK7f8vI+1Y7ZDSOO7zIl/WnNYk
         nGbKvAnCDrKG11Y5nZqClFz3KpyGxMY2cJ9slB5YKWsLdhSR3VrYy4ilX/+yC6HtKfax
         DFrhVcszV2ICPejkiZAq87DGCjPBX+bi+/bo1OA46DN6PHtfxm5Q2oJZS0n++lzU7zuV
         guNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701075881; x=1701680681;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rn3FqN0gmZL0Ari6o42HZwHfSuSPYS/sbuJSeG1c90A=;
        b=UeD+uMZeLBJ9UXDJRh4aTTqB/QDR5U1QvzzkusWcoE5aSEg2JdYtmgCwjPIEjfs+Iy
         EQcv0vIEeSku+taOUITJJ0KWpwztO/OxR/YPTg8nR55sqDhkwpfwAQwxNkjQbCI9M+Sn
         VsuKFSagu7vOprceKH60Rrr0l6tNhwrPlymE2qVXPYE5O1fIdCXLGMEciFyxHhYZ/Ks1
         i59AeZJ0w9qcH4WY1dViFm2y6x0bc1EI1vj7i+7BFX9Y1OJxJMup/S1O3S8EDTycBbD6
         pViN7o4panKx/ejI6ctk2h5H1Rq8GGP6iN4njWhj3gVw6yRiNP8p/MhfixVDsSiMAt4h
         92qA==
X-Gm-Message-State: AOJu0YyEiFap3HjKSPShJu70OK1yKb6SQZSenksNDe8bW3kls+gCTtmH
	4qMqJRzsASRu9PhJQgBnZPjsLg==
X-Google-Smtp-Source: AGHT+IFufwrQhoJGAA86CiHpYk2HWGHa6HKsgjsjfk1ABg3nn/EADfsaGSESbFlko4QIO5GKSmIpWA==
X-Received: by 2002:a17:906:49:b0:a0d:fcfb:aa33 with SMTP id 9-20020a170906004900b00a0dfcfbaa33mr3221731ejg.9.1701075880653;
        Mon, 27 Nov 2023 01:04:40 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.125])
        by smtp.gmail.com with ESMTPSA id ay14-20020a170906d28e00b009fad1dfe472sm5456539ejb.153.2023.11.27.01.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 01:04:40 -0800 (PST)
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
Subject: [PATCH 0/6] net: ravb: Fixes for the ravb driver
Date: Mon, 27 Nov 2023 11:04:20 +0200
Message-Id: <20231127090426.3761729-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

This series adds some fixes for ravb driver. Patches in this series
were initilly part of series at [1].

Changes since [1]:
- addressed review comments
- added patch 6/6

[1] https://lore.kernel.org/all/20231120084606.4083194-1-claudiu.beznea.uj@bp.renesas.com/

Claudiu Beznea (6):
  net: ravb: Check return value of reset_control_deassert()
  net: ravb: Use pm_runtime_resume_and_get()
  net: ravb: Make write access to CXR35 first before accessing other
    EMAC registers
  net: ravb: Start TX queues after HW initialization succeeded
  net: ravb: Stop DMA in case of failures on ravb_open()
  net: ravb: Keep reverse order of operations in ravb_remove()

 drivers/net/ethernet/renesas/ravb_main.c | 58 ++++++++++++++----------
 1 file changed, 35 insertions(+), 23 deletions(-)

-- 
2.39.2


