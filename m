Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 005287CBD3D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Oct 2023 10:20:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234667AbjJQIUy convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Oct 2023 04:20:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233648AbjJQIUx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Oct 2023 04:20:53 -0400
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74957B6;
        Tue, 17 Oct 2023 01:20:51 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5a7d9d357faso68247557b3.0;
        Tue, 17 Oct 2023 01:20:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697530850; x=1698135650;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CdUY7Js3MyY72r3pkukYQuEPFyg4hUCkNQ1ukw9r4To=;
        b=MC3l/+bzsWk6kp5jPaWygddVbO8ijVIy4T4uwnpewezrHC5e5kiveg8UGjkVqtdt/a
         rosWdqqk6Q6N0QDyDZ8a365huAnIx076FMEPAGL9cOM3ABND+nKtSUvaNuwsFAKsyQs2
         J//VU6bJBsdkGhyTKaQAmt8MxH1PBH2fp3dGOr6laLbd5iAjkzJGbx+o0IRL54wP8pPh
         LDP+7GAwbx41WRx/7NKBVWqVL3q4iIItjVQrGq/WRw3LJuUwiCcGSYcKIPZsAOJ1v1cC
         s2JMNCcoU6YCuHy7XaicW1pt8bKjADlaPsVlF5uOrArn9R1ZVoKOmwodPfAKdT2qM7lF
         Gjwg==
X-Gm-Message-State: AOJu0YxovUglmGp+EG21RwEEbvyaKsMkLYp83ub3ECBV2RU+awu9gZ1/
        n2z9k5eKVYCwbV2OwJBeVGdjBCTUigblXw==
X-Google-Smtp-Source: AGHT+IEJzhaLN4am3ds7V2gEybMX6p2WmlkWY75ltCA4Ap0dqKr5vQ3GvjxNarSW0iG9TUkcB2sIzg==
X-Received: by 2002:a0d:d50a:0:b0:5a7:be9f:bd19 with SMTP id x10-20020a0dd50a000000b005a7be9fbd19mr1562588ywd.44.1697530850572;
        Tue, 17 Oct 2023 01:20:50 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id m190-20020a0dcac7000000b0059c2e3b7d88sm431284ywd.12.2023.10.17.01.20.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Oct 2023 01:20:48 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-5a7d532da4bso68024357b3.2;
        Tue, 17 Oct 2023 01:20:47 -0700 (PDT)
X-Received: by 2002:a81:ab41:0:b0:59f:4dcd:227e with SMTP id
 d1-20020a81ab41000000b0059f4dcd227emr1543078ywk.37.1697530847545; Tue, 17 Oct
 2023 01:20:47 -0700 (PDT)
MIME-Version: 1.0
References: <20231016054755.915155-1-hch@lst.de> <20231016054755.915155-5-hch@lst.de>
In-Reply-To: <20231016054755.915155-5-hch@lst.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 17 Oct 2023 10:20:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW=Rp8+fcGrZ5fbVDyEZgVMGH_YHMxSTBdHB+zNxw4bxA@mail.gmail.com>
Message-ID: <CAMuHMdW=Rp8+fcGrZ5fbVDyEZgVMGH_YHMxSTBdHB+zNxw4bxA@mail.gmail.com>
Subject: Re: [PATCH 04/12] soc: renesas: select RISCV_DMA_NONCOHERENT from ARCH_R9A07G043
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

On Mon, Oct 16, 2023 at 7:48 AM Christoph Hellwig <hch@lst.de> wrote:
> Selecting DMA_GLOBAL_POOL without the rest of the non-coherent DMA
> infrastructure does not make sense.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/soc/renesas/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
> index f1696d3b5018d0..ea473b4150dfa8 100644
> --- a/drivers/soc/renesas/Kconfig
> +++ b/drivers/soc/renesas/Kconfig
> @@ -338,6 +338,7 @@ config ARCH_R9A07G043
>         select ARCH_RZG2L
>         select AX45MP_L2_CACHE
>         select DMA_GLOBAL_POOL
> +       select RISCV_DMA_NONCOHERENT
>         select ERRATA_ANDES if RISCV_SBI
>         select ERRATA_ANDES_CMO if ERRATA_ANDES

With proper sort order, and rebased to soc/for-next:
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
