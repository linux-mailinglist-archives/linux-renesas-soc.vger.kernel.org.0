Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E83F11D567A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2020 18:49:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726168AbgEOQtN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 15 May 2020 12:49:13 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:63501 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726212AbgEOQtN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 May 2020 12:49:13 -0400
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 04FGmrGW007857;
        Sat, 16 May 2020 01:48:53 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 04FGmrGW007857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1589561334;
        bh=09wMO0HOLiuZEWBlp//e1RGQGwcTnw5OK53PxoKYyww=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=XyLZEPgqzJa2xCj9I8I+vQAEMTwMscU9bUb7cjlqJ2yheq1UpUhraOZ7msmPMbsTK
         qzOXH6ZdBcNM8VV93TTaLEl1EJ+RHJY4YQDSRANfuwyINTKLn+rg/BFHvyxo2ihm7M
         0fJQjDi0RDer11HL/0YeSFHZvUV1ix4zaRKu55Uct6gBHnIxBxDA7ztsKmEQDA8fB+
         a4yibEfmtj3g5KPFKA7jiMFbJqMSaBf7y6a46QaqYxrgx7ydK8IfnMc9HB98wUIVYa
         ElGuo4QncXvmAS2DIOaW33/zkUj4yAJk3HN3r7Il3ba9szeUFmqFEaPbfqRprBfSl0
         GyVrmUUEyWvyA==
X-Nifty-SrcIP: [209.85.217.47]
Received: by mail-vs1-f47.google.com with SMTP id h9so1641605vsa.3;
        Fri, 15 May 2020 09:48:53 -0700 (PDT)
X-Gm-Message-State: AOAM5300eOIVBWhB/RUJcnI47uUUaMLnh7uuFgQyJG/KvjLBTqquP6Lj
        da9+i5tybuQ4hQCvxkZxmEDmLX/LJ4lisH6pcEs=
X-Google-Smtp-Source: ABdhPJx5We+J/+P9eW3tPKlUwrEoyPTG2qrfC1Qcle2l35CTjE/I/Zn44C4+6bRhiAacp7HhTakV4UrolHd0e7ZP44A=
X-Received: by 2002:a67:db0d:: with SMTP id z13mr3514563vsj.155.1589561332418;
 Fri, 15 May 2020 09:48:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200513173131.11200-1-wsa+renesas@sang-engineering.com> <CAPDyKFpaaVdpv22VO_OS7a2rw67xmD7qXcxUqD_g5CDdqiZiHA@mail.gmail.com>
In-Reply-To: <CAPDyKFpaaVdpv22VO_OS7a2rw67xmD7qXcxUqD_g5CDdqiZiHA@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 16 May 2020 01:48:16 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR0THa--b7GDtip1JehiOZCiLWs1VygJfNo1_nSHEj1RA@mail.gmail.com>
Message-ID: <CAK7LNAR0THa--b7GDtip1JehiOZCiLWs1VygJfNo1_nSHEj1RA@mail.gmail.com>
Subject: Re: [PATCH] mmc: renesas_sdhi: don't lose RPM savings because of
 manual clk handling
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, May 15, 2020 at 6:26 PM Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> + Niklas, Geert, Yamada-san,
>
>
> On Wed, 13 May 2020 at 19:31, Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> >
> > The SDHI driver en-/disabled clocks on its own during probe() and
> > remove(). This basically killed all potential RPM power savings. Now, we
> > just enable the clocks for a short time when we access registers in
> > probe(). We otherwise leave all handling to RPM. That means, we need to
> > shift the RPM enabling code in the TMIO core a bit up, so we can access
> > registers there, too.
>
> No, this doesn't sound entirely right to me.
>
> However, I do admit that we may need to move the pm_runtime
> initialization earlier (perhaps even out of tmio_mmc_core), but for
> slightly different reasons. Let me elaborate.
>
> For uniphier-sd, renesas_sdhi_sys_dmac and renesas_sdhi_internal_dmac
> - they all have assigned the ->clk_enable|disable() ops. Which means
> they have internal clock management (calling clk_prepare|enable()
> etc). For tmio_mmc, that's not the case.
>
> On top of this, the device may also have a potential PM domain
> attached. If that is the case, the PM domain may or may not have clock
> management implemented through genpd's ->start|stop() callbacks.
>
> So, in the end we are going to have to rely on clock enable/prepare
> reference counting, as we have to manage the clock(s) at both the
> driver and the PM domain level. Taking into account all various
> combinations (and that CONFIG_PM may not always be set). I have
> started to hack on some patches, but before I share them, let me ask a
> few questions.
>
> 1. tmio_mmc: - is that used solely with clock management through
> genpd? Or has no clock management at all?
> 2. uniphier-sd: Don't have runtime PM callbacks assigned. It looks
> like it doesn't care about runtime PM, but maybe it does through a PM
> domain? Can we skip to enable runtime PM for uniphier-sd, no?


Right, uniphier-sd does not care about runtime PM.
UniPhier SoCs do not have separate power domains.



-- 
Best Regards
Masahiro Yamada
