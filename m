Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B653937F820
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 May 2021 14:47:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233297AbhEMMse (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 13 May 2021 08:48:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230253AbhEMMsd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 May 2021 08:48:33 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9A34C06174A
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 May 2021 05:47:22 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id b25so39618221eju.5
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 May 2021 05:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W1J1Y/llzefABiurBrXhH3P/Yf5bUZKTxFl7ki73TUM=;
        b=dNGZV1nNZfey2bqWkxy116QdVoE+0leuNGLTebhBwH+kktGks6cj+t1Js5jgjF84SO
         q9zu48R0qfu1PYlPP64PaXoKFa8rHrbDpMlduGiYdtJuRetaqNOQHy74MEHmBPKulpSY
         28tLhBkcDq4354iVCHo4Lfjd2l8xYdC+pFrggDzxxbeFfTehsvH9KJXz1e5jbwyczPm0
         NFg9Q7JC6orOUaYm8YIAZAs+ORUKw+SsfP9lqAiHdUzN051I+vYrmEz6kL3QhTgh3DQg
         gwHDXOUbj93fIqFEtbeZZEzR3krut9Mbkq57f0kkkLRxcZZbU4k+GdBqWPw0UCCyL/ld
         nXug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W1J1Y/llzefABiurBrXhH3P/Yf5bUZKTxFl7ki73TUM=;
        b=d6SYfobuKt9K6dL+9hvIoCrSAIy6jkolhVCNCwaz1m06ni9bDzr78zKtBZJfeR6QT4
         SmjO2OXfPDmYX64JX3jlaOV/7FcSva2JC6GTA86e7LmF0icHBdn1pBqkD7GYrQP4tuOX
         2aBE8V82cERCuNeTJahmXcOSCQ6g3vqucKmNpxgSamev3o/k5JAxKhh06N5EXZOgw4jt
         I5H1LwnnVsCsvCarZzky4b6qp7T8usUa32p96AmzWOthcxg9XJDz50giHQqJ1sOB5AiB
         YD8faYhHwzixPQluHO43b6kYRIO9CiNhfIHtydo6dAvNF4W8J2Cv764V+RNpM8K+TyLl
         DM3A==
X-Gm-Message-State: AOAM530f2FcMYvtjEWsgF/qUkd7Nn7R939BxxwkNCKyDLbUJCa70Q1Jl
        ebZHt5wncEPIjsXK1nXH7LyTCPCsrr3kr8hZ
X-Google-Smtp-Source: ABdhPJzaRAjidQD4l8Ibmd4kxySWxB8+li+B9mPkM8DTbC7Rrye9kQrEKEJ7ogQb/Om/KpaFAkv36Q==
X-Received: by 2002:a17:906:2f91:: with SMTP id w17mr23889632eji.443.1620910041562;
        Thu, 13 May 2021 05:47:21 -0700 (PDT)
Received: from bismarck.berto.se (p54ac5521.dip0.t-ipconnect.de. [84.172.85.33])
        by smtp.googlemail.com with ESMTPSA id k5sm2582607edk.46.2021.05.13.05.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 May 2021 05:47:20 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        LUU HOAI <hoai.luu.ub@renesas.com>
Subject: [PATCH v2] media: rcar-vin: Enable support for r8a77961
Date:   Thu, 13 May 2021 14:47:15 +0200
Message-Id: <20210513124715.598093-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable support for M3-W+ (r8a77961).

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Tested-by: LUU HOAI <hoai.luu.ub@renesas.com>
---
 drivers/media/platform/rcar-vin/rcar-core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
index cb3025992817d625..33957cc9118ca79e 100644
--- a/drivers/media/platform/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/rcar-vin/rcar-core.c
@@ -1362,6 +1362,10 @@ static const struct of_device_id rvin_of_id_table[] = {
 		.compatible = "renesas,vin-r8a7796",
 		.data = &rcar_info_r8a7796,
 	},
+	{
+		.compatible = "renesas,vin-r8a77961",
+		.data = &rcar_info_r8a7796,
+	},
 	{
 		.compatible = "renesas,vin-r8a77965",
 		.data = &rcar_info_r8a77965,
-- 
2.31.1

