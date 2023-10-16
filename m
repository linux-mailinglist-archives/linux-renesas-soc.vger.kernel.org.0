Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF17D7CADC9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Oct 2023 17:41:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231569AbjJPPlB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Oct 2023 11:41:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232660AbjJPPlA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Oct 2023 11:41:00 -0400
Received: from mail-vk1-xa2e.google.com (mail-vk1-xa2e.google.com [IPv6:2607:f8b0:4864:20::a2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 172B2B4;
        Mon, 16 Oct 2023 08:40:59 -0700 (PDT)
Received: by mail-vk1-xa2e.google.com with SMTP id 71dfb90a1353d-49ab0641e77so1969795e0c.0;
        Mon, 16 Oct 2023 08:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697470858; x=1698075658; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6JyrPV6/isChg/aWoV8Vdox7jNb/LeSH8h9ZE9RQZ4k=;
        b=RKiSSHFp3Y56c42pxA8NcctPS+vB2KvEaJaJ97M5qDuLadDj+RkSg/Tqa9pTajSTQQ
         p6aLGYb9BG2QBnRQ6fyfs8/WnO1tkjfe4l/xgwvmso/zA05F7LKY6zcXIKvZtf2wLpEw
         BV1kInv7MYsJftCraFHVKRYbO0Teh4FlAfttffcN6OUtf7PmfoyKlPAH0+pXIae1phAQ
         lJeWfmSNuBkWx8xrMZ2AyLhNYnpngxdr1Z53SUYIX6mzoZOoVeXB8KWsrI1V9TWsk8Hx
         ytL+N1G527PaEjPVsiDm4tLmWZu0ktpTv0oSD5Vbos27at8CeAMCVy3f4yH/GFoc3stQ
         RY7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697470858; x=1698075658;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6JyrPV6/isChg/aWoV8Vdox7jNb/LeSH8h9ZE9RQZ4k=;
        b=oUq5vE1p2clovAfm9niRKNppHH793o9jtFh2v2C891COxTdHcUtdJC8WG5KuXcJiGv
         wpOKqIvdiJt7gBpk16308zR+h3HtCmsOhCQXTKrRfzztvo5e0gtA9A6fEsnB6pQhydn1
         naLn5TRhzXxsS4KQM2lI55zXVdXltsRcItgVn0o8Yq0wT4xgFgwQrVcONXQLZLC8+nji
         9dnnVEBFMC5khhy4sKf9EOsgR6Luv59nYPCgzdMF7b7Yx8XeB9qKul/+M1FynJjuxIgf
         ge9rBtDGicrstabPH+VwjHJfXFRF95qdDmjBgR0Wa+T8tFaGcUGDFHbRYPs2nTJXn5Ne
         Fm9A==
X-Gm-Message-State: AOJu0YwpaqdUKMbGmJRzgD6wBPjU8gTw2EtUHlqjMCwqWeslhttlDr0S
        6Ih5wEHqF5z4UQ8VlyzwIHcwoasMgBdo5zgjkiY=
X-Google-Smtp-Source: AGHT+IEUS6diCI0qP0NzRCHHthfHGe1z+pXjLCt2SKZVkH+NQW/kPzzEZY2133jtIGuI9wooUY358mw8Vy0zXSvuQs4=
X-Received: by 2002:a1f:4ec4:0:b0:4a4:887:514c with SMTP id
 c187-20020a1f4ec4000000b004a40887514cmr8133579vkb.6.1697470858089; Mon, 16
 Oct 2023 08:40:58 -0700 (PDT)
MIME-Version: 1.0
References: <20231016054755.915155-1-hch@lst.de> <20231016054755.915155-3-hch@lst.de>
In-Reply-To: <20231016054755.915155-3-hch@lst.de>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Mon, 16 Oct 2023 16:39:40 +0100
Message-ID: <CA+V-a8va9W7Gpgr22RcPHL=fJvbViMjrpUfqKekcQ+rSZeYebw@mail.gmail.com>
Subject: Re: [PATCH 02/12] riscv: only select DMA_DIRECT_REMAP from RISCV_ISA_ZICBOM
To:     Christoph Hellwig <hch@lst.de>
Cc:     Greg Ungerer <gerg@linux-m68k.org>, iommu@lists.linux.dev,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Conor Dooley <conor@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Wei Fang <wei.fang@nxp.com>,
        Shenwei Wang <shenwei.wang@nxp.com>,
        Clark Wang <xiaoning.wang@nxp.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-m68k@lists.linux-m68k.org, netdev@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
        Jim Quinlan <james.quinlan@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Oct 16, 2023 at 6:48=E2=80=AFAM Christoph Hellwig <hch@lst.de> wrot=
e:
>
> RISCV_DMA_NONCOHERENT is also used for whacky non-standard
> non-coherent ops that use different hooks in dma-direct.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/riscv/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 0ac0b538379718..9c48fecc671918 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -273,7 +273,6 @@ config RISCV_DMA_NONCOHERENT
>         select ARCH_HAS_SYNC_DMA_FOR_CPU
>         select ARCH_HAS_SYNC_DMA_FOR_DEVICE
>         select DMA_BOUNCE_UNALIGNED_KMALLOC if SWIOTLB
> -       select DMA_DIRECT_REMAP if MMU
>
>  config RISCV_NONSTANDARD_CACHE_OPS
>         bool
> @@ -549,6 +548,7 @@ config RISCV_ISA_ZICBOM
>         depends on RISCV_ALTERNATIVE
>         default y
>         select RISCV_DMA_NONCOHERENT
> +       select DMA_DIRECT_REMAP
>         help
>            Adds support to dynamically detect the presence of the ZICBOM
>            extension (Cache Block Management Operations) and enable its
> --
> 2.39.2
>
