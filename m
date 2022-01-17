Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79397490750
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jan 2022 12:50:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239215AbiAQLtw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jan 2022 06:49:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236426AbiAQLtv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jan 2022 06:49:51 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E2E8C061574;
        Mon, 17 Jan 2022 03:49:51 -0800 (PST)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0BD8C596;
        Mon, 17 Jan 2022 12:49:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1642420190;
        bh=vlhxE+FEP+wjLOKHFsYEfXNsMRK+dDhO22fjFEdlqk8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ld6qqo69Ho/+nzFsQ/mzlMhnpnK/swMhiD84DpDP4sR2Cmy1BvEL99PsCK4CdpeG4
         8PgvWaPrcycZfiU1mkeX32MkC2n5A5Q4GjXkpPrw0kmg09VJMg0QLGsQpk/DaiZnsH
         Y6TN/BTu9wua6Ibhtjyc4wb3A6mAPUgsT9VESfww=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211212013351.595-2-laurent.pinchart+renesas@ideasonboard.com>
References: <20211212013351.595-1-laurent.pinchart+renesas@ideasonboard.com> <20211212013351.595-2-laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH 1/3] arm64: dts: renesas: Prepare AA1024XD12 panel .dtsi for overlay support
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Date:   Mon, 17 Jan 2022 11:49:47 +0000
Message-ID: <164242018788.10801.6662898133808750519@Monstersaurus>
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Laurent Pinchart (2021-12-12 01:33:49)
> The Mitsubishi AA1024XD12 panel can be used for R-Car Gen2 and Gen3
> boards as an optional external panel. It is described in the
> arm/boot/dts/r8a77xx-aa104xd12-panel.dtsi file as a direct child of the
> DT root node. This allows including r8a77xx-aa104xd12-panel.dtsi in
> board device trees, with other minor modifications, to enable the panel.
>=20
> This is however not how external components should be modelled. Instead
> of modifying the board device tree to enable the panel, it should be
> compiled as a DT overlay, to be loaded by the boot loader.
>=20
> Prepare the r8a77xx-aa104xd12-panel.dtsi file for this usage by
> declaring a panel node only, without hardcoding its path. Overlay
> sources can then include r8a77xx-aa104xd12-panel.dtsi where appropriate.
>=20
> This change doesn't cause any regression as r8a77xx-aa104xd12-panel.dtsi
> is currently unused. As overlay support for this panel has only been
> tested with Gen3 hardware, and Gen2 support will require more
> development, move the file to arch/arm64/boot/dts/renesas/.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>

Well moving the file looks like it's simple and easy here, and doesn't
affect anything else so:

Interested to see how overlay support develops, and I think we should
make better use of it for cameras too.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  .../arm/boot/dts/r8a77xx-aa104xd12-panel.dtsi | 39 -------------------
>  .../boot/dts/renesas/panel-aa104xd12.dtsi     | 30 ++++++++++++++
>  2 files changed, 30 insertions(+), 39 deletions(-)
>  delete mode 100644 arch/arm/boot/dts/r8a77xx-aa104xd12-panel.dtsi
>  create mode 100644 arch/arm64/boot/dts/renesas/panel-aa104xd12.dtsi
>=20
> diff --git a/arch/arm/boot/dts/r8a77xx-aa104xd12-panel.dtsi b/arch/arm/bo=
ot/dts/r8a77xx-aa104xd12-panel.dtsi
> deleted file mode 100644
> index 79fce67ebb1c..000000000000
> --- a/arch/arm/boot/dts/r8a77xx-aa104xd12-panel.dtsi
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0
> -/*
> - * Common file for the AA104XD12 panel connected to Renesas R-Car boards
> - *
> - * Copyright (C) 2014 Renesas Electronics Corp.
> - */
> -
> -/ {
> -       panel {
> -               compatible =3D "mitsubishi,aa104xd12", "panel-lvds";
> -
> -               width-mm =3D <210>;
> -               height-mm =3D <158>;
> -               data-mapping =3D "jeida-18";
> -
> -               panel-timing {
> -                       /* 1024x768 @65Hz */
> -                       clock-frequency =3D <65000000>;
> -                       hactive =3D <1024>;
> -                       vactive =3D <768>;
> -                       hsync-len =3D <136>;
> -                       hfront-porch =3D <20>;
> -                       hback-porch =3D <160>;
> -                       vfront-porch =3D <3>;
> -                       vback-porch =3D <29>;
> -                       vsync-len =3D <6>;
> -               };
> -
> -               port {
> -                       panel_in: endpoint {
> -                               remote-endpoint =3D <&lvds_connector>;
> -                       };
> -               };
> -       };
> -};
> -
> -&lvds_connector {
> -       remote-endpoint =3D <&panel_in>;
> -};
> diff --git a/arch/arm64/boot/dts/renesas/panel-aa104xd12.dtsi b/arch/arm6=
4/boot/dts/renesas/panel-aa104xd12.dtsi
> new file mode 100644
> index 000000000000..6e9f447d8fe1
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/panel-aa104xd12.dtsi
> @@ -0,0 +1,30 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Common file for the AA104XD12 panel connected to Renesas R-Car Gen3 b=
oards.
> + *
> + * Copyright (C) 2021 Renesas Electronics Corp.
> + */
> +
> +panel {
> +       compatible =3D "mitsubishi,aa104xd12", "panel-lvds";
> +
> +       width-mm =3D <210>;
> +       height-mm =3D <158>;
> +       data-mapping =3D "jeida-18";
> +
> +       panel-timing {
> +               /* 1024x768 @65Hz */
> +               clock-frequency =3D <65000000>;
> +               hactive =3D <1024>;
> +               vactive =3D <768>;
> +               hsync-len =3D <136>;
> +               hfront-porch =3D <20>;
> +               hback-porch =3D <160>;
> +               vfront-porch =3D <3>;
> +               vback-porch =3D <29>;
> +               vsync-len =3D <6>;
> +       };
> +
> +       port {
> +       };
> +};
> --=20
> Regards,
>=20
> Laurent Pinchart
>
