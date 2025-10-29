Return-Path: <linux-renesas-soc+bounces-23863-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC6DC1C05D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 17:21:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2057D464F1C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 14:50:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF8C83358A6;
	Wed, 29 Oct 2025 14:41:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F112C11EB
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 14:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761748867; cv=none; b=YoK065XDusbHeUlBplQMRrKEYWpMNjwXON1LWc8fW67W+QgZB1IPzsATRQcM0JVEbY//2ON6l1322XKIVmE2sskQlSxWExuLLXqZS4ocV9rqKwQ37xb4dBwGog+K9JaNJNFqa7oxat1KQweA0P9HmpE+9NnGF0xY/RX25J/cN/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761748867; c=relaxed/simple;
	bh=QXFJ9Wye89l5k56IzhXHnCZ5vP4dVOGIaGxaTnibrdI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zlv3zmaPBYhGG+tW0tXHUC9wuE4VjFPg35SIjApENU6Hz9+jffGwEEY/53ZCGicoCufVmghyLcDiYKfsgnKk/UKdsmU8VDKfG2HLTsX95OWgcGhqgvE0CRdXRRMgpTh2bHW0bqv1t8OFqPvori6zsN0e1YY9ezX+98O/8yghtug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-5db2dc4e42dso1156131137.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 07:41:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761748865; x=1762353665;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ohi/8MFIs+pUNYTuSKDH5KUVpFMJO5wn0YyhdMa7QIc=;
        b=D0dMG7ZQVGz+RtO15njg5xSGU+F9loiY/JYL+CL/5UYzQJKeGnXNtSt8PCskqcnigZ
         wmCG6t9o/GpO/QSgz9XzuvzwSOVC+SSVpBYsr4hFpdgPm4nGdZntC7LVglFf/jMVD52L
         apte+X+jn4WMFp/88QQa6XzrxyeJHrwQkPA7NhIjFVUB2FR1IgK1UAPfjhTubFPf7dmk
         aMXkoimXOa7w4BUmSwoffWRbbXyYCi3RlQvor7fbseerenx+PiHOimJkT58V4ztC31v3
         epEAa8ooVLkWTAFJNvI1c2r2eC+PSYUwiBe3LeLOCY9qWm7cToJu2fZNvqLpiOrALBVI
         yb0A==
X-Forwarded-Encrypted: i=1; AJvYcCUmPDbAehXJfPNUIjg9yl8nv6nDRAiTI5XTgDBTo51HN7DhPYsDVame5NQZ1U+Oadz45VV6Ql6TyAJMCde+MGS0iw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj6Yj5Lk0tak5O50BWb5W91lVely5rGlRIqTHT/s/XTV/DD6W0
	i4S2H+mi2eYyVoCpI1junaq+zOeIQG6WGyXFXbc7a2jkef6UTExTrm1oG01BR3m0
X-Gm-Gg: ASbGncs4E6HbVOHYnrws1acR+0axIUw+j1FjNFopoZbUo+f9X+t8Bf77n4Kw+1OLW0D
	CwY2iVLgNi7EJOmK/k3ov3rdht4Hs7vYUurN+AjmwwkLZb/RDlPb6ErUnTgC9ZEf5/wsrycJfl/
	pbh1F7/A51xmJv5xF6XD0bFz1AmAL3AHRhi2hqEQxfYQ2+Jo54CO4wi6knrOmKlkbCG7tZmXU2h
	hmKQxfXV6PXvCcAy7rbH9O+DW5sde2X9IA2vcOenshiUBXJd5EUkN2t8eu/vYWvPaO2eOoK9Bz0
	JLfXRYxO8/tVxplWtgkLvhq60bGHLoQQu/R1mFfsZqtKswUNWefuNmFHF0YiUY8O4UjK7XbKGYJ
	1xPMyktxcPSK/mM0yGrG2VXtwNiDUDRCrFVgx5HE4CWqd4pXyjRjxyfUlyWVEfIEk2GbtV4Rsnj
	tbhUygZxV+g64y4aSVbZ3c7MdChqjXN3xxYx8N/ba9Qxr0la6iy4g+EKMf0Ka4aGAgwv0=
X-Google-Smtp-Source: AGHT+IEbvDxbnKwtu86htN9tRjHIpinsk5tppXqXlns6kP0ch/I54aqVLjLBOehcYjiDmpMj1hqU5w==
X-Received: by 2002:a05:6102:2928:b0:584:7aa3:a329 with SMTP id ada2fe7eead31-5db7e069220mr2784647137.4.1761748865041;
        Wed, 29 Oct 2025 07:41:05 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-557ddb2f98asm5407305e0c.10.2025.10.29.07.41.04
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 07:41:04 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5563c36f6d4so1118647e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 07:41:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWS9dX7C2pUqn3I5Gn+uYnwIetgsFe8ZY33aEhMq2WpL/zo34tHCQZPyB1JF09eGECWTs5W5s0TQdXxsE7e4fJi8g==@vger.kernel.org
X-Received: by 2002:a05:6102:2acd:b0:5db:9b88:1fec with SMTP id
 ada2fe7eead31-5db9b88219emr535412137.9.1761748503547; Wed, 29 Oct 2025
 07:35:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1761588465.git.geert+renesas@glider.be> <ac3e718c5de6a23375055dd3c2e4ed6daf7542d5.1761588465.git.geert+renesas@glider.be>
 <CACRpkdYMv+R-NJ5R4+UyhK1+DJia0z72kZgt45+0eubXMuGpEw@mail.gmail.com>
In-Reply-To: <CACRpkdYMv+R-NJ5R4+UyhK1+DJia0z72kZgt45+0eubXMuGpEw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Oct 2025 15:34:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUvLH-8yNRoqBdTB+mcmOUedwVGpJ_HGdq8sqgLNB4dvw@mail.gmail.com>
X-Gm-Features: AWmQ_blZ8dUVr2aBwtWAAkAOaE93AtUSPNFDpslgvmXepFfW4tMWIOUWnRJkksY
Message-ID: <CAMuHMdUvLH-8yNRoqBdTB+mcmOUedwVGpJ_HGdq8sqgLNB4dvw@mail.gmail.com>
Subject: Re: [PATCH v5 18/23] pinctrl: ma35: Convert to common
 field_{get,prep}() helpers
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	David Miller <davem@davemloft.net>, Bartosz Golaszewski <brgl@bgdev.pl>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Crt Mori <cmo@melexis.com>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Jacky Huang <ychuang3@nuvoton.com>, 
	Shan-Chun Hung <schung@nuvoton.com>, Yury Norov <yury.norov@gmail.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Jakub Kicinski <kuba@kernel.org>, Alex Elder <elder@ieee.org>, 
	David Laight <david.laight.linux@gmail.com>, Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
	Jason Baron <jbaron@akamai.com>, Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Kim Seer Paller <kimseer.paller@analog.com>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Richard Genoud <richard.genoud@bootlin.com>, 
	Cosmin Tanislav <demonsingur@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Jianping Shen <Jianping.Shen@de.bosch.com>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-edac@vger.kernel.org, qat-linux@intel.com, 
	linux-gpio@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	linux-iio@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Wed, 29 Oct 2025 at 15:21, Linus Walleij <linus.walleij@linaro.org> wrot=
e:
> On Mon, Oct 27, 2025 at 7:44=E2=80=AFPM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
>
> > Drop the driver-specific field_get() and field_prep() macros, in favor
> > of the globally available variants from <linux/bitfield.h>.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v5:
> >   - Extracted from "bitfield: Add non-constant field_{prep,get}()
> >     helpers".
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks!

> I guess this needs to go with the rest of the patches?

There is no hard requirement for that, but if 07/23 goes in, why not
include this one, too?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

