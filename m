Return-Path: <linux-renesas-soc+bounces-25477-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 720F3C982A8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 01 Dec 2025 17:04:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DE5353412B7
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Dec 2025 16:04:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D44230B53B;
	Mon,  1 Dec 2025 16:04:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB8F32D425
	for <linux-renesas-soc@vger.kernel.org>; Mon,  1 Dec 2025 16:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764605082; cv=none; b=PqGQ4Un7MCuEAIKeSxS1Q9VlQYgkrInnjT/37HRI0zGAaXtv4BcIiCZYXo1nRHm5nTib2GCeOSAGpnJgmJOtooOz6o5ZFd5W8P7ZA0YZ1V6q6ST8Ve/e6duCdQ3sm9f4lPDZxgthIEY4mQZ1+NI2gVDZhrDGQiOl7c+hMemZkmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764605082; c=relaxed/simple;
	bh=qr4cn87Fz/lj/NJPX9SO15DI5zruqL8p9qauqxw6SZM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R99HVNv8Ku2L5MBIULquCgfD3Dgyjhc2zdQtw7DUkmhaMEelC91C6AnzZ+rl/PnF9Jb8cQbhyDvFcG0IGDCtN3/LC9HxNs20ai/BCaDqAwFmfJ3w7wuRaBd6eXtSBTyRYS7nnXn9fRysC4ivkv35BWFUC2oVFeZOT7V+Rhs6z7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-78665368a5cso42490467b3.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 01 Dec 2025 08:04:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764605079; x=1765209879;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/iRHv+BjA8MLgniIITmScghWKuz/LFnH9jJv/CINxso=;
        b=Vbt8GbWDGIHJb+b21Phpf8ctpLKu7DZlOuwDeBS4OwS8qFYv/RC7Ln5XDqO3JYO5KD
         tenna4NVIYcb5xb4SSD8h+lUjcjs39lgg5oUXX9mPP/9aO6A0xBG458I+aDlLl1gzT/Q
         bt4Jlhc/u6hQ+oqlJ0/vzHQ9Cg5RuaXU08Wij2xd3HTl3KsURFowAc16KKdgnrcBw2fs
         sVF0em43JP+6QLrnzOyKQF6QxnBuyjWaV2ww0Ki234GcDAwq4l4nIt4uUiwOWNbZw25t
         K2iyy2Tb2XALLp8UtveONiASRzbTIV5ncOKSyk1appW9hVP44KSIie0vKTfAWoFeHT3v
         tD9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVjLtKc4XUHy/cPIfNEoCDUX89PkkUjy/SYY792CfX0e9Sh1saXphQycrthhNyFs22u9uyF62g2icmZnFZjvy791w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYBF8bmj9av5xUb6JB+xZyHvYD3Yet0gbka4qxo1ljfAwWfos4
	2SjY8mPIOiEzQwy4W5nnpFPqR8KmfOiSGst8xsk7wrUS1znzkfYdgfqE/+kemN+L
X-Gm-Gg: ASbGnct10S1tD1nG/8h1e7G6IfgMEIxtUXJtrXYki8yuRNlUmsCcO0JzbV429WcGzGS
	f7Af23m0Y5XW3L3z5ObpUpVEWsKpOdJyW+//Bi+xoUsDzr5h+pVX2DCR5XpmQEfmbj+D8qH5Gxy
	59YKB15HQuosCnHxvEAPulq2NJ+iSLU6NOMRlHj7aQsK7Gu9sPZDiGB/E6Py3ut7GNJi/Yfxrdv
	qJAthHtuaLZhJZCA2rcaeDHtQkPKvwOBJx8/HQX6iR0bhfv/g2z+MhfZplj3icO0Cn+fBy5wroD
	HLk3QlpcANcryfce4t+PApc2qq2LkjbPkmr0XFFFbXCeNhmlVUbmrfpThce80m50UlqoksWRB4Z
	IhqJhYQUz1OHYMtbSqRLKCKdhchPoWOays9dbqFn/V/r8Ny0H2cTkqrN0NqmZNEaxEqDlpj4xY2
	sWMgpqXquJlSlXqCzQBOjJqk2RkXt/qOG9RggvXqfQ9WtMZ8mF+yAE
X-Google-Smtp-Source: AGHT+IEIGFczsGP4DGw/Xdqm6arfxYqNz3P2oxtqC55/PySxTVBrS+MHRl8jaUkjgA+CbMSoi2xY8g==
X-Received: by 2002:a05:690c:4904:b0:788:1a92:4fec with SMTP id 00721157ae682-78a8b54837fmr298441237b3.69.1764605079036;
        Mon, 01 Dec 2025 08:04:39 -0800 (PST)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78ad0d3f5c8sm50915617b3.3.2025.12.01.08.04.38
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 08:04:38 -0800 (PST)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-78a7af9ff1dso40748477b3.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 01 Dec 2025 08:04:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVQf1YZuWTxe6H1pb5CwX4lvJ60XbA7ZqY4OAO3GyNsnu4S2G61BL9NbpFMjuqykfxdTnEzzDNXZJNJT/oLL+wGHA==@vger.kernel.org
X-Received: by 2002:a05:690c:88f:b0:786:5712:46c0 with SMTP id
 00721157ae682-78a8b4719bcmr328332247b3.17.1764605077800; Mon, 01 Dec 2025
 08:04:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250923144524.191892-1-biju.das.jz@bp.renesas.com>
 <20250923144524.191892-7-biju.das.jz@bp.renesas.com> <wah57av7ypb42zcaosx7n64j6qmmcq5ylhgnde2brbiy6o7sun@7rqkr6ke3g5k>
 <TY3PR01MB1134692D7D9F5B67116D2BC7786DBA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <pilx2etxezmr6rhbwculwjqcxotzkxus5bqdpjrt5na5c7fqhj@mdfm2yh2aptp>
 <TY3PR01MB11346DE28875EFD9B9D86DE5186DBA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <TY3PR01MB113464F283A3ED4A8AAC813D886DBA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <ydqyvme43ul6ui7bl37kv3kuhn7js7tvkje2u4a3vasiw4kgdv@w2govkhaa3xz> <TY3PR01MB11346F105FD6CCE1167F9095686DBA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346F105FD6CCE1167F9095686DBA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 1 Dec 2025 17:04:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWCGFWfvRDi3HWvrZWzgum8dFFf5cUVKjpjMy8mybh1Uw@mail.gmail.com>
X-Gm-Features: AWmQ_bndbNr1Oz4wHbRg3QVNBImgi5ShCGh8UUwh_sLrY_x12jOdQyzxqyweK_I
Message-ID: <CAMuHMdWCGFWfvRDi3HWvrZWzgum8dFFf5cUVKjpjMy8mybh1Uw@mail.gmail.com>
Subject: Re: [PATCH v3 6/8] pwm: rzg2l-gpt: Add suspend/resume support
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	"biju.das.au" <biju.das.au@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	"linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Mon, 1 Dec 2025 at 16:50, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Uwe Kleine-K=C3=B6nig <ukleinek@kernel.org>
> > On Mon, Dec 01, 2025 at 03:04:08PM +0000, Biju Das wrote:
> > > You mean to avoid unbalance between suspend()/resume(), we should not
> > > do error handling in resume()??
> >
> > Consider the following resume function:
> >
> >       static int myresume(...)
> >       {
> >               ret =3D enable_some_resource(...);
> >               if (ret)
> >                       return ret;
> >
> >               ret =3D enable_some_other_resource(...)
> >               if (ret) {
> >                       disable_some_resource();
> >                       return ret;
> >
> >               }
> >
> >               return 0;
> >       }
> >
> > If disable_some_resource() can fail it might happen that the first call=
 to myresume() is left with
> > some_resource enabled and some_other_resource disabled (i.e. if both en=
able_some_other_resource() and
> > disable_some_resource() fail). Now if the resume is retried some_resour=
ce is enabled a second time
> > without being tracked and a later suspend (or remove) won't bring the e=
nable count to 0 and thus leak
> > a resource.
>
> OK, what about for making balanced usage count for suspend()/resume() to =
avoid resource
> like below
>
> static int myresume(...)
> {
>         ret =3D enable_some_resource(...);
>         ret |=3D enable_some_other_resource(...);
>
>         return ret;
> }
>
> static int mysuspend(...)
> {
>         disable_some_resource(...);
>         disable_some_other_resource(...)

What do you do when one of the disabling fails? See also
https://lore.kernel.org/CAMuHMdWDGpqdhCsA0MJqoL1JAiyVR-TA2YqDe+-S9Xf6c5O-gA=
@mail.gmail.com

>         return 0;

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

