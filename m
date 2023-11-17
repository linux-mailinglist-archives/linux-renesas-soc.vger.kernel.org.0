Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8674D7EF673
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Nov 2023 17:44:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231793AbjKQQpB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Nov 2023 11:45:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231473AbjKQQo7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Nov 2023 11:44:59 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81D3010D5
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Nov 2023 08:44:55 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3316d3d11e1so377188f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Nov 2023 08:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20230601.gappssmtp.com; s=20230601; t=1700239494; x=1700844294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ViJzBZRjaGwQoSegbb0M2YrA8tvFsmfs+BtclsFM6Iw=;
        b=yc59Asu5dsxUDXwsCNPO2feuNhlmEkKtQFV3Nkyf/5dAVjlyTb2Y9dIfbHwdRQvQ3B
         6Ei0ynY4CLUt9d5N83otKNQKmyxe8HIVgOI9EHS+tjOikFI0rDCc1vG2e9hlVsOw286b
         48Su5hOIOlVAxMNdyVYrUCRbSUK49vKAfDM5SMdk4EJzdTDNxxEbcltwsTA4RhzJnp2p
         miWF32rG/3wXRmUkNJu9umD9aS3+i7tRchkcjudCixljYMMvgH/hvnRbYD3ktjcQ89tw
         6d6z5xige0DaExYmSwy5djDSUFQr++l3euX3LD/j8e/D2MWIW5O2EMZOV+O6vSh2lYaE
         6vwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700239494; x=1700844294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ViJzBZRjaGwQoSegbb0M2YrA8tvFsmfs+BtclsFM6Iw=;
        b=Sfh6HIILm9RKE2OYWCshlaa506GWwWAANZR99ISR8O2bP331YJLjF/PzxJ+1DpB1QW
         JZSVbwWk+bWI/e+qJhm/Nw31/09Y2ow4aHolx+u+aJsZncgTFVunOhR113K2kw1DdHMZ
         PCWQSmlDoofcR7kRYwAzU8OYIPSFVd8feU/zJJG1YP+61y/A7essk3I2iVFMrT04ugL5
         y76ASmqA4T64xUg9tXdPFpHnsSC4m0L6CX9LYtTSuQB2YNEeF72ZqC3Xoc3ie8/lFAEm
         S+gposIjbF30O3fHsflUkkE6m9R6Jw8Xg4BT0YXF6F6q38PgUgLviFyHsnf656vWD8OY
         zmbQ==
X-Gm-Message-State: AOJu0YwIFf8FAoLYTvcp3Nswg3C4ioMRqvGqquu81bDtDShoZy3v79vK
        okKc5bKOXwp/2BWr43I9sB6chA==
X-Google-Smtp-Source: AGHT+IELqDZJhNF3w4cCSF7Pe3KNy3G2/C2ag2xOQm2boFEouK1cJqrXmqQKscXXkk/+QTrSuuJpjA==
X-Received: by 2002:a5d:47ab:0:b0:31d:caae:982d with SMTP id 11-20020a5d47ab000000b0031dcaae982dmr5929283wrb.12.1700239494093;
        Fri, 17 Nov 2023 08:44:54 -0800 (PST)
Received: from sleipner.berto.se (p4fcc8a96.dip0.t-ipconnect.de. [79.204.138.150])
        by smtp.googlemail.com with ESMTPSA id y10-20020adfee0a000000b0032dcb08bf94sm2791947wrn.60.2023.11.17.08.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 08:44:53 -0800 (PST)
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
Subject: [net-next 1/5] net: ethernet: renesas: rcar_gen4_ptp: Remove incorrect comment
Date:   Fri, 17 Nov 2023 17:43:28 +0100
Message-ID: <20231117164332.354443-2-niklas.soderlund+renesas@ragnatech.se>
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

The comments intent was to indicates which function uses the enum. While
upstreaming rcar_gen4_ptp the function was renamed but this comment was
left with the old function name.

Instead of correcting the comment remove it, it adds little value.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
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

