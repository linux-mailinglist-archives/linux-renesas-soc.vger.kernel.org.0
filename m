Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 546D42B7BED
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Nov 2020 11:59:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726424AbgKRK5n (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 Nov 2020 05:57:43 -0500
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:37389 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725781AbgKRK5m (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Nov 2020 05:57:42 -0500
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.94)
          with esmtps (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1kfL9g-0027OO-8t; Wed, 18 Nov 2020 11:57:40 +0100
Received: from suse-laptop.physik.fu-berlin.de ([160.45.32.140])
          by inpost2.zedat.fu-berlin.de (Exim 4.94)
          with esmtpsa (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1kfL9g-000Zvj-3e; Wed, 18 Nov 2020 11:57:40 +0100
Subject: Re: [PATCH 2/7] ARM: shmobile: r8a7779: Use ioremap() to map INTC2
 registers
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
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
 <f7a667e8-e179-d08f-3c0e-30501bc01696@physik.fu-berlin.de>
 <CAK8P3a0ErYtJ3dPVbzdPJAwvKUA1EZrDVFR8SKqiuBSB1Oa2=Q@mail.gmail.com>
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Message-ID: <07daa7bc-405c-f808-cd9d-6bf7159876c2@physik.fu-berlin.de>
Date:   Wed, 18 Nov 2020 11:57:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a0ErYtJ3dPVbzdPJAwvKUA1EZrDVFR8SKqiuBSB1Oa2=Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 160.45.32.140
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 11/18/20 11:48 AM, Arnd Bergmann wrote:
>>> https://wiki.debian.org/ArmPorts
>>> https://wiki.debian.org/OpenRISC
>>
>> Apparently, interest for armeb was lost after people realized the hardware
>> being used could run little-endian as well and OpenRISC apparently had
>> licensing issues.
> 
> Right, my point above was that the licensing issues were resolved last
> year when the gcc port finally landed in gcc-9.

Ah, right. dpkg still has support for or1k [1], so generally it should be possible
then to use the tool rebootstrap [2] to cross-build a Debian base system for OpenRISC
from source.

We could add it to Debian Ports if there is sufficient interest and usable hardware
available.

Adrian

> [1] https://git.dpkg.org/cgit/dpkg/dpkg.git/tree/data/cputable?id=ee0855cc66076691de4796be48f8a0d889fde001
> [2] https://wiki.debian.org/HelmutGrohne/rebootstrap

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

