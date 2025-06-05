Return-Path: <linux-renesas-soc+bounces-17877-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B58B7ACF775
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Jun 2025 20:47:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 121BA1883E22
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Jun 2025 18:47:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A529227B505;
	Thu,  5 Jun 2025 18:47:27 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D15A20330;
	Thu,  5 Jun 2025 18:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749149247; cv=none; b=srTPfhQq+EZkituZRuTRuZyitxrQusmCPWbvcqGq09V3H7xz0Ezui9LZLGPZb2i28lxhpBwa8n0sAMdISlhtf3TpgROPdM5FzHis2qQaF9kBBkEHHA0rxByszBmeWYhtdUpLfIWh9A86mLQFj3KTGT1BV6pXjqfTa5XihUQgulk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749149247; c=relaxed/simple;
	bh=6S02rl7+Xez6RygWdtvVQzZxfs94YcIWrjcdcz9JEjw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tKjbWj4xH3BX1G33Whrtb0yqGvnT0FHBWsWdhP7yKTSglAqMwRnbgmAtgD0V364+BHDnZKOK+1dCC15cf+WhoYhhbs+gyJF9fNFq5iNhx3BZ0w9SsJLC6/UXr9y0Dv78LZH8nEZy9LQlFDftjB6smtLpWxuRcljFcgzfjz5d37g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-87df048fda8so696028241.3;
        Thu, 05 Jun 2025 11:47:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749149243; x=1749754043;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XDESzcp9uhK4/bj12QFmlcdzua2IjhF1wc3RgZH2RJY=;
        b=GSOKqZIdryhJ0E9i9PcvyKgMoWoQYGw0cmUQmOF9tf2xq1hMmhNTBiRfAG5ldM3rCd
         qX8YWWZR188UJggdnVjOWMokusQv74vliorSCou6UDJno25cHcXSLVNswjhnDDo0E57A
         LA1Rw+M42lb1aXENzHBIOPR9uQwJbZo/udWBPtU/onh9hrjwdiRDuE4MUhTLFi2og/W7
         14FdOQnfbFWi6Y+NNV8rDp/D4akTVGUFx28DYVyO8Eno2x7Wes+04OWueEuFZOpeXfr0
         SdQJf3vA0CiOGXflKQTu3yuhBzt5BG7bOh+XoDqSx79QJ/PJkjWEEFHoOf/IDPH8K1Sc
         Iv6A==
X-Forwarded-Encrypted: i=1; AJvYcCVqEgEdYcm7Hq4D9FsuFAx0uhro8db1cYmZfxrSVZdvvtheGr0BWtfhF9tyo+aLG5MJ0L0JAYFqdeMb@vger.kernel.org, AJvYcCVqc3mClpqYY8q1gvmzv24Z1mIHVxGdqLIh95742iKLmjuVdnwqCJM+G3U0I5Nt8aQPcACADVHoTOcTCJ9elGXo0D4=@vger.kernel.org, AJvYcCWbQx0jmR2R/+rZ8VzKyNQEFq//FmjqCUn56IB8CWImDNKQTUrivT3sA9+LWOccgS1Bqi2NIXjXqpLFufDY@vger.kernel.org, AJvYcCXOPXyS0wQGey35Gm08B7nKyDBUMOPddOs3BXs2M1Q03oQ5Ph8Eo9lDEGo+PUv842lNV2fp7VXuEqHQFzti@vger.kernel.org
X-Gm-Message-State: AOJu0YytJfJI2vftY3ZMM869PfFJwWUP9vhCIZZAvrQbmErPX+gTndma
	9JGyFIFccDV2Mn+Y69oomqmJ+42msiUEU7YDObemUyrDk3Opo9KNWcF03MOwcqANCP4=
X-Gm-Gg: ASbGncvHl3ahrlw7ePIrfL0cAnu/t2boWpwXc1O323/R9iLmMdk/2DYO9dxsfkfpgJ3
	m669D+vo0tpW84r95uAqYKM4gXRWzFtrGGTaeJpqK60l4h6nU7WFdAVsekt3hW02OTRzodAPILt
	i3BtqhAmfag+iX69WZijwLR7fo7TZ8OG/8pIfS60dFXph+e461a1DYAy6bFtkkWwyCU8umHfHPK
	vY0yx0pp+KCBZVEnwLH9Sci9OsjD7OoX7c8h24+PtQUxmBXWgWzNF7NugT1H14Jro22Y6zUZRYE
	2JtB6qYBtqt9Gdahl8BiwqGXHYOegj32ZsJnjieNEvjkfrvbEZUqwzbEQWBk8VWvKlxgpWb4NEl
	qgYgTZg5loUXIwA==
X-Google-Smtp-Source: AGHT+IGlEORG0TmV/lzSF3G5hgo6iRN/dlWuzjU4EgfGnWx4+CVAThfVmGC2MSV7CbWJ6CodF409sQ==
X-Received: by 2002:a05:6102:dcb:b0:4e5:c51b:ace4 with SMTP id ada2fe7eead31-4e772a2bebdmr479493137.20.1749149243087;
        Thu, 05 Jun 2025 11:47:23 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87ebd2310aesm31793241.30.2025.06.05.11.47.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 11:47:22 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4e47c2a9cdcso854795137.1;
        Thu, 05 Jun 2025 11:47:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUXURhmhKTLzNzVeUVVnQ9s4QDii2sJ2nJtSTsi1lt55EDkZZEX41sjpSqOYWRuYS2FBkuIslT0PFQ+@vger.kernel.org, AJvYcCW/Wu+g5w23mU/guRrGnJG36JzbUU8aoDn2b/koadqrBCS5QI7pyma6TBCvHBfisW5cBmiq+z/okNrsdZMI@vger.kernel.org, AJvYcCWmu3+XQtDk+OXHLw+gjoRlngC+SiV18+avyNe1zwb5kj8+NV6CiPdtfCxO7Ubjzb+cvvLbojtR6BUpGNMw/goGkt0=@vger.kernel.org, AJvYcCXX56vhYJeoiz7aYRGQ69RT1936+KB+HV9stii9TDbx4xBnfZJoZh9bQrq0yuGizyOFi4niKe0Nl6i/n40z@vger.kernel.org
X-Received: by 2002:a05:6102:3e10:b0:4e5:a6ad:8fd9 with SMTP id
 ada2fe7eead31-4e77296a301mr528618137.13.1749149242184; Thu, 05 Jun 2025
 11:47:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250523142417.2840797-1-thierry.bultel.yh@bp.renesas.com>
 <20250523142417.2840797-2-thierry.bultel.yh@bp.renesas.com> <20250605143920.GA2458810-robh@kernel.org>
In-Reply-To: <20250605143920.GA2458810-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Jun 2025 20:47:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUThuWxxznhjvcn5cOFCWOkb5u-fRYwTOoenDRY=4H6FA@mail.gmail.com>
X-Gm-Features: AX0GCFur-Aski7uFxsghVWocWVwp8rvJ5FStM1HHe1m8EIQWcpodqYlBb_dIZ3c
Message-ID: <CAMuHMdUThuWxxznhjvcn5cOFCWOkb5u-fRYwTOoenDRY=4H6FA@mail.gmail.com>
Subject: Re: [PATCH v10 01/10] dt-bindings: serial: Added secondary clock for
 RZ/T2H RSCI
To: Rob Herring <robh@kernel.org>
Cc: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>, thierry.bultel@linatsea.fr, 
	linux-renesas-soc@vger.kernel.org, paul.barker.ct@bp.renesas.com, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Rob,

On Thu, 5 Jun 2025 at 16:39, Rob Herring <robh@kernel.org> wrote:
> On Fri, May 23, 2025 at 04:24:05PM +0200, Thierry Bultel wrote:
> > At boot, the default clock is the PCLKM core clock (synchronous
> > clock, which is enabled by the bootloader).
> > For different baudrates, the asynchronous clock input must be used.
> > Clock selection is made by an internal register of RCSI.
> >
> > Add the optional "sck", external clock input.
> >
> > Also remove the unneeded serial0 alias from the dts example.
> >
> > Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> > ---
> > Changes v9->v10:
> >  - mention sck in description
> >  - no maxItems on clock-names
> >  - fixed the #include dependency in dts example
> > Changes v8->v9:
> >  - typo in description
> >  - named clocks 'operational' and 'bus', and added optional 'sck' clock
> >  - uses value of 2nd core clock in example to break the dependency on cpg patch
> > ---
> >  .../bindings/serial/renesas,rsci.yaml           | 17 +++++++++--------
> >  1 file changed, 9 insertions(+), 8 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/serial/renesas,rsci.yaml b/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
> > index ea879db5f485..1bf255407df0 100644
> > --- a/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
> > +++ b/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
> > @@ -35,10 +35,15 @@ properties:
> >        - const: tei
> >
> >    clocks:
> > -    maxItems: 1
> > +    minItems: 2
> > +    maxItems: 3
> >
> >    clock-names:
> > -    const: fck # UART functional clock
> > +    minItems: 2
> > +    items:
> > +      - const: operation
> > +      - const: bus
> > +      - const: sck # optional external clock input
>
> You can't just change the clock names. What happens to users of 'fck'?
>
> And you can't make additional entries required. What happens to users
> with only 1 clock defined?

There are no users of the bindings yet, and the RSCI driver updates haven't
reached linux-next yet.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

