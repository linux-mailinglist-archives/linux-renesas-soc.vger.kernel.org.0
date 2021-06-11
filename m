Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E65DF3A4627
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Jun 2021 18:08:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230443AbhFKQKA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Jun 2021 12:10:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230040AbhFKQJ4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Jun 2021 12:09:56 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FBF9C061574
        for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Jun 2021 09:07:58 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id z8so6643230wrp.12
        for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Jun 2021 09:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MTRXqohXKaZzkBwBQa5ocnRQNcBifNqP3C6JaHlOkPk=;
        b=n7irVSsGeFZbRTRSh2CdBHGvDmgNUgu+YxHRjXSQorG84ZkPn+L/6GmSyZ8yzrHF7i
         I6RSHb0FmV+EF2wskL4dEfC3ENLvcvRmk2CB3TenBNWApNm/6cP3Zht6YjNzcBEh3LSP
         rRWiRWndb5IJPGgI1s11TloANYRMHkISGciHUHqTrLert0crqrPvJojjF8OzI5H3TrHV
         Okh/oOx25UuCZI9OdaPdsWw4Y1H9ribkUl3l/P0J9j4HvJ/AQhu+ge/5rNhhNpYzAyVe
         gjOmqjldQKZfEjnx5WsQxCmtHQl3FFe/KFEQla9cud5yJLAnCaakOtwV1wu5OhrFyO93
         X2ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MTRXqohXKaZzkBwBQa5ocnRQNcBifNqP3C6JaHlOkPk=;
        b=OFZVaZs2OwFrH0DDu0/BuZltVsUftwo1xiTFgl+jworDDCXAQADjS54IuyK0jovg0H
         wCvDJlFoooO5QxZpnYOpLAiOOQNe6ZsD+W0nrHPhfRbkdpVpQQCzXMMWiL2Ehlucy5BR
         d7DP+3l35uWVqi6/5gB8RqVokjFqRVNrTOUfGDTQaswXQRqM0K5fdemRZ2gqed5v5PKk
         bMpXl/dV35XViH8CTVufLLNj8nQxoh4IOfMZ3Hm1/QOjQGjWOQntLllT56YW7bKnZkkx
         OjCEGL5Q6lHdFramZBOuEuI0zaWQV0mCw8/PBTepEkCf/+g1QCjUDgoHsTVk4poO36Rh
         WHBw==
X-Gm-Message-State: AOAM532EQSTJPGiJCrDpp88bhC5UAGFquowujjnLnV/jnmQTa+vKtDEn
        RTZ06lR7Jjaq6BHUk6DkLkAjJA==
X-Google-Smtp-Source: ABdhPJwPX5xRFhH28XL8f2/mvFZoYMdPHyEl4YaH+ntSapz2FNJj+x4yhqFMoo6BiGNoDlX9bYE3hg==
X-Received: by 2002:a05:6000:1803:: with SMTP id m3mr4869464wrh.257.1623427676761;
        Fri, 11 Jun 2021 09:07:56 -0700 (PDT)
Received: from bismarck.berto.se (p4fca2710.dip0.t-ipconnect.de. [79.202.39.16])
        by smtp.googlemail.com with ESMTPSA id f12sm9003345wru.81.2021.06.11.09.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jun 2021 09:07:56 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2] rcar-csi2: Add support for Y10 and Y8
Date:   Fri, 11 Jun 2021 18:07:34 +0200
Message-Id: <20210611160734.796961-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for two new media bus formats, Y10 and Y8.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-csi2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
index b87d5453e41881e0..5cb22e0e41f5ada6 100644
--- a/drivers/media/platform/rcar-vin/rcar-csi2.c
+++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
@@ -320,10 +320,12 @@ static const struct rcar_csi2_format rcar_csi2_formats[] = {
 	{ .code = MEDIA_BUS_FMT_YUYV8_1X16,	.datatype = 0x1e, .bpp = 16 },
 	{ .code = MEDIA_BUS_FMT_UYVY8_2X8,	.datatype = 0x1e, .bpp = 16 },
 	{ .code = MEDIA_BUS_FMT_YUYV10_2X10,	.datatype = 0x1e, .bpp = 20 },
+	{ .code = MEDIA_BUS_FMT_Y10_1X10,	.datatype = 0x2b, .bpp = 10 },
 	{ .code = MEDIA_BUS_FMT_SBGGR8_1X8,     .datatype = 0x2a, .bpp = 8 },
 	{ .code = MEDIA_BUS_FMT_SGBRG8_1X8,     .datatype = 0x2a, .bpp = 8 },
 	{ .code = MEDIA_BUS_FMT_SGRBG8_1X8,     .datatype = 0x2a, .bpp = 8 },
 	{ .code = MEDIA_BUS_FMT_SRGGB8_1X8,     .datatype = 0x2a, .bpp = 8 },
+	{ .code = MEDIA_BUS_FMT_Y8_1X8,		.datatype = 0x2a, .bpp = 8 },
 };
 
 static const struct rcar_csi2_format *rcsi2_code_to_fmt(unsigned int code)
-- 
2.31.1

