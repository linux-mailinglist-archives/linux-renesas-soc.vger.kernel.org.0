Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50D321D98BE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2020 16:02:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728609AbgESOCP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 May 2020 10:02:15 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:55571 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727057AbgESOCO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 May 2020 10:02:14 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200519140212euoutp02e56e7e2afcc4b68e3ea5e20aafc6805c~QctYI49rs1308813088euoutp025;
        Tue, 19 May 2020 14:02:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200519140212euoutp02e56e7e2afcc4b68e3ea5e20aafc6805c~QctYI49rs1308813088euoutp025
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1589896932;
        bh=1iEC+LgJeISD9H2S2oUt04t4i9dXN5pHJ/8jh3qukhE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GncI0Odxq/1P8I48quKZLMg5vgW5h3fZ1Cxhrh9PmPnePxK02MDXaOJ3WMRDzy1MR
         FU/ps2JD9cJDR+1BCj3rlhsFGdJbLbe5naEuz3LJYPNyWU6N1A9nR2ZixtmRZvr052
         Prd8WSgpa7cQnMU18pWOYHFMuq8q8enymLYusoPY=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200519140211eucas1p19ebc83aaab45222e4a8cf0cb511a2ef0~QctX6SBFh0594505945eucas1p1M;
        Tue, 19 May 2020 14:02:11 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 40.7F.61286.3E6E3CE5; Tue, 19
        May 2020 15:02:11 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200519140211eucas1p24dbc0f54594983731a2dcdd4a943ae27~QctXcHsgl3051130511eucas1p2I;
        Tue, 19 May 2020 14:02:11 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200519140211eusmtrp1ccea2758fab8e85213d5978c12db149c~QctXbSuWp1915719157eusmtrp12;
        Tue, 19 May 2020 14:02:11 +0000 (GMT)
X-AuditID: cbfec7f2-f0bff7000001ef66-0f-5ec3e6e3f030
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 21.3C.07950.3E6E3CE5; Tue, 19
        May 2020 15:02:11 +0100 (BST)
Received: from localhost (unknown [106.120.51.46]) by eusmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20200519140211eusmtip126d0ef0940b01071d60ec552dd615e96~QctXOAg4K0728707287eusmtip17;
        Tue, 19 May 2020 14:02:11 +0000 (GMT)
From:   Lukasz Stelmach <l.stelmach@samsung.com>
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        Nicolas Pitre <nico@fluxnic.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Eric Miao <eric.miao@nvidia.com>,
        Uwe =?utf-8?Q?Kleine?= =?utf-8?Q?-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        "open list\:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Grant Likely <grant.likely@arm.com>
Subject: Re: [PATCH v6] ARM: boot: Obtain start of physical memory from DTB
Date:   Tue, 19 May 2020 16:02:01 +0200
In-Reply-To: <20200519131252.GD1551@shell.armlinux.org.uk> (Russell King's
        message of "Tue, 19 May 2020 14:12:52 +0100")
Message-ID: <dleftjo8qk3twm.fsf%l.stelmach@samsung.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-="; micalg="pgp-sha256";
        protocol="application/pgp-signature"
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0hTURjneO/urqPVaWp9WkQNwzJSo7BT2ZP+uFFE0IMw0lZdbOmmbM4e
        FA4qM99OwiYyH73MpaauVT6opmQ+sFKxMO3hzDRTyVlk7627oP9+3+/xPQ6HpWQmxo9VquN5
        jVoRI2cktPXRVPtS+2BDREjywwAyNTmOyE/DIzGpvFQhIgW56TQpaGwXEfMnOyKld+opMthT
        70FuZ/bQpMreLSKdNfkMuT085kFsF+sRKWvsE5O3b16IiGloiCHn6hvF5GV2Dtog426abiKu
        s/sZxX3/ZkDc4OPzDHcvr0/MVZVeYDhbQzLiqq8kculnxhgu82cI96Utm+YyLKWIc1TN2yEN
        l4Qd5mOUCbwmeN0ByRFT5iQT5wg+nvGlh9GjuwEpyJMFvAJ+PHiHUpCEleESBDnZI2KhmERQ
        eUbvVhxOpeQs/S/ieNXpFq4jqP1VRwnFewTNN2qdeZZlcBCUle11QW+8Gp6mLXJZKNzAwIWk
        ag9XIy+8FewjNsrlofFCSGnd7qI98UloSzUxLizFK6G97jflwj54FViGXosFfiY0Gwf+7kNh
        FRiffPy7D+A2FgbMuZSw6GaonUhFAvaCD00WsYDnQmtOGu2aCzgRcgyhQjYNgTX/q/vINdDb
        /o0R8Ea4nDWABP90eDE6U5g7HQzWXEqgpZCcJBPc/lCeWefu4gfpH0rcSQ5aLAHCQ6UjcHQ/
        Z7LQ/Lz/rsn775o8Z4TCi6GiJligl8C1ohFKwGuhvHycLkSiUjSb12lVUbx2mZo/FqRVqLQ6
        dVTQoVhVFXL+1NZfTRN30eeOgzaEWSSfJg2pa4iQiRQJ2hMqG/J3duq/ZX6K/Gh1rJqXe0uz
        hmwRMulhxYmTvCY2UqOL4bU2NIel5bOly4uH98twlCKej+b5OF7zT/VgPf30SLxzz7Bu3wzz
        aGH4gH7C6MNgg+GrSH2p2K4p2uU1PkvZFWn01XRg30jJwaNJ1qbG4qLgh/3sjOg32T92xeeO
        hjv0oS2Uctv6MUtsdPOpBev9e7vCfHZPhcy3ekfUkGGd2RSdkXzaoNySf3FJzf3U7pYr8XHG
        wMqr+ZX9vZsKAuW09ohiWSCl0Sr+AA0qZEyxAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0hTYRjHeT1nZ9NcnOallxEiwy5mnbl52auoSCAcMCLwS1dt6MGJbrOd
        KSpBRoU679pNKTUww3veryOaly6KWMYQc+Wl6cqYhJfQUtsagd9+z/P/Pc/LCw8PE9zjCHlJ
        Ki2jUclTRIQLPrb72nR6cWko1v/7S1e0tb4K0E7ZKBe1PWrloOqHhTiqHp7goMafiwA19Ogx
        tDSjd0JdxTM4al80ctBU/2MCdX2zOiHDfT1AzcMmLpqfm+agKouFQHf1w1z0qbQcRAropqom
        QE8Z32P07+0yQC+9ySHovkoTl25vyCNow1AuoDtqb9KFt60EXbzjT2+Ol+J0UWcDoNfavc7z
        L1FhGnWalvFWqFltuOiyBEkpSQiipIEhlCRAdjVUGiQSR4QlMClJ6YxGHHGNUlQVrxOpa+KM
        os0ZIhv0HtcBZx4kA+Ha5ymgAy48AfkMQNOY2VbwbIEQ1j9JdDhu8I9RRzgcM4C7s/mY3SFI
        CjY3X7CjOxkKJwtO2HWMHCHguwrGzm5kNFxcMfyzBWQIHNlwsiNOHoW6sXN2w5nMguP5VYSd
        +aQMTgzuYXb2sNmdli9cR/8QfFvxFXdsT4YbjctYCSAr90WV+6JK2wsY6Qtb+8WOth+se7qC
        OTgctrSs4jWA0wDcmTRWmahkpRQrV7JpqkQqXq1sB7Yr6B7d6uwFOmuMAZA8IHLl+w8OxQo4
        8nQ2U2kAPrY1Cy8aJ4EQV6lVjMidX2IxxAr4CfLMLEajjtOkpTCsAQTZvlmKCT3i1bb7Umnj
        JEESGQqRyAJkAcFIdJifS766IiAT5VommWFSGc3/OSeeszAbGKu7Mw+Ivc/Mb/3qswrXkyYv
        3okJMHu6Z6RHSj8oFM7ZCwNefcNqbs/zUwfz9VkFpo+zCwUPlussU83dRwZ828LWaiOuH8vp
        yNu+8YOaMETRummxZ/CcqNxTWPO0p6n1VkwZvQH3gotXoU+0eaEH94gSb571kxgF5pYNVf2s
        CGcVcslJTMPK/wL/k5w+JwMAAA==
X-CMS-MailID: 20200519140211eucas1p24dbc0f54594983731a2dcdd4a943ae27
X-Msg-Generator: CA
X-RootMTR: 20200519140211eucas1p24dbc0f54594983731a2dcdd4a943ae27
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200519140211eucas1p24dbc0f54594983731a2dcdd4a943ae27
References: <20200519131252.GD1551@shell.armlinux.org.uk>
        <CGME20200519140211eucas1p24dbc0f54594983731a2dcdd4a943ae27@eucas1p2.samsung.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

It was <2020-05-19 wto 14:12>, when Russell King - ARM Linux admin wrote:
> On Tue, May 19, 2020 at 02:49:57PM +0200, Lukasz Stelmach wrote:
>> It was <2020-05-19 wto 13:27>, when Russell King - ARM Linux admin wrote:
>>> On Tue, May 19, 2020 at 02:20:25PM +0200, Lukasz Stelmach wrote:
>>>> It was <2020-05-19 wto 12:43>, when Russell King - ARM Linux admin wro=
te:
>>>>> On Tue, May 19, 2020 at 01:21:09PM +0200, Geert Uytterhoeven wrote:
>>>>>> On Tue, May 19, 2020 at 11:46 AM Russell King - ARM Linux admin
>>>>>> <linux@armlinux.org.uk> wrote:
>>>>>>> On Tue, May 19, 2020 at 11:44:17AM +0200, Geert Uytterhoeven wrote:
>>>>>>>> On Tue, May 19, 2020 at 10:54 AM Lukasz Stelmach <l.stelmach@samsu=
ng.com> wrote:
>>>>>>>>> It was <2020-04-29 =C5=9Bro 10:21>, when Geert Uytterhoeven wrote:
>>>>>>>>>> Currently, the start address of physical memory is obtained by m=
asking
>>>>>>>>>> the program counter with a fixed mask of 0xf8000000.  This mask =
value
>>>>>>>>>> was chosen as a balance between the requirements of different pl=
atforms.
>>>>>>>>>> However, this does require that the start address of physical me=
mory is
>>>>>>>>>> a multiple of 128 MiB, precluding booting Linux on platforms whe=
re this
>>>>>>>>>> requirement is not fulfilled.
>>>>>>>>>>
>>>>>>>>>> Fix this limitation by obtaining the start address from the DTB =
instead,
>>>>>>>>>> if available (either explicitly passed, or appended to the kerne=
l).
>>>>>>>>>> Fall back to the traditional method when needed.
>> [...]
>>>>>>>>> Apparently reading physical memory layout from DTB breaks crashdu=
mp
>>>>>>>>> kernels. A crashdump kernel is loaded into a region of memory, th=
at is
>>>>>>>>> reserved in the original (i.e. to be crashed) kernel. The reserved
>>>>>>>>> region is large enough for the crashdump kernel to run completely=
 inside
>>>>>>>>> it and don't modify anything outside it, just read and dump the r=
emains
>>>>>>>>> of the crashed kernel. Using the information from DTB makes the
>>>>>>>>> decompressor place the kernel outside of the dedicated region.
>>>>>>>>>
>>>>>>>>> The log below shows that a zImage and DTB are loaded at 0x18eb800=
0 and
>>>>>>>>> 0x193f6000 (physical). The kernel is expected to run at 0x1800800=
0, but
>>>>>>>>> it is decompressed to 0x00008000 (see r4 reported before jumping =
from
>>>>>>>>> within __enter_kernel). If I were to suggest something, there nee=
d to be
>>>>>>>>> one more bit of information passed in the DTB telling the decompr=
essor
>>>>>>>>> to use the old masking technique to determain kernel address. It =
would
>>>>>>>>> be set in the DTB loaded along with the crashdump kernel.
>> [...]
>>>>>>>> Describing "to use the old masking technique" sounds a bit hackish=
 to me.
>>>>>>>> I guess it cannot just restrict the /memory node to the reserved r=
egion,
>>>>>>>> as the crashkernel needs to be able to dump the remains of the cra=
shed
>>>>>>>> kernel, which lie outside this region.
>>>>>>>
>>>>>>> Correct.
>>>>>>>
>>>>>>>> However, something under /chosen should work.
>>>>>>>
>>>>>>> Yet another sticky plaster...
>>>>>>=20
>>>>>> IMHO the old masking technique is the hacky solution covered by
>>>>>> plasters.
>>>>>
>>>>> One line of code is not "covered by plasters".  There are no plasters.
>>>>> It's a solution that works for 99.99% of people, unlike your approach
>>>>> that has had a stream of issues over the last four months, and has
>>>>> required many reworks of the code to fix each one.  That in itself
>>>>> speaks volumes about the suitability of the approach.
>>>>=20
>>>> As I have been working with kexec code (patches soon) I would like to
>>>> defend the DT approach a bit. It allows to avoid zImage relocation when
>>>> a decompressed kernel is larger than ~128MiB. In such case zImage isn't
>>>> small either and moving it around takes some time.
>>>
>>> ... which is something that has been supported for a very long time,
>>> before the days of DT.
>>=20
>> How? If a decompressed kernel requires >128M and a bootloader would like
>> to put a zImage high enough to *avoid* copying it once again, then the
>> decompressor can't see any memory below the 128M window it starts in and
>> can't decompress the kernel there.
>
> Do you have such a large kernel?  It would be rather inefficient as
> branch instructions could not be used; every function call would have
> to be indirect.  The maximum is +/- 32MB for a branch.

This number includes data, particularly initramfs which may be linked
into the kernel. Assuming kernel <32MB (15MB like min ATM) we are left
with slightly more than 100MB. Which isn't that much if you would like
it to be root file system for your device.

Of course initramfs could be loaded separately by a bootloader and yet
having both kernel and initramfs in one file has some advantages.

I am not here to argue. It's your call.

>> If we do not care about copying
>> zImage, then, indeed, everything works fine as it is today. You are
>> most probably right 99% doesn't require 128M kernel, but the case is
>> IMHO obvious enough, that it should be adressed somehow.
>
> If I have a kernel in excess of 4GB... "it should be addressed somehow"!

I believe software and hardware limitations should not be compared this
way.=20

=2D-=20
=C5=81ukasz Stelmach
Samsung R&D Institute Poland
Samsung Electronics

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEXpuyqjq9kGEVr9UQsK4enJilgBAFAl7D5tkACgkQsK4enJil
gBAA3Qf/W1CMR8ZwO3hPtiny7s8gzAz50lCCSrdQiFDqxLivWjOq839Ku+5O6odw
sJrbDhoz4TxTGqsaMQVXSFfqjbz6jXN1SgSImejYV6BT2UJMtzPhU8zSIIXoqiEM
PK18k17xRMNBzHOII/Nv0S6sQaQc6fxO3/zABsx22uBFeOovlHtDBnXZrKy9oizB
MaREIh5IvBjLwnSDsPulymWSRCaS6/ewZWQ8K5LTr8PpXj+E9n5twCWbAddHhryy
nGQpK6Fvj8DREKA6Lq6u0PTfPW9kwtHjMiH9+p8hxLfMRU030X4f/BUkcv8YMrKg
ICc5qvvcubA2BUdOvSWr/g1ii+C8Rw==
=etso
-----END PGP SIGNATURE-----
--=-=-=--
