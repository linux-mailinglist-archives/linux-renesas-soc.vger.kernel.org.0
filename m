Return-Path: <linux-renesas-soc+bounces-39-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 859347F32C7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Nov 2023 16:54:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A7911C21CF0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Nov 2023 15:54:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D563559141;
	Tue, 21 Nov 2023 15:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20230601.gappssmtp.com header.i=@ragnatech-se.20230601.gappssmtp.com header.b="0lwRPvKH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73ABB10C7
	for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Nov 2023 07:53:43 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-54553e4888bso7983181a12.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Nov 2023 07:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20230601.gappssmtp.com; s=20230601; t=1700582022; x=1701186822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q1tQAoZQgFgk25StX3LmmkNTA/AsMdJ3cDJnMXgpoTs=;
        b=0lwRPvKHTRRLEiar3guYeByej6sZJ6/dcHV1KHZCNdmyG03hL6FCBGtPL/rnCugaka
         bXpw0Kq7kL/DrOOCMFsJcUEfWGXhyOihqgTcDTxSRO7s4GJl/liMsabweYi3jPsgLoQr
         SR3ZULZWJtklrcEEiBoXgl4TRhMl0tUS3SFWlZeShDokUKV26VUbFCb66hvDVbQk6moC
         d9zi7YUniuORdqgtZ0Vt7pGYT6x3SJnoG85MYH+kOykL6XrYOsLjZOaxE49jdFKhoGm8
         wZrqYOyO5jwwsisCD6uq+BgcJEYZroJBe0kGBwMwUr6uzdEvc0MaYW7mEYZTQcWzi0J1
         YOSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700582022; x=1701186822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q1tQAoZQgFgk25StX3LmmkNTA/AsMdJ3cDJnMXgpoTs=;
        b=QdPQN/Jdn/9oRYceS9yWxaXhwghlmcm/lJt/xenLsJkJZqijda3KStHuCVfQcG+/RI
         p7HFeE3EA0QOKdJY1LkUXjG6+YgZInMmv5e9J6gWvIvWxmf+7LJCp8cE3GmIwXewW1YW
         O3ETDWP3pqIsi3tSCIl661lv4iNQD79jbHpjsxhttoOU5v6hkzDMimMxyAyFAVoI2ohd
         FC3hKkuh+9Ymqbb58n+tlDp/+2GZSvCFFF95cG7uo7vAUzUU5KiVFKVDMDioRPSIp8sf
         UpIEEI/PseLaW51jlR/j4hirbURdaLo4Oj6rqgkA4CLXVqUt27I6aax3miCXFI1CDi/L
         nA1w==
X-Gm-Message-State: AOJu0Yy9OJXiXkb0eTGIH+04dImm9F79rGPQv1IsRxPa97sqSF9CTQQB
	UoRPB4xZ8jqWVvPkXSY0eTF+UA==
X-Google-Smtp-Source: AGHT+IFumWJ3TPYOouLLfqM3uX8s7lAMI5kBa/WG6pmf3sp5L5nbdO83bWwAKC3hRbCzYR9rGum/Zg==
X-Received: by 2002:a17:907:c007:b0:9d3:f436:61e5 with SMTP id ss7-20020a170907c00700b009d3f43661e5mr10541291ejc.29.1700582021271;
        Tue, 21 Nov 2023 07:53:41 -0800 (PST)
Received: from sleipner.berto.se (p4fcc8a96.dip0.t-ipconnect.de. [79.204.138.150])
        by smtp.googlemail.com with ESMTPSA id dv8-20020a170906b80800b009fdc15b5304sm2896853ejb.102.2023.11.21.07.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 07:53:40 -0800 (PST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [net-next v3 1/5] net: ethernet: renesas: rcar_gen4_ptp: Remove incorrect comment
Date: Tue, 21 Nov 2023 16:53:02 +0100
Message-ID: <20231121155306.515446-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231121155306.515446-1-niklas.soderlund+renesas@ragnatech.se>
References: <20231121155306.515446-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The comments intent was to indicates which function uses the enum. While
upstreaming rcar_gen4_ptp the function was renamed but this comment was
left with the old function name.

Instead of correcting the comment remove it, it adds little value.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
* Changes since v2
- No change.

* Changes since v1
- Added review tag from Wolfram.
---
 drivers/net/ethernet/renesas/rcar_gen4_ptp.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/renesas/rcar_gen4_ptp.h b/drivers/net/ethernet/renesas/rcar_gen4_ptp.h
index b1bbea8d3a52..9f148110df66 100644
--- a/drivers/net/ethernet/renesas/rcar_gen4_ptp.h
+++ b/drivers/net/ethernet/renesas/rcar_gen4_ptp.h
@@ -13,7 +13,6 @@
 #define RCAR_GEN4_PTP_CLOCK_S4		PTPTIVC_INIT
 #define RCAR_GEN4_GPTP_OFFSET_S4	0x00018000
 
-/* for rcar_gen4_ptp_init */
 enum rcar_gen4_ptp_reg_layout {
 	RCAR_GEN4_PTP_REG_LAYOUT_S4
 };
-- 
2.42.1


