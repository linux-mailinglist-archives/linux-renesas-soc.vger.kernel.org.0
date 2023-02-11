Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 435D16931D0
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Feb 2023 15:55:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229597AbjBKOz2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 11 Feb 2023 09:55:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbjBKOz1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 11 Feb 2023 09:55:27 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 748F423C49
        for <linux-renesas-soc@vger.kernel.org>; Sat, 11 Feb 2023 06:55:26 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id f23-20020a05600c491700b003dff4480a17so6516509wmp.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 11 Feb 2023 06:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ooAfMA3EkaTFtYOvUMxb6RDyeWxLI4qGALSciN+MamQ=;
        b=vw9jNPYWFubfnUngtPwYKanvmmE05dtgbuysNjrzncmjeNMAJYTwz18NTULjDRJR+P
         /Ah/EhdLKqiPrzj4a0ydPpPbuYoRu2NTpuMiRkygqtd01r5/u5lTCqIFf9kyOApsqXR/
         CAlblYQITezOjgu80+TigbFQEYPqo0ilNFwWS0vNNdFOo+OKk9RUpnedQy3ZUiWD3B7t
         CKsS1pYm8BZ01hittj4zlIOdeJ6wCl1obdEYfEVTFITZFLg+bW+I1h3U3KNkOfsQdqnz
         j4QHFZ7wYuG3nRVdDFGzHCyzZOAsLMApzZjODMAt3UWj+GoqOa05deqxdOjipffnuxYw
         oX0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ooAfMA3EkaTFtYOvUMxb6RDyeWxLI4qGALSciN+MamQ=;
        b=8BbKWjgHTH9+3Ksjs22otyPigA7Ls9rJsqkztSWJd4f69m4yZn3oh1EfKbAoEleMna
         sGuqXif9WR5pS1hps1PTkd/+VtuqkRDFZWPU9gWg8L6ae3tb2OGKMUIY5IM0/6RP2Tv4
         09XotsOuJLnwhHXMOUs4Drg0jZBDTVh6OHMaOFZ8r/iueyR9qs4NJNVicDK2yGMmuznZ
         9PRghsii5ueY7sw6jeKw3n0XMZ7KFZ6nTy/haDwmbWj+XFSZz2Iko81zx2r8TetoScg4
         uKDAabxKwX0iLASEsRTzZtVGmgdv6bt1nA89kINxRNA+FJIKVbhhAEwAqICFR7yJghEY
         zYCg==
X-Gm-Message-State: AO0yUKV3CrK91TbP3qkDqWFZbBTf34jjdaMTSFu0bZOJcIDCcqht/Row
        pFmwDuPcd61vTKwVHP/voNLg1g==
X-Google-Smtp-Source: AK7set+XWmFcuT97C0frvUf2Erf6nPlcwlBT9VNBVkcA0NU/+T2bcxCU17P86qmbPrHr1k3D1pJByg==
X-Received: by 2002:a05:600c:1817:b0:3df:e54a:4ac5 with SMTP id n23-20020a05600c181700b003dfe54a4ac5mr15257898wmp.27.1676127325100;
        Sat, 11 Feb 2023 06:55:25 -0800 (PST)
Received: from sleipner.berto.se (p54ac5802.dip0.t-ipconnect.de. [84.172.88.2])
        by smtp.googlemail.com with ESMTPSA id y15-20020adfee0f000000b002c3efca57e1sm6394275wrn.110.2023.02.11.06.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 06:55:24 -0800 (PST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] media: rcar-vin: Add support for R-Car V4H
Date:   Sat, 11 Feb 2023 15:55:19 +0100
Message-Id: <20230211145519.3821526-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for R-Car V4H. The V4H uses the ISP Channel Selector as its
only possible video input source. Even tho V4H is a Gen3 board the VIN
interface is very close to the one found on the V3U, for this reason
mark it as a Gen3 model internally.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/renesas/rcar-vin/rcar-core.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index 5e53d6b7036c..059795c889ad 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
@@ -1303,6 +1303,15 @@ static const struct rvin_info rcar_info_r8a779a0 = {
 	.max_height = 4096,
 };
 
+static const struct rvin_info rcar_info_r8a779g0 = {
+	.model = RCAR_GEN3,
+	.use_mc = true,
+	.use_isp = true,
+	.nv12 = true,
+	.max_width = 4096,
+	.max_height = 4096,
+};
+
 static const struct of_device_id rvin_of_id_table[] = {
 	{
 		.compatible = "renesas,vin-r8a774a1",
@@ -1368,6 +1377,10 @@ static const struct of_device_id rvin_of_id_table[] = {
 		.compatible = "renesas,vin-r8a779a0",
 		.data = &rcar_info_r8a779a0,
 	},
+	{
+		.compatible = "renesas,vin-r8a779g0",
+		.data = &rcar_info_r8a779g0,
+	},
 	{ /* Sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, rvin_of_id_table);
-- 
2.39.1

