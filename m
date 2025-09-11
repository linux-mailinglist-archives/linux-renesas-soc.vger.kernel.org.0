Return-Path: <linux-renesas-soc+bounces-21784-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 639A5B537EE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Sep 2025 17:36:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A60CE1C23508
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Sep 2025 15:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89FB232F747;
	Thu, 11 Sep 2025 15:36:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B495213E02A;
	Thu, 11 Sep 2025 15:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757604966; cv=none; b=XtRaW7J4OcJLDEpAYO7jAWEd/gZpvTTVcowhIryUsZVXCCCfPwEgObdUcUcDGp49rmtkN9NY2fX93FKWiNO63/oHZWkNjrkXKrvAfjqrEYtn4yuw/oXE2pQKKFITeY7h9F4giKXFax5oJoMO7JVDxNArI18Xw8WSplq6VxylkCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757604966; c=relaxed/simple;
	bh=rxW6LjatMXABSFF50dD6Mr7NKj8XRfl0EDC8vjfgTtg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Eqq6vs4ukhMCD1vbBAUDD9KiGfJQ1+heK3/S9dA5QmQbHJBM0wzSbLLiGrP01ior62TWkLN0PutKJ/5/A5KFC3H0YRE/tTCp2v0hFx7zAzy5gjosQB1dhiyE4gXdX4kUgDZQXuTEAOCNW6pRGVnBQB/uxl4JWSuCwMoMHh9iAvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-8a1d640b50eso599178241.1;
        Thu, 11 Sep 2025 08:36:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757604963; x=1758209763;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HED7AzArbGTC5OcrHXoQ6N9kTMoymyrW7L3VT9L9XFM=;
        b=o0UscLgNOK+YBv//2BpmXPF/ay8d0VIdzFz0QpjM26j5/Y12JpIXvPN6e3VCGNCZ/C
         hoeyvDYOvSEzEkd873/rs6/xQ+dZvWwfo9IAamciopdgczPqdyJI+NASi3QJlzhictIb
         MCTkTZAjOFFnuK5WCOUkRkbO7XmKDOt2B0w3ZC/u5UTFNHsWr8LPQXuukJj0Ia5GfUGo
         /QIzozwWBZ7sGoEdDha5M80oH2uN7GirFXixvrIkwwVHbJRUsL+ooUTxxElbsu7F34kK
         AdRYcoE8/HeGHhWbGkbeOpQrayB9129yTKnEkTX4MOT2VLspAGIBrx0KmrIg92vYJWCc
         7iPA==
X-Forwarded-Encrypted: i=1; AJvYcCW1yicO1EPQ91Bft5eq1ftzlT1mwWc8uZJ8OLyY9fbZtr9n2d4YC3oWWC3aoRJ9SHeP+Q/KFiQtGYOlDTqH8jTfyR0=@vger.kernel.org, AJvYcCWB0a4a3u0xvicDGhTCrfWLtYfJKozPivv5Vyu3eUcYMPnUe0oxz8aluwRXll2YSzijDKJt2SUrFqa2yex9@vger.kernel.org, AJvYcCWG0fOJmIS5HOF0GQxwf5QnxwkMa9K5IUxv5XBlFdKeXwY0FQ+2lt6upZXcuLtaoW6D2OSkCdqrilqD@vger.kernel.org
X-Gm-Message-State: AOJu0YyEGwJ/Nolah8Hiz76TgD4y8ZqIKZtYaVQoo8Z/EswOpV7Cpy2f
	GYJ6VCFPySPRTM53Qpw9oNhpztY0JxrGxJni2JQu24VKe12uCz42eczTw1eoZbkA
X-Gm-Gg: ASbGncuM5WtHfguJVL0HC+SSqwTCawzr5NWB6fuX+hh7g6giuBQJvSNwi8ZB7JLYU71
	DsG7Qwf2etc0/i6kcwSQ2mpKYihxa2qePszH/YMNc+iZ8RyNRhDL1owJGld2l7FC5M/+5n5CZPu
	UrYxRd9ak2xAah8d1/Ojz1Ow546IPiIjACvOpeKtN9wtBLA0XDtMV0qm10i0VnY4comgO4LAMP3
	ESQoGri3bTJ3WLRGsrDuZgTUshpWk1DiJZJG7fM8jiimJUYC/DCurWM+sidsmCc4q7bWXPzLG55
	1pr/sN+SbJQ2mIJaWPcKid9XhfMRb+vxJdtfPJ19xrh2LW7qP9Y3mXE43qV+zbMlET3o4gRM6OU
	sFAWKVNyUhAHRf55Dl+YzT/I5QT03fAl3d0th3UydUx/5kLdBnh16GUbS14+80EYdsYkkzQM=
X-Google-Smtp-Source: AGHT+IGZLE5uNG1QZnGgdGLhzdmxXsyScuFuR3i6AkV1j53y6QtH9IKqHHhEqfnvV1UKuHuLfUHZaw==
X-Received: by 2002:a67:e709:0:b0:4e9:cd8e:c28f with SMTP id ada2fe7eead31-5560908cef6mr22754137.1.1757604963385;
        Thu, 11 Sep 2025 08:36:03 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8ccd640ab51sm283853241.19.2025.09.11.08.36.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 08:36:03 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-8a1d640b50eso599158241.1;
        Thu, 11 Sep 2025 08:36:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX+ojZiUPrnZwwn5GzAZ5uxxWXcmhEbtD8tgk9s//0TXqfcw4mOgzOE6ccd9u+xyi+yTWEjvf00HZ8qtnAmEc8xxfs=@vger.kernel.org, AJvYcCX4eiR/G2wJL9titnBM2OAUzJz7tGZ/ovRa4DogJWK3a8SPoOvtwAgOWTW4wbJcyQajG6QRIexU5/7g@vger.kernel.org, AJvYcCXR8jO2htrbaAuxrmvzqsW0Fng89rvv3/bjZplWdEDsXV8TR0YEoOpEX9yqF8ZtlPkTS+owS3n+z8GNlwrt@vger.kernel.org
X-Received: by 2002:a05:6102:374f:b0:524:4800:77a8 with SMTP id
 ada2fe7eead31-5560908dc48mr21383137.5.1757604962863; Thu, 11 Sep 2025
 08:36:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250817145135.166591-1-biju.das.jz@bp.renesas.com> <20250817145135.166591-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250817145135.166591-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 Sep 2025 17:35:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXaZpM4VKarTxS5JdazZj9HAiYc1o=YhFiJCdMra2=4Xg@mail.gmail.com>
X-Gm-Features: AS18NWBiBreY4smpMUQm1HruUYPp5Rw6clODld_mbh98V88VzBpKfWDiBXbno-k
Message-ID: <CAMuHMdXaZpM4VKarTxS5JdazZj9HAiYc1o=YhFiJCdMra2=4Xg@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r9a09g047e57-smarc: Use schmitt
 input for NMI function
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, 17 Aug 2025 at 16:51, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> The latest RZ/G3E pin control document (rev 1.2) recommends using Schmitt
> input when PS0 pin used as NMI function. Enable Schmitt input for PS0 pin.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Makes perfect sense, sp
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.18.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

