Return-Path: <linux-renesas-soc+bounces-26027-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BE12BCD87C2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 09:49:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 344CD30019F3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 08:49:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E47A2E8B74;
	Tue, 23 Dec 2025 08:49:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D54921FF48
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 08:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766479782; cv=none; b=RGYAhoaNvxXXJtv+PBe8mNK0PYkyVZMNCFE+Pucg6m5CEJbet+fcrfnF3f/Ohd2pXDE9FJzoI5Cy+Dg/o7wlXOymB1R1N9fPoFOg6NqNXhvC8JNODvd5EYWiS83noMmFdSN/LcPMrLDD4qpO60PCOOLgiqbW1InjHH+bY3rrjcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766479782; c=relaxed/simple;
	bh=s+kmYwgNL6OctNt2MMcD157g/Z2oIhSUMl95Uz9ZpL0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F1+PfakiQ8dVZ+l2eiasU4U1lfQRS+FoObZ8UvqUobKnHY2S5FgxYQLTnsjPWzRBO6T2n/GTUsh3qe3NkpJKKwg8LtLsc8vGWCuswVeb/S1fTJcKE0kMakiEfkwAXH+pPO1YUtGCXTUXFcjl/xdTvx3iSxMoE7ESQcktUgglZHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-5e55bd6f5bbso3252533137.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 00:49:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766479779; x=1767084579;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aLyOBznGkxSR7Tg42fsvJfxJ85vAIxzqX0Myddf1pK4=;
        b=ZVl5Cm7ipEFQ+IivKnhnN9YIDa8LRQyg3PmFPdccm5l0x011GkogyYKBI+Gf9Af87K
         ae0ANIGNEtfJyBJJGfbpv7dfi7Zq+SBHQdUl9QrLDyLFmqD6H+Z9KZEeZjpXq4/5miI8
         vrtPf2W3SXq2IC3eLWNI42VSZk1cB+Su2r3gBEeyepgYIxLlOvxswtZCPhmaACmd5zbu
         o3p9Sx19ow/+lS1JHsP8NtbID57pQhQgVOJv+RkHvaN2Ti5YNkVQIer19/5f3HQDKlhD
         7d7lmuI1KKqozDgxTTnAPq2pAj6nmLHVPS15BNeMvOhnc6cf1KimqaFt2Zxt2pUp9cGj
         6npg==
X-Forwarded-Encrypted: i=1; AJvYcCXPlbgzfVmvVDAst8hBDpwE50Va0831K7ajYcM9clLisJ93Dg5h/KHn+QED72YlhgRSqR3leSaWSb8meu8e5Z3D2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNokC0oZZq3pH6JZCiHy2JyDxmGu8/RfifBlges00Udf+SfHEf
	I0wMHPuUK4+E2ZaDxTpgaDhWJPnVMRowddbHUVipF/zpytw1Pkn1B8y5sUAJvcY2
X-Gm-Gg: AY/fxX5P+EDPJN9uj3DL2jRmPMYWOF5VmZdD2UbG88eigh/RnCqsGELE2D8pekyLziz
	y7sdrK6uOS5ER3eeFSzdDKIo7BIqMRKYIoKTWoLQYXq3eDTDgDX9T36uGnf/wc28oHIwW5py9al
	zad4EEolxhXDamZdK9LPU6LSUWJbeaD89xDEN1dDTqxDqjJWwLdHxShyLXPTelGuj7oocNKXuZZ
	tZCu0+qyGVK6K9egGmq+dOF+OfLSPbys0+o+0+/CQHZk9nWpyOyW1RvJKCUX1UKTcT0PdlKPP8t
	PAoXISY7ZvP8jf6qzqJe/JZgpXPxNAVLawCkiSOzb2lJ7HZ5Gjh1qAVuM2/U/+e2ktFzDl4Ac8h
	eff1LeGeg6NER2GWNq4dvYy1jTQ2AydXRwJyK2BVrFE7MBSYC9ycFWbq/rcKGkkKzHS2TpuLihu
	zGlShS783nyHJj66MPNspBPaGjIG8CWwlQK9J/sC3iJXI6CPADFvAvgyhddAE=
X-Google-Smtp-Source: AGHT+IGJLAfxkiRt0+5wLqpGtNsigZwpRHiXJGvLoa5+F8BizwGi7BgVIYg2Yld4fU+j4CoZBc0+jA==
X-Received: by 2002:a05:6102:2c0e:b0:5db:d6dd:81c6 with SMTP id ada2fe7eead31-5eb1a67dabcmr4697443137.18.1766479779056;
        Tue, 23 Dec 2025 00:49:39 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5eb1aa4f32dsm4241397137.3.2025.12.23.00.49.38
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 00:49:38 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-941063da73eso3085403241.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 00:49:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVAd4cvlKDDEZk6hP1uwafChe4BDAlvRVRFJO86jc+mjmoV+Md3gd+fveNeAtKtLjm0BIn0vRTb13vZjGiSedClQQ==@vger.kernel.org
X-Received: by 2002:a05:6102:2b8c:b0:5df:ae62:fc25 with SMTP id
 ada2fe7eead31-5eb1a617d68mr4392367137.8.1766479778295; Tue, 23 Dec 2025
 00:49:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251129185203.380002-1-biju.das.jz@bp.renesas.com> <20251129185203.380002-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20251129185203.380002-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 23 Dec 2025 09:49:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW5vhJTCjg6AtxDk3Okgzj_b5=8RBSNAR4at389oh-O_A@mail.gmail.com>
X-Gm-Features: AQt7F2rfbZMnGQeE-0yZRBi-ZG9yvNXdAG7YgQRv4iDUsC2iI5PptrCYLCh8KHE
Message-ID: <CAMuHMdW5vhJTCjg6AtxDk3Okgzj_b5=8RBSNAR4at389oh-O_A@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] arm64: dts: renesas: r9a09g047: Add RSCI nodes
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, 29 Nov 2025 at 19:52, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add RSCI nodes to RZ/G3E ("R9A09G047") SoC DTSI.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Updated the compatible from r9a09g047-rscif->r9a09g047-rsci.
>  * Renamed clk from bus->pclk
>  * Rearranged tclk{4,16,64} clks.
>  * Added missing irqs aed and bfd.
>  * Used hexadecimal numbers for module clocks and resets, for
>    easier matching with the documentation.
> ---
>  arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 220 +++++++++++++++++++++
>  1 file changed, 220 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> index d1bf16c6ff6b..824da0b7b85a 100644
> --- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> @@ -823,6 +823,226 @@ i2c8: i2c@11c01000 {
>                         status = "disabled";
>                 };
>
> +               rsci0: serial@12800c00 {

Moving below can@12440000 while applying to preserve sort order.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

