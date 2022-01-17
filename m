Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85C32490744
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jan 2022 12:46:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239188AbiAQLqD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jan 2022 06:46:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239176AbiAQLqD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jan 2022 06:46:03 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2786C061574;
        Mon, 17 Jan 2022 03:46:02 -0800 (PST)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 52F2E596;
        Mon, 17 Jan 2022 12:46:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1642419961;
        bh=JAH6PFlaV5barNwAV5MsZZzMPdgHmD5U9UqJFKnv/GU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=sYfBv+OhVALSy85kpSb6xvq6GFZIL1e49zpQsCTb1iJC92YFPc7jaCt/K20KjNpJF
         qvuKFsq+LJQXE+oZ75+yKUXTs6hR7XkDaBIiPhVLxarGNuEvz8w0lEVyrPQkUUXXfx
         ToLxeS3ufRV1j138Qu6bOcrwq6b3MkKzHZhP3hhc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211212013351.595-3-laurent.pinchart+renesas@ideasonboard.com>
References: <20211212013351.595-1-laurent.pinchart+renesas@ideasonboard.com> <20211212013351.595-3-laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: Add panel overlay for Salvator-X(S) boards
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Date:   Mon, 17 Jan 2022 11:45:58 +0000
Message-ID: <164241995870.10801.12606918126467572976@Monstersaurus>
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

Quoting Laurent Pinchart (2021-12-12 01:33:50)
> The Salvator-X and Salvator-XS boards support an optional LVDS panel.
> One compatible panel is the Mitsubishi AA104XD12. Add a corresponding DT
> overlay.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>
> ---
>  arch/arm64/boot/dts/renesas/Makefile          |  2 ++
>  .../dts/renesas/salvator-panel-aa104xd12.dts  | 32 +++++++++++++++++++
>  2 files changed, 34 insertions(+)
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

dts/renesas/ is quite busy with platform support already.  If overlays
are added which could theoretically be anynumber of external devices ...
should they be under a sub-directory here? I think it would make make
overlays both easier to identify, and easier to find.


> diff --git a/arch/arm64/boot/dts/renesas/salvator-panel-aa104xd12.dts b/a=
rch/arm64/boot/dts/renesas/salvator-panel-aa104xd12.dts
> new file mode 100644
> index 000000000000..ca2d579fe42f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/salvator-panel-aa104xd12.dts
> @@ -0,0 +1,32 @@
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
> +};
> +
> +&{/panel} {
> +       backlight =3D <&backlight>;
> +
> +       port {
> +               panel_in: endpoint {
> +                       remote-endpoint =3D <&lvds0_out>;

Of course, overlay are always going to be very platform specific though
...

Which I guess is why you have the panel itself broken out which seems
like a good idea, as that could then be used by multiple platoforms? (at
least within the renesas structure so far)

Seems like overlays are still a pain ;-)


> +               };
> +       };
> +};
> +
> +&lvds0 {
> +       status =3D "okay";
> +};
> +
> +&lvds0_out {
> +       remote-endpoint =3D <&panel_in>;
> +};
> --=20
> Regards,
>=20
> Laurent Pinchart
>
