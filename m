Return-Path: <linux-renesas-soc+bounces-15141-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F66A76563
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 14:07:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81D173A1AC9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 12:07:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C79E1E379B;
	Mon, 31 Mar 2025 12:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a3Zst3Kr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2DD1D5160
	for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Mar 2025 12:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743422846; cv=none; b=LQAaCDatzEIhnXUn7gm2a7WTEPgobBMcBLeZSbhIy92ffmBdQDir3UYtW+Q3TeR5vJOJ8GtRxPVuxxvW3q1EVijw89SEIHF401YQkPj7uCsGCOaMiFuvk0YChy+J32vLwC8HJ7Awkdws0W43dcezaSz7ZguGU+9QJMdIxpCl3K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743422846; c=relaxed/simple;
	bh=kyAW7V5I4QoMJUcaFceDBhvdgBSko5qmpdEH2omPq+c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=udDduVQXu+8KE7gt3Xa8jF6mPw8XjGT4d61sBBPUaUS2wm9XtICoOF3danPORYSTGwBHGSv71He+w+SVtodK1pt+edRehynsnjtjGLi1k+oitldW/JDEWGrKLbcF60Ud2SMSaRGWDzVvUxIMUiBuf81ZM5DL5jAiP9vTplR4/K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a3Zst3Kr; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6fead317874so34159647b3.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Mar 2025 05:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743422844; x=1744027644; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DTOBUDbdb4fREuG86ilpsm2ja+JISK/4Lc+gQz+8x1k=;
        b=a3Zst3KrxsDPLrrXsw2aZoFrNVYnhcN/6uvzGCqgpGNJmrydBprDlw3YfwT5NMZwq0
         7gBbfbgAWdeQgnB7L6ttJjCynmidTk3cixpUQ1nbORJ+4lcHFLez7K5XFa/9Bp1rjUWV
         sB3INHVvPq5jhXTyHxKlnGudJMpg39w9OfU0XhEXqVV2hwv1RTcmNakCem+E+FuRIZp7
         P4B69F1xoSQkmfaHmioljeZJXhYIIJ2CzHNhKyw4747WJ8zmHggLXzmV0YMvwAacyI7r
         ohUNH/dBMm5gL48zPhh1vqtAc0E5PrnEwQKL5jWuFe0jRIzV/OWw18q9sUMkO7+TVg9B
         lOaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743422844; x=1744027644;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DTOBUDbdb4fREuG86ilpsm2ja+JISK/4Lc+gQz+8x1k=;
        b=S/vAoQCI28JVsnhW39Jmt6UUaKm+s9ruR7b2OCr5A4dA3v+1s6ZXoUFMwkQA3jyoth
         GCCeQb0gMY6wp0GPcLPwYmKIHtRayjULdtytNxd8EH34KpgQqxIwnGHip3ffegHj+H2e
         0gHAce0HDeipwzYGuxufDp7FSdACMPR89OgHCMdJhrsLN6798JnaytUoom3hAR7NWHmg
         pXgNVYPC2w0Txvi4hi+MWMTxj7UzLGjK2mRFcIv159dO2BLktgHF/P+kLu7E4BIwgtMS
         fbvZGEcyjAE2YL72S+a8wbauGixEq1BYu9XNgAW+1UaKgvfVrLjlUpw7It/ZZd3H5HiS
         4Azw==
X-Forwarded-Encrypted: i=1; AJvYcCX9j3g6rTIQvWZQ4WXyYh0WtqD43v2t19VzVFztWwqt1eiKH7oeiCsKDC3z3IRVfE8kIPbtBlRnq973bfqevNDTgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq55OSxrbEB9MpIefdWjNP1o6JpFDMGpwVZrC80+Wfx1CaqnX6
	GaJPmbF4XnrHWd8KfQWKKiSZMCJ85+Cz6rCCA8/T5KAE7wW5j4j9bNp09WKpz6w2r2IUA8X9nu+
	KG7bDJk9BbZmIQUqJfCuHlIo3E+6Kq8OrmfprUA==
X-Gm-Gg: ASbGncvWt27mA9OftUIw0w0ZA3LicagNV49gCEk8Br/CmcvZodbKtKEqPqndX323g/I
	7KysoG4M2U/kubca4H3Ltvsn93Y/bOYSXPKg5WXkMfStxJylMBpo9JmbiedWKbztI+kG+g9IqdC
	p5G6TOLSlZ1Rr5cmvAvT7hLxVLDXFCcy3I9vwmvw==
X-Google-Smtp-Source: AGHT+IHJxRRzUPwJubai0FXDNsYNlzy4L63S2h0wWPnm/GbHWoqjJYDO6RwLWKKP2n0qVCLZPs+jL3aWWO7yw7D0Wu8=
X-Received: by 2002:a05:690c:2505:b0:6fd:a226:fb29 with SMTP id
 00721157ae682-702572f0a23mr109775147b3.27.1743422844113; Mon, 31 Mar 2025
 05:07:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250320140040.162416-1-ulf.hansson@linaro.org>
 <20250320140040.162416-3-ulf.hansson@linaro.org> <PH7PR16MB6196C3AC7A7B7CA99A70E7DDE5A02@PH7PR16MB6196.namprd16.prod.outlook.com>
 <Z-pQj6ynnfMa77fM@shikoro> <CAPDyKFr0MvQDxsi-Qd0F=1KuR4Gy6s5bhVdOXRt9K14Z9sO2Kw@mail.gmail.com>
 <Z-pyfv_7gJ72YWhz@shikoro>
In-Reply-To: <Z-pyfv_7gJ72YWhz@shikoro>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 31 Mar 2025 14:06:47 +0200
X-Gm-Features: AQ5f1Jqf-2SJBYBzTd2vQDS8JECE_B0UrZpDWSB-ZjUCOgJAXrCCC3D2fOI74j8
Message-ID: <CAPDyKFqW92wJ9P5cyO0vcV14dU5Q-JRGR=oKOS362crFy6y2Pw@mail.gmail.com>
Subject: Re: [PATCH 2/5] mmc: core: Further avoid re-storing power to the eMMC
 before a shutdown
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Avri Altman <Avri.Altman@sandisk.com>, 
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 31 Mar 2025 at 12:46, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Hi Ulf,
>
> > > > > +static bool mmc_may_poweroff_notify(const struct mmc_host *host,
> > > > > +                               bool is_suspend)
> > >
> > > Maybe add some comments about the difference between
> > > mmc_can_poweroff_notify() and mmc_may_poweroff_notify()? Like make it
> > > super-obvious, so I will easily remember next year again :)
> >
> > mmc_can_* functions are mostly about checking what the card is capable
> > of. So mmc_can_poweroff_notify() should be consistent with the other
> > similar functions.
> >
> > For eMMC power-off notifications in particular, it has become more
> > complicated as we need to check the power-off scenario along with the
> > host's capabilities, to understand what we should do.
> >
> > I am certainly open to another name than mmc_may_power_off_notify(),
> > if that is what you are suggesting. Do you have a proposal? :-)
>
> Initially, I didn't think of new names but some explanation in comments.
> But since you are mentioning a rename now, how about:
>
> mmc_card_can_poweroff_notify() and mmc_host_can_poweroff_notify()?

mmc_card_can_poweroff_notify() would not be consistent with all the
other mmc_can_* helpers, so I rather stay with
mmc_can_poweroff_notify(), for now. If you think a rename makes sense,
I suggest we do that as a follow up and rename all the helpers.

mmc_host_can_poweroff_notify() seems fine to me!

>
> Similar to the commit 32f18e596141 ("mmc: improve API to make clear
> hw_reset callback is for cards") where I renamed 'hw_reset' to
> 'card_hw_reset' for AFAICS similar reasons.
>
> > > > >     if (mmc_can_poweroff_notify(host->card) &&
> > > > > -           !(host->caps2 & MMC_CAP2_FULL_PWR_CYCLE))
> > > > > +       !mmc_may_poweroff_notify(host, true))
> > > > I guess this deserve some extra documentation because:
> > > > If MMC_CAP2_FULL_PWR_CYCLE is not set but MMC_CAP2_FULL_PWR_CYCLE_IN_SUSPEND is set,
> > > > !mmc_may_poweroff_notify(host, true) will evaluate to false while !(host->caps2 & MMC_CAP2_FULL_PWR_CYCLE) will evaluate to true.
> >
> > Right. See more below.
> >
> > >
> > > I agree, I neither get this. Another way to express my confusion is: Why
> > > do we set the 'is_suspend' flag to true in the shutdown function?
> > >
> >
> > I understand your concern and I agree that this is rather messy.
> > Anyway, for shutdown, we set the is_suspend flag to false. The
> > reasoning behind this is that during shutdown we know that the card
> > will be fully powered-down (both vcc and vccq will be cut).
> >
> > In suspend/runtime_suspend, we don't really know as it depends on what
> > the platform/host is capable of. If we can't do a full power-off
> > (maybe just vcc can be cut), then we prefer the sleep command instead.
>
> I do understand that. I don't see why this needs a change in the
> existing logic as Alan pointed out above.

Aha. I get your point now. As stated in the commit message:

Due to an earlier suspend request the eMMC may already have been properly
powered-off, hence we are sometimes leaving the eMMC in its current state.
However, in one case when the host has MMC_CAP2_FULL_PWR_CYCLE_IN_SUSPEND
set we may unnecessarily restore the power to the eMMC, let's avoid this.

To further clarify, at a system suspend we issue a poweroff-notify for
the case above. At system resume we leave the card in powered-off
state until there is I/O (when we runtime resume it). If a shutdown
occurs before I/O, we would unnecessarily re-initialize the card as
it's already in the correct state.

Let me try to clarify the commit message a bit with this information.

>
> > I was hoping that patch3 should make this more clear (using an enum
>
> Sadly, it didn't. Using MMC_POWEROFF_SUSPEND first and then later
> MMC_POWEROFF_SHUTDOWN in mmc_shutdown() is still confusing. Do you want
> to return false in case none of the two PWR_CYCLE flags is set?
>
> > type), but I can try to add some comment(s) in the code to further
> > clarify the policy.
>
> Please do.
>
> All the best,
>
>    Wolfram
>

Thanks!

Kind regards
Uffe

