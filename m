Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 858A7333998
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Mar 2021 11:11:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232608AbhCJKKO convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 Mar 2021 05:10:14 -0500
Received: from mail-vs1-f52.google.com ([209.85.217.52]:41899 "EHLO
        mail-vs1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232613AbhCJKJy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Mar 2021 05:09:54 -0500
Received: by mail-vs1-f52.google.com with SMTP id s8so8414453vsc.8
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Mar 2021 02:09:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=nQdLVeRcooTh1leexHg+LcVHN8wJsa1HfPZtOGJTqYU=;
        b=OHlvTbCBk2IllcaLb3wJ7rYEFPOij5mU1gv2vmRYe7JCVNib1oGDkUqOfppWxo0c5J
         Bz3z0Dw2M4qljOzeLFSWEBcQZiMhX/59OcUDNu+amhLMWp5MbroZg+Cn6k0XDRiZpDLN
         wqlS4N0SzaCv0rKkSj+0snbIWCe/BYKNQ/+rwwMLGDbaNmuPcg/GMzfefs7dv4VQ6s6a
         9z/wjnnCF2gJxXnm1jhNRQAP7eZN6yeA/9uC8V7yPtJDn4r1WWNWQetc/4wCakbz5S8X
         cGMMzxoDPL0QGzgm/jxxBoAZyQ9M+qZ9pfJbSmyyVzYtSf/NyfMfbTtnsT7CsRrMTlfi
         PEgw==
X-Gm-Message-State: AOAM5331xRbrRdwhHUK4OQiCDD/K6hvdpE2Obky+m6eP/RyA2ROKGEGu
        V6K8FjcKnwNw7mTWVl+ywsaY6yLCNY3LbEkKiLI=
X-Google-Smtp-Source: ABdhPJwrsnohzfdKmgI1ntOfM8YW74D4PHm+F4/xV9w4cOE9tdgb6SEMdJcaVUCBGa1wJDUS9MwqlN8F7+9H+8TguxY=
X-Received: by 2002:a67:f7c6:: with SMTP id a6mr1193422vsp.42.1615370993713;
 Wed, 10 Mar 2021 02:09:53 -0800 (PST)
MIME-Version: 1.0
References: <20210309162811.2624019-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20210309162811.2624019-1-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 10 Mar 2021 11:09:42 +0100
Message-ID: <CAMuHMdVG736E0ENtfic9vSaKEaU86VvRL=pmz8c-NgehdqE5iw@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: r8a779a0: Add thermal support
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Niklas,

On Tue, Mar 9, 2021 at 5:28 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Add support for thermal.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
> * Changes since v1
> - Add fifth TSC node.

Thanks for the update!

> --- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> @@ -260,6 +260,19 @@ sysc: system-controller@e6180000 {
>                         #power-domain-cells = <1>;
>                 };
>
> +               tsc: thermal@e6190000 {
> +                       compatible = "renesas,r8a779a0-thermal";
> +                       reg = <0 0xe6190000 0 0x100>,
> +                             <0 0xe6198000 0 0x100>,
> +                             <0 0xe61a0000 0 0x100>,
> +                             <0 0xe61a8000 0 0x100>,
> +                             <0 0xe61b0000 0 0x100>;

0x100 doesn't cover all registers. What about 0x200?

> +                       clocks = <&cpg CPG_MOD 919>;
> +                       power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> +                       resets = <&cpg 919>;
> +                       #thermal-sensor-cells = <1>;
> +               };

The rest looks good to me.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
