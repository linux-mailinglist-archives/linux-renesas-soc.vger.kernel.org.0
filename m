Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4EB937F965
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 May 2021 16:09:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234283AbhEMOKx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 13 May 2021 10:10:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234249AbhEMOKu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 May 2021 10:10:50 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FA98C061574
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 May 2021 07:09:35 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id c22so11944998ejd.12
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 May 2021 07:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=os0gwvcIB8jQ2W2z4OsvUDzmQJYsbFc6OFygRene42k=;
        b=WpOIvvANYadLOGuUN6UbRaMyFbTIsocQE3yAnIwTfBy4ijhgbZ7N2hKAjJjdMxNXid
         H8KgrKlpqqDKK63KQ98q9rly556NTTINFIRfE4ZHSI3132WvAVZaQp5QqA++/yuanqFo
         cshuiSNxGlqxnPBpthgFAVEwTMX/XXnClgiz8Y7lzpp3dZ48lMsBH54YnPOEhc1ggXmD
         br1+hHruA1HSemmcx/jCuvwGi9ueExJA5FoHEE8pWNhax/Wdc5PpsVq6QSZI/lyvOt2a
         4F2IbpfRwCXhJQbuWmRxKjXyAKZI9bAL/HOYHE2F6Cj107Z2W8yQ5gYuGJsON62614Mi
         qW7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=os0gwvcIB8jQ2W2z4OsvUDzmQJYsbFc6OFygRene42k=;
        b=lA9i6ptKj1Is0bMkf3K0c45qlVjQsldoCtlS+u/b3Do+OxScxRfJrwHNQj31Uw+4aD
         /qT/v13IUXfM9gIUytgxU6szzPe7XSui8bLD6H+3U13wxSya3qiCwShycvFcS/rIaU2i
         CSpGmFgGxCBXiS3atD383JLX38aQg+QhNpGY0jmpH9YX2ujMUtc4jdZb6+KAKL/JmZng
         YlNcAau2U0kyYFuOGkA3qrXq+MCZlObR4WSZKU3LEjeOA0k23TbtZBaRn08sPZCn/kQu
         RoaY/fP3xmvOxbUj/SjK4dzKZ8Z7IAdG4Xo6wtElBa2kmJSb9In3x8pedlaYtIpvIkwz
         +zlw==
X-Gm-Message-State: AOAM533n1Ru3kcsbkfBQUJsnx0+h6ZSPd0SfwK2EJKxtfkUrrd4iGmTB
        uz+ifGiF/GctQrwT+ksjXsKgPQ==
X-Google-Smtp-Source: ABdhPJyitAYYxib/EakSz8xW3ABcwFb5+NtzOwyup2wyQ44aUwAxpw+BVUh0+c2cRXGgCG2kwsL2BA==
X-Received: by 2002:a17:906:fcd6:: with SMTP id qx22mr44080281ejb.529.1620914974261;
        Thu, 13 May 2021 07:09:34 -0700 (PDT)
Received: from bismarck.berto.se (p54ac5521.dip0.t-ipconnect.de. [84.172.85.33])
        by smtp.googlemail.com with ESMTPSA id r17sm2402632edt.33.2021.05.13.07.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 May 2021 07:09:33 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        LUU HOAI <hoai.luu.ub@renesas.com>
Subject: [PATCH v2] media: rcar-csi2: Enable support for r8a77961
Date:   Thu, 13 May 2021 16:09:14 +0200
Message-Id: <20210513140914.742677-1-niklas.soderlund+renesas@ragnatech.se>
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
* Changes since v1
- Do not piggy back on the M3-W (r8a7796) quirks as they are different.
---
 drivers/media/platform/rcar-vin/rcar-csi2.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
index e06cd512aba207a4..a59113cd46db0380 100644
--- a/drivers/media/platform/rcar-vin/rcar-csi2.c
+++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
@@ -1112,6 +1112,11 @@ static const struct rcar_csi2_info rcar_csi2_info_r8a7796 = {
 	.num_channels = 4,
 };
 
+static const struct rcar_csi2_info rcar_csi2_info_r8a77961 = {
+	.hsfreqrange = hsfreqrange_m3w_h3es1,
+	.num_channels = 4,
+};
+
 static const struct rcar_csi2_info rcar_csi2_info_r8a77965 = {
 	.init_phtw = rcsi2_init_phtw_h3_v3h_m3n,
 	.hsfreqrange = hsfreqrange_h3_v3h_m3n,
@@ -1164,6 +1169,10 @@ static const struct of_device_id rcar_csi2_of_table[] = {
 		.compatible = "renesas,r8a7796-csi2",
 		.data = &rcar_csi2_info_r8a7796,
 	},
+	{
+		.compatible = "renesas,r8a77961-csi2",
+		.data = &rcar_csi2_info_r8a77961,
+	},
 	{
 		.compatible = "renesas,r8a77965-csi2",
 		.data = &rcar_csi2_info_r8a77965,
-- 
2.31.1

