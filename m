Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E56572B7B37
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Nov 2020 11:25:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726289AbgKRKYp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 Nov 2020 05:24:45 -0500
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:59967 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726141AbgKRKYo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Nov 2020 05:24:44 -0500
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.94)
          with esmtps (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1kfKdk-001roL-8r; Wed, 18 Nov 2020 11:24:40 +0100
Received: from suse-laptop.physik.fu-berlin.de ([160.45.32.140])
          by inpost2.zedat.fu-berlin.de (Exim 4.94)
          with esmtpsa (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1kfKdk-000UEk-2l; Wed, 18 Nov 2020 11:24:40 +0100
Subject: Re: [PATCH 2/7] ARM: shmobile: r8a7779: Use ioremap() to map INTC2
 registers
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Arnd Bergmann <arnd@kernel.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Arnd Bergmann <arnd@arndb.de>
References: <20201117103022.2136527-1-geert+renesas@glider.be>
 <20201117103022.2136527-3-geert+renesas@glider.be>
 <CAK8P3a1CAmC3=QFA1EryDsx0aR-OF+=mf=Xj9cPrObe+qRoJKQ@mail.gmail.com>
 <CAMuHMdWTuzxg-a0f5MfPN=66EXcEqLfHCQMhiSAWH04p1BQ2ng@mail.gmail.com>
 <CAK8P3a363pGBYAyGgV1r+evpNk9Cpcu-vE++s7Ma4YB25AW+yg@mail.gmail.com>
 <CAMuHMdVFRXMcOgv5Qa6QgEAKsU31sKDBsTPs6ONdSqLAQZShow@mail.gmail.com>
 <CAK8P3a3QZJjV99Oo=GytUc3q3RkSrtccTC12Vgd=E=UByFX7ZA@mail.gmail.com>
 <CAMuHMdW6aw2M=SiV_pr6oQWaQRDcb9O2P8GRg_WRTjcpL5i4mA@mail.gmail.com>
 <CAK8P3a3bgbm29z8L66kYo25yKP2EKKLhVZSjS-mcYTO4J2m70A@mail.gmail.com>
 <CAMuHMdVeRXbhzGit7y2OHJxbJpO5zOurF=We31KLnu+iMJOBng@mail.gmail.com>
 <CAK8P3a0LJMuCzhd0dM5PuzvUeXPmJvbQ2WUdivbPoHZBHmDtLw@mail.gmail.com>
 <CAMuHMdWzoa3pOVqp40euW5ZecW-fGjbRtDfh6n=DugeeLmz1Ww@mail.gmail.com>
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Message-ID: <f7a667e8-e179-d08f-3c0e-30501bc01696@physik.fu-berlin.de>
Date:   Wed, 18 Nov 2020 11:24:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWzoa3pOVqp40euW5ZecW-fGjbRtDfh6n=DugeeLmz1Ww@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 160.45.32.140
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert!

On 11/18/20 9:40 AM, Geert Uytterhoeven wrote:
> CC Adrian
> 
> On Wed, Nov 18, 2020 at 9:27 AM Arnd Bergmann <arnd@kernel.org> wrote:
>> On Tue, Nov 17, 2020 at 5:49 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>>> On Tue, Nov 17, 2020 at 5:37 PM Arnd Bergmann <arnd@kernel.org> wrote:
>>>> On Tue, Nov 17, 2020 at 4:52 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>>>>> Doh, and even Debian ports doesn't support armeb anymore, else it
>>>>> would just be a debootstrap away...
>>>>
>>>> Debian actually dropped all big-endian platforms other than s390
>>>> now, the last other one was mips32 (mips32el is still there for the
>>>> moment).
>>>
>>> I did mean "Debian Ports", which still supports a few more. But no
>>> armeb.
>>
>> Ok, got it. I guess the old armeb ports was never in Debian, and predated
>> the debian-ports system.
>>
>> Debian ports indeed still contain packages for big-endian m68k (obviously)
>> as well as hppa, powerpc, ppc64 (in addition to the official ppc64le) and
>> sparc64). I'm surprised nobody so far tried restarting the openrisc port,
>> which got dropped when it appeared the corresponding gcc port would not
>> be upstreamed.
> 
> I guess that is partly due to the limited availability of OpenRISC
> hardware?  I had it running on a DE0-NANO, but 32 MiB RAM and
> no Ethernet doesn't bring you far...

The Debian wiki has some information on armeb and OpenRISC:

> https://wiki.debian.org/ArmPorts
> https://wiki.debian.org/OpenRISC

Apparently, interest for armeb was lost after people realized the hardware
being used could run little-endian as well and OpenRISC apparently had
licensing issues.

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

