Return-Path: <linux-renesas-soc+bounces-24117-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 05186C347EA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 05 Nov 2025 09:34:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9D5F034AEED
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Nov 2025 08:34:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC1C0288525;
	Wed,  5 Nov 2025 08:34:32 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19EFA21CC6A
	for <linux-renesas-soc@vger.kernel.org>; Wed,  5 Nov 2025 08:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762331672; cv=none; b=Ndqori5CR1VgxyAovHqavebi+FANgl2DH4N2t4snXMH3OqLGm7LmA468QyXnFboJnNQaD73B4AMbrOMihTaN34x3k/nVCZzQNeqGS4r2GUlDKpBVXoTqHCrzXyq0NqsNFWT82LN+BAdjYQ6dFlrF9zh3deapVBV8MrsFwiMuJe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762331672; c=relaxed/simple;
	bh=34nlR0Av3gx3vsNVLYrgniOq7mZCBds1+QKg++zruvk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pJFVAzzjdlLPcWZL5iOV3OXAB9/ipuPALmnLMmO/syrwYx2HDj1hXQvugBm3AFaWNpG6O6T55GcaSVmmyEbKpcu8XK3NU7tsTIksuZ6SdyoAKn/QF3sp1gIqXuxZn6NC+HPl4DPqDGsbT6Lrh7tjRoOQltKJKxNQg3NBzQSGN44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-8e352f6c277so1765459241.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 05 Nov 2025 00:34:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762331670; x=1762936470;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4WMJlMq4HlepiSD2fmQ9BHOR0R49VU9iznpl8dol4Xc=;
        b=RoCpqnf96qWqM8KoNIKYOMG/S8mCPvXCGHIhAp5Qo4TIIobEkaxnxuqaPa7mOSssM0
         H72X7QKkjNEUb+uCYbJCUljHHJFtAaM/2CTHjP3qPXS1zQPoVzPlq4bb0sIjldz7qFDC
         XJ5lzHtTQhanrhwMVb4u8x85VaYPlTRG1Xl7xA+RkZw8zO5QGUttVtmzMRTvL4w/78V0
         oTRlGZtGr1OGmanGQ87TkI5IRhITkWcLVrtZhfA13Gn3aCzUQ6/vkq8Zo5CRM/ACEXgH
         ZwDB581TJDT6C35GVuErs3hqNjGhLnSNcBOV0ELMEIjEc8iALgLawHTTTjMHVVtTLAbG
         fgTA==
X-Forwarded-Encrypted: i=1; AJvYcCVFF0uPWFD0ft++E9GbhFf+NX29uoccO4lyK2dckr8n1mSVz0JK87UQbH9570aSrR5p8Cxdqe3AyN/cSRaGspB99Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVIPdS2pbd311XM4596SyiyrfFZ8iW12yREpBaNNSTipo+GH4y
	RS0oT7GErkbbKGCJhMvkjO4twCRJdFP/o8KkhGXCk+lKGI0eyG5qHoAhJQ+QustV
X-Gm-Gg: ASbGncsYQ+l82kdnduxYF3kLboP3kDRwEEpvk2ML4VLkI28g2vzXepKseusW8jpAJZ8
	zyjMJFpvDYVVAWOUkXNMaqu+10glvxzhZVRuGUKeQPHv0AkGGrcMUkPg1U8nlypdY02jF+ArzgK
	BBzIrJ5XrVKeptiKsC9F6iG9zoFY929B5FtJnJEjmfMXCy20aFSYZ5Dx9E+QGF5lVSm6KeTHmAB
	IV0pk9/8cJug1zJxM+43h42b48vdn/U1nrrWtVJG5cEnG3xbw7t5OY7YZ02lH5Excut9DYjaCPm
	lT9eMErxbN4NcTehBHCDNkbmUuzvuRy+0PLhZvJo4ELlOOTNMh6WvOxc+f8OSM58E4/thfi2pzZ
	bYLgy5HHJ5lW8jFIGVi1Yr5iI+8Mb4QRqSnMBykUfk/38SSOKfLtwWm6THfm3xwaOFPzzoFaUd/
	qnFxGPRXv3J/EIUYd0NprctgFzBrU/O/uJnLvWpsF/qvRpXX1hXUk3
X-Google-Smtp-Source: AGHT+IE8KQaH5izCeWyMxCrLhy4L6eHKiWXF5kuhHTvtSxchGuztsWo2NrQCcbylzQKSnuXV4aqBRQ==
X-Received: by 2002:a05:6102:390c:b0:5db:f8aa:3a41 with SMTP id ada2fe7eead31-5dd8920ad69mr714652137.27.1762331669766;
        Wed, 05 Nov 2025 00:34:29 -0800 (PST)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5dbf3358b71sm2071057137.15.2025.11.05.00.34.28
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 00:34:29 -0800 (PST)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-5db469a92f7so2237714137.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 05 Nov 2025 00:34:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUVRfbKKhgdXrytG6jgVsw8BSGD3nspm05HiWcswTodzRko6kR3SOutoGgT9QlUmdrXiw9jvzoP+Y+Rty/mJmhTqQ==@vger.kernel.org
X-Received: by 2002:a05:6102:5093:b0:5dd:8819:e687 with SMTP id
 ada2fe7eead31-5dd8923db9cmr660276137.31.1762331668673; Wed, 05 Nov 2025
 00:34:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1762274384.git.geert+renesas@glider.be> <77f9efe5388f2801ace945b7793d4823618eeec8.1762274384.git.geert+renesas@glider.be>
 <c9646952-1789-42eb-b7d9-b12915f77f07@mailbox.org>
In-Reply-To: <c9646952-1789-42eb-b7d9-b12915f77f07@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 5 Nov 2025 09:34:17 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV_jdCEE_zLfoX0SpfBBFFwFRscQ8tYskTbAK00jJCrTw@mail.gmail.com>
X-Gm-Features: AWmQ_blsUEYyxkjPzCCn1rrSFlAwZ9Tb7iuHmnTuFch7McN-xfZ4ph4p6lEc3A0
Message-ID: <CAMuHMdV_jdCEE_zLfoX0SpfBBFFwFRscQ8tYskTbAK00jJCrTw@mail.gmail.com>
Subject: Re: [PATCH 2/5] pinctrl: renesas: r8a779g0: Remove CC5_OSCOUT
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	huybui2 <huy.bui.wm@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marek,

On Tue, 4 Nov 2025 at 22:41, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 11/4/25 5:59 PM, Geert Uytterhoeven wrote:
> > From: huybui2 <huy.bui.wm@renesas.com>
> >
> > Rev.1.30 of the R-Car V4H Series Hardware User=E2=80=99s Manual removed=
 the
> > "CC5_OSCOUT" signal from the pin control register tables.  As this is
> > further unused in the pin control driver, it can be removed safely.
> >
> > Signed-off-by: huybui2 <huy.bui.wm@renesas.com>
>
> The real name is 'Huy Bui' instead of huybui2 login name.

Right, I guess it is appropriate for me to fix that up while applying,
here and in subsequent patches.

> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks!

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

