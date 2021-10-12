Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46D6442A12F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Oct 2021 11:33:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235607AbhJLJfl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Oct 2021 05:35:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235599AbhJLJfl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Oct 2021 05:35:41 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBA1AC061570
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Oct 2021 02:33:39 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id y26so85980127lfa.11
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Oct 2021 02:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=v7PCjQcUP/CZaf18qkrSPh+Zj01HjXQNRt8VR/YN+aQ=;
        b=WTlKr9Kukj4BDIGULjOTAn/idgtG3NBA8z6folzuzUkQhEaxRoc7MhS/ovydJv6SnO
         1B7758uhHHuMNTYXOhZ7RWlLXlf/1AKquMTyHIz6OR0zJWAaJXhPtS/mQmPXn2I7kkhK
         Os3mUAcrFqMczwbTSydXJbdPlqJOVyuZOVuWstXxdYZnrRUPSPxgtV9Q9B95mpjjYW9/
         HPRIEFtWNTjXBkRhbTHCVe1m2xHXr3XIxxQ9ZpYTc+cqpVU1LHHqoZaLMzzPweR0Ry1N
         Voif+inviFOESsn7WlxCSysGE7si/YSpzFRa6htu7JE5lCQbCnn5x4MBO9WDGmVob5bk
         y8Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=v7PCjQcUP/CZaf18qkrSPh+Zj01HjXQNRt8VR/YN+aQ=;
        b=azmJUTzzRSSvQLnAoZo7ZVUrGDTJFL7kJ/ffrkQSXTx4c3RBKgJTzIe6BMup5xFs/l
         1NjlAW0yOEltuuTalRbif2/ovtDQI0yFv3LEAPx2uVkskzJgxgcF5DxSaOhJKIxhnC+v
         apQqAkwV8255EhOXO5BXScFr4/kWHbvQv1Gbbnp8YV0SVXyz/lk3vTn5RIxIl/RcudL6
         OiWMexzIOMABA1lvygHW04Z9l8ZkFktiVR+l0CrMJrpnuzp2CBA7+uVZ9vwZX9Sgbb+p
         lQhfcKLs3PYfVUmd+pLPzOGtfhl8dZW+YA5IHaFcB7/wBpjTqme/npfCmsJll27kR7K2
         gG4g==
X-Gm-Message-State: AOAM531L8oDNgNJr3066AtMIu7CCRcAnZVWW6OypraER9lnhQgTX1oaM
        1ykMrr+ojcStrxbUfvYcDkDdVQ==
X-Google-Smtp-Source: ABdhPJzevdY2cfddwzxOkjhVwvv/UUEDj250PChdGlLiGNqHFrkcH4XA3U/AmiXmFy2X2wkZvha5tQ==
X-Received: by 2002:a05:6512:1151:: with SMTP id m17mr29256055lfg.99.1634031218120;
        Tue, 12 Oct 2021 02:33:38 -0700 (PDT)
Received: from localhost (h-46-59-88-219.A463.priv.bahnhof.se. [46.59.88.219])
        by smtp.gmail.com with ESMTPSA id b25sm977448lfi.151.2021.10.12.02.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 02:33:37 -0700 (PDT)
Date:   Tue, 12 Oct 2021 11:33:36 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2] arm64: dts: renesas: r8a779a0: Add and connect all
 CSI-2, ISP and VIN nodes
Message-ID: <YWVWcNbLNqKDSTR7@oden.dyn.berto.se>
References: <20211010175227.3247895-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdVY+f22BAT7XBvNX3Nironhu8+vat=_ZOEJZHbSUeQpCQ@mail.gmail.com>
 <CAMuHMdUdJr0-o6dGunU1w34S207NOVp0GkzXQBjJdqqf7Dfa_Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdUdJr0-o6dGunU1w34S207NOVp0GkzXQBjJdqqf7Dfa_Q@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On 2021-10-12 11:22:45 +0200, Geert Uytterhoeven wrote:
> On Tue, Oct 12, 2021 at 9:58 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Sun, Oct 10, 2021 at 7:52 PM Niklas Söderlund
> > <niklas.soderlund+renesas@ragnatech.se> wrote:
> > > The V3U have 32 VIN, 4 CSI-2 and 4 ISP nodes that interact with each
> > > other for video capture. Add all nodes and record how they are
> > > interconnected.
> > >
> > > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > > ---
> > > * Changes since v1
> > > - Fix endpoint for vin00 to vin07 that where missing @0 and
> > >   {address,size}-cells and reg properties.
> > > - Fix endpoint for all isp nodes that where missing @0 and
> > >   {address,size}-cells and reg properties.
> > > - Update compatible for ISP from renesas,isp-r8a779a0 to
> > >   renesas,r8a779a0-isp.
> >
> > Thanks for the update!
> >
> > > The last binding document for the CSI-2 nodes are now merged in the
> > > media-tree and this completes the coverage for the nodes in this patch.
> > >
> > > If you are happy with the corrections I made from v1 I think this is
> > > ready to be picked up.
> >
> > The new version looks good to me, but I still get one complaint from
> > "make dtbs_check", cfr. below.
> >
> > > --- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> >
> > > @@ -1268,6 +2164,426 @@ vspd1: vsp@fea28000 {
> > >                         renesas,fcp = <&fcpvd1>;
> > >                 };
> > >
> > > +               csi40: csi2@feaa0000 {
> > > +                       compatible = "renesas,r8a779a0-csi2";
> > > +                       reg = <0 0xfeaa0000 0 0x10000>;
> > > +                       interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
> > > +                       clocks = <&cpg CPG_MOD 331>;
> > > +                       power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> > > +                       resets = <&cpg 331>;
> > > +                       status = "disabled";
> > > +
> > > +                       ports {
> > > +                               #address-cells = <1>;
> > > +                               #size-cells = <0>;
> > > +
> > > +                               port@1 {
> > > +                                       reg = <1>;
> > > +                                       csi40isp0: endpoint {
> > > +                                               remote-endpoint = <&isp0csi40>;
> > > +                                       };
> > > +                               };
> > > +                       };
> > > +               };
> > > +
> > > +               csi41: csi2@feab0000 {
> > > +                       compatible = "renesas,r8a779a0-csi2";
> > > +                       reg = <0 0xfeab0000 0 0x10000>;
> > > +                       interrupts = <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>;
> > > +                       clocks = <&cpg CPG_MOD 400>;
> > > +                       power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> > > +                       resets = <&cpg 400>;
> > > +                       status = "disabled";
> > > +
> > > +                       ports {
> > > +                               #address-cells = <1>;
> > > +                               #size-cells = <0>;
> > > +
> > > +                               port@1 {
> > > +                                       reg = <1>;
> > > +                                       csi41isp1: endpoint {
> > > +                                               remote-endpoint = <&isp1csi41>;
> > > +                                       };
> > > +                               };
> >
> > arch/arm64/boot/dts/renesas/r8a779a0-falcon.dt.yaml: csi2@feab0000:
> > ports: 'port@0' is a required property
> > From schema: Documentation/devicetree/bindings/media/renesas,csi2.yaml
> >
> > (only for this CSI instance).
> 
> My local tree also has your "arm64: dts: renesas: falcon-csi-dsi:
> Add and connect MAX96712", which adds the missing port@0 subnodes
> to all CSI instances but csi41.

Make sens, I will add empty port@0 nodes to address this issue and 
resend. Thanks for spotting this.

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
Regards,
Niklas Söderlund
