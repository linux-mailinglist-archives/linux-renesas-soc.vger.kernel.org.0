Return-Path: <linux-renesas-soc+bounces-22789-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20478BC4496
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Oct 2025 12:19:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE2C3401022
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Oct 2025 10:19:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA2C22F1FC3;
	Wed,  8 Oct 2025 10:19:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DEA82F3632
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Oct 2025 10:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759918761; cv=none; b=mauJVlGevYwoK7MS+qwyQXRGOUOF/Elg9BeNLrSiDYUrSK2T95mfrUBD8dTPWVx6NPVypL7hR4ZopWiqx0gPBZnoxbqbJ0hbg5Wp9I2l5/TpYeHDh+XB11p2PVboawrECFwTJUA8DesDISv1uyQ3cq7F2wHTQhtn0XpAHuVsc/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759918761; c=relaxed/simple;
	bh=41JLkiaspv8I62corOwXybyoBLD22yrEUZJLxiyHEno=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CG/KIV6Tjlzgb2dmFNK+tb09Q1IQKTGsU9TdPmBz15tqliQeOlqN5cZUyvvdtwP4X+YDCVw4PJYJGBI2fuaCK7oVWnuDHURnGBKZfZXQspBe3z8/ioKHxneI98LSqQfwOswbejvvpq8flTfjg68K6aF6Ia9gH5cvueCmVe4NzGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-54aa4b86b09so3660370e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Oct 2025 03:19:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759918759; x=1760523559;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kcfRAkL12GvEO5UonVdhJvoy1IYd4LHwp69l76UKLtg=;
        b=VLk8Cxw30IzwRpCTB0arXD9z5Od+oUxIj2OIjl34mDbNwIOY99xwAoRDS8RSTdxziJ
         ugGwLw/zu+s59EDqA1P+XThx/Q4YFnC0skydyAD8ywpD6F8Q86gRyE83NTJxsHZ/Ldlr
         tLDDHgy3Tl7w3cm/hM4USVoZ2E3Dj9eXKiR3cxUYDSuDxNec5Ff/elpVA5TbegrhGWPm
         NzhjQCo1o+00NH143tXY5w9a1MHvdRLTplHII4awkvyooWc+Jpv2GhvvISjX67qJKvf9
         61KL9Mf8bzB32jVKO2mOHPg0DQyrUr/E58y/ewvjjoWJNyGhvWi4nJIj5sxKjFa8Cxap
         NsJw==
X-Gm-Message-State: AOJu0Yzfw8QMguW965pWKGi5KTlg5Z2JjWP+I0MALZwsi8wZCEK+WwhU
	daG7CTxo5tnMqG1SfZh2v6qlIa9TsdchcU8acFxxm6kRrosjvvgr67iKjGA2rtGo
X-Gm-Gg: ASbGnctodzUnQgHeI9Oiqtym9UqWz/94F3U/FDy3cvZaw/nr9JYCvHnI+pEjjguakXP
	yJ8ecR8OmDB4OyRRK7izwO27vPPKaBN6zKWNlgWaCovfleCgL4gAyyluAQYpTTKJ+0JFoqxgMzE
	s3WzsmznEgqycMmvH+CsDdF1tClfBB2iNPc2JOo7lqEjtDWwo0guZm2zX5374hUQ6dv0feMQCg7
	y1vDqcqbCmFJVHnIPa5JIlKLA6U5/ku06YyB46RPiK8laCstxgfzulrJbom4MpPu0dOmmDQGt1D
	Ll2JFUWXJ3JZIZIpceN3Mmr0K4Dfdc7qBy7Wmk+aY4XIupYOps9BHNdZN1p5SdJG0obZJXu5kPE
	crPkU8Tdq25J53vaG1cQ7YruF7ovtZvaRiRjbyOqWtDQAsayQTH/WQ3ERvaapwPxLs50QfI29xB
	huuuKn9z1WylD8iNaPT0c=
X-Google-Smtp-Source: AGHT+IELnYUqMbdb82FOF91TngU5mlK/GSFC/eBWsF2WgqnfVioHeljiW3PsYFh8FpBtqyj15KhnMQ==
X-Received: by 2002:a05:6122:1d90:b0:54a:a251:ad57 with SMTP id 71dfb90a1353d-554b8cffa63mr999612e0c.16.1759918758632;
        Wed, 08 Oct 2025 03:19:18 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5523ce69923sm4397459e0c.11.2025.10.08.03.19.17
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 03:19:17 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-91bdf1a4875so2068458241.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Oct 2025 03:19:17 -0700 (PDT)
X-Received: by 2002:a05:6102:2925:b0:520:4054:6b9 with SMTP id
 ada2fe7eead31-5d5e226f3e6mr838361137.9.1759918756906; Wed, 08 Oct 2025
 03:19:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251007152007.14508-7-wsa+renesas@sang-engineering.com> <20251007152007.14508-9-wsa+renesas@sang-engineering.com>
In-Reply-To: <20251007152007.14508-9-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Oct 2025 12:19:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXdMK30hQrOR8CsK4Y-5ay1T3GUtSFiunnfGNVO4vDwrw@mail.gmail.com>
X-Gm-Features: AS18NWDAuwWmqJU4uirFV040dMIpRx_qEpSrWPNxsSBV2umiQVZCcO8iQyDM_X8
Message-ID: <CAMuHMdXdMK30hQrOR8CsK4Y-5ay1T3GUtSFiunnfGNVO4vDwrw@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: watchdog: factor out RZ/N1 watchdog
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Tue, 7 Oct 2025 at 17:20, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Renesas created different watchdog IPs but they are all handled in the
> same binding documentation. This leads to a lot of conditional handling
> which makes it unnecessarily hard to add new items. Factor out the RZ/N1
> watchdog to make handling easier.
>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/renesas,rzn1-wdt.yaml

RZ/N1 does not support "timeout-sec", right?  As this detail was not
expressed before, you may want to mention that in the patch description.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

