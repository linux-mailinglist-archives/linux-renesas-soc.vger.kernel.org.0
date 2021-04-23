Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DF093691B2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Apr 2021 14:02:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242256AbhDWMDM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 23 Apr 2021 08:03:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234417AbhDWMDM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Apr 2021 08:03:12 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E5DFC061574
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Apr 2021 05:02:35 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id j4so37677479lfp.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Apr 2021 05:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=KaTsdeS6HZajoe8g7HDEt2PBc0+Qb5jR/NhNmsqWdnk=;
        b=vtxlX/kIBgtj8gt6lin1t9RGXGt+zPZkip9iY5IYviH1R4lywY7OeD59iZv4bi1Fwc
         2+F37b2CzVm6sJlJN5JNFywCd9fSvDucwydlmBWPxt62VvSWTic8ef3eR3OBzCEqbwCZ
         MBNm9UFsF6BGx92nEAzpkgFSUyCCDx94H58E2L8Prp8mApxe0a3IJfccz8V6PeWmMW39
         DkNmzxf2CErYLU15CE54A7icKPWQ46SLUNmM7tEyCgwm8bQJ1gSlUsbrN2SBZLsXtdD2
         2pTXPQCj9clFTvJdINsamKvfpYLMLs/S5z1CUFJNeYxVSLd908JDgOc9y29GUfQQrsci
         zNEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=KaTsdeS6HZajoe8g7HDEt2PBc0+Qb5jR/NhNmsqWdnk=;
        b=aqZ9CwjVkRXtEAC5RWTsZXNDuuzykFBu7xvAIGx2HgYvq7OnU7Q8Qxfoc+isXYZrng
         dN2yNr6AkVT0dRvjrT9Mq0WDfD4K5sAqc8/SzS+WYty/A2MrMjBiAimFsZT8q0jR2P4I
         x6Rgfk1bTAkv1GtO531sOEav1VBnKt9olDaqv0X4IWRb5j9zQ8EFy9GjN5QLGmnqF2H9
         46YwMFxsDPhMkqUKcFNM2ACkTfWFAtJP7tWgtwsNJw7lGV+Reb+MRveCZElmwOv+v5wY
         LYAy9i/63OBSNtMs/bmdEyvhXFVB9/zUOtwuXhxL3K6GdteFcfCaZA0bpKuMOrvITY50
         JSFw==
X-Gm-Message-State: AOAM531qVxZ+vmhhrZSsNRBadObMnSpU7h9BMhfXg+Do5Yc0JkEuZ9na
        aItZmniKpJDQIdq6XqghiMaOmncQmEUHt0Jj
X-Google-Smtp-Source: ABdhPJyaTAIt2UVBpognWy2Bx+e+pp/mvFsxsrxLIH+r31/8z2Piff+yO/OfXh7vdBRqkFx1wOsOpw==
X-Received: by 2002:a05:6512:3c8c:: with SMTP id h12mr2586954lfv.388.1619179354045;
        Fri, 23 Apr 2021 05:02:34 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id t14sm536741lfp.6.2021.04.23.05.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 05:02:33 -0700 (PDT)
Date:   Fri, 23 Apr 2021 14:02:32 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a779a0: Add and connect all
 CSI-2, ISP and VIN nodes
Message-ID: <YIK3WM7Mr16U3uju@oden.dyn.berto.se>
References: <20210413184844.2606086-1-niklas.soderlund+renesas@ragnatech.se>
 <20210413184844.2606086-2-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdUC2VVnu-pQnpEkfR-EtCo=coghhfYNkjS2bfVERvar8Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdUC2VVnu-pQnpEkfR-EtCo=coghhfYNkjS2bfVERvar8Q@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your comments.

On 2021-04-23 11:25:59 +0200, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> On Tue, Apr 13, 2021 at 8:49 PM Niklas Söderlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> > The V3U have 32 VIN, 4 CSI-2 and 4 ISP nodes that interact with each
> > other for video capture. Add all nodes and record how they are
> > interconnected.
> >
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Thanks for your patch!
> 
> The "standard" properties (reg/interrupts/clocks/resets/...) look good
> to me.
> 
> > --- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> > @@ -1017,6 +1017,870 @@ msiof5: spi@e6c28000 {
> >                         status = "disabled";
> >                 };
> >
> > +               vin00: video@e6ef0000 {
> > +                       compatible = "renesas,vin-r8a779a0";
> > +                       reg = <0 0xe6ef0000 0 0x1000>;
> > +                       interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>;
> > +                       clocks = <&cpg CPG_MOD 730>;
> > +                       power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> > +                       resets = <&cpg 730>;
> > +                       renesas,id = <0>;
> > +                       status = "disabled";
> > +
> > +                       ports {
> > +                               #address-cells = <1>;
> > +                               #size-cells = <0>;
> > +
> > +                               port@2 {
> > +                                       reg = <2>;
> > +
> > +                                       vin00isp0: endpoint {
> 
> Shouldn't this be endpoint@0 (+ appropriate {address,size}-cells above),
> as per the DT bindings?
> Same for vin 01-07.

It really should, but doing so for single endpoint if that endpoint is 
@0 produced warnings when verifying the DTS. I think this is a bug in 
the verification but after digging around in other DTS files it seemed 
this was the "solution".

I will dig some more.

> 
> > +                                               remote-endpoint = <&isp0vin00>;
> > +                                       };
> > +                               };
> > +                       };
> > +               };
> 
> > +               isp0: isp@fed00000 {
> > +                       compatible = "renesas,isp-r8a779a0";
> 
> renesas,r8a779a0-isp (for all ISP nodes).

Yes ;-)

> 
> > +                       reg = <0 0xfed00000 0 0x10000>;
> > +                       interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
> > +                       clocks = <&cpg CPG_MOD 612>;
> > +                       power-domains = <&sysc R8A779A0_PD_A3ISP01>;
> > +                       resets = <&cpg 612>;
> > +                       status = "disabled";
> > +
> > +                       ports {
> > +                               #address-cells = <1>;
> > +                               #size-cells = <0>;
> > +
> > +                               port@0 {
> > +                                       reg = <0>;
> > +                                       isp0csi40: endpoint {
> 
> Shouldn't this be endpoint@something  (+ appropriate {address,size}-cells
> above), as the bindings say there can be multiple endpoints?
> Same for isp2csi42.

Same as above, will dig more.

> 
> > +                                               remote-endpoint = <&csi40isp0>;
> > +                                       };
> > +                               };
> 
> > +               isp1: isp@fed20000 {
> > +                       compatible = "renesas,isp-r8a779a0";
> > +                       reg = <0 0xfed20000 0 0x10000>;
> > +                       interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
> > +                       clocks = <&cpg CPG_MOD 613>;
> > +                       power-domains = <&sysc R8A779A0_PD_A3ISP01>;
> > +                       resets = <&cpg 613>;
> > +                       status = "disabled";
> > +
> > +                       ports {
> > +                               #address-cells = <1>;
> > +                               #size-cells = <0>;
> > +
> > +                               port@0 {
> > +                                       #address-cells = <1>;
> > +                                       #size-cells = <0>;
> > +
> > +                                       reg = <0>;
> > +                                       isp1csi41: endpoint@1 {
> > +                                               reg = <1>;
> 
> BTW, where does the "1" come from?
> Same for isp3csi43.

Each ISP have one input port, modeled as port@0. This port can runtime 
switched between two CSI-2 receivers, see bit 31 of the ISP ISPINPUTSEL0 
register and the ISP block diagram.

For the final form of this node each ISP will have an endpoint@0 and 
endpoint@1 to each of the two nodes it are connected to. Unfortunately 
the datasheet I have access to do not document these relationships and 
what is added in this patch is found by trail and error ;-P

> 
> > +                                               remote-endpoint = <&csi41isp1>;
> > +                                       };
> > +                               };
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
