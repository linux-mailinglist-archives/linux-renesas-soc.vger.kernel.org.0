Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F4FC7BD947
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Oct 2023 13:10:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345822AbjJILKm convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Oct 2023 07:10:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346139AbjJILKl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Oct 2023 07:10:41 -0400
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AD6599;
        Mon,  9 Oct 2023 04:10:40 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-5a7ac4c3666so624197b3.3;
        Mon, 09 Oct 2023 04:10:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696849839; x=1697454639;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TWthkWDqr7tBRS16dMRTYjQcxpjwoRQd7noLnGne1cw=;
        b=fdWAfzQrvsmzVgMqVUqFq9Amik8GNQYe8qaRA/iVQ2h+IynFXIkd8ueGHV2pI/ZEEj
         wrtN7D0A5yZyB4xwPZN4hKy8Kjdj2h+XBfTi2mreQRfTfVrpaigz4zbY++7ktdwn7I7G
         zYK1lliBy2Fby6ySa+k+xBrKAl5x6l9HxtuwJ01ofWfh1j/XkuowGAAgNdlUuHuKSZtg
         ZX3TeqTgT1R+KOn05xUZZexOG84UsckxCAdkpOUwQFM35Td11XeBDXOW7dHZVPdc/xyt
         IeRCLv9zhUavfJ98Wf81J+NRgO9sKjWnbhTIiwFyrPug9PWH/p0xA4JMfENSIRbpTyud
         MzdQ==
X-Gm-Message-State: AOJu0YwpGAThgEAscf6xdI1oMcPVu7xuVG6+7VFU2mpXez3vo3tpf163
        dEqoeNUbc6es1doSaKU7SaD5rxlUGIGiaw==
X-Google-Smtp-Source: AGHT+IHBmotDHoJGEMI1J2zXGrQfqlcXXcapUZalUNhu+RAAUYUhUfzdyme4KrqYJmPXFMlFkphKSA==
X-Received: by 2002:a81:ab42:0:b0:5a1:e4bf:ee5a with SMTP id d2-20020a81ab42000000b005a1e4bfee5amr14670814ywk.41.1696849839295;
        Mon, 09 Oct 2023 04:10:39 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id l197-20020a0de2ce000000b005a4dde66853sm3618841ywe.0.2023.10.09.04.10.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 04:10:38 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-5a1ec43870cso53795957b3.0;
        Mon, 09 Oct 2023 04:10:38 -0700 (PDT)
X-Received: by 2002:a81:7b54:0:b0:595:e1b:b978 with SMTP id
 w81-20020a817b54000000b005950e1bb978mr16558396ywc.21.1696849838737; Mon, 09
 Oct 2023 04:10:38 -0700 (PDT)
MIME-Version: 1.0
References: <20231009074121.219686-1-hch@lst.de> <20231009074121.219686-2-hch@lst.de>
 <CAMuHMdWiYDQ5J7R7hPaVAYgXqJvpjdksoF6X-zHrJ_80Ly4XfQ@mail.gmail.com>
 <20231009091625.GB22463@lst.de> <CAMuHMdUZNewD-QC8J7MWSBP197Vc169meOjjK6=b7M11kVjUzg@mail.gmail.com>
 <20231009094330.GA24836@lst.de> <CAMuHMdV2FXdUHtjYW8JyXGBgHhR8De0vp3Ee77e6G8Vbs3gG8Q@mail.gmail.com>
 <1cd44af1-10ac-465a-8d20-e0aa268e036f@arm.com>
In-Reply-To: <1cd44af1-10ac-465a-8d20-e0aa268e036f@arm.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 9 Oct 2023 13:10:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXNX7+VLnSYhj=M9dTSTWLJqjS_WaT0ceMRUYoa5_MSeA@mail.gmail.com>
Message-ID: <CAMuHMdXNX7+VLnSYhj=M9dTSTWLJqjS_WaT0ceMRUYoa5_MSeA@mail.gmail.com>
Subject: Re: [PATCH 1/6] dma-direct: add depdenencies to CONFIG_DMA_GLOBAL_POOL
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Christoph Hellwig <hch@lst.de>, iommu@lists.linux.dev,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Wei Fang <wei.fang@nxp.com>,
        Shenwei Wang <shenwei.wang@nxp.com>,
        Clark Wang <xiaoning.wang@nxp.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-m68k@lists.linux-m68k.org, netdev@vger.kernel.org,
        Jim Quinlan <james.quinlan@broadcom.com>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        arm-soc <soc@kernel.org>
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

Hi Robin,

On Mon, Oct 9, 2023 at 12:04 PM Robin Murphy <robin.murphy@arm.com> wrote:
> On 2023-10-09 10:51, Geert Uytterhoeven wrote:
> > On Mon, Oct 9, 2023 at 11:43 AM Christoph Hellwig <hch@lst.de> wrote:
> >> On Mon, Oct 09, 2023 at 11:34:55AM +0200, Geert Uytterhoeven wrote:
> >>> The fix you are referring too is probably commit c1ec4b450ab729e3
> >>> ("soc: renesas: Make ARCH_R9A07G043 (riscv version) depend
> >>> on NONPORTABLE") in next-20231006 and later.  It is not yet upstream.
> >>>
> >>> Still, it merely makes ARCH_R9A07G043 (which selects DMA_GLOBAL_POOL)
> >>> depend on ARCH_R9A07G043.
> >>> RISCV_DMA_NONCOHERENT still selects DMA_DIRECT_REMAP, so both can end
> >>> up being enabled.
> >>
> >> Ok, so we need to actually fix this properly.  Lad, can you respin
> >> the fix to not select DMA_DIRECT_REMAP, for ARCH_R9A07G043?
> >
> > ARCH_R9A07G043 does not select DMA_DIRECT_REMAP directly,
> > RISCV_DMA_NONCOHERENT does.  And there are other users of
> > RISCV_DMA_NONCOHERENT (RISCV_ISA_ZICBOM and ERRATA_THEAD_CMO).
> > Should the selection of DMA_DIRECT_REMAP moved to their users?
>
> No, the selection of DMA_GLOBAL_POOL should be removed from
> RISV_DMA_NONCOHERENT and selected directly by ARCH_R9A07G043 (along with
> any of the other implied symbols it needs). Or if as suggested this
> physical-attribute-remap wackiness is due to show up on more platforms
> as well, maybe have a common config for that which selects
> DMA_GLOBAL_POOL plus the relevant cache maintenance extensions as an
> equivalent to RISCV_DMA_NONCOHERENT, and can itself explicitly depend on
> NONPORTABLE for clarity.

RISCV_DMA_NONCOHERENT does not select DMA_GLOBAL_POOL,
ARCH_R9A07G043 selects DMA_GLOBAL_POOL.
RISCV_DMA_NONCOHERENT does select DMA_DIRECT_REMAP if MMU.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
