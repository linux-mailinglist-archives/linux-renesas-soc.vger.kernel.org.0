Return-Path: <linux-renesas-soc+bounces-26604-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7134ED12FCD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Jan 2026 15:05:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 70A18300768B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Jan 2026 14:04:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4A4833DED6;
	Mon, 12 Jan 2026 14:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eHoJUS7S"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A67331AF24
	for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jan 2026 14:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768226698; cv=none; b=P5BgTWvfDHRvn8LD2VStQDRcYpXy3DJcbh4Oa6dKy0j3ZQTOztQZDbW8ZpzRPDLXtEdE1NaJupNGT4RMaC7fIEmuCvf7KWtgdL8fzERZcQle89LElxEMy7et2fBZbFVKNMvq/6zfmtIk/fiUAMvwqaw2JGspKKcZw+30c7QJ3iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768226698; c=relaxed/simple;
	bh=LWDLF/0qc2IJAkTfqjMmJwagN0QggUNuy9Vop+kjMsM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q3ONPVbQTgLZ+P8SRvdJq0sWEZFFMC7C20AMkBqAmnKkMI5vDXBLUxE2wWVyYvisND7sQ9Oc7ftIECb5w37Y/h2I7ohlogS9SCIRh4wJaIpGnoFf7lT++AWfhdLNdksUzgEs8G9DGvvENe8xuFDDZ/Yy8bOZEiwlZe/aFEWJBAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eHoJUS7S; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-432d256c2a9so3032793f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jan 2026 06:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768226695; x=1768831495; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0vII5Iyr4tFx72Sau8GzITZuDHj7rLr9Zb3k5UjDt0I=;
        b=eHoJUS7SzIJ1OaxGw/9gkY8qBB3mDeK392NAoQBUxpHFgAiwVVYvVwSL/1dFNGWsyy
         08WPrFtstlz30yOQV7XibGmAvx9l36i2zQVOI4L361W3TYarIAHjcrqq0lSrC8vmNh5e
         hkbGJnpu6LZZ0BY/I8b6hXNqebtDtovDtBWCJPby5w1Zhb5PjkIciaSBWPXBOqplMz5o
         gFgk4vWMZjWp4Ba7bGlnzTD0xChFArjnpQo45khGH/Hfa68VrWFXAORCbuQ1ZRjuIGct
         bBP2Qngvexwxq90hZCZQ1vOd4PIICCvUFBotrIW3LZyqhLSOxRRxnEYWnMqqt9+d0OeH
         h2Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768226695; x=1768831495;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0vII5Iyr4tFx72Sau8GzITZuDHj7rLr9Zb3k5UjDt0I=;
        b=Y/aFw+VN2W8XdiXHPj7N23NL+GCc56ZipgMoElOEBzHtyqAPCETs2cIR7RDHhM3b9x
         DPvNNXmvvx7AyFt9IYk3ZY+T31xrz2UOS9JbEGUSHUSBlv3C+qzoA/ybtoLuH5vigh8H
         iRkYmgV1e/FCzQHcsFuawAIcu/9dvtqI7PROcFUKdRrRgSK+HJQpKgA4UyH6DsR11tij
         18taKRxi0pZb/XJAcYOUOPzjW/TLKV3VH+RvhZcKBWnFKG+j72TbYZWPzguiehZGac+Q
         /c20ztQK2c5aUIGPnbB3Qg8IqRETH6a7DqWy/csFinoLV9vhUXrVFvhc3/WecrbI3ZJc
         7hAw==
X-Forwarded-Encrypted: i=1; AJvYcCXqFyqYviRLjt182xj4dZko/bOunhq950InBk7j6MFotlXHx+5wltIPnoaL0o0UnkT+fmYwJSlC1ZWUF6Gj501j9g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJAxNpoRO7K7cHm/ZpyhabIPsvbMhJ4X6E0w+ooTBV6aN8V5SH
	tOvswGUS3J9CAzQXZ32tProQlFCyRKCgprSqM52dXWWvttC1LPifcB4bcOBP39Qu51MqHsnB0AR
	Brls4f+SiTjZK6kPF8Va+ghFEKhb/9tA=
X-Gm-Gg: AY/fxX57R5W8CVD/QdbpJdpKeJ0aebUko1T1ev4PQ0PMQlOSFh5VxoN3FGNg7UU3PfZ
	A7yxfNnyrLzvKUn9WwllBtxNPJyGbgd8EmndJbrvQZp4wUyWuJWyIg4wdezP4ImU9bpxWAi4xYb
	t9l37/n9H9MObXnMi7NC1As6HUp0ehX0MtQRfXi+2KRxxhDDPoYGKkZnelXyD2YeObNXu6X2l4y
	hbKjRcegvx+2SSr2Yz5QUx6FlSI2khGdBQn/S2syLE/CdFGQLvYC1uzwIEKLkLkzkO91uWh9+G4
	VLQIbYcxe3YcpVvo65Mlx6Y5Ar4Q9lFKmc7n/69ZmrMaAfWZ/eqCOYCp8IZF1It8TA==
X-Google-Smtp-Source: AGHT+IFasiQVmiSWN3alevjB2wINY+JZWIZGP+T1vx6rQYLMCTq818PLQDkbeEXyvkByXdaBd2DafMJKteYBkMr6a/k=
X-Received: by 2002:a05:6000:184a:b0:430:8583:d19b with SMTP id
 ffacd0b85a97d-432c3794fa7mr20770566f8f.33.1768226695062; Mon, 12 Jan 2026
 06:04:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260109125128.2474156-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260109125128.2474156-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260111-poetic-dark-butterfly-97993f@quoll>
In-Reply-To: <20260111-poetic-dark-butterfly-97993f@quoll>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 12 Jan 2026 14:04:28 +0000
X-Gm-Features: AZwV_QgBJ-ITSnXEpBvtqgTNJdonFuwpB0mqy1ZeJZ8vITBprryHClwY27DWAJ8
Message-ID: <CA+V-a8un48Gfqg-K6YToxUgnZawOcb-nQHsBcOfHdpAR7_Uu4Q@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] dt-bindings: can: renesas,rcar-canfd: Document
 RZ/T2H and RZ/N2H SoCs
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-can@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

Thank you for the review.

On Sun, Jan 11, 2026 at 10:14=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On Fri, Jan 09, 2026 at 12:51:27PM +0000, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Document the CAN-FD controller used on the RZ/T2H and RZ/N2H SoCs. The
> > CAN-FD IP is largely compatible with the R-Car Gen4 block, but differs
> > in that AFLPN and CFTML are different, there is no reset line for the I=
P,
> > and it only supports two channels.
> >
> > The schema already enforces reset-names only for RZ/G2L and RZ/G3E and
> > disallows it for all other SoCs, so only the resets property is explici=
tly
> > marked as unsupported for RZ/T2H and RZ/N2H.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v2->v3:
> > - Grouped single compatible entries into an enum.
> > - Updated commit message about disallowing reset-names property.
> > - Added Reviewed-by tag.
> >
> > v1->v2:
> > - No changes made.
> > ---
> >  .../bindings/net/can/renesas,rcar-canfd.yaml  | 29 +++++++++++++++++--
> >  1 file changed, 27 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/net/can/renesas,rcar-can=
fd.yaml b/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
> > index fb709cfd26d7..ceb072e0a304 100644
> > --- a/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
> > +++ b/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
> > @@ -42,7 +42,10 @@ properties:
> >                - renesas,r9a07g054-canfd    # RZ/V2L
> >            - const: renesas,rzg2l-canfd     # RZ/G2L family
> >
> > -      - const: renesas,r9a09g047-canfd     # RZ/G3E
> > +      - items:
>
> The convention is enum and that's what I asked. I know it is a nit, but
> if I give review now for this code which I disagreed, my disagreement
> won't be ever recorded and people in future work will base on this less
> preferred syntax.
>
> So again:
>
> - enum:
>     - foo
>     - bar
>
Agreed, I will drop the "-items" and I will also move the single
compatible list entry to the top based on the feedback [0].

[0] https://lore.kernel.org/all/CAMuHMdWz6_NzvjZNMLk+Bqoa0NR2CKNFwDXynfmrTZ=
gOGsqxTA@mail.gmail.com/

> > +          - enum:
> > +              - renesas,r9a09g047-canfd    # RZ/G3E
> > +              - renesas,r9a09g077-canfd    # RZ/T2H
> >
> >        - items:
> >            - enum:
> > @@ -50,6 +53,10 @@ properties:
> >                - renesas,r9a09g057-canfd     # RZ/V2H(P)
> >            - const: renesas,r9a09g047-canfd
> >
> > +      - items:
> > +          - const: renesas,r9a09g087-canfd  # RZ/N2H
> > +          - const: renesas,r9a09g077-canfd
> > +
> >    reg:
> >      maxItems: 1
> >
> > @@ -179,7 +186,6 @@ required:
> >    - clocks
> >    - clock-names
> >    - power-domains
> > -  - resets
> >    - assigned-clocks
> >    - assigned-clock-rates
> >    - channel0
> > @@ -243,11 +249,30 @@ allOf:
> >            minItems: 2
> >            maxItems: 2
> >
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: renesas,r9a09g077-canfd
> > +    then:
> > +      properties:
> > +        interrupts:
> > +          maxItems: 8
> > +
> > +        interrupt-names:
> > +          maxItems: 8
> > +
> > +        resets: false
> > +    else:
> > +      required:
> > +        - resets
>
> I do not think you are making this binding easy to maintain. You have
> now multiple separate ifs AND two ifs with "else:" condition. Try to
> understand which condition/description applies to "rcar-gen3". Does it
> require resets? Let's look for the compatible in the file - you find
> "if:" block requiring reset-names but no "require" for resets. Odd.
>
> As I said last time, these should be alwaysy synced.
>
Does the below look OK? Ive grouped them based on no rests/single
reset/ two reset.

  - if:
      properties:
        compatible:
          contains:
            # SoCs WITHOUT resets
            const: renesas,r9a09g077-canfd
    then:
      properties:
        resets: false
        reset-names: false

  - if:
      properties:
        compatible:
          contains:
            # SoCs WITH resets and reset-names
            enum:
              - renesas,r9a09g047-canfd
              - renesas,rzg2l-canfd
    then:
      required:
        - resets
        - reset-names

  - if:
      properties:
        compatible:
          contains:
            # SoCs WITH resets but WITHOUT reset-names
            enum:
              - renesas,rcar-gen3-canfd
              - renesas,rcar-gen4-canfd
    then:
      required:
        - resets
      properties:
        reset-names: false

Cheers,
Prabhakar

