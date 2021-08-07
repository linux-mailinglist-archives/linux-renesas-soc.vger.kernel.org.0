Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB4C63E368E
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  7 Aug 2021 19:49:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbhHGRtS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 7 Aug 2021 13:49:18 -0400
Received: from mout.gmx.net ([212.227.17.22]:41247 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229500AbhHGRtR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 7 Aug 2021 13:49:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1628358523;
        bh=JJSHP/SdyExme0NaevFjy1P55tXLU82CZtEw25UPlO0=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
        b=GcAa82DL5j17xfotu5mSvAOQ36wVc7eS8rqsSD6fJnsHl0+C57/ut3SlTS0f6QpvG
         baCt+oMZ+rDIa/l72gCynx/8KzryhsIEsMMMfN9vVWXppQ2aRktpaM9peh0qcQ/9+7
         2+ORaw++yffaJVrBYZ+CpaePy1vJm1Mz5ZUxxICQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from titan ([79.150.72.99]) by mail.gmx.net (mrgmx104
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MK3Rm-1mQ6jc3qVK-00LVuT; Sat, 07
 Aug 2021 19:48:43 +0200
Date:   Sat, 7 Aug 2021 19:48:39 +0200
From:   Len Baker <len.baker@gmx.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Len Baker <len.baker@gmx.com>, Kees Cook <keescook@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        David Laight <David.Laight@aculab.com>,
        Robin Murphy <robin.murphy@arm.com>,
        linux-hardening@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3] drivers/soc: Remove all strcpy() uses
Message-ID: <20210807174839.GF2688@titan>
References: <20210801131958.6144-1-len.baker@gmx.com>
 <YQsTesvLfAwd8z5B@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YQsTesvLfAwd8z5B@builder.lan>
X-Provags-ID: V03:K1:ibq2iY1OVPtXJXA90nfe7VgIltTU0d8zES6xGdkS/S7U2a1PQsx
 07IW8mm0FJiw8PVUcy/k9QVImRuTPSC1Fze3ATJQiFdV24yOOOxb8wk+mK9P13DChuCDH7K
 7Wdizg7hNJEpdS4Mc1nv9KjrEr/ieSt9K37yRQdxIUpo4TtB9I/Bb1TExtD/X2ypDSGG3Fk
 rHFrMjh5mSNxJETfpH/bQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:aQ4Hlf9VXTY=:TZksHNLrZdBrpgwFgz6DsB
 kyCiDeHyUTyRovwft7gJILumsJCgNQ93yRw22LHxw+EV8Lo/5fAPp7KsGTCHN5FqjYGc4h2q3
 NxNpw0R4duRVXqfS5smAkLVovBJ6aB/KJmALyTFZmGb7IvsP1IFHEqX/OXyQZ+1r43P4I3dUH
 NWnI2UYovfEruMu3Pj9moYXkekaZfb9ByawBc978zIcMum8i0thn+usquBR6YHqT+Vp1QgnXK
 BhB9R64bTJjnOdPs4CzZhP6kR5dZRUy+2+s2GaJMmMQw6y9LgzFcR4UsVJ0pm0GtR1XMpXc2M
 Xr8w1hvsaDIpOg0Dln9EeDnJI+amuX8oESNe70lZ37EYHxm1YAl4gd+0hFr21mDUe+Y87DIlb
 udXejYRPK0ovlCEixs9fnbsDjcFBaBQsrNAoEkonyNXjrmM1eT9xcNfuoRZv+5AEHQQfjwYqS
 l/rxHj8K0hPj4sPUoxTIjyWuddGUOHQ9a8d/OQv0YPr7+naOiNgU+1AoyAUXOWCt7q5eDvgpY
 12BJXNtKLqgWhLyVeVO5Zp40NFr4su4nnXD2uC/ZDe427Qj4nBg0bKP+sD3eKiRZ+/k6MYW5J
 q2lFyTSHXnDUARrKIbz4n0zZF32DomIG/4s3g5beEgWzek98cghQmXY/cTU2eQ+ky5NzW8HPP
 E1AgmwLxgnzFaIKIjYOHEAyTP78/YOeX9x0IXpgcCf6wRpIXWNLfQRh8HDA+SYiqVaZ/+hHLn
 BE3Qz+fkpoRnX+v8+hx3DtL4nTnH1N09ttQdk27uOxhItuP2N/fT2cY5q99PL0g6rx4/F1llc
 TTi9QyTQYFxTtkpnBrihnnh4L0kcY50dCN9NfOhnQk0hWPExXHqnZJqmUqG1JJXsR66JhR3hm
 1+kRnB2EJrNESi5882sgDoXzeAsAZCh1ZjtlHqN4PklZ8ziDI2MUgF2Cx+scZDcAbwnRGcNon
 QGB7QCdBlplKQYITdGgtHJ5Y7aNFj1J1YTd2at4s16GJJPyJR4TS7wMeKH+1jflXi9tv32pUW
 tWciPCbjvYhQL4gUUV7tiIr/aEm24/nrmf/15iHENW0idgFvoH3tOWpwcz/jSeLRfdrr07E/R
 OvtFS86M/ujgiOU8jWdARZBrjFPbna9KQ/8yLe0/YTM3yB21A/iM9toUA==
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

On Wed, Aug 04, 2021 at 05:23:54PM -0500, Bjorn Andersson wrote:
> On Sun 01 Aug 08:19 CDT 2021, Len Baker wrote:
>
> > strcpy() performs no bounds checking on the destination buffer. This
> > could result in linear overflows beyond the end of the buffer, leading
> > to all kinds of misbehaviors. The safe replacement is strscpy().
> >
>
> While this is true, are any of these uses of strcpy affected by its
> shortcomings?

No, this patch is only an effort to clean up the proliferation of str*()
functions in the kernel.

> > Moreover, when the size of the destination buffer cannot be obtained
> > using "sizeof", use the memcpy function instead of strscpy.
> >
>
> This is not why you're using memcpy, you're using it because you _know_
> how many bytes should be copied - because you just did a strlen() and
> allocated that amount of space.

Understood, I will change the commit message.

>
> > [...]
> >  		/* Prepare req message */
> > -		strcpy(req.service_path, pds->service_path);
> > +		strscpy(req.service_path, pds->service_path,
> > +			sizeof(req.service_path));
>
> There's no need to break this line.

Ok, thanks.

Regards,
Len
