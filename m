Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 885204BE721
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Feb 2022 19:03:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378090AbiBUOi5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Feb 2022 09:38:57 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:50644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378087AbiBUOiv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Feb 2022 09:38:51 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CA2D205D2;
        Mon, 21 Feb 2022 06:38:28 -0800 (PST)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E3525482;
        Mon, 21 Feb 2022 15:38:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1645454307;
        bh=pKC6hNAtwrSyub6N98uUutS5L866h/4OyvQyaTALvfY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=LQFcUDL+GGWCyfbmZP11ogtm34eaTBIMsinD96kjvjB0y4MRKU8Vaoj10yCwhRKKP
         McAH5vJU0tfjpcmtIWVF09O/rovI5NnSKKhx5cltFSlXDAKKhIiFAQJUsuNSQ8jvKh
         9HOdjC61v02VUrnjDN/kieBa7uRF6PMr5gDeiUhE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211229193135.28767-2-laurent.pinchart+renesas@ideasonboard.com>
References: <20211229193135.28767-1-laurent.pinchart+renesas@ideasonboard.com> <20211229193135.28767-2-laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 1/3] arm64: dts: renesas: Prepare AA1024XD12 panel .dtsi for overlay support
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Date:   Mon, 21 Feb 2022 14:38:24 +0000
Message-ID: <164545430425.2976960.2974689638537387661@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Laurent Pinchart (2021-12-29 19:31:33)
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

Is this a device directly on the renesas board itself? I still wonder if
'extra' overlays should be in a subfolder here, or ... even potentially
some more common location - but this can do for now I guess.

And I see I gave this on v1, but /after/ you posted v2 ;-)

You can keep it though ...

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

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
