Return-Path: <linux-renesas-soc+bounces-1267-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6BD82295C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jan 2024 09:14:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 811991F23D05
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jan 2024 08:14:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9F2E18625;
	Wed,  3 Jan 2024 08:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="jQ1a+B7g"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44BF182A3
	for <linux-renesas-soc@vger.kernel.org>; Wed,  3 Jan 2024 08:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5537dd673e5so7943201a12.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 03 Jan 2024 00:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1704269649; x=1704874449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8NLeu4c+70FbWhZWyp8ofXWlavTVRvov3jDdAHZ2Sxs=;
        b=jQ1a+B7gSzyxbgQZV4hkvbp+uc0g0w7/5s9wqbWqviMZ26rr54LZTlo+F+vUKvLn1s
         iaqmfKgb9tEwiY70efPVEfIFSw19ULkM+WBBK+wt1cYe1TTNVuEHE7oTpP2nlleM2mnh
         H2rXjof+LB7LdYeLiTJZhcYbHaGyU7ZSsX9WlthcLPGJcIPJfrHc71sudt0Vl5gqIc9Y
         jyDvPMo3Hd2VHzN5IkSftL5reJyOzYV3zJOxhHKDkhH2BqwhG1SR1ldo6aBI0nNzQza6
         XG/ck1/CZfQf3kJ+vixVAK2oiW8ghl9Dn3XP5CDWh3RqkZks+ll2PTvhvGKGIoT24fq5
         y28w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704269649; x=1704874449;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8NLeu4c+70FbWhZWyp8ofXWlavTVRvov3jDdAHZ2Sxs=;
        b=TThIG45/Nl2AZA+8+hGtdtfyoW3av+LPxTfIMNNU8dC3eQeRd3hYCNF3AThmMEfKko
         BwAwAKto3SEHXkPHraUjTqEEEVJO+LExTr2Skl9FccxOisCeeviUHTrGvvkHspN6P/FQ
         FEvxIaxZTiXGw0wK+fkhBdA0r5buYcu9fJaVw26uap5B3gQ2CtpLPPPGsGDM+9Lxgc39
         ZaBHW9ipqsap22/LZj0BJVbNTDjnY1GfNoWxkMSWewfBzBUAva2eYeM91D7NuEshKrXd
         Y7sVLkKDfYMos5SEhh580hKfxmFParEybmHatYxE7P/2z890Yh5JN7kTmNXGmJ2593Mt
         pT7Q==
X-Gm-Message-State: AOJu0Yw2vlTjp3bK7K8RLiK7cNeFAw+9ZzJtaHPus0C2Vgpy+W+RHU0+
	iUSQTHCKEKta9TECpdkLkY3ChRWmdbw+SQ==
X-Google-Smtp-Source: AGHT+IHuAlW392LA3z/z6G4YmP9CE3iboyix6WpzpR0ACM4D7EzBb/QXme3cn51Zb/GHj2nwAhG4qA==
X-Received: by 2002:a05:6402:1617:b0:555:bb88:cba3 with SMTP id f23-20020a056402161700b00555bb88cba3mr4925911edv.27.1704269648765;
        Wed, 03 Jan 2024 00:14:08 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.5])
        by smtp.gmail.com with ESMTPSA id cn13-20020a0564020cad00b00554b089f1dcsm13104196edb.38.2024.01.03.00.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 00:14:08 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: s.shtylyov@omp.ru,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: mitsuhiro.kimura.kc@renesas.com,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 0/1] net: ravb: fixes for the ravb driver
Date: Wed,  3 Jan 2024 10:13:52 +0200
Message-Id: <20240103081353.4165445-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

Series adds one fix for the ravb driver to wait for the operating
mode to be applied by hardware before proceeding.

Thank you,
Claudiu Beznea

Change in v4:
- rephrase a paragraph from patch description
- added a comment in ravb_set_opmode()
- collected Rb tag

Changes in v3:
- s/csr_opmode/csr_ops in ravb_set_opmode()
- mask opmode with CCC_OPC when retrieveing csr_ops
- in ravb_set_opmode() updated modify mask passed to ravb_modify() to
  include GAC and CSEL bits if these are part of opmode
- s/failed to switch device to config mode/failed to switch device to
  requested mode/ in ravb_set_opmode()
- s/operation/operating in the title of patch 1/1

Changes in v2:
- dropped patch 2/2 from v1 ("net: ravb: Check that GTI loading request is
  done")
- kept a single "Fixes" entry in commit description
- updated commit description for patch 1/1
- introduce ravb_set_opmode() that does all the necessities for
  setting the operating mode (set DMA.CCC and wait for CSR.OPS) and call it
  where needed; this should comply with all the HW manuals requirements as
  different manual variants specify different modes need to be checked in
  CSR.OPS when setting DMA.CCC.

Claudiu Beznea (1):
  net: ravb: Wait for operating mode to be applied

 drivers/net/ethernet/renesas/ravb_main.c | 65 +++++++++++++++---------
 1 file changed, 42 insertions(+), 23 deletions(-)

-- 
2.39.2


