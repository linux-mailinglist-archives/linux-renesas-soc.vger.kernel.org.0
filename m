Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2112C2B7896
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Nov 2020 09:29:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727136AbgKRI1O (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 Nov 2020 03:27:14 -0500
Received: from mail.kernel.org ([198.145.29.99]:47514 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727089AbgKRI1N (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Nov 2020 03:27:13 -0500
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9559D24654
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Nov 2020 08:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605688032;
        bh=P2bTIp7zZ+/lU+AzRd/NSdq6nfyfRrzQ7JIPYvdxeJU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=cmOTdM8cudDFKPHO/awgAOOD4GV6n6GDzAo12hwxumS/WiXfiYtPgGogbDNQN6/nh
         OGsLF1kaJUEcXa7bhTEf3l1cQ/aUEz6v/NRoPWp1vrQrl/y3fyvIp0ITdrtn/4sN+E
         iRimOCR8apLTldkUb9jM6wQps7Lic9/hSX+Oe+kM=
Received: by mail-ot1-f52.google.com with SMTP id l36so973718ota.4
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Nov 2020 00:27:12 -0800 (PST)
X-Gm-Message-State: AOAM532a729D6lreyhqnkjuxKjICncH6Iq6SygGkoyKpWnMOEMEoQPBj
        2ibZ4eMMCbAN+1x/5b/dt0qFnQHnCF4Roj2GXHQ=
X-Google-Smtp-Source: ABdhPJy4rEnTqsFPUhweHihkOTDmFDzgEolsCVXMpAPlOoVEyErfJiHzhIiEGcimerJb/DDyWqRYzlhnpBm1jm22en4=
X-Received: by 2002:a05:6830:22d2:: with SMTP id q18mr5296603otc.305.1605688031811;
 Wed, 18 Nov 2020 00:27:11 -0800 (PST)
MIME-Version: 1.0
References: <20201117103022.2136527-1-geert+renesas@glider.be>
 <20201117103022.2136527-3-geert+renesas@glider.be> <CAK8P3a1CAmC3=QFA1EryDsx0aR-OF+=mf=Xj9cPrObe+qRoJKQ@mail.gmail.com>
 <CAMuHMdWTuzxg-a0f5MfPN=66EXcEqLfHCQMhiSAWH04p1BQ2ng@mail.gmail.com>
 <CAK8P3a363pGBYAyGgV1r+evpNk9Cpcu-vE++s7Ma4YB25AW+yg@mail.gmail.com>
 <CAMuHMdVFRXMcOgv5Qa6QgEAKsU31sKDBsTPs6ONdSqLAQZShow@mail.gmail.com>
 <CAK8P3a3QZJjV99Oo=GytUc3q3RkSrtccTC12Vgd=E=UByFX7ZA@mail.gmail.com>
 <CAMuHMdW6aw2M=SiV_pr6oQWaQRDcb9O2P8GRg_WRTjcpL5i4mA@mail.gmail.com>
 <CAK8P3a3bgbm29z8L66kYo25yKP2EKKLhVZSjS-mcYTO4J2m70A@mail.gmail.com> <CAMuHMdVeRXbhzGit7y2OHJxbJpO5zOurF=We31KLnu+iMJOBng@mail.gmail.com>
In-Reply-To: <CAMuHMdVeRXbhzGit7y2OHJxbJpO5zOurF=We31KLnu+iMJOBng@mail.gmail.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Wed, 18 Nov 2020 09:26:55 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0LJMuCzhd0dM5PuzvUeXPmJvbQ2WUdivbPoHZBHmDtLw@mail.gmail.com>
Message-ID: <CAK8P3a0LJMuCzhd0dM5PuzvUeXPmJvbQ2WUdivbPoHZBHmDtLw@mail.gmail.com>
Subject: Re: [PATCH 2/7] ARM: shmobile: r8a7779: Use ioremap() to map INTC2 registers
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Nov 17, 2020 at 5:49 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Tue, Nov 17, 2020 at 5:37 PM Arnd Bergmann <arnd@kernel.org> wrote:
> > On Tue, Nov 17, 2020 at 4:52 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > Doh, and even Debian ports doesn't support armeb anymore, else it
> > > would just be a debootstrap away...
> >
> > Debian actually dropped all big-endian platforms other than s390
> > now, the last other one was mips32 (mips32el is still there for the
> > moment).
>
> I did mean "Debian Ports", which still supports a few more. But no
> armeb.

Ok, got it. I guess the old armeb ports was never in Debian, and predated
the debian-ports system.

Debian ports indeed still contain packages for big-endian m68k (obviously)
as well as hppa, powerpc, ppc64 (in addition to the official ppc64le) and
sparc64). I'm surprised nobody so far tried restarting the openrisc port,
which got dropped when it appeared the corresponding gcc port would not
be upstreamed.

        Arnd
