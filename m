Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F82E4EEF0E
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Apr 2022 16:13:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240841AbiDAOPM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 1 Apr 2022 10:15:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239647AbiDAOPK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Apr 2022 10:15:10 -0400
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BDCF23E;
        Fri,  1 Apr 2022 07:13:21 -0700 (PDT)
Received: by mail-qv1-f45.google.com with SMTP id b17so2073470qvf.12;
        Fri, 01 Apr 2022 07:13:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CTsOmGLvmqzpOv002gjSr2lz79mMtLP+VJWb8ZzlWPk=;
        b=5nWzvYWJAN8NgbgL06S24lgNoSrpA+0a/smoZULIM8WNQSBe/xm9lwrFVTJkUkGqRY
         V1nlHnIOb8uYG0smqdVxUrUEgx4KUO1itCp01u2pj0EbMtJlUtiBe8n8Z+SrdM8xLQ/s
         wARryIPZOVhcCvv6ADtfg58JNRpHwVdj6OFu/d/cQzjhfwA5Uo5bALAWQd/TBOxHptbh
         CoLxTBI+JCnsKVaCccIxXCUIy8u1/2CgvqwGEHPNC/3wFPLwBpUjNc7BW5T0YSpzM+a/
         QtDxyzGqCDZjgVMPXUj7ap67EVbXfDk5whLJ5LUbyyBm11r/EKuhGFa01CD93jufk9TY
         1Gdw==
X-Gm-Message-State: AOAM532vUpJAn3VqjoAbw83XO9DkkJODNjw3ivUrAcGAHQqUxFMlAZph
        i6T8Tmglp9zYIeDyTL5sd5PYs3NKDXBInw==
X-Google-Smtp-Source: ABdhPJxuq2KnP51/NuuL8nvdFdNu60ulnBfUZd5dCB6RI8oRJYzutIU90EpnUOrxlyKD1aj1c3GwKg==
X-Received: by 2002:a05:6214:d82:b0:443:7f61:7434 with SMTP id e2-20020a0562140d8200b004437f617434mr14985691qve.86.1648822400529;
        Fri, 01 Apr 2022 07:13:20 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id i17-20020a05620a145100b0067dd2587bddsm1321574qkl.24.2022.04.01.07.13.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Apr 2022 07:13:20 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id f23so5231142ybj.7;
        Fri, 01 Apr 2022 07:13:20 -0700 (PDT)
X-Received: by 2002:a5b:a8f:0:b0:633:fd57:f587 with SMTP id
 h15-20020a5b0a8f000000b00633fd57f587mr8680200ybq.506.1648822399801; Fri, 01
 Apr 2022 07:13:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220320123016.57991-1-wsa+renesas@sang-engineering.com> <20220320123016.57991-7-wsa+renesas@sang-engineering.com>
In-Reply-To: <20220320123016.57991-7-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 1 Apr 2022 16:13:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWdtCsfVHYi4zqAMgN9wzDmwFpXs5VkJG4G0iXvuhSVKA@mail.gmail.com>
Message-ID: <CAMuHMdWdtCsfVHYi4zqAMgN9wzDmwFpXs5VkJG4G0iXvuhSVKA@mail.gmail.com>
Subject: Re: [PATCH 6/6] mmc: renesas_sdhi: make 'dmac_only_one_rx' a quirk
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Mon, Mar 21, 2022 at 6:33 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> After Shimoda-san's much appreciated refactoring of the quirk handling,
> we can convert now 'dmac_only_one_rx' from an ugly global flag to a
> regular quirk. This makes quirk handling more consistent and easier to
> maintain. After this patch, soc_dma_quirks is completely gone, hooray!
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> @@ -372,7 +378,7 @@ renesas_sdhi_internal_dmac_start_dma(struct tmio_mmc_host *host,
>
>         if (data->flags & MMC_DATA_READ) {
>                 dtran_mode |= DTRAN_MODE_CH_NUM_CH1;
> -               if (test_bit(SDHI_INTERNAL_DMAC_ONE_RX_ONLY, &global_flags) &&
> +               if (priv->quirks->dma_one_rx_only &&

If there are no quirks (yes, we do have such systems ;-), this will
crash with a NULL-pointer dereference.  Actually patch 5/6 has the
same problem.

As I could reproduce the issue, and Ulf has already applied
this series, I've sent a patch:
https://lore.kernel.org/r/cc3178c2ff60f640f4d5a071d51f6b0b1db37656.1648822020.git.geert+renesas@glider.be

>                     test_and_set_bit(SDHI_INTERNAL_DMAC_RX_IN_USE, &global_flags))
>                         goto force_pio_with_unmap;
>         } else {

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
