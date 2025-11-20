Return-Path: <linux-renesas-soc+bounces-24882-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D857C7482D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Nov 2025 15:18:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B2E3E4E8701
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Nov 2025 14:07:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D9D4372ABC;
	Thu, 20 Nov 2025 14:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NX3Izstt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF463BB4A
	for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Nov 2025 14:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763647671; cv=none; b=moWnhHRvVgKVI0wNOvz6DHP0kbfpG/aT0jGYvVLQq4Wh8YrClRGqhuF7c3RjKm9yzISYehSRfUTqI044Ai3u6Y8rAoEdOPWfFAz3NUpLfzK5IaNhjSVOMYszbkradYn1FO913gn9NGRRhMI9Ng8oULCEVWrvrCPpwwL7fDGJIDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763647671; c=relaxed/simple;
	bh=zPjSZ94CNLG87Co8dKmzNKmFn74ftGXglxtJ38De2DE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DUpWNt3p+K7vA1E7GYBn1qj0JZeYqt8bo1jXPsogP9lTy4BewMb/J0UeR3dknYf+yAzuAojh8V8zTr2R4FX/4KlT95o7jjiW5M7U7PCa/v6bFmw7FueQ8O78b0Zd7uuDRacYVCf0KoK6IsqTRqO9ucY0m7YqCWspgWVQnTpPXAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NX3Izstt; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-7866375e943so7585607b3.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Nov 2025 06:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763647667; x=1764252467; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zPjSZ94CNLG87Co8dKmzNKmFn74ftGXglxtJ38De2DE=;
        b=NX3IzsttJ2N8kzvOIqZtTm7iycWOZycBKN5UrApTvqrZbdjSOTuy9mxA29s2WEAgoI
         mBb88kq990yA49Fw/8TmtEBESdDHrQWFSMKcUsN8V0nY3/x1KVwJBCX+5SzHrIE/YwH+
         EXG6qHgDTGnOp0X5YTs1ND+1FV9oGTgG99PXJDPw/ozWJdkhCl4UhxsVu00jnWqZ65PC
         zbobKw5wRgxaDZi7wi1zW4o9tT39LAe744EXRZqEmGhFZTVzGYS28z9j1TyO/HAZCfWi
         S6zeqeYDg1Vk4JX9UqHRbLEGddxD+NTnEmQRwgp1m4FsW0KPZ3EEIo+LRFuu9SQSmmrZ
         +cbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763647667; x=1764252467;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zPjSZ94CNLG87Co8dKmzNKmFn74ftGXglxtJ38De2DE=;
        b=Co0yrkVsw2v0tafyORjPX/eH0s3NHwfF5j+KckzxpuNrkwsxvQiZtVTQ1CDVyPfCSo
         XbOiDB18pKiOyfhCAGNPfVk6ntVEA+jIEZANB6Z7XyTCVtCmQP8QzdVQPq5DH41WQkFT
         6bl7zu/O5L78CSCOFB931KVFkUC0ChL5u3/UANGlYIKpdIP835L1R6fc3E/RNgKi5sfs
         1AjSMw5O+oF0yAF+xk0AN8gQNuYDsoaCF73SqaK6m0zNnsiqCn5tHvx4kssv44n96u1W
         tqBnKxxkCnudSGzyR3gh8mdPVpNmZVeT+ihtA8vGsnGJve+rQh9JQFr8oRqeQHhbbUvJ
         AKYw==
X-Forwarded-Encrypted: i=1; AJvYcCXV3wMG+ooEU7UWypQjPDfZpG2/u3jAmWRQUxEVHSzJvv0vMuK+pf7luQg4L7TyMCmldc9dhbhl74JESwIJGlLCuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzM8xfbEmpNR7UPtwzdMZ0IzE8j1AosD6EFxMDrvBonWSznCMxK
	X484pEd0N1UGfKWtQyLMBKfbPKroZvAOEGgzQJeDahH/mDrhQMdJv/yYLI6KtWGp4n2y/VH4909
	LvOz3cTcOE01pGrAe3kE3aRgLrxICWr5XQat+BGtZPA==
X-Gm-Gg: ASbGncsL/4dGmGnUo0Za3YR1HD7Cq8rmbrmoiajchnRMZthC0032dFleucG+T8tT52M
	k36zoXlewKfgZYAff61h2Es5c4b/ms+A1psUKzpOzCVR3kOadEodYcmCQF8JHDXCWx47Iy7jeuH
	3Fgh5QCorb/LUMQCSrYTWBYCRxuCb9DS6D2K8BMkuenVXmslYs/6FfWbiPiBwRQY4DwFQz8Hu0X
	ZNW+aTrTswFg9FtsFHunpyrmrt+3wtbwM7dm3Z1MaDOZ1au9SL23a+H2fpGtNf6hDoWlZw=
X-Google-Smtp-Source: AGHT+IHvMQfjnGMOjW7vW3sZWEW8qjVMXpKxefI37CvUYXCFXEROenQqfDOoQIoeIU/ss+8Pk88rI7K0bbXf64s1ZJ0=
X-Received: by 2002:a53:d001:0:b0:641:f5bc:68d9 with SMTP id
 956f58d0204a3-642f7a682f2mr1803616d50.70.1763647667453; Thu, 20 Nov 2025
 06:07:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251118-mcde-drm-regression-v2-0-4fedf10b18f6@linaro.org>
 <20251118-mcde-drm-regression-v2-3-4fedf10b18f6@linaro.org>
 <20251118150128.GB23711@pendragon.ideasonboard.com> <cncl6nwbr6fu3nvhz2y34ou4geqzo7hjf3wpukmm4t6utvygor@t2v4smey5ful>
 <CACRpkdYh9nSBtqU_8w5gnkWOc+Dw7fW3tPinm6JjfXMbdEJOjg@mail.gmail.com>
 <5zo76nnejrinmf6snaezld5ylfvk266bwyxg3phdhtg74z43pu@kub3r7tvz7vc>
 <19fc5a8e-999c-46a0-b755-0bd09fe84d92@ideasonboard.com> <20251120024523.GI10711@pendragon.ideasonboard.com>
In-Reply-To: <20251120024523.GI10711@pendragon.ideasonboard.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 20 Nov 2025 15:07:32 +0100
X-Gm-Features: AWmQ_bkTm3pm4AZxXZawzpHvNOqx9Ph_uoWV_Jgh7iWmnUYFQI-EXzxFar9QfVk
Message-ID: <CACRpkdbE0VXLF2Gui6WRGke+Dt=GQLqDDebRJ-ug-rC4NO0UAg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/atomic-helper: Add special quirk tail function
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Maxime Ripard <mripard@kernel.org>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Aradhya Bhatia <a-bhatia1@ti.com>, Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 20, 2025 at 3:45=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:

> > But I digress. I think initially we should just look for a clean fix fo=
r
> > the platforms affected:
> >
> > - Add the implementation into the drivers?
> > - Add helpers to the core?
> > - Add a flag of some kind so the core can do the right thing?
>
> drm_atomic_helper_commit_modeset_enables_crtc_early() would be more
> cumbersome to implement manually in drivers as most of the functions it
> calls are not exported. drm_atomic_helper_commit_tail_crtc_early_late()
> shouldn't be difficult to implement in the MCDE driver.

But the second patch patch adding
drm_atomic_helper_commit_modeset_disables_crtc_late()
would be needed for symmetry.

> > I made a quick test with the flag approach, below. It's not many lines,
> > but... Ugh, it does feel like a hack.
>
> Without seeing the code I can already imagine how this would feel like a
> hack, so I agree not to go that way.

It seems we cannot reach consensus on a regression fix that doesn't
require large re-architecturing, so I'll go ahead and propose a
revert instead, it's the only sensible thing. I hope nothing breaks
from the revert...

Yours,
Linus Walleij

