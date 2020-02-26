Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 360E316F802
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Feb 2020 07:35:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726112AbgBZGfT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 26 Feb 2020 01:35:19 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:57312 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726089AbgBZGfT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Feb 2020 01:35:19 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200226063517euoutp01bea45259b4a8ab372cf18ee1532d593c~24EehcJWy2755227552euoutp01L
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Feb 2020 06:35:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200226063517euoutp01bea45259b4a8ab372cf18ee1532d593c~24EehcJWy2755227552euoutp01L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1582698917;
        bh=OtcoVD8Zx4NFDq70a/JfASKrkR5KULhGg8xM0tzNrRw=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=eMEM1JlmHWrOCqfctdRoIWe7j54re5ueuU0SpqPHCvI3KAkKZVGcXK7Ao9LFP3h2F
         k5XcF95jZYnQ/YHV3riXY7ouuQM9Zg9+BdEpClGY31tDZRv81Sb5OgUVU0nEbVyBDz
         ciXmBcsbOv2nwusOgvGS6fRFMqXyE7DGgLMkmWhk=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200226063517eucas1p2b4fa69c81a9d86f7f0e7197c1925d4e7~24EeUQ6Un2628026280eucas1p2z;
        Wed, 26 Feb 2020 06:35:17 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 83.A5.61286.4A1165E5; Wed, 26
        Feb 2020 06:35:17 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200226063516eucas1p2509cdd4111e31ce7aefab9ad4ff83efa~24EdnSCeU2629926299eucas1p2s;
        Wed, 26 Feb 2020 06:35:16 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200226063516eusmtrp1fb446a1b0ceb98bb432fb739359aadb2~24EdmlUra0137101371eusmtrp1j;
        Wed, 26 Feb 2020 06:35:16 +0000 (GMT)
X-AuditID: cbfec7f2-f0bff7000001ef66-6e-5e5611a4ef41
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 29.4D.07950.4A1165E5; Wed, 26
        Feb 2020 06:35:16 +0000 (GMT)
Received: from [106.120.51.15] (unknown [106.120.51.15]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200226063515eusmtip2435c57303ef0a3f6e80cdb1103bef75f~24EdC8des1504415044eusmtip2H;
        Wed, 26 Feb 2020 06:35:15 +0000 (GMT)
Subject: Re: [PATCH] ARM: boot: Fix ATAGs with appended DTB
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Russell King <linux@armlinux.org.uk>,
        Nicolas Pitre <nico@fluxnic.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Eric Miao <eric.miao@nvidia.com>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Chris Brandt <chris.brandt@renesas.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-kernel@vger.kernel.org
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <e249c123-8d00-4aa3-34b8-f82d52428966@samsung.com>
Date:   Wed, 26 Feb 2020 07:35:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200225144749.19815-1-geert+renesas@glider.be>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01SfyyUcRj39b53997l7HXYPXOm7UYt5seV6W3KsjRvf7T1T1qKOrxDfu4O
        pX+6pR92kQ4NR7mJlFS6K4poSXeZEEqNykiN1ukHmuTI3avy3+d5ns/n+3k+z74EJuriuBGJ
        qRmMIlWeLOUK8Ebjr17fGqeI6ADNO0RZCo08qrIkH6fqmlox6lJ5IaL0HwY51EBzBZe6Nzll
        T7VfbEXU5YkJLjWsKULbBfTAYB9G/54vRPSnZ2e5tKbblzZUn6Dzc6a4dIElgP75XIPT03qP
        PfxIwdY4Jjkxi1H4hxwWJHSNOaaXOh6rMRTgKjQrUCOCADIQrhilasQnROQ1BLqiADUSLOMZ
        BMV5N3C2mEbQ8aCNa2VZBS87dYgd1CKofT3EYwszgu5eE2ZlOZPBYBptsbcOXMgce2iZ67NJ
        MFKPYFq1ZGNxSRmozWrbu0IyBMpK+jhWjJNe8G3abOO4klFQfv0JznKcoLNs3Ib55DawfD+F
        rBgj10KTuQJjsRiGxittzkCO8cAwUo3YxcPg0cjgSghn+Gy6y2OxO3QV5eGsIAfBaM9NHlvk
        IRg4WbqiDoa3PfNc680wcgPcbvZn26HQ+KUJsad0hDdmJ3YJRyhsLMHYthByz4hY9jrQmm79
        s338oh+7gKTaVdG0q+JoV8XR/vfVIbwOiZlMZUo8o5SlMkf9lPIUZWZqvF9sWooeLX+xrkXT
        j/totj+mHZEEkjoIJ/h7o0UceZYyO6UdAYFJXYR3Zpdbwjh59nFGkXZIkZnMKNuRhMClYuGm
        qskoERkvz2CSGCadUfyd2hN8NxU6z5/p8a7St0WEOPDAuMU8ardLG3ogkvB4f8Q51jMrcX2D
        pF62Y+m0U0RYxWZJg0YjPqhaCF7QDO93D6RyfeYmimUfxXYF7p7qjZLyCoNaJnAQG9xfDc2E
        7+vYafHh4F9jjArXxXO7HeKfStYQurYghf5hkS7oamdgUv2AV7gUVybIZd6YQin/A/TKjf1e
        AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrPIsWRmVeSWpSXmKPExsVy+t/xe7pLBMPiDD61C1v8nXSM3WL+9F4W
        i1Xb9zJbzJ09idFi0+NrrBaXd81hs9j68h2TxaGpexkt5r14wWZxe+JkRgcuj8vXLjJ7/P41
        idHj2Yl2No+JZ3U9Ni+p9+htfsfm0f/XwOPbmYksHp83yQVwRunZFOWXlqQqZOQXl9gqRRta
        GOkZWlroGZlY6hkam8daGZkq6dvZpKTmZJalFunbJehlnH7EVzCDr2Lp5n6WBsavXF2MnBwS
        AiYSV04uYOxi5OIQEljKKLH1xyE2iISMxMlpDawQtrDEn2tdbBBFrxkl9h7axQySEBawljj+
        cDcTSEJEoJlJ4n/LOTCHWWALo0TXscfsEC0TGCW2HG9mAWlhEzCU6HrbBbaDV8BOYub0i2A7
        WARUJT58fgs2VlQgVuLGzA4miBpBiZMzn4D1cgrYSvz92MIIYjMLmEnM2/yQGcKWl9j+dg6U
        LS5x68l8pgmMQrOQtM9C0jILScssJC0LGFlWMYqklhbnpucWG+kVJ+YWl+al6yXn525iBEbu
        tmM/t+xg7HoXfIhRgINRiYf3BWdonBBrYllxZe4hRgkOZiUR3o1fgUK8KYmVValF+fFFpTmp
        xYcYTYGem8gsJZqcD0wqeSXxhqaG5haWhubG5sZmFkrivB0CB2OEBNITS1KzU1MLUotg+pg4
        OKUaGD22eDzY8+i6vUjp1c+/TYqqFytcsDlfeaGHM3LZ9Z3S/NO2XmB8y7Tcvs/5I0+kiuUj
        F6am9PTvdzxStXlfyipeUQn+rLB+TvlOBoOnHwrUHVMvClcoPxGeHfgu9bbCSu8/j48utf+U
        yaTyYb3uoYyygz8//7RpjqzY73vjVsfMhT6vbd2u1yqxFGckGmoxFxUnAgDH7d5u8gIAAA==
X-CMS-MailID: 20200226063516eucas1p2509cdd4111e31ce7aefab9ad4ff83efa
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200225144815eucas1p1229ceb0d017b46cbbe2409639a7c1f83
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200225144815eucas1p1229ceb0d017b46cbbe2409639a7c1f83
References: <CGME20200225144815eucas1p1229ceb0d017b46cbbe2409639a7c1f83@eucas1p1.samsung.com>
        <20200225144749.19815-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On 25.02.2020 15:47, Geert Uytterhoeven wrote:
> At early boot, register r8 may contain an ATAGs or DTB pointer.
> When an appended DTB is found, its address is stored in r8, for
> extraction of the RAM base address later.
>
> However, if r8 contained an ATAGs pointer before, that pointer will be
> lost, and the provided ATAGs is no longer folded into the provided DTB.
>
> Fix this by leaving r8 untouched.
>
> Fixes: 137e522593918be2 ("ARM: 8960/1: boot: Obtain start of physical memory from DTB")
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Not tested with ATAGs, only with [uz]Image + DTB, and zImage with
> appended DTB.

Works fine with zImage + appended DTB + cmdline/memory info passed via ATAGs

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

> ---
>   arch/arm/boot/compressed/head.S | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/compressed/head.S b/arch/arm/boot/compressed/head.S
> index 339d4b4cfbbeed15..a351ed2bc195ed8d 100644
> --- a/arch/arm/boot/compressed/head.S
> +++ b/arch/arm/boot/compressed/head.S
> @@ -267,16 +267,18 @@ not_angel:
>   		cmp	r0, r1		@ do we have a DTB there?
>   		bne	1f
>   
> -		mov	r8, r6		@ use it if so
>   		/* preserve 64-bit alignment */
>   		add	r5, r5, #7
>   		bic	r5, r5, #7
> -		add	sp, sp, r5	@ and move stack above it
> +		add	sp, sp, r5	@ if so, move stack above DTB
> +		mov	r0, r6		@ and extract memory start from DTB
> +		b	2f
>   
>   1:
>   #endif /* CONFIG_ARM_APPENDED_DTB */
>   
>   		mov	r0, r8
> +2:
>   		bl	fdt_get_mem_start
>   		mov	r4, r0
>   		cmp	r0, #-1

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

