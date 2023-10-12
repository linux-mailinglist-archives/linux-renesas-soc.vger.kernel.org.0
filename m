Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDE8E7C6E2A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Oct 2023 14:35:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235702AbjJLMfW convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Oct 2023 08:35:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235698AbjJLMfV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Oct 2023 08:35:21 -0400
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57D1BB7;
        Thu, 12 Oct 2023 05:35:19 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-59e88a28b98so7334767b3.1;
        Thu, 12 Oct 2023 05:35:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697114118; x=1697718918;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZNqyPohjCuzU12TG1w2zBV6Y85OUT4VT5oqC+OM6zBs=;
        b=ktNhkoV/p5pLvO71gJD1QmTW5cYofJXa2BOv5UfdCFG5WGUvKV7YLhskGi0VnfCldp
         lJ5z/lPY+SazOkHuEKVBjEvmSXKPmrQGxz3hzBeHQbKolDsuuKtwAjFrqV7u1iTVvBKT
         bIkkV/zvNMBnA4VXo3yxujo1aQ+CKyJwW4Qfxim5xDB/arvlUsmjcR7ej6QOptJ9B9IB
         +GyZdZ5DD4gwU/DfC/BjBDYZuU65AetROrOILteSyRymuhtpUnaHaWNyXW1ZVbsxSORG
         W7+UudFUi43oLXvw2ELDRuTPpVGdrKttWAEIE2dxC1KN/jyfQDeu6dZe05z8zcVjjJrf
         /dgw==
X-Gm-Message-State: AOJu0YxsB74iE4J92442p0SOq1RUfEiifeo8zPbVA3hIR5UMYRMU3T+L
        T0dHm+gYZmz1ccDUc9tCUjhKwX3cS764qg==
X-Google-Smtp-Source: AGHT+IEwMKB5Xj5w0UGWgB7JpNOCLxDzfyJOWMSHmmg6FnUoiW/Y1GZ+3E/qru8M6Ma7snWKf6ZAVg==
X-Received: by 2002:a05:690c:88c:b0:570:2542:cc9b with SMTP id cd12-20020a05690c088c00b005702542cc9bmr14333786ywb.18.1697114118315;
        Thu, 12 Oct 2023 05:35:18 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id v20-20020a81a554000000b005a2521fb26csm5792034ywg.99.2023.10.12.05.35.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Oct 2023 05:35:18 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-d9ac3b4f42cso501297276.0;
        Thu, 12 Oct 2023 05:35:18 -0700 (PDT)
X-Received: by 2002:a25:24d5:0:b0:d9a:4178:70d5 with SMTP id
 k204-20020a2524d5000000b00d9a417870d5mr5373929ybk.6.1697114117802; Thu, 12
 Oct 2023 05:35:17 -0700 (PDT)
MIME-Version: 1.0
References: <20231012121618.267315-1-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20231012121618.267315-1-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 12 Oct 2023 14:35:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWAk9kJBGGq9K-RnC0HFZk1XbaosTBO2OW1kpYFPh1Mqg@mail.gmail.com>
Message-ID: <CAMuHMdWAk9kJBGGq9K-RnC0HFZk1XbaosTBO2OW1kpYFPh1Mqg@mail.gmail.com>
Subject: Re: [PATCH net-next] rswitch: Add PM ops
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Thu, Oct 12, 2023 at 2:16 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Add PM ops for Suspend to Idle. When the system suspended,
> the Ethernet Serdes's clock will be stopped. So, this driver needs
> to re-initialize the Ethernet Serdes by phy_init() in
> renesas_eth_sw_resume(). Otherwise, timeout happened in phy_power_on().
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for your patch!

> --- a/drivers/net/ethernet/renesas/rswitch.c
> +++ b/drivers/net/ethernet/renesas/rswitch.c
> @@ -17,6 +17,7 @@
>  #include <linux/of_net.h>
>  #include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/rtnetlink.h>
>  #include <linux/slab.h>
> @@ -1315,6 +1316,7 @@ static int rswitch_phy_device_init(struct rswitch_device *rdev)
>         if (!phydev)
>                 goto out;
>         __set_bit(rdev->etha->phy_interface, phydev->host_interfaces);
> +       phydev->mac_managed_pm = true;
>
>         phydev = of_phy_connect(rdev->ndev, phy, rswitch_adjust_link, 0,
>                                 rdev->etha->phy_interface);
> @@ -1991,11 +1993,52 @@ static void renesas_eth_sw_remove(struct platform_device *pdev)
>         platform_set_drvdata(pdev, NULL);
>  }
>
> +static int __maybe_unused renesas_eth_sw_suspend(struct device *dev)
> +{
> +       struct rswitch_private *priv = dev_get_drvdata(dev);
> +       struct net_device *ndev;
> +       int i;

unsigned int (also below)

> +
> +       rswitch_for_each_enabled_port(priv, i) {
> +               ndev = priv->rdev[i]->ndev;
> +               if (netif_running(ndev)) {
> +                       netif_device_detach(ndev);
> +                       rswitch_stop(ndev);
> +               }
> +               if (priv->rdev[i]->serdes->init_count)
> +                       phy_exit(priv->rdev[i]->serdes);

If !init_count, the PHY was not initialized before suspending? ...

> +       }
> +
> +       return 0;
> +}
> +
> +static int __maybe_unused renesas_eth_sw_resume(struct device *dev)
> +{
> +       struct rswitch_private *priv = dev_get_drvdata(dev);
> +       struct net_device *ndev;
> +       int i;
> +
> +       rswitch_for_each_enabled_port(priv, i) {
> +               phy_init(priv->rdev[i]->serdes);

... while it is always initialized after resuming? Is that intentional,
or should the pre-suspend state be preserved?

> +               ndev = priv->rdev[i]->ndev;
> +               if (netif_running(ndev)) {
> +                       rswitch_open(ndev);
> +                       netif_device_attach(ndev);
> +               }
> +       }
> +
> +       return 0;
> +}
> +
> +static SIMPLE_DEV_PM_OPS(renesas_eth_sw_pm_ops, renesas_eth_sw_suspend,
> +                        renesas_eth_sw_resume);

Please use DEFINE_SIMPLE_DEV_PM_OPS() instead, so you can drop the
__maybe_unused tags from the callbacks.

> +
>  static struct platform_driver renesas_eth_sw_driver_platform = {
>         .probe = renesas_eth_sw_probe,
>         .remove_new = renesas_eth_sw_remove,
>         .driver = {
>                 .name = "renesas_eth_sw",
> +               .pm = &renesas_eth_sw_pm_ops,

pm_sleep_ptr(...)

>                 .of_match_table = renesas_eth_sw_of_table,
>         }
>  };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
