Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E80602642A4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Sep 2020 11:44:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728626AbgIJJoo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Sep 2020 05:44:44 -0400
Received: from mail-oo1-f68.google.com ([209.85.161.68]:40804 "EHLO
        mail-oo1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728971AbgIJJon (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Sep 2020 05:44:43 -0400
Received: by mail-oo1-f68.google.com with SMTP id r4so1289157ooq.7;
        Thu, 10 Sep 2020 02:44:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bme4dCuLQz1jNtKozCKrKV/qMMzTtbQIKl8SOBrnIpY=;
        b=AuKFEPKVmBZo7pELQtXzmJI5uovDNfUgv+6n+DdteOunXuTxeExuJFgh3hgkw12ujt
         c1O+86zv6YqYlqM7GeSTqG/NsftAv3m4qohMsbcbqdhJU8LPC1VpFv5BR35IqBtW2Fh7
         qIXNWq2THdxNRx5iTRUjKLX+GY83Iwyz8K297ZZzcs8cFLUeRiJhdWV+8InzaEPP9hpj
         g8WepWmi6slkV55mvrntZhRjbliwfy446eeN/JpDUHR2LTxH0w89c2qXSf/kS2675gH5
         I9chPkNkUfsG06CL0RQAtsittMsIA/aVJ42fdyFNUak6lhDHiHRGxT733Bt+0+VT5Vvt
         dgng==
X-Gm-Message-State: AOAM532y2aTQtdNFtYybfYiJvUSsHcDvLjHPdxmZI8oeniAm2RS5IXMk
        iNP1g15SYJPPzjdxABJ4WqdhNaHQP7/0upI++2unwWjm
X-Google-Smtp-Source: ABdhPJx/YwFaGebZ9WNscKSjKZjyL215smGi7wQIDspuYwOwQujoXq+ek3zx2mrKm058JDDmK0imBOa/5Ycsl0/cbLE=
X-Received: by 2002:a4a:da4e:: with SMTP id f14mr3811962oou.40.1599731082021;
 Thu, 10 Sep 2020 02:44:42 -0700 (PDT)
MIME-Version: 1.0
References: <87sgbu70tq.wl-kuninori.morimoto.gx@renesas.com>
 <87lfhm70s6.wl-kuninori.morimoto.gx@renesas.com> <31ec6196-7613-8eb3-e092-07d0c874632a@ideasonboard.com>
In-Reply-To: <31ec6196-7613-8eb3-e092-07d0c874632a@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 10 Sep 2020 11:44:30 +0200
Message-ID: <CAMuHMdVHGQ0FFcLjQfXhke5PKJKnNfZ3NOF-p08v3QrQ-87npA@mail.gmail.com>
Subject: Re: [PATCH 5/9] arm64: dts: renesas: r8a77961: Add VSP device nodes
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Laurent <laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-DT <devicetree@vger.kernel.org>,
        "(Renesas) shimoda" <yoshihiro.shimoda.uh@renesas.com>,
        DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

On Mon, Sep 7, 2020 at 5:55 PM Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
> On 07/09/2020 03:59, Kuninori Morimoto wrote:
> > From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> >
> > This patch adds VSP device nodes for R-Car M3-W+ (r8a77961) SoC.
> > This patch is test on R-Car M3-W+ Salvator-XS board.
> >
> > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > ---
> >  arch/arm64/boot/dts/renesas/r8a77961.dtsi | 55 +++++++++++++++++++++++
> >  1 file changed, 55 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> > index fe0db11b9cb9..c2a6918ed5e6 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> > @@ -2056,6 +2056,61 @@ fcpvd2: fcp@fea37000 {
> >                       iommus = <&ipmmu_vi0 10>;
> >               };
>
> The FCP's added are:
>
>                 fcpf0: fcp@fe950000 {
>                 fcpf1: fcp@fe951000 {
>                 fcpvb0: fcp@fe96f000 {
>                 fcpvb1: fcp@fe92f000 {
>                 fcpvi0: fcp@fe9af000 {
>                 fcpvi1: fcp@fe9bf000 {
>                 fcpvd0: fcp@fea27000 {
>                 fcpvd1: fcp@fea2f000 {
>                 fcpvd2: fcp@fea37000 {
>
> So indeed, the first fcpf0 comes before fe960000.
>
> Do we keep the items grouped by the first occurrence? or sort the nodes
> based on address?
>
> for some reason I thought we were ordering based on address, but I see
> other situations where we group too - so I'm confused (and wishing there
> was an automatic tool to get the sorting correct without fuss).
>
> Is there a set policy?

For nodes with a unit-address, we usually[*] sort by unit-address, but we keep
similar nodes grouped.  Hence I prefer this v1 over v2.

[*] Seems like FCP/VSP are interleaved in r8a77990.dsi, doh.

> > +             vspb: vsp@fe960000 {
> > +                     compatible = "renesas,vsp2";
> > +                     reg = <0 0xfe960000 0 0x8000>;
> > +                     interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
> > +                     clocks = <&cpg CPG_MOD 626>;
> > +                     power-domains = <&sysc R8A77961_PD_A3VC>;
> > +                     resets = <&cpg 626>;
> > +
> > +                     renesas,fcp = <&fcpvb0>;
> > +             };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
