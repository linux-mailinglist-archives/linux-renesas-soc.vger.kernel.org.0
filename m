Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 187B452BC63
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 May 2022 16:16:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238294AbiERNsB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 May 2022 09:48:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238078AbiERNr6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 May 2022 09:47:58 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A40341A8E01
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 May 2022 06:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1652881675;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=u2KtS7a0V1qX4x/uzAxmwYggLko6jxdiXgkpP8ZKnHE=;
        b=AVUdj26/DQbehIkya799bh1cHf+UVWthFfi2STr2/I2RcbijzQIDM+2p3d2Y0b/Qa1cfTJ
        GNbKxKXLj12oSPNVJTS2q3BzVo+sEyZYk8mcMtSRSCzLmsJBOmyN05Psxjw5aW3M09r/JK
        JgEqEW4Xp8YDVnrP+iSrlXJER6+o9R0=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-509-YWzfW6NUNM6N-2tMEJ4m0g-1; Wed, 18 May 2022 09:47:54 -0400
X-MC-Unique: YWzfW6NUNM6N-2tMEJ4m0g-1
Received: by mail-qt1-f199.google.com with SMTP id cn8-20020a05622a248800b002f3c7be2744so1672174qtb.17
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 May 2022 06:47:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u2KtS7a0V1qX4x/uzAxmwYggLko6jxdiXgkpP8ZKnHE=;
        b=aqC57aUHCMVpRvPaRbx1+5O+ECRPX/dIWu7w96QUKqPsiRbEILDET6BcVofL1M/uHR
         wPIgqwMguX6iTR0bNgd8sg7+O4lVGY4kkU51MID2A16tqib5yLmxx+kzb4qRtWZEOpNr
         JEqVKMr/w4y649pAzyzc4JJeDPVQyr84UTZznrv4RoH5pP1nf2CE5gnGILq6+bztD5V0
         3oycb5MUxsoabR9HVk7cGJBTvTap95VALMOC4dWWbxATGls5PURxrZIA6KFVbymLGIzC
         P2AIEt+G6dDsn4W7yTmPI69MhUXVgJKJwU/npihUsd19mO8vvM4Wv7MERdS19ECtpfME
         jtlg==
X-Gm-Message-State: AOAM5333ax78fjUhzwCRptpCksh8hYoKb1Pq67oMAtqQNmrAiljyXHIw
        CCbYMaz80M3tjvct7ycXwjpnIm1AAY0bLG4y3wznSnSRm7xUCyp4ymJLb5FdKEH27Y78Nd2ETan
        FXR0FS4AWo2PnNEdCcxa+cgQjOfqtV3k=
X-Received: by 2002:a05:6214:f29:b0:461:cf47:63eb with SMTP id iw9-20020a0562140f2900b00461cf4763ebmr12894738qvb.70.1652881673954;
        Wed, 18 May 2022 06:47:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxtgXvKlLmGN2occDj9JylwKZjwpVnZVseYzumo/m3mhT0POXGLcciAWfqMEDj6vc6Lg/6L8g==
X-Received: by 2002:a05:6214:f29:b0:461:cf47:63eb with SMTP id iw9-20020a0562140f2900b00461cf4763ebmr12894720qvb.70.1652881673798;
        Wed, 18 May 2022 06:47:53 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id he30-20020a05622a601e00b002f39b99f678sm1207547qtb.18.2022.05.18.06.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 06:47:53 -0700 (PDT)
From:   Tom Rix <trix@redhat.com>
To:     miquel.raynal@bootlin.com, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, nathan@kernel.org,
        ndesaulniers@google.com
Cc:     linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] rtc: rzn1: initialize val in rzn1_rtc_set_offset
Date:   Wed, 18 May 2022 09:47:47 -0400
Message-Id: <20220518134747.3215597-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The clang build fails with
rtc-rzn1.c:291:3: error: variable 'val' is uninitialized when used here [-Werror,-Wuninitialized]
  val |= RZN1_RTC_SUBU_DEV;
  ^~~

The val variable in rzn1_rtc_set_offset() is never initialized so
the series of |= operations in the function will start with a
garbage value.  So initialize val to 0.

Fixes: be4a11cf98af ("rtc: rzn1: Add oscillator offset support")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/rtc/rtc-rzn1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index 980ade8c9601..0b4bf6e43464 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -272,7 +272,7 @@ static int rzn1_rtc_set_offset(struct device *dev, long offset)
 	struct rzn1_rtc *rtc = dev_get_drvdata(dev);
 	unsigned int steps;
 	int stepsh, stepsl;
-	u32 val;
+	u32 val = 0;
 	int ret;
 
 	/*
-- 
2.27.0

