Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29F5A1286A3
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 21 Dec 2019 03:35:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726670AbfLUCfh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 20 Dec 2019 21:35:37 -0500
Received: from sonic315-21.consmr.mail.ne1.yahoo.com ([66.163.190.147]:46499
        "EHLO sonic315-21.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726637AbfLUCfh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Dec 2019 21:35:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1576895735; bh=x9zNdL4WZY5AxJaMtszZRLH0MiuU1ITD+AN6WUfBQc0=; h=Date:From:To:Cc:Subject:References:In-Reply-To:From:Subject; b=I+x6oTdaKR8q9K41Jnt7g/n41hvaVXvyi+vDQitJQUWKdU1sVcO95CqyZ/hbpajL7TI5eFHcrofGoyA2jcaHsCVRw9XNmggaPmMP/sNw1zobKnAq65oMllRCbL9QYwZsKyccu8zpP/sMCLpWKJVEbzs84Bzi5oac1jqCDGFVc71tMfAFS2aa8oQSYgWZKRoIE8RBqR80e0mgMh1TWAo4g+WXHYTZxWk/ymfWUzqzPRml6TeYNC6HmLXDJb34Csv17iMlvAWC+ZkqJ02JuS/Ua274ZggPPFjzOdI5CH3uiWrMdwQkeWyibGh/XAOkQqHDJiNaqKZ934NSPaMmthd7xQ==
X-YMail-OSG: e7nsGI0VM1lOpubBBA1IC6RG2gXjUsiJ.kX8Iy__A9idje_MIf8EjVFw_a_Rj7l
 Df.uORKy6gGUFU9y_258n0fn2DoKLnvCitzbulnEvPuj_Uk9pXvVcDD7HJkceJWpeewY6S7ffSkL
 tz5qkIsC8eT9O.Hgb4tTB6OYZWfiqQeQ6.WZm5FDB9FgYDgXKI3Ie8jUtzu7nTuE4KAMgoSg53Ly
 thelysXMPASZRY5gdlHu36kfZoGTh1fJYBtI51kb9f3wLGr2Q_dBeiLMMYo6VPmP55iEghl_F1qQ
 R5t51..k8wIE1naoSOSGQjtyhg8TWAMqhGr8MbVsERRXZ33uKnDbYb4dD_1u3XuiAMVRbPHusG2z
 hqAv5xwzad3t1PlBozK6ujPkVxitDkGWu_3IhEKk06CxZXuwc3ytbhOhKProD76jp8DWnjwE93g4
 kMWzQsa_d3BHSSiT3G1SdE_RAiBo5w1L3YRnA5USM_D2yyFLobpnvocl8FCgqiT3.eYEfwnWSGFr
 68FWZMKZut38jrGLSVZaxXX0Vl0j3WNauIIhPGwH0iDfhUGNsMDo8EmHaX9ZnJTQiN3rRJMYSgFv
 yeTzAWw4dqBXchz8gODTNWGu9VAe52E7zd8y9zk0HJyQEhg8ePOgQi1hCN9dmboReMLLYrqmF0vo
 vCTgC160vuvKpQFnR97p_BW63iJEU.uTEy5Zplsrd_8VrXjs9a7FJTKAY_UCUzjod1xUP_OT2V7I
 kIj4NjGIEOD3m1nZGmCIvKDLpEHf_vhJ1vc1gvBMKteGq3tgTHZv6Hy_bTzBlijvbqH9fy0YH24X
 QJr299VdyKWgIuaCcOijzZk3q_vP1zKx3BGw.aObRx9YZRsVBjrGLFnnY07wchMPqLGqnCxwUcg8
 pwWpz_zwCzF9oU0LNCji4muJ0kbIOn8Xx74o0Mff76S.no7gWn3dmC1qz1n.Qfp4u4Rnnj_oE82g
 W0gb8Esi34GIcZQYUAvfIqcv_dMF29f1gRZSSt_F4e3Bx1X0UH_6iGBQ082BqJ4fLtoP1q6zYqGx
 y_BW56VEcWUPliqF9s_scWR_SjyM8L50X3bW5QGabUkPgnafyhYfMczNmtiH4NQZvvXemlCRF9s4
 X.ZEfLIGcQOpWNvFjqQ.twttW72XHR35QiEAHr7zhc8eujMk4fzSlfrPRsaSM3qyQ6uQ7IQ7tE09
 gK19ln7D0HPklM2DlEPud9hang7eCWofvhmjf_ZGZMtrA9QZGDxuaJ8Fabd_I_4kTQ4nLfBwjg7Q
 acHo.BTJiM802NPReRZkhpeVqk2K5koIspZ66nRWpObA4eoZPoIG_8gCrfuxoXPZVzCMSHq9Vnci
 2rZMdcw1z_kxak2XtSMJOXjJdagGZ4WMQONvRjhnzYyAaWNSmwDKXZkVz10I-
Received: from sonic.gate.mail.ne1.yahoo.com by sonic315.consmr.mail.ne1.yahoo.com with HTTP; Sat, 21 Dec 2019 02:35:35 +0000
Received: by smtp401.mail.bf1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA ID d09d0209668bc99e4b675756a7c6d29a;
          Sat, 21 Dec 2019 02:35:32 +0000 (UTC)
Date:   Fri, 20 Dec 2019 21:35:31 -0500
From:   Karl Nasrallah <knnspeed@aol.com>
To:     Yoshinori Sato <ysato@users.sourceforge.jp>
Cc:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Rich Felker <dalias@libc.org>,
        Linux-SH <linux-sh@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Karl Nasrallah <knnspeed@aol.com>
Subject: Re: [PATCH v2 0/3] sh: fixup strncpy()
Message-ID: <20191221023531.GA31@knnspeed.com>
References: <87woatyutt.wl-kuninori.morimoto.gx@renesas.com>
 <s59o8w3qa0l.wl-ysato@users.sourceforge.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s59o8w3qa0l.wl-ysato@users.sourceforge.jp>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailer: WebService/1.1.14873 hermes Apache-HttpAsyncClient/4.1.4 (Java/1.8.0_181)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, Dec 21, 2019 at 12:42:02AM +0900, Yoshinori Sato wrote:
> On Thu, 19 Dec 2019 10:20:46 +0900,
> Kuninori Morimoto wrote:
> > 
> > 
> > Hi Sato-san, Rich
> > 
> > These are strncpy() fixup patches, but using different solutions.
> > Karl's patches are updating current strncpy(), but using 2 patterns.
> > Kuninori's patch is using generic strncpy().
> > 
> > We don't know which is the best, but we can follow
> > SH maintainer's selection.
> > 
> > Karl Nasrallah (2):
> >       sh: fixup strncpy() warning and add missing padding
> >       sh: fixup strncpy() warning and add missing padding
> > 
> > Kuninori Morimoto (4):
> >       sh: use generic strncpy()
> > 
> > Thank you for your help !!
> > Best regards
> > ---
> > Kuninori Morimoto
> 
> I think the generic version is better, but I want to decide after comparing what code is generated.
> If it is not very inefficient, I would like to make it a generic version.
> 
> --
> Yoshinori Sato

Hello,

I did some testing using the following pure C version:

static inline char *strncpy(char *__dest, const char *__src, size_t __n)
{
	register char * __xdest = __dest;
	const char * __dest_end = __dest + __n - 1;

	if (__n == 0)
		return __xdest;

	while(__dest != __dest_end)
	{
		if(!(*__src))
		{
			*__dest++ = 0;
		}
		else
		{
			*__dest++ = *__src++;
		}
	}

	return __xdest;
}

This takes 8 instructions for the while loop using Os and O2 on SH4 
under GCC 9.2.0. I challenged myself to beat GCC and was only able to
do it in 8 in-loop instructions at best. On SH2A it should be possible
to hit closer to 6, and I think it may be possible to hit 7 on SH4, but
these are the kind of numbers we are looking at.

For reference, this is what I came up with, using only instructions
common to all SH cores:

static inline char *strncpy(char *__dest, const char *__src, size_t __n)
{
	register char * __xdest = __dest;
	const char * __dest_end = __dest + __n - 1;

	if (__n == 0)
		return __xdest;

	__asm__ __volatile__(
		"strncpy_start:\n\t"
			"mov.b @%[src]+,r0\n\t"
		"strncpy_loop:\n\t"
			"cmp/eq %[dest],%[dest_end]\n\t"
			"bt.s strncpy_end\n\t"
			" mov.b r0,@%[dest]\n\t"
			"cmp/eq #0,r0\n\t"
			"bt.s strncpy_loop\n\t"
			" add #1,%[dest]\n\t"
			"bf.s strncpy_loop\n\t"
			" mov.b @%[src]+,r0\n\t"
		"strncpy_end:\n\t"
		: [dest] "+r" (__dest), [src] "+r" (__src)
		: [dest_end] "r" (__dest_end)
		: "r0","t","memory");

	return retval;
}
(In maintaining the spirit of the original work, consider these pieces of
code public domain.)

I did also discover that the m68k and xtensa architectures have similar
assembly strncpy() implementations that do not add padding.

See arch/m68k/include/asm/string.h and arch/xtensa/include/asm/string.h.

Another oddity is that it does not appear that all online documentation
notes that strncpy() is supposed to add padding if the size parameter
exceeds the string size. The official man page of strncpy(3) states it
should, but some other sources make no mention of such behavior.

Hope this helps,
Karl Nasrallah
