Return-Path: <linux-renesas-soc+bounces-27121-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4P6EAE2pb2kZEwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27121-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 17:11:57 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4540047280
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 17:11:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 53BC388B780
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 14:51:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D511444DB64;
	Tue, 20 Jan 2026 14:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="YBpD+GcP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3BE438FE6
	for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Jan 2026 14:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768920104; cv=pass; b=Ro0R4eA/Wue0M21ev/whsDbLlp4/TMp7cMlWXhQE9TQMR3so5wm1eCT+LT2b0Zn9PlvariquSEAjJkEJpnoVfbmWodAPA9aj8jdUCXXp+27ht9U1KMpmRwsUjtafRTraWeS7pRD7nhJ4/TM6D4YP/vWtuqPJ+S/vkNvz7WHUTIg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768920104; c=relaxed/simple;
	bh=FnhOZFFzbVVzIYVojcDRn86X+5qaUjeiK0QPjcy1S1k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eTrJ+ECMlnarN1HL8Hlf6vvAKUJgwKv4wB/1wRedfthKXCcKbr0K9Ysl0+oUwHmjA/XrGcWz1QwEP7XSZG7ZG/559AEILqTHSnmJfHv3w48v9FgxZyerVX5uU1hM9rrzciRDjHSryH57A5P/TsN8dWvr16Nrww0MLS7diLhvi2s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=YBpD+GcP; arc=pass smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-78f89501423so61130217b3.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Jan 2026 06:41:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768920102; cv=none;
        d=google.com; s=arc-20240605;
        b=RP4y35kUXcB+MGR3gUIdLUa837QgPDi0KGSeR6irtmLBBKyh2ia1ODbd+6Hrwuq/SE
         ysfVAdCwVT5cb9kudDi0cw7eINyPqwawhCjeE74srCEd0EJVsvVIk8Po/Hd5tmPEsrcs
         tpGkukV1l+fTrV3j00nuqt8YgexzV+NvnDbelA9bsMmCzhDIXsH5C1z0iQl/kp3tRVqz
         x+Vnyu3YMG40thm0Al5npiWZ+x3j3arg7HrazXtqRyJPw71i/lruT2yLbhUHGXAEde6T
         Q3Vj/ys4s3yad1zxRPA15TtudDN3Le5oagUEAt91BMtXesAlfADAa1ZLJC5DsPMiE7bA
         7o+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dwvfsH0axGRKvYYmd5lZV7RDUOkXm5uPzF6BS5XKPv8=;
        fh=BVEDg/zHsEX+lPFyI/ZB84FR+0L9pEfNe4x5ApC5yS4=;
        b=V3bFSDChbcQm/urj4buZBjG63ARBs6rK4a2bznNzCCPM0yRrQIJ9rxxe246b4y0USp
         M+cFPMxoaNt6erPIWq6ESrCVRW+QyFm2PmnQgT4hMBOoz0eqarpjS7O1m5+H4YgCAzcS
         ZYd814cc9bm8euJzme2lv0gJ7KNXV2zt879oJ8hLYU6gb1NYdcAfBlBr5dlcxRkzVR6D
         Gl8yhDo9z726J/jvY/ruFScNofh0SzsNWAea9GgsfgXDzhKoSWRMdUUcMhIOZxJAnYXB
         w/9BdOmsgjZKyii6zWwbp6aVb6E0IIdgPsM6NvDAJntnarnoE5tb037cNu7jCX52xRYm
         7ffg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1768920102; x=1769524902; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dwvfsH0axGRKvYYmd5lZV7RDUOkXm5uPzF6BS5XKPv8=;
        b=YBpD+GcPIZGmpM77MQWo2SYT09ZichSf9AZfPJ3fiNmOPpElQnzlnyVc82GL79ncRM
         5GhQUB0ONcLgHfvzcYVvbKiqK/HGflwf5S6khiRGg4bzbuQ428niLD9hms2YtuwxnGHA
         0Imm0n7dzxzdrjjd29S+ISHoB9Kpne+NUk9jjC6WwsBrkvhflT+z1nV6Mg8GUaBio09x
         7XXNyoGEO36+LrnXojDSns0hLTkPu/4qMNPRFOcqh9p7kfsx5dUOOFRKyX1Kmz+Jdz0i
         uuTAl2VBCVEfJSs7eOEGLEhyshM+AgJvCZ1homBsJr0bItWgaSZkCjgnbA1VxESL6sUi
         VCPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768920102; x=1769524902;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dwvfsH0axGRKvYYmd5lZV7RDUOkXm5uPzF6BS5XKPv8=;
        b=DI59Fjb7LsMSPTafJgtqeLMCn980tXJSAiv3eZzmHSaVIvlC23Zvl4adKTlkg422g8
         d/bT3EByoXLnXgvLSuaCEoAcZxt03OFT6xNePg9vgUbjwOJqWMDl+Q74PXA5LJx25nLL
         vdI3dLFM6JGq6swDHnsr7kZLKOioWBgO4/dKD7vqOeOv6JBHvInIVHHU0hEI6Liz4M26
         jFtWCQSHQ7jcPaosmCQjM7Z6IJtGPA59YSRaWg3VuHKuxnX9jiT+QwGhR8v2/VXddarh
         te5kP9O54QndBeoPD0YhiqFK/Ohuba8fwIT+rcJuSUM6cpcKOSflwIUKge8FnKoRUPWX
         962g==
X-Forwarded-Encrypted: i=1; AJvYcCVoZBUFXzt29KwxN2cwrx7Lu9CO0+euecK+5Hpz6i15uLc1tPhAi/yjfDUHpVTttF4nX6IxIqFld2Xm/0m8CcYb/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXk/6N4QuHuSzf8sb8wJEXyLBDWNX8PrdYbtwvNaeL7a21HHP6
	IeLjPtxrAWx3rmVbtg0DJxwZLh5/qPeUAZ7lpKuqndUbrHMuJzPuNzP3aqZaCt0zd/tTW6/KpjC
	wK4NRkwP2If1HAhVjX/djJn9S7ONXixmE5WIGO761JQ==
X-Gm-Gg: AZuq6aIvZ8bKNjAt2jgsRm7aFqB0nz44wrQIELrtNgZwi3KNiK47XqPuidb6cH243Nh
	xSdHHjZlMcuyHsyu9Axw7aQcJrT28+dHDIAQRSgvAHPLQ5s8M3uVCyOUGDMsFLjkPMx9mKsI1CA
	jw8ku2dsLAECPngxQMt2QAQQnn5WGJXY6rdUp1DWU4GUs8zytZy1YquykEdiUTti1pEGPOGR8iy
	2OaDQDwy5TtNof6Z0HjxmZMcG/qOro6SYDJE3JVK9XWVwwu4SHYa9Z5G08m0qMRt8tMGnt5zASl
	/NKoJfrieWxwrG8ixcSFUyf4o38=
X-Received: by 2002:a05:690e:1c1c:b0:644:50c7:a50a with SMTP id
 956f58d0204a3-6490a67e8f3mr13021072d50.32.1768920101695; Tue, 20 Jan 2026
 06:41:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260104194224.41245-1-marek.vasut+renesas@mailbox.org>
 <x25kxyh4t4u6c3ilj7nxp6sywab5dsar46b2foesrwfux2l4b2@d5iwqqcpdhlm>
 <797047eb-e422-4a8b-80eb-ab130066c1d7@mailbox.org> <xsjwvmlqclctnf6dgwyuoi7zits27is2s7r7taprb2w2lhsf7i@uiljd7o3ivbk>
 <855e5015-98c8-48f6-9320-ca8163591940@mailbox.org>
In-Reply-To: <855e5015-98c8-48f6-9320-ca8163591940@mailbox.org>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 20 Jan 2026 14:41:25 +0000
X-Gm-Features: AZwV_QjWaUa_a7faZZuf7zJEt6ishs_xbFjuO7jz3JnzKJFtb2ov21CgCG1WR4M
Message-ID: <CAPY8ntACxpoZV2_8-9028AaA1mBScUOuK06a6x-XwdSeobiauw@mail.gmail.com>
Subject: Re: [PATCH v3] regulator: rpi-panel-v2: Convert to new PWM waveform ops
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	linux-pwm@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[raspberrypi.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-27121-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[raspberrypi.com,reject];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[raspberrypi.com:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave.stevenson@raspberrypi.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.45:email];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 4540047280
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Marek

On Tue, 20 Jan 2026 at 13:50, Marek Vasut <marek.vasut@mailbox.org> wrote:
>
> On 1/15/26 5:37 PM, Uwe Kleine-K=C3=B6nig wrote:
>
> Hello Uwe,
>
> > On Thu, Jan 15, 2026 at 02:14:15PM +0100, Marek Vasut wrote:
> >> On 1/15/26 11:12 AM, Uwe Kleine-K=C3=B6nig wrote:
> >>> On Sun, Jan 04, 2026 at 08:41:43PM +0100, Marek Vasut wrote:
> >>>> -  struct regmap *regmap =3D pwmchip_get_drvdata(chip);
> >>>> -  unsigned int duty;
> >>>> +  u8 *wfhw =3D _wfhw;
> >>>> +
> >>>> +  if (wf->duty_length_ns > wf->period_length_ns)
> >>>> +          *wfhw =3D PWM_BL_MASK;
> >>>> +  else
> >>>> +          *wfhw =3D mul_u64_u64_div_u64(wf->duty_length_ns, PWM_BL_=
MASK, wf->period_length_ns);
> >>>
> >>> This is wrong. There was already a discussion about this in reply to =
v2.
> >>> I'll discard this patch from my queue and continue the v2 thread.
> >>
> >> Instead of resuscitating the old thread, could you please tell me how =
to
> >> make the conversion, so it won't break with existing bindings and the =
result
> >> would work as well as the current code ?
> >
> > the only way you can do this correctly is to measure or research the
> > actual period length of the device. As this seems hard, the function I
> > suggested in v2 works for me, too.
>
> Sadly, that does not work on the board I use , which is the one below.
>
> I was also hoping that Dave might have some input on the PWM frequency
> of this display.

Sorry, I don't have that information, which is part of the reason why
I originally wrote the driver as a backlight driver rather than PWM.

  Dave

> > The specified binding is unaffected by that. The only dts I found using
> > this device
> > (arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2.dtsi)
> > has
> >
> >       backlight {
> >               compatible =3D "pwm-backlight";
> >               pwms =3D <&mcu 0 255 0>;
> >       };
> >
> >       mcu: gpio@45 {
> >                  compatible =3D "raspberrypi,touchscreen-panel-regulato=
r-v2";
> >               ...
> >       };
> >
> > . Given that the dt specifies something made up and the driver was
> > written in a way that is wrong but does the right thing in combination
> > with the made up .dts, you cannot fix the driver to be a correct PWM
> > driver without having to adapt the invented values in the .dts, too.
>
> I think this is what this V3 does. Would that be an option here ?
>
> > (An option would be to adapt the pwm-backlight driver to ignore the
> > provided period, but I think that isn't sensible and badly affects many
> > other machines that have a working PWM driver. Or assume the PWM's
> > period is 255 ns which is probably wrong, but so is 100 ms (the latter
> > probably to a lesser extend).)
> >
> > Maybe the lesson to take away here is: if a driver implements a PWM, Cc=
:
> > the linux-pwm list and the pwm maintainer on the submission. And let me
> > point out that even get-maintainers.pl knows about that:
> >
> >       $ git format-patch -1 --stdout d49305862fdc4d9ff1b1093b4ed7d8e0cb=
9971b4 | scripts/get_maintainer.pl
> >       ...
> >       "Uwe Kleine-K=C3=B6nig" <ukleinek@kernel.org> (maintainer:PWM SUB=
SYSTEM:Keyword:pwm_(config|apply_might_sleep|apply_atomic|ops))
> >       ...
> >       linux-pwm@vger.kernel.org (open list:PWM SUBSYSTEM:Keyword:pwm_(c=
onfig|apply_might_sleep|apply_atomic|ops))
> >       ...
> I do use get_maintainer to CC people when sending patches, hmmmm.

