Return-Path: <linux-renesas-soc+bounces-3438-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 62ED886FFE6
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Mar 2024 12:10:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0261F1F23689
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Mar 2024 11:10:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78A253A8D8;
	Mon,  4 Mar 2024 11:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="fWVt5vaN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B23439FE6
	for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Mar 2024 11:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709550578; cv=none; b=uToDKEN8/XnNI4Xy4zl+G9THnWzRmjau4rxBgNYc2ncUhsE1HReO8cmFeLMQHpIDRuYpd6jRhB5QiOqrmkALjQOBxnHG0hYGjBSR3TLcJrMvOCF8XUP+3uV7mHmESS6ur6OnyasHPAmpE4o52T3lVnD39EGBMMIjB1KvKXgg0Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709550578; c=relaxed/simple;
	bh=ipwwzageipbMz78E+3Wjwp/04JXYtaYBlWLk7plSvHA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I3E97tAwRKxzS43rXe2m9QaodZTPQPSBahiFc+crp+Ycwv1ivjp+dZPij6fOVMpRTOwoiKq5eawnEm46FuKSzZ3K6yLus8epqOoxs6YH0raSqgLxhxaJjM3EeDxZ9yHSYPqcXx2U/RLRUuoIZnFT6w0+HC+QumqWo6c/ol5iJPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=fWVt5vaN; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a28a6cef709so703801066b.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Mar 2024 03:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1709550575; x=1710155375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TPeilTHQcrs4Zf8fAnx4929uAMtVZNsWRtAs7rDG6AQ=;
        b=fWVt5vaNOF1CiWELUF2oLP2pWWhD/YfLB548TfcLGDFFKUOj+1u4ltFySV6EF9wVV5
         DgfbWxFnR4fRDqJxikJ9wUnDmM5w3zolDmjzqLBXv1QKGgDuWVtS6XS39dmEhQP+PS3+
         3SIp9o9tkeJQikNiTVHawszaX/7YnTfTxGpCjrjcHXAj8aKyTJmd1AWtcFD2cvvFeKk1
         gQ/FyIyMy2c1JZVYbj4ErXsiGo5Es0R4P4KqEHiXvHPF5gGPQ0USxYf+/pZwYetp/G6R
         xP6yUD71xpZeKzyQjC3L/peoEzZ6hZFhG3fNa+DNRiDCG0A6NM/iA8vgjgzKRrNwTBBj
         KsCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709550575; x=1710155375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TPeilTHQcrs4Zf8fAnx4929uAMtVZNsWRtAs7rDG6AQ=;
        b=FWX9YruDC1UMQwSB8g87RGD3VhouWnyTozlO902HlxugfPPg9AOLLBEAb5Ee0+zk2k
         ZKCNL6bI1rJNC0AXIVsYR2HcvBMz7WlT4HViZfUlNbVQ51v0fTVneuvaomBb7oid0AUt
         jIX2tGENqLRpv9vfskbTZGc8QIr01tZH2RrxWwLwho/tSd3jIvqXGxnfVmLy9wyRvA+/
         I1vAw09eLSZPqBItG7C8xxnEKPKFcLFVsSttlFpkXGikKwMOlUYY9lhQxZyhunskP+g9
         WwGMa/NGHHClVIwjvGeiks+dBOqiUUdvQfXhFzsP7raQ2XEMGDhlYDn0Z41lXMH3u++G
         5a5Q==
X-Gm-Message-State: AOJu0Yzv6kxKX36PdTQIkz3fccjewA23hq+CZSuQ8t0jJgIKVsajQpwm
	htgakVadgG/Rk8P7dzVCayE3jHKeqLy7PVZAZNE8c6NedOYIWfwteTmlPvAUuTA=
X-Google-Smtp-Source: AGHT+IFCv32f7cCPbNZLVdLHrO6GVxeJ8SO4tiuW7IHcb6DkeflLmyP7OgXDgJSPCP3GfX82OJ0vSg==
X-Received: by 2002:a17:906:6c8:b0:a45:6422:ea2a with SMTP id v8-20020a17090606c800b00a456422ea2amr988741ejb.41.1709550574799;
        Mon, 04 Mar 2024 03:09:34 -0800 (PST)
Received: from sleipner.berto.se (p4fcc8c6a.dip0.t-ipconnect.de. [79.204.140.106])
        by smtp.googlemail.com with ESMTPSA id v23-20020a170906565700b00a455ff77e7bsm688420ejr.88.2024.03.04.03.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 03:09:34 -0800 (PST)
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
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Paul Barker <paul.barker.ct@bp.renesas.com>
Subject: [net-next,v3 4/6] ravb: Use the max frame size from hardware info for RZ/G2L
Date: Mon,  4 Mar 2024 12:08:56 +0100
Message-ID: <20240304110858.117100-5-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240304110858.117100-1-niklas.soderlund+renesas@ragnatech.se>
References: <20240304110858.117100-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove the define describing the RZ/G2L maximum frame size and only use
the information in the hardware information struct. This will make it
easier to merge the R-Car and RZ/G2L code paths.

There is no functional change as both the define and the maximum frame
length in the hardware information is set to 8K.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Paul Barker <paul.barker.ct@bp.renesas.com>
Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
---
 drivers/net/ethernet/renesas/ravb.h      | 1 -
 drivers/net/ethernet/renesas/ravb_main.c | 5 +++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet/renesas/ravb.h
index 751bb29cd488..7fa60fccb6ea 100644
--- a/drivers/net/ethernet/renesas/ravb.h
+++ b/drivers/net/ethernet/renesas/ravb.h
@@ -1017,7 +1017,6 @@ enum CSR2_BIT {
 
 #define RX_BUF_SZ	(2048 - ETH_FCS_LEN + sizeof(__sum16))
 
-#define GBETH_RX_BUFF_MAX 8192
 #define GBETH_RX_DESC_DATA_SIZE 4080
 
 struct ravb_tstamp_skb {
diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index e6b025058847..45383635e8e2 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -568,7 +568,7 @@ static void ravb_emac_init_gbeth(struct net_device *ndev)
 	}
 
 	/* Receive frame limit set register */
-	ravb_write(ndev, GBETH_RX_BUFF_MAX + ETH_FCS_LEN, RFLR);
+	ravb_write(ndev, priv->info->rx_max_frame_size + ETH_FCS_LEN, RFLR);
 
 	/* EMAC Mode: PAUSE prohibition; Duplex; TX; RX; CRC Pass Through */
 	ravb_write(ndev, ECMR_ZPF | ((priv->duplex > 0) ? ECMR_DM : 0) |
@@ -629,6 +629,7 @@ static void ravb_emac_init(struct net_device *ndev)
 
 static int ravb_dmac_init_gbeth(struct net_device *ndev)
 {
+	struct ravb_private *priv = netdev_priv(ndev);
 	int error;
 
 	error = ravb_ring_init(ndev, RAVB_BE);
@@ -642,7 +643,7 @@ static int ravb_dmac_init_gbeth(struct net_device *ndev)
 	ravb_write(ndev, 0x60000000, RCR);
 
 	/* Set Max Frame Length (RTC) */
-	ravb_write(ndev, 0x7ffc0000 | GBETH_RX_BUFF_MAX, RTC);
+	ravb_write(ndev, 0x7ffc0000 | priv->info->rx_max_frame_size, RTC);
 
 	/* Set FIFO size */
 	ravb_write(ndev, 0x00222200, TGC);
-- 
2.44.0


