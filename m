Return-Path: <linux-renesas-soc+bounces-24913-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 80753C78AF7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 12:10:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 5A3372D65E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 11:10:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEC8625393B;
	Fri, 21 Nov 2025 11:10:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8C828468D
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 11:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763723454; cv=none; b=idgCrTh7uHjAH625ed3iplRfxZf3lq1La4WJzjdqxt6qRwV8FESSnm8v+J7TuWwRGsJw4PsdohVPkETChXVfXHeNAvmgbdtFGMzeZA57chw3wFja7ulNytJQrZV18T5Go9f1D0dd/nlHylpqQe+mB71VbM0HF1Mo6wS1QJEkoZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763723454; c=relaxed/simple;
	bh=aA0dgpQjZapgdawUH97P5AeKVI3is8ojmmfq5AcnB30=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G+kmMrv5RPe7KebqNxcvEeZP+kLyxn0Y3p1Z5eHMiPl0CTjD7V95H/1ACdLqodMbeJxZW1JmbTujSU6QpTN6PqdiNc83xwFTkuTM0Z5EoKcw2MntdUOzx7nuTsn8wsGUrg/XUzi9upEH016RYBfXtOGHBjfNvlyzi3uDXZIZh4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5dbddd71c46so730465137.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 03:10:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763723452; x=1764328252;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+77DyjWht0xTAUtMByV+BjBRLSnj3uwYMqKi4c8r7gw=;
        b=BfX4ZJAPCi6XsFpEywu6fDibVlOc/ovhqWM3dx0IO/HqLMIDbfA9uozprEeOe4MCTS
         emUBhOLe5QgCD4uhk1q92W0/RpS8qgf/06H+Bw2+KDpTRJVi2RKPlpu3mnQqOz9VeB3j
         7Ear+dnvjMDDJTd5u+Xup9RbaTyqKl0FmZhkWnYiaznYu83ELdgWPYqRju7bZhMKQQ+G
         oakU9KX3Z2/A2153N+pvONKKT/DfcIyI9kbJyn5eMMnWiUvXKV8H120HekQWFJ7UJK1L
         9fV3fiZ7hRFGnjg6Z3GqYweSbiL/gAbaKK82JMkRrhYqg41HpExyfNj2saXx6AeMI4ck
         /Q6w==
X-Forwarded-Encrypted: i=1; AJvYcCUr163emOnojjttFe2QDs1CvCMUrVhpjkUwxceuGsyzLeEDRR7YirQ2fMwXhXYOBdzK/FxcN055BfokYfEApDhujQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx680keumD3XLRkzo8yZPJaSNThYEqnNtyZJk1qPAWqVVFEmTaq
	FWrDcPVn7GPE7e1RKXaBODpiM4rgrAxpyvNg+POfTxTMjeEqtjS4XRImHQRea4Lu
X-Gm-Gg: ASbGnctF9jPUhZeE33p51e+Ke1OQ2ZjDKKrTG5DPBEAR5/yfR3oC2xw1O1BR6djKtaw
	S0P7aucUJ3BBtPf+2uVqg5QSZhsCfPIMiHuNwZH9v1SvZlWvdLDJs6hC2hdtwRhwArBSId2gckO
	yYYgykG2Um2YiySGxpkI8u2opRy1JrBge0Opl7ee3uni9/mddUHdAdFhUCh7ncamftwHEy6eLts
	uk/53ow759gM3xst0F8+VXcd1+XZVoDsSBJnLHP/6nKZTXLv5ZnjzX9PhJMlA4Y+VnUZY5XyaxF
	XY+G9mNHQXwsIDlbBrJj1ma/zlCsZ3LVQVXbvz9B1HcWiDU//9XgVdvueXoR1QGDcwxkvuwcF9c
	072WqGH0T99Znl5lRicdc5grXqiZjLEcjZaP3hymYTnYGFm0oRzcUvmsV4BGL8Gy45am6gC6r9J
	QikxucN0MRV1AASz1OiGqtUwQ8BTNwKYwoUbOg9F0WqLzTAAYF
X-Google-Smtp-Source: AGHT+IGwwLbAw8W1/hQbuk4Hp90XRU3HQXrYLP2nBrFHrufjZPzYSIqg62+3FA3nIQepvXl+iSV7+g==
X-Received: by 2002:a05:6102:374a:b0:5dd:b5a2:b590 with SMTP id ada2fe7eead31-5e1de1ed3d5mr379385137.16.1763723451794;
        Fri, 21 Nov 2025 03:10:51 -0800 (PST)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5e1bd8eb2d0sm1982412137.2.2025.11.21.03.10.50
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 03:10:51 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-937262a397eso550342241.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 03:10:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWkrXgsrtWqjEyZ7uuiJmcyEou8UnrPaI0TWmeBcjBy+9q/Vzl8+xXNz3BvfSyewSNE4kCNyZg5J+mpj9pT/jArqg==@vger.kernel.org
X-Received: by 2002:a05:6102:5a8d:b0:5db:e851:938e with SMTP id
 ada2fe7eead31-5e1de1ed4b6mr369202137.10.1763723450426; Fri, 21 Nov 2025
 03:10:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251010-kakip_dts-v1-0-64f798ad43c9@ideasonboard.com> <20251010-kakip_dts-v1-2-64f798ad43c9@ideasonboard.com>
In-Reply-To: <20251010-kakip_dts-v1-2-64f798ad43c9@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 21 Nov 2025 12:10:39 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWrMGGHt3g_eF7q+7WCuDg4DK7nLObszKADD2bxmMJhMw@mail.gmail.com>
X-Gm-Features: AWmQ_bkvxrhLH7ZLxZokI5MbBD5f29KhuLuCg5iCnBrvGiUJVfgVzugvmE2mXxU
Message-ID: <CAMuHMdWrMGGHt3g_eF7q+7WCuDg4DK7nLObszKADD2bxmMJhMw@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r9a09g057h48-kakip: Add ISP and
 IVC nodes
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Daniel,

Thanks for your patch!

On Fri, 10 Oct 2025 at 12:51, Daniel Scally <dan.scally@ideasonboard.com> wrote:
> Add nodes to devicetree enabling the ISP and IVC that are found on

You are not really adding nodes.

    "Enable the device nodes for the ISP and IVC..."?

> the RZ/V2H(P) SoC.
>
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> --- a/arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dts
> @@ -50,6 +50,14 @@ vqmmc_sdhi0: regulator-vccq-sdhi0 {
>         };
>  };
>
> +&ivc {
> +       status = "okay";
> +};
> +
> +&isp {

Please preserve sort order (alphabetical).

> +       status = "okay";
> +};
> +
>  &ostm0 {
>         status = "okay";
>  };
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

