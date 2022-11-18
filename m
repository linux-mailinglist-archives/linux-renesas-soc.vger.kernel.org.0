Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8201062F8C5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Nov 2022 16:04:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242164AbiKRPEE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Nov 2022 10:04:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242204AbiKRPDX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Nov 2022 10:03:23 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63D9897A86
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Nov 2022 07:01:10 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id a14so9671548wru.5
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Nov 2022 07:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aW7crbEbz284h73QkI0OBQRIGwa5lP2BQG4aFKW2hnI=;
        b=pcc6tk+f0fwfWJ7okzVw52gcRxUsw1/nvR5Rb4qgVqk2U78VdaNE1V9jlIodWMaUSt
         48u5VG25RqkZW8A90vJfPsHKTgvfiBBnlMkSoidAOjBdKR7mqb0MlzoTRld6U05+kn78
         33BiZ+xlNbW8M5pFpqFHeDgpeZBrYZeRnoUfw3GqFAsl8ewhLeUFI7kL4rl4HUsHsRPf
         WYTrAxCr+/O+caFcogDQLM3qO00vCMsuTEUQHjdzJOHXqpJhd9Qgs5mkmZWan7zDRWNk
         FM2G8riNWjePmwV1qpYRxWCvTZHYGTvgOwxu/la/NrX+ucNInGGUpR5DrYlctbczCuyX
         Q8Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aW7crbEbz284h73QkI0OBQRIGwa5lP2BQG4aFKW2hnI=;
        b=RjbxIBVfAKdRtFgEZi5ZqWPwiGx6ygfXnx7o5lmOuF7/u/c0IE22VP4mV8tNkqY8u6
         JP6SwSFfeodCg6iOpTY0KHRknijVSahjFG0EqPKt+nXqdT4dHHRuaL3b0oU0oAomj0C+
         qrzG8yHFop0z+KfSgtmD93vLCm7LjIwZTPMHXXTwCfGBPg2rZyYAKBnXOlwU1rFAuDWY
         4bJcWnf+m9cw8OLh2aEIV01UEsRe1hIGIEzGwWO2so2PghT5LePsoi7kjf7VlF/aYO2L
         vxVSCE2J6zthS9oTtAz2hTv0BMAgYvQwSse37fk9UZsL2dhmKyrFWs/6fYaU9gwGckwN
         fViA==
X-Gm-Message-State: ANoB5pnh1qpOV8TJpmWgBI3dQQjBYl43h+yaksNfmLKjfj7hmq2y74pd
        BVYdgMzbR66QV42oAJVBiqQE2kECnT4Gpg==
X-Google-Smtp-Source: AA0mqf4RCGVTJXtBV1U+MLwZRP8wDXP/fcyRno+YLZZulJvHKEGHUQKaYwEne9UdiqEf4yg5LmwgVA==
X-Received: by 2002:adf:fb01:0:b0:22e:6556:da75 with SMTP id c1-20020adffb01000000b0022e6556da75mr4687787wrr.653.1668783668925;
        Fri, 18 Nov 2022 07:01:08 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id x2-20020a1c7c02000000b003b4935f04a4sm5590190wmc.5.2022.11.18.07.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 07:01:08 -0800 (PST)
Date:   Fri, 18 Nov 2022 18:01:04 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     biju.das.jz@bp.renesas.com
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: [bug report] drm: rcar-du: Add RZ/G2L DSI driver
Message-ID: <Y3eeMGDxaLcRxu69@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Biju Das,

The patch 7a043f978ed1: "drm: rcar-du: Add RZ/G2L DSI driver" from
Sep 20, 2022, leads to the following Smatch static checker warning:

	drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c:372 rzg2l_mipi_dsi_set_display_timing()
	warn: uninitialized special assign 'vich1ppsetr |= (1 << 15)'

drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c
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

What if mipi_dsi_pixel_format_to_bpp() returns 16?

    368         }
    369 
    370         if ((dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE) &&
    371             !(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST))
--> 372                 vich1ppsetr |= VICH1PPSETR_TXESYNC_PULSE;
                        ^^^^^^^^^^^
Uninitialized.

    373 
    374         rzg2l_mipi_dsi_link_write(dsi, VICH1PPSETR, vich1ppsetr);

regards,
dan carpenter
