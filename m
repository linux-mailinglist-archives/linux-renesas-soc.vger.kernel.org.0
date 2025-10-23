Return-Path: <linux-renesas-soc+bounces-23498-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E71CC00FE6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 14:09:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7A0905084F8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 12:07:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA7AA30DD19;
	Thu, 23 Oct 2025 12:06:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF5230F95A
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 12:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761221216; cv=none; b=t3Okw26rK2xzF4Mhr0Rj3WCF7+LWEkYhgVak/iEIuonq/Mr7m7f9U5/zqVtEPv88VhzEomQ9A/zEUNZFMdCni4AVcx3zH+WBXa3Rmx1S7o+vlzRqsfVU2+fUps8jbfgJEYJBid3qQPrHXhqQuMcKvYVsGuHaLQ39N3ddRsgrscw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761221216; c=relaxed/simple;
	bh=h+vkc32ZzB6Y3nbGVdKMOxil1Yt8+ajmhfuNJw4BOD4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U2bne6mDAvS42Q+/8nI4xgzcE9RZhUZWMQw1ttPIXhJExb3QovEq3220AxBmMn+LdtfD680drjPlgJ9CNadyhAw1BRVCzv88qk34iku/qID+gHR0KvyI+BFVWJbnsFljd3HdcZZAfD7qFsWnBifgcgCiLniTK0uwfQ2W6mmh+C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5b62ab6687dso855313137.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 05:06:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761221214; x=1761826014;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p3PrloVXYulHwAuaRFIv3VsJXdyEGVj/DTV7jXOJzSM=;
        b=Dc8Qf/pn2mFqPhc3+hskOsobDeoX2ZwLn8vCWLfYTvnh48GpoNd5TI1LQbAW9IwN5B
         AMeOjh/wvq/LmUyCWdDYBgtz4DMdql92+gmxLQ020IrCiMhvY7sC9sVy01diHQcWTaIK
         /4xvvtpAiawniSoc+gCLMRX708RonaKG5HrhR9ShK8FArU/UmME9R0r6C/HU1/5lVTQ4
         n16MhyywDOixspVSoY6sKWYuHj6//F1E79gpyeY9//WoLo/mXm1AlT/nINuf6GNUmK8O
         0N6UmPlbpVnCJlJPIAJoVa3De9NQBQLJzRTKZWdCkuiyb3Ak3xv/qgVHyqL1ULBI9DKN
         PJag==
X-Forwarded-Encrypted: i=1; AJvYcCWfGGyw5eUgEzHoGgtVjWXJYFBIIBAz7orq647NXUErpsjkvDS3O/Df7ohNU3owli+dGMXo1q6jUdajqcU4lK3qaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQlC8hBQNvkVgMy/wmHwh/clZP0Q3y9ZTZJdpscnGqRB7YaoL6
	dXRJbO8Cbbpbt+extZjdk/MZxM6ZeFKCTf3zCMhyMpmct3svFYBk0UHw9VH5j3jx
X-Gm-Gg: ASbGnctuvs3OdZUSgLKFvnMCwqdAu1hKAkk+M5PTat8XTNOWzrkMb/DsuGO6Rwyfrtt
	CUbuAAt8obUeM8/ofdCKXPZIUXNTPD5p70228hlResbGo+UPxMSGZw1t91RRnYavKiAZ6wPPlk6
	OucAMuhSURstKzNqP6kXXNvYyMx9/XdFGYrNBkKbVnx6N28fhbcpapX6XY/GZxdNW0oNVA3juY/
	zHEeUDR9vs7D742MQq27+jhOgOHldWiIt9n3bQ2uXQHFsx9U7f7RtTegz+H2pmfA90trGA0w2SN
	1v8t/bopn2hjaABnh60LJzd8lmKA5hMXPVtr37aVokNZrBxD0CqGb3zIvo0cSTVdEFw8A2nQCfh
	2luKsAh28z4XHoi+SQI1WBsQ5/GDebZjMvh2Qi+wtCxeEhiD9RNA4d6mzB45IofulHOnWiRvL/V
	cI5nzom8aLqO98Gd0O8aEXevCcE4BhaCi0DF9fp2X/Xx6P77Ep
X-Google-Smtp-Source: AGHT+IG7HxfXLvGrAN2xUa6rOAwIPSdXTpEfZm25t418mE6NmYmYesMY4lbgENx6HrqD3u0tjgnkcA==
X-Received: by 2002:a05:6102:949:b0:5d5:f766:75f1 with SMTP id ada2fe7eead31-5d7dd551c22mr7884511137.11.1761221213743;
        Thu, 23 Oct 2025 05:06:53 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5db2c7c9d3asm764186137.6.2025.10.23.05.06.53
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 05:06:53 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5b62ab6687dso855290137.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 05:06:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWQZjQ2Zi+uz0CG/6SaKPE7zrX/zxEsrCfS5hz4QI2v6sZWBTnsKsLo01yeFAWqFmr16RpTpoVRUfyxN1Bpi+JA5Q==@vger.kernel.org
X-Received: by 2002:a05:6102:3f04:b0:5d6:27c7:e6b2 with SMTP id
 ada2fe7eead31-5d7dd502043mr1773971137.3.1761221212859; Thu, 23 Oct 2025
 05:06:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87h5wsa3h5.wl-kuninori.morimoto.gx@renesas.com> <87frcca3fn.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87frcca3fn.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Oct 2025 14:06:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVxS-cjcYSfGBcrcmEcWUiZQ2bcB=5KUVhOkddvvyVYoA@mail.gmail.com>
X-Gm-Features: AS18NWCCDA4ZcBUR8Pt9ZNf-GPGyVbzC7QOLSvHrOidBYngzkjHnnbOKzVEfnBY
Message-ID: <CAMuHMdVxS-cjcYSfGBcrcmEcWUiZQ2bcB=5KUVhOkddvvyVYoA@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] arm64: dts: renesas: Add R8A78000 X5H DTs
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 24 Sept 2025 at 06:18, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Hai Pham <hai.pham.ud@renesas.com>
>
> Add initial DT support for R8A78000 (R-Car X5H) SoC.
>
> [Kuninori: tidyup for upstreaming]
>
> Signed-off-by: Hai Pham <hai.pham.ud@renesas.com>
> Signed-off-by: Vinh Nguyen <vinh.nguyen.xz@renesas.com>
> Signed-off-by: Minh Le <minh.le.aj@renesas.com>
> Signed-off-by: Huy Bui <huy.bui.wm@renesas.com>
> Signed-off-by: Khanh Le <khanh.le.xr@renesas.com>
> Signed-off-by: Phong Hoang <phong.hoang.wz@renesas.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

