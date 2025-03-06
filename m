Return-Path: <linux-renesas-soc+bounces-14088-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F30A54E4F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 15:54:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6993D7A1999
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 14:53:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8970816DEB3;
	Thu,  6 Mar 2025 14:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IbEWhMXn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DEC502BE;
	Thu,  6 Mar 2025 14:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741272838; cv=none; b=Nt1pJlW4MhTmvXyqUgFWq67FziJDaRn45ZxIUBPTwrXYh1FjRiCMt4c5+RLt5UXHm6xU6owAyp653z/e/7fh081nNMaYyFWXJSQjkjm8fOG2H1vZUrWXg2KdvNINqo7HW2JPu2V080siRgBexNK+tBb5yz+Hdx09mR6g/Rg/GCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741272838; c=relaxed/simple;
	bh=L43l5L0aKGMhRPcDQJ0/CC8lI+T8jjg5nrt/2iFPsvQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sk0FLAOBubSALc4Mhk3vhzVQSUGaBcgDaz8d7x0bJlh8yEJM09oqvsl7+m9c1XwP4Dh7422QwJRTfWCSoKNpbJprpF9/tJiSYkrtnXsBkaKFap9kL/JGnVuF7ssWzoXP3BPlpmAna1JPI7N1aDzwT9j5CUZhx7WZfz1/x1f9Qi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IbEWhMXn; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-867129fdb0aso660683241.1;
        Thu, 06 Mar 2025 06:53:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741272836; x=1741877636; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L43l5L0aKGMhRPcDQJ0/CC8lI+T8jjg5nrt/2iFPsvQ=;
        b=IbEWhMXnK07h9WJ8Mk86Z6h3jBUTJrwZLJOTYflq8cUzvz+v8gnuMCnofG8vQYLj8a
         ZsWt1MKqPR1CpvmLJwWO/IFJ7i1C98pYGlB9p9RMZtSphPj3Aq0H9da4wvwOrnlP3WU2
         687Ol+GslPf04FHDBdZmkUUqHdgfMUWhfKzUPTfKVDI3G9TZXoa3BzFWY3/9gQ4rtkdW
         8eR0DeQG9Kf3AgcBsQuu/xDG2hAexR6G2jDPsz4lBQNUzx1Fu4r+v1/dP9cEOEZWybLE
         nSz2uT2R9yjvTpM0O7rGnO0v0EoadK4k2vP0gN6Fa0GFJAFwyy7TVG3elaT8/AKcBOgj
         yf+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741272836; x=1741877636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L43l5L0aKGMhRPcDQJ0/CC8lI+T8jjg5nrt/2iFPsvQ=;
        b=hvanAqEKEcF16/CCcr92YMrcnWA4qoypDHTD2AOzjYiCAyBwTrALBdZFe4GJONS46D
         9kwgTdeCRuopQnzq4DLl++6Ckvrn3yY+NvXjMP+TLymzmuMI6qPy0EkcGB10Avt6GIhq
         CRwKt7wPmmGPRTDiCMtRRRNnyRovS1dCN+dlXp34BdCSSDik0BzEwUyXg3x/jtr10TSY
         WObjgWSZNyFmXaSQ9fXvf2M8c4H5rZG1QUhF5/zpn/gy9eUpYp7HEcgynj2qZ3iUbtGd
         VIjO7/GhCHKf8doiJLoDofz6TY6GB5q4C6MpteKTU6oAwx9a+/kGJF4wxg6w8KW3qlZv
         xPVA==
X-Forwarded-Encrypted: i=1; AJvYcCU4EWqoeUDiFJvz82SsBgdYfwlpeXe+fBiNYaLG/boja/hZhodDKBGSmMDI8Y6I/s+jF4QxSvk5SsQuISJ0@vger.kernel.org, AJvYcCUknWd0smsoUS1HE5PDGiBGsNErPlTEfbN/LqGcJvpWdSWSdkmRXVBOw+urNQWJmnse+7stNsNpzluAQj2E5r7Kxjs=@vger.kernel.org, AJvYcCVvNPDK2tLLF91MzbrwtS3aZKFwScC682+0iDfkXXHMTv1VZGfkR5Xp1Sh4/H8jFEFl6HvpMV72i7I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWfMqn18vfn5a+yybF/iEZ22qFgAYuHjCRb4CZyA3devWdlIDl
	nDG9Y5MHdnnpGjFRxADNQcJl7wW9o6GhzvUTRJp4+BBktoEgxvtZrqQ1xQuPpbG2JfjswOxMvzo
	pClC1ePs56ECDbnmBr+gJ483YF28=
X-Gm-Gg: ASbGncvmjhNTsGOQxVcRsclXl6EZnF7ftpe8XS8YvqHos4Z/mCVayl8UV4ULTGKmxiJ
	jlpvGOGM61v09TIe8wkO2/pLDZgzAsz5kFdpVAVcyvVlpI3M8SbykfRQPDbPp5h6m6Isn3dmHS2
	bQZD8/pChbQVfFwVNQBQfMqHiX/D/Gdlj0fiAH1PZzpPjwdviw4+dvgAyosw==
X-Google-Smtp-Source: AGHT+IGqmLokJ3KJDo31L30El0w7xded9vOtZlXOa/9XYifoKLV65yNuKzrYpJ7pN5kz/xSTPRyXyI2MgwWh37bvkws=
X-Received: by 2002:a05:6102:3711:b0:4bb:9b46:3f6f with SMTP id
 ada2fe7eead31-4c2e27505femr4829705137.1.1741272834716; Thu, 06 Mar 2025
 06:53:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250228202655.491035-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250228202655.491035-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWHpSiVzTeGKZ6tQiHp=6qdzeS6yc9inhQENwVEcSt=eQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWHpSiVzTeGKZ6tQiHp=6qdzeS6yc9inhQENwVEcSt=eQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 6 Mar 2025 14:53:13 +0000
X-Gm-Features: AQ5f1JquiS-A84gEKB4DV-1EHIFUYxRrS7q3p-iSDtPm8un50mh2qquePY6jixs
Message-ID: <CA+V-a8uvLbmhngzAXC5Y-onQ3UEOR9jXDYrPtT0GFMRan2bnLw@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: renesas: rzv2h-cpg: Add macro for defining
 static dividers
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Thu, Mar 6, 2025 at 2:43=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> On Fri, 28 Feb 2025 at 21:27, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Unlike dynamic dividers, static dividers do not have a monitor bit.
> > Introduce the `DEF_CSDIV()` macro for defining static dividers, ensurin=
g
> > consistency with existing dynamic divider macros.
> >
> > Additionally, introduce the `CSDIV_NO_MON` macro to indicate the absenc=
e
> > of a monitor bit, allowing the monitoring step to be skipped when
> > `mon` is set to `CSDIV_NO_MON`.
> >
> > Note, `rzv2h_cpg_ddiv_clk_register()` will be re-used instead of generi=
c
> > `clk_hw_register_divider_table()` for registering satic dividers
> > as some of the static dividers require RMW operations.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> I understand this is in preparation of adding GBETH/XSPI clocks, and
> thus related to "[PATCH 2/4] clk: renesas: rzv2h-cpg: Add support for
> static dividers"[1]?
>
I will send out patches for GBETH clocks which will use the
DEF_CSDIV() macro. Basically DEF_CSDIV() macro will be used IPs which
require RMW operations whereas in case Biju's patch DEF_SDIV() macro
will be used IP's which do not need RMW operations.

Cheers,
Prabhakar

