Return-Path: <linux-renesas-soc+bounces-2272-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D9AA3846B19
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Feb 2024 09:47:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 062AB1C236D1
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Feb 2024 08:47:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 379B55FF03;
	Fri,  2 Feb 2024 08:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="h54LWq1Y"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A300E78B5C
	for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Feb 2024 08:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706863345; cv=none; b=jb3Hmv1HAoiLmvXGYKT2XRy8H1v1IapFk4teIv3GUnp+h8TyblRnvQ8sw3NtozqpluAQy0g6wPAWSKBb/pnEpsw6scZi92rUWUXVFHC3grVjGcQmY5ziP/6VbtV/9NfZMGMEYL4jtwyXQtv1MQFEXID9ZDsU0DO5MK+LOr9Nqiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706863345; c=relaxed/simple;
	bh=WOBBQ89xE5VEPTNb63Hpn2LLLh1odlsZA/CvNjQEU8M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dkWtXbiVMHcsbWRXPIvS48CiQBe+BkJcKwjY22PITPJenEnWRhi/Oxz50+VMKuo5YQzmCUCFFWMojdAiu+dZyo0eVQBUoZBVuHMr3s6Qu2zx3G/OVUwaDk61vLDbVBDvCLMoKphXI0PAdIO2tYU+zMg4VRylivJcl7heuEE9xwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=h54LWq1Y; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a293f2280c7so250142266b.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 02 Feb 2024 00:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1706863342; x=1707468142; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zuBURh/xdc4/Pg+TNsZUpUsKplsL66NpMwBIUlAaHiE=;
        b=h54LWq1YArTK7kw5rKaoCF2jahx11xfO0UL6SbbUp05Xba+KoDsxoa7iVPCpBKxlqk
         5tSxjH35vz6UMGojIg8wyWKL2xj+hRjUW4X4n+n3U65SNXECkIvIwSlEUfsaT9uUbHAw
         yOMs43hUtIW/O1YXzHJd/3ChHvG0Hld6RucM7fUqLooxYk4w2/qmaGQWSXQev2LtPVXh
         JceQ9PG9MUrmx3qYPZaOGjEtLvEZTiy/kM78PzirdjgUsGqj/TPO5USoijMh8PL/NfjW
         k4qmhYPUv3WYR0ISk5hhcpXtbkwlfRKFdYcNWTecjxIYuU0Ph5KfxrwWQRqow1jLzHpk
         UCVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706863342; x=1707468142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zuBURh/xdc4/Pg+TNsZUpUsKplsL66NpMwBIUlAaHiE=;
        b=mUjC5HSRR5TQz1lQDkO97Z7tSd4017SEQV8/quOZQmTglK663e0TlmBK/4PpxchlAU
         CrfhEY4h7f+X1AMKmgq4fyW++o6EuhotOajAi8sYD8UlqPlNJ4Adfuo3nMCBxpXtaaeB
         Hv9NYCJ29dBr9dbCqwyVrWLdHsucZZP96rxdqkoCyDokYdU8BHTCbO1dlg6qKaSO9SQS
         3SqYN4bB/m0aDxcGrQFZkterhZS5IRUjy7D3XFAo83wcnTx913t/vXFRuzMxYIRy1PIq
         bW5vYRlvtBulYiUWAQx/gdUInFqc0GFTRl47GSy2zBRx1uCenqxmSKSCwL4OZ4oe2lTf
         0yTQ==
X-Gm-Message-State: AOJu0YyTByIW7w64xNVwuLaeCCWvjLqqvHTiqL6BjWh5l2imUI+02lPn
	LRzY/kFtoc3K2aRqEuweDuT6Dmgx4AoeQBHkN2Hjfc5WLAPhZSAwob3iDUML5/k=
X-Google-Smtp-Source: AGHT+IHYVj5RKvUT2QGhcm3+Un4FLYJ34y6vVsJHsb2L8R+8m5OIyvAcHcCyDabaYHUq2sAG+7K9jA==
X-Received: by 2002:a17:906:d14b:b0:a36:7189:af7f with SMTP id br11-20020a170906d14b00b00a367189af7fmr5658629ejb.50.1706863341961;
        Fri, 02 Feb 2024 00:42:21 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWxnLjE+Dj86SK0a5P/j1S1/oNiaOMssHUrYUW/HT81rC43H2dNa34RVu+9sUfkkoOLCaw/tuSDwIME4TnPypq5bmvyhrl7qour3gkZgf/96SNvxrZJdeThDFkcVJxk9WUDKg2fiaqiqtyjh8+uGmcoAvvCDIbQd3XeD2mP8Xah23kVtxnO2fNVGtj155AN0AZ2I7QHiUXyDYUlGZZ03ZRo9W7wuc4xAkcjbQnuni2JkU9+9S4JHePSaevj8/QmgQNjh0P3wPXq8D3jTqSXewHMTAWWhkh2TiOCBIP7xQGpkJi70QUnG2ssBYyCYd715W/2TZzmMNUTgPSEcQ+TZj7ewLv6AMwkvVGdHbQtKA6XV/5zySC22Q4Tn6rTOLiUAJJQpTz3jz1NyWyi3g==
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.87])
        by smtp.gmail.com with ESMTPSA id oz35-20020a1709077da300b00a361c1375absm631642ejc.133.2024.02.02.00.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 00:42:20 -0800 (PST)
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
Subject: [PATCH net-next v6 14/15] net: ravb: Simplify ravb_suspend()
Date: Fri,  2 Feb 2024 10:41:35 +0200
Message-Id: <20240202084136.3426492-15-claudiu.beznea.uj@bp.renesas.com>
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

As ravb_close() contains now the call to ravb_ptp_stop() for both ccc_gac
and gPTP aware platforms, there is no need to keep the separate call in
ravb_suspend(). Instead, move it to ravb_wol_setup(). In this way the
resulting code is cleaner.

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
- fixed typos in patch description
- collected tags

Changes in v2:
- none; this patch is new


 drivers/net/ethernet/renesas/ravb_main.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 0dab98ea615a..661236affa5b 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -2929,6 +2929,9 @@ static int ravb_wol_setup(struct net_device *ndev)
 	/* Enable MagicPacket */
 	ravb_modify(ndev, ECMR, ECMR_MPDE, ECMR_MPDE);
 
+	if (priv->info->ccc_gac)
+		ravb_ptp_stop(ndev);
+
 	return enable_irq_wake(priv->emac_irq);
 }
 
@@ -2961,14 +2964,10 @@ static int ravb_suspend(struct device *dev)
 	netif_device_detach(ndev);
 
 	if (priv->wol_enabled)
-		ret = ravb_wol_setup(ndev);
-	else
-		ret = ravb_close(ndev);
+		return ravb_wol_setup(ndev);
 
-	if (priv->info->ccc_gac)
-		ravb_ptp_stop(ndev);
-
-	if (priv->wol_enabled)
+	ret = ravb_close(ndev);
+	if (ret)
 		return ret;
 
 reset_assert:
-- 
2.39.2


