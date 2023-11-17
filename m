Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01B5D7EF676
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Nov 2023 17:45:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231473AbjKQQpE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Nov 2023 11:45:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235707AbjKQQpC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Nov 2023 11:45:02 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C920EA4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Nov 2023 08:44:58 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-5094cb3a036so3267645e87.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Nov 2023 08:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20230601.gappssmtp.com; s=20230601; t=1700239497; x=1700844297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XdcFTkjJJKdk2tWc8kj9ugAu+k+ZjoJk+1mRNKldi1E=;
        b=aSgYT9J5L7HzzuU/AEnOMWA1dxngjgQZBZjqEk8QZr9YVQsZahtX1h/xhYmlCSIb0z
         uhDupq+nnQaLTVQ/FSaWJwBW+zFoVGb2QDQMsx0Mb4XyqNZmJ5ggW0hy4NF9cxidZdi3
         3iodB/uDpVriWXQWVPgylIpjNou+c/+kCnazVXtRuo/vnHbFslVdk/6yEarpGPJSkJSt
         DYcM7IdqhKAI3znLiUF4JWBPpFX8gquHS4AGeVzLo3QfmFJ0L7NqUfoHQo7GZTCIEpDP
         p6rp0pGxGxVLeMbjjLTfsFeh8kVO8fCA80l7BTlMaKPsPA75Kl0BJWiEb2+k9aRQy6t3
         KA7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700239497; x=1700844297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XdcFTkjJJKdk2tWc8kj9ugAu+k+ZjoJk+1mRNKldi1E=;
        b=OcWnoNwkzHWTDz7gcbk3R3xj5JkhHCop8puRgxPtmcatSfYMwyRnP8XURFDv0mYWgc
         lj96f/Wx0MKhViLlPmJbwgkElCu8Z2QzcpGhm9xusMEN4Cwj5WjzsaTVcjfyK7WGJ+Ee
         7VlFM7BcgXBcKCEBOMLfYCwMZWXD/byE8+LnQADZuk5je7C9djPiVwp8eua/NGqk6oPd
         plRon+WyI9QtKfwlP4Ul4cY3QrjteSL6k9sQEPTvC6g1v/GGR/SJrTNv2msRQJ/zqu5n
         UzeEphPTv8AUOPgIg2VZ0G6x7RmIpzZGIanXUNGppMIAx43lXR2TeFNx+daS0eBoAeMW
         Oe7g==
X-Gm-Message-State: AOJu0YwimQ0wM6zvFhnciTFs9tqXSnOl4INvWXw/FpKyVw1q8NmSzx7K
        O6P+PShTZw7Zn7NQ0o3VnhfCbA==
X-Google-Smtp-Source: AGHT+IElGFJq6FDin3q1ZNiLN21lTleD22/7v7lYF9GaOGz9+SBbC/qO6c8vYYQwfr8nmi5zNRCp4g==
X-Received: by 2002:a05:6512:358f:b0:502:a4f4:ced9 with SMTP id m15-20020a056512358f00b00502a4f4ced9mr52784lfr.62.1700239496893;
        Fri, 17 Nov 2023 08:44:56 -0800 (PST)
Received: from sleipner.berto.se (p4fcc8a96.dip0.t-ipconnect.de. [79.204.138.150])
        by smtp.googlemail.com with ESMTPSA id y10-20020adfee0a000000b0032dcb08bf94sm2791947wrn.60.2023.11.17.08.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 08:44:56 -0800 (PST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Richard Cochran <richardcochran@gmail.com>,
        netdev@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [net-next 4/5] net: ethernet: renesas: rcar_gen4_ptp: Add V4H clock setting
Date:   Fri, 17 Nov 2023 17:43:31 +0100
Message-ID: <20231117164332.354443-5-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231117164332.354443-1-niklas.soderlund+renesas@ragnatech.se>
References: <20231117164332.354443-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The gPTP clock is different between R-Car S4 and R-Car V4H. In
preparation of adding R-Car V4H support define the clock setting.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/net/ethernet/renesas/rcar_gen4_ptp.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rcar_gen4_ptp.h b/drivers/net/ethernet/renesas/rcar_gen4_ptp.h
index 35664d1dc472..b83a209e9845 100644
--- a/drivers/net/ethernet/renesas/rcar_gen4_ptp.h
+++ b/drivers/net/ethernet/renesas/rcar_gen4_ptp.h
@@ -9,8 +9,12 @@
 
 #include <linux/ptp_clock_kernel.h>
 
-#define PTPTIVC_INIT			0x19000000	/* 320MHz */
-#define RCAR_GEN4_PTP_CLOCK_S4		PTPTIVC_INIT
+#define PTPTIVC_INIT_200MHZ		0x28000000	/* 200MHz */
+#define PTPTIVC_INIT_320MHZ		0x19000000	/* 320MHz */
+
+#define RCAR_GEN4_PTP_CLOCK_S4		PTPTIVC_INIT_320MHZ
+#define RCAR_GEN4_PTP_CLOCK_V4H		PTPTIVC_INIT_200MHZ
+
 #define RCAR_GEN4_GPTP_OFFSET_S4	0x00018000
 
 enum rcar_gen4_ptp_reg_layout {
-- 
2.42.1

