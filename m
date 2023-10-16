Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B50A37CADED
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Oct 2023 17:44:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231782AbjJPPns (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Oct 2023 11:43:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233804AbjJPPnq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Oct 2023 11:43:46 -0400
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com [IPv6:2607:f8b0:4864:20::a32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 014A5103;
        Mon, 16 Oct 2023 08:43:44 -0700 (PDT)
Received: by mail-vk1-xa32.google.com with SMTP id 71dfb90a1353d-4a06fb5331bso1849979e0c.0;
        Mon, 16 Oct 2023 08:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697471024; x=1698075824; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W5VhkbLijcsIjEPutw+pmedC1vRGyDo1Fb4EwWhkNwo=;
        b=KGtTZ1J0xkXxmuKtAwZX3GyXsFrD3m33OgVwLkTHQkbenNaqmoD7LAKAoGBvY2TaIu
         JXHMTk9XjTE0sz19zXSryTxttjITFS0lNslI5T4spx48U8ToOS2Gs8lYX6FcWi5oaBMa
         PBTlOx4E5DPPgv3d5oGbJLeA9r8mQ3uuCbB/+GZcQLWnZ61yJNINaTruLI3JYOuoBOyl
         zjiJbDXbSV+XvAzp+HOliAXfppYPeJUy9S8YQP86Sk7kZrl4xI6JM0Qop+VAsF1XtFtZ
         1w/oLnwGsy9tWlo++c1MMGb1Dk8/84C583N6qph4U4rwaJS76BljY8Lrz79NWbFHQ2l9
         7U1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697471024; x=1698075824;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W5VhkbLijcsIjEPutw+pmedC1vRGyDo1Fb4EwWhkNwo=;
        b=qZMsWNWZeIaVYHsryMeVQ88cBsIO5xATBdBrA5BcWCrVFwevBnDtrNma88JSCyuyxR
         2CGMQzXhO8q87QWrIEVP3aGceDn3KGQwDwKPb+eXA7d54KA2hWeepip6BbKBfZ+trMhl
         CyHMH8gQiI+TmBUD1ct75cHzvSx9YjU91Au8YGC0y9loFWhBhCw3PRqfcWm3ynjDswch
         ZTjMq/acj3GeHmc1CeMD4rePOkt4/8FeGUL0nkxXnGHW+7YqI1RWEcbkK1f56vaNWohq
         yg35NpB1H3fGjh4f+bj5sYyTJ/XLS8it8EXRugr2l2vbFis6oPzH9PqzMQl/hnDmy27q
         1wFg==
X-Gm-Message-State: AOJu0YxFX/uxqhvQDiD6lAAsmBILJYlfvLCB9L35KFKNeO49VWNKa1vN
        YUzI+t70GsPPNm47zidfaBCp7LvJ+k+x17EmR4E=
X-Google-Smtp-Source: AGHT+IG/WMjMrGYCGsuwhthBEKZ8VCVuxCi3PoeLoYHu5J1bxDK0qcF2TAbbJo60X/pGsL22e+tEj0vGdiYsm/MFMMM=
X-Received: by 2002:a1f:e404:0:b0:49a:1a56:945c with SMTP id
 b4-20020a1fe404000000b0049a1a56945cmr28517495vkh.13.1697471023853; Mon, 16
 Oct 2023 08:43:43 -0700 (PDT)
MIME-Version: 1.0
References: <20231016054755.915155-1-hch@lst.de> <20231016054755.915155-5-hch@lst.de>
In-Reply-To: <20231016054755.915155-5-hch@lst.de>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Mon, 16 Oct 2023 16:42:27 +0100
Message-ID: <CA+V-a8skxbuRkU9PKUZRkQkp-y0PKeYx4WhVcJtktAT-VEgmCA@mail.gmail.com>
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
Can we keep this alphabetical sorted please, with that fixed:

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

>         select ERRATA_ANDES if RISCV_SBI
>         select ERRATA_ANDES_CMO if ERRATA_ANDES
>
> --
> 2.39.2
>
