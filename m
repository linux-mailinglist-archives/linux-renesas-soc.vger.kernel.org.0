Return-Path: <linux-renesas-soc+bounces-13766-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D0AA47F22
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Feb 2025 14:29:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8922C3B7CBF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Feb 2025 13:28:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0AAF2343B5;
	Thu, 27 Feb 2025 13:25:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130DF233159;
	Thu, 27 Feb 2025 13:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740662754; cv=none; b=MRncN+fZ22QbcEtt14I9bi3bXlnzdf1Q26UBYZ2oYsE+7JQQtcJDGcm9+JZmaIsW3tnho2hOqXJ7eSdezajPkWK7CFB7JaNrE4JObuIouQwvol8o03MB5evIPvqu4YtErYhswVAvOtKWWChZAAbiCY3T/++4HYWf/ctL+f4uoeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740662754; c=relaxed/simple;
	bh=DwdqCeYbWnfdIuTpUusrMep4+F5aUfoz0PuH9YiQa9o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D3Ix6AO9Sav8TKkoQ9VBAlzO7Ya30xeps5KEbIF4X1xIvJ5OffIYtQAwY7CVJ8OvqiIDYynISo4jCaH/tJ3CqkdyTuGgwFopr0qxervI9pjE4y/2uIAYOdxzD3KTNoSv9l2Dh6/MSU2t8Q8+Xy0EfyvR+TTRv5hywth+0qokqMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5209ca3e9a6so398774e0c.2;
        Thu, 27 Feb 2025 05:25:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740662751; x=1741267551;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TgTF9fnQCtZ/1JPDuErDL3hK2IiKktv+/F9Qx31sPmI=;
        b=dXt0cjsdjqJhJ2yl0ZVzzFgT0fnggjI1zRfAwEyHlEVMlaskTRHey+8h1nVwuewzQe
         ue50w5VDwU6cATJKY2PSAeu0mvIa8w1MarsWSSujccElrE9B8KJYJ4ooRlpqrVM6X9f9
         Vg1r7DjeOg+0mz31+gKEiEuG4pFnUtVCJoVVJF33KMWNJWMObJcYtVqbZkXkFqQr5Lyg
         M1IiYL1AP1C3tTSPmK7LS/M5rurDfBfCnTk6o/Fb+fFotaXS8ApSB9MxE+465KBvIQBO
         AWlwSdHAaUoN5iP2nqBwe+ISCL+AJKyK74hPqFVF4g8PBn1KjE4ljR8wV++jUr5s8CPm
         /+Ig==
X-Forwarded-Encrypted: i=1; AJvYcCWd8eZxeHL0uAq3gI6uSKVm7twk0WVtzUtTgPKTce/hL6C9hxXxeLSKw3yagoD9dUe784ebV/O7sluE+sE=@vger.kernel.org, AJvYcCXBzJDUWwYP2/iNerzWjy3V9capLgKGYAl1FIplPGxo5pX0XEtP+shxAjQh9Hq409ij8Djlm3YFCAXrKWxteCRVhX8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdrH5Tqit6dqJj8jk4wbj6CG5l7rYvMndfWs1Yn9U5zSBM6B0A
	QcRSy1qVmfY8L2iiUkaGD6U9jnJqpSQyhxTEADbETO/XWj4qTLi3BJrZ/A6r
X-Gm-Gg: ASbGncvBQIZdwOGRGXu1kLKUmLwHW/7zVoKk1VibJMGhF8OfAN2NMuryEePjb4r+hi/
	yllzSQYoFLDj8qr6draa5Z2EAhPAJFpwuLXl9fQ8aKSFMnnlBz9OMl4PFe17MvJL60swnTMxIQf
	oXANkWXcbHTj7QaGNbUUeQwUOeL8u+95nqcfw0kYVEVCBpY6+bHNA/XW0E6Ib9JefLCNOVSC2DJ
	p7qoGfR+n8hQgXHhUKxFnaTms8/izlP5NdejDHWHyRBG2M4UsWallITJ5in/IkVmRyan4Gnq8V5
	1LE36ds4Yjy80v8WAzs731HwoADpwWYh0w/bOnRDKGRihNPW7mJCkLfB6WPp6K+T
X-Google-Smtp-Source: AGHT+IGgqnMRBh0hS/glWlh+7oc2iWMR1QKA+QosDQpuqhVb7oZotPSSxq47mg+NHrp6gel45FSZaQ==
X-Received: by 2002:a05:6122:1ac6:b0:51f:3eee:89f2 with SMTP id 71dfb90a1353d-5224cbb323emr4339158e0c.2.1740662750727;
        Thu, 27 Feb 2025 05:25:50 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5234bf06909sm233219e0c.18.2025.02.27.05.25.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2025 05:25:50 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-86911fd168dso368985241.1;
        Thu, 27 Feb 2025 05:25:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCULi+4kXvPQy7PDnJs2g82trwcdfaHePmkKaw9NkvbQloXtPNHeYtKS2LDVyV/gbwUaD9LX9rVXaDt09q4nPhhTJgM=@vger.kernel.org, AJvYcCWsfVpfvA1VYlspgvZEPF0ix5/mYpB5fG6P+B/2g1D1I3aZaM/PjbW3OTT71e/iUWW0iLgIOI9CBIT+yss=@vger.kernel.org
X-Received: by 2002:a05:6102:161f:b0:4bb:d45c:7f4b with SMTP id
 ada2fe7eead31-4c01e204103mr4220550137.11.1740662749508; Thu, 27 Feb 2025
 05:25:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250226130935.3029927-1-thierry.bultel.yh@bp.renesas.com>
 <20250226130935.3029927-14-thierry.bultel.yh@bp.renesas.com>
 <fe4ccf6d-bdf0-41eb-bffe-83d459319689@kernel.org> <TYCPR01MB1149252F0825C9BCF6A1B832F8AC22@TYCPR01MB11492.jpnprd01.prod.outlook.com>
 <f134c607-2a03-4ee2-9f7a-befa1e4feb74@kernel.org> <CAMuHMdW1k71gL_OYug+aF=SEkMDuXLy_oLpikahYVcqPMsMbHg@mail.gmail.com>
 <4f737623-6083-4ef9-b7a3-d09ebafa92de@kernel.org> <TYCPR01MB11492DBCAD461B83B3CBE75E68ACD2@TYCPR01MB11492.jpnprd01.prod.outlook.com>
 <c4a44c39-5448-47d5-aeb1-32bab6e57047@kernel.org>
In-Reply-To: <c4a44c39-5448-47d5-aeb1-32bab6e57047@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Feb 2025 14:25:37 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXwMoY0mhG6-u0iVg79zYxAvv0Snrt019kDP+TJoXA5FQ@mail.gmail.com>
X-Gm-Features: AQ5f1Jo-pN5NazOUtBQZzfnaAHBmOkbTZWUZun2zxJCQJ3Pcdx3o1kvUeaCI4V4
Message-ID: <CAMuHMdXwMoY0mhG6-u0iVg79zYxAvv0Snrt019kDP+TJoXA5FQ@mail.gmail.com>
Subject: Re: [PATCH v3 13/13] arm64: defconfig: Enable Renesas RZ/T2H SoC option
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>, 
	"thierry.bultel@linatsea.fr" <thierry.bultel@linatsea.fr>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	Paul Barker <paul.barker.ct@bp.renesas.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Thu, 27 Feb 2025 at 12:48, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 27/02/2025 11:48, Thierry Bultel wrote:
> >> This is fine, I am not against fine-grained SoC-enable options. However
> >> all your SoCs should be enabled by default (default y if ARCH_RENESAS or
> >> any other option which works for you) thus you won't be growing user-
> >> selectable choices.
> >>
> >> Strictly speaking this still will be choice, because you need to trim
> >> config, but all people and all distros will just ignore it  and don't see
> >> it in defconfig.
> >>
> >
> > I understand.
> >
> > All the ARCH_XXX SoC options are already under a menuconfig section, which
> > is defaulted to 'y' if ARCH_RENESAS.
>
> Indeed and it actually cannot have "if ARCH_RENESAS" due to how compile
> test is enabled there.

Sorry, I don't get what you mean here...

> > So I guess that this simple additional change would make it:
> >
> > diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
> > index 91a815e0a522..231880c21aa7 100644
> > --- a/drivers/soc/renesas/Kconfig
> > +++ b/drivers/soc/renesas/Kconfig
> > @@ -358,6 +358,7 @@ config ARCH_R9A09G057
> >
> >  config ARCH_R9A09G077
> >         bool "ARM64 Platform support for RZ/T2H"
> > +       default y

Please add "if ARCH_RENESAS" iff we decide to go this route...

> >         help
> >           This enables support for the Renesas RZ/T2H SoC variants.
>
> Yes and then run savedefconfig and check if defconfig needs this symbol.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

