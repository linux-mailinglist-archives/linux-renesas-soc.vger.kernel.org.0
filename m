Return-Path: <linux-renesas-soc+bounces-22716-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E5DBBE82E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Oct 2025 17:40:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA7D13B3603
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Oct 2025 15:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 619A92D7802;
	Mon,  6 Oct 2025 15:39:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC242D8385
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Oct 2025 15:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759765196; cv=none; b=KQCZISbBbXEW9D3NDIxgtXaxpAw3w2E2x9UqM6B9SAig3m22woqpzBc5Esq+VMONEmxA7k3sXQuUznTfjYJ2qAF4HdOjGXx7MnB6+oXlPlAn+DspMVtR5+SUUAT3nP9a5gdINRfZYBVt52sVtwQ9DGJfNDgNOp5uy86gMvf4/SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759765196; c=relaxed/simple;
	bh=ZGZ6W41F5hyMN9Lz9qV4NeaICUFsf/a81eKCiYeiUgo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CHAXUioxpxYNS+1OgR10EOeGQH+B2w8uQBhRvNRhP40NQ5UJaZVNXUtbXMByhacV58d/vT/GF57TLZFnPFlt9YCpxGF4lsIk/9N63jy92/EZrVsLYFG//iMLyVUaBiCi2x1u7aWrIbLj6pWvGAuwG5OYResjYiASZ10eeJ/vkaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-54a8f6a2d80so1831483e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Oct 2025 08:39:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759765193; x=1760369993;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nhgYL7g+fScggMC2jAjhtmBZb7F0ZaKL6l0wWE2+7hc=;
        b=nLoDOTywH9uCAtf7yQvLtsddTbDOS6nZbzyWbyjGzddE65ctj37JB4shJ+skWvSTpl
         xezXqNvuTO8co4oQs1S7kjVjjrTq+YjT/FYj/sFw61626g3AZ/FbwNhaDa1iblpc9F7C
         qCQI51uxigSC3hUq8+wGE6PlRtmqjoTsfrpt3b1WFqfTP+E7nvNhnezIWAoQ94yU6aO3
         6MALVCF8aKKxI9uyTOgRR6y/GdJ/6qu9VvWm57JI6TfLnYEsy9YrNoiANhALaY6CaKZy
         oVcu1vKYPY7rYcBM8lQqroQy5oLOSfjdqlEHdgLLlNVYpC2SqPmDzVkb9/B5d1HfNOTb
         2UgA==
X-Gm-Message-State: AOJu0Yzs3jCql1Jd0o0ONFw6XHazYx/G/Hc5C2gVc897JMLLzp7J0Uo0
	rJV0oNfvnZfXULta40vaUapxG9ABEb6OmOrNKp542B9V3OgCDUziLvAmsRiSvyIL
X-Gm-Gg: ASbGnctguihxJ7RZb4/BshhGmaBg/UdcPfxH9PVKB71MXEnVg9bsKusCaqfiB0CCDxn
	7NgyZtVj6POmI4GeSYZKNi/xo9w0zVB+vfOBwXjnmfXIfwDN3Ni+ae/sb1yPYAA0qxzYNavnVoE
	RPLdB7GotrGtfpT728a8A/YWa8tieMF81L0h7QlYiraZWHFrG17oi6pOPInMOTRJMLFCMxvYTzQ
	FZoDJJfUXTs02HG5PhyQ+7ZuUcc+O5TiOZXj5kFmiQSMD49cMs1JbLjXbnGtkXNTwuKmp1Ln31C
	gqghoPdgeZuHPoAg7em7xnvg/cLovo1pan39JDOU2vwHtGcJuj8szUJomTltrBfMCGGtKjk2Yxm
	NuwKduyEL3gzL6oKQopWE9Fn37W+zPtlS/DMh2qraBAlYJAUJ3aP3yTHh4562agn0kp6D2JBcDV
	wxNqzRS0Bl
X-Google-Smtp-Source: AGHT+IHLi/2Yg5l0HlYVKTDkKfNfmO6m8FGz924JEk4p2HZhjXo+gdPPNGOLbFEu8+ljbXs15Yjh0g==
X-Received: by 2002:a05:6122:3d0a:b0:544:87b0:d1d1 with SMTP id 71dfb90a1353d-5524e903645mr3938461e0c.6.1759765193214;
        Mon, 06 Oct 2025 08:39:53 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5523ce6430asm3117853e0c.7.2025.10.06.08.39.52
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 08:39:52 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-5d4018cb45fso2218288137.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Oct 2025 08:39:52 -0700 (PDT)
X-Received: by 2002:a05:6102:38c9:b0:524:bee7:aea7 with SMTP id
 ada2fe7eead31-5d41d134539mr4203099137.35.1759765192596; Mon, 06 Oct 2025
 08:39:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251006082520.10570-11-wsa+renesas@sang-engineering.com> <20251006082520.10570-18-wsa+renesas@sang-engineering.com>
In-Reply-To: <20251006082520.10570-18-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Oct 2025 17:39:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWKGb_9eigL7CK2F9S1cv+=FAoDTmz5QLS5Q=UHu+ck4A@mail.gmail.com>
X-Gm-Features: AS18NWCJPjSlTYzePnAykrSJHnTf7JO2kF6RhnncH46J4cq1zhMSr-LjoHgPql0
Message-ID: <CAMuHMdWKGb_9eigL7CK2F9S1cv+=FAoDTmz5QLS5Q=UHu+ck4A@mail.gmail.com>
Subject: Re: [PATCH 7/9] arm64: dts: renesas: v4h: mark SWDT as reserved
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Mon, 6 Oct 2025 at 10:29, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> This watchdog can't be used with Linux because the firmware needs it on
> V4H boards. Sadly, it doesn't mark the node as reserved, so this is
> added manually here.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi
> @@ -17,3 +17,8 @@ &rwdt {
>         timeout-sec = <60>;
>         status = "okay";
>  };
> +
> +/* Firmware should reserve it but sadly doesn't */
> +&swdt {
> +       status = "reserved";
> +};

This hunk should be applied to white-hawk-cpu-common.dtsi instead.
I will fix that while applying.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

