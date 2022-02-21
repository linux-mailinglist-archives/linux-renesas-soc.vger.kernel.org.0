Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AE884BDDE0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Feb 2022 18:46:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378126AbiBUOlv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Feb 2022 09:41:51 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:51978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233354AbiBUOlu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Feb 2022 09:41:50 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 112CF205D2;
        Mon, 21 Feb 2022 06:41:27 -0800 (PST)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B849E482;
        Mon, 21 Feb 2022 15:41:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1645454485;
        bh=qbtv7tnQ4gO1K0aKaieZYrPLWZbVH2knSyRwonXWsgI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=QLWN/hx6rvmMLfrMBnZ8uE6Zx8Q3Ad0kiyMbdWVoGZCuuai4/skR+V9hUvEPSAxM5
         2Mgk6Q9gzXFfuPOs9qNNzgr5nZYfC8WqQe8E+QiA/r3TvT/rSlqT43V9nmxRem1zuX
         viO4ZWGDA1pqLEJIBIUiAGKmG15e4O3TbFkfLvPg=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211229193135.28767-4-laurent.pinchart+renesas@ideasonboard.com>
References: <20211229193135.28767-1-laurent.pinchart+renesas@ideasonboard.com> <20211229193135.28767-4-laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: renesas: Add panel overlay for Draak and Ebisu boards
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Date:   Mon, 21 Feb 2022 14:41:23 +0000
Message-ID: <164545448355.2976960.17099137139723587029@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Laurent Pinchart (2021-12-29 19:31:35)
> The Draak and Ebisu boards support an optional LVDS panel. One
> compatible panel is the Mitsubishi AA104XD12. Add a corresponding DT
> overlay.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
> Changes since v1:
>=20
> - Create endpoint in lvds1 port@1
> ---
>  arch/arm64/boot/dts/renesas/Makefile          |  1 +
>  .../renesas/draak-ebisu-panel-aa104xd12.dts   | 36 +++++++++++++++++++
>  2 files changed, 37 insertions(+)
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
> index 000000000000..258f8668ca36
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/draak-ebisu-panel-aa104xd12.dts
> @@ -0,0 +1,36 @@
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
> +               };
> +       };
> +};
> +
> +&lvds1 {
> +       status =3D "okay";
> +
> +       ports {
> +               port@1 {
> +                       lvds1_out: endpoint {
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
