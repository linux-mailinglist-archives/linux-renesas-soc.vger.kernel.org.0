Return-Path: <linux-renesas-soc+bounces-30900-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kK6zMAGo02k4kAcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30900-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Apr 2026 14:33:05 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 700EC3A34C8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Apr 2026 14:33:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8FF47301DAD0
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Apr 2026 12:32:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D82333262F;
	Mon,  6 Apr 2026 12:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O+gwmV90"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664B7329E55
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Apr 2026 12:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775478758; cv=pass; b=hc2DrWsrNw01gmyJMO/+8JRXGHiSMR1WMN9g4x92I6DEFBzGtf0bdYqQwSSCWaGjZcSdVXz6A54pgV4VaXNTPd/hm9qp46ZYAdybBI10PK4AKXu9xxMUwGuFKj1CTd+mnBiNuVph9b30+NQlHUPTIcvantDaOtKQblI6ONj/YaE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775478758; c=relaxed/simple;
	bh=NnYpzCjbOPa23Fsh/bL9Mp8xGA8K8foKfgmggy1BxJY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CHGvW8E/04nj2TkwPcztq8HrGHGvZWAjc6BXCH+mElW9+b7sfBfydCUIyssAULj3HoQD5PYqOffIcFFMqc9Xd94PyxeE84Nx5DEru2CqcVY3ImgbQy2aWFuOVEqhJyHOPfR4ZAkDm866C27ApJkXxDMhYaRhJkNo4/bzw/Dm2mQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O+gwmV90; arc=pass smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c76b95e652bso1105597a12.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Apr 2026 05:32:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775478756; cv=none;
        d=google.com; s=arc-20240605;
        b=ElXzMEuSTRXXVp14tiDm1KOkVFDfGZm38uhEU8mNE4Unchf7thyErysjFtcTwS5td6
         mivECEEApqQy4qclmxIxU/wiCGCHnuLJJkPg0Xe1uwnS86x5tt/9qg5ykoMO/S7orQOJ
         ySQVSRIH639nf1JGdMJyaMbC5Zc21ipfV17flXju3ke61YK431u7YUQGbgVd93I46dd+
         5JHqOtdD1VWNwLV0m2NrwHVtAQtY/xfbkVBnPgJYzcNOX6wSsVERDbYvl/UJrKaOwTX1
         SdzuNaANiSDk1jYCpr/Py71sKjC3yb1oJec11naEgRbwd/c2xiyFzy34M4xHpkKpcNyu
         OlXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BpJLMv/PN8ttKmYeWwPZWYWOIWYBgFzlU3AGL8Sjwio=;
        fh=+q5jHfAGxKjSjOwnO6OhAfuOZUVESAKsFJ1ZPboczR0=;
        b=dAhUYLdvra/fy7n9QcDL0UiJea8GmTrysO9Z4RwHuxNagZsSN/22Iga4Woh19hlSIy
         +c0E5lGwjG4auoqO0ovycI/y1DltpEelW8Srpy8VQSakQOW4G0Q+s7kttHpn3td6eZsI
         aJTQQmsx1jKvuHLOV2q0JtGy8wR/iwWrYzZMoZ62ZWfEG277As0ocfmbzz9X7Wz+AWOL
         89RIs7f+S/8dkN0Tv8iKVV1krg1Ceava1N0mRBlDYBYS4VmujBxM5KXM1pdqtidJUiyk
         onuMIVU2zXFPCBbkvrTnvRm1E5tU+p/2hODjY7RfW5NcWhr3tKo3mnOIAbwhrZ/2ZZdU
         fScw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775478756; x=1776083556; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BpJLMv/PN8ttKmYeWwPZWYWOIWYBgFzlU3AGL8Sjwio=;
        b=O+gwmV90EhAzTgPuoR/DsXbd+e9m+urrblot0oqEfepq1stiHBFtmLgYMfWsY5Ou69
         qZZfLKBS3BHQm3uksntzh3Qlw8OWhlulDCefBzcsfX9Petd2uoNDNyN1EpdhXQKd0cMU
         frffudik7CBD0hNmH78A1KVPwJ2BEdVkJwo5fWUcNFYRCUwL+FblB8EDUXLfbh21o7rJ
         gu9A48ydiN4oerKVEmWNRPGqYqhER/tydRxGqxdF4gSVSbl+Qyz14BNHC11MHqOEJdZV
         +q22SqbktD/uAGNqCqM4xn4gYL6w9/osCCfksKprAI1KYwRliuhuIt1T4e2LWN8K5+Zd
         LRFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775478756; x=1776083556;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BpJLMv/PN8ttKmYeWwPZWYWOIWYBgFzlU3AGL8Sjwio=;
        b=M+k/OxvaMpM9uqzNwQENeEu+jVCHamhC+UfWYdU12tNOphk2BuD3J9w53NHyV5EaCh
         yGtzhgjDMMjQ3EmhwpeaGK5rLUUMskMAebw52U2ArdUJBrnRl6ChoumFpWDwcUsnHbBS
         kMPPQ3KBuoo79WdI1uXweNB9uUi6XECEwmcGvRgoAEWNj7jWi/UpDG61Z3/8SHak7tJ5
         qzeW56X0yAxHKutzvV9U4JoQOnAMFJfl8EWhA1X6Lf3OwnbvuMD2mpAhwrgoP+ItZPtP
         V6tiZX2TUmozK6jEGqGUFF6FZfUYRKfHDDViLs/evLytsosBiNBk6fknJTNK6hN/6QmV
         Urzw==
X-Forwarded-Encrypted: i=1; AJvYcCXDMgQBn66Ri9/lDQKX1drSjfE4iIAt7+kxH3aWGPdjGKJFnb4Cz8B8oMObCK4PfjEKP9rdVYCLQH8IX0M8Mgc4hw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy15TF9S6DjCWq92t0Zr4/8Pl3N6zUVCVG71PSwfWmDTCEbfyLA
	ZbY+RkE7sL8by/qQuODPS2nH9BV8XQCUtMYS2BWacodW2KPHfQOydbs84TbB2hcbZ3w/RRCg6u0
	qT7G9uA7f3BmUlhQHfRYbLPSbSKGbqp0=
X-Gm-Gg: AeBDiet5cQBDTYlkmcxdwnBl5ji+emwKO/iRNty1LhI7xELPjuR15kDwvs+mm8tin4m
	DpNBsF88XtiaAHP/u+KtjmqXqC9lNUtWb7jlldecg/qic+yDQXHtTX6buJy20Y6RLICJTfXqUVV
	pUuUOgyYjyZz1ceY4V8/pMcLciO4BvnQL6ikpdYDxVsftacem+hpEfNHVA50ZPfnSAAUBYj7UcC
	infERTWA3888dHBcU3cMxzwaA385aqbjO8bt+oBhsuhb2bsPjw9t7yX40MgaQuagu7yugEEsdL8
	pYbyaq5OjbVCryOUHLDf87MB6tpGXITXTFb+3A==
X-Received: by 2002:a17:903:2c04:b0:2b0:5075:96d1 with SMTP id
 d9443c01a7336-2b28176a618mr133938205ad.24.1775478755494; Mon, 06 Apr 2026
 05:32:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260403112655.167593-1-phucduc.bui@gmail.com>
 <20260403112655.167593-4-phucduc.bui@gmail.com> <87v7e5t16l.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87v7e5t16l.wl-kuninori.morimoto.gx@renesas.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 6 Apr 2026 19:32:22 +0700
X-Gm-Features: AQROBzA0_93mm2t7r0WlUl14fX7SUBUPYxStZohF-_IJd-zBH4HmuI7FuU4RnJY
Message-ID: <CAABR9nGUyTkDmB0SgKAuM1Pp75L=m1q4bLSfhobm98TswDnt8w@mail.gmail.com>
Subject: Re: [PATCH 3/3] ASoC: renesas: fsi: Fix hang by enabling SPU clock
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be, 
	magnus.damm@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30900-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,glider.be,perex.cz,suse.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 700EC3A34C8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Morimoto-san, Mark,

Thank you for your review.

> If it is needed for register access,

Yes, enabling this clock is essential as it functions as a bus bridge clock=
.
Currently, the SPU clock is still enabled by the bootloader. In legacy
kernels (v4.2 and earlier) using the Armadillo board-file/defconfig, this
clock remained active after boot, allowing the FSI to function correctly.
However, after migrating to a full Device Tree (DTS) implementation,
the kernel's unused clock cleanup mechanism disables the SPU clock
because it isn't explicitly claimed. This leads to a system hang every
time aplay is executed, as the FSI registers become inaccessible
without this clock.

> you need to call it on
> fsi_hw_startup/shutdown() which cares suspend/resume too.

I previously attempted to manage the clock within fsi_hw_startup/
shutdown, but the system would hang when stopping aplay
(e.g., via Ctrl+C). This happens because certain cleanup operations,
such as fsi_irq_disable(), are performed after fsi_hw_shutdown()
finishes. These operations require register access, which triggers a
system hang if the SPU clock has already been disabled. Therefore,
I moved the clock management to fsi_dai_startup/shutdown to ensure
the clock remains active throughout the entire lifecycle of the stream.

Furthermore, my testing shows that using dai_startup/shutdown
eliminates the need for explicit Suspend/Resume handling for this clock.
Since the ALSA framework typically invokes the hw_ callbacks during
power management transitions rather than the dai_ ones, the SPU clock
state remains stable, preventing any illegal register access during
these transitions.

> As Mark mentioned, it should be optional.
> Otherwise it breaks compatibility.

You are right. I will implement it this way in v2.

> And we already have fsi_clk_init() for clock initialize.
> spu should be handled in it.

> Now, it is called if clock master (A.

> (A)     if (fsi_is_clk_master(fsi)) {
>                 if (fsi->clk_cpg)
>                         fsi_clk_init(dev, fsi, 0, 1, 1,
>                                      fsi_clk_set_rate_cpg);
>                 else
>                         fsi_clk_init(dev, fsi, 1, 1, 0,
>                                      fsi_clk_set_rate_external);
>         }

You are right. Currently, our FSIA is configured as a slave,
so it never executes the clk_init() function.

> I think it (A) can be checked inside fsi_clk_init().
> fsi_clk_init() is now called when .set_fmt, but it can be called
> at _probe() timing ?

Yes. I can handle the implementation/coding side of this.

> Should we also be managing the clock during system suspend, or if the
> power consumption doesn't really matter should we just keep it enabled
> all the time and not worry about starting and stopping it?

Regarding the SPU clock management, I haven't measured the exact
power consumption of this block yet. However, to keep the code simple
and ensure maximum stability for register access (avoiding system
hangs during cleanup), I am open to enabling it once in fsi_probe()
if you find the dynamic management in dai_startup/shutdown
unnecessary.

> This is going to unconditionally require a clock called "spu" on all
> devices using this driver, not just the one SoC you mentioned as
> requiring it.  Presumably this worked at least somewhere (possibly the
> clock is always on, or they're just lucky that something else enables
> it) and this will cause regressions for those platforms?
> This should either (ideally) be conditional, or use _optional.

Thank you for your suggestion. I will switch to using
devm_clk_get_optional() in the v2

Best regards,
Phuc

On Mon, Apr 6, 2026 at 6:52=E2=80=AFAM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
>
> Hi
>
> Thank you for the patch
>
> > From: bui duc phuc <phucduc.bui@gmail.com>
> >
> > The FSI on r8a7740 requires the SPU clock to be enabled
> > before accessing its registers.
> > Without this clock, register access may lead to a system
> > hang.
> > Retrieve the "spu" clock in probe and enable it during
> > DAI startup. Disable the clock on shutdown to match the
> > audio stream lifecycle.
> > This ensures safe register access and prevents system
> > hangs during audio playback.
> > This is required even if the FSI functional clock is
> > enabled, as internal units depend on the SPU clock.
> >
> > Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> > ---
> (snip)
> > @@ -1554,6 +1555,11 @@ static int fsi_dai_startup(struct snd_pcm_substr=
eam *substream,
> >                            struct snd_soc_dai *dai)
> >  {
> >         struct fsi_priv *fsi =3D fsi_get_priv(substream);
> > +       int ret;
> > +
> > +       ret =3D clk_prepare_enable(fsi->master->clk_spu);
> > +       if (ret)
> > +               return ret;
> >
> >         fsi_clk_invalid(fsi);
>
> If it is needed for register access, you need to call it on
> fsi_hw_startup/shutdown() which cares suspend/resume too.
>
> And I guess it need to count user, because we have FSI-A / FSI-B ?
>
> > @@ -1963,6 +1970,13 @@ static int fsi_probe(struct platform_device *pde=
v)
> >         master->core            =3D core;
> >         spin_lock_init(&master->lock);
> >
> > +       /* SPU clock is required for FSI register access */
> > +       master->clk_spu =3D devm_clk_get(&pdev->dev, "spu");
> > +       if (IS_ERR(master->clk_spu)) {
> > +               dev_err(&pdev->dev, "Failed to get spu clock\n");
> > +               return PTR_ERR(master->clk_spu);
> > +       }
>
> As Mark mentioned, it should be optional. Otherwise it breaks compatibili=
ty.
> And we already have fsi_clk_init() for clock initialize.
> spu should be handled in it.
>
> Now, it is called if clock master (A.
>
> (A)     if (fsi_is_clk_master(fsi)) {
>                 if (fsi->clk_cpg)
>                         fsi_clk_init(dev, fsi, 0, 1, 1,
>                                      fsi_clk_set_rate_cpg);
>                 else
>                         fsi_clk_init(dev, fsi, 1, 1, 0,
>                                      fsi_clk_set_rate_external);
>         }
>
> I think it (A) can be checked inside fsi_clk_init().
> fsi_clk_init() is now called when .set_fmt, but it can be called
> at _probe() timing ?
>
> Thank you for your help !!
>
> Best regards
> ---
> Kuninori Morimoto

