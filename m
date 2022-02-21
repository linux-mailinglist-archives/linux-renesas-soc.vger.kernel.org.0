Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 918F14BE56A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Feb 2022 19:00:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377649AbiBUO07 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Feb 2022 09:26:59 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:35898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234981AbiBUO06 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Feb 2022 09:26:58 -0500
X-Greylist: delayed 519 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 21 Feb 2022 06:26:34 PST
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FEB83AD;
        Mon, 21 Feb 2022 06:26:32 -0800 (PST)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 21431482;
        Mon, 21 Feb 2022 15:26:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1645453591;
        bh=T6vs7r4KWJDvbmANeQ1L6dNnuSYVc6NQF7OPOieh3hg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=BAukTTS+y3rA58fP3/PKF7cPIPL6Cs4v5DCJhZO5gv25xd7pdKJiZTah69PUfZWHW
         CyUJRnlXcZjx0HaIcjGt/YxQ6W/suMhazL3SUUe3x3BCaQgIOMmsGB7Bsv11n6Xr0A
         8VwJAHZQol/xwHoYxMDUr72SuAJToeNLfHhv+7ig=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211229191838.27922-2-laurent.pinchart+renesas@ideasonboard.com>
References: <20211229191838.27922-1-laurent.pinchart+renesas@ideasonboard.com> <20211229191838.27922-2-laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: Remove empty rgb output endpoints
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Date:   Mon, 21 Feb 2022 14:26:28 +0000
Message-ID: <164545358800.2976960.11557666107245014347@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Laurent Pinchart (2021-12-29 19:18:38)
> Endpoints node must have a remote-endpoint property, as endpoints only
> exist to model a link between ports. Drop the empty rgb output endpoints
> from SoC dtsi files, and declare them in the board dts instead.
>=20

Ah yes, it was when I was adding the DSI output endpoints. I also ended
up ommitting any placeholders. So again, removing still seems the
consistent thing to do for now.


> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>
> ---
>  .../boot/dts/renesas/beacon-renesom-baseboard.dtsi     | 10 ++++++++--
>  arch/arm64/boot/dts/renesas/draak.dtsi                 |  2 +-
>  arch/arm64/boot/dts/renesas/ebisu.dtsi                 |  2 +-
>  arch/arm64/boot/dts/renesas/r8a774a1.dtsi              |  2 --
>  arch/arm64/boot/dts/renesas/r8a774b1.dtsi              |  2 --
>  arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts        |  2 +-
>  arch/arm64/boot/dts/renesas/r8a774c0.dtsi              |  2 --
>  arch/arm64/boot/dts/renesas/r8a774e1.dtsi              |  2 --
>  arch/arm64/boot/dts/renesas/r8a77951.dtsi              |  2 --
>  arch/arm64/boot/dts/renesas/r8a77960.dtsi              |  2 --
>  arch/arm64/boot/dts/renesas/r8a77961.dtsi              |  2 --
>  arch/arm64/boot/dts/renesas/r8a77965.dtsi              |  2 --
>  arch/arm64/boot/dts/renesas/r8a77970.dtsi              |  2 --
>  arch/arm64/boot/dts/renesas/r8a77980.dtsi              |  2 --
>  arch/arm64/boot/dts/renesas/r8a77990.dtsi              |  2 --
>  arch/arm64/boot/dts/renesas/r8a77995.dtsi              |  2 --
>  arch/arm64/boot/dts/renesas/salvator-common.dtsi       |  2 +-
>  17 files changed, 12 insertions(+), 30 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi b/=
arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> index 2692cc64bff6..1465adc43580 100644
> --- a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> +++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> @@ -272,8 +272,14 @@ &can1 {
>         status =3D "okay";
>  };
> =20
> -&du_out_rgb {
> -       remote-endpoint =3D <&rgb_panel>;
> +&du {
> +       ports {
> +               port@0 {

Would there be any benefit to labelling the ports for convenience?
Probably not enough, and it would only be there as a shorthand to be
able to still get to the endpoint which would still need it's own label
I think... so I think this is fine as is anyway.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> +                       du_out_rgb: endpoint {
> +                               remote-endpoint =3D <&rgb_panel>;
> +                       };
> +               };
> +       };
>  };
> =20
>  &ehci0 {
> diff --git a/arch/arm64/boot/dts/renesas/draak.dtsi b/arch/arm64/boot/dts=
/renesas/draak.dtsi
> index eb0327c0df48..b09f06086840 100644
> --- a/arch/arm64/boot/dts/renesas/draak.dtsi
> +++ b/arch/arm64/boot/dts/renesas/draak.dtsi
> @@ -285,7 +285,7 @@ &du {
> =20
>         ports {
>                 port@0 {
> -                       endpoint {
> +                       du_out_rgb: endpoint {
>                                 remote-endpoint =3D <&adv7123_in>;
>                         };
>                 };
> diff --git a/arch/arm64/boot/dts/renesas/ebisu.dtsi b/arch/arm64/boot/dts=
/renesas/ebisu.dtsi
> index 67231c8576c5..9e6093524682 100644
> --- a/arch/arm64/boot/dts/renesas/ebisu.dtsi
> +++ b/arch/arm64/boot/dts/renesas/ebisu.dtsi
> @@ -356,7 +356,7 @@ &du {
> =20
>         ports {
>                 port@0 {
> -                       endpoint {
> +                       du_out_rgb: endpoint {
>                                 remote-endpoint =3D <&adv7123_in>;
>                         };
>                 };
> diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/=
dts/renesas/r8a774a1.dtsi
> index 9a8c1bd923af..6105316ccac2 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> @@ -2733,8 +2733,6 @@ ports {
> =20
>                                 port@0 {
>                                         reg =3D <0>;
> -                                       du_out_rgb: endpoint {
> -                                       };
>                                 };
>                                 port@1 {
>                                         reg =3D <1>;
> diff --git a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi b/arch/arm64/boot/=
dts/renesas/r8a774b1.dtsi
> index 8912c1665ed9..7cdf009b1ee6 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
> @@ -2578,8 +2578,6 @@ ports {
> =20
>                                 port@0 {
>                                         reg =3D <0>;
> -                                       du_out_rgb: endpoint {
> -                                       };
>                                 };
>                                 port@1 {
>                                         reg =3D <1>;
> diff --git a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts b/arch/arm64=
/boot/dts/renesas/r8a774c0-cat874.dts
> index 4e72e4f2bab0..5a6ea08ffd2b 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
> @@ -172,7 +172,7 @@ &du {
> =20
>         ports {
>                 port@0 {
> -                       endpoint {
> +                       du_out_rgb: endpoint {
>                                 remote-endpoint =3D <&tda19988_in>;
>                         };
>                 };
> diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/=
dts/renesas/r8a774c0.dtsi
> index 263f39fb8ad9..8b875b212a48 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> @@ -1867,8 +1867,6 @@ ports {
> =20
>                                 port@0 {
>                                         reg =3D <0>;
> -                                       du_out_rgb: endpoint {
> -                                       };
>                                 };
> =20
>                                 port@1 {
> diff --git a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi b/arch/arm64/boot/=
dts/renesas/r8a774e1.dtsi
> index 02b35e68a3fa..b9ab5cb01419 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
> @@ -2853,8 +2853,6 @@ ports {
> =20
>                                 port@0 {
>                                         reg =3D <0>;
> -                                       du_out_rgb: endpoint {
> -                                       };
>                                 };
>                                 port@1 {
>                                         reg =3D <1>;
> diff --git a/arch/arm64/boot/dts/renesas/r8a77951.dtsi b/arch/arm64/boot/=
dts/renesas/r8a77951.dtsi
> index 0919d8f540c4..b88af4c90f33 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77951.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
> @@ -3318,8 +3318,6 @@ ports {
> =20
>                                 port@0 {
>                                         reg =3D <0>;
> -                                       du_out_rgb: endpoint {
> -                                       };
>                                 };
>                                 port@1 {
>                                         reg =3D <1>;
> diff --git a/arch/arm64/boot/dts/renesas/r8a77960.dtsi b/arch/arm64/boot/=
dts/renesas/r8a77960.dtsi
> index 221ee1ec415d..5e12e80d115e 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77960.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
> @@ -2921,8 +2921,6 @@ ports {
> =20
>                                 port@0 {
>                                         reg =3D <0>;
> -                                       du_out_rgb: endpoint {
> -                                       };
>                                 };
>                                 port@1 {
>                                         reg =3D <1>;
> diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/=
dts/renesas/r8a77961.dtsi
> index ba9358abebb2..4df8ffa84461 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> @@ -2706,8 +2706,6 @@ ports {
> =20
>                                 port@0 {
>                                         reg =3D <0>;
> -                                       du_out_rgb: endpoint {
> -                                       };
>                                 };
>                                 port@1 {
>                                         reg =3D <1>;
> diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/=
dts/renesas/r8a77965.dtsi
> index 5f3046eee365..454e95222acf 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> @@ -2733,8 +2733,6 @@ ports {
> =20
>                                 port@0 {
>                                         reg =3D <0>;
> -                                       du_out_rgb: endpoint {
> -                                       };
>                                 };
>                                 port@1 {
>                                         reg =3D <1>;
> diff --git a/arch/arm64/boot/dts/renesas/r8a77970.dtsi b/arch/arm64/boot/=
dts/renesas/r8a77970.dtsi
> index ad021b2703ab..dc11845625c4 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> @@ -1156,8 +1156,6 @@ ports {
> =20
>                                 port@0 {
>                                         reg =3D <0>;
> -                                       du_out_rgb: endpoint {
> -                                       };
>                                 };
> =20
>                                 port@1 {
> diff --git a/arch/arm64/boot/dts/renesas/r8a77980.dtsi b/arch/arm64/boot/=
dts/renesas/r8a77980.dtsi
> index 29f1161da957..53d0e6b4b75e 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> @@ -1532,8 +1532,6 @@ ports {
> =20
>                                 port@0 {
>                                         reg =3D <0>;
> -                                       du_out_rgb: endpoint {
> -                                       };
>                                 };
> =20
>                                 port@1 {
> diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/=
dts/renesas/r8a77990.dtsi
> index 735c46217835..f49173045232 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> @@ -2016,8 +2016,6 @@ ports {
> =20
>                                 port@0 {
>                                         reg =3D <0>;
> -                                       du_out_rgb: endpoint {
> -                                       };
>                                 };
> =20
>                                 port@1 {
> diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/=
dts/renesas/r8a77995.dtsi
> index 759505bd1a44..3237ff4e5c77 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> @@ -1337,8 +1337,6 @@ ports {
> =20
>                                 port@0 {
>                                         reg =3D <0>;
> -                                       du_out_rgb: endpoint {
> -                                       };
>                                 };
> =20
>                                 port@1 {
> diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm6=
4/boot/dts/renesas/salvator-common.dtsi
> index bf37777dca31..0b0b1fc3a270 100644
> --- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> @@ -385,7 +385,7 @@ &du {
> =20
>         ports {
>                 port@0 {
> -                       endpoint {
> +                       du_out_rgb: endpoint {
>                                 remote-endpoint =3D <&adv7123_in>;
>                         };
>                 };
> --=20
> Regards,
>=20
> Laurent Pinchart
>
