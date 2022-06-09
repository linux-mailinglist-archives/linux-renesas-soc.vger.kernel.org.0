Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3B485446A8
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jun 2022 10:57:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239571AbiFII4Q (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Jun 2022 04:56:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240927AbiFII4G (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Jun 2022 04:56:06 -0400
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1B8B14AF4A
        for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Jun 2022 01:54:24 -0700 (PDT)
Received: by mail-qt1-f181.google.com with SMTP id x18so13801907qtj.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Jun 2022 01:54:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+jt7SxHDMfv3hOgpgMnA7HmRbiH0W2JhDnsVQ+iVJNM=;
        b=KvcWdcaH3jXfGeKY97xjYdVyPs8ZB+3W4dcoZ6NqDHk4SAYmzCgJU3xUrZmwDvH2Oh
         ETC5uCnOL3MJljj0F6KBEon1mExFTehw4UxcW0K/O4DW3m9KfRYg5BRJnn05Ej2lQOjV
         MrvHK2swx2RUd0WoNU4ktBwYmD4VKsQpsTVxS4RITnyHG8wSVv+k6N/YIAo/Isexp0++
         VFRUGlaKriUBkekzz9vUNV5bqUblsrGgTCFrglRYkWz/DWRomgtK/4y+WKrLtL8CgAfp
         etLs9roBCOB6rmWIQqLBZXqQOYGKVWuytWlnT/QpFOIu+cnsn+D1jKdKH1oH0wPKZNqu
         ugcQ==
X-Gm-Message-State: AOAM532vOVy3VoKorfdH2Ceh7QhSfG+fzQxjnF2AeFATHWl1iJw2FJ9S
        tHikp9enjhHydWOyOfWEgI+9mwfsJRzckw==
X-Google-Smtp-Source: ABdhPJyIkkc+X0DLkMwZ73ro7P6AOEtWXceGDXQKVrvJAFtiVDmby42TQKOBGetu8/h2IUhAFwp5RA==
X-Received: by 2002:a05:622a:1185:b0:304:f783:e9b7 with SMTP id m5-20020a05622a118500b00304f783e9b7mr10945812qtk.647.1654764863590;
        Thu, 09 Jun 2022 01:54:23 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id k8-20020a05620a414800b006a6ae9150fesm12435104qko.41.2022.06.09.01.54.23
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jun 2022 01:54:23 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id e184so40649169ybf.8
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Jun 2022 01:54:23 -0700 (PDT)
X-Received: by 2002:a25:d748:0:b0:65c:6b00:55af with SMTP id
 o69-20020a25d748000000b0065c6b0055afmr37629123ybg.365.1654764862808; Thu, 09
 Jun 2022 01:54:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220603233928.22004-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20220603233928.22004-1-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 9 Jun 2022 10:54:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWJEY5-Ng8C4T_VpVBCZuuCwoXFbh8n73uD3S4QjK7o0g@mail.gmail.com>
Message-ID: <CAMuHMdWJEY5-Ng8C4T_VpVBCZuuCwoXFbh8n73uD3S4QjK7o0g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a779f0: Add SDHI0 support
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Sat, Jun 4, 2022 at 8:58 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Extracted from a larger BSP patch made by Linh Phung.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
> @@ -355,6 +355,18 @@ dmac1: dma-controller@e7351000 {
>                         dma-channels = <16>;
>                 };
>
> +               mmc0: mmc@ee140000 {
> +                       compatible = "renesas,sdhi-r8a779f0",
> +                                    "renesas,rcar-gen4-sdhi";
> +                       reg = <0 0xee140000 0 0x2000>;
> +                       interrupts = <GIC_SPI 236 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 706>;

Missing SD0H clock.
Missing clock-names.

> +                       power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
> +                       resets = <&cpg 706>;
> +                       max-frequency = <200000000>;
> +                       status = "disabled";
> +               };
> +
>                 gic: interrupt-controller@f1000000 {
>                         compatible = "arm,gic-v3";
>                         #interrupt-cells = <3>;

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
