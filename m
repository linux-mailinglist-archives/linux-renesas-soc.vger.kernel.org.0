Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA6133DCACC
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  1 Aug 2021 10:48:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231586AbhHAIsJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 1 Aug 2021 04:48:09 -0400
Received: from mout.gmx.net ([212.227.17.22]:59883 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231462AbhHAIsJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 1 Aug 2021 04:48:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1627807664;
        bh=KAtB/hkXnGtyzqimkfmScVvNL7Znds0dqHpt67ZuZ94=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
        b=JhK7D/cZMyBelejeTyyBjOOLqAOmTwexdKB/l1WObBYy7aoEzJYKciXd0q+13LJN5
         K/76ON/zeYuMZjBEEmLIbQMakmkZpD8KOcR7KSimtdOBerjBeasmCswoUrhfo0OgWW
         tv5vgCfdWWIaHiT4ntEJJW2qdySwUKWUyysQeLiQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from titan ([79.150.72.99]) by mail.gmx.net (mrgmx104
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1M3lcJ-1m9psx0nHX-000wjz; Sun, 01
 Aug 2021 10:47:44 +0200
Date:   Sun, 1 Aug 2021 10:47:31 +0200
From:   Len Baker <len.baker@gmx.com>
To:     Kees Cook <keescook@chromium.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Santosh Shilimkar <ssantosh@kernel.org>
Cc:     Len Baker <len.baker@gmx.com>,
        David Laight <David.Laight@ACULAB.COM>,
        Robin Murphy <robin.murphy@arm.com>,
        linux-hardening@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] drivers/soc: Remove all strcpy() uses
Message-ID: <20210801084731.GA2588@titan>
References: <20210731171825.12865-1-len.baker@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210731171825.12865-1-len.baker@gmx.com>
X-Provags-ID: V03:K1:bDsnKas5NAlqNeK8T8Vsqc2f6q2LMWVBcpZAT8PxxpAUSH3wpob
 echByALkbiO5G5lU8JFjlDTCj3+8eyZj86S32cF1QX0QtisZeAfkgg13AeSQw89Vs3z/brO
 ZHD1sx8/mqeToomyl7gkEF9ZywiklBfIqTdLfHrx8xZthat1ahCIgOeQpkDUgHjy2V3E9Ns
 IFLXsaksWOWTZo5mAjVRw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:sQFtGwbxGog=:RbelOC5WafgvKeUwUBZFe8
 9As/og4QkRWlU0e9wQ0+UQH2+qROIuVCe0NMlrSqVFFt44wVMXmjmscnmFuYjtD4/sL28o5s8
 sxpDClhxgcwvJ89g22gw8VgTMMfuBbnvjea+dKw0UP4n72oEmMgtOKMohxFYsCrScjVpnkrgw
 IFH7CP8exEYRLzmVTXJiB8C9odUQz22rBFVxSPNBor/6TgsErmW3xEUv1UIYwlUpYKJ/sEqa3
 HWhsdoHZs7Gl4trQ2RCwJ9QzIkcUcmEqnBlx+quMmAfKwASLdwW8WMF+bKz1jdyxZz3ehYW/1
 u0O0B4J7oXUAwROop3jtIhQ+Ops60jZ5OO1H7mhPcKG2+22ujOpd9ZJMnLA3zDZReFo74tvlq
 UL0kYkVVkJCe/Mhht7QRy9XRjv3IUrh5tnrjLJrugwduxpyIYEuhEBPHNEu7eMacThMPlFHwO
 bX7mWmc9W8DBcnfI04iRH4Zkt6NAdSg8LSALuhKdW8+YASzWzq3ZfKo4re9o/0VHKkFZFnwqW
 kmmtpot3BJl5vJAOufIIlIx+ulvFg0byrKGyTHJdJFFqUQ6/szdzkGpL5nZbH5Urgb4ieGg2x
 6boHtnimWvEoXnEYAgRGRqNp6Ez6yyQ+4z+8h4hk9orMrKRc7pPYeHtF0qu3x20s9rj/qo/Hd
 1uMTqn0vMIa6cvGHfBHPh/9ymMK1E8rd6gWyKyroJ5PehuzPAgZKrpakaGji8jqDKo/c2Rkvm
 F86r133HGjvl/m4P4WDB2CzBZVSihs8hCCz7ZlGjKRMsfvkJnxk1JNxFrbTbKUjZ9kwNv7hue
 DhQWWLPErlTPbBrIf3z9+qZiBKPAgjKuMWBKdQSV6SYAszWDdsWXKqiQDAXM3e6roQ0P7sV7a
 FexVfyST7D2yu6roHS8riPPzY0bTG+DTqmRfT+nVCUGE0cBb3tKhQi448eVASL9P11p4du+Hp
 lK7mLUr8GA5Q6gCAPnfon72+pUAUpdfqXLB1cdO3pCIuw3PvO7YIN2gfTVPgh3a+uW76pU+UA
 w1aGTVIFeK/nfIJVPwvGWxP8nifGQHlgenxF0zzfBLyIOZ0dzEs7RNPRYYigvaaKJHsvQSGnf
 P6l7gz3gzYn6FsKTY9sOFsM1Bx03eFrIs+m
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, Jul 31, 2021 at 07:18:25PM +0200, Len Baker wrote:
> strcpy() performs no bounds checking on the destination buffer. This
> could result in linear overflows beyond the end of the buffer, leading
> to all kinds of misbehaviors. The safe replacement is strscpy().
>
> Moreover, when the size of the destination buffer cannot be obtained
> using "sizeof", use the memcpy function instead of strscpy.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Len Baker <len.baker@gmx.com>

Drop this patch. It has errors. Sorry for the noise.

Apologies,
Len
