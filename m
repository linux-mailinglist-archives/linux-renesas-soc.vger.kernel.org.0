Return-Path: <linux-renesas-soc+bounces-29548-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IA3eAzMQuWkaoQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29548-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 09:26:27 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9592A59D9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 09:26:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8366F303EC17
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 08:23:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 886D43988FA;
	Tue, 17 Mar 2026 08:23:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471E139659C
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 08:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773735827; cv=none; b=LAyh1DxQJ85mQ8xntIFH0MRGPlLauMlIN9/8cHt2eL+3NVVyQnYCDAHjah9QxxQlA6H3VlMa9KidVZnkCGjAzpsG8/EyX7/8+5szBPB3pWheeBvfjEeF6pmKTD5lZlqMyaozfFffd4iE98dhSn2CI79JXojHIPZPkdXhKqYqC+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773735827; c=relaxed/simple;
	bh=aTR0ByVDp5twPVDF0We0yxjjtWE6HL5DaVZrXfqb4cU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NnGBEHFbx7/cBw8OsBt/O3Su0w55YiZjZoIDXGyhjO9WhFuAfklRw3UYnuipd9YrcN+yrWUz9WxKyTuvWvujSD8x7pwwtKDjx2A4RN8ULK4BWvi0Jbzzj2XLbmBddJxJ/VlgKvesuZgFIBUaMfBd8lJftFG/N3fC6thMzMbcbMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-56b7e5dfd25so320991e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 01:23:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773735825; x=1774340625;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/BWsLLpeb8S2Ruk3mIA0NNiewV90E5kBU5fFfxw9bA0=;
        b=WVSEX5mpgc8GFN4Pkm66BfYFdSbYDP3yw/gpXB2K1k82FT/sl9eX9XFmtOIONXinTj
         z3TydRRoooebOKs5emBmjMgTXRyoZ+GQB5hRxU9I6uHDfTo09OoXaI3oryTZvlwyDa2a
         C7IZhUSS/nlUXxM+v8wq7HZAef+UfqLqegSZZ1cqAhkj7rTRc2I4IFjWH8NJekrO/SD7
         qvhBSR757iWe7zICOwy2OYjRnwDovgvu3UkcsT6da+lcb0usb2mbpUw8w5sysPnNs3SW
         wefS6SLUbBKWf/LcBRkp5RyAVPBLF6AO7pdJjiP5rU2ksekH2DlAEbTv4YXt1rG2sMVq
         HVvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhMUCXB7LM8XawdPNLpFl8ErOTdwmAayODg/H0vKXxhksn+ObZp5+ZsTXEl2ht5K3+WQchOF7ohg4b5rgqgR2qCg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyvdWe+h6ddmDOXb2MXSK9ai4iX01WzJ5/Wy5YEFECfQajl4Y79
	vkd4k+O02jylC/Y6GKvOoKGQWPpBqqvICOE+2KM3wtzMHzAXxbxTvQ8jOwSN2VHl
X-Gm-Gg: ATEYQzxtSUj5fOmbh5B4ZX5flUxzEsTON9ll8xV8bC9Ou/rE+2Q3YoUwnCzO1aRjsQb
	/x8jtMBTdYk2Nv+gcBpPJ7A6X+ApoUvPBvR95XcrUxSenV3sjJk2WnvO8xj7AETQsvQ4FjuLlue
	FxCB6jbmtKc5dmbPpl1lohUigwmtx+C76IPo50Bnx/CL+vs5kT+TMb9qLWNxAlIYe7eq//SkR16
	37CuQZKWKPOVeleMZN48ZQp8fr1+rGZBY50wnRXN8v1I54tJwpWZLrp+a1zan9lf7f4qr43Jdsw
	JEqgHHYHGfqxKg+wePZRSMZPQBpMJNjC7j4R8NGrDvwRrA8bgbcSDIFi5oew6yKR4JfOU6XddO9
	0V5jWUu1TVSdfnIEnXq/3Il3v1/mQKjixPxScJ/x+5hwIq8y89sgwDokStXN8URxe6diBjXXGQT
	ZQkFs7szwiH/7/iewZnIVwiyLNhp6gUwjwq18D0vL0oegwZucwBDbDO911ym2i
X-Received: by 2002:a05:6102:4405:b0:5ee:a6f8:f93b with SMTP id ada2fe7eead31-60263d12d49mr1244230137.2.1773735825221;
        Tue, 17 Mar 2026 01:23:45 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94ecfc4ecabsm7134692241.3.2026.03.17.01.23.44
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 01:23:44 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-94ac3958788so335316241.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 01:23:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW30USRTYCloYVVNoZ9pVjq+1kOdzDcXHruxgGngtztbEyaH+Ipu44PZ5Cw1MAnrj6VUNeiBajDM5M0u1j6sm7yTg==@vger.kernel.org
X-Received: by 2002:a05:6102:38d4:b0:5ff:de83:3e46 with SMTP id
 ada2fe7eead31-60263d8f933mr1167606137.7.1773735823847; Tue, 17 Mar 2026
 01:23:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260130122353.2263273-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260130122353.2263273-2-cosmin-gabriel.tanislav.xa@renesas.com>
 <aaqTVDQa7xn70bR_@monoceros> <TYRPR01MB156191C8E77BDA44AE23A7D4F857AA@TYRPR01MB15619.jpnprd01.prod.outlook.com>
 <TYRPR01MB156192CC838EC0B3DD66246158540A@TYRPR01MB15619.jpnprd01.prod.outlook.com>
 <CAMuHMdVqqGTmxiKRQBbphw8KmtG66HLaZhDVvtSK81cfiMsXcQ@mail.gmail.com> <TYRPR01MB156193245985A82B792817FE68540A@TYRPR01MB15619.jpnprd01.prod.outlook.com>
In-Reply-To: <TYRPR01MB156193245985A82B792817FE68540A@TYRPR01MB15619.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Mar 2026 09:23:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV6c1F8eVOi6bQssq3qsBcpGnQ-cT1AeXLqXXYEgK4xrg@mail.gmail.com>
X-Gm-Features: AaiRm50jZRADgQIXJgbrFUg4WeDPSzcNuPJxTTXR-hiMiTGwpkXr0IAMZW3mmeM
Message-ID: <CAMuHMdV6c1F8eVOi6bQssq3qsBcpGnQ-cT1AeXLqXXYEgK4xrg@mail.gmail.com>
Subject: Re: [PATCH 1/5] pwm: rz-mtu3: fix prescale check when enabling 2nd channel
To: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, William Breathitt Gray <wbg@kernel.org>, Lee Jones <lee@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, 
	"linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,bp.renesas.com,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-29548-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.764];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,mail.gmail.com:mid,linux-m68k.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9C9592A59D9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Cosmin,

On Mon, 16 Mar 2026 at 20:13, Cosmin-Gabriel Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > Sent: Monday, March 16, 2026 8:26 PM
> >
> > Hi Cosmin,
> >
> > On Mon, 16 Mar 2026 at 16:52, Cosmin-Gabriel Tanislav
> > <cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> > > static int rz_mtu3_sibling_hwpwm(u32 hwpwm, u32 *sibling_hwpwm)
> >
> > Unused sibling_hwpwm?
> >
> > > {
> > >         if (!rz_mtu3_hwpwm_is_primary(hwpwm))
> > >                 return hwpwm - 1;
> > >
> > >         if (rz_mtu3_hwpwm_is_primary(hwpwm + 1))
> > >                 return -EINVAL;
> > >
> > >         return hwpwm + 1;
> > > }

> It's funny how even after triple-checking the message I was about to
> send, I didn't notice it.
>
> This should have been what I sent.
>
> static int rz_mtu3_sibling_hwpwm(u32 hwpwm, u32 *sibling_hwpwm)
> {
>         if (!rz_mtu3_hwpwm_is_primary(hwpwm)) {
>                 *sibling_hwpwm = hwpwm - 1;
>                 return 0;
>         }
>
>         if (rz_mtu3_hwpwm_is_primary(hwpwm + 1))
>                 return -EINVAL;
>
>         *sibling_hwpwm = hwpwm + 1;
>
>         return 0;
> }

Thanks, now I can see what you intended ;-)
As the output parameter value is unsigned, and never very large,
returning that value or a negative error code as the return value may
be simpler (i.e. use the original "bad" version, and drop the unused
output parameter)?



Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

