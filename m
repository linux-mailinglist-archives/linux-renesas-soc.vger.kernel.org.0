Return-Path: <linux-renesas-soc+bounces-22870-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2F2BCBFE0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Oct 2025 09:55:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A2D21A640C7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Oct 2025 07:55:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 086352750FE;
	Fri, 10 Oct 2025 07:55:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C47425A350
	for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Oct 2025 07:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760082927; cv=none; b=NTFXYuTF2jkxuBV2rPBW/2TKCMQ9no15O0Af02pVUXERma1SXPY5wLysR+mza9gFSGH7F2Ygf2ErgXqMCs8/A8gEC/gWCCt7DOohBa5DVFHpx0GH4InAG7zMIatSyNaF69ZE3vKZ8igCQiAwNcUK7//75LRt7u+aYGNSqhreiLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760082927; c=relaxed/simple;
	bh=GyMrdUSzxTxaoShfISf9Kv4vkeRyaQViM9pgJ0KDv+4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ogf7QY3qB3VYBDyzPRT8Ejrq/jlePpYHnMspdSbemuhrvYXfuIjmCmqq4Xdz6721mqTnhBdwRPWcYsi2Lor1E81XIOYAQngxtwysY/nhZflNlkSOoYkRzVj2NjGe1x8X8F+j78RSfyXhu4tVMmG8iMoDVf1mgMzKzhvDl3Eu63Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-54aa6a0babeso2166246e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Oct 2025 00:55:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760082925; x=1760687725;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BSqWlPqtUKmbPUvFOiSDBYm62ZRg96NdFDUtSMt7Zrk=;
        b=XrbgnnRGdiHei6v4t2I96iW5IClX4x4yMzkQCehb5LK2SlAtRpX+Zl0TZZ/3O+JJXD
         Cdl82mTXQGwpbq4Q3p2JPUCvUCIchnLaYEDwaVE/I3xqHt+/dWOWffAm352Ynj5Sp8S7
         WCLb03kCNkTENxnzvkeL4q08tjrEQq0C50qT1yHYDLxs8mTGr3q5qtEVKdbjIgSOjV2b
         ooltFdk9IZIzRvdSfWmtDP2RB2PFQZ8QwkKvtIoNpypdswVkgn2Qka1YHapCIXPw0NFJ
         dZnXquzuF6r659hZz7zya3Ga1qykganR81lNaTK4KvZ6w5iIZ18ORWjFeqn+z8ecicC0
         xemw==
X-Forwarded-Encrypted: i=1; AJvYcCV4gu3pQyYkKJVV3dSGIUmv39zYcCU//XtqTb4ALai1p50ScHtoNWwNRe3J69gRf8faN3Z8J+tyZTyM10OpftXLWg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRurm/HB4KnKlIasu5/d63SbIMr5Ljpb2r2KZOB1B3Xs2g2Lpu
	Ds+Z7IKcWgimYOVyUyLkfiQrShIBwhFBAGuAtN+EZxPBY1q50wvb10BFpPZN53O1
X-Gm-Gg: ASbGnct5KdASb8MIsBX0h/mfymsRtIaHPTl8mXRjtKyZ0NdH3MHDpdNbMRoTlDo9Ppk
	8TjRWXhXrg4OR/u05BOUoHOoy73wCsdYSzQrFYqiJkSK5phPvh9zuiF/hU/zHI0Xpx2GM9HI5yo
	pgKkZGUzQ5sxpr+maPmxLiM/gHpWCtrAbwjhB7NZ7zZuK8yxeME3VsfrGFxMSwCs5BbY/K3p9Dc
	nEwGMZzJQvEahS/lMUUi9+S3yIyIMQnd1CDmHhSenAShMUn6HQuHaPHzh9uvYKlPxRyk8J0oVmU
	IOfUQeAwnjWw/UmQJPw5eXf55kaKS4VPTlFFGvl+TSa9eqypNoruyRu/FypFGFL3Nv7jVeRkBkf
	kcKoMO8bWZkRYiNPOIr4q/J2IeBmgKuH92yDMqFFhiTkuBlJBWLq2SBy4Y571/vfLLCVV/TH0mV
	m5AfvL5PVvOIwO0A==
X-Google-Smtp-Source: AGHT+IGYJNE5w0J0IUXvyRh0p7d09CxZtNxpQ3Rj37CQYPDvBfvM3A4tWngQFSi14EkyO8TyHwk3zA==
X-Received: by 2002:a05:6122:469a:b0:552:32de:bb90 with SMTP id 71dfb90a1353d-554b94835d1mr4566307e0c.8.1760082925010;
        Fri, 10 Oct 2025 00:55:25 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-554dc835063sm243826e0c.9.2025.10.10.00.55.24
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Oct 2025 00:55:24 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5d5fbfca7e2so687440137.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Oct 2025 00:55:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUO6PhIEAG5oeyAWLGKAGPhICEin6GzOzClDnVEOyPK1r4IyVsZtxhFWgO+IddwBvXKbRtrL9aOJvxYucf8BLmumw==@vger.kernel.org
X-Received: by 2002:a05:6102:2ac9:b0:4e5:8d09:7b12 with SMTP id
 ada2fe7eead31-5d5e2590490mr5331971137.7.1760082924542; Fri, 10 Oct 2025
 00:55:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251006172119.2888-1-wsa+renesas@sang-engineering.com>
 <20251006172119.2888-2-wsa+renesas@sang-engineering.com> <20251009204726.GA3306624-robh@kernel.org>
In-Reply-To: <20251009204726.GA3306624-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Oct 2025 09:55:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXc6pchOxRWu_ZKUhR9zLoojjckFPB-pdwmM6pnJj8Edg@mail.gmail.com>
X-Gm-Features: AS18NWBJ-7Zse1vXv3tpHpxjY70K6erRYutOhSP9XUIFow6FgrAIep1olb_lk3g
Message-ID: <CAMuHMdXc6pchOxRWu_ZKUhR9zLoojjckFPB-pdwmM6pnJj8Edg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] dt-bindings: iio: accel: adxl345: document second interrupt
To: Rob Herring <robh@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-renesas-soc@vger.kernel.org, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Rob,

On Thu, 9 Oct 2025 at 23:22, Rob Herring <robh@kernel.org> wrote:
> On Mon, Oct 06, 2025 at 07:21:17PM +0200, Wolfram Sang wrote:
> > The pinout of all the supported chips in this binding have two interrupt
> > pins. Document the second one, too, even though the Linux driver
> > currently does not support the second interrupt. Boards may have it
> > wired nonetheless.
> >
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > ---
> >
> > Passes dt_binding_check. But uncovers another issue. See coverletter.
> >
> >  .../bindings/iio/accel/adi,adxl345.yaml          | 16 +++++++++++-----
> >  1 file changed, 11 insertions(+), 5 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml b/Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml
> > index a23a626bfab6..806b0250ec07 100644
> > --- a/Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml
> > +++ b/Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml
> > @@ -35,11 +35,16 @@ properties:
> >    spi-3wire: true
> >
> >    interrupts:
> > -    maxItems: 1
> > +    minItems: 1
> > +    maxItems: 2
> >
> >    interrupt-names:
> > -    items:
> > -      - enum: [INT1, INT2]
> > +    oneOf:
> > +      - items:
> > +          - enum: [INT1, INT2]
> > +      - items:
> > +          - const: INT1
> > +          - const: INT2
>
> This is better written as:
>
> minItems: 1
> items:
>   - enum: [INT1, INT2]
>   - const: INT2
>
> It is mainly better because using 'oneOf' results in poor error
> messages.

For those that missed the other email, where you explained about
listing strings like "INT2" twice:

    "That's because we require strings to be unique entries".

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

