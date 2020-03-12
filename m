Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D34118301E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2020 13:23:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726591AbgCLMXM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Mar 2020 08:23:12 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:43826 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726254AbgCLMXM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Mar 2020 08:23:12 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200312122310euoutp024618b02511a3d52a4b7bd32afd2ee78e~7jfgmOItr1032110321euoutp02N
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Mar 2020 12:23:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200312122310euoutp024618b02511a3d52a4b7bd32afd2ee78e~7jfgmOItr1032110321euoutp02N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1584015790;
        bh=KzxZBLdgOdzsUcEhVdsz8kOz2UhbX/Mn/GC75XiJdQo=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=glCnOijCbw/nuM6NsdMmMVIECm1MiCzZUj2sSPIEi5DKYnfaFek4Jj6IfPgllMHzg
         g8GOID0f8wZKig1jvMfBGexf3ugTdTzqDc9LtWOZ3iLzy1GoQNKAj4E8gBEswIEAIi
         ZqiTvYCJF2VOh1PFfUiTf8OraQvMlM6dWLcol+vU=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200312122310eucas1p248d7df962a275fd68002c1b663bd5414~7jfgZ9dYs2610326103eucas1p2c;
        Thu, 12 Mar 2020 12:23:10 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 83.31.60679.EA92A6E5; Thu, 12
        Mar 2020 12:23:10 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200312122310eucas1p1165dfbb441a2f266968e1e00e2844d04~7jff9o2Sa0606306063eucas1p1g;
        Thu, 12 Mar 2020 12:23:10 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200312122310eusmtrp15834f53c8b385a8c2fde9062d825ae9b~7jff87kn_2583225832eusmtrp1k;
        Thu, 12 Mar 2020 12:23:10 +0000 (GMT)
X-AuditID: cbfec7f4-0cbff7000001ed07-15-5e6a29aeb3b9
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 6D.45.08375.EA92A6E5; Thu, 12
        Mar 2020 12:23:10 +0000 (GMT)
Received: from [106.120.51.15] (unknown [106.120.51.15]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200312122309eusmtip1bf6446eaa137bee6ae0461c1c87828a4~7jffe4j6A2241122411eusmtip1t;
        Thu, 12 Mar 2020 12:23:09 +0000 (GMT)
Subject: Re: [PATCH] ARM: boot: Fix ATAGs with appended DTB
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Nicolas Pitre <nico@fluxnic.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Eric Miao <eric.miao@nvidia.com>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Chris Brandt <chris.brandt@renesas.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <f30208dc-e74a-cae7-95e6-d99220d9735c@samsung.com>
Date:   Thu, 12 Mar 2020 13:23:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdV9VyS3kBnhFT-5ry_O-aRafq-8Yor0xxxnjGqNQiSgZw@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0hTcRTut3t3d11OrvN1sigapBjlo/rjliYGJbcosIgMY+qqy9R01m5a
        RpK9RbSmFurUlB6YplazNKZCTnSWNrWFlkkpmWg08VXks9xulv993znfOd/54JCYtFvoTkar
        TrNqlSJWRojx6uap9o2VXjHhvsYZT3ouq1lEF+Vk4HRZTT1GF+ZnIXqwp15A6750CWmzvoCg
        nw+PCGjD7XpE3xkaIuiPmdkoaDlj7urEmJnpLMQMtlwnmMw3GxlDYypiqu5fYDIujxDMzTlf
        5mdbJs5M6FaHiMPEAcfZ2OhEVu0TGCmOSjf3CE/m2J8d6J0RpaBxuzRkRwK1BT63j6M0JCal
        1EMELV8nRTyZRPCjtBzjyQQCfY1FtDhSPVWM840SBE36XCFPLAj6HnfgVpUT5Q/G/lqBFTtT
        Svh18bZtL0Y9wmDwZqHQ2iAoP0izpBFWLKECQdP9zjaMU+sg29hl07hQcsgvbcR5jSO8yhuw
        YTtqP+j6hm0Yo9ZAjaUA47Eb9AwUCaxmQI2JIP31LYK/eyfMax4IeewE34zP/uZZBa3Z6Tg/
        cBlBv6lCxJN0BOZLuYhX+UOvaXphE7lg4QWP9T58eQdUf69B1jJQDvDe4sgf4QBZ1TkYX5ZA
        6jUpr/YArbHyn21Dx1tMg2TaJdG0S+Jol8TR/vctRngZcmMTuDgly21SsWe8OUUcl6BSeh+L
        j9OhhXdrnTdOvkD62aMGRJFIZi/xdY0JlwoViVxSnAEBicmcJRFrlOFSyXFF0jlWHR+hTohl
        OQNaSeIyN8nmu8NyKaVUnGZPsOxJVr3YFZB27ikomKgbPjLb9nsX2TCZ4vZbberlXJ8+7Qyt
        UB4y4h9CkPyK9CopD11WkFzqqz3l0hhkmkmoGuxPjRkrWrnr/O4VX5yaWrU+mvJgzwN5ReNr
        Kz69vHeC1NbdGH2iOrx3T21YS3OyZt9We7NHbvb8wf5t2zfY7w4oMOnHnSKp0WjHkjAZzkUp
        /NZjak7xBwUhp8RqAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrJIsWRmVeSWpSXmKPExsVy+t/xu7rrNLPiDP60clr8nXSM3WL+9F4W
        i1Xb9zJbzJ09idHi2a29TBabHl9jtbi8aw6bxdaX75gsDk3dy2gx78ULNovbEyczOnB7XL52
        kdnj969JjB7PTrSzeUw8q+tx6HAHo8fmJfUevc3v2Dz6/xp4fDszkcXj8ya5AK4oPZui/NKS
        VIWM/OISW6VoQwsjPUNLCz0jE0s9Q2PzWCsjUyV9O5uU1JzMstQifbsEvYyey7dYC6bzVDy5
        85u9gfETZxcjJ4eEgInEtp8LWLoYuTiEBJYySiz9/I8VIiEjcXJaA5QtLPHnWhcbRNFrRon9
        z1+zgySEBawljj/czQRiiwikS7w++YUZpIhZYC2zxISpMxghOrYyS/xYep4FpIpNwFCi6y3I
        KE4OXgE7iQnXr4DFWQRUJSYfvwa2TlQgVuLGzA4miBpBiZMzn4DVcAoESmx68BLMZhYwk5i3
        +SEzhC0vsf3tHChbXOLWk/lMExiFZiFpn4WkZRaSlllIWhYwsqxiFEktLc5Nzy021CtOzC0u
        zUvXS87P3cQIjOZtx35u3sF4aWPwIUYBDkYlHl4Dsaw4IdbEsuLK3EOMEhzMSiK88fLpcUK8
        KYmVValF+fFFpTmpxYcYTYGem8gsJZqcD0w0eSXxhqaG5haWhubG5sZmFkrivB0CB2OEBNIT
        S1KzU1MLUotg+pg4OKUaGBkLngpHnrNfep+b6Xrt5F39i05nTfVfWKO3+7fMlunvuPveWUt1
        +8px31c3Mzc4sFprNaPBJo5Th1gUeH8+vHMoYmuUZ1XmgVLJ9u+foozMH3fJaqRVNcSarNCq
        rnXZ6fH1l+/5HyZF76+wblRiLNyYZ/twZnvql9cLuG4XM++1e/1yxn/n50osxRmJhlrMRcWJ
        AKNhF/r8AgAA
X-CMS-MailID: 20200312122310eucas1p1165dfbb441a2f266968e1e00e2844d04
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200225144815eucas1p1229ceb0d017b46cbbe2409639a7c1f83
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200225144815eucas1p1229ceb0d017b46cbbe2409639a7c1f83
References: <CGME20200225144815eucas1p1229ceb0d017b46cbbe2409639a7c1f83@eucas1p1.samsung.com>
        <20200225144749.19815-1-geert+renesas@glider.be>
        <e249c123-8d00-4aa3-34b8-f82d52428966@samsung.com>
        <20200226174905.GE25745@shell.armlinux.org.uk>
        <CAMuHMdW1ojYyWXZpzgiy8PrZnR2PQ9n3SEDrQ7hFFUg0j-jegg@mail.gmail.com>
        <20200226175723.GF25745@shell.armlinux.org.uk>
        <CAMuHMdV9VyS3kBnhFT-5ry_O-aRafq-8Yor0xxxnjGqNQiSgZw@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

On 26.02.2020 21:48, Geert Uytterhoeven wrote:
> Hi Russell,
>
> On Wed, Feb 26, 2020 at 6:57 PM Russell King - ARM Linux admin
> <linux@armlinux.org.uk> wrote:
>> On Wed, Feb 26, 2020 at 06:56:06PM +0100, Geert Uytterhoeven wrote:
>>> On Wed, Feb 26, 2020 at 6:49 PM Russell King - ARM Linux admin
>>> <linux@armlinux.org.uk> wrote:
>>>> On Wed, Feb 26, 2020 at 07:35:14AM +0100, Marek Szyprowski wrote:
>>>>> On 25.02.2020 15:47, Geert Uytterhoeven wrote:
>>>>>> At early boot, register r8 may contain an ATAGs or DTB pointer.
>>>>>> When an appended DTB is found, its address is stored in r8, for
>>>>>> extraction of the RAM base address later.
>>>>>>
>>>>>> However, if r8 contained an ATAGs pointer before, that pointer will be
>>>>>> lost, and the provided ATAGs is no longer folded into the provided DTB.
>>>>>>
>>>>>> Fix this by leaving r8 untouched.
>>>>>>
>>>>>> Fixes: 137e522593918be2 ("ARM: 8960/1: boot: Obtain start of physical memory from DTB")
>>>>>> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>>>>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>>> The original commit hasn't been submitted, so it can be fixed before it
>>>> hits mainline if you want.  Let me know what you want to do.  Thanks.
>>> Fixing the original is fine for me, of course.
>>> Thanks!
>> Please submit a replacement for 8960/1, thanks.
> Done.

Gentle ping. This fix is still not present in linux-next for over 2 weeks...

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

