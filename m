Return-Path: <linux-renesas-soc+bounces-22781-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B7088BC3DBE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Oct 2025 10:34:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 971EB1889991
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Oct 2025 08:35:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29EAB2F3625;
	Wed,  8 Oct 2025 08:34:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1352ED154
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Oct 2025 08:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759912479; cv=none; b=lazknu43pjVSAgoebGwI0jBJaMwT82f7AtMlom+hK2C23JvHmNK/d4zZ6D4QpB/kb/2Sqg5LDLw73bUOj8BEvJ1udFKUPlA+gGzYxHmV4SCiOw8Eeg36+jktuDK88JDTGgqSQiKf1cJojH9AZBA3uJmyuh2hxJ6GxgBLQCH+gbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759912479; c=relaxed/simple;
	bh=pQ/FMrXPjn/XWnPBpiiZKNOc0w+btx/hXgzBpPmjM1E=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uxW3GbVEFPreFgrF0FhHFXh42C1YgbMQcXluj9R/b4Kyl7+iLQjwXHzX0f8Hyjzh1UuxG3sS3ZMCxNUHqa1CU9dkj93xWczOTgc32rtHlO2GbllTudCnO134bE4sSr9VWNTmT0Z9nsCSz+ye/aWnWhtQUcmEs05v7n/4fEbGszw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1v6Pcl-0006z6-Ko; Wed, 08 Oct 2025 10:34:15 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1v6Pck-002XQm-09;
	Wed, 08 Oct 2025 10:34:14 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1v6Pcj-000000003NA-41V4;
	Wed, 08 Oct 2025 10:34:13 +0200
Message-ID: <c7fc31f1247332196516394a22f6feef9733a0b4.camel@pengutronix.de>
Subject: Re: [PATCH v7 4/7] reset: rzg2l-usbphy-ctrl: Add support for USB
 PWRRDY
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Claudiu <claudiu.beznea@tuxon.dev>, vkoul@kernel.org, kishon@kernel.org,
 	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 geert+renesas@glider.be, 	magnus.damm@gmail.com,
 yoshihiro.shimoda.uh@renesas.com, 	biju.das.jz@bp.renesas.com
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Claudiu
 Beznea	 <claudiu.beznea.uj@bp.renesas.com>, Wolfram Sang	
 <wsa+renesas@sang-engineering.com>
Date: Wed, 08 Oct 2025 10:34:13 +0200
In-Reply-To: <20250925100302.3508038-5-claudiu.beznea.uj@bp.renesas.com>
References: <20250925100302.3508038-1-claudiu.beznea.uj@bp.renesas.com>
	 <20250925100302.3508038-5-claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-renesas-soc@vger.kernel.org

Hi Claudiu,

On Do, 2025-09-25 at 13:02 +0300, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> On the Renesas RZ/G3S SoC, the USB PHY block has an input signal called
> PWRRDY. This signal is managed by the system controller and must be
> de-asserted after powering on the area where USB PHY resides and asserted
> before powering it off.
>=20
> On power-on the USB PWRRDY signal need to be de-asserted before enabling
> clock and switching the module to normal state (through MSTOP support). T=
he
> power-on configuration sequence

The wording makes me wonder, have you considered implementing this as a
power sequencing driver?

> must be:
>=20
> 1/ PWRRDY=3D0
> 2/ CLK_ON=3D1
> 3/ MSTOP=3D0
>=20
> On power-off the configuration sequence should be:
>=20
> 1/ MSTOP=3D1
> 2/ CLK_ON=3D0
> 3/ PWRRDY=3D1
>=20
> The CLK_ON and MSTOP functionalities are controlled by clock drivers.
>
> After long discussions with the internal HW team, it has been confirmed
> that the HW connection b/w USB PHY block, the USB channels, the system
> controller, clock, MSTOP, PWRRDY signal is as follows:
>=20
>                                =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=90
>                                =E2=94=82                              =E2=
=94=82=E2=97=84=E2=94=80=E2=94=80 CPG_CLKON_USB.CLK0_ON
>                                =E2=94=82     USB CH0                  =E2=
=94=82
> =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=90   =E2=94=82=E2=94=8C=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=90 =E2=94=82=E2=97=84=E2=94=80=E2=94=80 CPG_CLKON_USB.CLK2_ON
> =E2=94=82                 =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90   =E2=94=82=E2=94=82host cont=
roller registers  =E2=94=82 =E2=94=82
> =E2=94=82                 =E2=94=82        =E2=94=82   =E2=94=82=E2=94=82=
function controller registers=E2=94=82
> =E2=94=82                 =E2=94=82 PHY0   =E2=94=82=E2=97=84=E2=94=80=E2=
=94=80=E2=94=A4=E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98 =E2=94=82
> =E2=94=82     USB PHY     =E2=94=82        =E2=94=82   =E2=94=94=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=96=B2=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98
> =E2=94=82                 =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98                =E2=94=82
> =E2=94=82                          =E2=94=82    CPG_BUS_PERI_COM_MSTOP.MS=
TOP{6, 5}_ON
> =E2=94=82=E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=90 =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=90
> =E2=94=82=E2=94=82USHPHY control=E2=94=82 =E2=94=82        =E2=94=82
> =E2=94=82=E2=94=82  registers   =E2=94=82 =E2=94=82 PHY1   =E2=94=82   =
=E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90
> =E2=94=82=E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=98 =E2=94=82        =E2=94=82=E2=97=84=E2=94=80=E2=94=80=E2=94=A4     U=
SB CH1                  =E2=94=82
> =E2=94=82                 =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98   =E2=94=82=E2=94=8C=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=90 =E2=94=82=E2=97=84=E2=94=80=E2=94=80 CPG_CLKON_USB.CLK1_=
ON
> =E2=94=94=E2=94=80=E2=96=B2=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=96=B2=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=96=B2=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=98   =E2=94=82=E2=94=82 host controller registe=
rs =E2=94=82 =E2=94=82
>   =E2=94=82       =E2=94=82         =E2=94=82          =E2=94=82=E2=94=94=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=98 =E2=94=82
>   =E2=94=82       =E2=94=82         =E2=94=82          =E2=94=94=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=96=B2=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98
>   =E2=94=82       =E2=94=82         =E2=94=82                       =E2=
=94=82
>   =E2=94=82       =E2=94=82         =E2=94=82           CPG_BUS_PERI_COM_=
MSTOP.MSTOP7_ON
>   =E2=94=82PWRRDY =E2=94=82         =E2=94=82
>   =E2=94=82       =E2=94=82   CPG_CLK_ON_USB.CLK3_ON
>   =E2=94=82       =E2=94=82
>   =E2=94=82  CPG_BUS_PERI_COM_MSTOP.MSTOP4_ON
>   =E2=94=82
> =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90
> =E2=94=82SYSC=E2=94=82
> =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98
>=20
> where:
> - CPG_CLKON_USB.CLK.CLKX_ON is the register bit controlling the clock X
>   of different USB blocks, X in {0, 1, 2, 3}
> - CPG_BUS_PERI_COM_MSTOP.MSTOPX_ON is the register bit controlling the
>   MSTOP of different USB blocks, X in {4, 5, 6, 7}
> - USB PHY is the USB PHY block exposing 2 ports, port0 and port1, used
>   by the USB CH0, USB CH1
> - SYSC is the system controller block controlling the PWRRDY signal
> - USB CHx are individual USB block with host and function capabilities
>   (USB CH0 have both host and function capabilities, USB CH1 has only
>   host capabilities)
>=20
> The USBPHY control registers are controlled though the
> reset-rzg2l-usbphy-ctrl driver. The USB PHY ports are controlled by
> phy_rcar_gen3_usb2 (drivers/phy/renesas/phy-rcar-gen3-usb2.c file). The
> USB PHY ports request resets from the reset-rzg2l-usbphy-ctrl driver.
>=20
> The connection b/w the system controller and the USB PHY CTRL driver is
> implemented through the renesas,sysc-pwrrdy device tree property
> proposed in this patch. This property specifies the register offset and t=
he
> bitmask required to control the PWRRDY signal.
>=20
> Since the USB PHY CTRL driver needs to be probed before any other
> USB-specific driver on RZ/G3S, control of PWRRDY is passed exclusively
> to it. This guarantees the correct configuration sequence between clocks,
> MSTOP bits, and the PWRRDY bit. At the same time, changes are kept minima=
l
> by avoiding modifications to the USB PHY driver to also handle the PWRRDY
> itself.
>=20
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>=20
> Changes in v7:
> - used proper regmap update value on rzg2l_usbphy_ctrl_set_pwrrdy()
>=20
> Changes in v6:
> - used syscon_regmap_lookup_by_phandle_args() to simplify the code
> - collected tags
>=20
> Changes in v5:
> - none
>=20
> Changes in v4:
> - updated patch description
> - updated rzg2l_usbphy_ctrl_pwrrdy_init() to map directly the
>   "renesas,sysc-pwrrdy" as the SYSC signal abstraction was dropped
>   in this version, along with rz_sysc_get_signal_map()
> - dropped priv member of rzg2l_usbphy_ctrl_pwrrdy_init() as it is
>   not needed in this version
> - shift left !power_on with pwrrdy->mask as this is how the
>   regmap_update_bits() needs the last member to be
> - selected MFD_SYSCON
>=20
> Changes in v3:
> - none; this patch is new
>=20
>=20
>  drivers/reset/Kconfig                   |  1 +
>  drivers/reset/reset-rzg2l-usbphy-ctrl.c | 62 +++++++++++++++++++++++++
>  2 files changed, 63 insertions(+)
>=20
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index 78b7078478d4..329730cbcfb9 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -237,6 +237,7 @@ config RESET_RASPBERRYPI
>  config RESET_RZG2L_USBPHY_CTRL
>  	tristate "Renesas RZ/G2L USBPHY control driver"
>  	depends on ARCH_RZG2L || COMPILE_TEST
> +	select MFD_SYSCON
>  	help
>  	  Support for USBPHY Control found on RZ/G2L family. It mainly
>  	  controls reset and power down of the USB/PHY.
> diff --git a/drivers/reset/reset-rzg2l-usbphy-ctrl.c b/drivers/reset/rese=
t-rzg2l-usbphy-ctrl.c
> index 8a7f167e405e..be315199e2b0 100644
> --- a/drivers/reset/reset-rzg2l-usbphy-ctrl.c
> +++ b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
> @@ -13,6 +13,7 @@
>  #include <linux/regmap.h>
>  #include <linux/reset.h>
>  #include <linux/reset-controller.h>
> +#include <linux/mfd/syscon.h>
> =20
>  #define RESET			0x000
>  #define VBENCTL			0x03c
> @@ -41,6 +42,18 @@ struct rzg2l_usbphy_ctrl_priv {
> =20
>  #define rcdev_to_priv(x)	container_of(x, struct rzg2l_usbphy_ctrl_priv, =
rcdev)
> =20
> +/**
> + * struct rzg2l_usbphy_ctrl_pwrrdy - SYSC PWRRDY signal descriptor
> + * @regmap: SYSC regmap
> + * @offset: offset into the SYSC address space for accessing PWRRDY
> + * @mask: mask into the register at offset for accessing PWRRDY
> + */
> +struct rzg2l_usbphy_ctrl_pwrrdy {
> +	struct regmap *regmap;
> +	u32 offset;
> +	u32 mask;
> +};
> +
>  static int rzg2l_usbphy_ctrl_assert(struct reset_controller_dev *rcdev,
>  				    unsigned long id)
>  {
> @@ -91,6 +104,8 @@ static int rzg2l_usbphy_ctrl_status(struct reset_contr=
oller_dev *rcdev,
>  	return !!(readl(priv->base + RESET) & port_mask);
>  }
> =20
> +#define RZG2L_USBPHY_CTRL_PWRRDY	1
> +
>  static const struct of_device_id rzg2l_usbphy_ctrl_match_table[] =3D {
>  	{ .compatible =3D "renesas,rzg2l-usbphy-ctrl" },
>  	{ /* Sentinel */ }
> @@ -110,6 +125,49 @@ static const struct regmap_config rzg2l_usb_regconf =
=3D {
>  	.max_register =3D 1,
>  };
> =20
> +static void rzg2l_usbphy_ctrl_set_pwrrdy(struct rzg2l_usbphy_ctrl_pwrrdy=
 *pwrrdy,
> +					 bool power_on)
> +{
> +	u32 val =3D (!power_on << (ffs(pwrrdy->mask) - 1)) & pwrrdy->mask;


Why not just:

	u32 val =3D power_on ? 0 : pwrrdy->mask;

You could simplify this further by using a regmap_field instead of
rzg2l_usbphy_ctrl_pwrrdy.

> +
> +	regmap_update_bits(pwrrdy->regmap, pwrrdy->offset, pwrrdy->mask, val);
> +}
> +
> +static void rzg2l_usbphy_ctrl_pwrrdy_off(void *data)
> +{
> +	rzg2l_usbphy_ctrl_set_pwrrdy(data, false);
> +}
> +
> +static int rzg2l_usbphy_ctrl_pwrrdy_init(struct device *dev)
> +{
> +	struct rzg2l_usbphy_ctrl_pwrrdy *pwrrdy;
> +	struct regmap *regmap;
> +	const int *data;
> +	u32 args[2];
> +
> +	data =3D device_get_match_data(dev);
> +	if (data !=3D (int *)RZG2L_USBPHY_CTRL_PWRRDY)

Better not to compare pointers here:

	if ((uintptr_t)data !=3D RZG2L_USBPHY_CTRL_PWRRDY)

> +		return 0;
> +
> +	regmap =3D syscon_regmap_lookup_by_phandle_args(dev->of_node,
> +						      "renesas,sysc-pwrrdy",
> +						      ARRAY_SIZE(args), args);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	pwrrdy =3D devm_kzalloc(dev, sizeof(*pwrrdy), GFP_KERNEL);
> +	if (!pwrrdy)
> +		return -ENOMEM;
> +
> +	pwrrdy->regmap =3D regmap;
> +	pwrrdy->offset =3D args[0];
> +	pwrrdy->mask =3D args[1];
> +
> +	rzg2l_usbphy_ctrl_set_pwrrdy(pwrrdy, true);
> +
> +	return devm_add_action_or_reset(dev, rzg2l_usbphy_ctrl_pwrrdy_off, pwrr=
dy);
> +}

So we deassert PWRRDY on probe and assert on remove. What about
suspend/resume ordering?

regards
Philipp

