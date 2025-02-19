Return-Path: <linux-renesas-soc+bounces-13372-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 471DBA3C4A0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Feb 2025 17:14:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9CC39189D494
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Feb 2025 16:13:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E8601FECAC;
	Wed, 19 Feb 2025 16:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Gf0T/rmG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048481FDE03
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Feb 2025 16:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739981569; cv=none; b=nyYzJEzbxWb3n0sODwY5lODD/lnY2kz/5/4ChnFYqFW35Yc/Yvl1P1TOoqfYv2R63Scley13uecvAZYKx0QTexJdJB2wlteNG/TVK11Bol81QS5dGrkBcrTiorZaDo6H6AQ2rSxEo2QsPwYsLut6fC3JylQKKo4cZrr7VpJr/EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739981569; c=relaxed/simple;
	bh=ocze8YqnRMaWZsMl7gofFidYX1Ww5q1qO93+l3/0JDY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k5aAUQS2RdS6VIJ5bSow+kOUfjmPVrlrl55gUERakr8LtTKfYBuyOOKaYgoCkJHPi50NRjLD0J47RIuZld/5WahH3DQitJ/azXcbvh3PrrtJvPioj51JhAQjHDs1zHENhhzw9iMS9eyZf03h7YJtKnnNjkAY8MOYRiVZqzyDywU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Gf0T/rmG; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5dedae49c63so3091639a12.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Feb 2025 08:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1739981565; x=1740586365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G9x4mlOjAiy9oa9aITlEsW4n3OXG4Pm6mlTbu2Zgyrw=;
        b=Gf0T/rmG5zo9EJO0MsPcMDlvUNVJIp7er8PS+YlAS9prxMIcZ283F87fscWXGayGVS
         VNMBkXOSrqViMScZAUkYY4Y9Vg+uG5ua+fefwtx1Ag15gsAGtcKYXi+UUrHM+iNGGQT9
         36gshRLUcQ+bVfTgxEpFbhbhCQJmCxf48dJMfUqEDsw9ZAdHxTh557Fla8QnFNf/5hos
         51sQwEft2RuXGXfIl1u4oYyAjv/K9To0vyL/hvJ/qgHWOmkTdbIBshMxSAcbcpJku49p
         TigllHdYFxjYLCB9vfo1HCG2Eru8wsCuO3Vb4v0/LKc0aeFbZoZyu1qllb4SwDZxoMhp
         ZoFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739981565; x=1740586365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G9x4mlOjAiy9oa9aITlEsW4n3OXG4Pm6mlTbu2Zgyrw=;
        b=Ss7ha6M6LEDNiatOpkHJUXC3c6IMgmGiXWz0p7Tce4C/kDBpuHlFQ8qkfyY4B/tTxi
         DVUSyFPY+gsK8sCUKLyqgyhv/iG6KMDAg19/5IAcPb/EREQ8KAHaU8odLNabt32Tbw6X
         QMVXBWQxlYXb4YZf76pFneDrDWIahrgyxfoYlBpP4hookeRjh/7vQfurXWv1sea7sxhk
         2dLASgfdo8B2u1GbPicWijPN1ELhS3zAXQ8sxD9OAydZrZiWjD0uqhRhccZVuY9nISjr
         muZA8sF8Rcyo0yx+K+ahil50sU99ZX9nkIz/o5dVZALjnXf2MZz0I3wUkqSDSGTXnEWD
         gsiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHr+J3R72ygLA8hOaby34AxSdntUlArMJewCXEeSwLm9idl59atN6SOwsWCjF4k9IUblia4BDbEaJP6ANZtN6BsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIVIGWtO2zcbTNSIgHFyfRmEieHC7nWTnSmiQxVMfh0FCBcsz7
	4UBAE1DkRKqcqIoVWcKplJ08VCSoZ2DrXmW20AwHal3T0U70fvIuhSvdMW7G3LA=
X-Gm-Gg: ASbGnct/tM3CWU2KgmFIeR8NnzR4DXT3Htu7e3odGwgLRG1nMz7YbnWvm0SqsUK/QLQ
	khQuJzayipJfS0+AIXYpvdlzuF0XndiDJAIOjE559jYACNpjFv8eShWlXX150Hbon7EDeJSR9KT
	D6w4zYJUd1TpySHYZOenCkFPhx3S9XMGTRBdDS0/EiTJq4urbl57FloJkQwE79xDgVCR4ajf/tz
	fE+PlsO0CI1X2R2RuIaymP/MbgfytFASaSA5aMUWuWrkQ/ZsVb0aUxkU1UAWqXtm7RcjSTLn7Ij
	al4hNnXsSsi8IgqPmRrDyheWJtHCAVyYQLDfcpqzg1yn
X-Google-Smtp-Source: AGHT+IHvs3OSrAg6bwYOEo9sxXJTxipss8uEVegwbkp3y3giamb686DwVqQEfGye9BT5zFj7d6ma9w==
X-Received: by 2002:a05:6402:a001:b0:5e0:4408:6bcf with SMTP id 4fb4d7f45d1cf-5e04408718bmr13432366a12.10.1739981565279;
        Wed, 19 Feb 2025 08:12:45 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.25])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e07f390626sm2548881a12.30.2025.02.19.08.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 08:12:44 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: gregkh@linuxfoundation.org,
	biju.das.jz@bp.renesas.com,
	geert+renesas@glider.be,
	yoshihiro.shimoda.uh@renesas.com,
	laurent.pinchart@ideasonboard.com,
	phil.edworthy@renesas.com,
	balbi@ti.com,
	kuninori.morimoto.gx@renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH RTF 1/3] usb: renesas_usbhs: Call clk_put()
Date: Wed, 19 Feb 2025 18:12:37 +0200
Message-ID: <20250219161239.1751756-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250219161239.1751756-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250219161239.1751756-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Clocks acquired with of_clk_get() need to be freed with clk_put(). Call
clk_put() on priv->clks[0] on error path.

Fixes: 3df0e240caba ("usb: renesas_usbhs: Add multiple clocks management")
Cc: stable@vger.kernel.org
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/usb/renesas_usbhs/common.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
index 935fc496fe94..6c7857b66a21 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -312,8 +312,10 @@ static int usbhsc_clk_get(struct device *dev, struct usbhs_priv *priv)
 	priv->clks[1] = of_clk_get(dev_of_node(dev), 1);
 	if (PTR_ERR(priv->clks[1]) == -ENOENT)
 		priv->clks[1] = NULL;
-	else if (IS_ERR(priv->clks[1]))
+	else if (IS_ERR(priv->clks[1])) {
+		clk_put(priv->clks[0]);
 		return PTR_ERR(priv->clks[1]);
+	}
 
 	return 0;
 }
-- 
2.43.0


