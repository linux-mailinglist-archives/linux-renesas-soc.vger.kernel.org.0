Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8A211E3934
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2020 08:28:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728638AbgE0G2P (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 27 May 2020 02:28:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728614AbgE0G2O (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 May 2020 02:28:14 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F52BC03E96F
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 May 2020 23:28:12 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id z18so27442037lji.12
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 May 2020 23:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=fuGN860/GT6rsIgye6vRLXh5U9Ac6GXjLL4lq5g3Y6Q=;
        b=eV+QIeREnm8d0KAolwLemA8K7XqJQaOFoLCumF8tLNjpdNQNPKLvXdWY0PDhgIMJES
         H66/+8LS3/SPi8fhH55gEtnO24d4TVD4NfCkuNbVMaFpEvmfF+8UUX+uftnUk+Zrn4Vy
         fP7WRjClwXdPrDqC9/nZqqp4S4t2KIZNhIkEvcnerGDpA3/9XEh3ol31TKcxtjsnYL70
         tJvOt8+ZEl2Mhnwbb3Q8VTIbhVNX5ELRKXsscWo0yPbtPMOqtAp4sFlGSNmWmrKz4hYI
         4ks3UgIohz0OUzJRUYvla6rLXWuAhv2EkElBCn+wvwNAuvvO8kApecc7lkXr2w1vd/dT
         bmVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=fuGN860/GT6rsIgye6vRLXh5U9Ac6GXjLL4lq5g3Y6Q=;
        b=ck2zLMlMMkA5jSaoQreV+1H69wjTopwYHFy3nO2QM378KDyoKQWRMMfRxTYglxy9gC
         IBMoxwh+fjpfSrlnh+cB6X053hsybfgOIjRIFyzlHkrJLkpdron7MSso96mjVRVvg0GV
         iQAmn3RXOgbKHZYkn1isKuqOfxzNXS8lWl8H6eQlgBzIUK7SXfOeV/NG1qdOUKhneJg/
         zjASV8phT4HJSUNUcCNqDna2wqamujuYCTNJ3OesvGF0nOv+8OHrMd73Zbmtb99UDB/u
         9bG1Ol8uL7pqlbTZfEnc+zeu6aMtWPGD6mMr3bsr470yonz/kvxYyRhwo3QV5oY3QQex
         2nUA==
X-Gm-Message-State: AOAM532LrEu7/usCgCBKQ2LotdJ00kjLr7oLNpZVhtf+mJWyYIKggLnc
        V7KG+9KCUqRfMZRfAhkZey/pPUnLB4JFRNups6h77A==
X-Google-Smtp-Source: ABdhPJxBnQAFFfiCQ7xTDrmAudUz9xD/143iCAMfDqv6XVvlI/S6PhyLlZyY+pB/FYkysU6Stw3Z5BZReurHErMC/9w=
X-Received: by 2002:a05:651c:20d:: with SMTP id y13mr2362045ljn.29.1590560890952;
 Tue, 26 May 2020 23:28:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200522220103.908307-1-anders.roxell@linaro.org>
 <20200524222025.GA3116034@ubuntu-s3-xlarge-x86> <292277.1590449865@turing-police>
 <20200526053850.GA2368760@ubuntu-s3-xlarge-x86> <CAL_JsqJ9LnCpH92bXfk4ryXrTgzbPM03=PYLTzQXazuznJM=hg@mail.gmail.com>
In-Reply-To: <CAL_JsqJ9LnCpH92bXfk4ryXrTgzbPM03=PYLTzQXazuznJM=hg@mail.gmail.com>
From:   Anders Roxell <anders.roxell@linaro.org>
Date:   Wed, 27 May 2020 08:28:00 +0200
Message-ID: <CADYN=9JdZfduPYeM7KV8H18_mbVrKj1aYRSkeWrTprQnffCXNg@mail.gmail.com>
Subject: Re: [PATCH] power: reset: vexpress: fix build issue
To:     Rob Herring <robh@kernel.org>
Cc:     Nathan Chancellor <natechancellor@gmail.com>,
        =?UTF-8?Q?Valdis_Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 26 May 2020 at 17:41, Rob Herring <robh@kernel.org> wrote:
>
> " On Mon, May 25, 2020 at 11:38 PM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> >
> > On Mon, May 25, 2020 at 07:37:45PM -0400, Valdis Kl=C4=93tnieks wrote:
> > > On Sun, 24 May 2020 15:20:25 -0700, Nathan Chancellor said:
> > >
> > > > arm-linux-gnueabi-ld: drivers/power/reset/vexpress-poweroff.o: in f=
unction `vexpress_reset_probe':
> > > > vexpress-poweroff.c:(.text+0x36c): undefined reference to `devm_reg=
map_init_vexpress_config'
> > >
> > > The part I can't figure out is that git blame tells me there's alread=
y an
> > > export:
> > >
> > > 3b9334ac835bb (Pawel Moll      2014-04-30 16:46:29 +0100 154)   retur=
n regmap;
> > > 3b9334ac835bb (Pawel Moll      2014-04-30 16:46:29 +0100 155) }
> > > b33cdd283bd91 (Arnd Bergmann   2014-05-26 17:25:22 +0200 156) EXPORT_=
SYMBOL_GPL(devm_regmap_init_vexpress_config);
> > > 3b9334ac835bb (Pawel Moll      2014-04-30 16:46:29 +0100 157)
> > >
> > > but I can't figure out where or if drivers/power/reset/vexpress-power=
off.c gets
> > > a MODULE_LICENSE from...
> >
> > Correct, it is exported but that file is being built as a module wherea=
s
> > the file requiring it is beign builtin. As far as I understand, that
> > will not work, hence the error.
> >
> > The issue with this patch is that ARCH_VEXPRESS still just selects
> > POWER_RESET_VEXPRESS, which ignores "depends on", hence the Kconfig
> > warning and not fixing the error.
> >
> > I am not that much of a Kconfig guru to come up with a solution. I am
> > just reporting it because arm allmodconfig is broken on -next due to
> > this.
>
> Commit "ARM: vexpress: Don't select VEXPRESS_CONFIG" needs to be
> reverted. I've asked Arnd to revert it.

Reverting that patch with my patch will make allmodconfig work for arm too.

>
> Anders patch is still needed for arm64.

Yes, it is still needed for arm64.

Cheers,
Anders
