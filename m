Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 683EE414F2F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Sep 2021 19:34:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236753AbhIVRfk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 Sep 2021 13:35:40 -0400
Received: from mail-vk1-f170.google.com ([209.85.221.170]:41857 "EHLO
        mail-vk1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236701AbhIVRfi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Sep 2021 13:35:38 -0400
Received: by mail-vk1-f170.google.com with SMTP id h132so1479143vke.8
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Sep 2021 10:34:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7SAKH4pdbYY90xpPUfQ1RjiGxnkEVxnHyl8jZSF9Kk8=;
        b=i12M8UoAr6IoxbbN2c1VheKrx7wMaexWKTwgMxPlZNciZCQobEU7KC8PQLkSWcIQzb
         mE+yfIvbreNGNfNg7wMnukNoTLdcinpMmMZcJl9cwe7xQNjUUfAsNndULMi8WByKGhry
         Wh0v/btInOhTTWatNwPiqbK0cAGcUbcj5Eb6bvtxt9Gud3Fz0DAgPQOqMOkP3lm2nRlk
         sHjMpF2VG3wk9YrC/L2DVi7Ody/btzN8wXp0Zl3cTcYWfCPzYHiAbjf9gnpohVd0HagB
         2Qf4A8UaSgD5WkTUvqCfuz+ty42Aqunq7PX3VfiWbULDy38gf7lcQ3Blaub5tbxtF339
         KKLQ==
X-Gm-Message-State: AOAM530di2Q0uG6q2zcjZnBYzyZgV1uAchldalVkTl6OS7FMpwzpLZJy
        dUt4HonejMW/9PxsAzSB7KOyVVoEq3jTKMWq8zM=
X-Google-Smtp-Source: ABdhPJxO0CTC9NL5l88SmMdD8fY5WlJagcCsPgrGSDOYLWhW/nAvIOh7hBcsIlTMFSw35HyQg0UhFAQPFZh4gIJFGB0=
X-Received: by 2002:a1f:230c:: with SMTP id j12mr1012590vkj.11.1632332047763;
 Wed, 22 Sep 2021 10:34:07 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1624460378.git.geert+renesas@glider.be> <b7b53970-58ea-f27f-4190-0066cb30cb05@ideasonboard.com>
 <CAMuHMdWSeeifBLqi4S6LrgcQg9E_1xFXzLzBBBqMf1Fc0kbMhg@mail.gmail.com> <e7aa6fb0-02b7-10d8-d1a0-6d9f8d727570@ideasonboard.com>
In-Reply-To: <e7aa6fb0-02b7-10d8-d1a0-6d9f8d727570@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 22 Sep 2021 19:33:56 +0200
Message-ID: <CAMuHMdV4Z=h6Y8k8j7tqaapPkAuaykb_hHWt6v6vQkZRK6pYzQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] arm64: dts: renesas: r8a779a0: Add INTC-EX support
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

On Wed, Sep 22, 2021 at 4:14 PM Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
> I've been trying to test this on the Falcon-V3U

Thanks for testing!

> On 24/06/2021 09:07, Geert Uytterhoeven wrote:
> > On Wed, Jun 23, 2021 at 6:13 PM Kieran Bingham
> > <kieran.bingham@ideasonboard.com> wrote:
> >> On 23/06/2021 16:02, Geert Uytterhoeven wrote:
> >>> This patch series adds support for the Interrupt Controller for External
> >>> Devices (INT-EC) in the Renesas R-Car V3U (r8a779a0) SoC.
> >>>
> >>> As there are two known issues, I'm posting this to a limited audience:
> >>>
> >>>   1. External interrupts have not been tested.

> >>>      Alternatively, with physical access, IRQ0 is available on test
> >>>      point CP47, and IRQ2 on the GPIO CN.
> >>
> >> I do have physical access, so I can trigger this - Is there a suitable
> >> voltage or condition I can apply? (I.e. take a signal from a nearby pin
> >> to short it?)
> >
> > As IRQ0 is driven by the single gate U59, you better don't cause logic
> > conflicts, and play with IRQ2 instead.
> >
> > Note that high level is SPI_D1.8V/3.3V, which is 1.8V by default!
> > The GPIO CN connector carries a.o. SPI_D1.8V/3.3V and GND.
> > Internal pull-up should be enabled for IRQ2 by reset state, but you
> > may want to measure the pin's voltage to be sure.
>
> Pin7 appears to be IRQ2. It is reading at 1.8v.
> Pin 5 (SPI_D1.8v/3.3v) is reading at 1.8v
> Pin 3 (D3.3v) no prizes for guessing here.
>
> And of course pin 1 is ground.
>
> So I have some wires I can play with.
>
> > To configure pin control, you need to add the following, and hook it
> > up to the pfc node:
> >
> >         irq2_pins: irq2 {
> >                 groups = "intc_ex_irq2";
> >                 function = "intc_ex";
> >         };
> >
> > You should be able to test this using gpio-keys, with a key subnode that
> > has an interrupts instead of a gpios property.
>
> I'm afraid I haven't been able to successfully test this. I have this
> series applied and have tried the following:

> --- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
> @@ -10,6 +10,10 @@
>  #include "r8a779a0-falcon-csi-dsi.dtsi"
>  #include "r8a779a0-falcon-ethernet.dtsi"
>
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/gpio-keys.h>
> +#include <dt-bindings/input/input.h>
> +
>  / {
>         model = "Renesas Falcon CPU and Breakout boards based on r8a779a0";
>         compatible = "renesas,falcon-breakout", "renesas,falcon-cpu",
> "renesas,r8a779a0";
> @@ -17,6 +21,23 @@ / {
>         aliases {
>                 ethernet0 = &avb0;
>         };
> +
> +       gpio_keys {
> +               compatible = "gpio-keys";
> +
> +               btn1 {
> +                       pinctrl-0 = <&irq2_pins>;
> +                       pinctrl-names = "default";
> +
> +                       debounce-interval = <50>;
> +                       label = "button1";
> +                       linux,code = <KEY_1>;
> +                       interrupt-parent = <&intc_ex>;
> +                       interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
> +
> +                       //gpios = <&gpio1 26 GPIO_ACTIVE_LOW>;
> +               };
> +       };
>  };
>
>  &avb0 {
> @@ -45,6 +66,14 @@ eeprom@51 {
>  };
>
>  &pfc {
> +       // Intc_ex testing
> +       irq2_pins: irq2 {
> +               groups = "intc_ex_irq2";
> +               function = "intc_ex";
> +
> +               bias-pull-up;
> +       };
> +
>         avb0_pins: avb0 {
>                 mux {
>                         groups = "avb0_link", "avb0_mdio", "avb0_rgmii",

Looks good to me.

> diff --git a/drivers/pinctrl/renesas/core.c b/drivers/pinctrl/renesas/core.c
> index ef8ef05ba930..966883c6c64c 100644
> --- a/drivers/pinctrl/renesas/core.c
> +++ b/drivers/pinctrl/renesas/core.c
> @@ -228,7 +228,7 @@ static void sh_pfc_write_config_reg(struct sh_pfc *pfc,
>
>         sh_pfc_config_reg_helper(pfc, crp, field, &mapped_reg, &mask, &pos);
>
> -       dev_dbg(pfc->dev, "write_reg addr = %x, value = 0x%x, field = %u, "
> +       dev_err(pfc->dev, "KB: write_reg addr = %x, value = 0x%x, field = %u, "
>                 "r_width = %u, f_width = %u\n",
>                 crp->reg, value, field, crp->reg_width, hweight32(mask));
>
> And I have ribbon cable with the pitch for cn4 now which allows me to
> connect pin 7 to pin 1 to ground it.
>
>
> I use
>  sudo evtest /dev/input/event0
>
> to monitor the line for changes, and grounding pin7 has no effect in
> this configuration.
>
>
> However, to try to sanity check my test, I changed the gpio-keys to use
> gpio1 26 directly - disabling the pinctrl, and using the gpios reference
> directly instead :
>
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
> b/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
> index 1286b553e370..af85881de2c4 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
> @@ -26,16 +26,11 @@ gpio_keys {
>                 compatible = "gpio-keys";
>
>                 btn1 {
> -                       pinctrl-0 = <&irq2_pins>;
> -                       pinctrl-names = "default";
> -
>                         debounce-interval = <50>;
>                         label = "button1";
>                         linux,code = <KEY_1>;
> -                       interrupt-parent = <&intc_ex>;
> -                       interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
>
> -                       //gpios = <&gpio1 26 GPIO_ACTIVE_LOW>;
> +                       gpios = <&gpio1 26 GPIO_ACTIVE_LOW>;
>                 };
>         };
>  };

Looks almost good to me.
You probably still want to enable bias-pull-up for GP1_26, but as
it works without...

> This shows active key events when grounding pin 7 to pin 1...
> > kbingham@falcon-v3u:~$ sudo evtest /dev/input/event0
> > Input driver version is 1.0.1
> > Input device ID: bus 0x19 vendor 0x1 product 0x1 version 0x100
> > Input device name: "gpio_keys"
> > Supported events:
> >   Event type 0 (EV_SYN)
> >   Event type 1 (EV_KEY)
> >     Event code 2 (KEY_1)
> > Properties:
> > Testing ... (interrupt to exit)
> > Event: time 1632319971.126234, type 1 (EV_KEY), code 2 (KEY_1), value 1
> > Event: time 1632319971.126234, -------------- SYN_REPORT ------------
> > Event: time 1632319971.579966, type 1 (EV_KEY), code 2 (KEY_1), value 0
> > Event: time 1632319971.579966, -------------- SYN_REPORT ------------
> > Event: time 1632319981.461018, type 1 (EV_KEY), code 2 (KEY_1), value 1
> > Event: time 1632319981.461018, -------------- SYN_REPORT ------------
> > Event: time 1632319981.835693, type 1 (EV_KEY), code 2 (KEY_1), value 0
> > Event: time 1632319981.835693, -------------- SYN_REPORT ------------
> > Event: time 1632319982.112104, type 1 (EV_KEY), code 2 (KEY_1), value 1
> > Event: time 1632319982.112104, -------------- SYN_REPORT ------------

Good!

> If there's anything else you'd like me to test or change let me know.

There are still several things that could be wrong:
  - Bug in the pin control tables,
  - Wrong parent interrupt description,
  - Undocumented INTC-EX module clock is turned off
    (does it retain register values?),
  - Wrong initial values in INTC-EX registers the driver doesn't touch,
  - ...

Can you print the value of the INTC-EX MONITOR register?
It should match the state of the external pins.

> > This might be a good opportunity to wire up the slide and push switches
> > (SW46-49) as gpio-keys, too...

Any chance with these? ;-)

Thanks again!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
