Return-Path: <linux-renesas-soc+bounces-18457-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD5AADCEC7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 16:08:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E9F33A3B37
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 14:03:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2EBE156C40;
	Tue, 17 Jun 2025 14:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qi5frF+1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C484502A;
	Tue, 17 Jun 2025 14:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750169058; cv=none; b=B5TtvhVEuJf3Wn37LxUcE1v/H+ScIu2KQAkxKGPHGrOgUt7JTJFLfmhRrJjDzmG0HVuNUqxcCRTdtxSs7cAckq+GxvEfxQOIgCjHmIPM8j+SJSZNf55wCgaMSrd4NDu/YYScXC66gOEMvvJUufD4O3gUVvIHZIcrstQqWVY9o/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750169058; c=relaxed/simple;
	bh=0dWU6HXzlHK6iJEuju+cyMKuq1U2jlz4qZX3uNUjrog=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E0e9a3s1Ksh344ToZ523vq1GE6BblVaSau+FqHRYoBZuun9MMDhIwAZ5vLCiEQW4mxJ6CBBfv6eJZut6XqCHF9A3j2zylc5NWV67nho6UcBmxbXaYzNk14rQjhHT3A82xHBz/y0e6hVj68mHCcc60NHHUVgg/XpjNePds83x/s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qi5frF+1; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-453426170b6so17995225e9.1;
        Tue, 17 Jun 2025 07:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750169055; x=1750773855; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yKMl5Q4rEMPmCxIPeuqakKIQuXk9JJJz0TSzFVQwXWU=;
        b=Qi5frF+1TS3ntDe3uE/FcTYZrR84aT3eo/G3CcRfDMt4sSlglHZdPSekWngIjjuOC7
         tBB7pBiHCdmSECKRLLMMyeVjw2/Sni/W97hPhe1pFN80aqFkFKgFSugZmnzYzcsbvPsn
         TPSrWJxT4qllQjKpS58hUCjmUBs74AvVt97QshcwCJeK46E9i6Kof/aAH67qdwn/Pbhx
         80TjmjUczZFCNyvJfWLaekAh7jPBqY9Sn9wqNSXij6+Z3N9F1HP6ZrLwXqORP4swu0GZ
         5KI+MKjJAlQZ0X2hVEx2f65q84fetdrcJBlSGQvF6Xa2TDgtp0hlsVoAjrUdj6e/NV76
         ymzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750169055; x=1750773855;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yKMl5Q4rEMPmCxIPeuqakKIQuXk9JJJz0TSzFVQwXWU=;
        b=BrxYporcmEFBC5k2wvk0VhH1SfR8KKTuqSEygZPKnkguXCWyd6yYtdxUZwP0m1+BPc
         wtrkne3SljuvtyhkQOK/7w5BgxlQAeWpyK30vzc0jZ4rCKp5D7duAtN9r68O21HZWM8i
         qGaNlQGqJm1uHR6UfxvTFgu5VllUhDie2PmWe+Ygx9Y2sJMRfbeUd19YISUFczekdgnY
         aAfyydk405/wouiMfD2mTaKlVw39vn1yDFN1omFL3DNDS15Dg1tikpCLabv2sBcvW+u0
         RZ9SkIlpu1fK54o+OAQLM3/Yqd+lYlIRcyJm20hZCpoERM+61BB8P/FYs09SC7Vb/AuW
         kvfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEbzxRc5IzmyQ0EWHJPRQrm8H9biS7CmYE9e+djErqT3zy3PGntNjzWoFlC2EA462uPYruN6/GithJsD2G@vger.kernel.org, AJvYcCW9tcAfTGwZ47+EI8SMuu8dFVtB6chlxel2MSq99z6be3bcnehPdzFvLGABpXr6io/gG98Kh+V/q3SRWdAq@vger.kernel.org, AJvYcCWo6S7Er2+wqSWY794C8ybxqQI6FM73vJDFkr/v48uxiE41Pnb1A/rRjf0l1ZtTMUvRR0/WlWBGuoQW@vger.kernel.org, AJvYcCWoDgYn+CRTy1/aNzbdN/ZhRwIwRNqppxgoVMQ1BlbuFORt8cblj6dhchCBOWzeAiwsmGqUaFIMJ9L2gHPMKA/kMjI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfUFbcReihSmyIvpGtmGObYFoRudK1xj1vWQtquRa+qFnKI4q9
	MRlqM4dQv/yZqwOyjluXIQLLY3ASJMGP/MLkPwvxbaimm3hZ2VlFalKtGjus8BzLe0WAUbleXVj
	qTjzXvmCpqRGm7Prgq2ZwQOD0b3v7vdS+e9AEhNQcRg==
X-Gm-Gg: ASbGncuMdpZUnMVQpOvA8m4APQ8gbqf8yIcZrco4x8wCmjcvG19I4UefOLHC2QzoLd+
	wYdzBepnmZjhAjvpBDeo6U31wOyZ4jgZc1jT5CBhNneey75w6nQZhn++rtS+7s9RRz9JWugQlLf
	blOiHxpATHQF9ea81k/oD8OQ1h/DzommiGHWeIvv8+AUHdghpv8c0w
X-Google-Smtp-Source: AGHT+IG9Pd3zZCpCDabPNRID3/mweW9Pg6ysqzFUrlRGkOmnfcaK7N+ZJqlPWghn7sHnYXCnMj8x0pPDPqWqSZzTk/Y=
X-Received: by 2002:a05:6000:310f:b0:3a4:e231:8632 with SMTP id
 ffacd0b85a97d-3a57239587bmr10636654f8f.12.1750169054933; Tue, 17 Jun 2025
 07:04:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250617134504.126313-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250617134504.126313-8-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWfsqYvdL16hrbWug3PhK1XrSunaWtduajRzViKBRPeCA@mail.gmail.com>
In-Reply-To: <CAMuHMdWfsqYvdL16hrbWug3PhK1XrSunaWtduajRzViKBRPeCA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 17 Jun 2025 15:03:47 +0100
X-Gm-Features: AX0GCFvJJnMjoVIyb00wCS8LqVIBgjEn19qTstoiiFay-qVXscEY4QfRsMV1AmY
Message-ID: <CA+V-a8sx9iuUjn3uvSqq3Sd=JeTj_UMyDiLzisrnj1uQw6nbGQ@mail.gmail.com>
Subject: Re: [PATCH v12 7/7] arm64: defconfig: Enable Renesas RZ/T2H serial SCI
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Tue, Jun 17, 2025 at 2:57=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, 17 Jun 2025 at 15:45, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> >
> > Selects RZ/T2H (aka r9a09g077) SCI (serial) specific code.
> >
> > Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Thanks for your patch!
>
> > ---
> >  arch/arm64/configs/defconfig | 1 +
> >  1 file changed, 1 insertion(+)
>
> I don't expect GregKH to apply this patch (or better: I expect GregKH
> to not apply this patch ;-) so IMO there is no point in including it
> in this series.
>
Ok, got you.

> Thierry's original version is still in my queue, together with the
> DTS patches, waiting for the RSCI DT bindings to be accepted...
>
I plan to send a new version for RZ/T2H DTS/I which includes fixes
from series [0] squashed and also mainly update the model string from
"Renesas Development EVK based on r9a09g077m44" to "Renesas RZ/T2H EVK
Board based on r9a09g077m44". Is that OK with you?

[0] https://lore.kernel.org/all/20250613135614.154100-1-prabhakar.mahadev-l=
ad.rj@bp.renesas.com/

Cheers,
Prabhakar

