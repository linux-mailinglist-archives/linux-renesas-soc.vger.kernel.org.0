Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5970A6968B0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Feb 2023 17:00:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230162AbjBNQAI convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Feb 2023 11:00:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233325AbjBNP7x (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Feb 2023 10:59:53 -0500
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4689213A
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Feb 2023 07:59:33 -0800 (PST)
Received: by mail-qt1-f172.google.com with SMTP id g18so17959390qtb.6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Feb 2023 07:59:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T17JKqdhVqtAg8TAg4LrRQbjDIgJQfHMsURmnXUTLK4=;
        b=UuxFTgBoyJ3YTJSnyw6TR0DgGUsvfZzMlkv6Bn+xoRgukmjBDAY7W+d6lhmbFxFd40
         74R62u4Gu8OieZyhhvzOmS+9EDQu5ZBEKMpE/MmofgR8knAwOz0lEWE7OWdZpTTLafzh
         lQgQ4S+hfrKdlDf91AW+9mWaraeY3PSDyZTNZbgMSnhJutWrZBf/yF3H2LGiB7N2iHDO
         Z87cKJi9KvlCweS2Wse7VZOVbsnsHxr82b7Yda/uQ6rhipz518stsojs80t7MdoIM5n6
         GBpmSwxMvxWbAY1CRY7AkNEYNMQCeYEWSeHAyPRe9VWHZhP8PLf11WBjgUpRM50kaQtx
         Bb9Q==
X-Gm-Message-State: AO0yUKU/lY1TCn1WaNY89mV9r3OVXptC8Hw3ZaD7MnYHI3XjopERB6AG
        rcs/prEGx5OqLcloqrCv4YNZkeS+bMIol6TE
X-Google-Smtp-Source: AK7set/AFEJF4tG5wKCKiHB7sp0YsJpeV5bHJWtUGSS3bz9nZs086rddCa8EYPtrUd6iYg3D1ytLZA==
X-Received: by 2002:ac8:5b15:0:b0:3b8:1743:89dc with SMTP id m21-20020ac85b15000000b003b8174389dcmr3957527qtw.2.1676390372792;
        Tue, 14 Feb 2023 07:59:32 -0800 (PST)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id a20-20020ac81094000000b003b9ba2cf068sm11424120qtj.56.2023.02.14.07.59.32
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 07:59:32 -0800 (PST)
Received: by mail-yb1-f177.google.com with SMTP id x4so18742538ybp.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Feb 2023 07:59:32 -0800 (PST)
X-Received: by 2002:a25:f30f:0:b0:8c2:240e:bd05 with SMTP id
 c15-20020a25f30f000000b008c2240ebd05mr361866ybs.359.1676390372208; Tue, 14
 Feb 2023 07:59:32 -0800 (PST)
MIME-Version: 1.0
References: <20230211150012.3824154-1-niklas.soderlund+renesas@ragnatech.se> <20230211150012.3824154-2-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20230211150012.3824154-2-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 14 Feb 2023 16:59:20 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXqC-i1abuiZ2Z3oRVom59PWhdiKS-x3s+Bsu32TF-DEQ@mail.gmail.com>
Message-ID: <CAMuHMdXqC-i1abuiZ2Z3oRVom59PWhdiKS-x3s+Bsu32TF-DEQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a779g0: Add and connect all
 CSI-2, ISP and VIN nodes
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Niklas,

On Sat, Feb 11, 2023 at 4:00 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> The V4H have 16 VIN, 2 CSI-2 and 2 ISP nodes that interact with each
> other for video capture. Add all nodes and record how they are
> interconnected.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi

> @@ -1304,6 +1752,58 @@ vspd1: vsp@fea28000 {
>                         renesas,fcp = <&fcpvd1>;
>                 };
>
> +               csi40: csi2@fe500000 {

I'll move these up while applying, to preserve sort order (by unit
address).

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.4.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
