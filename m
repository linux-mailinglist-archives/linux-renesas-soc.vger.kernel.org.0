Return-Path: <linux-renesas-soc+bounces-5681-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0278D4016
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 23:10:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F18591F23B65
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 21:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F2EB1C8FC2;
	Wed, 29 May 2024 21:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QWSteaDg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A7F1C8FA3;
	Wed, 29 May 2024 21:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717017036; cv=none; b=urSPS9qMNfQXsC4A8kEDoDw9gVxyXqln9oVTPvWY4SYo9H/mcBuDegojDOM5L+pyDvBVQPiWOGOcqq4oF5PuTWY08FneT9wRnc8+FgSn38VyMolWklI6F6iCLuHD6rMKX/fxml1zb7c77wSfZIbo88u7US1GiqNPh+YLUmR5dvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717017036; c=relaxed/simple;
	bh=TExKMv+4EbRU2xpWl+6GrHNg8ZxwE5ZYEj2H6DGcaR8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jDvEu1ORy93dcq+IDWzyRztDjX+TMoOq8ZleBNu+6+uf5tnEhYe8VgTH86InREFO6CS00nLMpUCiXqLO4GjZDX+hxncs0oFC8o/Hz9/BMv0BQXQk1mK9aG6iaNhdpUE8Iywzbdy2oTrszDwl39jlfmbyP1VBtDr6oyejlVYOt8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QWSteaDg; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-4eaef863a08so65167e0c.1;
        Wed, 29 May 2024 14:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717017033; x=1717621833; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TeBhPfv3doSS7LHW7mFEHvT4SBZTyVzMD92UNoRgcAQ=;
        b=QWSteaDge+gQWr85WPnZw+lNF+JMkGp2Xrcna3hgpxMpew8UHwirLj+AH+jNsW3P6g
         A0KY+wDV9UihhCknFduXtF4ACo67Sga4zS3GfnQLVvsV2b/SaBjuCv5YcUxJsuUalI6s
         EXKEr8FJKnr/SWzvXsZPlk/GvIcp40+895F4HOfR9StJg9lJ+SOV4ZBUllaPP7gnOQi/
         70WWFAaiHr8hD8JkT67/atSaec+jdTSQmqcOPK1fK9ozUVJKAEg1ZmKepLP8m6NBMyGW
         sQP8To7sVJwJmupQFlMG3h4jgSjQHOERssovu9jZENY9VNIEE1qKwJ3dtiU7VfqIhne+
         TqPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717017033; x=1717621833;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TeBhPfv3doSS7LHW7mFEHvT4SBZTyVzMD92UNoRgcAQ=;
        b=T7RmyzB0WgCijf2OCl3SPKH3ndwr7g9WzwrdW3LKGbWg3ubwHjFPIlhRrTnIRWkGax
         sfuNT99EdVKiwZiIZvI+C3yCTF+zBRLqbp6KCVbWwpjaavYW4/QxKYkDgYCe/Q8rFqq+
         dn/U5AOxHZ0MkNPvFu2MxwEWBsYj+8jYUAKBJQwhdo1FlW6ats/5WhnOsUm+HrC+69nU
         Tf/BOWfLmQukcQffYqzDt2Y4NuFwHwWl6+w4v86q5Zc42L0UVUcrqF/fztk3iQblocMr
         6Ikd3RKSs8eNiKowrMgOFpeWH2Q+DhQGKtIjTByS3FV/aYp/c/NkKIrg9n6httO51fvN
         6avg==
X-Forwarded-Encrypted: i=1; AJvYcCVqhbwyy9cAu9B4OFibVoKDpYG5239kSlAPxgwipI4xOyOV6ScNQov8G7ZOTKZauZ/m1zrRAmdBTJKB4wd8XhLCWH2TE9qPcaf2z3cS0l/YVFU08Weta9vTuoTYKjnGH1SH3k2Nn/rch/jMstnYwwGSwD7fat4xc6CFjv7YwF4HlEKyXTbL0rpVihkFfqRfP4zgIhqO5e24m6EkCQA2BbAOFwmbsm2M
X-Gm-Message-State: AOJu0YzWHBdWSoPcZFc9mTtwhTIY7cgW06jbsAwx+4u4fpk3Pg1DDlfu
	zwjwazZ4I2hBTO4MpmWHLlCjHhFLqG6sLVxcERBtGuOg4Q5VjTrn/hSVsYoEUNWoXieB+SZUKjY
	v/hnYg64KY7tCbymJlwU/I9GhxRqJ+LzYOiY=
X-Google-Smtp-Source: AGHT+IG3W0S3Z2Qe9a0+buJwHRoZAUEH7EgzRGQidkKafkzDX/o4tZaGyxUyz+m2abkLCU1Mb4Kwbf8Ewf5XjrfBUVY=
X-Received: by 2002:a05:6122:91a:b0:4e4:e98a:7b02 with SMTP id
 71dfb90a1353d-4eaf2186157mr318895e0c.4.1717017033385; Wed, 29 May 2024
 14:10:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240524082800.333991-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240524082800.333991-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWzZP2d6kRw1oTkMYgzS46J68gR_bg14==HCvVpkp0sJA@mail.gmail.com>
In-Reply-To: <CAMuHMdWzZP2d6kRw1oTkMYgzS46J68gR_bg14==HCvVpkp0sJA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 29 May 2024 22:09:14 +0100
Message-ID: <CA+V-a8uxwiof-hLPRpYCnDkVs8tj+-+v8GQLSSkMFUP13cuoXQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: clock: Add R9A09G057 CPG Clock and Reset Definitions
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Mon, May 27, 2024 at 10:18=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Fri, May 24, 2024 at 10:29=E2=80=AFAM Prabhakar <prabhakar.csengg@gmai=
l.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Define RZ/V2H(P) (R9A09G057) Clock Pulse Generator module clock outputs
> > (CPG_CLK_ON* registers), and reset definitions (CPG_RST_* registers)
> > in Section 4.4.2 and 4.4.3 ("List of Clock/Reset Signals") of the RZ/V2=
H(P)
> > Hardware User's Manual (Rev.1.01, Feb. 2024).
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- /dev/null
> > +++ b/include/dt-bindings/clock/r9a09g057-cpg.h
> > @@ -0,0 +1,644 @@
> > +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > + *
> > + * Copyright (C) 2024 Renesas Electronics Corp.
> > + */
> > +#ifndef __DT_BINDINGS_CLOCK_R9A09G057_CPG_H__
> > +#define __DT_BINDINGS_CLOCK_R9A09G057_CPG_H__
> > +
> > +#include <dt-bindings/clock/renesas-cpg-mssr.h>
> > +
> > +/* Clock list */
>
> No distinction between Core and Module clocks?
>
I was in two minds here. Would you prefer clocks with no CGC support
to be listed as core clocks?

> > +#define R9A09G057_SYS_0_PCLK                           0
> > +#define R9A09G057_DMAC_0_ACLK                          1
> > +#define R9A09G057_DMAC_1_ACLK                          2
> > +#define R9A09G057_DMAC_2_ACLK                          3
>
> [...]
>
> > +/* Resets list */
>
> [...]
>
> No power domain specifiers, as mentioned in PATCH 1/4?
>
OK, I'll add the power domains in this patch.

Cheers,
Prabhakar

