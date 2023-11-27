Return-Path: <linux-renesas-soc+bounces-285-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 274787FA1FA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Nov 2023 15:05:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8712BB20D16
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Nov 2023 14:05:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D2D330CE2;
	Mon, 27 Nov 2023 14:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71F86D53;
	Mon, 27 Nov 2023 06:05:27 -0800 (PST)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-da7ea62e76cso4099961276.3;
        Mon, 27 Nov 2023 06:05:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701093926; x=1701698726;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6aTj1qOn2URWkEUmhUQIMd0foeBHpt1BN+DxS+Iel4g=;
        b=WjaF6+0g2TDIYFBd8Z4tP2qCqGZFFNjsGFLA5wQZBjb1GZXlFTYkIwp8UbiCk1/Uxw
         jgYvlNaWXXJEec1nm76SShzTq/Jype405bcBUicuKNKOtrvgwVEVW3QepQWGP2ZCvmVD
         4bqK+pgddP6bHu4BSZVTrjr7fpl48ERoTcMkhG2sQTEbbPIIv8rGOQ5hurkDZj2rk3Cc
         1hbbJKxXXwnbVMN2LJLGT9cMwEIVl0JXki81HN3qKuAPS4YFuC4gheToKKv8VEx7F7v4
         v406mKlTsvXs8U9IDa0BdZyHYS4Z24N/+4rt2gHoXfcLFuLplEahdHeuJwLyulf5qBu0
         QmAA==
X-Gm-Message-State: AOJu0Yy/QyzLDB1GKo/XGn5JV18PqfISZDRfNnbNEGpHmMR3W2pFA3FS
	ZgrZrJHbT5avd2bT37aasWbz05d0DCs4sg==
X-Google-Smtp-Source: AGHT+IGgKi1Ar5OehazzazaT0YVsN+pl2Hak3plw8cleutWivO/CWf5oyGH8dT05jgR1u2whyMZhyA==
X-Received: by 2002:a25:69d2:0:b0:db4:47e1:4081 with SMTP id e201-20020a2569d2000000b00db447e14081mr10722099ybc.7.1701093926422;
        Mon, 27 Nov 2023 06:05:26 -0800 (PST)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id f188-20020a25cfc5000000b00da10d9e96cesm3072889ybg.35.2023.11.27.06.05.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Nov 2023 06:05:25 -0800 (PST)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5cc55b82ee5so39374177b3.2;
        Mon, 27 Nov 2023 06:05:25 -0800 (PST)
X-Received: by 2002:a81:ac5b:0:b0:5d0:b0e7:929e with SMTP id
 z27-20020a81ac5b000000b005d0b0e7929emr1798621ywj.42.1701093925277; Mon, 27
 Nov 2023 06:05:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231120084606.4083194-1-claudiu.beznea.uj@bp.renesas.com>
 <20231120084606.4083194-14-claudiu.beznea.uj@bp.renesas.com>
 <04cb07fe-cccc-774a-f14d-763ce7ae7b07@omp.ru> <b3456a4d-336c-434d-9fd5-4c87582443cb@tuxon.dev>
 <9af21eb9-6fe1-de3a-f2eb-4493778ebb32@omp.ru> <e35882ea-c325-4039-bb84-c18b0244dbe0@tuxon.dev>
In-Reply-To: <e35882ea-c325-4039-bb84-c18b0244dbe0@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 27 Nov 2023 15:05:13 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVCRXYKtcwaC=v-HhJW-PLV-zhj_3GmeU6Vu1JOK_eu0Q@mail.gmail.com>
Message-ID: <CAMuHMdVCRXYKtcwaC=v-HhJW-PLV-zhj_3GmeU6Vu1JOK_eu0Q@mail.gmail.com>
Subject: Re: [PATCH 13/13] net: ravb: Add runtime PM support
To: claudiu beznea <claudiu.beznea@tuxon.dev>
Cc: Sergey Shtylyov <s.shtylyov@omp.ru>, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, p.zabel@pengutronix.de, 
	yoshihiro.shimoda.uh@renesas.com, wsa+renesas@sang-engineering.com, 
	biju.das.jz@bp.renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	sergei.shtylyov@cogentembedded.com, mitsuhiro.kimura.kc@renesas.com, 
	masaru.nagai.vx@renesas.com, netdev@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Claudiu,

On Sat, Nov 25, 2023 at 12:00=E2=80=AFAM claudiu beznea
<claudiu.beznea@tuxon.dev> wrote:
> On 23.11.2023 21:19, Sergey Shtylyov wrote:
> > On 11/23/23 8:04 PM, claudiu beznea wrote:
> >>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >>>
> >>>> RZ/G3S supports enabling/disabling clocks for its modules (including
> >>>> Ethernet module). For this commit adds runtime PM support which
> >>>> relies on PM domain to enable/disable Ethernet clocks.
> >>>
> >>>    That's not exactly something new in RZ/G3S. The ravb driver has un=
conditional
> >>> RPM calls already in the probe() and remove() methods...
> >>> And the sh_eth driver
> >>> has RPM support since 2009...
> >>>
> >>>> At the end of probe ravb_pm_runtime_put() is called which will turn
> >>>
> >>>    I'd suggest a shorter name, like ravb_rpm_put() but (looking at th=
is function)
> >>>> off the Ethernet clocks (if no other request arrives at the driver).
> >>>> After that if the interface is brought up (though ravb_open()) then
> >>>> the clocks remain enabled until interface is brought down (operation
> >>>> done though ravb_close()).
> >>>>
> >>>> If any request arrives to the driver while the interface is down the
> >>>> clocks are enabled to serve the request and then disabled.
> >>>>
> >>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

> >>>> --- a/drivers/net/ethernet/renesas/ravb.h
> >>>> +++ b/drivers/net/ethernet/renesas/ravb.h
> >>>> @@ -1044,6 +1044,7 @@ struct ravb_hw_info {
> >>>>    unsigned magic_pkt:1;           /* E-MAC supports magic packet de=
tection */
> >>>>    unsigned half_duplex:1;         /* E-MAC supports half duplex mod=
e */
> >>>>    unsigned refclk_in_pd:1;        /* Reference clock is part of a p=
ower domain. */
> >>>> +  unsigned rpm:1;                 /* Runtime PM available. */
> >>>
> >>>    No, I don't think this flag makes any sense. We should support RPM
> >>> unconditionally...
> >
> >    If RPM calls work in the probe()/remove() methods, they should work
> > in the ndo_{open|stop}() methods, right?
>
> It might depend on hardware support... E.g.
>
> I debugged it further the issue I had with this implementation on other
> SoCs and it seems we cannot do RPM for those w/o reworking way the driver
> is configured.
>
> I wiped out the RPM code from this patch and just called:
>
> pm_runtime_put_sync();          // [1]
> usleep_range(300000, 400000);   // [2]
> pm_runtime_get_sync();          // [3]
>
> at the end of ravb_probe(); with this the interfaces fails to work. I
> continue debugging it and interrogated CSR and this returns RESET after
> [3]. I tried to switched it back to configuration mode after [3] but fail=
s
> to restore to a proper working state.
>
> Then continued to debug it further to see what happens on the clock drive=
r.
> The clk enable/disable reaches function at [4] which sets control_regs[re=
g]
> which is one of the System module stop control registers. Setting this
> activates module standby (AFICT). Switch to reset state on Ethernet IP
> might be backed by note (2) on "Operating Mode Transitions Due to Hardwar=
e"
> chapter of the G1H HW manual (which I don't fully understand).

You mean 37A.3.1.3 (2) "Transition during power-off by module standby"?

    The AVB-DMAC completes the bus master access in progress,
    and then shifts to reset mode. At this time, the operating mode
    configuration bits in the AVB-DMAC mode register (CCC.OPC) are
    set to B'00.

"reset mode" could be interpreted as "register contents are reset (lost)".
However, the R-Car Gen3 documentation contains the same paragraph,
and register contents are known not to be lost...

37.7.2 for Ether ("sh-eth") states:

    After returning from the standby state, the ether should be reset
and initialized.

Sergey: does sh_eth.c really reinitialize the hardware completely after
pm_runtime_get_sync()?

> Also, the manual of G1H states from some IPs that register state is
> preserved in standby mode but not for AVB.

Indeed, AFAIK all modules on SH/R-Mobile, R-Car, and RZ/G SoCs keep
their register contents when in standby-mode (module standby enabled).
On modules in a (not always-on) power area (e.g. SH/R-Mobile), register
contents are lost when the power area is powered down.
So I'd be surprised if EtherAVB behaves differently.  Of course that
is still possible, there are big difference between EtherAVB in R-Car
Gen2 and RZ/G1, and the revision found in later SoC families.

> >> The reasons I've limited only to RZ/G3S are:
> >> 1/ I don't have all the platforms to test it
> >
> >    That's a usual problem with the kernel development...
> >
> >> 2/ on G1H this doesn't work. I tried to debugged it but I don't have a
> >>    platform at hand, only remotely, and is hardly to debug once the
> >>    ethernet fails to work: probe is working(), open is executed, PHY i=
s
> >>    initialized and then TX/RX is not working... don't know why ATM.
> >
> >    That's why we have the long bug fixing period after -rc1...
>
> I prefer to not introduce any bug by intention.

Iff register contents are lost on RZ/G1H, I'd rather add
an extra clk_prepare_enable(priv->clk) to ravb_probe() on
"renesas,etheravb-rcar-gen2"....

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

