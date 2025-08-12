Return-Path: <linux-renesas-soc+bounces-20375-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 663FEB21F78
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Aug 2025 09:26:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5BE7B5022C3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Aug 2025 07:26:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E4B52147F5;
	Tue, 12 Aug 2025 07:26:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C521EA6F;
	Tue, 12 Aug 2025 07:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754983614; cv=none; b=bcOGjkU5sROo/F5Vt0MaTC6CmHh5MzBYLFjiEVpoMwZA84wvqyFFiHWqFoMNz5OJQdsssVwg2e5Ii5uvENw3UjgH+chbFv4j+4yngtstI4h7C2Q2qo3bVZg/hi6sCzHXZbQdYGkSsQgJBK3egueSVWWbWAQDkODlIBDZ9hGitR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754983614; c=relaxed/simple;
	bh=Vqmz4Jw0h0u2J3d7NBz6dmsiJpUrhlWS2utaBKtVoaQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o0PaReLP/tsxRI3ymLAI0xVDT3FgDPJfji6ktPJJobktOSazISgH/vGYrnzsGVtIAIYEDXUg24TEL/XEiA8DdJj/lTXqSkAlGd+NZhOip+X2Q8LrH3imFrypSJE0fcm8ofxnjiHVXAVp1phL9j2gxq5aJere/SzCxIaRqhMVSME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4fd6c638f20so2413157137.1;
        Tue, 12 Aug 2025 00:26:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754983610; x=1755588410;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tubJ8aSgE8vcuuPwPLt5w3ARkPG8t9vfdZ1hEMEKVGQ=;
        b=vDp6tIS348gvUrF2vqAkON6126hdA2UWZQ9EVDvoenWZ84Z/78K9r6WUYbYaMJ6WoR
         XH+Uup6lsrzkkZD/B8Ur2JqPZx7H/dyuL39tqyfOsx8KnVOL2OL2dq1ZoAGRlzeH7Xya
         r38e51ELtHMKsOvnNZfW6JcPOM4c6DZ0Yj5CD/k7eQj8InT69RbQsFlVMAzMDanCfc9G
         beQi/K9TmGcwnVZJIeB2hsLAh6KxvDFvCoPlmjF7x/w/8P0+w7BFagKkMb67T403p1+T
         BUWQOP7MQVYkLpPP+rfZh3Ne+OhdENBCuI7YvmboXiThjKeN5/D6dB+QXJ5I4K1ZeAuk
         teJw==
X-Forwarded-Encrypted: i=1; AJvYcCXPBTDgNNzwtp7HKghnm5rKU/pkX+kEGwfvyCzE2Na0eCfD2mCFy9fsv794ERlP1FFut17h2v3ozBFZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3K+Su1L8ig9tUra7wXkqxMPH05elk7jaFbAI0e7r/VV0xsVFr
	mbVvvNm5kj/4O27KTs99QUmKYXsVTEU5a2Fm9DJHNV6CGIJluaIL5ubCd840zmoU
X-Gm-Gg: ASbGnctTTQm04L+01KtgNNj2NwJaQfSZQMS1yOZHZbnxDO9ZPHXI7hD9bHZriXJLxI2
	+VmzbYFH0qmBOcO+9thCWUPgwL34Gd1RpfjyZoDVfClYt+azvdbu2HzSIumIIuFr7EWQlJv+d+U
	8egG2TNSHq9ouXvbUwsk3bfPUmbzYLa1LgV1HeqInpwikPybaqfZAyPAHI2VpTIhsK6B1QUeNLs
	c9TzzrN/5FybJPp2t76KbEQPiBl3/htOXC6XDZ7b1JO7YYTWyegMJ9v1KZzl4Uh2DO7GAkMvuP4
	04TvS7cwc5xjuFkJfaBLEmlDzlrbGl/rSeBZzMysplG2uWkwWGjYzTcrLjrZmvjFBA92vS3ICG5
	1SAPPt7o8J33PC0mU4eALkCMpDyuFBmlL9h6NFHBLU3vyPonT679QbNNHIBZx
X-Google-Smtp-Source: AGHT+IE22c65IAqmAEBBiyx5UNTVwIb9UdTxUgZmlYDo1WVoBBRBBmWad/ekEk0+kA06X7FKKV9UsA==
X-Received: by 2002:a05:6102:80a0:b0:4e7:db33:5725 with SMTP id ada2fe7eead31-50cbd1e1ed6mr1322552137.3.1754983610166;
        Tue, 12 Aug 2025 00:26:50 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-539b0289e25sm3103107e0c.20.2025.08.12.00.26.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 00:26:49 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-504dd871d70so1670997137.0;
        Tue, 12 Aug 2025 00:26:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVuFJ93IRW+ECN+KY6BOfSz7DE5i1reKzly4n+aXnWpEwaMuVsAWciZRDooepQfX0IsG8G8+7p08umO@vger.kernel.org
X-Received: by 2002:a05:6102:5816:b0:4eb:f003:a636 with SMTP id
 ada2fe7eead31-50cba614752mr1261657137.0.1754983609717; Tue, 12 Aug 2025
 00:26:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250807151434.5241-6-wsa+renesas@sang-engineering.com> <20250807151434.5241-8-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250807151434.5241-8-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 12 Aug 2025 09:26:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVatod_9rSdBHxztW0trXmJF5C9tGW33zYBevxeUyXYsA@mail.gmail.com>
X-Gm-Features: Ac12FXylnsZq7t6uqey2mzRB4JFnSxk8U-Ju9uG0HddHV1XHh6B9JPR1itdAbtg
Message-ID: <CAMuHMdVatod_9rSdBHxztW0trXmJF5C9tGW33zYBevxeUyXYsA@mail.gmail.com>
Subject: Re: [PATCH 2/4] arm64: dts: renesas: r9a09g047: Add I3C node
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Thu, 7 Aug 2025 at 17:14, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
>
> Add the I3C node to RZ/G3E SoC DTSI.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> @@ -601,6 +601,41 @@ i2c8: i2c@11c01000 {
>                         status = "disabled";
>                 };
>
> +               i3c0: i3c@12400000 {

Do you want to change this to "i3c", or the "i3c0" in [PATCH 4/4]?
I guess the former, as there is only one instance.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

