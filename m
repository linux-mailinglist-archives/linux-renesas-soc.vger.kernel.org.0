Return-Path: <linux-renesas-soc+bounces-15237-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 555BEA77A0C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Apr 2025 13:51:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 83CC018846E0
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Apr 2025 11:50:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8A7B1FDE31;
	Tue,  1 Apr 2025 11:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fUDXbtE3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3795B1F3B97
	for <linux-renesas-soc@vger.kernel.org>; Tue,  1 Apr 2025 11:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743508239; cv=none; b=LjiN3I9qL+xngq+kUN94M3BmBl74/M802WWu/1mBA+rtigo4EG0rnwP4mkf2jQfNbSoqUvgoxU2fi1XyhBol80IgUS+ZZijKp1EomDX96aPFQdjoecUZj8QD0a+BjD9Ofi0FLksNSclbzv497advaFraTFlVOen2ODWanSeqZdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743508239; c=relaxed/simple;
	bh=Qxf7pul0wUbk0fSwy6plIWVWNrFDzhqa5xEHRCSsU98=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=cZytWMb7RGa3ZJFJApgWM2j7oj3rjP3lAbqeVp4hQkN11JALRhhPsg2iUey+/rXnFvk7pFmjns+p9JfeeNwt2l+RoT+WREL5MBuTZ7gSuKfGGh0bBRKUTwoQdFgYM5mZAIwg5KbTBL/OgMKfh+QJsGPufdAmudmvCU5Kskqcrnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fUDXbtE3; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6ff1e375a47so48882747b3.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 01 Apr 2025 04:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743508237; x=1744113037; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HOgeifCPueURI4iZ+PSvJq0F/yvoGRM/ptjc8joEL44=;
        b=fUDXbtE3ZewZhxxomie3dorFzWVM/B/P5sTzgNGamUmpEozl6KGQYVha1BEIBKTckI
         5b+FTTQUuBFgqbaNjLaeXRzkkSvSzK0j0aCzSR6nvrBtrt/YAAS+gXBon4CE4YLV8fA6
         k4QbaaxoIRyHaVmD+F2XXQnFAncH5vGao67t1Qy6vPJTZux8RiqnKPMNwwjXrn/aZmP+
         6mJetVf4ngHTQaCwOmsnbnMO+knQ3/N4SGvkzS1sIkIdjOlBeQPcUU8oBjZjrZuJMDv2
         BBBDsTyNflgudGgvjOgwneKMyxg1GyB1Di+v8AR5R79vVOLMbf62nbkrtQRPOgdV/Vd2
         BnsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743508237; x=1744113037;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HOgeifCPueURI4iZ+PSvJq0F/yvoGRM/ptjc8joEL44=;
        b=XUphTfR4ErZpBtcqHRdYG9VkUOVu2/Grfvh5l7om4FgUhegrHH1O55UHgk567umwXG
         3y/aBtqmlqOoz4cqWq1Df9pSqKiikyqIsZ8yzYK0mf96xU61mQ9tl4ruYMg0CVUuKxlz
         FeZ7+Lv3NA7DizTej2D1vJzYSEemeg7n//WETB7h+9vzRKaqix9UWYfCiwKaiPSG0BsA
         zIibSlsDAF0fpvX8/5feTx7pdq64Iv+Yvt6dBQ3sh+MtKpzx14P5wd80RtSIARVdn/x2
         fca+VcE8aDnf7gAdlgqjGcUvOVQULy9DL29riy9a1iw675do89WMNULNktTmbmVWcabN
         Cppg==
X-Forwarded-Encrypted: i=1; AJvYcCVPlAVUbBEsam1LF7Yyg8aicI18FOBm9/WC+geHqkfFbdv+iVclM+ENR4E0G14z40Cm+7t/V107uOgKnWuoicFWPg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxebyWZ5bgIV+2JT6+r7eWIQHEbvwP65s+mY5kemQ7qzfJLwcyH
	M7PaM3TtiSs2b5IvdPiq9KtRD40N/8d8fhAOoq4MXwWleJ1kSDqp8tuNnFAqTyPcqdRK389tHIC
	4/oBdfM42SExGV6kA8KcsrHL7SxFL9fbTxoEkVQ==
X-Gm-Gg: ASbGncsPOGEVcBdoVYzZh9y/nUw2Bdyjfmq8yJIir9v7aCgHdTLVeWlFeGQQvYR3/jw
	B/JGhd7BgZve4OymrtwiPRX/4hlU66/iZEMWjF0MAAO38F7WxXzjQwFsllOrrdSY60HSMzrMtjO
	ByRd47z+4Ju/vT8sC1ZqCb5MpBQatR8WiypHPGrA==
X-Google-Smtp-Source: AGHT+IEccr3CCj7xmEQlHsDfauhpuJ3bZ5uaub8hZq7c6Tbl/9LjElpjGlbWImSrgrcDwT40VZjgNc2LpyX75ImC3eM=
X-Received: by 2002:a05:690c:6f85:b0:702:4eb0:6af with SMTP id
 00721157ae682-7025734bd0emr179109817b3.31.1743508237063; Tue, 01 Apr 2025
 04:50:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250320140040.162416-1-ulf.hansson@linaro.org>
 <20250320140040.162416-3-ulf.hansson@linaro.org> <PH7PR16MB6196C3AC7A7B7CA99A70E7DDE5A02@PH7PR16MB6196.namprd16.prod.outlook.com>
 <Z-pQj6ynnfMa77fM@shikoro> <CAPDyKFr0MvQDxsi-Qd0F=1KuR4Gy6s5bhVdOXRt9K14Z9sO2Kw@mail.gmail.com>
 <Z-pyfv_7gJ72YWhz@shikoro> <CAPDyKFqW92wJ9P5cyO0vcV14dU5Q-JRGR=oKOS362crFy6y2Pw@mail.gmail.com>
 <Z-uM3aRHJ_8bwu0W@shikoro>
In-Reply-To: <Z-uM3aRHJ_8bwu0W@shikoro>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 1 Apr 2025 13:50:01 +0200
X-Gm-Features: AQ5f1Jo07Glme3B0Z5ezvlFDATG1bBux2mgX6GZTlztytvrlGC2oFJ5S_fWro3Q
Message-ID: <CAPDyKFqf3K3-gv2+7yORw3nqxJ5bnFbCH2yB+E8=XOGuYuVsyA@mail.gmail.com>
Subject: Re: [PATCH 2/5] mmc: core: Further avoid re-storing power to the eMMC
 before a shutdown
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Avri Altman <Avri.Altman@sandisk.com>, 
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 1 Apr 2025 at 08:51, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Hi Ulf,
>
> > mmc_card_can_poweroff_notify() would not be consistent with all the
> > other mmc_can_* helpers, so I rather stay with
> > mmc_can_poweroff_notify(), for now. If you think a rename makes sense,
> > I suggest we do that as a follow up and rename all the helpers.
>
> I vageuly recall that the commit I mentioned below (renaming hw_reset to
> card_hw_reset) should have been a start to do exactly this, renaming
> more of the helpers. I drifted away. Yet, I still think this would make
> MMC core code a lot easier to understand. I'll work on it today, timing
> seems good with rc1 on the horizon...

Alright!

>
> > mmc_host_can_poweroff_notify() seems fine to me!
>
> Great!
>
> > > I do understand that. I don't see why this needs a change in the
> > > existing logic as Alan pointed out above.
> >
> > Aha. I get your point now. As stated in the commit message:
> >
> > Due to an earlier suspend request the eMMC may already have been properly
> > powered-off, hence we are sometimes leaving the eMMC in its current state.
> > However, in one case when the host has MMC_CAP2_FULL_PWR_CYCLE_IN_SUSPEND
> > set we may unnecessarily restore the power to the eMMC, let's avoid this.
>
> Oookay, now I see what you are aiming at. It seems I got the PWR_CYCLE
> flags wrong? I thought MMC_CAP2_FULL_PWR_CYCLE_IN_SUSPEND is only a
> subset of MMC_CAP2_FULL_PWR_CYCLE. The former can do the power cycles
> only in suspend, while the latter can do them in suspend and shutdown.

Not exactly. In shutdown we don't need specific caps. The card will be
fully powered off no matter what. In other words, it's always better
to do poweroff-notification if the card supports it.

> So, in my thinking, full power cycle might also have the eMMC
> powered-off during shutdown. This is wrong?

See above.

>
> > Let me try to clarify the commit message a bit with this information.
>
> Whatever is the final outcome, it needs a comment in the code, I am
> quite sure.

I will add it!

>
> Happy hacking,
>
>    Wolfram
>

Kind regards
Uffe

