Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 591517BD570
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Oct 2023 10:44:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345489AbjJIIoN convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Oct 2023 04:44:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345453AbjJIIoM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Oct 2023 04:44:12 -0400
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D511A9F;
        Mon,  9 Oct 2023 01:44:10 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-5a24b03e22eso51936107b3.0;
        Mon, 09 Oct 2023 01:44:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696841050; x=1697445850;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dqNLFjHn3fj/AL0iMyf/yawddLiaq23Wu30A3Gzqckk=;
        b=VldaOQR2KU1z5rwLoL5pL0p8YtloH1Pdnj0mceiTSwWnJ3CI6EQfL5szgXgaFbA7Rw
         4XXbZ/AZtaUN+dDFhYE/ny1pD2COcKpxRG6ji/nmSj9Uf5Fpkntc0Pi5T8z6ovbts8t3
         mJBCrwVkhAcCi5Moh/4s0AaayEZVwioNLnsbPPuLnmUkEfdv3nM9qFvnGYsBVdEyBppZ
         Reunls63fC4EBw3ccwgQit15jTxM26XPY8Fw1CwZ9RLL+qlRx70OdopgwzQq5US8/Asj
         nhFhYT5VXUJm+zlbk9PDgqhcntV0y4JHTHS2BIOY7dcrod4qh0xbvdFZrmlmn0CfzeSX
         1U5A==
X-Gm-Message-State: AOJu0YykNubSyb4opUJkMU/IOgNCUai0xT5SrpVijvZOF4zKe+DdQcAP
        K2d/B/61zl9zW6Zo52eGr4SlmYv1NGavwQ==
X-Google-Smtp-Source: AGHT+IGs4YBv6PzYrO+Rg9N2PtnM6DnTq+DL8LuBqkf+/JrAHBEJf5ZNe3F461oa96k1Chk2MuPjsA==
X-Received: by 2002:a81:4fc9:0:b0:599:da80:e1eb with SMTP id d192-20020a814fc9000000b00599da80e1ebmr16645135ywb.24.1696841049848;
        Mon, 09 Oct 2023 01:44:09 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id z204-20020a0dd7d5000000b0058c8b1ddcc1sm3533084ywd.15.2023.10.09.01.44.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 01:44:09 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-59c215f2f4aso51865307b3.1;
        Mon, 09 Oct 2023 01:44:09 -0700 (PDT)
X-Received: by 2002:a0d:d808:0:b0:59b:d796:2a55 with SMTP id
 a8-20020a0dd808000000b0059bd7962a55mr17521321ywe.1.1696841049412; Mon, 09 Oct
 2023 01:44:09 -0700 (PDT)
MIME-Version: 1.0
References: <20231009074121.219686-1-hch@lst.de> <20231009074121.219686-2-hch@lst.de>
In-Reply-To: <20231009074121.219686-2-hch@lst.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 9 Oct 2023 10:43:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWiYDQ5J7R7hPaVAYgXqJvpjdksoF6X-zHrJ_80Ly4XfQ@mail.gmail.com>
Message-ID: <CAMuHMdWiYDQ5J7R7hPaVAYgXqJvpjdksoF6X-zHrJ_80Ly4XfQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] dma-direct: add depdenencies to CONFIG_DMA_GLOBAL_POOL
To:     Christoph Hellwig <hch@lst.de>
Cc:     iommu@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Wei Fang <wei.fang@nxp.com>,
        Shenwei Wang <shenwei.wang@nxp.com>,
        Clark Wang <xiaoning.wang@nxp.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-m68k@lists.linux-m68k.org, netdev@vger.kernel.org,
        Jim Quinlan <james.quinlan@broadcom.com>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Hi Christoph,

On Mon, Oct 9, 2023 at 9:41 AM Christoph Hellwig <hch@lst.de> wrote:
> CONFIG_DMA_GLOBAL_POOL can't be combined with other dma-coherent
> allocators.  Add dependencies to Kconfig to document this, and make
> kconfig complain about unment dependencies if someone tries.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Thanks for your patch!

> --- a/kernel/dma/Kconfig
> +++ b/kernel/dma/Kconfig
> @@ -135,6 +135,8 @@ config DMA_COHERENT_POOL
>
>  config DMA_GLOBAL_POOL
>         select DMA_DECLARE_COHERENT
> +       depends on !ARCH_HAS_DMA_SET_UNCACHED
> +       depends on !DMA_DIRECT_REMAP
>         bool
>
>  config DMA_DIRECT_REMAP

riscv defconfig + CONFIG_NONPORTABLE=y + CONFIG_ARCH_R9A07G043=y:

WARNING: unmet direct dependencies detected for DMA_GLOBAL_POOL
  Depends on [n]: !ARCH_HAS_DMA_SET_UNCACHED [=n] && !DMA_DIRECT_REMAP [=y]
  Selected by [y]:
  - ARCH_R9A07G043 [=y] && SOC_RENESAS [=y] && RISCV [=y] && NONPORTABLE [=y]

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
