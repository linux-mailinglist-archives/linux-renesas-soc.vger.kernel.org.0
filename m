Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABB8F2B7BCA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Nov 2020 11:49:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726677AbgKRKtE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 Nov 2020 05:49:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:54598 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726077AbgKRKtC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Nov 2020 05:49:02 -0500
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B99E320867
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Nov 2020 10:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605696541;
        bh=f1N8lz0N6jNDfqmm0FeWPqqpXTUcgEQZqyZ5si5oy5g=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=OS0E74AZT0csSotJeu+tQEy+RRzMHDRC8GlbHqsX7fEL5fZVU/X9319yVxi6GMF9r
         QPjgOV2nt38qESEhBO+2xzFsbjIlAejBz8bVHxAS3q7867+m39Gp0s9T7EG9tXTvRX
         PiABZ+SwkrIoZTPsw2WCE5KG2opek03gdxp4AUM0=
Received: by mail-oi1-f170.google.com with SMTP id w145so1686390oie.9
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Nov 2020 02:49:01 -0800 (PST)
X-Gm-Message-State: AOAM5337a0F6i68qqjXXd1HwJqwAONuFwfn3Ig5f9pYDnlKkcXkQ8eAf
        pJOF88/L50CYVJN+/PBXxPX1bzAdYlchMBBMKyo=
X-Google-Smtp-Source: ABdhPJw+9UiWO/DJIVtgjMn6256YiMG7n9PtnBUOcvoI+iOws4SmwO8FYXXQOs4a7rz9sYSQmbuGVFfgY7f7Kze3Zwg=
X-Received: by 2002:aca:180a:: with SMTP id h10mr2218420oih.4.1605696540998;
 Wed, 18 Nov 2020 02:49:00 -0800 (PST)
MIME-Version: 1.0
References: <20201117103022.2136527-1-geert+renesas@glider.be>
 <20201117103022.2136527-3-geert+renesas@glider.be> <CAK8P3a1CAmC3=QFA1EryDsx0aR-OF+=mf=Xj9cPrObe+qRoJKQ@mail.gmail.com>
 <CAMuHMdWTuzxg-a0f5MfPN=66EXcEqLfHCQMhiSAWH04p1BQ2ng@mail.gmail.com>
 <CAK8P3a363pGBYAyGgV1r+evpNk9Cpcu-vE++s7Ma4YB25AW+yg@mail.gmail.com>
 <CAMuHMdVFRXMcOgv5Qa6QgEAKsU31sKDBsTPs6ONdSqLAQZShow@mail.gmail.com>
 <CAK8P3a3QZJjV99Oo=GytUc3q3RkSrtccTC12Vgd=E=UByFX7ZA@mail.gmail.com>
 <CAMuHMdW6aw2M=SiV_pr6oQWaQRDcb9O2P8GRg_WRTjcpL5i4mA@mail.gmail.com>
 <CAK8P3a3bgbm29z8L66kYo25yKP2EKKLhVZSjS-mcYTO4J2m70A@mail.gmail.com>
 <CAMuHMdVeRXbhzGit7y2OHJxbJpO5zOurF=We31KLnu+iMJOBng@mail.gmail.com>
 <CAK8P3a0LJMuCzhd0dM5PuzvUeXPmJvbQ2WUdivbPoHZBHmDtLw@mail.gmail.com>
 <CAMuHMdWzoa3pOVqp40euW5ZecW-fGjbRtDfh6n=DugeeLmz1Ww@mail.gmail.com> <f7a667e8-e179-d08f-3c0e-30501bc01696@physik.fu-berlin.de>
In-Reply-To: <f7a667e8-e179-d08f-3c0e-30501bc01696@physik.fu-berlin.de>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Wed, 18 Nov 2020 11:48:45 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0ErYtJ3dPVbzdPJAwvKUA1EZrDVFR8SKqiuBSB1Oa2=Q@mail.gmail.com>
Message-ID: <CAK8P3a0ErYtJ3dPVbzdPJAwvKUA1EZrDVFR8SKqiuBSB1Oa2=Q@mail.gmail.com>
Subject: Re: [PATCH 2/7] ARM: shmobile: r8a7779: Use ioremap() to map INTC2 registers
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Nov 18, 2020 at 11:24 AM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> On 11/18/20 9:40 AM, Geert Uytterhoeven wrote:
> > On Wed, Nov 18, 2020 at 9:27 AM Arnd Bergmann <arnd@kernel.org> wrote:
> >>I'm surprised nobody so far tried restarting the openrisc port,
> >> which got dropped when it appeared the corresponding gcc port would not
> >> be upstreamed.
> >
> > I guess that is partly due to the limited availability of OpenRISC
> > hardware?  I had it running on a DE0-NANO, but 32 MiB RAM and
> > no Ethernet doesn't bring you far...
>
> The Debian wiki has some information on armeb and OpenRISC:
>
> > https://wiki.debian.org/ArmPorts
> > https://wiki.debian.org/OpenRISC
>
> Apparently, interest for armeb was lost after people realized the hardware
> being used could run little-endian as well and OpenRISC apparently had
> licensing issues.

Right, my point above was that the licensing issues were resolved last
year when the gcc port finally landed in gcc-9.

       Arnd
