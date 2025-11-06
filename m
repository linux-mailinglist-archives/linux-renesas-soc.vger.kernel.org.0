Return-Path: <linux-renesas-soc+bounces-24197-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9B9C399E8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 06 Nov 2025 09:44:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9579F350521
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Nov 2025 08:44:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EC9B308F35;
	Thu,  6 Nov 2025 08:44:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CBF307AC3
	for <linux-renesas-soc@vger.kernel.org>; Thu,  6 Nov 2025 08:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762418683; cv=none; b=rlBiD+T+P52sQospYWmrQ8r3zTlZ56xm1Us6T+QIi7pTMy/TROKW4vjj7kFZvwQtk1Mv7ikRK7WAeVH7I8g/zn6zQ/XDFgQb944HUyCwkB9+iYQy6oWTe6Rxd+tXV880MK8lmB6pRaKD8TuLv+SKNgn06r3mYYg581oV7MXTy8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762418683; c=relaxed/simple;
	bh=4e2WDzqLKYzpn41/EU08/ysLwcMnKhTYCq1gfsIkVBw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tYfvs2kEorbbDA05Rs+tdYpLgGZrCf63yk9pI3tSGQBhFpchs9k4p78wUoSOOVdEhnWlnhuLdOSbnSDypMhjqW27s0w7i0m9YqwWIV0SrF6jAKhyFNqXocD8Jawk22fOhzT8zlhg79HxYDAMs0QvoA5TlUOMuhUY3acafJM2d50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5598082ee63so189881e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 06 Nov 2025 00:44:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762418680; x=1763023480;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mz1Q2mn9SZfrcMx6xhR+wHR4X9YWp5k+qUP26CNzhQI=;
        b=r5hCSfabmLTy9T3wHVEDZS6T69YeI7zxMdJi/K8Gm50nwbRHP0jQqnjL0GsNZLq5MB
         lxhQ1SCkBE+TbFAfWQ8ZbVt19u9XLvOEyiofopXi+hYVHJ6HR/mVQ3v8jAHy5cVOt7dy
         pPy5XgQIWs+Xj78SU0IQl34Yir+PiWkMHO5Hes+LQkd28cHPKsdCkacICwRdsbdiFvsZ
         2+ijwtV5ZDkfwTOvqE4o+UKmEWTUfMbCH09Sn4PuoSABJ1GtLT3PsvAxFf843WRL1q6P
         ioZUb0s0g5NZs9uxbVbz4DLcwxrFhkb/wD6j3gAah+C6qHLFlekDAXzvVSeiFtq+0SYY
         /mYA==
X-Forwarded-Encrypted: i=1; AJvYcCUkVU+n2YxYklGdc19AgQP8lSdbAs2KkwU+xMdPauAZRl7s3corwCkGI4COuZH7mG6RaAqOu1AeguOVtyQ6vpFr2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzG8FQ7V2TQEgSWZkPIIRBfoQxcBoUzYTxv4olO2dpehrQ/G2w4
	iUjCf1oNayRt56OiOEWu9MvKA9hSOtAETjCHkFr5dgtZ+orwu8OwqlWB3dFoNRUi
X-Gm-Gg: ASbGncvJToi8qOv/ANtHQIgSS6GGtr6tDUCav3JxUrClFygPyU55mhR3VymQjYLbcWR
	ZDX+ZJbP4tAmTkjdPPTA5ZpUBjEhdhdNS02RE8AM5uT6orj+3d51WRDbGi0gEt/Ct17PaNRnM1h
	SPPjlmWOWx4SlQZxopcu9tGjIz9OPOVVlVQWIEzAhTj+3y6FJZkFpd8mvdyLw3IlrNkvW4DYmuQ
	tmhemjb+SVVjlvek4errkE/KHSxk8lF/m9GJva15HN219GqqDfYtGX16MiQ+rnzdssWXa2SBPxe
	mG9IBBjJVE7RxyGBdePd5v/tu4+vyclaTjXrlT1Yvm/grm32XBiUhc2xHlK5skn0A8QYzEFHN5L
	XU8YRm7kb3ueb48bxdU3piRE4MbYvAXgYgzz5gXv75t30GYIQmnkbieSgVLin8wRoyOlZrh8MmX
	JrRtakeQBqZ0EP02Q+u2vmbyxg2t/gyfEEiy0egg==
X-Google-Smtp-Source: AGHT+IFnz1G3vJt56EAzZnwh7pCf6qg7YjEpEDrBIPWGBCOsTKKRzeJVyOjx8etF6yC3hcZV3jfOAA==
X-Received: by 2002:a05:6122:1e0c:b0:54c:da0:f709 with SMTP id 71dfb90a1353d-559863c7a44mr2331882e0c.13.1762418680507;
        Thu, 06 Nov 2025 00:44:40 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-559956a5d68sm1019402e0c.9.2025.11.06.00.44.39
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 00:44:39 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-89018e97232so191235241.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 06 Nov 2025 00:44:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVYTRtpeYDaOjPEMsX8e+AEtBcBKEjaC6ZX4Bh+Frt1ZeBeReBsC6EUa0Dt3I6y9J6JJn+My3L8T1r44NeuDsZ3tg==@vger.kernel.org
X-Received: by 2002:a05:6102:e0d:b0:5db:cc92:26e7 with SMTP id
 ada2fe7eead31-5dd8926eff6mr2132593137.38.1762418679294; Thu, 06 Nov 2025
 00:44:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251006172119.2888-1-wsa+renesas@sang-engineering.com>
 <20251006172119.2888-2-wsa+renesas@sang-engineering.com> <20251009204726.GA3306624-robh@kernel.org>
 <aOgsxSfGIVBpfkpb@shikoro>
In-Reply-To: <aOgsxSfGIVBpfkpb@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Nov 2025 09:44:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUf2QB__ZXsJK-iMAt7U-89d7s76oRB8KE9Jj0XywxzJQ@mail.gmail.com>
X-Gm-Features: AWmQ_bl7RbaNV7V4JGT9opu1pZKZ4R-1R9XxMMdHotgYEewUqOZDK542sndaY3s
Message-ID: <CAMuHMdUf2QB__ZXsJK-iMAt7U-89d7s76oRB8KE9Jj0XywxzJQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] dt-bindings: iio: accel: adxl345: document second interrupt
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Rob Herring <robh@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Sun, 12 Oct 2025 at 02:01, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > > +    oneOf:
> > > +      - items:
> > > +          - enum: [INT1, INT2]
> > > +      - items:
> > > +          - const: INT1
> > > +          - const: INT2
> >
> > This is better written as:
> >
> > minItems: 1
> > items:
> >   - enum: [INT1, INT2]
> >   - const: INT2
> >
> > It is mainly better because using 'oneOf' results in poor error
> > messages.
>
> But wouldn't that allow naming both interrupts INT2? Or is this
> magically prevented somehow?

    "That's because we require strings to be unique entries, so [...]
twice will be rejected."

https://lore.kernel.org/all/20251009200054.GA3245555-robh@kernel.org/

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

