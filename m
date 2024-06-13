Return-Path: <linux-renesas-soc+bounces-6163-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 155B2907654
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jun 2024 17:16:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 102C81C22902
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jun 2024 15:16:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 308A01494C2;
	Thu, 13 Jun 2024 15:15:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B1F1474CE;
	Thu, 13 Jun 2024 15:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718291730; cv=none; b=CFUcGkdcW7MDO1EKoX/YZM78YLEomKR5Q1PT9geiXaGbAst/oVq/1QtXBH3Dse+6u6RabnuaJ6/WLQpamkSa0jadAHx+tjCMXZE6WtGztbQlG/OmuQGr6BUAA8Go0PdeIvSF/d/ZeABTMU5cZlic7fo3pvoi+stucZTZH6UqLbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718291730; c=relaxed/simple;
	bh=upw3YZFDSMosNFgE94Z/c8GKTYTwKdjYG5hj/Ti18sQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XWlEMVv+M90SJq8v9Npe7mQmRoqP1OTYYmMBObQq4fifYwVODCRYtvfcPFBfsHKfkOwPq4Sdb3eDf8P/yhGKkL/sC6PudTEZ2FTtGhg8iGxBGRzcXK8IWb2R/Z6gxZOKEapoT0TeW7QLngK2ZFx39LuOESGD125RJU2gTcn3nN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-63152a07830so6923307b3.3;
        Thu, 13 Jun 2024 08:15:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718291726; x=1718896526;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3USazagu6cS/+37Hogg/qABAlJZ7SMpYxKFouZ1jhuA=;
        b=hyaV1QG5xEG+hdcEXr7FWnuZyYbnxCCej4a8XYDqXeBZBbynST+IsD4Fq+ALy+hBO4
         K/Oo1+BoLKu1YCYL4p84RvtjT2+mlBoQiwAScb2cQSS5qxFFRJnubihW4qJGaMRt5h6D
         EdJbAjQQb1C0b40Ieo+wW6Vnr7NKA5AWzFEkWsPrPI/5NM9Njlz+Dg5ygyq2iSyrFyz1
         H84fqxPXkxx2fnF3HvmUbaYciqdXy5QBmKiyp8XqJUPkwHSFqbf7NcyxVVeZnV9Oyb/E
         6W7uBchuf+cQzEAzs2MaptbN3nJWiwcjGazDaNOAE7OsDNhVK/m5EFZ0mQ98dLb8xurs
         OevQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVb+I9sfE2o073qznscslnh0mfXT9U+4FoQBKcoYtyqUft1KRiOB4PPAEi1RRi08T02ThKLNRmOtDj+Pwj5a/SzIYZgxzEj86oF4qMJP9b3JiwnjTdie3ZEp8EHpNgTthCsFfdmw90KMxYqu50m3cwpIWDQa/CLOSYbH8aE6eLPIwdgMeIegXOjiwHhZpJMxRiqJJI87+N58YidWMINFoWQAjW6Ece
X-Gm-Message-State: AOJu0YzHW5NikyqhS2HZ/6ACEjE9qABVyRwtdpFLe8U57GmuCPJNDtPn
	IsvXgSIzpE8nM8SKWfuiXIApAbZWsEgEsUbjwHCZNHggXlDw8r64/A2F8y/5
X-Google-Smtp-Source: AGHT+IGagWeXE+WryF70K5ZP2Dq4uP0EZSxpfr05it96YSS/9QVMlIYbu2RV8nmgBgub9iGPg8sICw==
X-Received: by 2002:a0d:c645:0:b0:615:35e1:e512 with SMTP id 00721157ae682-62fb79c2c01mr48079267b3.0.1718291724927;
        Thu, 13 Jun 2024 08:15:24 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-631183d7842sm1951217b3.24.2024.06.13.08.15.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jun 2024 08:15:24 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6312dc531d3so8495417b3.0;
        Thu, 13 Jun 2024 08:15:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWsu8KdoT17RdRLYMieCZAFg+Dz3q244Nc3S7j5QYuA1JpUjRcaHAl8FaR2G9PKkqqq2ubEL5rwkZkyOHpxOUmbOkXTXHMZ5uO/e+Ce5EZibb5sGLh1GqMVAaVy38tIjAaa4sDToTWv/mbuF2XulG9sd93oML0TuvVjH7KWwhRHOgcYOzUrtZjw00BfXy6zUVX270eTrlyQnmbMIZVgaP1eb+/j4Gim
X-Received: by 2002:a0d:df17:0:b0:62c:f90d:3797 with SMTP id
 00721157ae682-62fbc5d7d86mr45329167b3.37.1718291724474; Thu, 13 Jun 2024
 08:15:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240610233221.242749-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240610233221.242749-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <6b3fe242-3733-4f16-b727-494dc1d82002@kernel.org> <CA+V-a8vp0qHKqUMvyfy9hQjKyk8Cs0bDTnYh-ChvPi150r5i2g@mail.gmail.com>
 <3d0a7a82-6262-40e6-be25-4a1c4d8df2fe@kernel.org>
In-Reply-To: <3d0a7a82-6262-40e6-be25-4a1c4d8df2fe@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Jun 2024 17:15:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUvtUWdEfN_=gNJWY+qfE6Yw9KdenQ2OkLc=HvmRnB6pw@mail.gmail.com>
Message-ID: <CAMuHMdUvtUWdEfN_=gNJWY+qfE6Yw9KdenQ2OkLc=HvmRnB6pw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/4] dt-bindings: clock: Add R9A09G057 core clocks
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Thu, Jun 13, 2024 at 2:56=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
> On 13/06/2024 11:57, Lad, Prabhakar wrote:
> >>> of section 4.4.2 which cannot be controlled by CLKON register.
> >>> ---
> >>>  include/dt-bindings/clock/r9a09g057-cpg.h | 21 +++++++++++++++++++++
> >>>  1 file changed, 21 insertions(+)
> >>>  create mode 100644 include/dt-bindings/clock/r9a09g057-cpg.h
> >>
> >> Missing vendor prefix.
> >>
> > OK, Is this just for new includes being added, or do you want me to
> > rename the existing Renesas specific includes in here which dont have
> > vendor prefix?
>
> Didn't we discuss it?
>
> I commented only about this binding.

Yes we did, in the context of the R-Car V4M DT binding definitions,
which became include/dt-bindings/clock/renesas,r8a779h0-cpg-mssr.h
But Prabhakar was not involved there.

Note that I also asked to include the vendor prefix, see
https://lore.kernel.org/linux-renesas-soc/CAMuHMdU7+O-+v=3D2V83AjQmTWyGy_a-=
AHgU_nPMDHnVUtYt89iQ@mail.gmail.com/

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

