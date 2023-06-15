Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5661F730F20
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Jun 2023 08:14:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231225AbjFOGOJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Jun 2023 02:14:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230254AbjFOGOI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Jun 2023 02:14:08 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8764D1FC2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jun 2023 23:14:07 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-311099fac92so1486017f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jun 2023 23:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686809646; x=1689401646;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WdsHhQK1uaCSfzirPyK3mBjPgwnQ/tmTYblwYtJ7LDM=;
        b=ZSEZKfy/xVu6odC+3YOUUhSXr8JGdH3mGnuyStk6faQJVuiTACF0WZ5K9xZiNUj7Fx
         yg25uUeF5pXoG5xURZPHbl9pRt1UVP/mabCtq4vPeez/nNBDa4Vc0UwnQ2y2f7V6Lxnr
         +erFMofpilhdpZvzz+b+N+3+bjxKo/2GG99BPl+SyBOeg/v0fP/IqdqpNqKiYAgU7O1x
         sM7bEbbPO7Y4hI75ZTH/QHIVlZTVSvI2PBeYQR4HtZQGKq3DZ8evDLFcrqwRjObntDCZ
         aP5GpmmWWRaMC6dlNlur68k0NP69hkldOXk8oNVUKrtetY7sRr27LWp4js+OEjKi7/Nv
         1X4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686809646; x=1689401646;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WdsHhQK1uaCSfzirPyK3mBjPgwnQ/tmTYblwYtJ7LDM=;
        b=erO6uKvTYeXDIziYq5TxBBo1A2iWMSJD3iFFA4AzRI46tiipS92mr6UxVijxHzAHm8
         dcZpUzA1692bPW8Z0T8WPMA/GQTp09jR85MjZQr5AT6TWbhXY5gxR7bga8QDI9cJNwSK
         teMp7clyScSkyaYnsZa8KoVSob+ob8/YAUAxp6bbf1JCl/bJzvnyryrkgvXckxyGfbxW
         HLJKK7M2OKp5ChVWEQSwfVj79UTMqQLRrBXyfKNf2HG5S390FUX8YPQC9Kj6vmj1qPOu
         wKzH0NgINIftv6VGFncM61zR6a/4daPS+gQfePLMiE7jQ0EWT+TN+54l3Ef0eGxIkS0r
         WY6w==
X-Gm-Message-State: AC+VfDxD5s5ZVFK+L3Q5wVOLDsS0Yfw6P2eZ03wDZsrflVnXwc7IE1Sa
        NRTB4U20MDRWZs4s3q80Bzp/CMStbMEVcddOQTY=
X-Google-Smtp-Source: ACHHUZ5fDeLiQnTsx4qCMG0mWethyjOrWIic6kS/P7qiaD9HAKjO083blX+XeDqGzImO+kDbT0NGcw==
X-Received: by 2002:adf:db03:0:b0:311:17c5:3a9a with SMTP id s3-20020adfdb03000000b0031117c53a9amr331253wri.38.1686809645963;
        Wed, 14 Jun 2023 23:14:05 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id f9-20020a5d6649000000b0030f9dc63ff1sm18053283wrw.88.2023.06.14.23.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 23:14:04 -0700 (PDT)
Date:   Thu, 15 Jun 2023 09:14:00 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     biju.das.jz@bp.renesas.com
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [bug report] drm: rcar-du: Add RZ/G2L DSI driver
Message-ID: <05ac5099-b1f6-4f83-950a-ae02fc47eda1@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Biju Das,

The patch 7a043f978ed1: "drm: rcar-du: Add RZ/G2L DSI driver" from
Sep 20, 2022, leads to the following Smatch static checker warning:

	drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi.c:374 rzg2l_mipi_dsi_set_display_timing()
	error: uninitialized symbol 'vich1ppsetr'.

drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi.c
    347 static void rzg2l_mipi_dsi_set_display_timing(struct rzg2l_mipi_dsi *dsi,
    348                                               const struct drm_display_mode *mode)
    349 {
    350         u32 vich1ppsetr;
    351         u32 vich1vssetr;
    352         u32 vich1vpsetr;
    353         u32 vich1hssetr;
    354         u32 vich1hpsetr;
    355         int dsi_format;
    356         u32 delay[2];
    357         u8 index;
    358 
    359         /* Configuration for Pixel Packet */
    360         dsi_format = mipi_dsi_pixel_format_to_bpp(dsi->format);
    361         switch (dsi_format) {
    362         case 24:
    363                 vich1ppsetr = VICH1PPSETR_DT_RGB24;
    364                 break;
    365         case 18:
    366                 vich1ppsetr = VICH1PPSETR_DT_RGB18;
    367                 break;

mipi_dsi_pixel_format_to_bpp() also returns 16 and -EIVNAL.

    368         }
    369 
    370         if ((dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE) &&
    371             !(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST))
    372                 vich1ppsetr |= VICH1PPSETR_TXESYNC_PULSE;
    373 
--> 374         rzg2l_mipi_dsi_link_write(dsi, VICH1PPSETR, vich1ppsetr);
                                                            ^^^^^^^^^^^
Static checker uninitialized variable warning.

    375 
    376         /* Configuration for Video Parameters */
    377         vich1vssetr = VICH1VSSETR_VACTIVE(mode->vdisplay) |
    378                       VICH1VSSETR_VSA(mode->vsync_end - mode->vsync_start);
    379         vich1vssetr |= (mode->flags & DRM_MODE_FLAG_PVSYNC) ?

regards,
dan carpenter
