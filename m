Return-Path: <linux-renesas-soc+bounces-6167-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F384907BC9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jun 2024 20:55:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D17A3285C9C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jun 2024 18:55:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73B2314B941;
	Thu, 13 Jun 2024 18:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e6TxCS+O"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA1514B061;
	Thu, 13 Jun 2024 18:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718304953; cv=none; b=gtBlvSyj6UI1LC+aVRZsr9GarQJCIMPoIi7Un0DwYpjgMv3DblqppKuMMQJuvx4wnDc+lbE0eSvlySxY+BkrNyfjglCiu1edWSPNc5Uk6sf9vwY4VVA7FuXiDxuJ40OSmFTXc2/JB32C25DGbXgOEahXOVEi02iKhZCN5LHJSFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718304953; c=relaxed/simple;
	bh=PB2nojLhZzae5rx9ilIWiCyCUZzKIumHsScsPI9lg9I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HzDEbaJfk3yq/twglG5sHNgwwWo7CsZ8QJlbSlzNZcf+VGMPGTXKYILtqVY+eT9s8HkFImuXTwZkeGDx6BG14fxwQ6vqIXosCToqp5VfnJagNwgo48T+GOKnQcVfU7D+CtDwVu3fCEwS0sF4jWMuVE1lBgKb9AzFz0OfD1j908Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e6TxCS+O; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-4e7eadf3668so522239e0c.0;
        Thu, 13 Jun 2024 11:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718304951; x=1718909751; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A8rHVmgvSmGrxOP2jWFGDRV2w5cu6w7bmnQNCKQ1muA=;
        b=e6TxCS+O9aQfngFVhOYQ1VtJzbOYuRTkNOIAOoyHsr6VsKxS2OUDTqItRzRf1Tsec5
         n6i1gZTFU0hNGNSqzJM6xuZPgK4ITRWpPP8GhDnn6EXkpnN83dZyClJgP6LbZZh9E0KZ
         K9AeHRhklbCFceEmczksHsFBdPCrvX9S9wmd6sloo7mKBOcYBHvlHzm5utE/zsfwacGu
         A7OzF7PL9MK8xeof5hSzyaEMoqAsyU5wJ0DC4UUn8f78JF8+sNrhBOB+dtGdW6NPXh0n
         JLkjHR5lBhbe4StEGXqYvqJqGDCajErnCPDx4lUB9cADjSTJDJh6woirz58i6q7jtQ79
         b2fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718304951; x=1718909751;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A8rHVmgvSmGrxOP2jWFGDRV2w5cu6w7bmnQNCKQ1muA=;
        b=M9PWBVfdEnylx+2KuDfK6il10FMbrGSa8SGJ4ixmWyfnNjxN8fwkDRy01LJFpNeO+o
         e7zy05zuDWhub62FRyRxRriF6uZi/htbvKPIAKm3E/wBqm5BTHgJftWxmQuCwxKPLHdH
         pXvFGSESB28cZOX5Ux0HZkNfLZHztVFwlQ7GE9DUD/Pt6wMz2EFYxMOERP2b/m7blLoo
         rEYr8hOUYUzA+sjDdn8SkO5C8aMMcssQG5fgBC4mYvzD81KrNN3YHT1mMVqDqW3Q7ajS
         MlLfmG6Z55YBM3XzoNWkVvfsuTvi5aWqQ+FBr0KUmKwB8nqCuASP8pVB8PKd5+SwNpcg
         pBCw==
X-Forwarded-Encrypted: i=1; AJvYcCWldhYnrIXjXT5EG3GHlToDc6au+n5QrWu6CQOrgv2oeynwatrLa9TVdye4FtvfDEqBa+ed3UfKhFz6tx8gKviHg8QIXRaVrASxoidSkZOgoaG/Vf/JMWexB6aJIR7hl3/b+gfOny7FnnxDjQGHr6+iZUVvJJ2PK0SBWtSMlXWHkQS3vM3WL1YYifPBFeJIQ7meeht0osryujgdMwjsVBK8k/Q0+D8Z
X-Gm-Message-State: AOJu0Yxzd6p/4CtMJrFw24Yo20OAmyjGLDLTCenzYilTm6wwg933LIna
	8u5KT2KoOC5X3Bk9B4/wsbmDtFVUu7X53X7Tg2OTkkBrPwYcuoose0FFJG96ZssxyKP7s8evOzi
	xYn9rEllVZLRUi+xHtEec5e42XEU=
X-Google-Smtp-Source: AGHT+IHcW9OQetK9tkbITect2sTp6OO3zxB/F1M+lzzi8s7lswUbebD05U4oMiYA9j3TDmHYe5iR/6Ccln61ys/yBoI=
X-Received: by 2002:a05:6122:c9f:b0:4ec:fc20:a51a with SMTP id
 71dfb90a1353d-4ee3e980ac8mr802618e0c.9.1718304949331; Thu, 13 Jun 2024
 11:55:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240610233221.242749-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240610233221.242749-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <6b3fe242-3733-4f16-b727-494dc1d82002@kernel.org> <CA+V-a8vp0qHKqUMvyfy9hQjKyk8Cs0bDTnYh-ChvPi150r5i2g@mail.gmail.com>
 <3d0a7a82-6262-40e6-be25-4a1c4d8df2fe@kernel.org> <CAMuHMdUvtUWdEfN_=gNJWY+qfE6Yw9KdenQ2OkLc=HvmRnB6pw@mail.gmail.com>
In-Reply-To: <CAMuHMdUvtUWdEfN_=gNJWY+qfE6Yw9KdenQ2OkLc=HvmRnB6pw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 13 Jun 2024 19:55:18 +0100
Message-ID: <CA+V-a8svpo8FYanyV9gKqmp=tCm+Po5cAi8VPmgFBnyDJyJQWg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/4] dt-bindings: clock: Add R9A09G057 core clocks
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Thu, Jun 13, 2024 at 4:15=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Krzysztof,
>
> On Thu, Jun 13, 2024 at 2:56=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.=
org> wrote:
> > On 13/06/2024 11:57, Lad, Prabhakar wrote:
> > >>> of section 4.4.2 which cannot be controlled by CLKON register.
> > >>> ---
> > >>>  include/dt-bindings/clock/r9a09g057-cpg.h | 21 +++++++++++++++++++=
++
> > >>>  1 file changed, 21 insertions(+)
> > >>>  create mode 100644 include/dt-bindings/clock/r9a09g057-cpg.h
> > >>
> > >> Missing vendor prefix.
> > >>
> > > OK, Is this just for new includes being added, or do you want me to
> > > rename the existing Renesas specific includes in here which dont have
> > > vendor prefix?
> >
> > Didn't we discuss it?
> >
> > I commented only about this binding.
>
> Yes we did, in the context of the R-Car V4M DT binding definitions,
> which became include/dt-bindings/clock/renesas,r8a779h0-cpg-mssr.h
> But Prabhakar was not involved there.
>
> Note that I also asked to include the vendor prefix, see
> https://lore.kernel.org/linux-renesas-soc/CAMuHMdU7+O-+v=3D2V83AjQmTWyGy_=
a-AHgU_nPMDHnVUtYt89iQ@mail.gmail.com/
>
Oops I missed that review comment.

Cheers,
Prabhakar

