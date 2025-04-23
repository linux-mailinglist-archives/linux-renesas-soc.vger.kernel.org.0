Return-Path: <linux-renesas-soc+bounces-16254-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8055EA9893D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Apr 2025 14:10:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2ECFB3ABD28
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Apr 2025 12:10:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D8EB2135B9;
	Wed, 23 Apr 2025 12:10:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01F72701D5;
	Wed, 23 Apr 2025 12:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745410244; cv=none; b=EKjzKL70G+5XzOBLohYZqjDX+DZHjds8JA1mUfkPnu7sJw2mpyFRXFgi1ifNwsi6J5cS84f0WoOJPTFgppEDWEcJisy0EdUjSpBGiEl2X91FDuhzjAPkbhMs5wob59NCX4CJ04BfT6C2FWM9WLkLoigytxZ7ncGHhxkc36S500E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745410244; c=relaxed/simple;
	bh=50OYhniUO40MUdEvUFE9mUFx35g/8lAU7glKM/JLcO4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kSGasSSiBnbVjnZrV6klmbPeWkPJNjIyk9Q5C//fxWw05W+dr2IBuZqBGP5uMBfqTXlISF9UF6vCs3y2rv3W0XUDvXtAtKXAuYsM5jtWWJ2bjSMHR75HLPbzT4W0qWyEy0i1FJSItzneWnnm0hbrCbq89hKI6LZBihhvDzMQcc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7c9376c4bddso437716385a.3;
        Wed, 23 Apr 2025 05:10:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745410240; x=1746015040;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0QM5ZvbfPXr7i/ZxTBQ5GhLuL0x40QZISlgvl9O7QBQ=;
        b=SRbkX9a+sVgAJSayEi45MXzCgcIXhhO6AkhrmXpHTispUcrWNxnpNocwsj2scZbquS
         jRZ85dEIpWVLRb3ORAlEQWihDXX8F7g4OZaI1na0kvS5MDFMXbvAOXtaXXYtbPCMmrap
         AmCv+vuVCIiBOLb4bUAEeV7HHeip1iod0R3l2ouONGD+oeSzNZ5JYa+9XikaD0YUQrer
         +iBvP0ciznoYDl17Sk2t2LRcg23d8w3oMxBbKHLP7tKesxkAKps2spHBGP6lG1Sc9fTh
         VvENRuabohTmcslBpapEMeXNBCH/nbVQpYqPo6/FWGFCiX41TatlaGoZ7Q1kVMToxIE/
         oI0A==
X-Forwarded-Encrypted: i=1; AJvYcCV+3xK/FZVPVlTpL1li9lke8qfqyRa3h+mXDM4Xq+Xy5vGiOYXGplt9RSyQ/I5AiiVrSs7FjZg3CWm2lZf4@vger.kernel.org, AJvYcCWuCTdsIpPWVLDD0Qi76tTDGjmSiGAhe63OcwcsnRjf1FOXhqRz4TO30D51wmXQryPUXArArXk/DQfK@vger.kernel.org, AJvYcCWvsKd7it13s6n4whnjEDsFf5UfbN2jXzDIVGOHlM1jXmwIfoYTQrR0IXXqb4BtNteAlP3zBkrEYwJUgkTOPsPSguo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2VeiADKz2TTBPc96EfI9hUtc7Pk2MOmcXxWT8lLvDSotDwSse
	J4jET70O/CClOJTl7sotHAsf/38xS385gCgXNAxQgjHbmtA24yB3QW95K17aF0A=
X-Gm-Gg: ASbGncu3+UmsKNcZglydN+Z1xDcBrbPHIu3jA9KaZMOt9IO9pr3jDd9hZKw5RnoT4fj
	Te+yyv3Q61nNEnhc/KBN2CVmVyjHEnpCq7/F0xYOBe0Eg3zFd4cUEi+tWjUrYrvMOkMgukBfRvv
	nAYAsEWU3M5xJ/Dyv5Fsg5jRxIRezgkt4N0u3hPc1CN8/JP5WXf6qj7tNCIIqyt/sjaZ9yG2MwN
	jH+O3ZQLNE/kdELhjjGcb/hO3RHHGRkPQnNYSEQ87QBQ+ttIlqujnUhBBUBKqvzzbgnd80M1+lY
	+gC/9mn9xE/+2YbFSoOyLT9f8I4Cm1Kqz5BbsodNZ3sFaguVsKgrXwM7KcoQnaQ/znzZA9ZnMbK
	ksCvg9OQ=
X-Google-Smtp-Source: AGHT+IHuVjSt7Qv+69yAR5X4OtcCuZau5YIC+ZndzM9DFYw5yHxRvbj/qK47ccv28JGEtlzIm00Pbg==
X-Received: by 2002:a05:620a:2890:b0:7c5:9c13:2858 with SMTP id af79cd13be357-7c927e525a4mr2605258485a.0.1745410240282;
        Wed, 23 Apr 2025 05:10:40 -0700 (PDT)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com. [209.85.222.180])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925b778c0sm675243785a.112.2025.04.23.05.10.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 05:10:39 -0700 (PDT)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7c5675dec99so605236585a.0;
        Wed, 23 Apr 2025 05:10:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUvpxnw8DQC7Od+Vclf+C4B1SFCZjR/hL1x4HkAJxnijGrw4S/xGf99EgUiKJIG2R5jn0kjzXV5LNw2@vger.kernel.org, AJvYcCWND1k9j+CDqbTqTX76TK1Hyt7WKet3k4adO/lxvO/txc9ZHffWA77GI0ueTT0TVbRz1h/NFlp6q93MwwyeprY5sj0=@vger.kernel.org, AJvYcCWtXuuSSh/2OCsVDvra2pqOohM8ibkpcri8XmsY8MEt8WlAICwRAVV2a+UrAonOKkk7ORD82J48LgKCU+o6@vger.kernel.org
X-Received: by 2002:a05:620a:3181:b0:7c5:dfe7:4b2d with SMTP id
 af79cd13be357-7c927f9a96dmr3344890285a.18.1745410239677; Wed, 23 Apr 2025
 05:10:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <90c7aa143beb6a28255b24e8ef8c96180d869cbb.1744271974.git.geert+renesas@glider.be>
 <CAL_Jsq+sCDEO_n_TLmyNBfhc71NNWWe2UQ21jh8+AdHH=G+KAw@mail.gmail.com>
 <Z_k3JV1dEexJurdc@shikoro> <20250411161620.GA3329787-robh@kernel.org>
In-Reply-To: <20250411161620.GA3329787-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Apr 2025 14:10:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW+zxrjAnvxKUrR6jKxrt6j=GqWWqkFsK9wXVed4LjeTg@mail.gmail.com>
X-Gm-Features: ATxdqUEqDdop42Pl1kgOCsp2hc6Y8nfJGNl1D-80czuaW_alLiTH5lFh5gAgDoc
Message-ID: <CAMuHMdW+zxrjAnvxKUrR6jKxrt6j=GqWWqkFsK9wXVed4LjeTg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: serial: snps-dw-apb-uart: Simplify DMA-less
 RZ/N1 rule
To: Rob Herring <robh@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-serial@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Fri, 11 Apr 2025 at 18:16, Rob Herring <robh@kernel.org> wrote:
> On Fri, Apr 11, 2025 at 05:37:09PM +0200, Wolfram Sang wrote:
> > On Fri, Apr 11, 2025 at 08:38:58AM -0500, Rob Herring wrote:
> > > On Thu, Apr 10, 2025 at 3:23=E2=80=AFAM Geert Uytterhoeven
> > > <geert+renesas@glider.be> wrote:
> > > >
> > > > There is no need to repeat all SoC-specific compatible values in th=
e
> > > > rule for DMA-less RZ/N1 variants.  Use wildcard "{}" instead, to ea=
se
> > > > maintenance.
> > > >
> > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > ---
> > > >  .../devicetree/bindings/serial/snps-dw-apb-uart.yaml          | 4 =
+---
> > > >  1 file changed, 1 insertion(+), 3 deletions(-)
> > >
> > > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> >
> > I'll send my counterpatch in some minutes.
>
> IMO, whether you drop the platform is orthogonal to this patch.
>
> Whether or not the platform can run Linux is irrelevant to whether there
> are bindings. Can it run u-boot? Now, if no one is going to make the
> bindings complete and upstream a .dts for it, then remove it.

FTR, the document "RZ/N1 U-boot Users Manual Rev.1.06"[1] covers not
only RZ/N1D (dual-A7 + M3) and RZ/N1S (single-A7 + M3, no external RAM),
but also the lowest member RZ/N1L (M3-only, no external RAM).

[1] https://www.renesas.com/en/products/microcontrollers-microprocessors/rz=
-mpus/rzn1d-microprocessors-featuring-5-ethernet-ports-and-latest-redundanc=
y-protocol-industrial-network-master

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

