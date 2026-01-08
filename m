Return-Path: <linux-renesas-soc+bounces-26469-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 01048D05D41
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 08 Jan 2026 20:26:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CEABC303365F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Jan 2026 19:25:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44494326933;
	Thu,  8 Jan 2026 19:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JipJt2W+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF932EF64D
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Jan 2026 19:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767900348; cv=none; b=EbtlO5KCdVVeIfwdcV1PsicxshgoOgUfoo2svUd+JMNYhFb83KJw7u83nWuO7PzfG2yw8CzhI+9HmOk7/P+jhwqfSH1agWx4Vls/wODzD+YaD9+Wwt8tHkVLkwvt5ScgN482yXM2WIaK5Qxk2xZufYkmBHDsxD3LwiZSczEZSkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767900348; c=relaxed/simple;
	bh=c5gOBQYPVn4tooM6tnnZA9Ows98FMtB9AhqimVB02AU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LahHq18+wpKkv1sidG2MpK3e+XgMRfjXax8ctJ7BuUGDsr8x6lOnQHyehOzDb6ZJlyM4XTqzdYOwaml5nkkt6FA8YtV529mW++VoH5uRJF4Kr3ZS+h//F4c3UhTCnUmtmyNvSg+2gkmAKBzUEEifpWiwCtT3qwjrIZ8aC9XtUCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JipJt2W+; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso38426065e9.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 11:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767900345; x=1768505145; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+weAIB5F3GzTAUKoqFrSQrQBjxwtKLdBlEZZpcTkEWM=;
        b=JipJt2W+bwoYgr1vjKGWpsACKo7nrVZ0Q7wqB/etwwc7QIGZiOLlHk3ZEAMoJpubSD
         c99FR/0Ma6v57nvAXNRCTVL4IhEE2EfC/N3vVzKTNggFKdltP52GSW/k9QKb6SJ4geXg
         takOUmQipt5K1ntgoELuafzO6D+RFGrt0J5iX7U4rJj0HLMCe4e6Jry7frYW1K9p5b3Q
         b4moM4cksN2tzQwZ7kYFH+WQ26Vrrt54bb/hKXXUF1+yuKoEglfCZx2CaDhqT4r0zRU3
         ZShSF5RMhpT3HhzvJwIHwxN+uAagZTcdAwI1L/d+0D5iQAPLbYmlhY5GkupMY5941p8U
         ge0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767900345; x=1768505145;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+weAIB5F3GzTAUKoqFrSQrQBjxwtKLdBlEZZpcTkEWM=;
        b=R+vwlz71qrENWgO7WqKuhE5cQ6AmpRYkSFCZZlvYYDbrUYD5tPmhkvXAt7mq9RgU4v
         dnZExPfZck5q5U3bsxy9m80cD8tNzoTn7V+N+QL5pIgmowbRfafXpROCLLCfZSl1B36h
         kDMy4hWraydNrueSLeOOM05IWA5eDclKo+hjodE5NZyeAY6SBz66wz9zUbEkd/rwH2lQ
         un+3FE/dv+7OjtmWtZynqGDwP+eAmySMpc9bbsqJhrwRjG77hVLPpfevPgyrrbqueedX
         QhBXKCtdNwmTi7P0v9rd5Ottk4pV5vY1nGyGO3Qy/uFPKKrP+fay4pJMGzQR5XArY5Bc
         MHaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhJhq3Hrqd/92/Ng0wImv2JopyJKcmpdfR//adQKxIfsv+TExzN71voDCn8h5bo3uyaDS/L4FEoNn6a+KZn3Iy8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ50Q5RCH3GF8mcjSbZ9ugWAUJEJGaqM7Ll6cONatSckc3ZKl8
	m+m3u2NDLQwBuuBWX02AMPmrWgkcf+L9mI1LVmI6qB4UnF6DDOs0QKSzQUe7fjgSt91xDq4YjJQ
	UYePoTAxMILlpbBj0+2qaFEZKoN2ulbw=
X-Gm-Gg: AY/fxX6jUCxT9eTShdshW6gP9pOj4kw1FvPpTo8+eld70iw1SM6hnJCisrpxeXi2prb
	+3M5Ip6HYyYty+45xLNBslkuFBv++wAE78NrVgqZJmoRmC6oY9JYFAWmHqkh8fHX2Pwl71AGS4s
	AJMZk0cw2qNIYMBUaGLkYlpxpWOpHecWqSiysv71r1Xkm7mPhGuLnxWe/oMa/mcPea7vJ4ocsw+
	d8tObIUJUzJfJZBGZ1FccjJba/mMXnEaGJnZZvudtuejQjWQvJMIGoGBP6nIUkebaEPr6+5oHjk
	Z6PAfdQN9EFLANwZAPXR0dOaDGgbWZYaqz2kyWdqlZDHLIDygCLI2qjSuPIROyHXreZggP/mf1Q
	ZTMnw0JtBEwH7HKQL8mBAPaG6
X-Google-Smtp-Source: AGHT+IG9aCL3VMA1gQDfOUOzIBchboILAW5445ty0XjqfyxP2z1FY0Z6LuXzED9a3fq/fLU4RmJQ5Pzcxb6uHWUplVA=
X-Received: by 2002:a05:600c:1d14:b0:477:7b16:5fb1 with SMTP id
 5b1f17b1804b1-47d84b0a96emr83452675e9.7.1767900344555; Thu, 08 Jan 2026
 11:25:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251230115814.53536-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251230115814.53536-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260102-petite-gentle-wasp-81bbb8@quoll> <CA+V-a8sryz1f_woi_r8jx_4x7TczrWPyjZoo+P9p=tG8KyK8YA@mail.gmail.com>
 <124bc6a4-05ee-4682-a0f8-148896eb3c95@kernel.org>
In-Reply-To: <124bc6a4-05ee-4682-a0f8-148896eb3c95@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 8 Jan 2026 19:25:18 +0000
X-Gm-Features: AQt7F2p5rmW7j0FdoOvEXJ_qBw4U8molRHd1kilHxVpDPpzkzw1Jj1KdICQmQbg
Message-ID: <CA+V-a8tbvJvqnrMaY9UA3tf2CcfcyiRFZLgdy7S411=ZUCcQww@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] dt-bindings: can: renesas,rcar-canfd: Document
 RZ/T2H and RZ/N2H SoCs
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

On Wed, Jan 7, 2026 at 8:28=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 06/01/2026 18:26, Lad, Prabhakar wrote:
> > Hi Krzysztof,
> >
> > Thank you for the review.
> >
> > On Fri, Jan 2, 2026 at 11:20=E2=80=AFAM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On Tue, Dec 30, 2025 at 11:58:13AM +0000, Prabhakar wrote:
> >>> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >>>
> >>> Document the CAN-FD controller used on the RZ/T2H and RZ/N2H SoCs. Th=
e
> >>> CAN-FD IP is largely compatible with the R-Car Gen4 block, but differ=
s
> >>> in that AFLPN and CFTML are different, there is no reset line for the=
 IP,
> >>> and it only supports two channels.
> >>>
> >>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> >>> ---
> >>> v1->v2:
> >>> - No changes made.
> >>> ---
> >>>  .../bindings/net/can/renesas,rcar-canfd.yaml  | 26 +++++++++++++++++=
+-
> >>>  1 file changed, 25 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/net/can/renesas,rcar-c=
anfd.yaml b/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.ya=
ml
> >>> index fb709cfd26d7..4a83e9e34d67 100644
> >>> --- a/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.ya=
ml
> >>> +++ b/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.ya=
ml
> >>> @@ -50,6 +50,12 @@ properties:
> >>>                - renesas,r9a09g057-canfd     # RZ/V2H(P)
> >>>            - const: renesas,r9a09g047-canfd
> >>>
> >>> +      - const: renesas,r9a09g077-canfd      # RZ/T2H
> >>
> >>
> >> That's part of other enum with single compatibles.
> >>
> > There is no enum with single compatibles as of in next [0], there is
> > only one compatible `renesas,r9a09g047-canfd`. I can club this with
> > RZ/T2H one.
>
> This is the one which is supposed to be enum.
>
Ok.

> >
> > [0] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
/tree/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml?h=
=3Dnext-20260106
> >
> >>> +
> >>> +      - items:
> >>> +          - const: renesas,r9a09g087-canfd  # RZ/N2H
> >>> +          - const: renesas,r9a09g077-canfd
> >>> +
> >>>    reg:
> >>>      maxItems: 1
> >>>
> >>> @@ -179,7 +185,6 @@ required:
> >>>    - clocks
> >>>    - clock-names
> >>>    - power-domains
> >>> -  - resets
> >>>    - assigned-clocks
> >>>    - assigned-clock-rates
> >>>    - channel0
> >>> @@ -243,11 +248,30 @@ allOf:
> >>>            minItems: 2
> >>>            maxItems: 2
> >>>
> >>> +  - if:
> >>> +      properties:
> >>> +        compatible:
> >>> +          contains:
> >>> +            const: renesas,r9a09g077-canfd
> >>> +    then:
> >>> +      properties:
> >>> +        interrupts:
> >>> +          maxItems: 8
> >>> +
> >>> +        interrupt-names:
> >>> +          maxItems: 8
> >>> +
> >>> +        resets: false
> >>> +    else:
> >>> +      required:
> >>> +        - resets
> >>
> >> Why is this de-synced with reset-names? Properties are supposed to
> >> behave the same way, not once requiring resets other time requiring
> >> reset-names.
> >>
> > There are SoCs that have a single reset and others that require two
> > resets. For SoCs that require two resets, the reset-names property is
> > marked as required, while for SoCs with a single reset it is not.
>
> Sure, but I asked why? We expect (and it is documented already in the
> docs) that xxx-names always follows xxx, so I really do not understand
> why reset-names are valid but resets are not.
>
Sorry for being clear earlier, it's already taken care in patch 1/4
[1] with the below hunk which will restrict RZ/T2H to not allow
reset-names.

+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,r9a09g047-canfd
+              - renesas,rzg2l-canfd
+    then:
+      required:
+        - reset-names
+    else:
+      properties:
+        reset-names: false


[1] https://lore.kernel.org/all/20251230115814.53536-2-prabhakar.mahadev-la=
d.rj@bp.renesas.com/

Cheers,
Prabhakar

