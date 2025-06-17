Return-Path: <linux-renesas-soc+bounces-18455-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FFBADCE71
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 15:58:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0F5F188D885
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 13:58:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D06A92DBF44;
	Tue, 17 Jun 2025 13:57:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36792E7179;
	Tue, 17 Jun 2025 13:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750168654; cv=none; b=oiE51dmh1E+W8scrYXPecpw2+BIdj7Zn2Kysr+6QffF/wggwSqhzEPzZqruBfPYxrg6Fp9uJw0O19OSo1LLjVIY5Xjcd+yv/y4yYv86ZBC9/7jM+bwLUXkNansWDti3d8la5eyJVnlv4YZNFGJcsb/gYXVcSekSMO6G13hvvx64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750168654; c=relaxed/simple;
	bh=Ok+h/hslqpBIYtKWXl+Hk4lXs44vVszLjZf/RHvkAJg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hYtdTTzHVMMtPQGhXPk/eCo070Mf5wdRXgq+2+B+5IBkUCoSjF7ckTPCN8jLTtk8c+c1ZQOi5BI1FbPhPVnUxDQdC/Ft5mTm8v7IitvV1vN7MTiXKfoV/xg/+UwELIrbFTNWtpZPtahBzcShN4TZWlp+93nwzw7gxJZaldbxLxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5308b451df0so1609422e0c.2;
        Tue, 17 Jun 2025 06:57:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750168651; x=1750773451;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sUxmDYXurhyNXGwP8gjUs30r8dluW8wkF+4NNh3dZLc=;
        b=wfXnBsXyB7bI13WYUviYBT7jH4hALXDgzHK3jNwZP/3ebyYW91Xb1V1OzA9NC2nw2a
         urWRGty9LYbdsu785PY+F/l5TbY74FH65tlopfdVRj2a/9CNX55Vox4K9k45ET9vFcGv
         GxI9+oxWlRjVz0GKBcYFcbFSYRGZxK1XFcM80I3iqv8wgExDllYcr2kgmWdIqUZO+sX2
         E0asqGU3mx7M+KUshlzfHXutwHUWxkezhG7KJqfLtDLT/EGv5vZLCDBk51Q3Bdv/mQUI
         kkNwnuENeKIF8zgvUkMuqe/vyf7VtFMCoWM77cWhY/9PLQTK6Z9UffDVrieaVhdC8K06
         Y+xg==
X-Forwarded-Encrypted: i=1; AJvYcCUYHCVq2iosJxulyit7k91mxszG7qLM4QraDQ/m6v+8cjKcS272au6UCSDQ82bU6a834QvuaOT31YMbq+t4@vger.kernel.org, AJvYcCUy4VmUyQzwX2wFoL+tiCxOaEpXSDYbmuWI9THDxzWPwYRhL22mI683tmZq9/mWHBMer3ewSKj4SGr0gouS@vger.kernel.org, AJvYcCVpcxeRlzVHlVOoqE5teO6l8dcnN5vqWgPnegAwh4mfXeWFuLCtvyG5/atzqyBWNgevUvSY/DodHY5i@vger.kernel.org, AJvYcCWFko/0KEKqHlO9R9MdhAJ6OhFcjpj7iPm1efenvxkUsnH4YA/27ooGJDHRf6ghrymQTY8MN5VQcscLBBje4Wbx8Xw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ7W6Oai+/g1XVna3Rv7ZwEp8T+vMEGxGNKd9VvW8baqWfu9Uj
	84G/KIC/DmmEM0Y/kS4zms43uNOclv67Ry6jnDdy2bsftPG6+x1Q5+pqqgDqMB5k
X-Gm-Gg: ASbGnctecoTyZZhK9KhpYPvS66XnTygYtqvqQr4C19AMQowg+PW0cvN7vbf+vxInfIA
	OFjQFoVlm0V6am2HRplyhVwRPYI/fbt3h5JHwLiLYSFBR5Ot+UQQC1hGq9Yqf5ZeXf1okek4T7/
	4vFChO6iiN5LixtAEDUsBZ5iSOFIhTHLDWagxzfecGDo98W49iw/WGITEfbPsPZH2Zg8JtmWbyM
	yge+QbckI8IItUg1ZDR5PSQaBv3WzRHHr+MyJJKvifESs73PW/OwSRoj8b4yvUST4LR6mAfb1M/
	9WL/Zcj5rcHl7bu/wfiw13nhg+Fm9dZ/5hNaZPb//gH17jABwqVfFa4Mxcy6qsZ68EBgZViyOGw
	phDBn3+rmUZ7AO5tvNLrrDv34
X-Google-Smtp-Source: AGHT+IGQMyiDiFb/4WSyDLipPVZRf1Fo/2hZ1NzPqYdHvHfoqGURzZoDTIr+5omvsG1uNxVeI2QGWw==
X-Received: by 2002:a05:6122:8f8d:b0:531:2afc:463e with SMTP id 71dfb90a1353d-53149551fd7mr8600015e0c.5.1750168650981;
        Tue, 17 Jun 2025 06:57:30 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5314d938c48sm1208519e0c.39.2025.06.17.06.57.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 06:57:30 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-87f30519147so530346241.0;
        Tue, 17 Jun 2025 06:57:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU3myT3KVW8lCjGrPbF/51PreK801XF1dtTqJet6mdMMs//pmMEF6p9IrZ9XsubLt9gAMHTh3HDVlY3@vger.kernel.org, AJvYcCUqDQ8bHvAB2wsC3DjnEtkV20AATqlsiF6MvMn/hV5X3+NgL3ZDp2f/eilHWOeTpNY0J4ms1Z/sWmXVw4Xc@vger.kernel.org, AJvYcCUxBcJ85Due1rg0/vM7/nmJlKsSRuzDX5ITdX1N29hZdjOjuo/rBoAbHPNVA4dcOydYzlBNh2HnobneY0f8iplNJ0s=@vger.kernel.org, AJvYcCVft5cGRZgQ16t+P0hV4wRD0Ber4alTeYmjzPx+4kiojwEAVtbr7N/epn0lyxVuH9SxvjaJPvC0NlJK251a@vger.kernel.org
X-Received: by 2002:a05:6102:6a8c:b0:4e4:5ed0:19b2 with SMTP id
 ada2fe7eead31-4e7f61646ecmr10361664137.9.1750168650648; Tue, 17 Jun 2025
 06:57:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250617134504.126313-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250617134504.126313-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250617134504.126313-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Jun 2025 15:57:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWfsqYvdL16hrbWug3PhK1XrSunaWtduajRzViKBRPeCA@mail.gmail.com>
X-Gm-Features: Ac12FXx9rL6On1cpfgpw-cjWhbvyIu0jjh2MQYrNFm-hEQyv6wxGvVbnYEQpoQ4
Message-ID: <CAMuHMdWfsqYvdL16hrbWug3PhK1XrSunaWtduajRzViKBRPeCA@mail.gmail.com>
Subject: Re: [PATCH v12 7/7] arm64: defconfig: Enable Renesas RZ/T2H serial SCI
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Tue, 17 Jun 2025 at 15:45, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
>
> Selects RZ/T2H (aka r9a09g077) SCI (serial) specific code.
>
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks for your patch!

> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)

I don't expect GregKH to apply this patch (or better: I expect GregKH
to not apply this patch ;-) so IMO there is no point in including it
in this series.

Thierry's original version is still in my queue, together with the
DTS patches, waiting for the RSCI DT bindings to be accepted...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

