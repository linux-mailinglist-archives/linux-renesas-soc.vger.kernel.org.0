Return-Path: <linux-renesas-soc+bounces-18919-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC271AED9F2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Jun 2025 12:36:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7CC663A4E5E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Jun 2025 10:36:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09A2523FC49;
	Mon, 30 Jun 2025 10:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EXGj0mqm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957E01D6AA;
	Mon, 30 Jun 2025 10:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751279799; cv=none; b=ee9dJcvyABtIPikzPJKhF5Jt4rQ47i9P310Wavj+cyp/xxde4Cm5jmZpQdYlg0XRtZC5CSWM3kjlQ6x/rv5u8RTDa6oGuddjdl/VyILXZQIaUtG2xouiOXqY0fbHckIpoAE0tEio3VsEnySYRWI5aLb1AU7wTWqel1l6pFwerBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751279799; c=relaxed/simple;
	bh=TYEa5gctuVllzJIY/gmCP0l/2r/1GM9o29nN2z/wSSc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L9RZw6JCDhGs+Xo2/n0lFZ5KJh3AFBH2w0WAGbjuWkuSyVmuOkpoHe12o2Nd0+18Ij83DrMWk+onyLizDXCVKd8Zi2+gDNOcfjSxRILldjDuphmqUccMCk7rm89Ddebw4leirVrYPtks1i88eABIlsBNgkJmwMlVYKNiFDErgxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EXGj0mqm; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45348bff79fso19451715e9.2;
        Mon, 30 Jun 2025 03:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751279796; x=1751884596; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TYEa5gctuVllzJIY/gmCP0l/2r/1GM9o29nN2z/wSSc=;
        b=EXGj0mqmD42l8ojSG0zhEIfCL+20EmXXHHAfhivowsYpqgvz7wEQHM1DCD+86wnALr
         BE7Iu7V6n/yjCNSKnOnAs6A1O1F/E9+f/Wksde3OP9nDkyw+wospj4DYe2Av+eoQU2BG
         CtUWQHG8pJ8BE6WF3A/3oS5rCT8r4zATVDK4Y9p84Eby8ny7NnawDU/n+178Ytc8o6vC
         P0yoVstc2e9p2+pISJ34UIMkYaz3np+IMctWytopCTFvm9fGFSk45fZ/PXOeXoq2LmYg
         C1i44N4Z68UBk5JMM7Q9TG23jT33Yedw/y/xmtuz7kI2SykiS/PIk4HJeoXdliRszX3L
         M9Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751279796; x=1751884596;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TYEa5gctuVllzJIY/gmCP0l/2r/1GM9o29nN2z/wSSc=;
        b=Qh7dVU+ZDvWVCcCTNT91WJIV/OsTFZwNDmYWjEThZudBj55YMkuuryM5OvEqEKzhPt
         XmNp9Vv80o8PFz2dRUfmuA6X9TACEHyElpRAsdfw0LqWAdbzWxyski4E3soLRFomYUaw
         5jn+KFiBvrTR/y0QDIDksmFN7ZNKMkSJNmb0iwYM9e+JuOUCieUWxj3jUF0BTIDB672X
         riC0w+i/3E+JjsVAWlPkQErS3HeaaJ1u8faoEAOwBEPLaL9ADfVyATfvfNwiV1lXFzEw
         Ag1ZhGLBVs9cDzaxvDsPGjRWjzA6fGPwsqGb3h2bhn4e9XhANQi8EficPKZYpsZgHYOm
         chsA==
X-Forwarded-Encrypted: i=1; AJvYcCVChgJNsjSlprCLvvagweBs6vbz0Hz7f/4MEEfB5Z5XESY8MHg7ff7+R+kFvRxlwdVx+pIcXZ5J5S7K@vger.kernel.org, AJvYcCWNQI7gCjKQI+14K+yQOeWvHvUsORcxMOCnaH1zjmKp+nRmCsiN41BEjnQ3Wn4Ra7DeNwDmGi2ooOUvG7OK@vger.kernel.org, AJvYcCWq3pa9kO2ou/HqUllyQln6zP+YwOzvuoHNUyCgz+tzzEov6y526EKdyHjyO2ySRFHHHvE7gsvaXaGJPEgL8DzoaNI=@vger.kernel.org, AJvYcCWxnBooJvj2vSILu/2z6H/XQISgyuvanGm+EzJ9EXmHlFyh1DM+yEvJL1m2nktl+EMgFTHNEBDpGv9xriu/@vger.kernel.org
X-Gm-Message-State: AOJu0Yz380cldm7vSyFmv9LBx5k3LbVB7GtZZn2Fnx7PRrAT1j2b8lUu
	RB/bM+IsXV6GuEaTsCeFqC9ekos2h6bSFSOC0lElOmTWBK/E6TLjGKBY3NgblhiWtHAaW+ZqJ++
	AlAINJJYMXiHlsJfcu4N/96bz3OsTTUk=
X-Gm-Gg: ASbGncs389BitNekYO7yi4plXEZgX1eZ4QkpcZTW7tvBteBw9qtFhdhfOqXKf3aEnKH
	TWSXBtzou3PsHbrhj1OCophpzcyRRyurGau1YslzlXW5uI1jGqowN1S8umz+o2JPWdJs3MeWByH
	YnzL4Q+NzCmOh55tyjOZfI47z2Djg0+JQe7ukvLy5fZHHhN/M7YLpshCqshfQKfwrAD9B05SJql
	kMt
X-Google-Smtp-Source: AGHT+IHzVJSs9extZB6R4mzBdKoauxBA5qwzHvS01dBh5S/+5yMN/p2KX/oPAAPczklKOfT8+30x09RxKH1pE92PQUs=
X-Received: by 2002:a5d:5f4e:0:b0:3a4:dcb0:a4c with SMTP id
 ffacd0b85a97d-3a8f435e1b9mr9812832f8f.12.1751279795507; Mon, 30 Jun 2025
 03:36:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250628115715.102338-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250628115715.102338-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdUrkcxr+_jcr-F76cOg+rie3c2FcrEpfrH36kKJFhF9vw@mail.gmail.com>
In-Reply-To: <CAMuHMdUrkcxr+_jcr-F76cOg+rie3c2FcrEpfrH36kKJFhF9vw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 30 Jun 2025 11:36:09 +0100
X-Gm-Features: Ac12FXw9ORdx6x4Jhwr20Jn-ldjmdRU9J48DPBGMOKaO7WlJFPMxmdc61lXkOYQ
Message-ID: <CA+V-a8tQ70vGVr6i1Wfs=ogYodQCvRpMKtsPx=VCh61xfjZ==g@mail.gmail.com>
Subject: Re: [PATCH v13 1/5] dt-bindings: serial: renesas,rsci: Add optional
 secondary clock input
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Mon, Jun 30, 2025 at 9:10=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Sat, 28 Jun 2025 at 13:57, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> >
> > Update the RSCI binding to support an optional secondary clock input on
> > the RZ/T2H SoC. At boot, the RSCI operates using the default synchronou=
s
> > clock (PCLKM core clock), which is enabled by the bootloader. However, =
to
> > support a wider range of baud rates, the hardware also requires an
> > asynchronous external clock input. Clock selection is controlled
> > internally by the CCR3 register in the RSCI block.
> >
> > Due to an incomplete understanding of the hardware, the original bindin=
g
> > defined only a single clock ("fck"), which is insufficient to describe =
the
> > full capabilities of the RSCI on RZ/T2H. This update corrects the bindi=
ng
> > by allowing up to three clocks and defining the `clock-names` as
> > "operation", "bus", and optionally "sck" for the asynchronous clock inp=
ut.
> >
> > This is an ABI change, as it modifies the expected number and names of
> > clocks. However, since there are no in-kernel consumers of this binding
> > yet, the change is considered safe and non-disruptive.
> >
> > Also remove the unneeded `serial0` alias from the DTS example and use
> > the R9A09G077_CLK_PCLKM macro for core clock.
> >
> > Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v12->v13:
> > - Rebased on latest linux-next.
> > - Updated commit message to clarify the ABI change.
>
> Thanks for the update!
>
> > - Used `R9A09G077_CLK_PCLKM` macro for core clock
>
> Unfortunately include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
> is not yet upstream, so you cannot use its definitions yet outside
> renesas-clk.
>
Thanks for pointing that out.

Cheers,
Prabhakar

