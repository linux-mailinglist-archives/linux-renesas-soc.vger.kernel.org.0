Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 129DA763B3F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jul 2023 17:38:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233633AbjGZPiu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 26 Jul 2023 11:38:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231317AbjGZPit (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Jul 2023 11:38:49 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC462E47
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Jul 2023 08:38:48 -0700 (PDT)
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8F5D35AA;
        Wed, 26 Jul 2023 17:37:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1690385868;
        bh=6KofjUo78ki1QeJdNoJlWrb5CxhndjGUonfZGAXscL8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=bpfiYTCYq1aFcwShI0JnAANG26vV1UWSzpTTNFTD1pwsrTJ4M532Gg91Ey2EJ1Z1j
         tLOlIOu/kG1AeM98O8r+yg2BH/3NP5vw4NpUXqppiXIqSCVKG6YOCU0cX9b33A8OGr
         yAGieFOmuAT62mkdPLkjLK5Psv/S4fczLPLan2Cw=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <6c709d2c7776b2b31e127b14c2127195732c592e.1690382328.git.geert+renesas@glider.be>
References: <cover.1690382328.git.geert+renesas@glider.be> <6c709d2c7776b2b31e127b14c2127195732c592e.1690382328.git.geert+renesas@glider.be>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r8a779f0: Add INTC-EX node
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Date:   Wed, 26 Jul 2023 16:38:44 +0100
Message-ID: <169038592474.137962.12050246657929885898@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2023-07-26 15:44:42)
> Add the device node for the Interrupt Controller for External Devices
> (INTC-EX) on the Renesas R-Car S4-8 (R8A779F0) SoC, which serves
> external IRQ pins IRQ[0-5].

Well, I believe we have at least validated the core intc_ex with the
test in 3/3... so=20

Tested-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  arch/arm64/boot/dts/renesas/r8a779f0.dtsi | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi b/arch/arm64/boot/=
dts/renesas/r8a779f0.dtsi
> index 1d5426e6293c5616..0059c9c580f3f9ef 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
> @@ -466,6 +466,21 @@ tsc: thermal@e6198000 {
>                         #thermal-sensor-cells =3D <1>;
>                 };
> =20
> +               intc_ex: interrupt-controller@e61c0000 {
> +                       compatible =3D "renesas,intc-ex-r8a779f0", "renes=
as,irqc";
> +                       #interrupt-cells =3D <2>;
> +                       interrupt-controller;
> +                       reg =3D <0 0xe61c0000 0 0x200>;
> +                       interrupts =3D <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&cpg CPG_CORE R8A779F0_CLK_CL16M>;
> +                       power-domains =3D <&sysc R8A779F0_PD_ALWAYS_ON>;
> +               };
> +
>                 tmu0: timer@e61e0000 {
>                         compatible =3D "renesas,tmu-r8a779f0", "renesas,t=
mu";
>                         reg =3D <0 0xe61e0000 0 0x30>;
> --=20
> 2.34.1
>
