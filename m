Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7EAA7512CCB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Apr 2022 09:28:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238590AbiD1Hbz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 28 Apr 2022 03:31:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231146AbiD1Hby (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Apr 2022 03:31:54 -0400
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E85E75DA36;
        Thu, 28 Apr 2022 00:28:39 -0700 (PDT)
Received: by mail-qk1-f176.google.com with SMTP id j9so3021561qkg.1;
        Thu, 28 Apr 2022 00:28:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p0DTtmQR8+y4KQZHhVYB7vR22g+qoA6zYJL7IthJW2g=;
        b=CCIebXVp+CAFnmRusDeL44Op8Ka1ezhN1hZL0N6MYRmNATZYREr/vpOIWpWddxjoLJ
         Qj0feejo95BTJfAWtC9bTxS41sBbvrZTuBDUXlZJebNdkF/rZzd3bGEdYOAQeJJIBJUZ
         oIxpJ8tTLtimsiuA0A445u6fpmTpt3JpRbxc2apjVtmMVNqRlZn3D41ModMDkSue+lGL
         pOBCXJmF9CTtNATtvKsOcPuEJ4WFAOjRD1A5S5Wo0zO6IfDYxl8pUToTxQtXGdDynSl+
         E8Wr3kLBWFiEXKi6DZ+DMfSX5qTXEpHOEp8Qb6a5M5Qvvm3g3AD9baFFkUDR3ssOvids
         NZXQ==
X-Gm-Message-State: AOAM531bVGvbZsg2PT09o2GMAf53lD0j++JhxctNHLJJVDr9Hu9RcsoH
        A8xKqIEjrPpJ4vge6wc/k/Fi7GdKu4x/Cg==
X-Google-Smtp-Source: ABdhPJwTPdSkO8t+D0K9vR0KIi44n6+ijCrBY9wHxB199q11fxzx89T18Jdvj0+5lM4hgVANBeMKpQ==
X-Received: by 2002:a05:620a:254f:b0:680:f510:22e4 with SMTP id s15-20020a05620a254f00b00680f51022e4mr18436259qko.554.1651130918510;
        Thu, 28 Apr 2022 00:28:38 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id x188-20020a3795c5000000b0069eb51aa159sm9171157qkd.108.2022.04.28.00.28.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Apr 2022 00:28:38 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-2f7c424c66cso43489877b3.1;
        Thu, 28 Apr 2022 00:28:37 -0700 (PDT)
X-Received: by 2002:a81:8489:0:b0:2f7:edff:239f with SMTP id
 u131-20020a818489000000b002f7edff239fmr19073069ywf.256.1651130917627; Thu, 28
 Apr 2022 00:28:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220330154024.112270-1-phil.edworthy@renesas.com>
 <20220330154024.112270-13-phil.edworthy@renesas.com> <CAMuHMdWVtJ-_KHUKCsuahhqP1YUwJGLDeVJmvBA0zuA28nwinQ@mail.gmail.com>
 <TYYPR01MB7086F756432C1F67E76BC6CFF5FA9@TYYPR01MB7086.jpnprd01.prod.outlook.com>
In-Reply-To: <TYYPR01MB7086F756432C1F67E76BC6CFF5FA9@TYYPR01MB7086.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 28 Apr 2022 09:28:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX-dpB2Co2Wd0R2WxqSczNgt6zwtMXWAWjaxhHnX=tJaw@mail.gmail.com>
Message-ID: <CAMuHMdX-dpB2Co2Wd0R2WxqSczNgt6zwtMXWAWjaxhHnX=tJaw@mail.gmail.com>
Subject: Re: [PATCH v2 12/13] arm64: dts: renesas: Add initial DTSI for RZ/V2M SoC
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Phil,

On Wed, Apr 27, 2022 at 8:53 PM Phil Edworthy <phil.edworthy@renesas.com> wrote:
> On 26 April 2022 19:13 Geert Uytterhoeven wrote:
> > On Wed, Mar 30, 2022 at 5:42 PM Phil Edworthy wrote:
> > > Details of the SoC can be found here:
> > > https://www.renesas.com/us/en/products/microcontrollers-
> > microprocessors/rz-cortex-a-mpus/rzv2m-dual-cortex-a53-lpddr4x32bit-ai-
> > accelerator-isp-4k-video-codec-4k-camera-input-fhd-display-output
> > >
> > > Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> > > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/renesas/r9a09g011.dtsi

> > > +       timer {
> > > +               compatible = "arm,armv8-timer";
> > > +               interrupts-extended = <&gic GIC_PPI 13
> > (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
> > > +                                     <&gic GIC_PPI 14
> > (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
> > > +                                     <&gic GIC_PPI 11
> > (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
> > > +                                     <&gic GIC_PPI 10
> > (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>;
> > > +               clocks = <&cpg CPG_MOD R9A09G011_SYC_CNT_CLK>;
> > > +               clock-names = "clk";
> > > +               resets = <&cpg R9A09G011_SYC_RST_N>;
> >
> > The three properties above are not document, causing the following
> > "make dtbs_check" error message:
> >
> > arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dtb: timer:
> > 'clock-names', 'clocks', 'resets' do not match any of the regexes:
> > 'pinctrl-[0-9]+'
> >         From schema:
> > Documentation/devicetree/bindings/timer/arm,arch_timer.yaml
> Right.
> I assume the correct action is to update the bindings, right?

Yes.

> Of course, not much will work without this clock enabled ;)

And that's why you have it (rightfully) marked as a critical clock
in the clock driver.

> Btw, do you know of a way to run "make dtbs_check" for a single dtb?

"make dtbs_check" only runs checks on DTBs created by "make dtbs".
Hence make sure your .config has only CONFIG_ARCH_R9A09G011
enabled?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
