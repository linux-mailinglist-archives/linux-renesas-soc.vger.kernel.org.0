Return-Path: <linux-renesas-soc+bounces-26067-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D8EEACD9898
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 15:01:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E060430115E1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 13:59:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 063382D4806;
	Tue, 23 Dec 2025 13:59:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1524C2E7F0A
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 13:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766498392; cv=none; b=lxsOshDK3Ld3w68aS4d7EW/bxw1tBlP4n70S5O3U+03gABXlbiIsWGhKjujWnmckx/TvMPLjhzhHSkQnsdJHWAMuaqYYySCg6aNiyoUgGx5Y1DTL6zQHckFMcn2/OljiKZJXtZW18G7XEwl5ENCHENTARSTBdZxTajGuVYIJC20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766498392; c=relaxed/simple;
	bh=U4SfYmuMnXUUFIkmYEIYImOxbbZck0BsbU1+cFVeHuo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fJHmORRz5jBFfnLWO9+gDB0DDHO+dg35yYbkJi1Ex7z/l9YaMWxd23wNFY151ZuNi8Fgq+c/CiJL55vHwzcVSNNHryUaRVoJvqZ4an8s/xLrHJDndSUbhM10QZr9nGm59OVfGXAWL6AOdKBO90BO1MFSIW4V4soR+ulJotxfu4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-594330147efso6076691e87.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 05:59:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766498384; x=1767103184;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FRN28FWPMAx4S3xSEvODZwJug4RA84MF55jfYOksySo=;
        b=ByXBhyA4nOnBFcdhBBzfefdKQ+2HEmwuztl1gtxeZktRVVxUTmtGyMyuriYSspc89b
         khSUC0J3cDk8OkoNgMHrbM/OUdnYnzsDfHit6AQiVSPFywOwZ7dewG/89vOr/ZTffpKy
         hT22IR2iNgNkvPRhTDvKuZfylFB493EJ1AoEcZhQrHV7S3mwpid2hxhk75nXXZvujHuE
         Tsa+eMXr0iz6POyPb60ZvpGR7N8Gy/Mtoq9tdaWeYEVM3wgK4WI2FpP753dfWXLYSSuh
         REldwvxNrCUsuSHSWrUeIUZG+0nvujb/66uLIFPVhXOxSXbE2ifsUIpa98YgO/LFvFG+
         RMWw==
X-Forwarded-Encrypted: i=1; AJvYcCVCKrAJy2+N7cOY/kxBzewDHhDEehFl62BRpo8c+tpyCsNvdC7hbZSWFmYgGWn9Pi22BQT/Hlw14rYYP5uXJu5dbg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYCqw9RnjFWeSjPcGiUXy6zN+u72v/YMok/5NOOejXVBut/aQE
	qHsJFtlqckg6elnwCEtYvgLsSmoyZ3n1n8kLbBn2prBHTsbNW7KjYEnZ2C+ca3fT9e8=
X-Gm-Gg: AY/fxX4OH8Pk/nccikyA2Jz9M3HH3quHd61ad2NUHlSrxAqEd+Gnjp7NVNdypmu4fCa
	KJSYTfCMZodyiWW8dSoL/RtC3vixvTc3pbXG9LPrZO39u0orfDJ/LUDIlIjlmehPkoTWKhVPkzt
	oTXOnGydxctBxWbvBDkLbfM2YOTH9YYiT6avheGM2LY974I+cUwja55aOXisS04MiBcEa3G7UHl
	FGSO9IakkUWja5ptzTOQ87iU7Qf3svjZswTL2F11suxw+y4Im4kZJbNWXvc/73R4wXb9vhX0IEd
	exkw0wy/J3xmPzRHaxddLQLehDyJDana2StIiBWP2igTmGhkdK1UxzyJ0rFAufk9pGH5TcwPE56
	urbKYHRImQp/LrLenUIUvaRGmYPSJAVCHY3gALZCIUjU+udhvvEayGEM7sY4hB7zpO/zeFUCdWB
	WlFTDAxsH4As3v1dWGCqQbTZrfCd3bSqi5dDjPSAQOMpUkLg9kYpk1
X-Google-Smtp-Source: AGHT+IEDLEdWdLwnkdAzv4VW0uuKHnmiWD2yhGCb2TfUEu0vUSXJo5n7xaBFoOY+1Iltj9DOZVatFQ==
X-Received: by 2002:a05:6512:3d03:b0:594:2f25:d488 with SMTP id 2adb3069b0e04-59a17d64fafmr5174359e87.21.1766498384138;
        Tue, 23 Dec 2025 05:59:44 -0800 (PST)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com. [209.85.208.177])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18618d9bsm4142248e87.60.2025.12.23.05.59.43
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 05:59:43 -0800 (PST)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-37fd6e91990so38003061fa.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 05:59:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWwWaZjKxIPnKQbFpgvgUQhqTRsQOQybRJL7asjG8ThaELqyJ3I45DesSF2QhYT+M9PJz5OpIDtFuflrcxbNARKpw==@vger.kernel.org
X-Received: by 2002:a05:6402:3596:b0:64d:2889:cf42 with SMTP id
 4fb4d7f45d1cf-64d2889d183mr8234029a12.2.1766497977682; Tue, 23 Dec 2025
 05:52:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251201124911.572395-1-cosmin-gabriel.tanislav.xa@renesas.com> <20251201124911.572395-7-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20251201124911.572395-7-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 23 Dec 2025 14:52:42 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXwi-0DcCRgsGat0tzBu-UOpd6Vws8Dny5zDyWwTuJ+3Q@mail.gmail.com>
X-Gm-Features: AQt7F2oADPw68F4-oj_Q3CgG6voCKpe7dhfvSuflJPl-MkOYCou6cY57D35QDac
Message-ID: <CAMuHMdXwi-0DcCRgsGat0tzBu-UOpd6Vws8Dny5zDyWwTuJ+3Q@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] arm64: dts: renesas: r9a09g087: add DMAC support
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Johan Hovold <johan@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 1 Dec 2025 at 13:50, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> The Renesas RZ/N2H (R9A09G087) SoC has three instances of the DMAC IP.
>
> Add support for them.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

