Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89BA17CBDFC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Oct 2023 10:43:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234759AbjJQInh convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Oct 2023 04:43:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234771AbjJQIne (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Oct 2023 04:43:34 -0400
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D502E115;
        Tue, 17 Oct 2023 01:43:32 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-d9a6b21d1daso6344205276.3;
        Tue, 17 Oct 2023 01:43:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697532212; x=1698137012;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iF8pGgwx9ER+JexQPULvEbdhCYC/MDFSezGeWG3jTqw=;
        b=djZAW+edgYa/kNSVCZs+R1VpFLi98NbOPGPUFmdgvj/2U3ADEv5uXWuIfd/qjo0ESJ
         r+nM9SMHVU+tPuWT0n1igWeVfu/LqlQkeFiDpGNf+ifmcRu/KBjN2H8ame+ymTZdDQY0
         1ep2EHycpJ4BBnNT+CY5kWJ9kB/FxCS1CCu0alAaE/F6QWeQkPiwk4w0UjlYAAO7I6Tm
         4e2jAcUezURquzvb4zMYTrPDNiO6mVZ2oor0ae5oLm9l2BBOrzWJeZHPgHgHowVI9o73
         wVkT3kAtkYSNkhih+drDfzKOQxqFyMoB0BSslCphsRvUqPDn9lPavOJtW3mSAgHBNnOx
         aOIQ==
X-Gm-Message-State: AOJu0YyF8P3irz6A6NFG2uNy3OJ/HX9csdwqJVLlOO63jQSENGbVR0+/
        jVTuG+N8ila/eJ7ZAbETM4L5hkVhPqIMBA==
X-Google-Smtp-Source: AGHT+IEnXX5mh5/TamLdkFY97ZzSI0I5nm1l9A/J8pHn1qA13jhFIBd/CzKIUoIXgr5NJOrOvPoYtA==
X-Received: by 2002:a25:258c:0:b0:d81:599f:a538 with SMTP id l134-20020a25258c000000b00d81599fa538mr1295674ybl.51.1697532211592;
        Tue, 17 Oct 2023 01:43:31 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id l12-20020a25bccc000000b00d749a394c87sm357491ybm.16.2023.10.17.01.43.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Oct 2023 01:43:31 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-579de633419so66667357b3.3;
        Tue, 17 Oct 2023 01:43:31 -0700 (PDT)
X-Received: by 2002:a0d:f786:0:b0:583:a3ab:b950 with SMTP id
 h128-20020a0df786000000b00583a3abb950mr1213954ywf.50.1697532211155; Tue, 17
 Oct 2023 01:43:31 -0700 (PDT)
MIME-Version: 1.0
References: <20231016054755.915155-1-hch@lst.de> <20231016054755.915155-11-hch@lst.de>
In-Reply-To: <20231016054755.915155-11-hch@lst.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 17 Oct 2023 10:43:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXonOxTT7OuTtmyYR346F569aQE0ErhAx8qfsGxWUp+Sg@mail.gmail.com>
Message-ID: <CAMuHMdXonOxTT7OuTtmyYR346F569aQE0ErhAx8qfsGxWUp+Sg@mail.gmail.com>
Subject: Re: [PATCH 10/12] net: fec: use dma_alloc_noncoherent for data cache
 enabled coldfire
To:     Christoph Hellwig <hch@lst.de>
Cc:     Greg Ungerer <gerg@linux-m68k.org>, iommu@lists.linux.dev,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Conor Dooley <conor@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
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
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Christoph,

On Mon, Oct 16, 2023 at 7:48 AM Christoph Hellwig <hch@lst.de> wrote:
> Coldfire platforms with data caches can't properly implement
> dma_alloc_coherent and currently just return noncoherent memory from
> dma_alloc_coherent.
>
> The fec driver than works around this with a flush of all caches in the
> receive path. Make this hack a little less bad by using the explicit
> dma_alloc_noncoherent API and documenting the hacky cache flushes so
> that the DMA API level hack can be removed.
>
> Also replace the check for CONFIG_M532x for said hack with a check
> for COLDFIRE && !COLDFIRE_COHERENT_DMA.  While m532x is the only such
> platform with a fec module, this makes the code more consistent and
> easier to follow.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Thanks for your patch!

> --- a/drivers/net/ethernet/freescale/fec_main.c
> +++ b/drivers/net/ethernet/freescale/fec_main.c
> @@ -406,6 +406,70 @@ static void fec_dump(struct net_device *ndev)
>         } while (bdp != txq->bd.base);
>  }
>
> +/*
> + * Coldfire does not support DMA coherent allocations, and has historically used
> + * a band-aid with a manual flush in fec_enet_rx_queue.
> + */
> +#if defined(CONFIG_COLDFIRE) && !defined(CONFIG_COLDFIRE_COHERENT_DMA)
> +static void *fec_dma_alloc(struct device *dev, size_t size, dma_addr_t *handle,
> +               gfp_t gfp)
> +{
> +       return dma_alloc_noncoherent(dev, size, handle, DMA_BIDIRECTIONAL, gfp);
> +}
> +
> +static void fec_dma_free(struct device *dev, size_t size, void *cpu_addr,
> +               dma_addr_t handle)
> +{
> +       dma_free_noncoherent(dev, size, cpu_addr, handle, DMA_BIDIRECTIONAL);
> +}
> +#else /* CONFIG_COLDFIRE && !CONFIG_COLDFIRE_COHERENT_DMA */

!CONFIG_COLDFIRE || CONFIG_COLDFIRE_COHERENT_DMA

> +static void *fec_dma_alloc(struct device *dev, size_t size, dma_addr_t *handle,
> +               gfp_t gfp)
> +{
> +       return dma_alloc_coherent(dev, size, handle, gfp);
> +}
> +
> +static void fec_dma_free(struct device *dev, size_t size, void *cpu_addr,
> +               dma_addr_t handle)
> +{
> +       dma_free_coherent(dev, size, cpu_addr, handle);
> +}
> +#endif /* !CONFIG_COLDFIRE && !CONFIG_COLDFIRE_COHERENT_DMA */

!CONFIG_COLDFIRE || CONFIG_COLDFIRE_COHERENT_DMA

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
