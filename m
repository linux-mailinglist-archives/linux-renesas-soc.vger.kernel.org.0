Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FFDF7CADFE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Oct 2023 17:46:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231478AbjJPPqB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Oct 2023 11:46:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233720AbjJPPp7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Oct 2023 11:45:59 -0400
Received: from mail-ua1-x934.google.com (mail-ua1-x934.google.com [IPv6:2607:f8b0:4864:20::934])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0B39AB;
        Mon, 16 Oct 2023 08:45:56 -0700 (PDT)
Received: by mail-ua1-x934.google.com with SMTP id a1e0cc1a2514c-7b625ed7208so1922410241.1;
        Mon, 16 Oct 2023 08:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697471156; x=1698075956; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Be+JqDvKcVfoZO+fdW/6Y7p5xoTP2t1qbUjOd8UWjBU=;
        b=KGNsJvvqZQJgtRMK4OCRgbApu++qLIF4DaTfjKbtDdeaMQnpGwWlIjiafVK9okqFJD
         9h7FHEokwexOKbeYo8uXKA7MdghazTEggZB+Ki4EsaiREjMKCEd3AnrA1erf1nYPzjV3
         Jx95wLwiDQHvThqunm0HWXXPBHcVUlqn8D57EwgiQ0KC5csTuYVnHwBNKNgCN21U0Z0W
         AeE64kDrwwawiWg87Mj6g5uFDNovhG7I+Rg4IyrIKk/lUr2+H616P3VZMkwxSJkFc2No
         XcPdWqElehvygrA+8ucc4VXJ7r+m00GeOe/1UM2cJ4GzMyCfh1GbcDqKSH1ak2CEtOST
         /o/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697471156; x=1698075956;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Be+JqDvKcVfoZO+fdW/6Y7p5xoTP2t1qbUjOd8UWjBU=;
        b=Vu7zlN6MFyKdMbihRRAIBD4r/bLCMeWqXy3rIrqSlDVZR4fqEEX6d7Fg3EA7ZmL1Hi
         zDNY7uvi2TzCWgSzNajpBGfTpguH9jW+1lxbvVgamdFn2/wfdLIjkLfA6jgCF3UbYWZH
         G9Zr2tXep+VEkMRso9R5QFMYSRabyv0nhRaZDrvlFBRJ7/SS+a+rnyMo5yn+C4VJGQ2t
         eU4LyU1WXFFPLR5yhJXP+O01+1PEtXWzRvV7CMfupAOhTSIeiA7gVUD9FjEV3TnxfJWv
         zFLCNAJoHsBAhHrWiu40IKfg4jiNuOiiesW+bAZWOTsfQezNsqnX6cLZ1rYcMqoZcUqx
         1YRg==
X-Gm-Message-State: AOJu0Ywv+ehMAeJUhW2AR2qTKHG/Zf/wAXo1t1KiS7JN7cQAWhK0Q+5l
        P4/fwJ9MGVFhBT6zgTkb/b4JpWuKHJCqjNgH+yo=
X-Google-Smtp-Source: AGHT+IGv1onTQjqVJotgyiMblBPHjo7A5lICsP21th4oYCrXg7fMKsA2HIivTnjBub3qHrxO15iu+5gAK0C1u+4Pm/Y=
X-Received: by 2002:a1f:e641:0:b0:48f:8891:29d9 with SMTP id
 d62-20020a1fe641000000b0048f889129d9mr27437782vkh.13.1697471156012; Mon, 16
 Oct 2023 08:45:56 -0700 (PDT)
MIME-Version: 1.0
References: <20231016054755.915155-1-hch@lst.de> <20231016054755.915155-6-hch@lst.de>
In-Reply-To: <20231016054755.915155-6-hch@lst.de>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Mon, 16 Oct 2023 16:44:39 +0100
Message-ID: <CA+V-a8vfYb-OBZMMXx7vwtZ4b9V7iep3CzPw5FVmvespF8OPqw@mail.gmail.com>
Subject: Re: [PATCH 05/12] dma-direct: add depdenencies to CONFIG_DMA_GLOBAL_POOL
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
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Oct 16, 2023 at 6:48=E2=80=AFAM Christoph Hellwig <hch@lst.de> wrot=
e:
>
> CONFIG_DMA_GLOBAL_POOL can't be combined with other DMA coherent
> allocators.  Add dependencies to Kconfig to document this, and make
> kconfig complain about unment dependencies if someone tries.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  kernel/dma/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/kernel/dma/Kconfig b/kernel/dma/Kconfig
> index f488997b071712..4524db877eba36 100644
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
> --
> 2.39.2
>
