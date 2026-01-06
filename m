Return-Path: <linux-renesas-soc+bounces-26331-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 116CBCF99C8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 06 Jan 2026 18:17:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1D385302A0F5
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Jan 2026 17:17:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15002347FEC;
	Tue,  6 Jan 2026 17:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hiMocbuo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09027347BCA
	for <linux-renesas-soc@vger.kernel.org>; Tue,  6 Jan 2026 17:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767719867; cv=none; b=oqMzfDkz6eobDFWWhyueNW7sCA+d4eXHcRMaCIj+hVE3WUwGkjPWjUYi9eiaPT0eodBscq9q9RMq1RG1YO73ublErma5bevkWnkrCB5EsZWRkJB8IJPSBbT0TDQvafDntkUV5HBt5BXlU3oThUJ3vQzmwuQwOyvIVYEO+bnXHoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767719867; c=relaxed/simple;
	bh=+i4yQ/J32R+PT8plwqXy9nxZsppdLI6MyqOJOxsX0UA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C7hn5X//ejvhtx85plpexjeenD4t0b2tIowi9yD5squ27AjtDAXqSVxflqnbkod3ygUf0YggglwN+fF+q0bHxCnEqnavxq/t4gq8018Cr9oXCx2npoJYRtM8QeSZYPqGb0rFTAWZw/OBy6vIDE7OoTdvIEjN+xXuxFSp7BSbbHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hiMocbuo; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-430f3ef2d37so1008207f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 06 Jan 2026 09:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767719863; x=1768324663; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=omNJI0np8/A37o5k8AFHebpXKnjsjMZumbvdbisQAi0=;
        b=hiMocbuouq20a4E84kkzcpFy0wTyvjxkb19fqNq8MeOt0YbWw8Q0kVDMst9zcNlhc5
         DSXmXs1jxCyxMGdojaqqNr96jmonOFPiBRV/8oXllmH6MTbdRnQZXOcol8Hsp6IwmMFj
         MDFxHZCVakbJof1/o8Z45cKHCFzRCAp7tqS0ZETyLsbsef32GQ8+M6nRR0V+CuNphKD7
         D5KrlwJx9S2es9QnZgLQl2YPIUS8PukX6U7D5+CLkgcsrbzSnXTXSGrH2VGKSnkcec1u
         zNI47TMwOnGIKFkqXZjZYe3BK2cXq+ihYKfME1Kw3surlyM1kaGNpjSspwP9zEUeXRs+
         wC8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767719863; x=1768324663;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=omNJI0np8/A37o5k8AFHebpXKnjsjMZumbvdbisQAi0=;
        b=YPscn0peUBZJd8yoZ+dYjI0tRuh/1dU5+iZgpRG87At9ZFIvgSv2gpxR1CCKHbL+mr
         V5Yv6a6R6MxKqOnYsnpCDrAuTGuAaAfXxBg815LhxKZpASelTV0DGGFbstfnSGCcw6qa
         sEEoccrMmUxpbgTAbRAPRML/LDt5vUvcFK7nLLnPcLjZPSYLgC7h9drRLsN6zySyCisT
         q78eBOiDo9944+PhEbaN5kUmH5+1Z4nPkz5U2vmcf0r0v7jknB3VXzDTQWuhduN4Zy/y
         u+qxNPP3xTBC/QEAbd4yABLY8fh5rPKikuxFwtqmk6fU+h8Q9A82u8aL1ZU54+jumzXk
         SPpw==
X-Forwarded-Encrypted: i=1; AJvYcCV5Gp4ICBZFsaiGOJHa/MTSXyJ3EdnWY9mh0aLRq9WEIbwUF/YwGF3hyBY/NlTMtcI+MSuhqW5yJ0TuY2i3VJ8kmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5ylh/KbC4WlqldkzCOLOQs/c5D65NPxoOSPZfR121PDcvM07W
	cfan35Qof0xEqqKgcNWcP9I1FEjABB/zPE+08ceVK2YklOPTy+iOo+NSyHDYaYo3c0iA2yx4FPV
	xZW9RYD+YqVJrIyIvakThbJEeyD9ggg5RswFaGtgiQQ==
X-Gm-Gg: AY/fxX5krDaZlTswYaa2nImYkkvMGdTUR0Orsz9zZ+0W6dJO2P6lnC3ZUEaASkdiY7n
	q3ZEEcx6Pj8tiG1oXkMOeBVD1EGG5hx7iZqglfSbrUMw75ydfwaYkvmEObCRGzUbRyHRfAiXk0E
	rQ3RJpAyRPeGVyeK44cV2qPQYBiTH7n3Bi0GlZe9Xjmg9fexMWCZ8VSz4Eo9KnPGMzLj59TBEzs
	GUOr++GyzlpSfouJJfQngP/s67DMU4CgqfcBV3Wgb0em0U39YLnrMIBQpUw1pV8WTYR2bIULR+w
	HPOBtg99LveXhVhwqb/yD11M6pGJvwRpOZZ/dqteczFr4u2CEZ3278QK/qE4/6Jh2YFKERltQ8N
	BSoLkXOkwlvCM
X-Google-Smtp-Source: AGHT+IGQllKLGXZw9XFWVTR0oSm/60fESFM2NQBn5PGd7ftNxtYras13avla7VpSZwBYhVejhwO84IWLhs7cyffC9Hk=
X-Received: by 2002:a05:6000:604:b0:430:fc5a:40ac with SMTP id
 ffacd0b85a97d-432bca566d2mr5730225f8f.54.1767719863134; Tue, 06 Jan 2026
 09:17:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251230115814.53536-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251230115814.53536-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260102-quirky-hornet-of-downpour-ddda69@quoll>
In-Reply-To: <20260102-quirky-hornet-of-downpour-ddda69@quoll>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 6 Jan 2026 17:17:17 +0000
X-Gm-Features: AQt7F2q6b-vi36w4beMQgm0yTXwRcoRzoZCOAWuXYi8o96TqepqD1zW847R3kRw
Message-ID: <CA+V-a8sY0QneUWQ4A0XCKUGPL8VYkU5NQE2h_cOK=06JG_1c2g@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: can: renesas,rcar-canfd: Specify reset-names
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-can@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

Thank you for the review.

On Fri, Jan 2, 2026 at 11:16=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Tue, Dec 30, 2025 at 11:58:11AM +0000, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Specify the expected reset-names for the Renesas CAN-FD controller on
> > RZ/G2L and RZ/G3E SoCs.
>
> You should explain here from where you got the actual names.
>
> Otherwise you got following review:
>
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v1->v2:
> > - Moved reset-names to top-level properties.
> > ---
> >  .../bindings/net/can/renesas,rcar-canfd.yaml  | 33 +++++++++++--------
> >  1 file changed, 19 insertions(+), 14 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/net/can/renesas,rcar-can=
fd.yaml b/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
> > index e129bdceef84..9bfd4f44e4d4 100644
> > --- a/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
> > +++ b/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
> > @@ -122,6 +122,11 @@ properties:
> >
> >    resets: true
> >
> > +  reset-names:
> > +    items:
> > +      - const: rstp_n
> > +      - const: rstc_n
>
> rst seems redundant. _n as well. Are these names from datasheet? How are
> they called in this device (not the soc) datasheet exactly? Because it
> feels you use pin or SoC names which is not useful.
>
rstp_n/rstc_n are coming from the SoC HW manual and is already used by
the driver (since commit 76e9353a80e9 "can: rcar_canfd: Add support
for RZ/G2L family"). The reset-names existed previously but were
dropped as of commit 466c8ef7b66b "dt-bindings: can:
renesas,rcar-canfd: Simplify the conditional schema". Let me know if
you want me to rename them but the driver will have to maintain the
backward compatibility or do you want me to drop this patch.

Cheers,
Prabhakar

