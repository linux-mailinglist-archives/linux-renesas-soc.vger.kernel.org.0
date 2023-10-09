Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8271E7BD7A7
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Oct 2023 11:51:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345860AbjJIJvm convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Oct 2023 05:51:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345863AbjJIJvl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Oct 2023 05:51:41 -0400
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D468E94;
        Mon,  9 Oct 2023 02:51:39 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-5a7a7e9357eso1010397b3.0;
        Mon, 09 Oct 2023 02:51:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696845099; x=1697449899;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EcpLpgd1f1+Ipojmn8r+iB3J9d+aLm5CFxyQ8kyrL4E=;
        b=KQBggB6UWJsnOxeYnKG5kXuAZomvSrKdbL/7ezdwtOb4KdEA6ttgMmhGBa4ny5DTpy
         g0ev9DCIHs7b6j9D5DKer9GXuMYled7rNDbBn1iCYj/1QeK9AsMIHe6C2DGJtWEuwJf9
         hXeLTLmvFXIUiRNTioRINpumbKxNigRDTa6MRr8xRydlINyAzxD9F0ao39QE/3wAb5zz
         Kqpg6ESyWsPRrp1uT7+2Wvm3nB67z/UZlNBTVVVke6dSAdZmON/yhw5X5Onr2h5WLOk3
         LW4oygmUX1dGzmvmChidwEhTT7KLhWSwyhoUqKVPLP8EM2DDWT+pRrkHv1kpgGcoIs6M
         +a6A==
X-Gm-Message-State: AOJu0Yy6LkKUtEPmH34PNRCaVqH6iSMAX3mjmr/r8UGn4j5zMqNXL49q
        1mLODnGFqXNkXIR1J9hFYJC6bCxuDa/cWw==
X-Google-Smtp-Source: AGHT+IEtLwH5kG6+OQ826XHsoxVKcbPtC8Btu4cfakt3LUdz4h4A35b/97NhQFD0i7g1KD3wPBuNhQ==
X-Received: by 2002:a81:9283:0:b0:59a:ef7f:5c67 with SMTP id j125-20020a819283000000b0059aef7f5c67mr13811929ywg.31.1696845098703;
        Mon, 09 Oct 2023 02:51:38 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id k132-20020a816f8a000000b00598d67585d7sm3608909ywc.117.2023.10.09.02.51.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 02:51:38 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-5a505762c9dso53189907b3.2;
        Mon, 09 Oct 2023 02:51:38 -0700 (PDT)
X-Received: by 2002:a25:18c1:0:b0:d81:61fd:ef5d with SMTP id
 184-20020a2518c1000000b00d8161fdef5dmr11643273yby.27.1696845098183; Mon, 09
 Oct 2023 02:51:38 -0700 (PDT)
MIME-Version: 1.0
References: <20231009074121.219686-1-hch@lst.de> <20231009074121.219686-2-hch@lst.de>
 <CAMuHMdWiYDQ5J7R7hPaVAYgXqJvpjdksoF6X-zHrJ_80Ly4XfQ@mail.gmail.com>
 <20231009091625.GB22463@lst.de> <CAMuHMdUZNewD-QC8J7MWSBP197Vc169meOjjK6=b7M11kVjUzg@mail.gmail.com>
 <20231009094330.GA24836@lst.de>
In-Reply-To: <20231009094330.GA24836@lst.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 9 Oct 2023 11:51:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV2FXdUHtjYW8JyXGBgHhR8De0vp3Ee77e6G8Vbs3gG8Q@mail.gmail.com>
Message-ID: <CAMuHMdV2FXdUHtjYW8JyXGBgHhR8De0vp3Ee77e6G8Vbs3gG8Q@mail.gmail.com>
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

Hi Christoph,

CC soc

On Mon, Oct 9, 2023 at 11:43 AM Christoph Hellwig <hch@lst.de> wrote:
> On Mon, Oct 09, 2023 at 11:34:55AM +0200, Geert Uytterhoeven wrote:
> > The fix you are referring too is probably commit c1ec4b450ab729e3
> > ("soc: renesas: Make ARCH_R9A07G043 (riscv version) depend
> > on NONPORTABLE") in next-20231006 and later.  It is not yet upstream.
> >
> > Still, it merely makes ARCH_R9A07G043 (which selects DMA_GLOBAL_POOL)
> > depend on ARCH_R9A07G043.
> > RISCV_DMA_NONCOHERENT still selects DMA_DIRECT_REMAP, so both can end
> > up being enabled.
>
> Ok, so we need to actually fix this properly.  Lad, can you respin
> the fix to not select DMA_DIRECT_REMAP, for ARCH_R9A07G043?

ARCH_R9A07G043 does not select DMA_DIRECT_REMAP directly,
RISCV_DMA_NONCOHERENT does.  And there are other users of
RISCV_DMA_NONCOHERENT (RISCV_ISA_ZICBOM and ERRATA_THEAD_CMO).
Should the selection of DMA_DIRECT_REMAP moved to their users?

Note that the fix is already in soc/for-next, so we need coordination
with the soc people.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
