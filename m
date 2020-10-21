Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5886229508B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Oct 2020 18:16:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2444387AbgJUQQE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 21 Oct 2020 12:16:04 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.21]:35442 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732713AbgJUQQD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Oct 2020 12:16:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1603296958;
        s=strato-dkim-0002; d=fpond.eu;
        h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=bqZvEy87OzoHTPXNvjpsVr4rrjHgCD2qfQ332Ib3HFA=;
        b=Qa9wgWSdm8s54PS1gXTGLfChFiAtp63BEFAJ2KHDt1MIsP5JmoMhh2DwdDGJ+tQHt9
        17btbMBhwm587s2mv3++9+ePaZ4XOVQatkJqnjKJYR5I6NFcrv1p63kqc6RFlJPnqUFT
        0lX8sSZvO4p6SgqCGFPz86xwvoeWJtPN1u5vs2vVY92oXp+0CwdSvzs29prfC7am3WZS
        ZpKE+r+GEv4njY96evyB7fwBuU9K8rSLt30OLheuRmCo3g9XhuTncFrCUXtLN5FXni2W
        a98JJjCKU+oP9Dbth4iq+KU5Zw2+Xc5SWet7AqEfplGyVMpSRdM1w3BP8u9y8ekUDzRS
        SMMw==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzvv3qxio1R8fCs/87J3I0="
X-RZG-CLASS-ID: mo00
Received: from oxapp05-03.back.ox.d0m.de
        by smtp-ox.front (RZmta 47.2.1 AUTH)
        with ESMTPSA id a056fbw9LGFm0Ah
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Wed, 21 Oct 2020 18:15:48 +0200 (CEST)
Date:   Wed, 21 Oct 2020 18:15:48 +0200 (CEST)
From:   Ulrich Hecht <uli@fpond.eu>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-clk@vger.kernel.org, Phong Hoang <phong.hoang.wz@renesas.com>
Message-ID: <404689346.305772.1603296948760@webmail.strato.com>
In-Reply-To: <20201019120614.22149-6-geert+renesas@glider.be>
References: <20201019120614.22149-1-geert+renesas@glider.be>
 <20201019120614.22149-6-geert+renesas@glider.be>
Subject: Re: [PATCH/RFC 5/6] gpio: rcar: Add support for R-Car V3U
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.3-Rev25
X-Originating-Client: open-xchange-appsuite
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Thank you for your patch!

> On 10/19/2020 2:06 PM Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> 
>  
> From: Phong Hoang <phong.hoang.wz@renesas.com>
> 
> Add support for the R-Car V3U (r8a779a0) SoC.
> This includes support for the new "General Input Enable" register to
> control input enable.
> 
> Signed-off-by: Phong Hoang <phong.hoang.wz@renesas.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Untested on actual hardware.
> 
> Should input be enabled unconditionally, as recommended by the Hardware
> Manual for backwards compatibility with existing software?
> As per (errata?) commit ae9550f635533b1c ("gpio-rcar: Use OUTDT when
> reading GPIOs configured as output"), the gpio-rcar driver does not use
> the INDT register to read the status of a GPIO line when configured for
> output.
> ---
>  drivers/gpio/gpio-rcar.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
> index a924cf8ac8df7f8f..44d09a0028db49e9 100644
> --- a/drivers/gpio/gpio-rcar.c
> +++ b/drivers/gpio/gpio-rcar.c
> @@ -42,6 +42,7 @@ struct gpio_rcar_priv {
>  	atomic_t wakeup_path;
>  	bool has_outdtsel;
>  	bool has_both_edge_trigger;
> +	bool has_inen;
>  	struct gpio_rcar_bank_info bank_info;
>  };
>  
> @@ -58,6 +59,7 @@ struct gpio_rcar_priv {
>  #define FILONOFF 0x28	/* Chattering Prevention On/Off Register */
>  #define OUTDTSEL 0x40	/* Output Data Select Register */
>  #define BOTHEDGE 0x4c	/* One Edge/Both Edge Select Register */
> +#define INEN 0x50	/* General Input Enable Register */
>  
>  #define RCAR_MAX_GPIO_PER_BANK		32
>  
> @@ -126,6 +128,10 @@ static void gpio_rcar_config_interrupt_input_mode(struct gpio_rcar_priv *p,
>  	if (p->has_both_edge_trigger)
>  		gpio_rcar_modify_bit(p, BOTHEDGE, hwirq, both);
>  
> +	/* Select "Input Enable" in INEN */
> +	if (p->has_inen)
> +		gpio_rcar_modify_bit(p, INEN, hwirq, true);
> +
>  	/* Select "Interrupt Input Mode" in IOINTSEL */
>  	gpio_rcar_modify_bit(p, IOINTSEL, hwirq, true);
>  
> @@ -231,6 +237,10 @@ static void gpio_rcar_config_general_input_output_mode(struct gpio_chip *chip,
>  	/* Configure positive logic in POSNEG */
>  	gpio_rcar_modify_bit(p, POSNEG, gpio, false);
>  
> +	/* Select "Input Enable/Disable" in INEN */

Nit: It's always called "Input Enable" in the DS.

> +	if (p->has_inen)
> +		gpio_rcar_modify_bit(p, INEN, gpio, !output);
> +
>  	/* Select "General Input/Output Mode" in IOINTSEL */
>  	gpio_rcar_modify_bit(p, IOINTSEL, gpio, false);
>  
> @@ -349,16 +359,25 @@ static int gpio_rcar_direction_output(struct gpio_chip *chip, unsigned offset,
>  struct gpio_rcar_info {
>  	bool has_outdtsel;
>  	bool has_both_edge_trigger;
> +	bool has_inen;
>  };
>  
>  static const struct gpio_rcar_info gpio_rcar_info_gen1 = {
>  	.has_outdtsel = false,
>  	.has_both_edge_trigger = false,
> +	.has_inen = false,
>  };
>  
>  static const struct gpio_rcar_info gpio_rcar_info_gen2 = {
>  	.has_outdtsel = true,
>  	.has_both_edge_trigger = true,
> +	.has_inen = false,
> +};
> +
> +static const struct gpio_rcar_info gpio_rcar_info_v3u = {
> +	.has_outdtsel = true,
> +	.has_both_edge_trigger = true,
> +	.has_inen = true,
>  };
>  
>  static const struct of_device_id gpio_rcar_of_table[] = {
> @@ -389,6 +408,9 @@ static const struct of_device_id gpio_rcar_of_table[] = {
>  		.compatible = "renesas,gpio-r8a7796",
>  		/* Gen3 GPIO is identical to Gen2. */
>  		.data = &gpio_rcar_info_gen2,
> +	}, {
> +		.compatible = "renesas,gpio-r8a779a0",
> +		.data = &gpio_rcar_info_v3u,
>  	}, {
>  		.compatible = "renesas,rcar-gen1-gpio",
>  		.data = &gpio_rcar_info_gen1,
> @@ -419,6 +441,7 @@ static int gpio_rcar_parse_dt(struct gpio_rcar_priv *p, unsigned int *npins)
>  	info = of_device_get_match_data(p->dev);
>  	p->has_outdtsel = info->has_outdtsel;
>  	p->has_both_edge_trigger = info->has_both_edge_trigger;
> +	p->has_inen = info->has_inen;
>  
>  	ret = of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3, 0, &args);
>  	*npins = ret == 0 ? args.args[2] : RCAR_MAX_GPIO_PER_BANK;
> -- 
> 2.17.1

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

CU
Uli
