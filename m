Return-Path: <linux-renesas-soc+bounces-34201-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uXgOFwbwM2p/JQYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34201-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 15:17:58 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 676166A0691
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 15:17:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=b3GVcUzn;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34201-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34201-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D5C1C302EE2B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 13:10:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F15073F9265;
	Thu, 18 Jun 2026 13:10:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB4D3EC2EF
	for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Jun 2026 13:10:40 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781788244; cv=pass; b=Ne/LNBpMoCsT0fikMrCumm3mjbd2E2ckYz2OD0rh5ppQmFwYx2INdLVluBuvjpQEq7J48eAJCv2w/mbVt4ts5op9Cv3TmG/IwLAvspxxLymdmin/g73h8CKpM14NF/YhZJkm23Z4rzWDH5uhy8ps3DI9cNsk8sTfBJof3qDSAPI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781788244; c=relaxed/simple;
	bh=d+QNhcciioN8943WQueiVIs1K1U1Kqo6ylyvJfyMYfA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s5oA21aDGV+4OTBsaqhfE9/zuGfZ4GvDFIE29/II0sw4CGnV3TIEAHG2bppbH9ITaqzZUCD1I5cIQy68nwoI+92faF5DJUuPfOzmIgkAgwhiE54Z0WzkUf/C6tkLemhgzh27DTyWqeSSq/hbYkmcc/ToHZxATWZ9VTyyvBVXrrA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b3GVcUzn; arc=pass smtp.client-ip=209.85.221.46
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-45ef29c5561so572339f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Jun 2026 06:10:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781788239; cv=none;
        d=google.com; s=arc-20240605;
        b=ioSUPrs+WXFO5yPRnpsDGV+6qQox/kE4r/20m1GpGRA+XY/0LvTBriRuCJ5Cejeo0P
         XGWaTWnAuuJp8t4AOM7RNdgZ6fJw3jCJdxOVsPUAWbRqQgJ5NsKoWQybLUtjkDhielJw
         12gUQBhKs1YGc98JcZYgqvcK8fTstrV5ih4YTg9EJBo5bp0SoxLOxGDRg3sfxwzjtyNY
         ZxJZb88YmLl0KPh4Y7BW4ljCKC6SPSykz28dBIQYHfY2RhrzwLS01vhdbujvLLzWzOeI
         slLXRJZFUa7ily/ByuZbKXZTvvHAa8t3MhNXGmqen66eE4GSjE+JcwsQy/8tzIEVfWQE
         KwAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/QSBzVEzraYQDEb/IQn/Kcl5edw3AQ6HF2dH6T+QYIs=;
        fh=C/eFRJHJ4LZjDHLd3IEtkiHrNLwkZiZd3eIv7dBkXok=;
        b=HnL9R8re3Ld1KcFCZP+YXtvGytDUL8fRJrubxXrIdEDiE4TjHdjjNcSOoRzj/ilLG8
         sR67idnt+cn+1LF39OMiZ6sZpswsgbydXK20mIgCgAQjUxsK6E6XPJqkUbYJcgTC8lgc
         WTQNjV82BbeMHbNDOZKFMLGugHi94HQDNx9nhSuqbMUXZP5S8RUHK8utK5Quj5b3DvvK
         gMst+jaPzYCoNVp2WgpOJn3Pbe/7KiXtBU82aHBtv6LWRXlkddZi6ayRICeUE70hOxmg
         ue46+7500WXrywraRJzbAOco2etnHKOhrvlnmmRBT0CI8yZIfvmZHjvmRF9maOw1Rz8V
         GC3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781788239; x=1782393039; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/QSBzVEzraYQDEb/IQn/Kcl5edw3AQ6HF2dH6T+QYIs=;
        b=b3GVcUznlTFfdK9SwEaQz+tv5zxEyN1t5qL56kCeauLhEgnmcNUTgagNb9ZnV9JdlS
         5Gfc94Qo2KmN601PI0iEfdmkDNaPG9CL7M+oxg83o/OnYtEbSPoRw8cIcFJKnGTtWzLM
         8q3ZSomWvSPZR2g1BRarb/77FpqpoD9XdBtiM3phdFx6sGXNP97MI5s+CFlu63xsE7fe
         5MOXCsL0qVZMdtQXFDtv6cxBi6Y3GVpiW2HgPJtdvyH+OxChoorMWtFpBYIMmSQwyj4R
         Ww+6GS8gHipmz5nlkLWbyVF/kUz+hKxOswanOOqxWlfNtzfvy6Pua/FbM8tCG2umzkaT
         t7lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781788239; x=1782393039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/QSBzVEzraYQDEb/IQn/Kcl5edw3AQ6HF2dH6T+QYIs=;
        b=VndLERP6Az5a+iL/hk/7/NwjRGL1alske+VjxW6ZjWmmrA+uKOB1vTrYfl9X//Rp5X
         LPKq8eNkEclrqm1JWy4rjlnCKTMH3iw8CzxVtreC8meFnaSCyfzIDcIZpIa1y0RJ2X9S
         y7q6I3jC2GxeNxGdEE6ZMLVE2kSv17tgRuagcCLUnYc08guvrq7t8MNlCf54GNZxhhjB
         Pg4UJB21+QcqIs9rr3xQivnK+ctPBurO3L524tJ0123jHdFclsKMuedytVwPUAdmXNRM
         ISdFa+9Z6Jc6aUX5xTgF1MUqGcUXxmHpml/appkMTv+MNQ9JQt+bsrpgDJ/uabYqX4Vq
         4G1w==
X-Forwarded-Encrypted: i=1; AFNElJ8ST0wPwRqQX2fWJEuDSfiev427An2YN/DRegVbnKPsLX78T2ZUlrP5PIw7mldO1Al3fkP2nyPMcaBJdsb+GOpy+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwE3o0XlHfOZMzmUTrTiom2MIYcP9uZM3Cb4n9NL/V6UvMFJYxd
	meiexoAm8oEU24Qk17QVU62jCDKI3DcgjczNmHqv7p48e5qeRLXEg6mGxaRO24JsI1DPH2F0vrV
	DChJYtn0+uNI7zfzK7Hbd1gmyuc3CWRI=
X-Gm-Gg: AfdE7ckZkYWP9u/GzeTGNSEfCZBQxCNVJVekqR38R1hSJsuioi/A3NI1lDbbhPTu//i
	Hvc1HZlTcmBMc408AiyiTD2yFudo33GpRnOY84UuTVN5UeBZmIygS2EIFbqCZy3DhO9/7QyxxwQ
	TQMT/YbyP0udZa/JP+DQ6nOQ0AwMfw7gzP/65tvUgptSD76b0V0pgOJIoXceDyqpI4SbIyJbHjM
	pirU0jDaXW0Hp1bfdbJSVwrOLDuuDKrkCSoPfI7eb+eM0AHFs0WMyU4kd1VnfHMWA8qufs+y/tc
	oAbK0caOyTH8do2anpALtmxGVaYQiEckqP6XBd/MtWGHcWBR8a3BLbq0EcEoU2CGuB8C9ENR09p
	7aBQnySoQeLQKeQ8=
X-Received: by 2002:a05:6000:240f:b0:45f:f142:d56f with SMTP id
 ffacd0b85a97d-463ab7f925bmr6142210f8f.12.1781788238861; Thu, 18 Jun 2026
 06:10:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260615154805.1619693-10-prabhakar.mahadev-lad.rj@bp.renesas.com> <ajKAPJGrea01XVeI@shikoro>
In-Reply-To: <ajKAPJGrea01XVeI@shikoro>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 18 Jun 2026 14:10:12 +0100
X-Gm-Features: AVVi8CeIE9Zqpx5xUuMdz4g0V9M0203aYYbu2RDELhF5fjl_rVj_ZIbbsG1xByk
Message-ID: <CA+V-a8t-phAuaH5g_3Nt=2d=KPw2QqA6r1dqOZv9k-Xhp5q2Zw@mail.gmail.com>
Subject: Re: [PATCH 09/12] rtc: rzn1: Use temporary variable for struct device
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34201-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:miquel.raynal@bootlin.com,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:linux-rtc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:wsa@sang-engineering.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bootlin.com,kernel.org,glider.be,gmail.com,vger.kernel.org,bp.renesas.com,renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,sang-engineering.com:email,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 676166A0691

Hi Wolfram,

On Wed, Jun 17, 2026 at 12:08=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Hi,
>
> Sashiko found issues, not introduced by your patch, but still. I
> curated the list and left only those which I think are valid. Do you
> have time to look at these issues?
>
> Thank you and happy hacking,
>
>    Wolfram
>
> > Thank you for your contribution! Sashiko AI review found 3 potential is=
sue(s) to consider:
> >
> > Pre-existing issues:
> > - [High] Asynchronous pm_runtime_put() is used instead of pm_runtime_pu=
t_sync() before runtime PM is disabled, potentially leaving the device powe=
red on.
> > - [High] If the optional 'xtal' clock is missing, readl_poll_timeout() =
loops forever with a 0 timeout, risking a boot hang.
> > - [High] The driver's `remove` callback prematurely disables hardware i=
nterrupts and drops the runtime PM reference while the RTC device is still =
fully registered.
> > --
> >
> > commit b7f73c7d0932a6e78b12419c5912ad3243637b8f
> > Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > rtc: rzn1: Use temporary variable for struct device
> >
> > This patch simplifies the rzn1_rtc_probe function by using a local temp=
orary
> > variable for the struct device pointer. This avoids repeated dereferenc=
es of
> > pdev->dev throughout the function.
> >
> > > diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
> > > index bc6af59744e48..25cad9213147d 100644
> > > --- a/drivers/rtc/rtc-rzn1.c
> > > +++ b/drivers/rtc/rtc-rzn1.c
> > [ ... ]
> > >     if (IS_ERR(xtal)) {
> > >             ret =3D PTR_ERR(xtal);
> > >             goto dis_runtime_pm;
> > [ ... ]
> > > @@ -486,18 +487,18 @@ static int rzn1_rtc_probe(struct platform_devic=
e *pdev)
> > [ ... ]
> > >     device_init_wakeup(dev, true);
> > >
> > >     ret =3D devm_rtc_register_device(rtc->rtcdev);
> >
> > [Severity: High]
> > This isn't a bug introduced by this patch, but does registering the RTC
> > device using devm_rtc_register_device() create a race condition during
> > teardown?
> >
> > In rzn1_rtc_remove(), the driver manually disables interrupts and calls
> > pm_runtime_put() before devres has unregistered the RTC device:
> >
> >       writel(0, rtc->base + RZN1_RTC_CTL1);
> >       pm_runtime_put(&pdev->dev);
> >
> > Could userspace still interact with the RTC during this window via ioct=
ls
> > or sysfs, potentially causing synchronous bus faults since the hardware=
 is
> > already suspended? Should teardown be bound using
> > devm_add_action_or_reset() to guarantee correct reverse execution order=
?
>
> [wsa] Or maybe not use devm then?
>
Maybe just add two `devm_add_action_or_reset()` calls: one to clear
interrupts and another to call pm_runtime_put()?

> >
> > >     if (ret)
> > > @@ -506,7 +507,7 @@ static int rzn1_rtc_probe(struct platform_device =
*pdev)
> > >     return 0;
> > >
> > >  dis_runtime_pm:
> > > -   pm_runtime_put(&pdev->dev);
> > > +   pm_runtime_put(dev);
> >
> > [Severity: High]
> > This is a pre-existing issue, but does using pm_runtime_put() here (and=
 in
> > rzn1_rtc_remove) leave the device powered on indefinitely?
> >
> > Since devm_pm_runtime_enable(dev) schedules pm_runtime_disable() to
> > execute during devres cleanup, calling pm_runtime_put() only queues an
> > asynchronous idle check. The immediate return triggers devres cleanup,
> > which executes a barrier that explicitly cancels pending async operatio=
ns.
> >
> > Should this use pm_runtime_put_sync() instead to ensure the device is
> > synchronously suspended before teardown?
> >
Although there were some patches accepted for similar kind of issue
reported by Sashiko, do you think I should switch to
pm_runtime_put_sync() (Ive not seen any issues)

Cheers,
Prabhakar

