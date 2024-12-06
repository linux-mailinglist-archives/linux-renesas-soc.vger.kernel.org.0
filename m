Return-Path: <linux-renesas-soc+bounces-11033-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A29359E787B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2024 20:01:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4687818881E3
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2024 19:01:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4358920551F;
	Fri,  6 Dec 2024 19:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b="AaKeSLfv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747F1204577
	for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Dec 2024 19:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733511650; cv=none; b=fnXjFC40bLEgmP0D72KOhVNTVFAUMZ4h9RRiIOxWQ3qPayQ9vEGGKNhVdR2W6nqNn2ja2JmxvfxsqUml24vj6gUX0Uv4M0bE//6Y2AmKIVkfhUrIjpz9Cra/Pl7fh+SYBiZEaUg1neUN8P26u5z6wPpKzVvsbH9ks7V2an0jcSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733511650; c=relaxed/simple;
	bh=KWMNtKFHSXqIJRHh07Fhy/LOB/evmZgba6wRNVyYg70=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=br19pOYnsN1vV0rk/T3irK8gSD8iQTc1/6WyVnjDWAHTRlp08HYgWjoO1zyRvO/Q9hDIrfeXuOxpDjUKSnzkmuJXHcl3pDvRWnhBQN2pyCxlDrPWa/+oSP46+8TlENpqtTyjjmSklS8PuaW6P+VI78E+VGCMWsYsROjy4peYmIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com; spf=pass smtp.mailfrom=cogentembedded.com; dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b=AaKeSLfv; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cogentembedded.com
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3001d009633so21813051fa.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Dec 2024 11:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20230601.gappssmtp.com; s=20230601; t=1733511647; x=1734116447; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i2QojkySpM8U2FoZ7dctDq5YFcwKebuv3WnOzhKxOok=;
        b=AaKeSLfvAuYARQhOkn8ve0wlftNC3sC4ypk8JATHhwRbT06adA4sEHbDxd8YS3B28S
         mghGDaUCR1vHjKf3lrNzzBaG+NCBEScUvZg66xGYtsvT45/np4RPkXpjqEGAAMS10KHz
         hVg9pkvb7tNwTcXU9fYL07Sas/g9B6ndgGwZa7Oc6fBpOJlhVQrTYfPgu9fLhzqr/0SU
         7HNZHM+Otz6zC5l/5D3MMxPhh6o1koCSubufpkIZ6W3Od+as8eM51326nZlXRvmP490p
         J0gdAQHgQ+6fc9TyfKGllHvk6P1/GJSIa8Oi5OL/gKPPmt5JsmSucpte1FmlZSEtOpED
         KtyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733511647; x=1734116447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i2QojkySpM8U2FoZ7dctDq5YFcwKebuv3WnOzhKxOok=;
        b=WWRM2u3Kl+iXiWt8pkqR9f7YW3WzHc0UVTplo4cJaRfnXiOZhKuFT8t332HcmEvJi7
         gKmhdlRH49zj2Qb2uArAyeFyJJ4XUbdO/wOk18psehbNeBEmWRjW0RKdfJF4VkSLN/wJ
         FBMbAUEFcvJnyvOEcvq2esEX45a1JCLz5rHxh1ReFFUXsWdwzkzNtcD/iwlG0Hugq/d0
         1tezlOO0dnW+bZ3xsN8zrn2bhW5FlsrCDthrd22rRWFpTKMOVsHrNYxj2Ows3sejOOzz
         /hDkx7/BRdfRSO1NZq8YjCK7i0Rg+OzTRdP4qgy3T3J8T7+WzDdRyTe1hI7sHqxsl8Pj
         v+Kw==
X-Forwarded-Encrypted: i=1; AJvYcCU6qhViZMk/Rua/qvV63OTnxQ1sLF0wlTLJpAobSOsnn9A4yPdUauqcWgKkFVOvVL6skIwtGzTPJ/EcyIVMcbkZWw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwtBeFwofyFuEad2xU9nRXvZjwfgLGNgcD+gz07afJtOGUK7hh
	rKR3hPtdRRRFiYCnRkFPFrfnyJNtPA6YdVh8cN7aOqfLUu9XxNVT/8PDfvJaQgY=
X-Gm-Gg: ASbGncukEnLpTMm4jmM6xs6YbjyQAT954fSLSItQBfP97towj6nYSgELSEQXFoqGXGJ
	nKSZlBjuHhtiOkujUw/FLB9XzixFbCPFmLmH8YolkBYiAcVik0xpn4xE415Q0edh/4L7mOkKpGN
	aYP9XLTBZ1fMQuervywnV8E6VKjON9Dl2UL4vCI9dqJwney1nwS5HPmR9qBt/lVB1ZKPJkdU+SD
	Il9iiFSdq01YuB0JuF1q6Ler9StvIte4xchZTXnv1EHHEkZj+4IFwwmKcMsH8IG
X-Google-Smtp-Source: AGHT+IEIsm4wQVX3IM84rN3fxaWi6YpUjvzeeTe6nAk1y92eqqKLDaXUQfpaQtMa2bkKEiL1wi3iHg==
X-Received: by 2002:a2e:bd14:0:b0:300:2278:9b1f with SMTP id 38308e7fff4ca-3002fd1b175mr15585421fa.39.1733511646671;
        Fri, 06 Dec 2024 11:00:46 -0800 (PST)
Received: from cobook.home ([91.198.101.25])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30020e58200sm5523201fa.113.2024.12.06.11.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 11:00:46 -0800 (PST)
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
Subject: [PATCH net v2 3/4] net: renesas: rswitch: fix leaked pointer on error path
Date: Sat,  7 Dec 2024 00:00:14 +0500
Message-Id: <20241206190015.4194153-4-nikita.yoush@cogentembedded.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241206190015.4194153-1-nikita.yoush@cogentembedded.com>
References: <20241206190015.4194153-1-nikita.yoush@cogentembedded.com>
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
index 800744a6c25b..9c55f3480678 100644
--- a/drivers/net/ethernet/renesas/rswitch.c
+++ b/drivers/net/ethernet/renesas/rswitch.c
@@ -1704,6 +1704,7 @@ static netdev_tx_t rswitch_start_xmit(struct sk_buff *skb, struct net_device *nd
 	return ret;
 
 err_unmap:
+	gq->skbs[(gq->cur + nr_desc - 1) % gq->ring_size] = NULL;
 	dma_unmap_single(ndev->dev.parent, dma_addr_orig, skb->len, DMA_TO_DEVICE);
 
 err_kfree:
-- 
2.39.5


