Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8DC54BDF4A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Feb 2022 18:49:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378113AbiBUOlE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Feb 2022 09:41:04 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:51592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378099AbiBUOlB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Feb 2022 09:41:01 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32056205CF;
        Mon, 21 Feb 2022 06:40:38 -0800 (PST)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3B4DF482;
        Mon, 21 Feb 2022 15:40:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1645454436;
        bh=nTpZoOQNBKaZvvyP6+yOBIA2qRqlBuY3KLj4nTlSb8c=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=fteu9wsvyQGzIY3q8U1+cxKEKinBJWDZs8O/Wva7W0VXalFO+maEYzKzty5xzIclY
         wTbYbxwxGuoEJilYm9YUCgplaeRB+mU/tDlUE/d0wT8DEnVR6K3WoVeLdAnZSZ8QAD
         619fxqcsyhY1o8TFL5KBvicyCGJZYzT9sfujOlYg=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211229193135.28767-3-laurent.pinchart+renesas@ideasonboard.com>
References: <20211229193135.28767-1-laurent.pinchart+renesas@ideasonboard.com> <20211229193135.28767-3-laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: renesas: Add panel overlay for Salvator-X(S) boards
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Date:   Mon, 21 Feb 2022 14:40:33 +0000
Message-ID: <164545443374.2976960.661493389191640326@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Laurent Pinchart (2021-12-29 19:31:34)
> The Salvator-X and Salvator-XS boards support an optional LVDS panel.
> One compatible panel is the Mitsubishi AA104XD12. Add a corresponding DT
> overlay.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>
> ---
> Changes since v1:
>=20
> - Create endpoint in lvds0 port@1
> ---
>  arch/arm64/boot/dts/renesas/Makefile          |  2 ++
>  .../dts/renesas/salvator-panel-aa104xd12.dts  | 36 +++++++++++++++++++
>  2 files changed, 38 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/renesas/salvator-panel-aa104xd12.=
dts
>=20
> diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/r=
enesas/Makefile
> index d1c5c21d8d14..982ca3e0e86f 100644
> --- a/arch/arm64/boot/dts/renesas/Makefile
> +++ b/arch/arm64/boot/dts/renesas/Makefile
> @@ -74,3 +74,5 @@ dtb-$(CONFIG_ARCH_R8A77961) +=3D r8a779m3-ulcb-kf.dtb
>  dtb-$(CONFIG_ARCH_R8A77965) +=3D r8a779m5-salvator-xs.dtb
> =20
>  dtb-$(CONFIG_ARCH_R9A07G044) +=3D r9a07g044l2-smarc.dtb
> +
> +dtb-$(CONFIG_ARCH_RCAR_GEN3) +=3D salvator-panel-aa104xd12.dtbo
> diff --git a/arch/arm64/boot/dts/renesas/salvator-panel-aa104xd12.dts b/a=
rch/arm64/boot/dts/renesas/salvator-panel-aa104xd12.dts
> new file mode 100644
> index 000000000000..c83a30adc6ad
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/salvator-panel-aa104xd12.dts
> @@ -0,0 +1,36 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Device Tree overlay for the AA104XD12 panel connected to LVDS0 on a
> + * Salvator-X or Salvator-XS board
> + *
> + * Copyright 2021 Ideas on Board Oy
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&{/} {
> +#include "panel-aa104xd12.dtsi"

I guess parameters would help reduce the redundancy of having to=20
define per-board overlays, but this fits what we have got so:


Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> +};
> +
> +&{/panel} {
> +       backlight =3D <&backlight>;
> +
> +       port {
> +               panel_in: endpoint {
> +                       remote-endpoint =3D <&lvds0_out>;
> +               };
> +       };
> +};
> +
> +&lvds0 {
> +       status =3D "okay";
> +
> +       ports {
> +               port@1 {
> +                       lvds0_out: endpoint {
> +                               remote-endpoint =3D <&panel_in>;
> +                       };
> +               };
> +       };
> +};
> --=20
> Regards,
>=20
> Laurent Pinchart
>
