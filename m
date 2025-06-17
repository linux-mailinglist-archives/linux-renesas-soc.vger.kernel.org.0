Return-Path: <linux-renesas-soc+bounces-18424-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA04EADC5E1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 11:13:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 901E51769A9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 09:13:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF5FB290BCD;
	Tue, 17 Jun 2025 09:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="N0aqP0kq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E71323B601
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Jun 2025 09:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750151632; cv=none; b=Yj/V188KtxECLub1H7HVUVtgRTEb8J+cZ0qOk3d6vnP7dA92/oHGHeZjVN/x2pk5sFa4Dei/r1cqHLw3UZ9f8UX556zCUlEcBYWCHj2kwujWcsUcaWOthdQX7WOF79/bFAebge/5IgoqH3JBpFA/0s2CBruuRufcEYID+EzjYvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750151632; c=relaxed/simple;
	bh=GFZGZld2msZlsqI4AeZceArgzS0jDDja1cJAY7hfImA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=po0p1Df54XG7ALn7dsS/QwvhLX/eltsD2yFX/7HzwVR56fmD6Mm2KoUD7tOXNyRJYJjL7RPz+XcJpIK1+FpYqLI5b3vNywlHOWXVmGS+4Xehi+dvQ8+bXIyLlFtgfL3O1b4oyV3nXact3bMnlINQlA/ql94w+Tvptm0XPLpCvgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=N0aqP0kq; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-553b544e7b4so4140294e87.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Jun 2025 02:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750151629; x=1750756429; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hznkuFVQ4L6OagoiqF3YquzOm9wFiJU8GR+IIG9PGoE=;
        b=N0aqP0kqxVR9LAmQfHEt8LKbODr5l0J/3nv8eHp64UR3KmrfLdpKBhQYcK7FLwMkrJ
         pJMuTtCDAj3s5fHBv0BFx9oZ+66ZSGiIBBNaDXb3T9h7QWgkGt/1TrbOB6YkLudJhAKf
         qIaR3LVSPs3OuNwgZu+I7Lq8bgHdki2sxiBbBW8EeEHSfdeB08Exo4YoX8p3ZqeBp1AA
         tOHGl0vo8Sq4psS2MyfOB4egUcWarITcJyzbPrYGZebf9FyjV22pGWwCI9w2EZpNj4rZ
         ohPOjeYwa65s2psdYSAJcBQTx7P1cs+nDlWhb6UADcHFhC7XEaI7kOEzR/R47px6i6FE
         2q4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750151629; x=1750756429;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hznkuFVQ4L6OagoiqF3YquzOm9wFiJU8GR+IIG9PGoE=;
        b=eE+Rmd+i2Zv1trrPvOEJYkdxnydBtjsEnxJWYILeNRUy2bJDHJ4oCJcAckwqtPVHZY
         z5qbZ+h39tfX6pvm6WtqBmS2jytPOI6gulj47rtIVF92FQsfiDtjIBDXJO3a7Z6SjGFp
         GM2ibOAeMJboj0eJ9y46S8HMz35mM0GjsHBhqQGCLWh/o6D3zCvh+9GXCjr2daIaCSHp
         MnjkKofm0poLlyGnzMqBm0b4C5uuRUfY79386UMTGwlsHMk03HzIPIYjn+B1d3eSvKIE
         /knLvhbmVaKiYOL1yZ7CSs0TLAU9JVPEuTa9eddNtoK1hKvApCxR/tXPbm1wmG4a8Wnm
         xlwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSyHWIKekbKrNe3avzpSK5xkcJ4zgSJ27mq1X2HugThwR5ux3Sx4hRDdRQorWhAY9bELlzJj3xv2+A5QFvXVxMDA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmAHXWj1Ob18lkjtMMoU22l1uokN2jdp1yH/wF0h7g2cLG1HjO
	CojqjX9U4T90NSscbOc9jRcSDdA3Srw0nCbaqFy37ok+NDr2Qz2nyMoALfBP8rdWoAtvBFCDbln
	CKy7+4IEh7fYLM0dsZjtjW2S3bwednD2nF9gFO/vkZA==
X-Gm-Gg: ASbGncvFvWonoA1YuW6Up15FwK3QvpZeTPdh0vtXyliN6s6c21FahuvbBT5kQqXXmfc
	Mg9jQGvtHzm34NrjC0Ab38v1w4IjTLK5yPiajG8yF28+q8J9u+Y3WRL8/GZ3IQXtKQJAV7c6aB3
	X9SnuljwvO2vD6hlxprdgB3oGqY8Rm8DbVhLJMJsvdfHkCkWiulZ9OBrNp5xOXkl5nM8qsbDVim
	W+JEu6gg0yu6g==
X-Google-Smtp-Source: AGHT+IFpKUJs/wBsDFRVXAccck5zl6phPlCBZHHLHmfTMcj4BN/oFh2IvP8A5zGA6byZ8fVbdK3XRYNq12y1lhg1xTU=
X-Received: by 2002:a05:6512:3e0f:b0:553:2dce:3aac with SMTP id
 2adb3069b0e04-553b6e885dfmr3012127e87.16.1750151629264; Tue, 17 Jun 2025
 02:13:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <b648ffcfe6268d3886b134a98908b2f91dbece56.1749801865.git.geert+renesas@glider.be>
 <aEvotoVqitiHxgYA@shikoro> <CAMuHMdV+2AQbuzLhx5rdtuiVdN85oHJpdUvTKPkVdEn5krp6Fg@mail.gmail.com>
 <CAMRc=MfB_7JTzsSk+9ssdC4N2S1Rn1hHpkQ7CbWMF6SFUadrJA@mail.gmail.com> <CAMuHMdU2LHU54ebB5ihcdn8tyQbZ_tbdGGs0n_6nvfopyRk3Jw@mail.gmail.com>
In-Reply-To: <CAMuHMdU2LHU54ebB5ihcdn8tyQbZ_tbdGGs0n_6nvfopyRk3Jw@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 17 Jun 2025 11:13:38 +0200
X-Gm-Features: AX0GCFvKpHGhwtgEZ5aBU-l3jf8i7f4xF0zgKvoqoEBj5J7RHEK6cKq18KAVcqw
Message-ID: <CAMRc=Mc79tLcd1QJEJxDk_qQPjt85RZw3WsQPW_5WBtrpTyLoQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: rcar: Use new line value setter callbacks
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 11:12=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Bartosz,
>
> On Tue, 17 Jun 2025 at 11:06, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > On Fri, Jun 13, 2025 at 2:02=E2=80=AFPM Geert Uytterhoeven <geert@linux=
-m68k.org> wrote:
> > > On Fri, 13 Jun 2025 at 13:42, Wolfram Sang
> > > <wsa+renesas@sang-engineering.com> wrote:
> > > > >       bankmask =3D mask[0] & GENMASK(chip->ngpio - 1, 0);
> > > > >       if (!bankmask)
> > > > > -             return;
> > > > > +             return 0;
> > > >
> > > > Doesn't that mean that the mask is invalid and we could return an e=
rror
> > > > here? Or is '!bankmask' an expected use-case?
> > >
> > > That is a good question!
> > >
> > > I _think_ this really can't happen anymore, as the GPIO core is suppo=
sed
> > > to check this against the valid mask? Or isn't it?
> >
> > Yes but this doesn't seem to have anything to do with the valid_mask?
> > If it's about the number of GPIOs then that too is verified by GPIO
> > core.
>
> Sure, about the collection of valid GPIO offsets.  So it cannot really
> happen, and just bailing out with zero sounds fine to me?
>

If this cannot happen, then why not drop the check?

Bart

