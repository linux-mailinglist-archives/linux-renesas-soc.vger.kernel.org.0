Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5B293DC66A
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 31 Jul 2021 16:54:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233245AbhGaOy0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 31 Jul 2021 10:54:26 -0400
Received: from mout.gmx.net ([212.227.15.19]:33831 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233228AbhGaOyZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 31 Jul 2021 10:54:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1627743243;
        bh=zY96gBywycZ3DkNeGCbLFMqyecwq4irLjId53UZ4Zf8=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
        b=Ganr3Z8MpqDXwLQU1ajZQdu1jXzt1nzmNe7rSSrq26cKszyGo5a8Ip/m0nQHQA9I4
         7zOz9eeAaB9UA6ET3eZRakKZAb71Jpo35ILPw6dAfYS5+YQsnpDe2tkyxweGpT3Wkt
         EhE/mTTRJlwvgMsMs8AAkSiDeMfjRX5PIP0TOnD8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from titan ([79.150.72.99]) by mail.gmx.net (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1N0FxV-1n4IiS04Rz-00xOSP; Sat, 31
 Jul 2021 16:54:03 +0200
Date:   Sat, 31 Jul 2021 16:53:59 +0200
From:   Len Baker <len.baker@gmx.com>
To:     Robin Murphy <robin.murphy@arm.com>,
        David Laight <David.Laight@ACULAB.COM>,
        'Geert Uytterhoeven' <geert@linux-m68k.org>
Cc:     Len Baker <len.baker@gmx.com>, Kees Cook <keescook@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] drivers/soc: Remove all strcpy() uses in favor of
 strscpy()
Message-ID: <20210731140620.GC1979@titan>
References: <20210725151434.7122-1-len.baker@gmx.com>
 <CAMuHMdUdmv+YmdtjGJV2Lp_Rvar4kN4uSgSTYqXX9CtCJ+qoRw@mail.gmail.com>
 <80f4574c9f6c4c6780735b0fffd83363@AcuMS.aculab.com>
 <fa2fd44d-8cd7-b700-2e7b-d88c9c52507d@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fa2fd44d-8cd7-b700-2e7b-d88c9c52507d@arm.com>
X-Provags-ID: V03:K1:CPIGMjcOPSVTZO7Gzwh9hg7OmO3+oHEOG/0hwDtVK02HC8v0C/H
 VZtjWWWA7ZfqdoNIu89W/7fLWalj2kCOTQKhAxS6lFF7AoLoeM0lcDEuqjYIj+iDuALWlr/
 e3w2i4JYbm+getruIVMJJX4rXzTrv9aobAHUAs0KWlJnXuZM0dUDqdXEBq34FlTZeIDneQi
 IY/Xc6Mh+O9qwxxy5/a2A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:KDOOqXKprFU=:aKLa3NCS3Zzhe89gSTB7xm
 S5gbutCNag4xoaxDSSedPJyiapV+RHqXoXWOVHnzxjYUqTVPUWOOwNtWAZU+fJzeJORs/1SIP
 1OoRhLNgfQkGczk6bUZdlH2HOoIntYsgaEo2I8dYaa315q5tymP0d6v35fBmn7r0rqi3yyIvD
 fnRyTbhf4CpNTGkwzqL/GNynOwbwPOCiYepKBmYGjoPs5/OWOi2DkB4eniekMTX939uyE5FRp
 hb9igUS8h0EzaDJBHtT3jvgRo7I814KSRArIfYkr8PKUi3CPx+7nz1GV3dDJQzfDEyW2tvDVN
 16j6laKhMmY7HJot8t8/3fuO9pjJ1Uqv3vAeB4m63iki7BcSqAVZdICPm4qDzsypfDOifWsZn
 njKRzbVxf/DJz4SSXxTLG7NvKG6q9luBbLuLMTqb68BAhuTStnCXPHLMOQ6Anb/hTqux8TBgK
 5zyLmFxWrVW/fym5geK0gR/HmPJKyPb5iPV7aPv35WRqzIMOHYBtm1j4Usow5DIc74U+cPtBu
 LPyYMZv2bmFdTN1UhsPfjWzqioQbqIp02W53VhzsGLXFptkIATwTRZybyrRVgC0UaEjjrRvY8
 RJm8jUx8q5cRCc7SZ0ez8w/CbjUUfmQs37vC91tRCE2uleFh6I7kadGtttDvyzSQpMAmoiEBo
 YhgqS68ZYcpBfcNPhkj7ExTUx27Gg9Z3KUa5MHb5UveIjFTToZgINcXiAoY7pRUTppTMIp+eV
 T1sVwKiIbd0jCO6TN5v8Pp4bIXTimprkGOY7BCcIzux04RKjoeUBx+sOeiUt74TVKVccLK/Fm
 Oy3VJzdCuUUUpC2cxwxs2XODerg1L/8q6rQ4oLM068fqyfqi0tZ1b4JFNUryfZF6oUkS6ivwc
 aBTvLmQDpJmvInRrFoyusUI4JicfOQhGX+/MzBxDIZfAJ5m19UtUJNpB9rL4DZaVne0g+Il+g
 WChV2VUBnwM4CkHcXL+dTdeopZoSeqRb6qH53Ym39g/HAdOYTnQxxVgwLgYppTc31pupCyI2l
 8xy18lw1WuX4wUCFHbzoEX2h7WPeQh3USpSqNvD49Kl1SZpuHlKajG1pzSniqADZDtCgHFQMs
 65fiqzh7iwOd1lv68wDU0pl4hVOG9CnvXln
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

On Wed, Jul 28, 2021 at 10:36:09AM +0100, Robin Murphy wrote:
> On 2021-07-28 09:36, David Laight wrote:

> > > > -               strcpy(pd->name, area->name);
> > > > +               strscpy(pd->name, area->name, area_name_size);
> >
> > You can just use memcpy().
>
> Indeed. In fact I'd go as far as saying that it might be worth teaching
> static checkers to recognise patterns that boil down to strscpy(dst, src=
,
> strlen(src) + 1) and flag them as suspect, because AFAICS that would alw=
ays
> represent either an unnecessarily elaborate memcpy(), or far worse just =
an
> obfuscated strcpy().

Ok, I will use the memcpy function instead of strscpy. Thanks for the
feedback.

>
> Robin.

Regards,
Len
