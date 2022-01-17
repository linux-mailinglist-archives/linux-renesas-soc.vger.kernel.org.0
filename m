Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B1F149076C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jan 2022 12:52:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236684AbiAQLwO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jan 2022 06:52:14 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:34336 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236652AbiAQLwO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jan 2022 06:52:14 -0500
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 97D38596;
        Mon, 17 Jan 2022 12:52:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1642420332;
        bh=GVS5+f2v3T0zet8zWyWo3bIWN0lpqBKcuoZ8hZJqnQQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ioBUcB726hXjYmJMshy2xHrciRxDIb1lwmGuhUKtUb5YhFPZS5v0X8PzraYSEL1RH
         gESvibBXMQJOsRMccFmkqNtWfkIPl4R1uwQET6745ptfFEQJTqpqx6hy8mBobudOT9
         QdK9W84uD5eSvASrGkuKGCPtDGUfcm8HJIuHwISs=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211212013351.595-4-laurent.pinchart+renesas@ideasonboard.com>
References: <20211212013351.595-1-laurent.pinchart+renesas@ideasonboard.com> <20211212013351.595-4-laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: Add panel overlay for Draak and Ebisu boards
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Date:   Mon, 17 Jan 2022 11:52:10 +0000
Message-ID: <164242033029.10801.10154701138409780021@Monstersaurus>
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Laurent Pinchart (2021-12-12 01:33:51)
> The Draak and Ebisu boards support an optional LVDS panel. One
> compatible panel is the Mitsubishi AA104XD12. Add a corresponding DT
> overlay.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>
> ---
>  arch/arm64/boot/dts/renesas/Makefile          |  1 +
>  .../renesas/draak-ebisu-panel-aa104xd12.dts   | 32 +++++++++++++++++++
>  2 files changed, 33 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/renesas/draak-ebisu-panel-aa104xd=
12.dts
>=20
> diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/r=
enesas/Makefile
> index 982ca3e0e86f..5e831bd33828 100644
> --- a/arch/arm64/boot/dts/renesas/Makefile
> +++ b/arch/arm64/boot/dts/renesas/Makefile
> @@ -76,3 +76,4 @@ dtb-$(CONFIG_ARCH_R8A77965) +=3D r8a779m5-salvator-xs.d=
tb
>  dtb-$(CONFIG_ARCH_R9A07G044) +=3D r9a07g044l2-smarc.dtb
> =20
>  dtb-$(CONFIG_ARCH_RCAR_GEN3) +=3D salvator-panel-aa104xd12.dtbo
> +dtb-$(CONFIG_ARCH_RCAR_GEN3) +=3D draak-ebisu-panel-aa104xd12.dtbo
> diff --git a/arch/arm64/boot/dts/renesas/draak-ebisu-panel-aa104xd12.dts =
b/arch/arm64/boot/dts/renesas/draak-ebisu-panel-aa104xd12.dts
> new file mode 100644
> index 000000000000..0c5dc3df5247
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/draak-ebisu-panel-aa104xd12.dts
> @@ -0,0 +1,32 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Device Tree overlay for the AA104XD12 panel connected to LVDS1 on a D=
raak or
> + * Ebisu board
> + *
> + * Copyright 2021 Ideas on Board Oy
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&{/} {
> +#include "panel-aa104xd12.dtsi"
> +};
> +
> +&{/panel} {
> +       backlight =3D <&backlight>;
> +
> +       port {
> +               panel_in: endpoint {
> +                       remote-endpoint =3D <&lvds1_out>;

I guess we can't use parameters in overlays yet? The LVDS reference
seems to be the only difference between the two. But I guess even that
might be hard to pass in as a parameter at boot, or run time...


> +               };
> +       };
> +};
> +
> +&lvds1 {
> +       status =3D "okay";
> +};
> +
> +&lvds1_out {
> +       remote-endpoint =3D <&panel_in>;
> +};
> --=20
> Regards,
>=20
> Laurent Pinchart
>
