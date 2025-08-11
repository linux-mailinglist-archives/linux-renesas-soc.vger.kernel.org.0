Return-Path: <linux-renesas-soc+bounces-20241-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C00F4B20D2A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Aug 2025 17:11:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59F8742747D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Aug 2025 15:08:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65BE32DEA80;
	Mon, 11 Aug 2025 15:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BThMNPpx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD486A8D2;
	Mon, 11 Aug 2025 15:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754924933; cv=none; b=Pm0yefIkdFcBYEdfRd9K0FN8NfcMWfZ/UKj2GEj+CYtUKNHZD25BMNT7BCHJZRtumrLnh/fXwt9GSQDFwlQNpTUfy1tyZJC1zWz3FGkX8oDo25M9Y3rjZvFkBrxkTfNE3LA7ppDWtEL5nyrRrLaQ5e7XgYH87mWots9QdTrdGwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754924933; c=relaxed/simple;
	bh=gSfGTByAxTf6aQjzOAAaq23+d4fEay517VAQS+SPhxE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bu9jEVLDFng0OJD3YAaeubh4Q1LgJZI4czDihMok6QRzAfGm7ArBXPmcIjmA9TYBj1rJSaZyexRjBZk3ZcBFZSW6BS6lkL7ClQQZoqJsOAJqvcEL1Ligfp+mseHPhnykbdbQe+bDh58fpaFlNEZz0KqI/66p+zLRN4e2wDU3weo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BThMNPpx; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-459ddf8acf1so37973585e9.0;
        Mon, 11 Aug 2025 08:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754924930; x=1755529730; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b2mT07260j9zQg6uZKIOUV2LzSLtm0K5b/BNFoyA2cQ=;
        b=BThMNPpxIyKtxBzjL0HdNwjQLz44BbkmXLcx6VIzRJLjHrNYj2OicUC732Qkq4FhEW
         M6q3oOHUFRngEzyv11T/aXPr/q8WU7wiYJvYJDC9jzbH/HzWRjrZVS30YPRi/eS3pHWQ
         fe/YW0WyyxImqasPXQjJ3GCZBhLhQ66JhB+A7RLgTaZ9yMRbVXDTQjPc6k3NIHeLxZ1I
         SpFRsdO4P5OKu41VriO3b4kJAROhu07SjoaEIDRx//Ki1iogZTOsBw4BxwpFtPQOHlqA
         KT8CEIWKtUCDN6N66BwN9fk/9w/ke/YExxcYgAfXkkZFyYtCKn9K2rv3CPt68Lua8SC7
         qRDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754924930; x=1755529730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b2mT07260j9zQg6uZKIOUV2LzSLtm0K5b/BNFoyA2cQ=;
        b=AT1NPWeP5Y6OBCCSj76xjH3BCnW1P9bMEkX3xerBMkM4C80CwBXnC7QWUQcsarsLDc
         wNI3HnFHokT6ajFXBEnbEW94v06TzLExRhsbdImACC5HuwPGQmYCQfiOhrozhVpJLxwX
         VJvY9HulI0C2KWfdqqZA0Mtn669RM4leCinIp77i6U4MU0lmUPpNi5micaXrwq2zTH51
         0TKzLoGJKXwaefojSenzTFUilJHdTVg11qWnDsgs0g4mZmEgDG3xBA44cNIZjmGSijfb
         5Hokixfne6Lh3MdJAZEj0he7RILwAtOzfEk6bj85ikaUWPpSICvzpPkEQ2uVuUWVC8gq
         4kGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYayyynY4AsbGN4kijk2S5qLcNI3t/gCkOMaq5idDlchzDIG5nxZb8VLeUKtEGlEx/xqhU7eUAIpPX@vger.kernel.org, AJvYcCVfJXYESWFA4iBArUMtL63FoAEtnEvzDkDW8fIL0NsI8t3/4nKYnwLrCE1waNgX9GkFn9grbcQpKLqXExEjat+6pfI=@vger.kernel.org, AJvYcCWXo/7WlT0oIWeQpxam4Q7Ocu8Axd3APRa1iSlJjl3txguO3/jQsst/k86uKU6KOi5LuBZcN5MSbPh0A4Da@vger.kernel.org
X-Gm-Message-State: AOJu0YwQSpi5scwo1uAk23mDazR56x5tRHIveG/8p5gTSTiLqVAWeVE9
	JXDkEDwpdyvUvj3QoN9rjxHjcSuOjyI7USXcbK8ufH3RPWhEZEklXk6old5lP0eChYSZpCOoMK9
	jHz8ZkD79U+Qm4YiWkcaxggsBp/vQB1k=
X-Gm-Gg: ASbGnctNAxMZoSKqa1ILbQXaeFk7uOsr1TZr2EwZH80C2LzzXiX+yJnLjQ4mg75439n
	5xFpOB5PryZ4LE4huQqS7qZ+NRdeAyuW+eIW2efdVzioSLO7yinGHNRB0WG/sTp28TMvJ5S6QEe
	UIwkRB6PwOimfk7dVm3K1i5cMPgNtlEuh+q4cI2QkOV3B8srUl5G17+qrUhapnkluNoIOoTBzDp
	q2xaC9C
X-Google-Smtp-Source: AGHT+IFPIwhbMGFzwumJFgEWDp5HfmM1oE91YavrIFuKWbHJMtZXc6O18JEPSbJNATNOBkMBfB1aDm8IoJjXYE6ZKLY=
X-Received: by 2002:a05:600c:4ecb:b0:459:d3ce:2cea with SMTP id
 5b1f17b1804b1-45a10b94197mr724745e9.6.1754924929716; Mon, 11 Aug 2025
 08:08:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250808215209.3692744-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250808215209.3692744-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdUWo=hYPWPrweoYn5rFC50aV5EV1xqwFHmLp27GRjEADw@mail.gmail.com>
In-Reply-To: <CAMuHMdUWo=hYPWPrweoYn5rFC50aV5EV1xqwFHmLp27GRjEADw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 11 Aug 2025 16:08:23 +0100
X-Gm-Features: Ac12FXzh41CBAYGJYTtCIB8SAaZtRyhBbjbdQizzy-i4NhoC-8oCDnrAWA1TbFA
Message-ID: <CA+V-a8vW2-YG8=-u3kUcrou+nPVLn2uhE-W+JOHpu9Cahyw2ZQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: phy: renesas,usb2-phy: Add RZ/T2H and
 RZ/N2H support
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Mon, Aug 11, 2025 at 2:34=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Fri, 8 Aug 2025 at 23:52, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Document the USB2 PHY controller for the Renesas RZ/T2H (r9a09g077) and
> > RZ/N2H (r9a09g087) SoCs. These SoCs share the same PHY block, which is
> > similar to the one on RZ/G2L but differs in clocks, resets, and registe=
r
> > bits. To account for these differences, a new compatible string
> > `renesas,usb2-phy-r9a09g077` is introduced.
> >
> > The RZ/N2H SoC uses the same PHY as RZ/T2H, so it reuses the RZ/T2H
> > compatible string as a fallback.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
>
> Thanks for your patch!
>
> > --- a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
> > +++ b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
>
> > @@ -120,6 +126,17 @@ allOf:
> >        required:
> >          - resets
> >
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: renesas,usb2-phy-r9a09g077
> > +    then:
> > +      properties:
> > +        clocks:
> > +          minItems: 2
> > +        resets: false
>
> By the time this hits upstream, you will probably have reset support
> for RZ/T2H and RZ/N2H, so you just add renesas,usb2-phy-r9a09g077
> to the conditional section above?
>
But the above will still be true as MRCTLA/E/I/M register doesn't have
any bits to reset USB{PHY} or am I missing something?

Cheers,
Prabhakar

