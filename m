Return-Path: <linux-renesas-soc+bounces-3329-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCF986B78E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Feb 2024 19:46:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E4C71F29D20
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Feb 2024 18:46:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89BEB71ED1;
	Wed, 28 Feb 2024 18:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U00IGy2k"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DA871EB0;
	Wed, 28 Feb 2024 18:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709145973; cv=none; b=oah8IAbiWOT9TwLW1oNkDR9wgN+RmAhdhUPv/xZEWI7zeI0sVc1A+vC12E2jCJ5CoQ2zPmVxmJmPEehLLC9q1ZoXj2SU2dfOdNuSyNlJeyhuPNyVz61C8FIrGoucvuSwcbit5Ph+JTYV2TZDwX5bhuD87FWxSjnmOgtMCLUdRtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709145973; c=relaxed/simple;
	bh=x7tt3/s727KoBQU/agWO8hfYEwErmqiSgx2xqcr8VPs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IhJVIg2iD3l8NXwtv0dta6DPjxYoMUlUfj+vnXrVCka4tjufyqOaaXoYDfvFWDmcH4qKeGcRG41eRjW/pR81U3r35rKSK0NBHtsx0zV/QoXLulxCMMhrBgOureXyy8FGSbkIln4u7nQZyiqbJ6J+5A+V46J6SZ5lsXsU0NgNxww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U00IGy2k; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-4caabc3f941so643711e0c.1;
        Wed, 28 Feb 2024 10:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709145971; x=1709750771; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eYaV6Mjv8zlhpOY+TPlEdZUUI8cZoxYWuTXPnkanius=;
        b=U00IGy2kRJf1f9wQECXGd1iHlW7QPk0TdsQ541AHKuvKpk4ZJ5sOgrfVCNrLrvndQT
         N7qPyqxmtbvtKxDFvB669sfADJFndpFqEuUUWsQLfYWhbclA2PJZ4dkqAQrrM+ULVBSt
         uZ6DvHeBN0U8BvoX3Fp2FTXYf3ZH7PNohxVCGqbxmyweyHa4h2dbppKdZeFOE+l4NOtp
         CvktgfnRszG5lddOcIg7dR5m9ncJ5PcUGjbEtUrrNTUzdLoz/Y8LuUw9zQB8W2P0eRYu
         vs8spCA1JSpP2j/1gqT/wquTZWVUFQPWe/sMBhBFYEwPjvH8l8zjvJG7quyFNQltN7fa
         IbvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709145971; x=1709750771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eYaV6Mjv8zlhpOY+TPlEdZUUI8cZoxYWuTXPnkanius=;
        b=LThTKHyDz8axMNN0S9RdbzTniuOJqVOfNSboYQDCM45PdkHe4HvlNZedNOBFfZss+M
         GWnUXvcxIiuEu+5KtkN2nzsvlBUKZ11QYNUGJu0Earp7/U686sVzuFofkTuk/GToR8Iz
         5bi1e1ge7RHwwL+R2qBOG2F7XXVsBMrkhJ6bL4tw0qXZwQLCCFo5PqUYlM2LIHizJQ6s
         nTELMfhG0h52Q0HSFeu4ZZ4wBDRIcUQOTW3JGb2OrmlwocfJHumBEOPgzjdlNYgV3rQ5
         TwneSQzEORRUaNWjHTlr7oUBwHLbLTg4EZKdD3YU2FYYQXEsGPMshwHS0yawve0RRywU
         rPyw==
X-Forwarded-Encrypted: i=1; AJvYcCUwf9YVolWKk4UmAkjNvFwe53qWm4tmnbRY/wIuDoQC+5ly2RmpAiUXfFJo4d8FKOGcuLHQWSlouMkgCMJfbTlKJjcFA4GA1QTo58AoXDUylpk7/O+PZe5ZRr+d2+0TFyHuqHXhQCpJoCII/jLr/BR5IbhhDfhn6EFGHhvsIaJfZ3d+ivovQkw9
X-Gm-Message-State: AOJu0Yz0BowiWSigZahU/t1xQfQZJ9n8NvnKhObeL551Ep0pQY95cMXG
	mFte3vGzNSHLBiFAEc0NNCcer3ajQDNNGlhm+DNty1k1DxczdchzjzLGRAzp3zRvi4592vUZ1BY
	cGIxxrhyVi44yQg30vvgbvLDl1UQI+XSh8IM=
X-Google-Smtp-Source: AGHT+IESCqYfUAhHoyWAQ64/nWMDsinn5AOZapdDh6ChpSpgLKF9xtnimonYKk1Vr6xYewb4cFNciwwHtzKB7VH8HJg=
X-Received: by 2002:a05:6122:3901:b0:4d3:3334:f2fe with SMTP id
 ep1-20020a056122390100b004d33334f2femr330692vkb.1.1709145970814; Wed, 28 Feb
 2024 10:46:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ffcdcd479c76b92f67481836a33ec86e97f85634.1708944903.git.geert+renesas@glider.be>
In-Reply-To: <ffcdcd479c76b92f67481836a33ec86e97f85634.1708944903.git.geert+renesas@glider.be>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 28 Feb 2024 18:45:44 +0000
Message-ID: <CA+V-a8sKCz-ax7WPGGpjGQPhCjGYRgBMoZuYgN33H1YVJZ7sOg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: clock: r9a07g043-cpg: Annotate RZ/G2UL-only
 core clocks
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 26, 2024 at 11:08=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> The M2 (CRU main clock), M3 (LCDC Video Clock), and AT (Cortex-A55 Debug
> clock) core clocks are only present on RZ/G2UL, not on RZ/Five.
>
> Annotate this in the comments, like is already done for module clocks
> and resets.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> To be queued in renesas-clk for v6.10.
>
>  include/dt-bindings/clock/r9a07g043-cpg.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/include/dt-bindings/clock/r9a07g043-cpg.h b/include/dt-bindi=
ngs/clock/r9a07g043-cpg.h
> index 77cde8effdc73c6f..a64139fec81520bf 100644
> --- a/include/dt-bindings/clock/r9a07g043-cpg.h
> +++ b/include/dt-bindings/clock/r9a07g043-cpg.h
> @@ -16,15 +16,15 @@
>  #define R9A07G043_CLK_SD0              5
>  #define R9A07G043_CLK_SD1              6
>  #define R9A07G043_CLK_M0               7
> -#define R9A07G043_CLK_M2               8
> -#define R9A07G043_CLK_M3               9
> +#define R9A07G043_CLK_M2               8       /* RZ/G2UL Only */
> +#define R9A07G043_CLK_M3               9       /* RZ/G2UL Only */
>  #define R9A07G043_CLK_HP               10
>  #define R9A07G043_CLK_TSU              11
>  #define R9A07G043_CLK_ZT               12
>  #define R9A07G043_CLK_P0               13
>  #define R9A07G043_CLK_P1               14
>  #define R9A07G043_CLK_P2               15
> -#define R9A07G043_CLK_AT               16
> +#define R9A07G043_CLK_AT               16      /* RZ/G2UL Only */
>  #define R9A07G043_OSCCLK               17
>  #define R9A07G043_CLK_P0_DIV2          18
>
> --
> 2.34.1
>
>

