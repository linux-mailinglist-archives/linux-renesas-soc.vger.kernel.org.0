Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70FDB42F14A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Oct 2021 14:48:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234311AbhJOMuK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 15 Oct 2021 08:50:10 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:53538 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233705AbhJOMuK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Oct 2021 08:50:10 -0400
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C03E12E3;
        Fri, 15 Oct 2021 14:48:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1634302082;
        bh=b9HpL66T+wY4JcqCpl5rcVWL6cmnlhbWtWXuOI41eHA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=kpTZ1csoZg96J8lkhDcawXzXEZo9jJMpKKiTtd98r2HROE/ewPtiPIKidv3OTb5se
         ZRLZG84fdFCeo/XXh7MnIty22RGdiex9tKzuYfD0Ei7S5FOJQsrrG1F4RiOhtMYrqf
         T0s+bjf98lO3bm13ChQ/QrXel+J7l+uksyINUfME=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211012183431.718691-1-niklas.soderlund+renesas@ragnatech.se>
References: <20211012183431.718691-1-niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH] arm64: dts: renesas: Add ports node to all adv7482 nodes
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Niklas =?utf-8?q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Niklas =?utf-8?q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Date:   Fri, 15 Oct 2021 13:48:00 +0100
Message-ID: <163430208014.11213.12603150192143954358@Monstersaurus>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Niklas S=C3=B6derlund (2021-10-12 19:34:31)
> The different port@ entries of the adv7482 nodes shall be encapsulated
> in a ports node, add one. This change do not change how the driver
> parses the DT and no driver change is needed.
>=20
> The change however makes it possible to validate the source files with a
> correct json-schema.
>=20

Nice to fix up the validation.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> ---
>  .../arm64/boot/dts/renesas/r8a77990-ebisu.dts | 40 +++++++-------
>  .../boot/dts/renesas/salvator-common.dtsi     | 54 ++++++++++---------
>  2 files changed, 49 insertions(+), 45 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts b/arch/arm64/=
boot/dts/renesas/r8a77990-ebisu.dts
> index 9c7146084ea1c779..b051e2f3aceb5a17 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> @@ -423,37 +423,39 @@ video-receiver@70 {
>                 compatible =3D "adi,adv7482";
>                 reg =3D <0x70>;
> =20
> -               #address-cells =3D <1>;
> -               #size-cells =3D <0>;
> -
>                 interrupt-parent =3D <&gpio0>;
>                 interrupt-names =3D "intrq1", "intrq2";
>                 interrupts =3D <7 IRQ_TYPE_LEVEL_LOW>,
>                              <17 IRQ_TYPE_LEVEL_LOW>;
> =20
> -               port@7 {
> -                       reg =3D <7>;
> +               ports {
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> =20
> -                       adv7482_ain7: endpoint {
> -                               remote-endpoint =3D <&cvbs_con>;
> +                       port@7 {
> +                               reg =3D <7>;
> +
> +                               adv7482_ain7: endpoint {
> +                                       remote-endpoint =3D <&cvbs_con>;
> +                               };
>                         };
> -               };
> =20
> -               port@8 {
> -                       reg =3D <8>;
> +                       port@8 {
> +                               reg =3D <8>;
> =20
> -                       adv7482_hdmi: endpoint {
> -                               remote-endpoint =3D <&hdmi_in_con>;
> +                               adv7482_hdmi: endpoint {
> +                                       remote-endpoint =3D <&hdmi_in_con=
>;
> +                               };
>                         };
> -               };
> =20
> -               port@a {
> -                       reg =3D <10>;
> +                       port@a {
> +                               reg =3D <10>;
> =20
> -                       adv7482_txa: endpoint {
> -                               clock-lanes =3D <0>;
> -                               data-lanes =3D <1 2>;
> -                               remote-endpoint =3D <&csi40_in>;
> +                               adv7482_txa: endpoint {
> +                                       clock-lanes =3D <0>;
> +                                       data-lanes =3D <1 2>;
> +                                       remote-endpoint =3D <&csi40_in>;
> +                               };
>                         };
>                 };
>         };
> diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm6=
4/boot/dts/renesas/salvator-common.dtsi
> index eb1f3b82300b1601..5a55ed7a7efac181 100644
> --- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> @@ -524,47 +524,49 @@ video-receiver@70 {
>                 reg-names =3D "main", "dpll", "cp", "hdmi", "edid", "repe=
ater",
>                             "infoframe", "cbus", "cec", "sdp", "txa", "tx=
b" ;
> =20
> -               #address-cells =3D <1>;
> -               #size-cells =3D <0>;
> -
>                 interrupt-parent =3D <&gpio6>;
>                 interrupt-names =3D "intrq1", "intrq2";
>                 interrupts =3D <30 IRQ_TYPE_LEVEL_LOW>,
>                              <31 IRQ_TYPE_LEVEL_LOW>;
> =20
> -               port@7 {
> -                       reg =3D <7>;
> +               ports {
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> =20
> -                       adv7482_ain7: endpoint {
> -                               remote-endpoint =3D <&cvbs_con>;
> +                       port@7 {
> +                               reg =3D <7>;
> +
> +                               adv7482_ain7: endpoint {
> +                                       remote-endpoint =3D <&cvbs_con>;
> +                               };
>                         };
> -               };
> =20
> -               port@8 {
> -                       reg =3D <8>;
> +                       port@8 {
> +                               reg =3D <8>;
> =20
> -                       adv7482_hdmi: endpoint {
> -                               remote-endpoint =3D <&hdmi_in_con>;
> +                               adv7482_hdmi: endpoint {
> +                                       remote-endpoint =3D <&hdmi_in_con=
>;
> +                               };
>                         };
> -               };
> =20
> -               port@a {
> -                       reg =3D <10>;
> +                       port@a {
> +                               reg =3D <10>;
> =20
> -                       adv7482_txa: endpoint {
> -                               clock-lanes =3D <0>;
> -                               data-lanes =3D <1 2 3 4>;
> -                               remote-endpoint =3D <&csi40_in>;
> +                               adv7482_txa: endpoint {
> +                                       clock-lanes =3D <0>;
> +                                       data-lanes =3D <1 2 3 4>;
> +                                       remote-endpoint =3D <&csi40_in>;
> +                               };
>                         };
> -               };
> =20
> -               port@b {
> -                       reg =3D <11>;
> +                       port@b {
> +                               reg =3D <11>;
> =20
> -                       adv7482_txb: endpoint {
> -                               clock-lanes =3D <0>;
> -                               data-lanes =3D <1>;
> -                               remote-endpoint =3D <&csi20_in>;
> +                               adv7482_txb: endpoint {
> +                                       clock-lanes =3D <0>;
> +                                       data-lanes =3D <1>;
> +                                       remote-endpoint =3D <&csi20_in>;
> +                               };
>                         };
>                 };
>         };
> --=20
> 2.33.0
>
