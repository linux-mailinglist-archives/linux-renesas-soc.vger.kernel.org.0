Return-Path: <linux-renesas-soc+bounces-10774-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA899E03FD
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Dec 2024 14:50:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E87AC282460
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Dec 2024 13:50:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 279FD20370A;
	Mon,  2 Dec 2024 13:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b="Hq3T9o5Z"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C630202F68
	for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Dec 2024 13:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733147372; cv=none; b=REqgrAgDevlcYLvOAK/C/O35myytHDaU4wlqazZRDTWs6wy/cUHyxbk+MKl1iIXJvsM7oQEGGBIRP4kHybGu01bc2jBtuHz1goeKFnukJuEl7KppEKC7AqJxCiY7gcYyLJAeX+XKYdK7fwKJoyLMqPMZ7RY4lNSYe5vcbyo7z5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733147372; c=relaxed/simple;
	bh=ikLggKYh0Un8afUAvMUCGvNq/h+HGVzb6q6YC7Oxa3A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RUHPMr0CeYqdXtXRvpbaD1tAK3qsgYCL83LX89sqKZHByS82lxzzJXoCuKZBrtma4Jpk4Zs4vniKgjN8sRWhqUxDqwT0wrR6rg/DU+0EdWOItnjBf/rvePSzSXhM6UE+ZwLQW5UjBA3PJa4Sgf4osVQ4k2g2opi5nKF0e0cgfOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com; spf=pass smtp.mailfrom=cogentembedded.com; dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b=Hq3T9o5Z; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cogentembedded.com
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2ffdf564190so48404661fa.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Dec 2024 05:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20230601.gappssmtp.com; s=20230601; t=1733147368; x=1733752168; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P4PkmDMX0LCsciSdEuZzJRFJdqj1nfUT/bpDSGbr0kc=;
        b=Hq3T9o5ZO8J/XNIYur/Mmrju6aQ+W7TP1s6nkkl+uuMQYSvzGImfNbnr4pyur+Z7TB
         2Tfacnc3UObebZLIykraVC8fROTkMBbk0WxpSPlXDF9vqggZx/NAYHXGijxWQf2mfFqB
         y51TLTKjsOUUdln0rF453qR0OU9A82yjTuH2MbmHIujPOZ5Os9YPDT/7TIZSNs7uhXrl
         GQyRg0zfdONLZNjWMiO+wNAl51t23mFnZ8K6Onj1Ixhx1p/nK00fYGi10hgCOZoGtFWF
         AyuqD5Whz1QqtORL+i/dNpZY4bEMA+pAm5qVckSJn7RNiyIpcoNDp6Js4cInKNajIGOx
         b9mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733147368; x=1733752168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P4PkmDMX0LCsciSdEuZzJRFJdqj1nfUT/bpDSGbr0kc=;
        b=R8jeeQ7sMJ32idVPsZLK9+TSDx9WFbFweqwfsNg/Yhly53kFLyaLEws7ZB+cAiyhbY
         0F+6zBQ6t3r2x9IrwmOX282bZmW8d43M0bGYXn1R3MHBhK8PVEz7geDQrAQxD/EIv2N3
         l4R2xY7DucDJT6G1SupcwwgDCGSy3FFzhoRGUr9Jm1DMXAlvAKRDQFs692rusxLs+Jeg
         N7UAefA4U0mhsBAA8MrxpZLTfSf5i4LhsnVYbVV5lg+hKhDurUgvv0AQrfyYU7SpyL6M
         DqkRNUT1bFyKPYv7hpFnnEHLXL4HZq4xD+qnkrjUMQEF1KSoAsAjmqT61t7Yacsqwab+
         vY8A==
X-Forwarded-Encrypted: i=1; AJvYcCVGR0+QHUuY6tjM8WkxFJp/Al8hbK4B1aotxBJc+TLA5IKS0V7qAKOugwaQL2DHXQ0ckzD2I096taqRN2Mt7f1yig==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDWSi7lvuaTcaX50F1KJQ3f864/lGrvyrQpUIDFgrApustbcHU
	j5TFppvQxWBbt0pK+UAo/64/hnyx40TgyiFxpETFCHvsnL5iaXJb1pCrswkkOOA=
X-Gm-Gg: ASbGnctauI7a0mrI2EeMY8kLAYLGAWyAxuWD2/52M/gSZaYSv75SWda63hq8ZiZ437U
	x+xiw+/Zjr44uK5Ey5nTyd4E0DwApEyAQDKEBA6XAYC+I5ICNNFyGCUdyYJ5gP0kPlZYxrwGgRQ
	HdriCK9j79WLAfOeFrIRR/FXV30PQSl1YMU+p1xfOY/rhAS7hti4hboPR8EY8NrmsQfe8AVfNzY
	ctc1Gqfi5IaAwRRpIUI44GlxYS/oSzq94BDmKKU0j4IAHhu9QEsQDWmrpAZNF2a
X-Google-Smtp-Source: AGHT+IEsaH+gdxnFkWmsXqpHCD1Zei6m+iH0fYiLGHgbg3pVjQplVpLyAye27YVe8QxL4WzDTSyj7w==
X-Received: by 2002:a05:651c:2207:b0:2ff:566e:b583 with SMTP id 38308e7fff4ca-2ffd5fff0cemr104563321fa.11.1733147368492;
        Mon, 02 Dec 2024 05:49:28 -0800 (PST)
Received: from cobook.home ([91.198.101.25])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffdfbb8f2csm12972661fa.15.2024.12.02.05.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 05:49:28 -0800 (PST)
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Andrew Lunn <andrew@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Dege <michael.dege@renesas.com>,
	Christian Mardmoeller <christian.mardmoeller@renesas.com>,
	Dennis Ostermann <dennis.ostermann@renesas.com>,
	Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Subject: [PATCH 2/5] net: renesas: rswitch: fix leaked pointer on error path
Date: Mon,  2 Dec 2024 18:49:01 +0500
Message-Id: <20241202134904.3882317-3-nikita.yoush@cogentembedded.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241202134904.3882317-1-nikita.yoush@cogentembedded.com>
References: <20241202134904.3882317-1-nikita.yoush@cogentembedded.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If error path is taken while filling descriptor for a frame, skb
pointer is left in the entry. Later, on the ring entry reuse, the
same entry could be used as a part of a multi-descriptor frame,
and skb for that new frame could be stored in a different entry.

Then, the stale pointer will reach the completion routine, and passed
to the release operation.

Fix that by clearing the saved skb pointer at the error path.

Fixes: d2c96b9d5f83 ("net: rswitch: Add jumbo frames handling for TX")
Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
---
 drivers/net/ethernet/renesas/rswitch.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
index 32b32aa7e01f..3ad5858d3cdd 100644
--- a/drivers/net/ethernet/renesas/rswitch.c
+++ b/drivers/net/ethernet/renesas/rswitch.c
@@ -1703,6 +1703,7 @@ static netdev_tx_t rswitch_start_xmit(struct sk_buff *skb, struct net_device *nd
 	return ret;
 
 err_unmap:
+	gq->skbs[(gq->cur + nr_desc - 1) % gq->ring_size] = NULL;
 	dma_unmap_single(ndev->dev.parent, dma_addr_orig, skb->len, DMA_TO_DEVICE);
 
 err_kfree:
-- 
2.39.5


