Return-Path: <linux-renesas-soc+bounces-2263-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7560E846AFB
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Feb 2024 09:43:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC0BC1F24993
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Feb 2024 08:43:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBDCC612D4;
	Fri,  2 Feb 2024 08:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="LDAwv0yP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71A75FDB3
	for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Feb 2024 08:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706863322; cv=none; b=KSfBiDu74tzAKY4sdR3DT4YiU7CWduirhVs8slqobG7idEc3Ckoay1jV6H3D7OPpHWOpa/Sgnps+IiZ7cs+jemBpmq/pRi6YusDxryVK7PHFRJ1LhBGKtDFzLAkKuKAg1/WnkfpFzGyGTsMkf+yDW3MGqNxiTeu7Hc6zm0SsZw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706863322; c=relaxed/simple;
	bh=ONbLpDUQ0pxclPSJgUwLbET51iczHAS/yqhLYj7/j1w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CYXQyxEByKQHzGV1YPdh6WNPFVjDYpv7fTOEHGxcO+FaJSWbvK81jzYRlwhVSbx4JYrsWGwibm5/FsFFP1eAYl7Dv66/uML4OiNRBkmxSIZ0+jaeZT2eDVt84S5m+kduTQUKw6aedc7LhSVUZQbhC1CmmQvg/KPYBqM6qwEF/r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=LDAwv0yP; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a293f2280c7so250085666b.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 02 Feb 2024 00:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1706863319; x=1707468119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YI71IkOMT1SgNH06umqK9lD2YJ8x0EnJE4QH08tMLVg=;
        b=LDAwv0yPllK8bov9hAZ+TFwuH9APeDr0TnYLkT1pgRhcPQEilHS4KD3SgoVGNFQIsQ
         DkOmEe9ow8vi2+DH2v962Xock94UfXSypbDrM+QFdFUVC4QoIvr3dac698/wFmHifW10
         jFK6SkUw15NCDGkJ5c1pF9Cb/CAMadkMNajel5PP4lAKVUb+saMZZm/WDyZYnczJAXFG
         Q00vO2qbDWFsDby9A0TG5m+Xn4c3gER/1mGkIjJjpRFU/bZ54nzcfaZQoz+JAMP+RgN9
         kJCoVYh/qYcpDT9snQm0cDGFlDLvhFEUMOrYwBFdEuApTflz+bSUaUfiUzCC0EMfKP8z
         A6ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706863319; x=1707468119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YI71IkOMT1SgNH06umqK9lD2YJ8x0EnJE4QH08tMLVg=;
        b=aVSqOz+2OOYj9S/AmFEGourQoITigzgKpsyNATBska0kI8GpKqkNrPk81nHYX3bCSn
         yZoy0I8BxAKFAFtPJzzHxkhHdMRcEUtz1F3vzcw240P+QfnvpGa6EtjkXz+yBJ0ETvYj
         Q3nAfXReae6HvEtnc2g3x10iW4ocEZnau0hg/1Kvlj2pgfNoEIpFmOsicyyqUgeIqZbL
         cZTItYv2+8xym0hPGl2PVKlFQDRbm0+Y8TH4oKvP+dajKYLxFbNGTSc/puKpOjw6Jj1u
         jcXk4Q3Te3/4QEXSOxziBVu5Znf2i1sN44cF+/HAhUhbOREsCG3hra68FextQX+qo+Fi
         H4kA==
X-Gm-Message-State: AOJu0YxPz/gC0FEJbB6bIwi27PEbYDn6u1Sf+g0IkWksTq8WVSXHuj5F
	vKVXsnAuqabu6/v0d7Zllm4lFOXpMlUgWV2rt0DjzVeL8QKbAUE9FukjrcM+ldI=
X-Google-Smtp-Source: AGHT+IGwAEtd98gv9Uj3CwlkaCRSQFY2aondW9bQppJ81yZfClAIps1aFV/4117XUjsxgw6V+YnbgQ==
X-Received: by 2002:a17:906:b803:b0:a31:8e54:14db with SMTP id dv3-20020a170906b80300b00a318e5414dbmr5796744ejb.55.1706863319184;
        Fri, 02 Feb 2024 00:41:59 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVycCJlmHxnoNErdRh/32hZodjiOrpxpOduG/5PQsHgwIF3io97/09VHxS0p38RtyN9ytVaKVPKLKhYWtB+BPmng5GPQoPG5I6GQcfbx1Y+rzz3MK1GqSN+LhmIjWmu4UbH1hjk5D5gjR/KlXHYcevuFzle8pgiTOaQMw0h5v6ICLIdZmRJl2HdQ7YGXMnGVWPWaPU3odIV4HY5t2GFJT5ezhCnpkw4STnO7C30QJOGz6EiJESR1e436seEfaOxe89+XI8CuJ+HErvhuZbg8R1qsa4Yzndc4PoW/243f3mcDCx8pCjkC3T6P8GarwvM75KzSEbvdgd4/64MtXfjmtZr3bSNDGw5IznO/q/YBm76LpTg8z3ddmwJtQEVKTtlRqzJt05EM/ASz0ZSvw==
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.87])
        by smtp.gmail.com with ESMTPSA id oz35-20020a1709077da300b00a361c1375absm631642ejc.133.2024.02.02.00.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 00:41:57 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: s.shtylyov@omp.ru,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	richardcochran@gmail.com,
	p.zabel@pengutronix.de
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH net-next v6 05/15] net: ravb: Use tabs instead of spaces
Date: Fri,  2 Feb 2024 10:41:26 +0200
Message-Id: <20240202084136.3426492-6-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240202084136.3426492-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240202084136.3426492-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Use tabs instead of spaces in the ravb_set_rate_gbeth() function.
This aligns with the coding style requirements.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
---

Changes in v6:
- re-arranged the tags as my b4 am/shazam placed the Rb tags
  before author's Sob tag

Changes in v5:
- none

Changes in v4:
- none

Changes in v3:
- none

Changes in v2:
- collected tags

 drivers/net/ethernet/renesas/ravb_main.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 7ced5db04f75..c05d4a2664eb 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -96,13 +96,13 @@ static void ravb_set_rate_gbeth(struct net_device *ndev)
 	struct ravb_private *priv = netdev_priv(ndev);
 
 	switch (priv->speed) {
-	case 10:                /* 10BASE */
+	case 10:		/* 10BASE */
 		ravb_write(ndev, GBETH_GECMR_SPEED_10, GECMR);
 		break;
-	case 100:               /* 100BASE */
+	case 100:		/* 100BASE */
 		ravb_write(ndev, GBETH_GECMR_SPEED_100, GECMR);
 		break;
-	case 1000:              /* 1000BASE */
+	case 1000:		/* 1000BASE */
 		ravb_write(ndev, GBETH_GECMR_SPEED_1000, GECMR);
 		break;
 	}
-- 
2.39.2


