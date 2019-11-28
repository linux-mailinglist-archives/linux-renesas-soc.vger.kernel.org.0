Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 096BF10C2E4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Nov 2019 04:39:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727139AbfK1DjX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 27 Nov 2019 22:39:23 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.80]:25729 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727113AbfK1DjX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Nov 2019 22:39:23 -0500
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzmt2bYDnKIKaws6YXTsc4="
X-RZG-CLASS-ID: mo00
Received: from oxapp04-01.back.ox.d0m.de
        by smtp-ox.front (RZmta 46.0.0 AUTH)
        with ESMTPSA id 604beevAS3dE2Ir
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Thu, 28 Nov 2019 04:39:14 +0100 (CET)
Date:   Thu, 28 Nov 2019 04:39:14 +0100 (CET)
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
Message-ID: <1581673808.1467700.1574912354104@webmail.strato.com>
In-Reply-To: <20191127084253.16356-4-geert+renesas@glider.be>
References: <20191127084253.16356-1-geert+renesas@glider.be>
 <20191127084253.16356-4-geert+renesas@glider.be>
Subject: Re: [PATCH v3 3/7] gpiolib: Add support for GPIO line table lookup
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
> Currently GPIOs can only be referred to by GPIO controller and offset in
> GPIO lookup tables.
> 
> Add support for looking them up by line name.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> If this is rejected, the GPIO Aggregator documentation and code must be
> updated.
> 
> v3:
>   - New.
> ---
>  drivers/gpio/gpiolib.c       | 12 ++++++++++++
>  include/linux/gpio/machine.h |  2 +-
>  2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index d24a3d79dcfe69ad..cb608512ad6bbded 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -4475,6 +4475,18 @@ static struct gpio_desc *gpiod_find(struct device *dev, const char *con_id,
>  		if (p->con_id && (!con_id || strcmp(p->con_id, con_id)))
>  			continue;
>  
> +		if (p->chip_hwnum == (u16)-1) {
> +			desc = gpio_name_to_desc(p->chip_label);
> +			if (desc) {
> +				*flags = p->flags;
> +				return desc;
> +			}
> +
> +			dev_warn(dev, "cannot find GPIO line %s, deferring\n",
> +				 p->chip_label);
> +			return ERR_PTR(-EPROBE_DEFER);
> +		}
> +
>  		chip = find_chip_by_name(p->chip_label);
>  
>  		if (!chip) {
> diff --git a/include/linux/gpio/machine.h b/include/linux/gpio/machine.h
> index 1ebe5be05d5f81fa..84c1c097e55eefaf 100644
> --- a/include/linux/gpio/machine.h
> +++ b/include/linux/gpio/machine.h
> @@ -31,7 +31,7 @@ enum gpio_lookup_flags {
>   */
>  struct gpiod_lookup {
>  	const char *chip_label;
> -	u16 chip_hwnum;
> +	u16 chip_hwnum;			/* if -1, chip_label is named line */

The magic number "-1" might deserve a #define.

>  	const char *con_id;
>  	unsigned int idx;
>  	unsigned long flags;
> -- 
> 2.17.1
>

With or without #define,
Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

CU
Uli
