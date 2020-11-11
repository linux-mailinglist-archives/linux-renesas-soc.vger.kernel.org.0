Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DBF62AF034
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Nov 2020 13:00:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726036AbgKKMAk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 Nov 2020 07:00:40 -0500
Received: from relay10.mail.gandi.net ([217.70.178.230]:59931 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726460AbgKKMAf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Nov 2020 07:00:35 -0500
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 23532240007;
        Wed, 11 Nov 2020 12:00:04 +0000 (UTC)
Date:   Wed, 11 Nov 2020 13:00:06 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/4] pinctrl: renesas: r8a7796: Add vin{4,5}_g8 pins
Message-ID: <20201111120006.u46l6ql75to5r3vq@uno.localdomain>
References: <20201110234752.52846-1-niklas.soderlund+renesas@ragnatech.se>
 <20201110234752.52846-3-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201110234752.52846-3-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


On Wed, Nov 11, 2020 at 12:47:50AM +0100, Niklas Söderlund wrote:
> This patch adds VIN{4,5}_g8 support to the R8A7796 SoC.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/pinctrl/renesas/pfc-r8a7796.c | 30 ++++++++++++++++++++++++++-
>  1 file changed, 29 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/renesas/pfc-r8a7796.c b/drivers/pinctrl/renesas/pfc-r8a7796.c
> index 55f0344a3d3e9af6..91591fbcec86c3f8 100644
> --- a/drivers/pinctrl/renesas/pfc-r8a7796.c
> +++ b/drivers/pinctrl/renesas/pfc-r8a7796.c
> @@ -4048,6 +4048,18 @@ static const union vin_data vin4_data_b_mux = {
>  		VI4_DATA22_MARK, VI4_DATA23_MARK,
>  	},
>  };
> +static const unsigned int vin4_g8_pins[] = {
> +	RCAR_GP_PIN(1, 0),  RCAR_GP_PIN(1, 1),
> +	RCAR_GP_PIN(1, 2),  RCAR_GP_PIN(1, 3),
> +	RCAR_GP_PIN(1, 4),  RCAR_GP_PIN(1, 5),
> +	RCAR_GP_PIN(1, 6),  RCAR_GP_PIN(1, 7),
> +};

And to correct myself: r8a77951 and r8a7796 PFC have no empty lines,
others do. So you're patches are consistent with what it's there
already

> +static const unsigned int vin4_g8_mux[] = {
> +	VI4_DATA8_MARK,  VI4_DATA9_MARK,
> +	VI4_DATA10_MARK, VI4_DATA11_MARK,
> +	VI4_DATA12_MARK, VI4_DATA13_MARK,
> +	VI4_DATA14_MARK, VI4_DATA15_MARK,
> +};
>  static const unsigned int vin4_sync_pins[] = {
>  	/* HSYNC#, VSYNC# */
>  	RCAR_GP_PIN(1, 18), RCAR_GP_PIN(1, 17),
> @@ -4102,6 +4114,18 @@ static const union vin_data16 vin5_data_mux = {
>  		VI5_DATA14_MARK, VI5_DATA15_MARK,
>  	},
>  };
> +static const unsigned int vin5_g8_pins[] = {
> +	RCAR_GP_PIN(1, 12), RCAR_GP_PIN(1, 13),
> +	RCAR_GP_PIN(1, 14), RCAR_GP_PIN(1, 15),
> +	RCAR_GP_PIN(1, 4),  RCAR_GP_PIN(1, 5),
> +	RCAR_GP_PIN(1, 6),  RCAR_GP_PIN(1, 7),
> +};
> +static const unsigned int vin5_g8_mux[] = {
> +	VI5_DATA8_MARK,  VI5_DATA9_MARK,
> +	VI5_DATA10_MARK, VI5_DATA11_MARK,
> +	VI5_DATA12_MARK, VI5_DATA13_MARK,
> +	VI5_DATA14_MARK, VI5_DATA15_MARK,
> +};

Patch looks good!
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

>  static const unsigned int vin5_sync_pins[] = {
>  	/* HSYNC#, VSYNC# */
>  	RCAR_GP_PIN(1, 10), RCAR_GP_PIN(1, 9),
> @@ -4132,7 +4156,7 @@ static const unsigned int vin5_clk_mux[] = {
>  };
>
>  static const struct {
> -	struct sh_pfc_pin_group common[316];
> +	struct sh_pfc_pin_group common[318];
>  	struct sh_pfc_pin_group automotive[30];
>  } pinmux_groups = {
>  	.common = {
> @@ -4440,6 +4464,7 @@ static const struct {
>  		SH_PFC_PIN_GROUP(vin4_data18_b),
>  		VIN_DATA_PIN_GROUP(vin4_data, 20, _b),
>  		VIN_DATA_PIN_GROUP(vin4_data, 24, _b),
> +		SH_PFC_PIN_GROUP(vin4_g8),
>  		SH_PFC_PIN_GROUP(vin4_sync),
>  		SH_PFC_PIN_GROUP(vin4_field),
>  		SH_PFC_PIN_GROUP(vin4_clkenb),
> @@ -4448,6 +4473,7 @@ static const struct {
>  		VIN_DATA_PIN_GROUP(vin5_data, 10),
>  		VIN_DATA_PIN_GROUP(vin5_data, 12),
>  		VIN_DATA_PIN_GROUP(vin5_data, 16),
> +		SH_PFC_PIN_GROUP(vin5_g8),
>  		SH_PFC_PIN_GROUP(vin5_sync),
>  		SH_PFC_PIN_GROUP(vin5_field),
>  		SH_PFC_PIN_GROUP(vin5_clkenb),
> @@ -4978,6 +5004,7 @@ static const char * const vin4_groups[] = {
>  	"vin4_data18_b",
>  	"vin4_data20_b",
>  	"vin4_data24_b",
> +	"vin4_g8",
>  	"vin4_sync",
>  	"vin4_field",
>  	"vin4_clkenb",
> @@ -4989,6 +5016,7 @@ static const char * const vin5_groups[] = {
>  	"vin5_data10",
>  	"vin5_data12",
>  	"vin5_data16",
> +	"vin5_g8",
>  	"vin5_sync",
>  	"vin5_field",
>  	"vin5_clkenb",
> --
> 2.29.2
>
