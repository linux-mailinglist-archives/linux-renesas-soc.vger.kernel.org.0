Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46F2742A0EC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Oct 2021 11:23:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235386AbhJLJY6 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Oct 2021 05:24:58 -0400
Received: from mail-ua1-f47.google.com ([209.85.222.47]:38643 "EHLO
        mail-ua1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235498AbhJLJY6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Oct 2021 05:24:58 -0400
Received: by mail-ua1-f47.google.com with SMTP id h19so5896042uax.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Oct 2021 02:22:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=oLq2Di8cicQIR+WCUgiSnhZQefUo/uLE8Y1GXKRYm3w=;
        b=A19dxIQMf+1C6TBFAzNGhR9o49gGDTZrFnbTVldRRZGzzBFN3ic48zMQRwW2lqfQUX
         SACk6A/Da10x6bZYMwfCDjXszBkczRd7EnZ+5ybozRc04D9H/05NI0pb1CHy6S2zaZ1q
         DM+L+pGI/6bO7mbVtaWYpYCRen8BpvyGoinOva3dr4gkBV/WPYP0lgKeAX/2G9fVglr2
         SSQRJuzntxAz6UxuFXDFAJRV0/ot6EIIKBg4S0KvrzeBq8EXmx2RyRdOViGIO0XWu+WQ
         jOv1h3dhBt3AkCbri5p0TKh21Vo0Z03zv3ArQkF0gFDA4WYXl7kPa9oPRlZrVZ2qV6CL
         lstQ==
X-Gm-Message-State: AOAM532gRvgVurJ9tpNJ+WI9PF8lPjzUjLUF/K2vOUhjxjMlxmwvPJh5
        eiBab2VDWYoaTdCEbGOMPsW1s+iYQFlLUHAHg8PZffxLI9Y=
X-Google-Smtp-Source: ABdhPJzhbWAxEC29jKmjo/gMZGTQ0hnu5PN39yvzwKpn7bPm5lumxqQGr0ajT9X0SdwnpFuZs6Fp6A+OI2juBpiaD0U=
X-Received: by 2002:a67:ac04:: with SMTP id v4mr29243046vse.50.1634030576450;
 Tue, 12 Oct 2021 02:22:56 -0700 (PDT)
MIME-Version: 1.0
References: <20211010175227.3247895-1-niklas.soderlund+renesas@ragnatech.se> <CAMuHMdVY+f22BAT7XBvNX3Nironhu8+vat=_ZOEJZHbSUeQpCQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVY+f22BAT7XBvNX3Nironhu8+vat=_ZOEJZHbSUeQpCQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 12 Oct 2021 11:22:45 +0200
Message-ID: <CAMuHMdUdJr0-o6dGunU1w34S207NOVp0GkzXQBjJdqqf7Dfa_Q@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: r8a779a0: Add and connect all
 CSI-2, ISP and VIN nodes
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Oct 12, 2021 at 9:58 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Sun, Oct 10, 2021 at 7:52 PM Niklas Söderlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> > The V3U have 32 VIN, 4 CSI-2 and 4 ISP nodes that interact with each
> > other for video capture. Add all nodes and record how they are
> > interconnected.
> >
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> > * Changes since v1
> > - Fix endpoint for vin00 to vin07 that where missing @0 and
> >   {address,size}-cells and reg properties.
> > - Fix endpoint for all isp nodes that where missing @0 and
> >   {address,size}-cells and reg properties.
> > - Update compatible for ISP from renesas,isp-r8a779a0 to
> >   renesas,r8a779a0-isp.
>
> Thanks for the update!
>
> > The last binding document for the CSI-2 nodes are now merged in the
> > media-tree and this completes the coverage for the nodes in this patch.
> >
> > If you are happy with the corrections I made from v1 I think this is
> > ready to be picked up.
>
> The new version looks good to me, but I still get one complaint from
> "make dtbs_check", cfr. below.
>
> > --- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
>
> > @@ -1268,6 +2164,426 @@ vspd1: vsp@fea28000 {
> >                         renesas,fcp = <&fcpvd1>;
> >                 };
> >
> > +               csi40: csi2@feaa0000 {
> > +                       compatible = "renesas,r8a779a0-csi2";
> > +                       reg = <0 0xfeaa0000 0 0x10000>;
> > +                       interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
> > +                       clocks = <&cpg CPG_MOD 331>;
> > +                       power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> > +                       resets = <&cpg 331>;
> > +                       status = "disabled";
> > +
> > +                       ports {
> > +                               #address-cells = <1>;
> > +                               #size-cells = <0>;
> > +
> > +                               port@1 {
> > +                                       reg = <1>;
> > +                                       csi40isp0: endpoint {
> > +                                               remote-endpoint = <&isp0csi40>;
> > +                                       };
> > +                               };
> > +                       };
> > +               };
> > +
> > +               csi41: csi2@feab0000 {
> > +                       compatible = "renesas,r8a779a0-csi2";
> > +                       reg = <0 0xfeab0000 0 0x10000>;
> > +                       interrupts = <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>;
> > +                       clocks = <&cpg CPG_MOD 400>;
> > +                       power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> > +                       resets = <&cpg 400>;
> > +                       status = "disabled";
> > +
> > +                       ports {
> > +                               #address-cells = <1>;
> > +                               #size-cells = <0>;
> > +
> > +                               port@1 {
> > +                                       reg = <1>;
> > +                                       csi41isp1: endpoint {
> > +                                               remote-endpoint = <&isp1csi41>;
> > +                                       };
> > +                               };
>
> arch/arm64/boot/dts/renesas/r8a779a0-falcon.dt.yaml: csi2@feab0000:
> ports: 'port@0' is a required property
> From schema: Documentation/devicetree/bindings/media/renesas,csi2.yaml
>
> (only for this CSI instance).

My local tree also has your "arm64: dts: renesas: falcon-csi-dsi:
Add and connect MAX96712", which adds the missing port@0 subnodes
to all CSI instances but csi41.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
