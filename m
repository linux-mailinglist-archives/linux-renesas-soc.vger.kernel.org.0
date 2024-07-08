Return-Path: <linux-renesas-soc+bounces-7160-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C13D929EB4
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jul 2024 11:11:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D1E91C2160E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jul 2024 09:11:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0B20219F3;
	Mon,  8 Jul 2024 09:11:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF33AD31
	for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Jul 2024 09:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720429878; cv=none; b=ohXPAUp/C8O4EURxxQWqyColeIOJetidAarKdLM5nyYPQpmK/Aku0zSRfe2EEtGHshEAR7886l8KOtXpJklLmsnYlbsGq4dUDkp4hEefVjhJhED8gzGXsspsk1SonPD1FWDqdyLhw8XPQy/Mit/HWyHfYZIAM5xGymscn7a7QTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720429878; c=relaxed/simple;
	bh=0J9o/iajrJn0fswXZd3etkfMDHQ7sa9xXjKn6am5Iu0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cmAs7zWIqTpOXlaSZAM23gQTAS2g+1AR1FZbiBu1OHcTvqyqWDq+UhusePm2gNw8mqoWraQG1J16wDU/5GYTlSy4fQK95H5/ZthgdAO5aRPWtIcqCfabhoaQ4iGP6MncSZT7/sHVhSqpld3bxnbnUaOjVm90O/vrghKIEdx2Hz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e03d49ff259so2320825276.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Jul 2024 02:11:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720429874; x=1721034674;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+26DeDF78WoLLiEz1PmqGvuNHmocCO9aokey/X9KA7M=;
        b=bvXzLsR8818oB2lOLj95fRd2zqiXVKvVdc+xh4x7EPY4ZiYwfrYsHI1o52zjYlEP/i
         CIqcNnaeHk/llE1/hCtOcAfIUyl2mpUloc4qLSz5nrgufWMIF5Z1XOtZbGeIq5vEQhmE
         xgmffh1M4SgJFHALvYHA7IfgrQSh/wx6fhH37+dmsOL9PxakCkvCGU4NC9Xmr7cVgYT4
         gCSW/+Iig+KMnUE0wmewU22TXNnMeR29VyeZcUyzzuTWFrOQ5MF1GCDNebo3216A1cQZ
         wOoazoy7TdD2+ry2MOXBOOCkN3Mt62oTMN5l5hpmDQXLGxA9Sh03mnj7/DG9PANc9Uik
         Lr4g==
X-Forwarded-Encrypted: i=1; AJvYcCUou10DtJcbe0haPwSTCwQIlzbPbXjHC4ZDXxVKDYMOackRolW9MSq1vNzMfL2a4o0AhP/s992LxV0eRld4JIn4dlUiRBybwDX59x67BlGNpBA=
X-Gm-Message-State: AOJu0YwLfw6362UuGH9SAF7Zemz66qfA0tkdgub5P4jLIf/EgWIksc7B
	tlM0HYNTAZkkXgprETB/TV5Bm9OmrSIhU0TtrSYkUq8ZeZd7lDTPOivhMonk
X-Google-Smtp-Source: AGHT+IFdJw8Llxbl1FoEFkYypTSvWO+cDgA988P6ZDCygYEgCoFkQKLBGpvSLadQkOJUJss3J488lg==
X-Received: by 2002:a05:690c:6209:b0:651:57eb:57fe with SMTP id 00721157ae682-652d5d0258cmr118613517b3.17.1720429874272;
        Mon, 08 Jul 2024 02:11:14 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-64a9a70eed9sm37449147b3.61.2024.07.08.02.11.13
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jul 2024 02:11:13 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-651961563d6so28343427b3.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Jul 2024 02:11:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXu9LAhqLZufodvqT0SfO0znzz1UlHy15XvGcgtf9qGrn64mXMUFmYw69LtoNOD7Advn3fOElDtf06z1zuV4V2Y6oGLadoc1Kpy1tyK78Z8YaQ=
X-Received: by 2002:a81:c20c:0:b0:651:6cf1:76b with SMTP id
 00721157ae682-652d5e0088bmr90434947b3.22.1720429873380; Mon, 08 Jul 2024
 02:11:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240708082220.22115-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240708082220.22115-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 8 Jul 2024 11:11:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW4jmGDa=Ns-BCptyg0r-SydjUq_DVCCD_ELTHm192Fuw@mail.gmail.com>
Message-ID: <CAMuHMdW4jmGDa=Ns-BCptyg0r-SydjUq_DVCCD_ELTHm192Fuw@mail.gmail.com>
Subject: Re: [PATCH] drm: renesas: rcar-du: rcar_lvds: Fix PM imbalance if RPM_ACTIVE
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, dri-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Mon, Jul 8, 2024 at 10:22=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> The pm_runtime_resume_and_get() returns 1 if RPM is active, in this
> case it won't call a put. This will result in PM imbalance as it
> treat this as an error and propagate this to caller and the caller
> never calls corresponding put(). Fix this issue by checking error
> condition only.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch, but the code for pm_runtime_resume_and_get()
seems to disagree?
https://elixir.bootlin.com/linux/latest/source/include/linux/pm_runtime.h#L=
436

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

