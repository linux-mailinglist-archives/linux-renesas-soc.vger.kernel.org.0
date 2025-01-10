Return-Path: <linux-renesas-soc+bounces-12042-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA38A09098
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jan 2025 13:37:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 048C83A901D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jan 2025 12:37:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11EDB20B7F1;
	Fri, 10 Jan 2025 12:37:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD3120B21B;
	Fri, 10 Jan 2025 12:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736512644; cv=none; b=FCG4U9adyhjWriNime6VhFWiNdgqMjKStbRKmI3WXEuEmLl69sjfOY6CMVWToYVyrpMw+9qKU8bdxInu5qa1rV69c5Z1h01j5Lcv6+RznsJ65yNZ8jJBlz0K6y3N0chbm+/cGy6FkBqOGR/Kln0CWwnMAoJ1pDjd5+/wwG8skAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736512644; c=relaxed/simple;
	bh=p0vQMCUCeu/d8bnUZGB6o81BgP9eyEh604tKFuplDZ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SHylon9IWhnEKaNNdtW2/3hPaJGa4mA0/iIKKNqOiJRDHpBa6ErDQZZ7knZhWN+TA1yvmAsqJWcddDeMf3I9WMx7kLA0WiAhS+hBVDsKHNk0v9NhMeRdfp1maiseMv9F6dNXwW5FmzkZJLnMbRUNN96lHN8lrv8z/uizrBvvguk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4affbb7ef2dso1403072137.0;
        Fri, 10 Jan 2025 04:37:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736512641; x=1737117441;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a1ssW8hkDEoBTvcRYEsnT+wNvt6r8JSYi4MWjLRVy54=;
        b=hXQYQ3chC7++3OctV4Dp3PTlghN8yqWXjAPKBTHWUGkoUB1qUr7rKXUM6SLv67hAWr
         YY7DYxQsWvsfVp+4qOKOEi3nZDhmcHT0Xamqmpj3RXT+SBFZ2x4qXM1GEeIBZiY/rvJd
         IVeeYy3efvZnr0NYhgIWsjvPyNnTY1tdmjCFy3E7YpsSf2kXqnP0n3uRTjTpQCsuAtFn
         zbyM7HpHSDNtZWoXZ8iAwNCdcwVEicAUqQa6YO2Lx74LOtHAKjycZmUMMz/w/l32Zvws
         9Ndy2IbeKIGi/LseUp+aUxzHlOtDi21SyXv1a7D5zGHbGNtY9U7jfV4CRkdO16BQAQN1
         w/mw==
X-Forwarded-Encrypted: i=1; AJvYcCW5zNzmpbLBO5RVsKpMO+17FAIwkX181TqST2u+nhn79LjwvaGmx2gkKzhIushxJWkYdO3IQvnHS+a18YYKQ6GZUWI=@vger.kernel.org, AJvYcCWl9/tz45ZIiQuEah9ls0gBh2wCT6WbYtrgTQ/02W6nMK+Qymfs263q6upSU+Bs+k2rWtVyw5n/3NfR@vger.kernel.org
X-Gm-Message-State: AOJu0YzlHhnpsf1BgAdMbSYV6qSSVKD3JbTlXgOalg9rZPYj9SwhVewI
	hv1eXIkyaTqkPNamOWojujI/9BUhmiNaaD0mm2NDsONssOu2X7k8D2YsQ3kj
X-Gm-Gg: ASbGncs88UQGHu438W3jM4j3erEeAcVxlSzthAs7659BeUjoRlKalknaV9EuDSyzxgn
	4H5y0qGpT1QhqR/of2xHK1eUT4XQodbEi6LrfMzwIr/39KU0rM9zbg+Qmyh19dqOI5sR9UT1A3R
	anCvJteJBdfx6S9Ph+OE38Dlf/l993wHhfC5Du1/fJdWRCGYqDvAbdkain3vJgIvxXMYbfORHTM
	WVgzd7nuRmxdc+TmBe4jOenQjDWxC21s+JYwAwtrL/Cvi7Gep/EJ/rW0ecpta85StkSZiA5TAgy
	01Pka38ASpGLne9AHHg=
X-Google-Smtp-Source: AGHT+IF0GADN4GEIbYWudxjzCjxtm/KUMPtiRMPj3vY2CeC7YMi4Y7p547yXBEHlCSAXUmxlWzavgQ==
X-Received: by 2002:a05:6102:2b89:b0:4b2:5ecf:d124 with SMTP id ada2fe7eead31-4b3d0dc0500mr10207924137.14.1736512640528;
        Fri, 10 Jan 2025 04:37:20 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b608f0359esm2358795137.3.2025.01.10.04.37.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 04:37:20 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-85b88a685e6so827176241.2;
        Fri, 10 Jan 2025 04:37:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW26ErgNlXITTcP9P8Lceq3OA2YD6azYvFVbk+ucWMNbaeOxMWzoMtXa7Fwq5DMK+Nd+A2btVxf/0qM@vger.kernel.org, AJvYcCX40gucQiOMKWEleMsz0T+5czBd1DQosTWKK6qY3kWd9Lw8vKNi7Ps6DojBymJCxAhhTL3DxNLmRqF3+UDqrDj0A5g=@vger.kernel.org
X-Received: by 2002:a05:6102:509f:b0:4b2:ad50:ac27 with SMTP id
 ada2fe7eead31-4b3d0d9fd2emr9543849137.9.1736512639954; Fri, 10 Jan 2025
 04:37:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250109125433.2402045-1-niklas.soderlund+renesas@ragnatech.se>
 <20250109125433.2402045-2-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdW1D=o8aaPOAQLPEZw-Y-9MVzzCRGEykEU=39CYeuRW2A@mail.gmail.com>
 <20250110105833.GC308750@ragnatech.se> <yszbtnmghspdxwdsv2bhoaej3hooo4ck52moirnmqtnfazpk6u@wwbdjqquwyzb>
In-Reply-To: <yszbtnmghspdxwdsv2bhoaej3hooo4ck52moirnmqtnfazpk6u@wwbdjqquwyzb>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Jan 2025 13:37:08 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWbqTo=XTocwq2fGJa-rmUEQgUiY6hxibEbA3zizA-sgg@mail.gmail.com>
X-Gm-Features: AbW1kvayZx7_j2oUzfe4MiMfUTgAUz2wX_eOm_-Xy2iLZMRfhMkkzHgTC-FLuBQ
Message-ID: <CAMuHMdWbqTo=XTocwq2fGJa-rmUEQgUiY6hxibEbA3zizA-sgg@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a779a0: Add FCPVX instances
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jacopo,

On Fri, Jan 10, 2025 at 12:36=E2=80=AFPM Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:
> On Fri, Jan 10, 2025 at 11:58:33AM +0100, Niklas S=C3=B6derlund wrote:
> > On 2025-01-10 11:44:21 +0100, Geert Uytterhoeven wrote:
> > > On Thu, Jan 9, 2025 at 1:55=E2=80=AFPM Niklas S=C3=B6derlund
> > > <niklas.soderlund+renesas@ragnatech.se> wrote:
> > > > Add device nodes for the FCPVX instances on R-Car V3U.
> > > >
> > > > Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragn=
atech.se>
> > >
> > > Thanks for your patch!
> > >
> > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > i.e. will queue in renesas-devel for v6.15.
> > >
> > > > --- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> > > > +++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> > > > @@ -2890,6 +2890,42 @@ port@1 {
> > > >                         };
> > > >                 };
> > > >
> > > > +               fcpvx0: fcp@fedb0000 {
> > >
> > > I think it makes sense to move these next to the existing fcp nodes.
> > > If you agree, I can do that while applying.
> >
> > The rational here was I sorted it based on addresses, but I'm fine
> > either way. If you can fix this when applying I would be grateful,
> > thanks!
> >
> > Same for patch 2/2.
>
> Just a note: for r8a779g0 I sorted the VSPX nodes by unit address
> as well.

Doh, there's always room for more "Restore sort order" patches
(until the script to handle this is completed, if ever...).

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

