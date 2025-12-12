Return-Path: <linux-renesas-soc+bounces-25713-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 398C7CB8AE3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Dec 2025 12:12:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EFF53306CF4F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Dec 2025 11:12:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81C1031AF0A;
	Fri, 12 Dec 2025 11:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DAaP+jy4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9146331AA8E
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Dec 2025 11:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765537922; cv=none; b=AGdBlj3f7YXc9jWAaPG0OR5JH0sMXY46F3oYkGcGRkJwX48oLZL2c4YRaTgBd25+nfUzdNlRpODEj8fv3kSyKeqvmjguv4WfbAHHRiAp2SqDIS15U9gr3VVERPEg53GuJdkdbO3AlOWtuhlQmMfayW22TXslQpkI2e30QL4ZhAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765537922; c=relaxed/simple;
	bh=2gQhg0m52l1J+h6DLsaszgrLcV0l+qbb8vREvFeUzYY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=losHausV6UwG1lMCymzGThhGJycZgMR2hPcZRuX9P7M5sMTRBkszh2Drx0bcHOmJb54wZzv+2tKXKlQwI5DNZdUUHEEl5970VsJy0uNE0pKrfYHLh7FWDxf4QcOJSsLCiCRUXiCkxU6LvAcnagifDOTIfpTmgmA1j2nm+k/YRoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DAaP+jy4; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42e2b80ab25so530617f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Dec 2025 03:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765537919; x=1766142719; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=owa4AYkVBH6Oi8vgGHHw2NSIxT8lUbiInmR/cjzPZ24=;
        b=DAaP+jy4zpTrIb3E87wx4Y8znHkU8o2ZDo66LwXuQdxkR3ZHfnpPYk/NL408laJh/D
         dd+VhiEvJVCmYueuNIRVGO4vmPnpS/IQXVVPFmMDBAX0pdTWYIf7izzt05vDwPOONGVt
         ZPaSUK5uS2b9GrLz9iDisTVlS38IkNKR2gRZk/WDnmzISgYAM+bsLE6H+Itr+R1pzqZi
         ruf0lalKRAREwjYmJHLmtX8gKPj2b/DD8m+l7OKS5mldfZznXzY3fiEqYesMxqAaFRrM
         /Pzs6g1pg1vTNaov/HeFFP3pMvXpnMduAY8uJabS2fNRDlqS2aYfFYI/R7+b5zy+FKSj
         HfgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765537919; x=1766142719;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=owa4AYkVBH6Oi8vgGHHw2NSIxT8lUbiInmR/cjzPZ24=;
        b=hhfVn1uYthxfyudTJJEuXl9S45T+t8oIpySjt2NRQBlTRA0sHN/uFezg4J6IfW5jOp
         GNUWZ7S9kunr3TCrCzm0HP6tUW7HRKcUa3bqnnK1r56rqTkHcpFdnQpgm7EQv1uJGbs8
         lxwYaZ1OufhF+pLwG0TPnc6JMFNYFRcQ1IOOVDGTFqLfTmK5zT4dqB7cn6u2V0zRxlnk
         Ymq2FGP81iaaTCfo7S6EdBL4fl3IgibfQ+EQuo/NmrLBBDTchDlGU3TydlF8l82V4n41
         qXQwNntlKsOPHV6m2DsfdGUdSCRD08R2ylEwRinAaRhErGWMpgJgV3VwwbuXqKYU+74l
         SWpg==
X-Forwarded-Encrypted: i=1; AJvYcCVReY9BE4hrt3M4Ddz6x95lEbGvx1PBLZnFdz+SMeayy6Tm6VVY8WNMjQeOfmT0RlA+d+D3GHS9XLa7oi6c6uiO4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzA2+IwqwlJkaEQPz7/nFhDS2gaQP00jlAHt+K5EfQWHeG1VEM6
	TGZsrIv9JtThqEZ6YJdgNMhVoz4BDyFmGu7XTFnzlCNr8exOH6Sms+/k8o3WSId+is5qZi+ZgsJ
	IGE1aLRF8KA/51JeZ72y0gwYFym7Lg2g=
X-Gm-Gg: AY/fxX6ux5nl+JOB46tVKsYiJJse9X44LHV4G0ReZ53VBRmsK3BcrWG5WWPhVAD8vL7
	dxtmXgMJyz94l1JVe70DbEe/24q6Hf4lpgnHvJBxeBDv4PMEDeDqyh9Mw11OXdYYsU0EwKylRtN
	1VTJuLTE7m/1q+i/KsqurCYRtc7VdPsDRpEP+3UHaKN22I34SaEPLrLVg5V8xtDznn4MDY+Wmi8
	gkCcZQ4/3opI116l/hnYsZatoyCvPk/9tHAkewdkhP/4jyJDJeOnPlL+wfsd5X6uhnXLxfGxd6p
	82n2+gdHAfvxjVUEJs74rRBcpFE=
X-Google-Smtp-Source: AGHT+IH/n6HDi9XTcEJRBWKGIz10PedulThRJ7x4uv71nP8DoCtZCymA1rkQJc0aCtpHQMfFqqVYkRiC9tDijK7BBRo=
X-Received: by 2002:a05:6000:3111:b0:42b:3e20:f1b2 with SMTP id
 ffacd0b85a97d-42fb447ae67mr1628114f8f.4.1765537918745; Fri, 12 Dec 2025
 03:11:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251014191121.368475-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251014191121.368475-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251016-dimmed-affidavit-90bae7e162aa@spud> <CA+V-a8un1cF=acNjG=79_v7oaR8gzBQ+3z1As8AqrJnOnk-OUw@mail.gmail.com>
 <CA+V-a8vq2EvTb_hXxRzW_Rbp+BPLSaLsEVkvaTjc1zRin-RV=Q@mail.gmail.com>
 <20251208-headgear-header-e17e162f0f52@spud> <CAD++jL=rp=_J7vN4E9hUqu0Fa4H+1E1EhMFAe79Tc8jMtNHTcA@mail.gmail.com>
In-Reply-To: <CAD++jL=rp=_J7vN4E9hUqu0Fa4H+1E1EhMFAe79Tc8jMtNHTcA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 12 Dec 2025 11:11:30 +0000
X-Gm-Features: AQt7F2o0nVnOaR9-qVNKrHWb9R--8lodJV52Di2Ea3o66whanMp8URPFhYip6eE
Message-ID: <CA+V-a8uEk_SYcbukBNz_sm7-giuGeg8V7kMUtXsiOYfbFFR90Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: renesas,r9a09g077: Document pin
 configuration properties
To: Linus Walleij <linusw@kernel.org>
Cc: Conor Dooley <conor@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

Thank you for the review.

On Thu, Dec 11, 2025 at 12:00=E2=80=AFAM Linus Walleij <linusw@kernel.org> =
wrote:
>
> Hi Lad,
>
> thanks for your patch!
>
> On Mon, Dec 8, 2025 at 7:01=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:
> > On Mon, Dec 08, 2025 at 10:36:04AM +0000, Lad, Prabhakar wrote:
>
> > > > > > +      slew-rate:
> > > > > > +        enum: [0, 1]
> > > > >
> > > > > What are the meanings of "0" and "1" for slew rate? Why isn't thi=
s given
> > > > I'll add a description for it (0 =3D slow, 1 =3D fast) and the same=
 values
> > > > are programmed in the register to configure the slew rate.
> > > >
> > > > > as the actual rates? The docs surely give more detail than just "=
slow"
> > > > > and "fast".
> > > > You mean to represent slew-rate in some sort of a unit?
> > > >
> > > Based on the comments from the HW team, there is no numerical
> > > definition to represent slow/fast It only defines a relative
> > > relationship.
>
> Then describe relative to what, so we can understand when to use
> which setting?
>
I have made a query regarding this to the HW team. I'll respond as
soon as I get any feedback.

> > > The current value is determined by the load on the external circuit
> > > and is not affected by the choice of drive strength.
> (...)
> > Remember, drive strength is the current that can be delivered through a
> > pin, not how much it is delivering at a given point in time.
>
> This seems to be the core of the misunderstanding here.
>
> The setting defines the cap. How much current *can* be delivered.
>
> If the pin controller had a fuse that would bust if we delivered too
> much current, this would be the grading of that fuse.
>
> It's the current where the driver stage(s) stop pushing in more
> electrons, it's a very real thing and does not depend on what the
> circuit look like.
>
> Pins usually have protected driver stages, so connecting an
> amperemeter directly to ground and driving the line high would
> actually give this value.
>
Agreed.

Cheers,
Prabhakar

