Return-Path: <linux-renesas-soc+bounces-25543-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2B3CA2279
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 04 Dec 2025 03:19:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 57FF430237A1
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Dec 2025 02:19:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B6801C3F0C;
	Thu,  4 Dec 2025 02:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W1vHYVKy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767A9846F
	for <linux-renesas-soc@vger.kernel.org>; Thu,  4 Dec 2025 02:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764814775; cv=none; b=QsicLt5Kk7jrR3al1e9+h6s9N5J4ESMgvy/WH6pXgp9WjHDi+5TDVd7RkOpNfH9RWFXJ6soqcPNMQ0AsKYovQHGLLz3y/aIg+iSpK9GJHwyNgKuKGnJnn55InD2svnmWTmzKUbtJSE58cJf9/ddgP8A7mGk1Bvqt8wz40WIh2gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764814775; c=relaxed/simple;
	bh=gCeE1v5pCwA2FCR7GmE46SltFLYJHoN8J5dUprMsAnc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WpuWHcGA/j8wtlLLF77KvdfiodK+1WNP0O4YwUyTQsI+pqTjH/XALDnvGYbisNf9Scx/+FBkzvY4gjiOOifwjip7rCs04vUWrQXHob7a9m1A32A4PcKFliE8mDPStl2VFGCjVINVpxUZrsjUnqsxXwKei96DQxgZJ7Czn1j264k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W1vHYVKy; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-450063be247so183502b6e.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 03 Dec 2025 18:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764814773; x=1765419573; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uG7PaGlKRMu5bDo4p3yFYL9GqIngsADyTUqMK4j8Mb4=;
        b=W1vHYVKyn06LOGKzI8dXJE7IscDNNTo/mDYFiTgsam2UCHzb3kQ2S4ls/tkc2LDYzt
         GiWzPMbD7G2HgT6crDvHPNjKehqQvxmcD9tCAWNw0wTvmWdNgezYQczXYXYuPJ0F3Vl1
         pxpg8bv36caY4Y9MVXvjZsIEoGlT6NtkIf8JU3qNucUU+FyQnM1YLLL5i/3iKJ8TizTv
         bigelT8qLhBkZt5mGuHDt6pcWt7UUfHb+zyO/OYSHAqkFRypt6DGPSvxhCnKsy5WDdGz
         TLglh0uR7JIegKw9/EphVauUidCeUJ+FDQPcwQapQGfVFhzYahXGFdXQLxkSgf61J+Bh
         faFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764814773; x=1765419573;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uG7PaGlKRMu5bDo4p3yFYL9GqIngsADyTUqMK4j8Mb4=;
        b=v6fIjKBwaGLA5RFT+ni0tQnCSKJajJpMrym1j9zXuSNedbOdfJh2LtBVfR60gvzgr/
         LxbusZU3VvyH8fP/PwhWN2FRJoJyD/PSrkQynpc7PZu31qb+M2KBv5hKYoTq3XaOXjZK
         hwbuW95TIJ3VqrEkdxuJd7xkZNXswRB/PNhIMFsjg4j48pPQ8LsJA0ZubF7WWFRgU79F
         /BdIOnMfqKp9Id3hbhkVHXRLErsYIL11hiAOLr/WykVoqfw5qhhMGLRqEwbYwwZs8q2L
         adWxRhepHWEsc7jiOd+CO+iwBU8xN0XWHU9Uz2lGTAV4J4V2KAwDpC24LMLeLSn6vKzA
         8yVg==
X-Forwarded-Encrypted: i=1; AJvYcCV3xygLkOeV+JiaF+Ss4tYKUWUK/7bt9CoBNXPwQYpZ0K900DON373pmuintOOvBxw6Xvb2h1fzqptL1QrDaaRAOg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4uhNZP5AI3rKGNqUr/XRhEFnwoqY/EyzYbVZ/MebDETiNklJl
	qWSYWOQX+nFuzc5fxwEWH/iT4SMaRpXmOBCbaSVgZlP0p3fd4py8DzxL6HDuP3bGaFbfr3WbcGA
	KATz3+SNMQU6HcTHS1dobLZASGwJwOG8=
X-Gm-Gg: ASbGncsXCJVebILMKWU2F7EVaV9LorkNsYRJar7pZaBJGacyZtXtM6LeXrhAnEn/gMD
	57BYwFXACM+7aEYojB0zGMfqpf8f/MGxwe1aF0ZIyVH0tgTgud9veUDQj1Rfb/z5HapeB5S/4JN
	JH8kfCogIX0QpTVU32zffJtB8NrZnhdHW+7lmlBts40IPcZsFaFnTOjqiO4kE5MHUshQhfby2SY
	bNnJfXWUKPScQCKhNAaBD88B5dXI/HIpVpJn5L8AQY63s2Zw9l+AwOpe4Tis5lXOnM8lQws
X-Google-Smtp-Source: AGHT+IEqB061cfOqCwBgL5GmPx2RSj4lzThZw1cWLyYykeKeoUInbmIZmdnj3e40MG0mT+uUQiKQyBPTmgsYn3oAUT4=
X-Received: by 2002:a05:6808:1b8c:b0:450:89ee:923d with SMTP id
 5614622812f47-45379dac9b1mr796186b6e.31.1764814773581; Wed, 03 Dec 2025
 18:19:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87o6prsl2z.wl-kuninori.morimoto.gx@renesas.com>
 <87ldkvsl1k.wl-kuninori.morimoto.gx@renesas.com> <CABb+yY2C32cTwh=8pFGGZijwd1KbpAA5=FfFzp_u1OOo8XPn1w@mail.gmail.com>
 <87h5v0xdfr.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87h5v0xdfr.wl-kuninori.morimoto.gx@renesas.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Wed, 3 Dec 2025 20:19:22 -0600
X-Gm-Features: AWmQ_blIhviETDC4lCQSXKa9EPrNMcjcSEfDZbmIhU2CpNMAnpufetADKUmSWyM
Message-ID: <CABb+yY15RqOtCav_ug-7z8n59TPnm2axVCUeiw3RsAvgroLqbg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] mailbox: renesas: Support MFIS mailbox driver
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 11, 2025 at 7:11=E2=80=AFPM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
>
> Hi Jassi
>
> Thank you for your review.
>
> > > +       mbox->chans                     =3D priv->chan;
> > > +       mbox->chans[TX].mbox            =3D
> > > +       mbox->chans[RX].mbox            =3D mbox;
> > > +       mbox->chans[TX].con_priv        =3D
> > > +       mbox->chans[RX].con_priv        =3D priv;
> > > +       mbox->txdone_poll               =3D true;
> > > +       mbox->txdone_irq                =3D false;
> > > +       mbox->txpoll_period             =3D 1;
> > > +       mbox->num_chans                 =3D NUM_DIRECTION;
> > > +       mbox->ops                       =3D &mfis_chan_ops;
> > > +       mbox->dev                       =3D dev;
> > > +
> > Please fix whitespaces, here and elsewhere.
>
> This is for cosmetic, but not for technical.
> I know many opinions exist to this kind of topics, but I like aligned cod=
e
> because it is easy to read, and is also easy to notice some issue if exis=
t
> in such code.
>
Cosmetics are usually for enhancing the beauty :)  If you want that
please use spaces instead of tabs before '=3D'

thanks

