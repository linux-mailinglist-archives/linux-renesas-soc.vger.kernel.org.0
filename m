Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5776B7CBDE9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Oct 2023 10:40:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233882AbjJQIku convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Oct 2023 04:40:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234620AbjJQIks (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Oct 2023 04:40:48 -0400
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7D45B6;
        Tue, 17 Oct 2023 01:40:45 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-5a7a80a96dbso54722247b3.0;
        Tue, 17 Oct 2023 01:40:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697532045; x=1698136845;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KZlS/7U1efr6AK8aT2dfiOZNDdagRiOd/6FdP6Lb3EM=;
        b=tMM69EzZqqsRzcvNRoD0UcCKVJ0NeHuPl0kdBBEC6femOZy4FhzLEnMC4hOWqxWljx
         Hpu2hExeWrslfzMHTlxjYx6wAykzbUsxd9fNSktcYilF0wPSZOX4TDSJTvG8uwIFBYN+
         murIh7YUwVkLC7WHdU482jrx1yEgbde8tpFcGXj+PtWtHXave6FTLOJQs81vEbKGF6+k
         eCXI0XqOzwdV0yNCF0CA0nzrudygqCyotxSVA9YTRqznt/WryWuRJmRNS7JFrZXgfcru
         gTKq/XofIpE5zUz1vwR2dyj8Wi55QA3Hzd51u1UqFeAmu+MALFJmpdZvOdcMPWkd6OIl
         W3hA==
X-Gm-Message-State: AOJu0YzT9mcGAIq2HlFzNBJGjQdZABGYyepfOSxvR5u2Y2Ic10Hj2pXt
        BEtIOhsX8CIwrX08R/CH9URB7aGrqPvYtQ==
X-Google-Smtp-Source: AGHT+IHtDgrSvo67YPzCatKxL+1bZQNwkrU2iyYVGsAmqHP/N/X8o3e896ZbYeWv6qt8TSdtVUVN6w==
X-Received: by 2002:a05:690c:d83:b0:589:e815:8d71 with SMTP id da3-20020a05690c0d8300b00589e8158d71mr1057836ywb.11.1697532045167;
        Tue, 17 Oct 2023 01:40:45 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id i188-20020a8154c5000000b00589a1dc0809sm441116ywb.120.2023.10.17.01.40.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Oct 2023 01:40:44 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-59e88a28b98so46644637b3.1;
        Tue, 17 Oct 2023 01:40:44 -0700 (PDT)
X-Received: by 2002:a0d:ca50:0:b0:5a7:ba02:9c9a with SMTP id
 m77-20020a0dca50000000b005a7ba029c9amr1017206ywd.2.1697532044608; Tue, 17 Oct
 2023 01:40:44 -0700 (PDT)
MIME-Version: 1.0
References: <20231016054755.915155-1-hch@lst.de> <20231016054755.915155-10-hch@lst.de>
In-Reply-To: <20231016054755.915155-10-hch@lst.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 17 Oct 2023 10:40:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVq0ihLthVQF-2v4_E=m7jdOZty8b69eizJyWoU+0CFCw@mail.gmail.com>
Message-ID: <CAMuHMdVq0ihLthVQF-2v4_E=m7jdOZty8b69eizJyWoU+0CFCw@mail.gmail.com>
Subject: Re: [PATCH 09/12] m68k: use the coherent DMA code for coldfire
 without data cache
To:     Christoph Hellwig <hch@lst.de>
Cc:     Greg Ungerer <gerg@linux-m68k.org>, iommu@lists.linux.dev,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Conor Dooley <conor@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Wei Fang <wei.fang@nxp.com>,
        Shenwei Wang <shenwei.wang@nxp.com>,
        Clark Wang <xiaoning.wang@nxp.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-m68k@lists.linux-m68k.org, netdev@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
        Jim Quinlan <james.quinlan@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Oct 16, 2023 at 7:48 AM Christoph Hellwig <hch@lst.de> wrote:
> Coldfire cores configured without a data cache are DMA coherent and
> should thus simply use the simple coherent version of dma-direct.
>
> Introduce a new COLDFIRE_COHERENT_DMA Kconfig symbol as a convenient
> short hand for such configurations, and a M68K_NONCOHERENT_DMA symbol
> for all cases where we need to build non-coherent DMA infrastructure
> to simplify the Kconfig and code conditionals.
>
> Not building the non-coherent DMA code slightly reduces the code
> size for such configurations.
>
> Numers for m5249evb_defconfig below:
>
>   text     data     bss     dec     hex filename
> 2896158  401052   65392 3362602  334f2a vmlinux.before
> 2895166  400988   65392 3361546  334b0a vmlinux.after
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

The m68kclassic-with-MMU parts look fine to me, so
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

I'll defer to Greg for the nommu and Coldfire parts...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
