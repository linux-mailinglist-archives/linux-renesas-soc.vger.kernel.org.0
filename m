Return-Path: <linux-renesas-soc+bounces-6724-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DAE916550
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jun 2024 12:36:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6EA1282B46
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jun 2024 10:36:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FEE614A4C9;
	Tue, 25 Jun 2024 10:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cfZ9pfGl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6CC0145B32;
	Tue, 25 Jun 2024 10:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719311789; cv=none; b=tkdSwxGoLujWh/DdnwTDAn2szlfQf3e6T37U0+bP/c66KvIDlgeZl8oiYWskpHPTFiAuAVaC7dEFw9n2FW7ACC1myt+t2jWo4r8EWiIkXT/bIX+G9r4+pM6bowVkw/mFzqrx4uPzGFBqF572/vC4h6dCnwJzUQriODgexhazNm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719311789; c=relaxed/simple;
	bh=A/edzAV8z7PtvkLVb9kCB6aEa856/w8hAsMT9u3UynQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z83z2b2Khtyf9geKoxAq9D5s15NpjADdC6OVHf4krkKhRJxVnaOCLFF/5kzUp8shlYDuPgOYjVT9lsP2pRVeGLqIYXa9cjH+F3MDATu8tahP8oxfsdZ+jdO6eVnp/i273jhv+hT9vSNdugf80xswi9HsKmlHNXnc3nPS6jeblss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cfZ9pfGl; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-80f6efd265bso944079241.2;
        Tue, 25 Jun 2024 03:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719311786; x=1719916586; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PHPTw9ntFDNicGigUncwPH4l9g4mTeT4H7F6L6/ZEeA=;
        b=cfZ9pfGlDr9vsaoCFL6o3M6YWETaGUX7/c6s3UDRvsx9YTNSedMFgB27NAYM7qRija
         2qmi7Px5CXhzhFhx+PzKSXJwkazs2WcysL48WibPVT4vgmECzqqzgAE7eLBQaT86AzAc
         wLw4omy9g15D6Tp7o1H24PqhRvem+9+fiIh8FiYqPmkxd/g121WAn/viPpddYtVi3oys
         TB/V9/IeV8v3xj+a59sKqTI3/QkEbK2ygu6mmY6cljsu2943o93q1vs42MkCFJMdGMRd
         KTbFraPI6Vltx7yMFyamG94ZgvjDK0m3eJlZN/w7dwZnQN15EN2M/OJWjPRdmqisxkzu
         M12A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719311786; x=1719916586;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PHPTw9ntFDNicGigUncwPH4l9g4mTeT4H7F6L6/ZEeA=;
        b=CjSt5XjMPbsCbLaLGsiw4EG7IQJC7Obt4C1btwi5+5kzliZE4tZw8MAzrTf/zw8ULz
         wp9Y64LSE63jtmOL/XzRUTTEFwYv5INFZ1TdGpbymoJt9fNd0bWXYJEiB9kuqzxHTfsh
         p4z+jRksfR32XVY7+pqk42bA6FeXMwV6cXZBIGTrLV07NO56dB/+jotAZBcK5wW0vUk5
         l0kesybIPy9KvINuDtIXa2zLj1pjmK8pefMoFxoK7FZH0dRo+F4i+XHBfnfWL9uP/qLi
         2otuL8GZ2RcPXUQI4tFSGGRt8J0pwphCxBWqt9lcqUoKsA/KlMGAaqnp9eEhB8Fn5aOL
         EJFA==
X-Forwarded-Encrypted: i=1; AJvYcCV1EhLon2BwXEXfYUJikMBQ0gN370T+Tt4qV1bRArAMAZf46WAyiFNHtjrktjFwBm0qa2hTzd2T+nEL1X82q+dsmcloG9Jpp9cJSzhmvCh4e0SbH1Nz3KiaCbG7wihd22Em/XfHk763YngCiSfr/c1w19gpmawHbDlpeF0G9NNrvNtVE9diUtFwIs6sUlACmG/vj0tDBr+msbrLg8d/OLYBm4QQ1njN
X-Gm-Message-State: AOJu0YwSwIx/KTVeG492zY2P+KYH6ANi1SP7AlVgPfue3eIXXyQxR1d8
	JGLLLcAuAVZFSulat52JgM96bqrshNn3I42Bp5OLO6krDoycJwsnBpbprnozBhSVhCVvJblqv2J
	sRpY4TU5tfExfnCyCx0fMwx3sZbE=
X-Google-Smtp-Source: AGHT+IEbU4uGKPcscOaEgU5n3/a0WJA02x2y+Y2tyC0y4agy80W3P+J0OCnJh27GVo3ZSgA4QWaR9HlRydgQucVJ1rQ=
X-Received: by 2002:a05:6122:4a1b:b0:4ec:f018:ee1e with SMTP id
 71dfb90a1353d-4ef6a7394ebmr4839786e0c.12.1719311786574; Tue, 25 Jun 2024
 03:36:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240624153229.68882-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240624153229.68882-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TY3PR01MB11346BEEDB2125402E8A489E086D52@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8vJdUCY4xBwm56C2A3w-gYOWo3MtoMMMfdcDwwsQWY4Gg@mail.gmail.com> <TY3PR01MB11346179D6B17BE023E6C33E886D52@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346179D6B17BE023E6C33E886D52@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 25 Jun 2024 11:35:59 +0100
Message-ID: <CA+V-a8uEz3ub7xbYW6hYpPUaMFV_D6x4tWwMrY-MKhXFi1if9g@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: mmc: renesas,sdhi: Document RZ/V2H(P) support
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2024 at 10:47=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.c=
om> wrote:
>
<snip>
> > > > v1->v2
> > > > - Moved vqmmc object in the if block
> > > > - Updated commit message
> > > > ---
> > > >  .../devicetree/bindings/mmc/renesas,sdhi.yaml | 30
> > > > ++++++++++++++++++-
> > > >  1 file changed, 29 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yam=
l
> > > > b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> > > > index 3d0e61e59856..20769434a422 100644
> > > > --- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> > > > +++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> > > > @@ -18,6 +18,7 @@ properties:
> > > >            - renesas,sdhi-r7s9210 # SH-Mobile AG5
> > > >            - renesas,sdhi-r8a73a4 # R-Mobile APE6
> > > >            - renesas,sdhi-r8a7740 # R-Mobile A1
> > > > +          - renesas,sdhi-r9a09g057 # RZ/V2H(P)
> > > >            - renesas,sdhi-sh73a0  # R-Mobile APE6
> > > >        - items:
> > > >            - enum:
> > > > @@ -118,7 +119,9 @@ allOf:
> > > >        properties:
> > > >          compatible:
> > > >            contains:
> > > > -            const: renesas,rzg2l-sdhi
> > > > +            enum:
> > > > +              - renesas,sdhi-r9a09g057
> > > > +              - renesas,rzg2l-sdhi
> > > >      then:
> > > >        properties:
> > > >          clocks:
> > > > @@ -204,6 +207,31 @@ allOf:
> > > >          sectioned off to be run by a separate second clock source =
to allow
> > > >          the main core clock to be turned off to save power.
> > > >
> > > > +  - if:
> > > > +      properties:
> > > > +        compatible:
> > > > +          contains:
> > > > +            const: renesas,sdhi-r9a09g057
> > > > +    then:
> > > > +      properties:
> > > > +        renesas,sdhi-use-internal-regulator:
> > > > +          $ref: /schemas/types.yaml#/definitions/flag
> > > > +          description:
> > > > +            Flag to indicate internal regulator is being used inst=
ead of GPIO regulator.
> > > > +
> > > > +        vqmmc-regulator:
> > > > +          type: object
> > > > +          description: VQMMC SD regulator
> > > > +          $ref: /schemas/regulator/regulator.yaml#
> > > > +          unevaluatedProperties: false
> > > > +
> > > > +          properties:
> > > > +            regulator-compatible:
> > > > +              pattern: "^vqmmc-r9a09g057-regulator"
> > > > +
> > > > +      required:
> > > > +        - vqmmc-regulator
> > >
> > > Maybe we can drop required to make it optional, so that one has the
> > > option to select between { vqmmc-regulator, gpio regulator}??
> > >
> > I think making the regulator node optional isn't correct here as this i=
nternal regulator is always
> > present in the SoC and this has to be described in the DT no matter if =
it's being used or not.
>
> Agreed, but user can make it optional by setting pinmux as gpio and
> the internal regulator is valid only if we make it as a function.
>
> From, SoC point vqmmc-regulator is always available. So, it needs to be d=
escribed
> as above. But required property and disabled in the node somewhat confusi=
ng??
>
'required' here is mainly to enforce validation for the checkers.
Maybe the DT maintainers can better explain here...

Cheers,
Prabhakar

