Return-Path: <linux-renesas-soc+bounces-3622-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DCC876D47
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Mar 2024 23:43:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D14CC1F227EF
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Mar 2024 22:43:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35CAF3613C;
	Fri,  8 Mar 2024 22:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="w83WA+6L"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD852C6B6
	for <linux-renesas-soc@vger.kernel.org>; Fri,  8 Mar 2024 22:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709937786; cv=none; b=OxSK+0818yr6At/PRq2aViA215cH9Y7/vrAiCGiIMj6CQj3ATavp3MUMg3/i+Pr64cR9DZYUX4qYTUM5Mi3vXNM+T+wJ+05fFzYPiylZxXM7n9FkcgJ7fNjaAvyhAr0aG9B+tNplpNb1cY5t4HCPkJhdMQhZGdj4+Wb5PMBDGNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709937786; c=relaxed/simple;
	bh=8YBEaFFQoOWNvJW6Vi7307jpuT4v1kzjypgdoMW9EPk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VG5TyEaq4inZGjBkMBVK/htBypi1E4saIcMwv7zKO/z+KvghknNKo1rCA1qnyZ7x2JH2yo2s7v0iNOwRef67GqXy6BbudeUHuOODfrqniy4LGb4EmH6c8HeBsr3k9Tgk6UzVIb2Y1jl1mMscRQo9vwpfV+cY0Jyfuh4kIIUh42Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=w83WA+6L; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2d09cf00214so18303621fa.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 08 Mar 2024 14:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1709937780; x=1710542580; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DxTbh1S9LNXvBZm5HAEJ6i2YSyuHJ0RHO3jNupLKblY=;
        b=w83WA+6LOVIObcnOE9oQ8+KD/Kt5gqXaX+hIZ6Oc3v3Kga9jyNHvNkIdaBHvUyoYu+
         PaldD+YUg+8ide7ZOi+6uS4qXE3muuahloue92pjEWlb81Zje8AociJqiaVreD4TWbWY
         F5cnQRuDN7he/QYZEr55rVZGnRsAJcgaQSmunU6jEmRd6e4tMo/SbeYAz+XkKOr3uFep
         2MFaMKvYNFaQars6WE9KHLIwM9EDYxFAAkd+2Yqo86V5c6rEKsERKmxyO0JsIFhSBIkC
         nokNaD0/RnOqNNnBz7dHJXNIzqxRgwbcGplpcJlHq8eIZkjcQllaCbmDh1vQezLo60Lu
         lBMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709937780; x=1710542580;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DxTbh1S9LNXvBZm5HAEJ6i2YSyuHJ0RHO3jNupLKblY=;
        b=wNfAJDEbWRIVqcBsCv/mMay04r1IIbRYcBSF492FhgDpG/vqMNBR0vEJIN849SzL1o
         PgrEENZIPtdlmXfFGjVAgVDF0PUZViRYRA2SyoOs01U+nfctqgTlBwarslwPPtq1rYD5
         o/DAM7pczYhoP/dePNP07PWHijEWtibo58G7qNk+uYNrI7FfYFKHMddbDF+EjyEN5yjk
         e42BqvaI3U9yG3PJDWwchxxw0FZUroJXrJwEQtL4lLcfs4AaIT1O8GbvqgVdVt8xW/gC
         60dm2I81S+LJVFQn5u/WYJKDzUWkRzzUJ6X5Gu37pS98kW2wenQJwkIZ3jSJtdcbuhDj
         yv6A==
X-Gm-Message-State: AOJu0YxwGdavYWEKUHr/Vzel6KzY9hFJzxO8gaOQn9bF4PRAnKwRtewS
	/0G91YQt1/2v2qp7Coc693s5oSCtjf9PTOiiOyVlbwVtYRlAFnz52h1VbR6Achs=
X-Google-Smtp-Source: AGHT+IGIrGIXdjscwoUnyV2KB3k7UIcz0Ljw6JSdc+MRgKxeFC0To5M/gOskkCIDD/HIWU4dUVpwCA==
X-Received: by 2002:a2e:9c44:0:b0:2d4:2958:6daf with SMTP id t4-20020a2e9c44000000b002d429586dafmr68310ljj.20.1709937779842;
        Fri, 08 Mar 2024 14:42:59 -0800 (PST)
Received: from sleipner.berto.se (p4fcc8c6a.dip0.t-ipconnect.de. [79.204.140.106])
        by smtp.googlemail.com with ESMTPSA id h12-20020a50ed8c000000b00568299df7f0sm207043edr.1.2024.03.08.14.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Mar 2024 14:42:59 -0800 (PST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sergey Shtylyov <s.shtylyov@omp.ru>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [net-next] ravb: Correct buffer size to map for R-Car Rx
Date: Fri,  8 Mar 2024 23:42:37 +0100
Message-ID: <20240308224237.496924-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When creating a helper to allocate and align an skb one location where
the skb data size was updated was missed. This can lead to a warning
being printed when the memory is being unmapped as it now always unmap
the maximum frame size, instead of the size after it have been
aligned.

This was correctly done for RZ/G2L but missed for R-Car.

Fixes: cfbad64706c1 ("ravb: Create helper to allocate skb and align it")
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/net/ethernet/renesas/ravb_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index fa48ff4aba2d..d1be030c8848 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -979,7 +979,7 @@ static bool ravb_rx_rcar(struct net_device *ndev, int *quota, int q)
 			if (!skb)
 				break;	/* Better luck next round. */
 			dma_addr = dma_map_single(ndev->dev.parent, skb->data,
-						  le16_to_cpu(desc->ds_cc),
+						  priv->info->rx_max_frame_size,
 						  DMA_FROM_DEVICE);
 			skb_checksum_none_assert(skb);
 			/* We just set the data size to 0 for a failed mapping
-- 
2.44.0


