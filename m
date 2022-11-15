Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0D486299CF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Nov 2022 14:15:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230348AbiKONO6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Nov 2022 08:14:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230293AbiKONO6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Nov 2022 08:14:58 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2C06BA
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Nov 2022 05:14:56 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id bs21so24200085wrb.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Nov 2022 05:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+uOhXJNPsCrNtfS+VTjqltkzY3mquo9TauaFpGO0FGI=;
        b=JNEh6uNdhbc1tR6+IfmAREevcDwJ7LU8mflg0QQ5kh16Rpw2huSGkphDn7LySE03Kd
         VsINbZ8dPod+mJCbvpbg/gWDAXD7KIwxH9ahz3uKzYgzr/Hb0sK4pz6f4UaMCoPEFhnk
         DemzHCSn2EEoYyDYRdsvGcsc8rQ3+a1xXh5NY7Z48aJQdh3k984/8cVeoaLxcJxIk34Z
         u/J7MfOmB8P2OY74f32JO5qT+do3/ih8NY9pJpqHlH+JKqFWRWLSQmxRWgyJXc2jGvDy
         DroViXcZBQOeeOFI6En6g5OMDS+mLPWWE8HnjSqjhmkQ3SRpGNIk8FdHnsYkcsbqZPm3
         oOaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+uOhXJNPsCrNtfS+VTjqltkzY3mquo9TauaFpGO0FGI=;
        b=Jpiu3W7PJFijzRjBNxAlo73PPG670n8GhAYZhjfDxEmXJTnObldE0kJ9LSXeYfMxnB
         HMmh1XP8AO6xgghxg377rxKIRRuWdLyXCf7IyYM8e4Zbk+/6HNjnYsiik973OgmQE09X
         qvGKUe+LcHXhuT5YVcCMlcVxHve8ZExTHaqlG1YgrZFDEUV0emXGUONTxdOcAf+DcYTn
         q/NJ59rmnFir2EvkgKaFWbTQGkgydA6G5AP+S6mxhIfTJRbejZglDXl+eQKibb+swz1Q
         YcAt4r5qvykCul1dchSMdl3nS9x3YU6MVt9wMclQ1iotNDc3T+8EqeZJo+mYCu+t2xk7
         J22g==
X-Gm-Message-State: ANoB5plBv+cxUfbkfLiujVrwQ6fMzCe1AGJbepG+XuqBf9+ZIRKcbq1I
        XdQVbdreo7m0tGXNcis76Ys=
X-Google-Smtp-Source: AA0mqf7QvO2kKaFuaIRhDgHrjaHcUMwdh6bvbyhX7WDVmdshHLwxjDp5JBWgOsaCBXW9SwOsA43gIw==
X-Received: by 2002:a5d:484c:0:b0:22e:3ebc:7074 with SMTP id n12-20020a5d484c000000b0022e3ebc7074mr10899393wrs.354.1668518095246;
        Tue, 15 Nov 2022 05:14:55 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id y15-20020a5d614f000000b0022ae401e9e0sm12721118wrt.78.2022.11.15.05.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 05:14:54 -0800 (PST)
Date:   Tue, 15 Nov 2022 16:14:50 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     yoshihiro.shimoda.uh@renesas.com
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [bug report] net: ethernet: renesas: Add support for "Ethernet
 Switch"
Message-ID: <Y3OQysxE+f/AmI3y@kili>
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

Hello Yoshihiro Shimoda,

The patch 3590918b5d07: "net: ethernet: renesas: Add support for
"Ethernet Switch"" from Oct 31, 2022, leads to the following Smatch
static checker warning:

	drivers/net/ethernet/renesas/rswitch.c:1717 rswitch_init()
	warn: '%pM' cannot be followed by 'n'

drivers/net/ethernet/renesas/rswitch.c
    1706 
    1707         for (i = 0; i < RSWITCH_NUM_PORTS; i++) {
    1708                 err = register_netdev(priv->rdev[i]->ndev);
    1709                 if (err) {
    1710                         for (i--; i >= 0; i--)
    1711                                 unregister_netdev(priv->rdev[i]->ndev);
    1712                         goto err_register_netdev;
    1713                 }
    1714         }
    1715 
    1716         for (i = 0; i < RSWITCH_NUM_PORTS; i++)
--> 1717                 netdev_info(priv->rdev[i]->ndev, "MAC address %pMn",
                                                                          ^
This 'n' doesn't make sense.  See mac_address_string() for more details.

    1718                             priv->rdev[i]->ndev->dev_addr);
    1719 
    1720         return 0;
    1721 
    1722 err_register_netdev:
    1723         rswitch_ether_port_deinit_all(priv);
    1724 
    1725 err_ether_port_init_all:
    1726         rswitch_gwca_hw_deinit(priv);
    1727 
    1728 err_gwca_hw_init:
    1729 err_gwca_request_irq:
    1730         rcar_gen4_ptp_unregister(priv->ptp_priv);
    1731 
    1732 err_ptp_register:
    1733         for (i = 0; i < RSWITCH_NUM_PORTS; i++)
    1734                 rswitch_device_free(priv, i);
    1735 
    1736 err_device_alloc:
    1737         rswitch_gwca_desc_free(priv);
    1738 
    1739         return err;
    1740 }

regards,
dan carpenter

