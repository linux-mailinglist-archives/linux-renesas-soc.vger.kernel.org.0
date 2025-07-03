Return-Path: <linux-renesas-soc+bounces-19066-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3591FAF6CC5
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Jul 2025 10:25:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F08723A93A2
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Jul 2025 08:24:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 768142D1913;
	Thu,  3 Jul 2025 08:24:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E19298CBC;
	Thu,  3 Jul 2025 08:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751531098; cv=none; b=FyTXaMKIYszJm4W9JEiO2rLNz8n5QDFU8Esow2MfiRGZgiy9QGhIASl5I9oYzNV7jk5s2Yzmk2qqnCvqr4YohfX33bgffQ9pBppKniItQY4ZeKlcwZwo66a9Ud6F4X6bRGaFdjIU5Vr/E6xcDAYMoEQ9tU6dIEAnGVfzUAtkqsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751531098; c=relaxed/simple;
	bh=AvzCXy9cHRBUMZVg/Ovmp+lRgGHZ6AljsobBvHwydJo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J2d7gbhqmiAB7R/2z/+gGz92Tr40wKPsQ2AnA1Aqg0ystUxt/eN38pBoBqd+QScfkYgrSde5xffDruWKN9yilL7xFRJ/NejRirKBR5+aEx8jgIZVOJIx9oTcY8tuymRrHbfvTRDpTjJoIvShkkFpODJg/au4Jd3zPYvFJEcoLZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4e7e5b6207bso1510569137.2;
        Thu, 03 Jul 2025 01:24:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751531095; x=1752135895;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DWPEL7q51Xv55KR5u/ve8+3d+j78wGLGSO6Hbswv84k=;
        b=UrIeYduDifZKVwcyRJVGac/LA7R4oA3WRWUPocRHltarJdNVcK8D3XXEkFbIBp1hIK
         trW+X7/qVvGZvvD8TtcbiaSxnsj1KfgNSLFFzL3Fe2noMsvs1zvoi2ceO5RlhG2Tq/uq
         8buii5JiDicJpG8yjWV4Hhw/HHqCEHDBDQM4YK4gtsDKJ2nUDelkT2qk4bXoTUNxKWrz
         Yxg7CuKA7q8b4u2wKfjps/EzTZ1G7Yqu1rSGG5TYPKPUBbcaqZvtbQQP/st1PI0NMvcp
         c9XGgU37s6ki+smS2kI3FemDuBtRhz+BJU7bjPM3bpOVTxYfn733Fxcc5FmZdmrRuIvd
         QCsw==
X-Forwarded-Encrypted: i=1; AJvYcCU/G980nSGr5XzboxV/+6KWmyuudY8HV/dmZ7Hpp937xNawtMRlVIsCCSWNOus2rJQ9xmHZFlO9rkda@vger.kernel.org, AJvYcCVWkvUHML46B5NfgjyEIU5aIFMv6tnurqw+Y31uEoRPWhcwY0qsqj/VeNv38S3/B2STmFThVcAlhmaBR3YFitYPF9o=@vger.kernel.org, AJvYcCXq3OXTaPqMSEaKB1zQNaqKMCS1Rh2YNRKNCZn90QQ16+7LHR7aiUyXDOc60C7pXFjhYfcOzDsw1311VNe3@vger.kernel.org
X-Gm-Message-State: AOJu0YyCLwxHXuy1psu4D8kJsWGAt25FyS43nTqZKyfing3TSy5d52dz
	RnZmfM9Zv3mUs5au3L1v0oERSUsYZd/53zt9p5f1xfkxmtdqZYv+ikhWGJ22cEnJ
X-Gm-Gg: ASbGncvJFJS/dWRb1wz1rCzJgzMm6Rz/SOJDbTFfgqlBphRZR0t02U12bgfk8VzeSZR
	dATVPAzjlu6F5BP+fziYfHwHNlcFaJLIco38NJCGCuplD12zoRj9MRLHpJfCbE1VSmPBzCqjD53
	qDjzy+rqFkYPB/Y6DOKeSnED1pYiYt8zmnnolTP86GyY/KGPuUSQrpv3OvDd30YjdehABjRT0Dr
	xxLcWzBSHjnvGt6Myr2UK9favDEPFyZ4dBmAUhM6jFmaQUFwKQhbTEScQXKmcAtsiCLKi44FTjq
	UTIhoGNQE4p6IgYKcBDKs1SbNDyrNFalxvROfS0gtuYoYv20JudEuK7p0AR95FzypUiP7p5gGmT
	D1YXSJwt/Y4bV+Roeoz2+fyuJ33R0bnSfnkc=
X-Google-Smtp-Source: AGHT+IHq6kAWtB0uSb0JHwuEY4VCRzBwu2OKfDNf96ihmkVqdEtvYiIYQJvfpuDOJUCMB4LiySXRrg==
X-Received: by 2002:a05:6102:3049:b0:4c5:1c2e:79f5 with SMTP id ada2fe7eead31-4f1611daf6fmr3780236137.16.1751531094581;
        Thu, 03 Jul 2025 01:24:54 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-884d1d87df1sm2866136241.16.2025.07.03.01.24.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 01:24:54 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-880f92a63c7so1058762241.1;
        Thu, 03 Jul 2025 01:24:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW75EerK91H0vfXHyOGZ3kDaDJK5rvcLwbIYNE0a/CgKqJJlUWCGcEi/bPIaoqz7PzfrWsQcSKuPsZbpmitM5dlpfs=@vger.kernel.org, AJvYcCWQFl54Ok/670r2hV7kudO3kC0+SieUVt8m7rUptuSX++hXJdjnnxQ5GGHgIUHGzUJ6eEKYttcKjsEV@vger.kernel.org, AJvYcCXoFl8GrEx2i/qC09GUvUxhumkhsvVyBd1LEfv5TZWhePSOt8nAKqCvGnWKzCLcBuGTvzGgSvXXxuOzr2U6@vger.kernel.org
X-Received: by 2002:a05:6102:3053:b0:4e7:bf04:412e with SMTP id
 ada2fe7eead31-4f160c6056amr4665224137.0.1751531094101; Thu, 03 Jul 2025
 01:24:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87frfddghg.wl-kuninori.morimoto.gx@renesas.com> <87ecuxdggq.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87ecuxdggq.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 3 Jul 2025 10:24:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV+Qx_P+ddtz5dBVPfiii0mjbXKGk4UJpJhYf1AZoPKbQ@mail.gmail.com>
X-Gm-Features: Ac12FXz_9ERBG7EOZ2U3Rmt3JLH2jMJCpOtZkA8vuPSFdrZqr0uaZeylvSyUGWs
Message-ID: <CAMuHMdV+Qx_P+ddtz5dBVPfiii0mjbXKGk4UJpJhYf1AZoPKbQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: serial: sh-sci: Document r8a78000 bindings
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-serial@vger.kernel.org, 
	Nghia Nguyen <nghia.nguyen.jg@renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Jul 2025 at 06:51, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Nghia Nguyen <nghia.nguyen.jg@renesas.com>
>
> R-Car X5H (R8A78000) SoC has the R-Car Gen5 compatible SCIF and
> HSCIF ports, so document the SoC specific bindings.
>
> [Kuninori: tidyup for upstreaming]
>
> Signed-off-by: Nghia Nguyen <nghia.nguyen.jg@renesas.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

