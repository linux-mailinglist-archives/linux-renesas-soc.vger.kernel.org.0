Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B2177F009
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Aug 2019 11:11:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729364AbfHBJL3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Aug 2019 05:11:29 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:52445 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728211AbfHBJL2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Aug 2019 05:11:28 -0400
Received: by mail-wm1-f68.google.com with SMTP id s3so67180189wms.2;
        Fri, 02 Aug 2019 02:11:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Hnsx/myuKU8CZrLEB/+A7DMxOKBO2Py5jD4oU8Y4/o8=;
        b=aoLp7TcLlqTHn7qkLk3HZhJSYptZ82YkY7HyPVUaLALRK1PMgcK4/vt9bi4qPH3WnS
         cr0I/+wkxzEtdzFsJ865tnOJlHu2++ZF8nS6X7HE4F9MEL0Kqqnx1iWDikjga8PWuhK+
         Xm0MUmGoS7+6E4LdP1uDpSYpS5eCZmuv4QSidgX0f/zNrkEZpdS0P8FsFCAcPZSDPQEa
         F6tA6tjlomWArkn3+8xRaw9eo1V2AkEFaGwOcdj3V3s7pMhhcb9mAh9OTSK9LS2fTv0e
         9hIG4FNa3GqyqC5K4tOVfpNBjLWxg51aO7FtDOHwOj98L9fTZa+hn7AxcoDKS1LVQeD7
         b6SQ==
X-Gm-Message-State: APjAAAX+xX8eNS7MrOEb/+wmWQvQf5TXWOwsgWUKUtNl9RN+O/YgoP9f
        l972DQGf/7Q6g8jjNHKYkb5LEqhxDbFEWvEFzf4=
X-Google-Smtp-Source: APXvYqy76PCiAwQnTbv702wV6Wip9o5rOjmLcClxioddSmpZ/+zO4jAzr2GuOOqne3Qn/rwgjKvb3Kbd7AVnuj6Sit8=
X-Received: by 2002:a1c:a7c6:: with SMTP id q189mr3611301wme.146.1564737087216;
 Fri, 02 Aug 2019 02:11:27 -0700 (PDT)
MIME-Version: 1.0
References: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com> <1564731249-22671-13-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1564731249-22671-13-git-send-email-fabrizio.castro@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 2 Aug 2019 11:11:15 +0200
Message-ID: <CAMuHMdVRg_N3S1OPVyy_Wj13XUHnTdWPY3iaOTuogah5oZCUWw@mail.gmail.com>
Subject: Re: [PATCH/RFC 12/12] arm64: dts: renesas: Add EK874 board with
 idk-2121wr display support
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>, ebiharaml@si-linux.co.jp
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Fabrizio,

On Fri, Aug 2, 2019 at 9:35 AM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> The EK874 is advertised as compatible with panel IDK-2121WR from
> Advantech, however the panel isn't sold alongside the board.
> A new dts, adding everything that's required to get the panel to
> to work with the EK874, is the most convenient way to support the
> EK874 when it's connected to the IDK-2121WR.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a774c0-ek874-idk-2121wr.dts
> @@ -0,0 +1,112 @@

[...]

> +       panel-lvds {
> +               compatible = "advantech,idk-2121wr", "panel-lvds";
> +
> +               width-mm = <476>;
> +               height-mm = <268>;
> +
> +               data-mapping = "vesa-24";
> +
> +               panel-timing {
> +                       clock-frequency = <148500000>;
> +                       hactive = <1920>;
> +                       vactive = <1080>;
> +                       hsync-len = <44>;
> +                       hfront-porch = <88>;
> +                       hback-porch = <148>;
> +                       vfront-porch = <4>;
> +                       vback-porch = <36>;
> +                       vsync-len = <5>;
> +               };
> +
> +               ports {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +
> +                       port@0 {
> +                               reg = <0>;
> +                               lvds0_panel_in: endpoint {
> +                                       remote-endpoint = <&lvds0_out>;
> +                               };
> +                       };
> +
> +                       port@1 {
> +                               reg = <1>;
> +                               lvds1_panel_in: endpoint {
> +                                       remote-endpoint = <&lvds1_out>;
> +                               };
> +                       };
> +               };
> +       };
> +};

[...]

> +&lvds0 {
> +       renesas,swap-data;
> +
> +       ports {
> +               port@1 {
> +                       lvds0_out: endpoint {
> +                               remote-endpoint = <&lvds0_panel_in>;
> +                       };
> +               };
> +       };
> +};
> +
> +&lvds1 {
> +       status = "okay";
> +
> +       clocks = <&cpg CPG_MOD 727>, <&x13_clk>, <&extal_clk>;
> +       clock-names = "fck", "dclkin.0", "extal";
> +
> +       ports {
> +               port@1 {
> +                       lvds1_out: endpoint {
> +                               remote-endpoint = <&lvds1_panel_in>;
> +                       };
> +               };
> +       };
> +};

Shouldn't the actual panel definition, and the lvds remote-endpoint setup,
be extracted into a separate .dtsi, to be included here?

Cfr. arch/arm/boot/dts/r8a77xx-aa104xd12-panel.dtsi and
arch/arm/boot/dts/r8a77xx-aa121td01-panel.dtsi.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
