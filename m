Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8F8421D05F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2020 09:25:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728919AbgGMHY7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Jul 2020 03:24:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728737AbgGMHY6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Jul 2020 03:24:58 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CC83C061794
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2020 00:24:58 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id g2so8024644lfb.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2020 00:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=xmM2kDOe0iFtimPybuji5UfQhg9nYYX3y+aDCgMO1LE=;
        b=yxyxR8PuZtmrqaQ4MyIWsy61a1pyGyxhKrh1ofsgRZu8nfrxPi9GbMqgnR2g707V1B
         G5W64kcYDnu0fM/ESBZRw1NKJDSO0MMdH52jDpLKMR/A0lDRDCmLWf2HtMQEcnqhym7V
         ktSyAiHpdYtuSFOqC6QYs6iU4QatwGlR8EZY9uiz38x/3oNFqPDB3p4Dh8dUJujksVM9
         nPwAS7S9YRpoE6AkjIwkUYY/K6upOtoYkOSznGS3Szz/SfD/VQf21ZBucOtSzhdom8qA
         6/Sqgc6+Oxv7mXqDIxjzbn0073ZqQ2KqMcQgRG+jnO8vROR8r/s1+MWD7IiJVTMKAILo
         ftoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=xmM2kDOe0iFtimPybuji5UfQhg9nYYX3y+aDCgMO1LE=;
        b=MBe42Xt9UnIOiubUR1KvDTgbIBx65frpB3fS0a0lLH6O2mM3bjAFoREduLtZbAktNI
         wG2qcfhpC10AprdgRx4QGhflvX4Idv6Dk3Jxm8SZU5GbQGiR8GedlzuDkmaFdOrjGjcG
         ksLrpZVZ6mpO3B8OSCA/gMF/7LopbOYJyGy2pdHNft+MaEg8yCPUamPoA+GF7zKFOt34
         IEpfLiU0VIpt5xNKvmLEO5lYoA7rod5ZYfeNy4nrzgl27+/hlPr5h7fqIWFO/hFU7Txw
         rRABi2nyy+/ev3tUjcpLkh475OuY/8moBkKv9thtvJlEwQelT9Q0iKVDSPAOFIGYp/Au
         nKXA==
X-Gm-Message-State: AOAM530djBAS4QDPwVLxUGc5+X1DIOMeUKQC6Kzrs605ipVBDWlilnN9
        4U9iHetNXx/lY8PPfkmDDrkQt/h/rbg=
X-Google-Smtp-Source: ABdhPJwclsZiyvekJAE+OduMLQ5kD/KlbJqpdFVQcptCOEWHf/pZQ2dJjr+qd3cm6CIgrMCj4POwzQ==
X-Received: by 2002:ac2:518c:: with SMTP id u12mr51596309lfi.91.1594625096837;
        Mon, 13 Jul 2020 00:24:56 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id l19sm3903983ljb.15.2020.07.13.00.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 00:24:55 -0700 (PDT)
Date:   Mon, 13 Jul 2020 09:24:55 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 1/2] ARM: dts: gose: Fix ports node name for adv7180
Message-ID: <20200713072455.GJ1498036@oden.dyn.berto.se>
References: <20200704155856.3037010-1-niklas.soderlund+renesas@ragnatech.se>
 <20200704155856.3037010-2-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdUR6ouBg3LTqE80vUS1UMriXnOiVBoUpoL8SHyCAiFrWQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdUR6ouBg3LTqE80vUS1UMriXnOiVBoUpoL8SHyCAiFrWQ@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On 2020-07-07 11:59:12 +0200, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> On Sat, Jul 4, 2020 at 5:59 PM Niklas Söderlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> > When adding the adv7180 device node the ports node was misspelled as
> > port, fix this.
> >
> > Fixes: 8cae359049a88b75 ("ARM: dts: gose: add composite video input")
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Thanks for your patch!
> 
> > --- a/arch/arm/boot/dts/r8a7793-gose.dts
> > +++ b/arch/arm/boot/dts/r8a7793-gose.dts
> > @@ -336,7 +336,7 @@ composite-in@20 {
> >                         reg = <0x20>;
> >                         remote = <&vin1>;
> >
> > -                       port {
> > +                       ports {
> >                                 #address-cells = <1>;
> >                                 #size-cells = <0>;
> >
> 
> Does this have any run-time impact, or dependencies?

No run-time impact.

> Don't we need the same fix for the other boards?

The only other board we have that uses the same compatible string 
(adi,adv7180cp) is Draak and there the ports node is already correctly 
named.

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
