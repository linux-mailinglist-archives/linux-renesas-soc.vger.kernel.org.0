Return-Path: <linux-renesas-soc+bounces-26729-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D420D1E6EC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jan 2026 12:35:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 187B3305BC30
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jan 2026 11:31:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB12F395D83;
	Wed, 14 Jan 2026 11:31:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DC239449A
	for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 11:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768390290; cv=none; b=dL6ArkuVjJ0uLUkCPWfyYH7m0M1JbyE8yVj1vkNaJxO70QyWurwQY1WoXDGmJG+9PGDreN3H1Nhpzq/EgoB6Y61+xdXmIl9nLKXq2eKtxvm3Eo9GsN8nSSDXx5BVWBnkBp4ok79KVfjocyHZJJ9RDfAAzSmSSKmYGzPSMvB2eL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768390290; c=relaxed/simple;
	bh=CiDHpss1hVeyB4RZ3H82ibrygcnDTVOy55OV2SWKALE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WJ1XiieOWqYSE5/SJeSjio/Zjf3t8xJBc0Wu+3nNJ/Y75d2lcDuYuZ+QDcbdDco8KJvmu4qiJ8a3nng2tS2vW0JMg78zIRh7wZAg1wVzUkcEbJfpQr5q0sn6t2ciaSpp8MmrMqHiyAi28IhNLGeT3I6ngH8F936KYSu1UF8s5jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-3fe3cc80bc3so4815034fac.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 03:31:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768390288; x=1768995088;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RlUeVi88PIKWMzTWAKceP+tOAwQMJqEvuH7YKzydUAQ=;
        b=Uba7Uw/N4uSV7c2O2HO5Acmi1coqh+0zbvpePG8JF0QV+pNPnHzZBejTbrakhs/ME6
         lT9wvCpri1znySeFG2B7Ndzty5n58K6C+Y2+cM+OKaRhtO+pGI/8ZDFLVy3StMhlg80J
         49lpuVWwcX5rkeiH4X9HM+HMuzYPLTVg1DYOzkBYC+OrVmzf2sLvBN4uspT1+3J/3IsO
         Vjl3Af/5N6We1qphcY4TSLvV3hkaAsmRRsy71F85aamJoW163ycFD6g3SI/Bv+GwnGKs
         ZARdg150GPKVoWizgQHnWF8lexHCIgBqUvOAjaERf7IxqmN7ReNMbWwXUrPbkiSXgd7W
         XUXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPNqGouT0EdQBTmxE26x9udCGbLk73MIbCTGoXiIbLhq7GNeGa8pZ9CPlIugQesITFq8zrptVRxYuZ4uNjmsofDA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHcz1wkuSiHj+BUzSKH3p6ztPcj8wF9BAUl22SdwDCw0OuLjV4
	1QMyGzs5vMly0yB2cjF9Y2/0zQlD8+cSzhdcAaDGG5tewAhfSImqt5lNUrRop8Ou
X-Gm-Gg: AY/fxX6iYYRTHa+YmrMziiI54Xb7K98B9mfBApTK8ZbS4DRWGH/whN6g3ZH+NxyudS/
	MIz+5s4wG7UpPL5EBUOVvszAr9l6rTsOtC4laCIYZfk9g38xwtdDYulUGauw1ubLajZpxcVoROg
	BFUJbVjXkO3evruVNvSbNCaPQi4RY+LMVaiM8XdjSWahVXTJikgUsn0a9xIdXxQ+fQzgfCu8+ru
	NKEsFwkPyJgyEftm71LZnbPdnkvuxgpWVmfXaVr5jmB33dfAok2og9MPn2XTQaEFw6a+jvOZ6JI
	VuKs7WvOjqMPm0AVx8WbwnOF9Rk+3fN+m//3Z4mITwc0vQNqpTbuYVqwJZnLU4W9bPaCW74kbuV
	zxVacspHclCKTr5KmUVYDXilAZp25AtMQI14rGXA0SMlVqnfd+AeweDTsVl6/COk+EgFXTr3UXc
	Sr7i3Mm5JSxgz4Hv7Ros5AHD/87roc4igtjblzsJfmMdEfDo/ZZNYfctcrDpc=
X-Received: by 2002:a05:6122:3d07:b0:563:4a88:6ecb with SMTP id 71dfb90a1353d-563a0a66600mr675325e0c.18.1768383447446;
        Wed, 14 Jan 2026 01:37:27 -0800 (PST)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5634e959afbsm20036883e0c.1.2026.01.14.01.37.26
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 01:37:26 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-943d0cafe77so2769000241.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 01:37:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW1HL+lxF0wVH+rVxbMAWoEoGcBOBeWmpP7uheYqhne8p2JCbtymMdNT2gmibIRU8Wlq7FTJelLJDXOeW33rll6+A==@vger.kernel.org
X-Received: by 2002:a05:6102:41a7:b0:5ed:bc1:823a with SMTP id
 ada2fe7eead31-5f17f6592aemr793700137.33.1768383446392; Wed, 14 Jan 2026
 01:37:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260112234534.225954-1-marek.vasut+renesas@mailbox.org>
 <20260112234534.225954-2-marek.vasut+renesas@mailbox.org> <aWZ1pG5RRWlDSCwC@lizhi-Precision-Tower-5810>
In-Reply-To: <aWZ1pG5RRWlDSCwC@lizhi-Precision-Tower-5810>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Jan 2026 10:37:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXb3-EFy8WA9FTAqvyYHaF4nGch60bUQ6bbKu6Dzbh6YQ@mail.gmail.com>
X-Gm-Features: AZwV_QixtfIM8YCIiXj7v0fzbdqd9QL-Kw8ynN88vc69gt7t-8CBMGxLdXH8t2o
Message-ID: <CAMuHMdXb3-EFy8WA9FTAqvyYHaF4nGch60bUQ6bbKu6Dzbh6YQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] Input: ili210x - add support for polling mode
To: Frank Li <Frank.li@nxp.com>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-input@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Job Noorman <job@noorman.info>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Frank,

On Tue, 13 Jan 2026 at 17:41, Frank Li <Frank.li@nxp.com> wrote:
> On Tue, Jan 13, 2026 at 12:44:57AM +0100, Marek Vasut wrote:
> > There are designs incorporating Ilitek ILI2xxx touch controller that
> > do not connect interrupt pin, for example Waveshare 13.3" DSI display.
> > To support such systems use polling mode for the input device when I2C
> > client does not have interrupt assigned to it.
> >
> > Factor out ili210x_firmware_update_noirq() to allow conditional scoped
> > guard around this code. The scoped guard has to be applied only in case
> > the IRQ line is connected, and not applied otherwise.
> >
> > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> > --- a/drivers/input/touchscreen/ili210x.c
> > +++ b/drivers/input/touchscreen/ili210x.c

> > @@ -1003,12 +1027,24 @@ static int ili210x_i2c_probe(struct i2c_client *client)
> >               return error;
> >       }
> >
> > -     error = devm_request_threaded_irq(dev, client->irq, NULL, ili210x_irq,
> > -                                       IRQF_ONESHOT, client->name, priv);
> > -     if (error) {
> > -             dev_err(dev, "Unable to request touchscreen IRQ, err: %d\n",
> > -                     error);
> > -             return error;
> > +     input_set_drvdata(input, priv);
> > +
> > +     if (client->irq) {
>
> 0 is validated irq number
>
> https://elixir.bootlin.com/linux/v6.19-rc4/source/drivers/base/platform.c#L284

Not anymore ;-)

https://elixir.bootlin.com/linux/v6.19-rc4/source/drivers/base/platform.c#L299

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

