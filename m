Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A5CB2B7DF4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Nov 2020 13:58:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726107AbgKRM6C (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 Nov 2020 07:58:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:59654 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725747AbgKRM6B (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Nov 2020 07:58:01 -0500
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7AA6724199
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Nov 2020 12:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605704280;
        bh=U/JZw2OCNXxFlR2RJ0Jb1tR92K1dh1XhscjTmUJXg10=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=n1MTzFnDXrKhw2jSAwfCLro30UfyPSMXxxsO7BK3lL8S3Euy+SgcJK98GW6+80NdO
         su6XQbMmJ+YNQWfZpSjFkDX+40U7yN+jr30FKYTDeYEnX8q72h8TsoTOQTlBzBojyt
         PuvrHCfS762zYlmb5tBmEwNT7ns5fjtctGwb/G98=
Received: by mail-ot1-f48.google.com with SMTP id g19so1584149otp.13
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Nov 2020 04:58:00 -0800 (PST)
X-Gm-Message-State: AOAM533/atfvUkdX4JNC61XJDcmcTAtsyADAzIp+tY14fRW6LkUOOem1
        diT1FJqbZZ1lcDWCS4JOlvCp/ld65mtunLbbR1Y=
X-Google-Smtp-Source: ABdhPJxiupv1KXeIl55555tiRZhe8Iq5l21BSEfGmI+oxbbLbUyq/13A0XpX1DgXX1PeNUixfr6GzbMG7A/H5efl85c=
X-Received: by 2002:a9d:65d5:: with SMTP id z21mr5912329oth.251.1605704279716;
 Wed, 18 Nov 2020 04:57:59 -0800 (PST)
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
 <CAMuHMdWzoa3pOVqp40euW5ZecW-fGjbRtDfh6n=DugeeLmz1Ww@mail.gmail.com>
 <f7a667e8-e179-d08f-3c0e-30501bc01696@physik.fu-berlin.de>
 <CAK8P3a0ErYtJ3dPVbzdPJAwvKUA1EZrDVFR8SKqiuBSB1Oa2=Q@mail.gmail.com> <07daa7bc-405c-f808-cd9d-6bf7159876c2@physik.fu-berlin.de>
In-Reply-To: <07daa7bc-405c-f808-cd9d-6bf7159876c2@physik.fu-berlin.de>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Wed, 18 Nov 2020 13:57:43 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1JzFTOFbELRF2mjiOHpbYfeyYBwYR3OeHsJQWrLOAVUA@mail.gmail.com>
Message-ID: <CAK8P3a1JzFTOFbELRF2mjiOHpbYfeyYBwYR3OeHsJQWrLOAVUA@mail.gmail.com>
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

On Wed, Nov 18, 2020 at 11:57 AM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> On 11/18/20 11:48 AM, Arnd Bergmann wrote:
> >>> https://wiki.debian.org/ArmPorts
> >>> https://wiki.debian.org/OpenRISC
> >>
> >> Apparently, interest for armeb was lost after people realized the hardware
> >> being used could run little-endian as well and OpenRISC apparently had
> >> licensing issues.
> >
> > Right, my point above was that the licensing issues were resolved last
> > year when the gcc port finally landed in gcc-9.
>
> Ah, right. dpkg still has support for or1k [1], so generally it should be possible
> then to use the tool rebootstrap [2] to cross-build a Debian base system for OpenRISC
> from source.
>
> We could add it to Debian Ports if there is sufficient interest and usable hardware
> available.

I think hardware is mainly available in form of FPGAs, which means the hardware
capabilities are fairly limited. I only mentioned it because it was a
recent (from i.e.
this century) big-endian target that already had the beginnings of a
Debian port.

Otherwise it's probably similar to arc, microblaze, nios2, xtensa,
csky or nds32:
if someone really wanted a Debian port and is willing to do the work,
it could be
done, but in practice any of those would be better off a minimum
custom user space
(buildroot, yocto, ...) anyway.

In practice, new 32-bit ports may be limited to machines that can build packages
on 64-bit hardware with enough memory, as it is currently done on i386, mipsel,
armel, armhf, and the ports for hppa, powerpc, and x32. This means
arc, microblaze
and rv32 could still be supported once there is sufficient kernel
support for their
64-bit targets.

      Arnd
