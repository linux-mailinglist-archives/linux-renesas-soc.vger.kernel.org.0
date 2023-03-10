Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DDD46B4086
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Mar 2023 14:36:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229469AbjCJNgT convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Mar 2023 08:36:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbjCJNgS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Mar 2023 08:36:18 -0500
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02BB21091E0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Mar 2023 05:36:17 -0800 (PST)
Received: by mail-qv1-f48.google.com with SMTP id ev13so3568792qvb.10
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Mar 2023 05:36:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678455376;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6l24vRjwYopOU27PH/6yPrTXYoPEf6Lk2xKIV6+tzNE=;
        b=RCCys+0pDKNAyc28QL1gNnuTzZZeiZIkY5agIBIJ7LKauxZ7+92DaFfqS+oGI66boZ
         NW5wXz0Vlm6aT3jE78n6mwunCDzLW2GwSs3tIF3A1ePQJitdDlTgdpZfyoKUsaxffiYb
         kC9ceR9mw2bfXzHdr/zegN+uo7Zyz6f44jNPmRmiwfXz0Y6iANDOwmMKZzCEMiYZFbfR
         o9eVKubAyq/0MwFRMQASVcJYCGjCXZPqnKYIWwCD20alZCuI5tysKy2/W0MN9kGvFu5o
         IjCriEzKRZcesr6a36Ya2WBSgwlsNw6FC87Dx1UPcq8jHuVTPaksi2HrZSZfwCdrBxbQ
         kxnw==
X-Gm-Message-State: AO0yUKX47LBTVqE2pbnUGxDgExAbXQH+ZPlZRhjDdGFqBotK+6R0DkwP
        fVLgQVDCgBArkIqi9cyJcVMliajaU/ukmQ==
X-Google-Smtp-Source: AK7set/CgTSlmdt1dQo95CGEix7JyGE09Hy1gR1iOFWA+KKB9xcfhXfmtUJEGSl5zmGktlpRaCosUw==
X-Received: by 2002:a05:6214:e8d:b0:56e:a4c5:9d9d with SMTP id hf13-20020a0562140e8d00b0056ea4c59d9dmr9805943qvb.22.1678455375845;
        Fri, 10 Mar 2023 05:36:15 -0800 (PST)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id t185-20020ae9dfc2000000b0073b45004754sm1342386qkf.34.2023.03.10.05.36.15
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Mar 2023 05:36:15 -0800 (PST)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-536bf92b55cso97361597b3.12
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Mar 2023 05:36:15 -0800 (PST)
X-Received: by 2002:a81:ae4a:0:b0:52e:b7cf:4cd1 with SMTP id
 g10-20020a81ae4a000000b0052eb7cf4cd1mr16370485ywk.5.1678455375008; Fri, 10
 Mar 2023 05:36:15 -0800 (PST)
MIME-Version: 1.0
References: <87r0u1l9vc.wl-kuninori.morimoto.gx@renesas.com> <87pm9ll9ue.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87pm9ll9ue.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 10 Mar 2023 14:36:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU0jjjw_1tojMeCbuV3oX_9n3GsOhX8y4RUUHUJJ33iDQ@mail.gmail.com>
Message-ID: <CAMuHMdU0jjjw_1tojMeCbuV3oX_9n3GsOhX8y4RUUHUJJ33iDQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: renesas: r8a779g0: R-Car Sound support
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
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

Hi Morimoto-san,

On Tue, Mar 7, 2023 at 12:49 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> This patch adds Sound support for R-Car V4H.
>
> Signed-off-by: Linh Phung <linh.phung.jy@renesas.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> @@ -185,6 +185,15 @@ scif_clk: scif {
>                 clock-frequency = <0>;
>         };
>
> +       /*
> +        * The clock from AUDIO_CLKIN pin are configured as 0 Hz fixed frequency
> +        */
> +       audio_clkin: audio_clkin {

Moving up to preserve sort order (alphabetically).

> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               clock-frequency = <0>;
> +       };
> +
>         soc: soc {
>                 compatible = "simple-bus";
>                 interrupt-parent = <&gic>;

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.4, with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
