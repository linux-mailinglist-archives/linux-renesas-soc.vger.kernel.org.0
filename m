Return-Path: <linux-renesas-soc+bounces-3664-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F533877C39
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Mar 2024 10:04:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 917FF1C20881
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Mar 2024 09:04:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB6FB12E58;
	Mon, 11 Mar 2024 09:04:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5237218AE8;
	Mon, 11 Mar 2024 09:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710147853; cv=none; b=KOaJKD+c2NLzbX6UAhyKFi34rmjsTfAjORI7zpVLzKovgGYb+mfQnW2hAXwdwqK5su6fAyZHr5H3dbk0ByRoaXYZUqlJlPUiCiH4IDyW2l1CPvuB5R5vDKncE8z83xpvgBQGccYp7mljcCcjPCB4eYcYrrWrSF6yOIcJtxgcrlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710147853; c=relaxed/simple;
	bh=UhWBf8WlzHf/8iz94ujBrru1hGafapptGPqfQPuw6Hc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b82XHRackf0gRpLDB+ZTwaFiph71Fi/VunO/SITvT6Hwam8hgU0VYxaJ8PaaOUWnftkxG5PGoyeedzswebUnznr2zlp4VB3xfZ1U+06vNMQzzAANEr1peSCOvOjif1u6SlAxI2YeWyK4xrKcNHDC2JnWWXKhBRBNLIRazEUgEqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dbed0710c74so2127997276.1;
        Mon, 11 Mar 2024 02:04:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710147850; x=1710752650;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KNM5eH9qRYarsRdFEeaIZyS0ZS48Aigou8zbu7NVV4Q=;
        b=ToH5KXQB2+sFo0m5038yQwApZ/64XAwBrJV2I9OInbFK0dLw/jDWfB3Q6omLp6nDWE
         KpBUwLXtPRXVqWbNyI3dKe3mFMgAXN4An9gZOAce020Vn8XFYby/ts7nsXNTUbcOmnZe
         tz2fozZWXrZvuP11DV0lzIaucHkpAcBBaP279BEDbRdfSzCdB8rawDE0up5rz0BAPoE7
         IJefY4X296fV/BHnxJca6Ili9DKR6JgKJFDIcjTK7hg4+Uv5cEC23H05mkqpRP1V6UVf
         0llD85THzshvAomscHiw4UDd+ZxrlfvFMX3EsON1fdIFnAKdDtvlbA/cgr9fCRIivBSL
         V0Sg==
X-Forwarded-Encrypted: i=1; AJvYcCXxGWEICAIA+EVRbCT6iUDV3iDbtlsSwGBPVUxZAW8p9YYHt49N8b3f983TAx6UPZ96tqdk5GChiKp4N/R8u+7SSoRMyahwyu87S2z0xR352zZxTB8rYlNf5oJzhxjgDK8C8jbl7DsPcHBczKQU
X-Gm-Message-State: AOJu0Yyo/UByhfexUU41WqNC7t0NhLf/5/YRhI3xWlxLsK63eRou4IhI
	6rJ17S5caP+yl3VQEzkIRl5M3l90+ozWzX9+ZLyny13QTkNXHvbVgb6AT9WpVyM=
X-Google-Smtp-Source: AGHT+IEM4Z81PZk/5X5HokSqIvKgdtaoHC4Qg2OV3haBJGOtYSTkudHtH69bKlQMfHN1xyGMQIwhEQ==
X-Received: by 2002:a25:b194:0:b0:dc7:3265:37a9 with SMTP id h20-20020a25b194000000b00dc7326537a9mr3726254ybj.37.1710147850178;
        Mon, 11 Mar 2024 02:04:10 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id 189-20020a2516c6000000b00dcc70082018sm1081636ybw.37.2024.03.11.02.04.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Mar 2024 02:04:09 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-60a068e26d8so29802257b3.3;
        Mon, 11 Mar 2024 02:04:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVpW/OEKKjeKqBKVAWjN9aD3KMGPRLHwvmrcgkqWRUVVrwyBxBcEvz25oBz3w38wdqB8klOb55ynH/+9R0i9S3ECDC5iVQsYyd72Bq/BJ7eJGX9ZCSwq5Nnk9KdSWS4Lo82u14bQ/e48B7BqTK+
X-Received: by 2002:a0d:da45:0:b0:609:e4b4:c2fb with SMTP id
 c66-20020a0dda45000000b00609e4b4c2fbmr4817419ywe.27.1710147849283; Mon, 11
 Mar 2024 02:04:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240308180919.6603-1-biju.das.jz@bp.renesas.com>
 <20240308180919.6603-5-biju.das.jz@bp.renesas.com> <67819907-4366-483d-b71b-2646ffb076fd@linaro.org>
 <OSAPR01MB15874E48DD2269C2593DB55A86262@OSAPR01MB1587.jpnprd01.prod.outlook.com>
 <ff569d52-f68f-410d-9897-9e1102171a1b@linaro.org> <OSAPR01MB15874A9DB0CE13AB0440242186262@OSAPR01MB1587.jpnprd01.prod.outlook.com>
 <2821f23f-aac1-4b12-ba60-bc60da153d8a@linaro.org>
In-Reply-To: <2821f23f-aac1-4b12-ba60-bc60da153d8a@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 Mar 2024 10:03:57 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWezORx9NCdjnj5r4pGdRQX8f6vVkYRFCRUMf7e_bfdrQ@mail.gmail.com>
Message-ID: <CAMuHMdWezORx9NCdjnj5r4pGdRQX8f6vVkYRFCRUMf7e_bfdrQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: renesas: r9a07g0{43,44,54}: Update usbhs
 family compatible
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"biju.das.au" <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Sat, Mar 9, 2024 at 2:30=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> On 09/03/2024 13:32, Biju Das wrote:
> >> -----Original Message-----
> >> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>>> This looks like ABI break and commit msg is quite vague about it.
> >>>
> >>> OK, Will update the commit message as driver is taking care of the
> >>> backward compatibility.
> >>
> >> Ah, I was not precise here, you should consider the impact this is on =
DTB used on other kernels. You
> >> guys should really stop using imprecise/incorrect generic fallbacks an=
d, since it is usually tricky to
> >> know which fallback is correct or not, you should stop using them at a=
ll.
> >
> > There will be driver change to handle SoC specific compatible.
> >
> > So ,
> >
> > old DTB + old kernel will have 16 pipe buffers
> > old DTB + newer kernel will have 9 pipe buffers.
> > New DTB + new kernel will have 9 pipe buffer.
>
> You missed new DTB and old kernel. This breaks all users of DTS. That's
> the entire point of your broken generic compatibles which you did not
> address.

Doesn't DT guarantee only forward compatibility?

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

