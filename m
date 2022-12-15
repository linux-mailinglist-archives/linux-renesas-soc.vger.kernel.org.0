Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08A2564D96A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Dec 2022 11:21:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229670AbiLOKVI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Dec 2022 05:21:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbiLOKVH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Dec 2022 05:21:07 -0500
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40EE01D66E;
        Thu, 15 Dec 2022 02:21:06 -0800 (PST)
Received: by mail-qt1-f172.google.com with SMTP id a16so4726688qtw.10;
        Thu, 15 Dec 2022 02:21:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BtKIga+7tS2ldUqERSas9nfEnrjTs0TXoHYm0Gn38rY=;
        b=dgu1tqSGtSgLXMeLJ6HVvW3gp9KpuIf5pziACOG8cyZIxFcb+Ql3EyekceouQGvnXC
         GBNNc1PkSGenb8NhimA9j3aK6ynhlT/Ukyi2joozA13GuduVwpaYVz89J1y9uyU/P2BS
         1KSRTyC0zM236YciBzTDqBjEbtxzHgtZhdH/KyUVv8nkvBgfmvdV0IOsdBYyGxtZwUtV
         ed22J7PfP/czHf7BnUHQao5EAiCHGxWHv1OgsJ4vsDOCoRN1OIJc2X+lm3mhZjksQWBI
         seYuwb3H/pChjBFzuawt0wJRiz+nQuEDq1uXqNu69ysCYzIm9JprW+7ShmgZapESJyIj
         FMzw==
X-Gm-Message-State: ANoB5pnsQXlhFmor22zWPs+7DOHGAgtfIIlalqEygu3IkYxdJ6WjiFSR
        oTO19v/GniJu0vMbtAHbOi2Hz1RsVjSB3g==
X-Google-Smtp-Source: AA0mqf5OnvflUtBh/q8mxsTUJ6nG3JT85F5OPNwLChnLVbKZUFvT+saUWBeSItYGbuD59LEGeeGnQA==
X-Received: by 2002:ac8:44a5:0:b0:3a8:12b3:a9b0 with SMTP id a5-20020ac844a5000000b003a812b3a9b0mr13539798qto.38.1671099664953;
        Thu, 15 Dec 2022 02:21:04 -0800 (PST)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id d18-20020ac847d2000000b003a54a19c550sm3210434qtr.57.2022.12.15.02.21.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Dec 2022 02:21:04 -0800 (PST)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-3c090251d59so35083497b3.4;
        Thu, 15 Dec 2022 02:21:04 -0800 (PST)
X-Received: by 2002:a0d:cb4c:0:b0:38e:e541:d8ca with SMTP id
 n73-20020a0dcb4c000000b0038ee541d8camr23931644ywd.283.1671099664112; Thu, 15
 Dec 2022 02:21:04 -0800 (PST)
MIME-Version: 1.0
References: <20221212172804.1277751-1-biju.das.jz@bp.renesas.com> <20221212172804.1277751-7-biju.das.jz@bp.renesas.com>
In-Reply-To: <20221212172804.1277751-7-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 15 Dec 2022 11:20:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUxS8RigL0uPNhzX9rYTQb0PpNp-Ci-kkaM8+CQgHwPzg@mail.gmail.com>
Message-ID: <CAMuHMdUxS8RigL0uPNhzX9rYTQb0PpNp-Ci-kkaM8+CQgHwPzg@mail.gmail.com>
Subject: Re: [PATCH 06/16] usb: host: xhci-plat: Add reset support
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Justin Chen <justinpopo6@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

CC Justin

On Mon, Dec 12, 2022 at 6:28 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add optional reset support. This is in preparation to adding USB xHCI
> support for RZ/V2M SoC.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>\

Thanks for your patch!

> --- a/drivers/usb/host/xhci-plat.c
> +++ b/drivers/usb/host/xhci-plat.c
> @@ -19,6 +19,7 @@
>  #include <linux/slab.h>
>  #include <linux/acpi.h>
>  #include <linux/usb/of.h>
> +#include <linux/reset.h>
>
>  #include "xhci.h"
>  #include "xhci-plat.h"
> @@ -263,10 +264,20 @@ static int xhci_plat_probe(struct platform_device *pdev)
>                 goto put_hcd;
>         }
>
> -       ret = clk_prepare_enable(xhci->reg_clk);
> +       xhci->reset = devm_reset_control_array_get_optional_shared(&pdev->dev);
> +       if (IS_ERR(xhci->reset)) {
> +               ret = PTR_ERR(xhci->reset);
> +               goto put_hcd;
> +       }
> +
> +       ret = reset_control_deassert(xhci->reset);
>         if (ret)
>                 goto put_hcd;
>
> +       ret = clk_prepare_enable(xhci->reg_clk);
> +       if (ret)
> +               goto err_reset;
> +
>         ret = clk_prepare_enable(xhci->clk);
>         if (ret)
>                 goto disable_reg_clk;
> @@ -377,6 +388,9 @@ static int xhci_plat_probe(struct platform_device *pdev)
>  disable_reg_clk:
>         clk_disable_unprepare(xhci->reg_clk);
>
> +err_reset:
> +       reset_control_assert(xhci->reset);
> +
>  put_hcd:
>         usb_put_hcd(hcd);
>
> @@ -412,6 +426,7 @@ static int xhci_plat_remove(struct platform_device *dev)
>
>         clk_disable_unprepare(clk);
>         clk_disable_unprepare(reg_clk);
> +       reset_control_assert(xhci->reset);
>         usb_put_hcd(hcd);
>
>         pm_runtime_disable(&dev->dev);

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Just wondering if the reset should be (de)asserted in the suspend/resume
path, too.  But that can only affect the Broadcom STB platforms, which
probably don't have the resets property.  I can't check as there no users
in upstream DTS.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
