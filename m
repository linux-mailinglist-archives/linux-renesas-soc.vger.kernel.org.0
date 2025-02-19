Return-Path: <linux-renesas-soc+bounces-13364-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EC1A3C445
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Feb 2025 16:57:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9EED6169F90
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Feb 2025 15:55:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC9E91F8AE5;
	Wed, 19 Feb 2025 15:55:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD6F1D5175;
	Wed, 19 Feb 2025 15:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739980553; cv=none; b=FdkdOy02dG3kwK4PE2BUw8QsDqqER9U6WZtXm7OK6Ir2/U3EMPXthiCLmthcFEU3oZlECDGH7+LHqiVF608wk6ByZSTaQGKV5Ti8PKtC61JNCahjiw0WrjjWNJu8DWAp3YWEnSpPiulT4vEOm4Ij568IOdT9470wDOfsnIsprSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739980553; c=relaxed/simple;
	bh=FMl8McR5gVSEh1iCQPYVrF7y6NLwfVBbIwGGXAtwuMM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AKXU701749yeVUcRUsnbSKEOACV4sEJlCmLp1+4XXTGZ+KmCAt9YYgaCmQJvPV9r5WrCzn2R4jXF1XyualMgH+gbu1Ch/B97KkvZ6StMo4qqjyWXNev9ISIkEqeG0a5pRLx6admC77MgrfzrR78wR3Go7S57JjyVPLRoeZKfIJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-51eb18130f9so1884773e0c.3;
        Wed, 19 Feb 2025 07:55:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739980550; x=1740585350;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XMeSUyaFKEe07M67Z2g7MnE/H/QiZZs29gSTy3pgb8s=;
        b=oA2McKYpa82M6Wv8s5/sl46Y8IxQanJEdDHHrzatsFZyondnXXyA3aPfN7oIGZmIoc
         YiaWmlFQUf5pkn4SxISdOyUlRxVO/vfNDUObTAVK0OCbwJy8PI5bnIoFEzCAkC2RraKm
         t8iEHcOU64K6QV7EjqznP0qVJ/yOi+IdP0Mvpms1dexnSiXjp/q8LFQbnk94qNNYpj6v
         oEGYP+D99ezLlqoNAncXIvLD+2OaYps0uJxdrMcTctWMiUenGisdqXoFBCBfKRFjTely
         2c6aetVO4HBkhAl5A1Ypnh4gM6no6DQbif4SM1aL6XbSkui5OKhLMKsQ/5Xw/Zw/9XcN
         vClQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPtfPt36ZXSIloHlq1yDXHdhKr56uBob46K1cbROoMfD2103I0byJFRE67WzEki2Tu2BAPVHPq9oR4lKQD@vger.kernel.org, AJvYcCVEJ8Xj7SPzhj8IVPHdYYhOOrzErz5Ys9HqV63eGy1fOlWt14sogv++hu/uXUB5IwkQShdX2xl6eeYnxxkPHc+P5FQ=@vger.kernel.org, AJvYcCVFxZQvARGaK6ZnhsUu0osfBjF36uqqgwGNGdJ2L5VoZVI4urcwcae/k1znEXLkWqX5ny/mzipJMd5gexM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIbE/rnY44Ykt6DQQ+QgKM9XaW4oN5shbuIYNXuP159eevjPuu
	vWxsT1Bw77THZPFcFQe5XCw6NCNrkh/2cNZOZSRdn3+z1qL1+5uDna/w4LOl
X-Gm-Gg: ASbGncvwQTMi511ZeCW0akuHvSjF2iTyiQlfCo2Bg4tzcQjKCvxbQpIq9KQnOhfEQvG
	/5jUTBDhYm+UwHxr0vJaPWm4fEVQkJSbcviKmZ2IPP0HaKq0nv/FLbqCn/zGIrZTpK6TAe3qlX4
	/10TQaTeubpB8U/5zUXjKi3B2SJAVU04lOOkMjkemKhssM1vDqgegkEPL5cqUjoslGUewnaOuV1
	Rud3AA5w7OG9+hT6DJhoHwKNgsog6Iv4/k3h6ar1UIIyfWqw6OtF+mNTpHv2BLPB2get8NeFUVO
	5MvyTiXW43oIG9Qq+L0uclIJxq/JTNgOQ+ZeCh2Yu5Fwpyu4Rc1OWw==
X-Google-Smtp-Source: AGHT+IEjbFeB7HpY50W0X3dcaQO4G/me+IiCFNScxuaogAi5agOeuGj8M8Ips1NpYO3eA8Zff/Nu4A==
X-Received: by 2002:a05:6122:506:b0:520:3e1c:500f with SMTP id 71dfb90a1353d-5209dd5e813mr8390362e0c.8.1739980549680;
        Wed, 19 Feb 2025 07:55:49 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-520b18f7953sm1966888e0c.27.2025.02.19.07.55.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2025 07:55:49 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-8622c3be2f4so1794918241.1;
        Wed, 19 Feb 2025 07:55:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUsI3wAYYi4rQ9jRQy+zV9g/Dijfis5P4P0ueNvHB8RWUrS67axHv63YzT8D9VoAmGGPkagUnEBCan5bD8=@vger.kernel.org, AJvYcCWBx0Umox26JwhentyiEFPKoPmefi33t/86+e+P5yvdy8dbxUM1rGCSzW0sK2qwJSJjXugHkeXhRd6bXNFU@vger.kernel.org, AJvYcCXAdF1kOxzx3UlOS78Ldf8VagGkpl0w9ajMQn/mQ9wkMtU5W5QoeESdY+gnB6o1/DLG7uePIvumjyVXImO85iR4BHY=@vger.kernel.org
X-Received: by 2002:a05:6102:8013:b0:4bb:c490:7d6c with SMTP id
 ada2fe7eead31-4bd3fd4c181mr10990744137.9.1739980548843; Wed, 19 Feb 2025
 07:55:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250219142454.2761556-1-geert+renesas@glider.be> <289b6cba-b305-4de9-86a7-24520af16298@tuxon.dev>
In-Reply-To: <289b6cba-b305-4de9-86a7-24520af16298@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 19 Feb 2025 16:55:37 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWb1=Jqu3ADtNvPUZOzLZqPjxaBS6wZm6XJ=aYR8PU=pw@mail.gmail.com>
X-Gm-Features: AWEUYZmqpjsicDAFxpALuC1BsUDmDKkCRVtniedKsDsvPbTC5JWS7-w2GBanFTo
Message-ID: <CAMuHMdWb1=Jqu3ADtNvPUZOzLZqPjxaBS6wZm6XJ=aYR8PU=pw@mail.gmail.com>
Subject: Re: [PATCH] serial: sh-sci: Save and restore SCDL and SCCKS
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-serial@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,

On Wed, 19 Feb 2025 at 16:04, Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
> On 19.02.2025 16:24, Geert Uytterhoeven wrote:
> > On (H)SCIF with a Baud Rate Generator for External Clock (BRG), there
> > are multiple ways to configure the requested serial speed.  If firmware
> > uses a different method than Linux, and if any debug info is printed
> > after the Bit Rate Register (SCBRR) is restored, but before termios is
> > reconfigured (which configures the alternative method), the system may
> > lock-up during resume.
> >
> > Fix this by saving and restoring the contents of the Frequency Division
> > (DL) and Clock Select (CKS) registers as well.
>
> Keeping the thinks RZ/G3S focused (as proposed in the first versions of
> this support), I missed there might be other registers on other IP variants.

Indeed. I forgot to mention I didn't check other registers...

> Reviewing the full list of registers from [1], maybe the HSSRR and
> SCPCR should be saved/restored as well?

Agreed. Late restoring these is probably never fatal, though.

> [1]
> https://elixir.bootlin.com/linux/v6.13.3/source/drivers/tty/serial/sh-sci.h#L14
>
> >
> > Fixes: 22a6984c5b5df8ea ("serial: sh-sci: Update the suspend/resume support")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> For this patch:
> Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

