Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7DAB4BDDF0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Feb 2022 18:46:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377566AbiBUOSV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Feb 2022 09:18:21 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:55742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377540AbiBUOSS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Feb 2022 09:18:18 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB0FF220FE;
        Mon, 21 Feb 2022 06:17:54 -0800 (PST)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9BDF5482;
        Mon, 21 Feb 2022 15:17:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1645453071;
        bh=r4H+HwJWEGLlUMTL1XBB0dzUaoIUSSc+Hgop7hrMCIo=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=qqZ5W0X4nWyKAhc0NCtKxIkHI0c8/tgAxL30YF4v/Pbu0duYwBFKeTtEEsXPmtQxM
         ysGeF95d0bNCiR8d/BVbwbvvwQBMOzgJ1kiXMB0+JMWKkkE8hIv328NAdXGNfwXUVz
         isK8UJMDV4giRY11A9yPO1j2fri97RmMF+Rs7BK8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211229191838.27922-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20211229191838.27922-1-laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: Remove empty lvds endpoints
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Date:   Mon, 21 Feb 2022 14:17:49 +0000
Message-ID: <164545306949.2976960.4762784450294727405@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

Quoting Laurent Pinchart (2021-12-29 19:18:37)
> Endpoints node must have a remote-endpoint property, as endpoints only
> exist to model a link between ports. Drop the empty lvds endpoints from
> SoC dtsi files, then should be instead declared in the board dts or in
> overlays.

Aha, I was hit by this recently(ish) too, as trying to declare things
that are not yet connected as placeholders was ending up generating
warnings for me.

It's a pain, as having the label placeholder makes it easier to connect
to the endpoint later. But this was failing validation otherwise for me,
so I presume it's the correct thing to do. Seems we're still hoping for
some feedback from Rob on this, but it's fine with me.


Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>
> ---
>  arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 2 --
>  arch/arm64/boot/dts/renesas/r8a774b1.dtsi | 2 --
>  arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 4 ----
>  arch/arm64/boot/dts/renesas/r8a774e1.dtsi | 2 --
>  arch/arm64/boot/dts/renesas/r8a77951.dtsi | 2 --
>  arch/arm64/boot/dts/renesas/r8a77960.dtsi | 2 --
>  arch/arm64/boot/dts/renesas/r8a77965.dtsi | 2 --
>  arch/arm64/boot/dts/renesas/r8a77970.dtsi | 2 --
>  arch/arm64/boot/dts/renesas/r8a77980.dtsi | 2 --
>  arch/arm64/boot/dts/renesas/r8a77990.dtsi | 4 ----
>  arch/arm64/boot/dts/renesas/r8a77995.dtsi | 4 ----
>  11 files changed, 28 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/=
dts/renesas/r8a774a1.dtsi
> index 6f4fffacfca2..9a8c1bd923af 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> @@ -2771,8 +2771,6 @@ lvds0_in: endpoint {
>                                 };
>                                 port@1 {
>                                         reg =3D <1>;
> -                                       lvds0_out: endpoint {
> -                                       };
>                                 };
>                         };
>                 };
> diff --git a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi b/arch/arm64/boot/=
dts/renesas/r8a774b1.dtsi
> index 0f7bdfc90a0d..8912c1665ed9 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
> @@ -2616,8 +2616,6 @@ lvds0_in: endpoint {
>                                 };
>                                 port@1 {
>                                         reg =3D <1>;
> -                                       lvds0_out: endpoint {
> -                                       };
>                                 };
>                         };
>                 };
> diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/=
dts/renesas/r8a774c0.dtsi
> index d597772c4c37..263f39fb8ad9 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> @@ -1910,8 +1910,6 @@ lvds0_in: endpoint {
> =20
>                                 port@1 {
>                                         reg =3D <1>;
> -                                       lvds0_out: endpoint {
> -                                       };
>                                 };
>                         };
>                 };
> @@ -1937,8 +1935,6 @@ lvds1_in: endpoint {
> =20
>                                 port@1 {
>                                         reg =3D <1>;
> -                                       lvds1_out: endpoint {
> -                                       };
>                                 };
>                         };
>                 };
> diff --git a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi b/arch/arm64/boot/=
dts/renesas/r8a774e1.dtsi
> index 379a1300272b..02b35e68a3fa 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
> @@ -2891,8 +2891,6 @@ lvds0_in: endpoint {
>                                 };
>                                 port@1 {
>                                         reg =3D <1>;
> -                                       lvds0_out: endpoint {
> -                                       };
>                                 };
>                         };
>                 };
> diff --git a/arch/arm64/boot/dts/renesas/r8a77951.dtsi b/arch/arm64/boot/=
dts/renesas/r8a77951.dtsi
> index 1768a3e6bb8d..0919d8f540c4 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77951.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
> @@ -3362,8 +3362,6 @@ lvds0_in: endpoint {
>                                 };
>                                 port@1 {
>                                         reg =3D <1>;
> -                                       lvds0_out: endpoint {
> -                                       };
>                                 };
>                         };
>                 };
> diff --git a/arch/arm64/boot/dts/renesas/r8a77960.dtsi b/arch/arm64/boot/=
dts/renesas/r8a77960.dtsi
> index 2bd8169735d3..221ee1ec415d 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77960.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
> @@ -2959,8 +2959,6 @@ lvds0_in: endpoint {
>                                 };
>                                 port@1 {
>                                         reg =3D <1>;
> -                                       lvds0_out: endpoint {
> -                                       };
>                                 };
>                         };
>                 };
> diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/=
dts/renesas/r8a77965.dtsi
> index 08df75606430..5f3046eee365 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> @@ -2771,8 +2771,6 @@ lvds0_in: endpoint {
>                                 };
>                                 port@1 {
>                                         reg =3D <1>;
> -                                       lvds0_out: endpoint {
> -                                       };
>                                 };
>                         };
>                 };
> diff --git a/arch/arm64/boot/dts/renesas/r8a77970.dtsi b/arch/arm64/boot/=
dts/renesas/r8a77970.dtsi
> index 517892cf6294..ad021b2703ab 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> @@ -1190,8 +1190,6 @@ lvds0_in: endpoint {
>                                 };
>                                 port@1 {
>                                         reg =3D <1>;
> -                                       lvds0_out: endpoint {
> -                                       };
>                                 };
>                         };
>                 };
> diff --git a/arch/arm64/boot/dts/renesas/r8a77980.dtsi b/arch/arm64/boot/=
dts/renesas/r8a77980.dtsi
> index 6347d15e66b6..29f1161da957 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> @@ -1567,8 +1567,6 @@ lvds0_in: endpoint {
> =20
>                                 port@1 {
>                                         reg =3D <1>;
> -                                       lvds0_out: endpoint {
> -                                       };
>                                 };
>                         };
>                 };
> diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/=
dts/renesas/r8a77990.dtsi
> index 0ea300a8147d..735c46217835 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> @@ -2059,8 +2059,6 @@ lvds0_in: endpoint {
> =20
>                                 port@1 {
>                                         reg =3D <1>;
> -                                       lvds0_out: endpoint {
> -                                       };
>                                 };
>                         };
>                 };
> @@ -2086,8 +2084,6 @@ lvds1_in: endpoint {
> =20
>                                 port@1 {
>                                         reg =3D <1>;
> -                                       lvds1_out: endpoint {
> -                                       };
>                                 };
>                         };
>                 };
> diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/=
dts/renesas/r8a77995.dtsi
> index 16ad5fc23a67..759505bd1a44 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> @@ -1380,8 +1380,6 @@ lvds0_in: endpoint {
> =20
>                                 port@1 {
>                                         reg =3D <1>;
> -                                       lvds0_out: endpoint {
> -                                       };
>                                 };
>                         };
>                 };
> @@ -1407,8 +1405,6 @@ lvds1_in: endpoint {
> =20
>                                 port@1 {
>                                         reg =3D <1>;
> -                                       lvds1_out: endpoint {
> -                                       };
>                                 };
>                         };
>                 };
>=20
> base-commit: 2b534e90a1e31c7fc9536b512b72274cc3575f4c
> prerequisite-patch-id: 98434eb22c020924bc338316e54a7b42ea339e9f
> prerequisite-patch-id: ce261c9865255051f2c2107a930b0f15ce862703
> prerequisite-patch-id: 500ab746415c5421e41128c2b0db35987d8d7a49
> prerequisite-patch-id: ad2d5ad025f9cfa0dc453d7e0b2aa96b4514afd7
> prerequisite-patch-id: ac76bcc0f7b278863e362db083a7d64bbd0bd030
> prerequisite-patch-id: c7a7c3a6b9dbbae18a768160db70d7010ea71ca5
> --=20
> Regards,
>=20
> Laurent Pinchart
>
