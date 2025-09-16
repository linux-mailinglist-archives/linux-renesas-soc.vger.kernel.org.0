Return-Path: <linux-renesas-soc+bounces-21946-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BB3B59DCC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 18:35:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 987503211B5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 16:35:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D7FA31E889;
	Tue, 16 Sep 2025 16:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lc4uTPT5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9342731E883
	for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Sep 2025 16:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758040522; cv=none; b=DNI1MHUnC/JXos1NDj+FKsvEZ7qpB3M41CLPrkabs0KnJJ4/pP9/3h2YQ792Lkc1snbg7p5NLNzAmtx88C3mLoacUZxGk/RqqQQKgDmOr+uRdfeemBrRlTFub5tkQ4bmv+d0ArTC5pb5CnKlteY3i7aTZYjwqAIKkrlVedkaFyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758040522; c=relaxed/simple;
	bh=W9pIZSJJd90LkruG1/ysGwyisU1HWLXk6DyjzcXgGco=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sSZrZSP5zhaAphIArBy6n2vihe4D16nclWIDe2SH+kYhlXp5eLzcbD7P/rFXpN8MMIMpnJcGugUZvGM8dJPuuRmahAX87TojB13LMJO0vQVV70JJfxHkuTJXQ/qcNDhWu2qX9E50+WZKKjQgt3i0KriNQ5hkNRb9F+6vqq25EuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lc4uTPT5; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-71d60504bf8so54245407b3.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Sep 2025 09:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758040519; x=1758645319; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kuKVeqxC1e52+9KOcIW3A/OViu0706QA58Vh/Z8d+28=;
        b=lc4uTPT5iwLZIq6+Gfq0UVeORPzREqdfb1aSTO7FcygpGRNA8ncWVK7xfEII22VjLh
         G2yxwZge52CfSzodHF5RR53aTIo8/9zJK1Fo/dI8l6qh0yHlMUkjKjk0lSMJIFBVMn6K
         +UBnFZHhd8y5wZ4mNGTTYjYoiKXfj+Qlm5vW/V8CAJmWCRufyMcIsWIzVNaGG9jsAtYL
         v26JzRAQIN4nK2S98tSMXGPefHwOVWNnI3m5kelfJnSKIGpikBxdgnSwqYXgCjajOFhQ
         SkJLQcu7ld30R3q5sUYwfhDG7B/vd8D8Vj3SSCdeA1duVu6mzGhIw0F9nSXCKsHrQ0tD
         uu8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758040519; x=1758645319;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kuKVeqxC1e52+9KOcIW3A/OViu0706QA58Vh/Z8d+28=;
        b=iKUMEdPz0wegKWMqpxvSVSVrCH1LUEHm+Cq8hU1Pji12vuntQYhqGW1IjMYycX12wY
         O8pHgn0B+RyksBg+39DOyXV4CTxRrg7c1A7mDZZ5QZF7VOnuaE1yUQ+qB24O3mZNURUr
         IUyqMkYOZVlTgxYtY8ct+8lP2ali1rrN1liqhoBehrsihHFUCq+qPvZXzf+MNIlIoind
         Gu21JR31Qm9aLqAv01TD7aeKQjySKKaLCoBRpLXURUz3WsUkmaoMj9LCvUok3zMjX5Ux
         yockOiocF67DFE+f2EwU2l58R/fwvdYh1aMUOUWROZtBMWPAdVuYh9AEThDpFSNPwIma
         VrhA==
X-Forwarded-Encrypted: i=1; AJvYcCXhiVBbSf0A72IswpAzhk+KplkLcbWi9NWhKXLnM+REat3XjedXjPAHw/SPbClM+wJzXz//fdxrOeEJot1pRSoYXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkY/0F1y9rvt6jIOY79xapEqsumZSTS4AAT1FPwGjSnsrXuGPT
	zP9olOJD+gYWQVMA1DMHFiops3wULF01TLkfibwPCcVrTbpWSUVUI34m
X-Gm-Gg: ASbGncu+jKa288bLyRJSI17DQ/T1Y5+Oiiq256f3uJIjLRim6XTYyosVGaGcmGrdaTm
	ssg9tHYa1bpKZiour/wR39P7caxLWV56Z7Vd/xH7IWMO5XBzM+NPb3wB6FJEjS9ZRX4E+o3koX8
	gn3VnpUB77MIfiNheXTi5oQRe6Al+BHYUJ+bRGyQrsvCfuhHlsoqV19UEpBdpdYh8MxTMFGkKA8
	oFqEYkEyFLg+4FCedztaBYWzx+mobWcckt9DvWWNjQAmIwUhu/ip2p7MzSlXtXU1fjE0yFfy86J
	kw/Kclhhp2XH2tPsv1qV/N60y40JTReeADNc0oTGR8G5oiRQx6BP92M4h2bljeRxiDf7UG9Ssvr
	QZlISxc0Y+xFqqUitG2J8dHhLcEUgAM3B1GttfJ70pIEr7rBAhFHdhqcDLg==
X-Google-Smtp-Source: AGHT+IELK6d8jAkr7WzE3/g8PvsLx8V6BOoNS9QvY2+YNcoJ5bf+I2q1PR/+pmVM3steyyY7/7i/0A==
X-Received: by 2002:a05:690c:4912:b0:725:39d:a31a with SMTP id 00721157ae682-730652dd1dfmr178212297b3.27.1758040519218;
        Tue, 16 Sep 2025 09:35:19 -0700 (PDT)
Received: from localhost (c-73-224-175-84.hsd1.fl.comcast.net. [73.224.175.84])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6247490a012sm4214557d50.0.2025.09.16.09.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 09:35:18 -0700 (PDT)
From: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
	Michal Swiatkowski <michal.swiatkowski@linux.intel.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	"Yury Norov (NVIDIA)" <yury.norov@gmail.com>,
	Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND net-next v2] net: renesas: rswitch: simplify rswitch_stop()
Date: Tue, 16 Sep 2025 12:35:16 -0400
Message-ID: <20250916163516.486827-1-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rswitch_stop() opencodes for_each_set_bit().

CC: Simon Horman <horms@kernel.org>
Reviewed-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
---
v1: https://lore.kernel.org/all/20250913181345.204344-1-yury.norov@gmail.com/
v2: Rebase on top of net-next/main

 drivers/net/ethernet/renesas/rswitch_main.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rswitch_main.c b/drivers/net/ethernet/renesas/rswitch_main.c
index ff5f966c98a9..69676db20fec 100644
--- a/drivers/net/ethernet/renesas/rswitch_main.c
+++ b/drivers/net/ethernet/renesas/rswitch_main.c
@@ -1656,9 +1656,7 @@ static int rswitch_stop(struct net_device *ndev)
 	if (bitmap_empty(rdev->priv->opened_ports, RSWITCH_NUM_PORTS))
 		iowrite32(GWCA_TS_IRQ_BIT, rdev->priv->addr + GWTSDID);
 
-	for (tag = find_first_bit(rdev->ts_skb_used, TS_TAGS_PER_PORT);
-	     tag < TS_TAGS_PER_PORT;
-	     tag = find_next_bit(rdev->ts_skb_used, TS_TAGS_PER_PORT, tag + 1)) {
+	for_each_set_bit(tag, rdev->ts_skb_used, TS_TAGS_PER_PORT) {
 		ts_skb = xchg(&rdev->ts_skb[tag], NULL);
 		clear_bit(tag, rdev->ts_skb_used);
 		if (ts_skb)
-- 
2.43.0


