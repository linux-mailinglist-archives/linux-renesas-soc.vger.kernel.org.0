Return-Path: <linux-renesas-soc+bounces-2609-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A60E8511FD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Feb 2024 12:17:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 198601F219E3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Feb 2024 11:17:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C6073986D;
	Mon, 12 Feb 2024 11:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Flmbgik0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1979A39843
	for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Feb 2024 11:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707736664; cv=none; b=ZIVQa7krNw/TzGTZq+tmOHCunfhtAmb/LLjIiR+msOgveLs38QT6mRfyPR8DopyKfvMg/xVeTCzhP52cK03M8dIRHRi5K15WWya4aIY1wS+kUvYmyRv7UgvuehUklRBhtm2Pn8dhgJRcXPkPYKDUhJyRF4dPJR0HnkmFWAIRgl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707736664; c=relaxed/simple;
	bh=6OuJxan0RO9Rm8CnHzNnBl9DKAywxvgH9Eco662MVcs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B4T5gpaT0KXRH0xVmLJMibeSr43vRsvhs/CM1RuQzh92uN0pCatbbI6mWOFPY0wo8ZqSGTZEjtuYGEoQUnKLiGzFEIxiycIKzZ173mlpvpxrRQzlgJIKnywb867YNgdtdC0+tBHKPtx4+t//lkrHfWIJkIvqf/7KF/v62FqUwyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Flmbgik0; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-604b2c3c643so24614237b3.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Feb 2024 03:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707736660; x=1708341460; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eXlnIB6w3EJyUe2smpgvDwHTN4H9326dG042toXH0B0=;
        b=Flmbgik0+EerQvJble09ihH1iXL/+PRQirW6gTCoe3MWE69aDs8ZWdwvN/J4/Wphie
         5ayPzw5JhOjYYm3y0uFR7cehKSgee0dRQ61Ci5myK0GM34c5Sq6ospJIPHwoC/X+nQ/w
         M8GgbySOjpin6Z9JdM7ZTLHTyg9lh8wlnT3RpPrqo32LUKDjOnLbw1mAv7OKrAc61pvl
         X0WoptTWRxnz6dIuM5p2bUFePFe2mG86DFHb/c8aUvBCBLmxf4W94tqZrsVKXlhUCkvp
         21lh7llZcRkY/rz5JSOqK+/p3cMZgxhFucPqroAx5EM2G609URoPOoMwEblolkeyk5BX
         FCxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707736660; x=1708341460;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eXlnIB6w3EJyUe2smpgvDwHTN4H9326dG042toXH0B0=;
        b=tYeDX9mk8K+oXcl3QC5tw1n2QdlP6XrDzd8R4T4iRTQ0F+uwAZ6bu7YeKs30UN36ZA
         vT/Del17A1N0AskGO6VpiUvWhQJ74hBjdh94qRL4vYX2ShgK9QFL7pdF8fsahe+NNM2E
         nlA52MmZ61i1h6lPnOwHDHy4oEbUf8KO0MeIJavI8B5yuTuVPKwmB+HMJ4zaDGQrsVcO
         ROuXWFxFaixtHqTCbXpuhm3e50ZagAlbzvnZnKtwtUDSVAy5F3wphd7MTga0gDYYjEpQ
         UVU/DgomBuOuQi4aNeENHOHPEpBLyqoXKE5Zn+MHp66/c3qewbZWvnLu9G5JD1GHXdJZ
         vTpw==
X-Gm-Message-State: AOJu0Yxwlki7kPQ+qvnncviPDq30nuLFnuQGhuJfWq6FwTbOlmCAEI3x
	drlHbldiHBNuKmNgfNgABD7pFtP1X67JFJz0cmuRDYNvQkKuxGib5PMF9LOTbJa0F2wjMQQuc3w
	PA5ob0sSLfFO0E+o5JnrN61VGQOZfwex+bLEYXQ==
X-Google-Smtp-Source: AGHT+IF9GDNEuttfYlVQrYI4s7jFX4gNI1ltABl5lKf9BO7IINBP0fJdXEuiOWk54w0rp1fb1PQs/TlZyxESPHS3Pa8=
X-Received: by 2002:a81:920c:0:b0:604:9729:6b49 with SMTP id
 j12-20020a81920c000000b0060497296b49mr2924236ywg.5.1707736660068; Mon, 12 Feb
 2024 03:17:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240209015817.14627-8-wsa+renesas@sang-engineering.com>
 <CAPDyKFpmfgwJ5dJFmORhg1tBewzhB_jrWikpX=b23r-joN91SA@mail.gmail.com> <20240209132837.GJ689448@google.com>
In-Reply-To: <20240209132837.GJ689448@google.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 12 Feb 2024 12:17:03 +0100
Message-ID: <CAPDyKFpho16DU7OorMgXDqiyfFfgM_tWu+DZZOHd0gbjtBw_Cg@mail.gmail.com>
Subject: Re: [PATCH 0/6] mfd: tmio: simplify header and move to platform_data
To: Lee Jones <lee@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-renesas-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-sh@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 9 Feb 2024 at 14:28, Lee Jones <lee@kernel.org> wrote:
>
> On Fri, 09 Feb 2024, Ulf Hansson wrote:
>
> > On Fri, 9 Feb 2024 at 02:59, Wolfram Sang
> > <wsa+renesas@sang-engineering.com> wrote:
> > >
> > > The MFD parts of the TMIO have been removed by Arnd, so that only the
> > > SD/MMC related functionality is left. Remove the outdated remains in the
> > > public header file and then move it to platform_data as the data is now
> > > specific for the SD/MMC part.
> > >
> > > Based on 6.8-rc3, build bot is happy. Branch is here:
> > >
> > > git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/sdhi/tmio-simplification
> > >
> > > I'd suggest this goes via the MFD tree, so the series would need acks
> > > from the MMC and SH maintainers. Is that okay with everyone?
> >
> > Wouldn't it be better to funnel this via the mmc tree? In that way, we
> > can easily avoid conflicts with additional renesas-mmc driver changes
> > that we have in pipe.
>
> You could say the same about changes SH, MFD and Platform Data have in
> the pipe.
>
> > Or perhaps there are other changes that make the mfd tree preferred?
>
> MFD is usually preferred since the parent device usually lives there and
> we are well accustomed to merging multi-subsystem related sets.
>
> It doesn't really matter how this is merged.  The only stipulation is
> that whoever applies the set does so on a succinct, immutable, tagged
> branch and sends out a pull-request for everyone else to pull from.

You are right.

Although, in this particular case I thought it could make better sense
to use the mmc tree, because 1) we are only removing a header file
from mfd and 2) I know we have other renesas-mmc changes in the pipe
for the next release. The point is, I wanted us to avoid the need for
using an immutable branch. But nevermind.

>
> If you want to do that, there are no complains from me.

Well, it sounds like we may need the flexibility with the immutable
branch, so I suggest we do the usual thing with the mfd tree.

Please add my ack for the mmc related changes.

[...]

Kind regards
Uffe

