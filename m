Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF96E10C2E2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Nov 2019 04:38:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727117AbfK1Di5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 27 Nov 2019 22:38:57 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([81.169.146.169]:31227 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727113AbfK1Di5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Nov 2019 22:38:57 -0500
X-Greylist: delayed 147206 seconds by postgrey-1.27 at vger.kernel.org; Wed, 27 Nov 2019 22:38:55 EST
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzmt2bYDnKIKaws6YXTsc4="
X-RZG-CLASS-ID: mo00
Received: from oxapp04-01.back.ox.d0m.de
        by smtp-ox.front (RZmta 46.0.0 AUTH)
        with ESMTPSA id 604beevAS3cd2Io
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Thu, 28 Nov 2019 04:38:39 +0100 (CET)
Date:   Thu, 28 Nov 2019 04:38:39 +0100 (CET)
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
Message-ID: <1936168849.1467696.1574912319589@webmail.strato.com>
In-Reply-To: <20191127084253.16356-2-geert+renesas@glider.be>
References: <20191127084253.16356-1-geert+renesas@glider.be>
 <20191127084253.16356-2-geert+renesas@glider.be>
Subject: Re: [PATCH v3 1/7] gpiolib: Add GPIOCHIP_NAME definition
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
> The string literal "gpiochip" is used in several places.
> Add a definition for it, and use it everywhere, to make sure everything
> stays in sync.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v3:
>   - New.
> ---
>  drivers/gpio/gpiolib-sysfs.c | 7 +++----
>  drivers/gpio/gpiolib.c       | 4 ++--
>  drivers/gpio/gpiolib.h       | 2 ++
>  3 files changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
> index fbf6b1a0a4fae6ce..23e3d335cd543d53 100644
> --- a/drivers/gpio/gpiolib-sysfs.c
> +++ b/drivers/gpio/gpiolib-sysfs.c
> @@ -762,10 +762,9 @@ int gpiochip_sysfs_register(struct gpio_device *gdev)
>  		parent = &gdev->dev;
>  
>  	/* use chip->base for the ID; it's already known to be unique */
> -	dev = device_create_with_groups(&gpio_class, parent,
> -					MKDEV(0, 0),
> -					chip, gpiochip_groups,
> -					"gpiochip%d", chip->base);
> +	dev = device_create_with_groups(&gpio_class, parent, MKDEV(0, 0), chip,
> +					gpiochip_groups, GPIOCHIP_NAME "%d",
> +					chip->base);
>  	if (IS_ERR(dev))
>  		return PTR_ERR(dev);
>  
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index dce0b31f4125a6b3..c9e47620d2434983 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1419,7 +1419,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
>  		ret = gdev->id;
>  		goto err_free_gdev;
>  	}
> -	dev_set_name(&gdev->dev, "gpiochip%d", gdev->id);
> +	dev_set_name(&gdev->dev, GPIOCHIP_NAME "%d", gdev->id);
>  	device_initialize(&gdev->dev);
>  	dev_set_drvdata(&gdev->dev, gdev);
>  	if (chip->parent && chip->parent->driver)
> @@ -5105,7 +5105,7 @@ static int __init gpiolib_dev_init(void)
>  		return ret;
>  	}
>  
> -	ret = alloc_chrdev_region(&gpio_devt, 0, GPIO_DEV_MAX, "gpiochip");
> +	ret = alloc_chrdev_region(&gpio_devt, 0, GPIO_DEV_MAX, GPIOCHIP_NAME);
>  	if (ret < 0) {
>  		pr_err("gpiolib: failed to allocate char dev region\n");
>  		bus_unregister(&gpio_bus_type);
> diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
> index ca9bc1e4803c2979..a4a759920faa48ab 100644
> --- a/drivers/gpio/gpiolib.h
> +++ b/drivers/gpio/gpiolib.h
> @@ -16,6 +16,8 @@
>  #include <linux/module.h>
>  #include <linux/cdev.h>
>  
> +#define GPIOCHIP_NAME	"gpiochip"
> +
>  /**
>   * struct gpio_device - internal state container for GPIO devices
>   * @id: numerical ID number for the GPIO chip
> -- 
> 2.17.1
>

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

CU
Uli
