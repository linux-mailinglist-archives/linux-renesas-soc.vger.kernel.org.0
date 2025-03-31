Return-Path: <linux-renesas-soc+bounces-15208-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A39AA76C53
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 18:57:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B9C6188DB17
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 16:57:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D1972135DE;
	Mon, 31 Mar 2025 16:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ezt7BHYO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00B2155725
	for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Mar 2025 16:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743440259; cv=none; b=rI/cbP+eGZO5fROOpqdJSy4dqhhOw3Sibn6V1ewl+h8GECsBHBthRsglG85XZxyU1WvFYOvmw9KIsKBH8WU42unNmjSpHEB6apE1jNYAPWpT4FbbdOyWjXjbwFX5IYgGTWzrFOCszxaBw0oOsXP0MstNzSnxCRgWXv/gjeyoP3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743440259; c=relaxed/simple;
	bh=XNresQupAJTMNkvTMG1Zkq7T6zZK9wRXedeDX0WuRFk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AmwgnBVfYLzNyxOfj/DDmnOIDQlH6FtEdrKKWbRTNmk44wku4e5cdu3gBjueNqTeYPmYv9LJ4IkvkrD1JpeEAd02OrkCstNqc4oJNDsNu6e4MGq8iA1GveNb/ypP1rckMKiVIgNQgoM67X3mEAiYs4dBV2FfF9CBGLLkLMROU7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ezt7BHYO; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-523d8c024dfso1917115e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Mar 2025 09:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743440257; x=1744045057; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vkdG3du/V4QGYFQJRSA6mush7vk4Or2qu2SVOEjFyeE=;
        b=Ezt7BHYODbz7XY3t3E4jNC96ZrRWayiFDd5VXz06ggzqFNMranL04Qt+CYM35sLe/O
         YV6C2Gr4CHjop3g0tl/jWBVedHMvS0hL/kbaJXiS5OKUO1eZ0u4oTN+ZMHPs/J4CfzYQ
         qo8wGQKWuWWeOvnI0dwtpZMKBlV4nXcRbH3WZ5AZrw37E2ATT+9GhoFIbWhP157/xdq3
         4/0p7H1c2WUAarjQBvgNkZhk0htyE7QkQelRjx/eDoi0chKpOJDQAn4uYPsy1ze1tmIy
         ykml6sYcdSfL8qrbX1hYvFst5MOt4IfbrNtAmWYR+6uw39GyUqE6lb+yL0On7x3LKZlW
         13RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743440257; x=1744045057;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vkdG3du/V4QGYFQJRSA6mush7vk4Or2qu2SVOEjFyeE=;
        b=iim9kVAVAqsmp0ckwtYGCOuvCIzTOI/JBr2sn9NjGfLMzXi5r80cg7SYu3nCJFExGX
         rxdRzGLcFmUELJjDO8E8qsGxj1ovSMIytmA+k2sNBNyldYGLtnYI44byrMc9hknrXcWS
         fNfJpAwSei/AdvHAo/p5exoG2lZWzaqJI52LQxkFbHiIUYMVknQ3Ly1k8mSEiUF8Giig
         gnwC/T4T6kB5i4WUFfRBxZnJtNQSygUacGmYZxmujRtKjUYXXaQ9jOGWDYJR0+mjYFZz
         nzi6IxVu+8dc4xhka0ofauwSlOrbtgH1wR4zLvDtmao0eXjGbYWB9/5h5hoMeeTHhsVs
         dVAQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/R7cSd8Etj0rrnGCMGbNPXTku++loiQzjYWFvqr/fS1Nbb89r3bpcf2uSn/z9Fad6oC4TVJB+L2MVX/O2tyvZ8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwuFRMEV1eeHL68HqXZmwol6xEm6o85jTBkJZuWlQGV7UkdZ89u
	URDW1F9UDTr0S5di8btkA7k8QDzuGT4LVxbs3RqYaYmMQfKyFo0iBhxCbvsr/c6HKxE3l192Ljj
	DDMyHsSjjCkBeOrshp5rnjN/rd00=
X-Gm-Gg: ASbGncuuunwRkljwiNHAC8K0+6ExNGXBn3Ro9tgo0QI9Lq2iiCN4k0eQOLx30nLwlAz
	aBXcuJ8+8cBxmFNKrEsC+zUk+JkllIg2MAXoimZN/g38KPQSda9tonlqHiBlqXwpQfjhM3As0wO
	Pus4DSNeKJLpZ+l6dVWQC8CT6itg==
X-Google-Smtp-Source: AGHT+IEkvviSG4PfGy+Ee1Yle+E5576RyITV46IJbeZ9IuD7fJUJmr10nY/h6pFJxbNO+IhR6YiPVUzqIlhUjXSE/zA=
X-Received: by 2002:a05:6122:134a:b0:523:e9d2:404d with SMTP id
 71dfb90a1353d-5261d4d7079mr6174622e0c.11.1743440256877; Mon, 31 Mar 2025
 09:57:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327193318.344444-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250327193318.344444-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdVC0HzvB9EPKTev8Y6ioB6GfE-axEgzK52+SVj5hGnMUQ@mail.gmail.com>
 <CA+V-a8uvetHu1nvigA6s5DNYPKMq5iC6=UEnMLy=z+83nQ8acQ@mail.gmail.com> <CAMuHMdVdrJpyABVQPf-QuErPohmxcFPtECW3XW87bNfGVarMDg@mail.gmail.com>
In-Reply-To: <CAMuHMdVdrJpyABVQPf-QuErPohmxcFPtECW3XW87bNfGVarMDg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 31 Mar 2025 16:57:10 +0000
X-Gm-Features: AQ5f1JouI81vAWHC8A0lnqsIyEp20TOyb-uUwqBhWzEmLxHW6iY6A5MpZZY57WM
Message-ID: <CA+V-a8u79T3YGFbAdT6vETkCO2sDXHR9e4thXfNjZJR3AYvgmw@mail.gmail.com>
Subject: Re: [PATCH RFC INTERNAL v2 1/4] soc: renesas: Kconfig: Enable SoCs by
 default when ARCH_RENESAS is set
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Mon, Mar 31, 2025 at 4:48=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, 31 Mar 2025 at 17:37, Lad, Prabhakar <prabhakar.csengg@gmail.com>=
 wrote:
> > On Mon, Mar 31, 2025 at 4:16=E2=80=AFPM Geert Uytterhoeven <geert@linux=
-m68k.org> wrote:
> > > On Thu, 27 Mar 2025 at 20:33, Prabhakar <prabhakar.csengg@gmail.com> =
wrote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > Enable various Renesas SoCs by default when ARCH_RENESAS is selecte=
d.
> > > > Adding default y if ARCH_RENESAS to the relevant configurations rem=
oves
> > > > the need to manually enable individual SoCs in defconfig files.
> > > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.c=
om>
> > >
> > > Thanks for your patch!
> > >
> > > > --- a/drivers/soc/renesas/Kconfig
> > > > +++ b/drivers/soc/renesas/Kconfig
> > > > @@ -65,17 +65,20 @@ if ARM && ARCH_RENESAS
> > >
> > > Note that this whole block already depends on ARCH_RENESAS...
> > > I forgot about the reason, but commit 8070ba6348608aa1 ("ARM: shmobil=
e:
> > > fix build regressions") reminded me.  This is also the reason why we
> > > cannot open the block for COMPILE_TEST in general.
> > >
> > > >
> > > >  config ARCH_EMEV2
> > > >         bool "ARM32 Platform support for Emma Mobile EV2"
> > > > +       default y if ARCH_RENESAS
> > >
> > > ... so the "if ..." part is not really needed for arm32 SoCs.
> > >
> > Ok, got you.
> >
> > > > @@ -197,6 +216,7 @@ if ARM64
> > >
> > > Note that unlike on arm32, the arm64 (and riscv) block does not depen=
d
> > > on ARCH_RENESAS, so the "if ARCH_RENESAS" part is needed.
> > To keep it consistent would you prefer `if ARM64 && ARCH_RENESAS` to
> > be added and then all of the SoCs can just have `default y
> > ARCH_RENESAS`.
>
> I am still undecided. On one side, I like symmetry; on the other side,
> I like opening up as much as possible for compile-testing.
>
> Note that apart from a scary "WARNING: unmet direct dependencies
> detected for PM", an m68k allmodconfig kernel builds fine after
>
>     -if ARM64
>     +if ARM64 || COMPILE_TEST
>
So I go ahead with your earlier suggestion for now?

Cheers,
Prabhakar

