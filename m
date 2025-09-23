Return-Path: <linux-renesas-soc+bounces-22205-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 05286B955B0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Sep 2025 11:59:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4CD83AD10E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Sep 2025 09:59:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C4DF320CC2;
	Tue, 23 Sep 2025 09:59:46 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF972798FE
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Sep 2025 09:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758621586; cv=none; b=nd6P+G4GaS3mFOYz8iYUAIXogFRWaW+gHv85h4rOPHPEM0a/4ziedElPbLVb77XHbsKWTMIimEhrmPLAsMbaS5pid5QMqTpnqJ4wGmuDJSkK0PzlBXIOSQAcEsHgBQx77/Dk+Dbeg3owHgcnm99dUtYOKsLaGgEjpT5D2EE7Rgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758621586; c=relaxed/simple;
	bh=UngJ0Rhljc1gSU7wLJptkJ9TDFmikWFZOGAOtnzQ0Ho=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KM+CEKeokg2GhYixgJO9kMGcGy+uGEg1ui/uvpW5WS8NE/pTMyL8872OR+f5HPeCq/PQIRmlMBgF9m7uRmjTe7+pGTefezhX+68i1dndGkVyLjbvXrVL8PBw549Hc1xPtHXK4z72AzWRXjzDJm8klLK1FSk2DL9O+NFRrcaIHCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-55ae619545fso3385189137.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Sep 2025 02:59:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758621582; x=1759226382;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rnoTjylvxrxdgkjV6WJ+aZ2BUNyHdjRUjdJqPB2kS9E=;
        b=rj6UpKRD8L2p6Rk3dp45+CiEKfVwAmQ4z215Pw0eemSLhxTSaAlY81dhy6yf33W2KF
         R4HYBS8UOyAojRBmBbhacpVu2gfnrNATsmzx0KXXju/0cfCeKF6vpFkalB8RlsU48K3X
         SlS6dOOVzu9hfAWHrb+FdwzuzDU8rubspFwKi3nEcOQw4bxNaLlS8oPYFyLEoQV1Tfui
         VkwwzFLG0ze3Ek+hRdMSv2cvwVnDH3sVutz4h7+IBmvbh1DY2dVKoXeTJG8X7fE6z8DK
         uur+yd8j0o0zEx8GAVAuZjW03nWSRehTYlIo05BKB1FmQAtwDdrK0S2RW/mkIjMUVyn8
         eMiw==
X-Forwarded-Encrypted: i=1; AJvYcCVpSqQe/vnSWIKdHBW9eJpX4eAjfqKh8UscVJ43cqilJJd14ASviM0v0LGPSxa1vNLVgnSqJvxR+Ps9If8jM8I5Ug==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjeyBn6qRc60t2UYhRwBFnkL0YhCKOT28KeQ5iWNX8k4kuJXqp
	IpO3MdqGKbwxe+pkRitiCWMhHS/64QToC8azZj5Qbt7ZJzp+i97u6+pgTVuYSG4k
X-Gm-Gg: ASbGncvyyHVr9pzbennRiDRODyUE7422fE0ksr63PSJvtaBrGHdfRh2XEOGh5uCjvwN
	rAIkUiHnIlG03wsb+2TwW0mAeBhFn0MDjgUI3KoR5GmplcYpXPIzKw1tfmCuUuGP0dUzCkylvEL
	wTmiTOACVu9x7HJSvzAY4iRjSHyEHN/8sBGvrF3AfrIECQAt3Jmbj+51/uedwc2Kzwsb1ywfr0x
	HFIatqpr6zvFm3/JviuQ9PkoMZ0KAiRYjEZ3A5RTkODJim+uXX92IF2NOUS5JmnBwmGulW12gQ0
	hUxKsdfdaI7CKrAsieou/ISvb3ZV1JaRpmcLr8L3kaH+z16vOjpycSRKeYdGXXDNCEH1SW1V/1B
	4HJ4oWe0bz23x2ZOwSFWxP41Kk/HIvS1CRRkj43D1YebSSF2C0E6+2fTj8KUv
X-Google-Smtp-Source: AGHT+IE6Pj0W7SFaWNsa7Fseu2GelSpuI//abvlJMlV8MXM/eMRqj9gEI3QKyGTK9v66LDYIXUNsvA==
X-Received: by 2002:a05:6102:2ace:b0:519:534a:6c50 with SMTP id ada2fe7eead31-5a57c942471mr782096137.34.1758621582206;
        Tue, 23 Sep 2025 02:59:42 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-57a0267661fsm3993509137.12.2025.09.23.02.59.41
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Sep 2025 02:59:41 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-557a2ba1e65so4794129137.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Sep 2025 02:59:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVeiEduoepzObjwsti9sJjRulNVA6APoPe9EBTQNJoJiFYSHl5QWSsgmbMf/mHGHDaCN6jzYfODQFaLodaDpANHTA==@vger.kernel.org
X-Received: by 2002:a05:6102:a4a:b0:59d:6be4:5b97 with SMTP id
 ada2fe7eead31-5a577be934amr649174137.5.1758621580798; Tue, 23 Sep 2025
 02:59:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250923092846.74517-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <2025092311-espresso-collector-5f4d@gregkh>
In-Reply-To: <2025092311-espresso-collector-5f4d@gregkh>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 23 Sep 2025 11:59:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU_UXyAaeriz8R0MO5SpWE_z4s8Ci6CEMFgVJr_XxDZzA@mail.gmail.com>
X-Gm-Features: AS18NWAf5t3cNSnr0jhWdIdKjaw8kVZxFdQZxsA5_eTxyzisEh79rb7MSnHdO50
Message-ID: <CAMuHMdU_UXyAaeriz8R0MO5SpWE_z4s8Ci6CEMFgVJr_XxDZzA@mail.gmail.com>
Subject: Re: [PATCH] serial: sh-sci: Add missing header guard
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Prabhakar <prabhakar.csengg@gmail.com>, Jiri Slaby <jirislaby@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Greg,

On Tue, 23 Sept 2025 at 11:51, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> On Tue, Sep 23, 2025 at 10:28:46AM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add header guard to sh-sci.h to prevent multiple inclusions of the
> > header file.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  drivers/tty/serial/sh-sci.h | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/tty/serial/sh-sci.h b/drivers/tty/serial/sh-sci.h
> > index 951681aba586..22f877e2a17e 100644
> > --- a/drivers/tty/serial/sh-sci.h
>
> Why is this a .h file at all?  It's so small, why not just put it all in
> the .c file and then there's no need for it anymore.

Until commit e76fe57447e88916 ("sh: Remove old early serial console code
V2") in v2.6.33, it was also included by arch/sh/kernel/early_printk.c.
Those days are long gone, so the time has come for assimilation...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

