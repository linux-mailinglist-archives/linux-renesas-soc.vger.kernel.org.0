Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDE7E7CADCC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Oct 2023 17:41:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232744AbjJPPlt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Oct 2023 11:41:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231569AbjJPPls (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Oct 2023 11:41:48 -0400
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com [IPv6:2607:f8b0:4864:20::a32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2A57B4;
        Mon, 16 Oct 2023 08:41:46 -0700 (PDT)
Received: by mail-vk1-xa32.google.com with SMTP id 71dfb90a1353d-49dd3bb5348so1773338e0c.0;
        Mon, 16 Oct 2023 08:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697470906; x=1698075706; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jy2a+mH7vHRMC2bqIVFdXE4pfKJ8ZD9dY9NH9f8mIfg=;
        b=BXcwC41Z+MCDXc70mMTb26461G21j8UQAk9vtuPmI2KIk8M7Cc1vumje7+Ri/QyIjk
         /5EvdufVVrCEjmFy25PHefq6jhY6SfOxtcbgyiO2AfQ+tqHX0z3ThvhnrbPhAMhX5f8J
         fqixA3Vu6cLRqS3SS4BayBfX0tlivGTLA2PRgXreQK3HMqmdtmYoGgPtpBYbLLJ8AgZR
         1c/qy017bjP0Gv8KhaXGNkRJ5BytwSGWmQwi0HAbCO74RpnUHF10PHeLcaarzJzCIRXM
         dD1BXFb5+m43WzTH5SgvmnBtkRwEj9n7VTQ11xQVdyMNajOLUZQk70emX3yyd24xUWhy
         dKyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697470906; x=1698075706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jy2a+mH7vHRMC2bqIVFdXE4pfKJ8ZD9dY9NH9f8mIfg=;
        b=cph/mx4OdqjVPHqmFokj/dzvTiPENkdFoSOR4mPWsPcLgM4Nn4A7sNWSaBrllJZVca
         rnchcKv1Eg9B2N3NngddKmA5t3O2evgrh/mc3juvbDCgCxkQ/xGJfh9/gcTVfSMw9BQZ
         LllbFZnXIj64OnYotXOev15Mf+uRkOJzGmKFdpYGpkkyBjupMDHedhMbsIvLC+0FJeqi
         Fh6izOjzuG2ThPjQ4QgKbu0ZIWpvNzX4s/PrKFdZufz6U5kq3TtbimG4ASytKye7FEo8
         yhIFzoxU6DIxhrNpisdlGtlNSFpGuZKdHWAtGe+dQiVK8cHeZWWptqYHsFGteTQWBNz1
         /b/w==
X-Gm-Message-State: AOJu0YxxlORLTm6zxB2ob9KlBDsmstldRcAMEtdPwnWBPw0dza1iDtPL
        76d9grCxTFw0tqfaQy4lHwGHZkkapiUDXEzz0h0=
X-Google-Smtp-Source: AGHT+IGux325FOhiB0DGfuNAaDcad8gGCTORm2m4I3eBqk5dFYW6m/Pa7EpUDnkf3lePkwaOdU4GJYHkEbhbyUtux/E=
X-Received: by 2002:a1f:ed41:0:b0:495:dcd0:471 with SMTP id
 l62-20020a1fed41000000b00495dcd00471mr28745613vkh.5.1697470905828; Mon, 16
 Oct 2023 08:41:45 -0700 (PDT)
MIME-Version: 1.0
References: <20231016054755.915155-1-hch@lst.de> <20231016054755.915155-4-hch@lst.de>
In-Reply-To: <20231016054755.915155-4-hch@lst.de>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Mon, 16 Oct 2023 16:40:29 +0100
Message-ID: <CA+V-a8sdZa8TiTsjY+u3rywFsXY2yKmZ0vWg900NMxVc_NRX7Q@mail.gmail.com>
Subject: Re: [PATCH 03/12] soc: renesas: ARCH_R9A07G043 depends on !RISCV_ISA_ZICBOM
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
> ARCH_R9A07G043 has it's own non-standard global pool based DMA coherent
> allocator, which conflicts with the remap based RISCV_ISA_ZICBOM version.
> Add a proper dependency.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/soc/renesas/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
> index 880c544bb2dfda..f1696d3b5018d0 100644
> --- a/drivers/soc/renesas/Kconfig
> +++ b/drivers/soc/renesas/Kconfig
> @@ -334,6 +334,7 @@ if RISCV
>  config ARCH_R9A07G043
>         bool "RISC-V Platform support for RZ/Five"
>         depends on NONPORTABLE
> +       depends on !RISCV_ISA_ZICBOM
>         select ARCH_RZG2L
>         select AX45MP_L2_CACHE
>         select DMA_GLOBAL_POOL
> --
> 2.39.2
>
