Return-Path: <linux-renesas-soc+bounces-1318-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB6B824FEE
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jan 2024 09:30:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 00A6F1F23BA9
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jan 2024 08:30:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6980F2374D;
	Fri,  5 Jan 2024 08:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Opqn68XX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB752EB08
	for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Jan 2024 08:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2cc7b9281d1so19042041fa.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 05 Jan 2024 00:25:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1704443125; x=1705047925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pa02utebdKs4D+2qWkqTYzxjMn7PXC4HMfCizH3Aht0=;
        b=Opqn68XX1Ezi54wjTNi1VKdE8kLnkGgc/wZwdl/Ee2Tm7bb1yKQDLlMbuCAVsAD0Vx
         jWv+HcVx7bbgxDGbblomNLPs5I6H3DQvK/NO4FPvzZ7xyQhuBsM6mGmkk4Q7PSRi2jw5
         fBTpsLj4M+kD6ipmVvaEF6ZXFP6GpAFlnVlbuEhcjmuzJbswcu6NDRRQWD3Z46uG+m6y
         /P8DFgGMJbxYFh2ZGWqyuFOAZKtbih4PmNU/un8+5MoQYwitfh32f6lmnSRKWGXt/6KW
         FfR4OrRgkBO2Irgpu3AO0wT8tyYsaxyeY31QoCSyg5zse5v/waDW2zQkrtZfE/1dZx8J
         6sBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704443125; x=1705047925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pa02utebdKs4D+2qWkqTYzxjMn7PXC4HMfCizH3Aht0=;
        b=noEzgUxZupQsEYJqlrwzWSiYezq/cmPT/a+NWrzTZpPoD449MxG1OqQ69OZxTtVyyl
         4IexvzLIUc1IhWrkozud+4jOZ0tg+1ioIZ5My2y/TvA8gnL8pepiEHw7KNmYtUYTeM5P
         L1XG2+SEcye+MwSjFBVCOA/ce0pM0+Qk9GD/TpqZFLMic5OJHKcyetmnUl2UOZm2Pkt4
         9JLecvXzvzqnIxnQWEnvQeH7mEgosr1yDsgGtgpTYcSlM7br0LTjFN2XpX8yVb5QO3uh
         9socZVpzLnS4RaIt7APUmcJ/uDfwKiPXpvgUe9KiT319OKZyozYahUihuvQ1c6ATNnRG
         x8WA==
X-Gm-Message-State: AOJu0YzEmw1VwnAor2Vk92PddG8DDDX2QoX1sTaerazrD/DIITa/IGKK
	fIcD++1RXX3Zm1pZX16UMTVZlvivPwPdYA==
X-Google-Smtp-Source: AGHT+IHt2VveZS6mekig2ovYF7xDoyT0dwEzDR3wj9X3cfdmJq/8iBhHsCIEPxbncoJ111k08t9jQQ==
X-Received: by 2002:a05:6512:3109:b0:50e:4632:1d09 with SMTP id n9-20020a056512310900b0050e46321d09mr910812lfb.71.1704443124967;
        Fri, 05 Jan 2024 00:25:24 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.5])
        by smtp.gmail.com with ESMTPSA id j15-20020a1709064b4f00b00a28e759a447sm596198ejv.213.2024.01.05.00.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 00:25:24 -0800 (PST)
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
	wsa+renesas@sang-engineering.com
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	geert+renesas@glider.be,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH net-next v3 18/19] net: ravb: Do not apply RX CSUM settings to hardware if the interface is down
Date: Fri,  5 Jan 2024 10:23:38 +0200
Message-Id: <20240105082339.1468817-19-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240105082339.1468817-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240105082339.1468817-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Do not apply the RX CSUM settings to hardware if the interface is down. In
case runtime PM is enabled, and while the interface is down, the IP will be
in reset mode (as for some platforms disabling the clocks will switch the
IP to reset mode, which will lead to losing registers content) and applying
settings in reset mode is not an option. Instead, cache the RX CSUM
settings and apply them in ravb_open() though ravb_emac_init().

Commit prepares for the addition of runtime PM.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- this was patch 20/21 in v2
- fixed typos in patch description
- removed code from ravb_open()
- use ndev->flags & IFF_UP checks instead of netif_running()

Changes in v2:
- none; this patch is new


 drivers/net/ethernet/renesas/ravb_main.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 168b6208db37..e909960fbc30 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -2342,6 +2342,9 @@ static void ravb_set_rx_csum(struct net_device *ndev, bool enable)
 	struct ravb_private *priv = netdev_priv(ndev);
 	unsigned long flags;
 
+	if (!(ndev->flags & IFF_UP))
+		return;
+
 	spin_lock_irqsave(&priv->lock, flags);
 
 	/* Disable TX and RX */
-- 
2.39.2


