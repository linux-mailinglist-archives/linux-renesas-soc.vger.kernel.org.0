Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1FCA433892
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Oct 2021 16:42:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230269AbhJSOou (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 Oct 2021 10:44:50 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35988 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229649AbhJSOot (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Oct 2021 10:44:49 -0400
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8606012A;
        Tue, 19 Oct 2021 16:42:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1634654555;
        bh=rxp6PMBsDJjGA2wH/eGe+dqU2991TJOOwj2FEZEGGiU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=KCo5atH4zp/Z5y88JzcnrVAd8Gs2RAhpmhcgdx462FrtLgCxAFWPGI1rek2yxj0LG
         XtL2l8nDkYucsGEJAhqyiZ4NgF1gezbU/Ie8LxTWKW8CqA5dot5WmR3qo8tXbmVJc6
         EiJEeZOuaPuiMBab4231e7OtuIbizKtNsiEDUPyQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211019090020.11724-1-Meng.Li@windriver.com>
References: <20211019090020.11724-1-Meng.Li@windriver.com>
Subject: Re: [PATCH] arch: arm64: dts: Set gpio5-pin9 as input by default
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, meng.li@windriver.com
To:     Meng Li <Meng.Li@windriver.com>, geert+renesas@glider.be,
        magnus.damm@gmail.com, robh+dt@kernel.org
Date:   Tue, 19 Oct 2021 15:42:33 +0100
Message-ID: <163465455377.2083150.11106861856940757460@Monstersaurus>
User-Agent: alot/0.9.2
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Meng Li (2021-10-19 10:00:20)
> The gpio5-pin9 is used as the interrupt pin of i2c external
> gpio chip, so set this pin as input by default.

Is a GPIO hog the right way to do this?
Shouldn't the other GPIO chip be modelled in DT and reference the gpio
interrupt line from there in its interrupt property?

I assume by 'external gpio chip' you mean one which is permanantly
attached to the ULCB Kingfisher board, and not a custom addition?

--
Regards
Kieran

>=20
> Signed-off-by: Meng Li <Meng.Li@windriver.com>
> ---
>  arch/arm64/boot/dts/renesas/ulcb-kf.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi b/arch/arm64/boot/d=
ts/renesas/ulcb-kf.dtsi
> index 202177706cde..8986a7e6e099 100644
> --- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> +++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> @@ -205,6 +205,15 @@
>         };
>  };
> =20
> +&gpio5 {
> +       gpio_exp_77_int {
> +               gpio-hog;
> +               gpios =3D <9 0>;
> +               input;
> +               line-name =3D "gpio-exp-77-int";
> +       };
> +};
> +
>  &i2c4 {
>         i2cswitch4: i2c-switch@71 {
>                 compatible =3D "nxp,pca9548";
> --=20
> 2.17.1
>
