Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B958010C2E3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Nov 2019 04:39:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727133AbfK1DjA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 27 Nov 2019 22:39:00 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([81.169.146.169]:16546 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727113AbfK1DjA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Nov 2019 22:39:00 -0500
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzmt2bYDnKIKaws6YXTsc4="
X-RZG-CLASS-ID: mo00
Received: from oxapp04-01.back.ox.d0m.de
        by smtp-ox.front (RZmta 46.0.0 AUTH)
        with ESMTPSA id 604beevAS3ct2Ip
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Thu, 28 Nov 2019 04:38:55 +0100 (CET)
Date:   Thu, 28 Nov 2019 04:38:55 +0100 (CET)
From:   Ulrich Hecht <uli@fpond.eu>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     Alexander Graf <graf@amazon.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Christoffer Dall <christoffer.dall@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, qemu-devel@nongnu.org
Message-ID: <1979629875.1467698.1574912335764@webmail.strato.com>
In-Reply-To: <20191127084253.16356-3-geert+renesas@glider.be>
References: <20191127084253.16356-1-geert+renesas@glider.be>
 <20191127084253.16356-3-geert+renesas@glider.be>
Subject: Re: [PATCH v3 2/7] gpiolib: Add support for gpiochipN-based table
 lookup
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.1-Rev22
X-Originating-IP: 112.198.74.215
X-Originating-Client: open-xchange-appsuite
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


> On November 27, 2019 at 9:42 AM Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> 
> 
> Currently GPIO controllers can only be referred to by label in GPIO
> lookup tables.
> 
> Add support for looking them up by "gpiochipN" name, with "N" either the
> corresponding GPIO device's ID number, or the GPIO controller's first
> GPIO number.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> If this is rejected, the GPIO Aggregator documentation must be updated.
> 
> The second variant is currently used by the legacy sysfs interface only,
> so perhaps the chip->base check should be dropped?
> 
> v3:
>   - New.
> ---
>  drivers/gpio/gpiolib.c | 22 +++++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index c9e47620d2434983..d24a3d79dcfe69ad 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1746,9 +1746,29 @@ static int gpiochip_match_name(struct gpio_chip *chip, void *data)
>  	return !strcmp(chip->label, name);
>  }
>  
> +static int gpiochip_match_id(struct gpio_chip *chip, void *data)
> +{
> +	int id = (uintptr_t)data;
> +
> +	return id == chip->base || id == chip->gpiodev->id;
> +}
> +
>  static struct gpio_chip *find_chip_by_name(const char *name)
>  {
> -	return gpiochip_find((void *)name, gpiochip_match_name);
> +	struct gpio_chip *chip;
> +	int id;
> +
> +	chip = gpiochip_find((void *)name, gpiochip_match_name);
> +	if (chip)
> +		return chip;
> +
> +	if (!str_has_prefix(name, GPIOCHIP_NAME))
> +		return NULL;
> +
> +	if (kstrtoint(name + strlen(GPIOCHIP_NAME), 10, &id))
> +		return NULL;
> +
> +	return gpiochip_find((void *)(uintptr_t)id, gpiochip_match_id);
>  }
>  
>  #ifdef CONFIG_GPIOLIB_IRQCHIP
> -- 
> 2.17.1
>

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

CU
Uli
