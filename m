Return-Path: <linux-renesas-soc+bounces-21713-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5626B51730
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 14:46:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C166544E02
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 12:46:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 619DB25C804;
	Wed, 10 Sep 2025 12:46:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3E319C54F;
	Wed, 10 Sep 2025 12:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757508369; cv=none; b=QfU7xD29VZWXViXZVzdy4pNoIJJ7v4+KYiZ2Dda2Xopaaf2WyvYPFdQvmkJgLotCKH5Omzx5Ic64bRF0Jdi+AglNf97P3YDW53EmtSreN1F3fk12xaQLFtJXmrbGLCf5BYvESPBKsrnT4TZh2Ld+p9dYRAHcr2+fm55bObpQ9h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757508369; c=relaxed/simple;
	bh=N1SR8rJ8PTK7bmGyIJ8Cl5R2MTjSbbEwOfEjmzYrW30=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N+mwJfD4gEJisqdpSWiS4NXEV+w4WdQatwbB4iujSNEF0EXsNWJwFxmwL/qENLbZX/6IDr96eqF1iPwlV9fYB7jZ3JZDW/LI5AJwhfQRlaSelEIqRBZK2XS5+tcliQ/LjcZI9jO88bNxZZahZkUMvdUH8QyKo01EvWAnyhWDHGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-544acb1f41dso2915821e0c.2;
        Wed, 10 Sep 2025 05:46:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757508366; x=1758113166;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0C0Zz94HL+zPYRAI6xh28+yF86Y5DIb+IbbD/f/osOE=;
        b=SR1n8xmXG2PDIjeF8Ja0fvyCRucYqWi4n2qfyWlsNVX2ErQ8fboRF96CwsZEu1iaOe
         aaQIMVMgrNsMM1jD772/qtcrgWMP90ps1dCswcTLe9chDG9L/4VybsclqYDR2SyXbRfd
         syi8qNfmQeyRoXu5q6XOenU7g4oH7Kc+wg3ZBcZC6cj6tqd/AvCrPCzcd7mM/BYs+bo5
         hKEv5KyXbfM3ettcxIrx15O/JkyE0zipKM1V7xb0ju07KPRtf2f5NREVpc/lHdM1Gjgb
         UQe5YSYzFQ0Jp4lkaq2nSfVdVK/Krswo8ugkBLx907UZexwEMk30QKSKsD/nGCY1R9zC
         LOlQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3ClAJSE7sgC+LKFMXUmEhV8vXLRnO0U6R+hjy5auclhPeAxWkqsP0/6X9wuwH9Agq+ff3F8UXuPYm@vger.kernel.org, AJvYcCXMo3ttzLc4Sg0z+Cn6LVN+lKS7RA6Jl1LuOXeLGMJqRZReTeJ3n99HIOug2Q7XKbCrZirl0ov48jwVf4M3tVss4Lg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJcv6ZzW30xhbeVyn/9/1T9MUqZs8vh+vhhLvaJToJUgv+a8DY
	LfyOpSiWMtMO8xZxvexZ7VeKdDyAmETX0uS8HayYIMbDinJnmwpj4p2lDh6jWBIM
X-Gm-Gg: ASbGncsRCzbv+DH1wBUktvnCDIaGsM6GJEDv/hvCwA3W8S1c8+VsHTm0ga6PB3cCVb8
	3t6M0O0JUdHFR7wVtfnIXqDYoG/Zbrhb040ZyXSHVNiS7cST9br5ZYTiSmK2OX+zHhGblsZW/v2
	utq5Fw0c/+62B2Y4Q99uy9xu30fz/BfbW7TczFYIQpx99EumQr9YO9URHbNaDPRtcZgppMo/CSb
	qPSmdINo0kUnUgrSgxt6+qodc6NGAn+IZH5HDhNJOnFv8yzkg8zfUAwBNtQ3PDzOby62F3WGPDS
	XfQv+iwWgZRFPAOdzXWSOoJDqioPtfavL961fUWZR43V/SZyjGY7F36RT9REhs41L2oO7+PwjpT
	/O7zxGaKNKHtfZukpfnWTHBRztRccMrsXAtfhsvaSXluRFwgkJEZjUlRwLNgMtDDeh0ov018=
X-Google-Smtp-Source: AGHT+IEI1a39A1xdhcWc+1XzvycMhNM1msijdFqWm70ef/LcwEYJ/8eJf40L8c0nd5m9eD4bOhRWzg==
X-Received: by 2002:a05:6122:c81:b0:538:d49b:719 with SMTP id 71dfb90a1353d-5473a3c38bdmr4347181e0c.1.1757508366426;
        Wed, 10 Sep 2025 05:46:06 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54521bac78bsm8808881e0c.30.2025.09.10.05.46.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 05:46:06 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-892196f0471so2371307241.1;
        Wed, 10 Sep 2025 05:46:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU+JlM+o/ds7rf7ORQO6v1L3sUZ50laToDb9QZ6Vuk1dQlE4VAcpY+y+XOsIlQtH5hNu7tRXJKTXZxR@vger.kernel.org, AJvYcCWcLIxKjE13wrq+a5nH35UweaiV4cCslos2m6Ynr8RUhSN7GBzpYdCJ51OoGjH3kWLqCqOj7QWDpGGJwRmAxStXTs0=@vger.kernel.org
X-Received: by 2002:a05:6102:26c4:b0:4e6:d911:dd84 with SMTP id
 ada2fe7eead31-53d1376ba3cmr4522003137.22.1757508365760; Wed, 10 Sep 2025
 05:46:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87tt1c9z7h.wl-kuninori.morimoto.gx@renesas.com>
 <87o6rk9z6c.wl-kuninori.morimoto.gx@renesas.com> <20250909-witty-successful-toucan-beca41@kuoka>
 <87segvw5yr.wl-kuninori.morimoto.gx@renesas.com> <983be392-e76f-40b3-ac57-5321f5d88abc@kernel.org>
In-Reply-To: <983be392-e76f-40b3-ac57-5321f5d88abc@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 10 Sep 2025 14:45:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUFOGNNuogp19WoCy4c-4a6KjBfyutp=UWfvBD2oHtOAw@mail.gmail.com>
X-Gm-Features: AS18NWBtV9Ev1wnTZLaH8WY_hJUZoziuPAkBnzkBuGvA5SPBY48fHeUh8sE4pdE
Message-ID: <CAMuHMdUFOGNNuogp19WoCy4c-4a6KjBfyutp=UWfvBD2oHtOAw@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: renesas: Add R8A78000 Ironhide board code
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 10 Sept 2025 at 09:11, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 10/09/2025 01:39, Kuninori Morimoto wrote:
> >>> +   chosen {
> >>> +           bootargs = "ignore_loglevel rw maxcpus=1";
> >>
> >> Drop bootargs. Not suitable for mainline. I really do not understand why
> >> all users in mainline and other projects (not your development) must be
> >> limited to cpus=1.
> >
> > This is initial patch, and only 1 CPU is available for now.
> > The limitaion will be removed in the future, but not yet for now.
>
> You do not understand the problem - DTS describes the hardware, not your
> current stage of Linux support. These bootargs are wrong, I have been
> commenting on this since years.

Well, we can't post the full DTS describing the full hardware yet, as
that hasn't been written yet.  E.g. lots of DT bindings for new or
changed components are still missing.  So we have to fall back to the
customary incremental DTS writing...

If currently only one CPU can/must be used, the right way to handle
that is to drop all but the first CPU node from the .dtsi, and only
add the other CPU nodes later.  This is what we've been doing for
other SoCs before, too.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

