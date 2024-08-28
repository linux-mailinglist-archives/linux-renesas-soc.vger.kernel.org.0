Return-Path: <linux-renesas-soc+bounces-8469-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7871A963175
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2024 22:09:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED3C01F23022
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2024 20:09:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3BA71ABEC2;
	Wed, 28 Aug 2024 20:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FIiHYwsg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB9D1A7ADD;
	Wed, 28 Aug 2024 20:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724875785; cv=none; b=hqirOlApSuejR8/Oqg1fgXK0QO3LQYnnit0X/aPvq4YeM6nVBY3EA2wCboUXn8Yt4k1kVylS4KGUEfMd9ITFyWwXp/EQKVMkCtO80ZcdqgLRaj38pKQPilRRAvomuM8cv++wHUNlMlLXFMvasfwCsa4vNkyeACxVbiLXYnqOFaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724875785; c=relaxed/simple;
	bh=niLOWr8T5ul3QgxAAyLjthE5PQTlsIzYtckVXI37+Jk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AlpTRE0NGcyjGbbl2Jy8rBPiN3fqxFx+VHNVb81vFvHd5SRlupouYzL/mhRw4cgxpgGWEQVwgY6IwNVjowmFTbKEldf4/uY+KeyvcEXI5o8xK686ZTid/hkM7qZpQFTRovVL7PJT5jTPvLlLl+HLzId0w9wAhoBxHpTj7kUE8Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FIiHYwsg; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-498d7c37921so2712220137.2;
        Wed, 28 Aug 2024 13:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724875783; x=1725480583; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o1pVcUmgndbgPpPcbtJpRc4TGy9tBS6z6TXDpJAFIAc=;
        b=FIiHYwsgGgBLiLFmUh3tXmi2/ErIGVp3fxfVOImIfQ3eMMx5694ZC8o85vk/5J1XBc
         Lhprs2IUL2YDPbbMh0J3HlqF5Ii8TU5WizVsFfOnkXzHz+cJWhCk9YRta2mWKoHuzttL
         dzIgsHEdY0Q/JpMPmNd1a5xFdupYx7KwGiRKj7Ajv4yMRBQfcfr8ZHX8jUFzdDlCXji1
         MqNr77im2ly/5jf9PkeqGwKnmZNK3RF/JegyyU6z3+ikre1tOTuaPE2azckWxsurmul5
         oUVxrmHymXYA3vtXUpO568kRWMaUqyomAIzUK4UmyMWYEFiOQ5SCz9cDNhZIP2/u04Sx
         dUiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724875783; x=1725480583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o1pVcUmgndbgPpPcbtJpRc4TGy9tBS6z6TXDpJAFIAc=;
        b=U1wkwBWFA4b3BXFKRCykTc+waKbwmdqQ2odS+xO0CmyKPTDJ9UckVkb0uuYqx9KjlM
         GhiKDNT+JlHXvk2V5pUekz+sGBMYnJj8SPL9xDTwLCDVbSbBQqD03FVcIS0kCR4rIl9z
         G1eyW++IaQoyckloxmh9htM1RsWcoSVzLgswXwRUfFGweAkNTBvdM2R8NNrFozCC+vHU
         Uh/T/NKZbiULoa602bfvBMHQuwFmKev9duj7kU/7nYoVirBgbl3KkiPo8sneDd9ohOAP
         5L2RYaXKY9pPS2HuVYRzp/mE6queYzrk8F12rL1WIeEn/6Mvsd3v3ta9dV1OQpOKyTT3
         oipg==
X-Forwarded-Encrypted: i=1; AJvYcCVFqMQiK8W2xM4/s8cJWuXc485Xo5a0wnXpsBGo42HlAdQ4AwUL0YB/DEi5FY3PmYy2yEGH55OAEZS4JJQI3aPamuA=@vger.kernel.org, AJvYcCVT/ZaOJlzFdbP5QXiUuAEl08C/nkrtYAvQTrjF0GFuvfsPt8NpimBjFi+lLjA2QFSmowluH8uy1hOkoc8H@vger.kernel.org, AJvYcCWr6r3V0ekQY7o0ip96xe4DqjiQkzqKX6ckVr8NjfFg5Unuk/UwV/FS+rIZhKHzJjN0Rq8lHaAa5OIV@vger.kernel.org
X-Gm-Message-State: AOJu0YxLxxcjMEaynliT3KMKNibGOli10vGNiK6EPOAj0UFUa8Ju+aj6
	gP3qXadciBA9A1qvZurNcCclC7IUYwuY8XtAvD/R3ABpBNriggF90PZW5Dyz8Mcxnopw01CeEeD
	KNb5N7Hptfor/CaOJbcvdhmWBLGc=
X-Google-Smtp-Source: AGHT+IFDhVml3mhS2bu7DLOKnVVwS+t0D+TQPaszBUekGY9xtmn0bs3r6h2aO1ysvh4Q+YZfZ0KDVHbkavVJu+kTuro=
X-Received: by 2002:a05:6122:2a51:b0:4ef:5744:483 with SMTP id
 71dfb90a1353d-4ffe4b8a567mr645241e0c.6.1724875782608; Wed, 28 Aug 2024
 13:09:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240828124134.188864-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240828124134.188864-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <28106585-59d1-42c4-af56-89820b15bdfb@kernel.org>
In-Reply-To: <28106585-59d1-42c4-af56-89820b15bdfb@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 28 Aug 2024 21:09:16 +0100
Message-ID: <CA+V-a8tGBQTNLEBBKTi0Gy47CsdFpQKQkwP02omSWTt8DveqGA@mail.gmail.com>
Subject: Re: [PATCH v4 1/9] dt-bindings: soc: renesas: Document RZ/V2H EVK board
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Wed, Aug 28, 2024 at 3:34=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 28/08/2024 14:41, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add "renesas,rzv2h-evk" which targets the Renesas RZ/V2H ("R9A09G057")
> > EVK board.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Acked-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> > Hi Rob, I have restored your Ack with the below change, I hope that's O=
K.
> >
> > Cheers, Prabhakar
> >
> > v1->v4
> > - Updated 'renesas,gp-evk # GP-EVK' -> 'renesas,rzv2h-evk # RZ/V2H EVK'
> > - Updated commit message
> >
> > v1: https://patchwork.kernel.org/project/linux-renesas-soc/patch/202407=
24094707.569596-2-prabhakar.mahadev-lad.rj@bp.renesas.com/
> > ---
> >  Documentation/devicetree/bindings/soc/renesas/renesas.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml=
 b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> > index d582992aaf0e..b7acb65bdecd 100644
> > --- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> > +++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> > @@ -527,6 +527,8 @@ properties:
> >
> >        - description: RZ/V2H(P) (R9A09G057)
> >          items:
> > +          - enum:
> > +              - renesas,rzv2h-evk # RZ/V2H EVK
> >            - enum:
>
> This is unusual pattern for me, but maybe I miss here something. Commit
> message does not explain why EXISTING boards needs to be changed. What
> does it mean "rzv2h-evk targets evk board"? How does this work?
>
This commit is not changing the existing boards. The entries below the
addition are the RZ/V2H(P) SoC variants. Here we are just adding the
board entry which is based on RZ/V2H SoC [0].
In the board DTS file it will be used as "compatible =3D
"renesas,rzv2h-evk", "renesas,r9a09g057h44", "renesas,r9a09g057";",
see [1].

               ^^                              ^^
                 ^^

              Board variant             SoC  variant
    Generic RZ/V2H SoC

> You have EVK board and now it is not valid anymore?
>
No this is not the case.

[0] https://www.renesas.com/us/en/products/microcontrollers-microprocessors=
/rz-mpus/rzv2h-evk-rzv2h-quad-core-vision-ai-mpu-evaluation-kit
[1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/2024082812=
4134.188864-4-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

