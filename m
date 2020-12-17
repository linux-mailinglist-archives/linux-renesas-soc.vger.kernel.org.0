Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFF272DD065
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Dec 2020 12:32:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725950AbgLQLci (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Dec 2020 06:32:38 -0500
Received: from mail-oi1-f170.google.com ([209.85.167.170]:35120 "EHLO
        mail-oi1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725468AbgLQLcg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Dec 2020 06:32:36 -0500
Received: by mail-oi1-f170.google.com with SMTP id s2so31795258oij.2;
        Thu, 17 Dec 2020 03:32:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8LXjb/Tc1qJnE8Xm7FKVy1Ycjgdxs5RwdN6mlYfTAMM=;
        b=rJGKQhZpy2iQZRTUkYhwOMgVFCGxdAVNAk1vYmg1XEMME+KsV1W7aL1GyhyGbDX4D8
         2fWksSXL+sHqzXB4qW55tho4AGGgW65408buHasoKXGXeoqXud4jr5oDSa9EoRVJ2Yup
         uVV4g/zNbR1pCRFXBGDgovZeg/ki2D0JBKEA/lclMQPyCwdq15tUvw7kAawzdTHUXEk6
         v1KqlohgPWmKBGQxYtVzXqrwrCo5Uobf+Zid70mRxBhxcRAC/dvorfUyTVFxIUbJeJ/M
         W6dqaa9gUlyLmRynb0ucPw1sf2h7ZyA4twNy/bhU2fZlJxwhG6riF1LVdnhOLnnvIqwc
         vpEA==
X-Gm-Message-State: AOAM5335l5mEGWjIZxrrsWHrHv+y0dvYSTblTx3M0NOjgQEhgFKZs/Ba
        moDCA1xrCoIW2TNy1LUWf/Tvkxf/ztawJxHAf69lc5KA
X-Google-Smtp-Source: ABdhPJzZsdsBnfqzp8AaT6fu35qPTYwPZ7ATQL+4PDQoRzADXDEQVvMzXQ1ZBkm22OWLCKIODMgLL4WCoXVWg2XCWtA=
X-Received: by 2002:aca:ec09:: with SMTP id k9mr4396030oih.153.1608204715398;
 Thu, 17 Dec 2020 03:31:55 -0800 (PST)
MIME-Version: 1.0
References: <20201213183759.223246-1-aford173@gmail.com> <20201213183759.223246-13-aford173@gmail.com>
In-Reply-To: <20201213183759.223246-13-aford173@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 17 Dec 2020 12:31:43 +0100
Message-ID: <CAMuHMdXOmBS2ARoJBNb+wWOWJR6fhic+Q67VaFr_Knxc991L=A@mail.gmail.com>
Subject: Re: [PATCH 12/18] arm64: dts: renesas: beacon: Better describe keys
To:     Adam Ford <aford173@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Adam Ford-BE <aford@beaconembedded.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Adam,

On Sun, Dec 13, 2020 at 7:38 PM Adam Ford <aford173@gmail.com> wrote:
> The keys on the baseboard are laid out in an diamond pattern, up, down,
> left, right and center.  Update the descriptions to make it easier to
> read.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> +++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> @@ -40,38 +40,38 @@ hdmi0_con: endpoint {
>         keys {
>                 compatible = "gpio-keys";
>
> -               key-1 {
> +               key-1 { /* S19 */
>                         gpios = <&gpio4 6 GPIO_ACTIVE_LOW>;
>                         linux,code = <KEY_1>;
> -                       label = "Switch-1";
> +                       label = "Up";
>                         wakeup-source;
>                         debounce-interval = <20>;
>                 };
> -               key-2 {
> +               key-2 { /*S20 */
>                         gpios = <&gpio3 13 GPIO_ACTIVE_LOW>;
>                         linux,code = <KEY_2>;
> -                       label = "Switch-2";
> +                       label = "Left";
>                         wakeup-source;
>                         debounce-interval = <20>;
>                 };
> -               key-3 {
> +               key-3 { /* S21 */
>                         gpios = <&gpio5 17 GPIO_ACTIVE_LOW>;
>                         linux,code = <KEY_3>;
> -                       label = "Switch-3";
> +                       label = "Down";
>                         wakeup-source;
>                         debounce-interval = <20>;
>                 };
> -               key-4 {
> +               key-4 { /* S22 */
>                         gpios = <&gpio5 20 GPIO_ACTIVE_LOW>;
>                         linux,code = <KEY_4>;
> -                       label = "Switch-4";
> +                       label = "Right";
>                         wakeup-source;
>                         debounce-interval = <20>;
>                 };
> -               key-5 {
> +               key-5 { /* S23 */
>                         gpios = <&gpio5 22 GPIO_ACTIVE_LOW>;
>                         linux,code = <KEY_5>;
> -                       label = "Switch-4";
> +                       label = "Center";
>                         wakeup-source;
>                         debounce-interval = <20>;
>                 };

Wouldn't it make sense for the linux,code properties to reflect this, and thus
change them to KEY_{UP,LEFT,DOWN,RIGHT,ENTER} (or SELECT, or OK)?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
