Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DEE92AF013
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Nov 2020 12:55:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726240AbgKKLze (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 Nov 2020 06:55:34 -0500
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:48655 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726199AbgKKLzd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Nov 2020 06:55:33 -0500
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 6AF05C0004;
        Wed, 11 Nov 2020 11:55:30 +0000 (UTC)
Date:   Wed, 11 Nov 2020 12:55:31 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/4] pinctrl: renesas: r8a77951: Add vin{4,5}_g8 pins
Message-ID: <20201111115531.kgp6kabpdwygxpn2@uno.localdomain>
References: <20201110234752.52846-1-niklas.soderlund+renesas@ragnatech.se>
 <20201110234752.52846-2-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201110234752.52846-2-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Niklas,

On Wed, Nov 11, 2020 at 12:47:49AM +0100, Niklas Söderlund wrote:
> This patch adds VIN{4,5}_g8 support to the R8A77951 SoC.

Now that I've asked offline why the 'g' in the group name I see
the reason which otherwise let me search for a _g group that does not
exists in the documentation.

Can you mention in this and other patches that the groups are 8-pins
groups on VIN4/5 [15:8] pins, named 'g' as when capturing RGB they are
dedicated to the green channel ?

>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Patch looks good

Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
  j

> ---
>  drivers/pinctrl/renesas/pfc-r8a77951.c | 30 +++++++++++++++++++++++++-
>  1 file changed, 29 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/renesas/pfc-r8a77951.c b/drivers/pinctrl/renesas/pfc-r8a77951.c
> index a94ebe0bf5d06127..21864223c880b3ec 100644
> --- a/drivers/pinctrl/renesas/pfc-r8a77951.c
> +++ b/drivers/pinctrl/renesas/pfc-r8a77951.c
> @@ -4074,6 +4074,18 @@ static const union vin_data vin4_data_b_mux = {
>  		VI4_DATA22_MARK, VI4_DATA23_MARK,
>  	},
>  };
> +static const unsigned int vin4_g8_pins[] = {
> +	RCAR_GP_PIN(1, 0),  RCAR_GP_PIN(1, 1),
> +	RCAR_GP_PIN(1, 2),  RCAR_GP_PIN(1, 3),
> +	RCAR_GP_PIN(1, 4),  RCAR_GP_PIN(1, 5),
> +	RCAR_GP_PIN(1, 6),  RCAR_GP_PIN(1, 7),
> +};
> +static const unsigned int vin4_g8_mux[] = {
> +	VI4_DATA8_MARK,  VI4_DATA9_MARK,
> +	VI4_DATA10_MARK, VI4_DATA11_MARK,
> +	VI4_DATA12_MARK, VI4_DATA13_MARK,
> +	VI4_DATA14_MARK, VI4_DATA15_MARK,
> +};
>  static const unsigned int vin4_sync_pins[] = {
>  	/* HSYNC#, VSYNC# */
>  	RCAR_GP_PIN(1, 18), RCAR_GP_PIN(1, 17),
> @@ -4128,6 +4140,18 @@ static const union vin_data16 vin5_data_mux = {
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
>  static const unsigned int vin5_sync_pins[] = {
>  	/* HSYNC#, VSYNC# */
>  	RCAR_GP_PIN(1, 10), RCAR_GP_PIN(1, 9),
> @@ -4158,7 +4182,7 @@ static const unsigned int vin5_clk_mux[] = {
>  };
>
>  static const struct {
> -	struct sh_pfc_pin_group common[320];
> +	struct sh_pfc_pin_group common[322];
>  	struct sh_pfc_pin_group automotive[30];
>  } pinmux_groups = {
>  	.common = {
> @@ -4470,6 +4494,7 @@ static const struct {
>  		SH_PFC_PIN_GROUP(vin4_data18_b),
>  		VIN_DATA_PIN_GROUP(vin4_data, 20, _b),
>  		VIN_DATA_PIN_GROUP(vin4_data, 24, _b),
> +		SH_PFC_PIN_GROUP(vin4_g8),
>  		SH_PFC_PIN_GROUP(vin4_sync),
>  		SH_PFC_PIN_GROUP(vin4_field),
>  		SH_PFC_PIN_GROUP(vin4_clkenb),
> @@ -4478,6 +4503,7 @@ static const struct {
>  		VIN_DATA_PIN_GROUP(vin5_data, 10),
>  		VIN_DATA_PIN_GROUP(vin5_data, 12),
>  		VIN_DATA_PIN_GROUP(vin5_data, 16),
> +		SH_PFC_PIN_GROUP(vin5_g8),
>  		SH_PFC_PIN_GROUP(vin5_sync),
>  		SH_PFC_PIN_GROUP(vin5_field),
>  		SH_PFC_PIN_GROUP(vin5_clkenb),
> @@ -5022,6 +5048,7 @@ static const char * const vin4_groups[] = {
>  	"vin4_data18_b",
>  	"vin4_data20_b",
>  	"vin4_data24_b",
> +	"vin4_g8",
>  	"vin4_sync",
>  	"vin4_field",
>  	"vin4_clkenb",
> @@ -5033,6 +5060,7 @@ static const char * const vin5_groups[] = {
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
