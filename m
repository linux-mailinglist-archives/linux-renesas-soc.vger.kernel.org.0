Return-Path: <linux-renesas-soc+bounces-11959-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE38A05C14
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jan 2025 13:51:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DB3787A2A89
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jan 2025 12:51:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C9D61FA279;
	Wed,  8 Jan 2025 12:50:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540461FA166;
	Wed,  8 Jan 2025 12:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736340650; cv=none; b=MDaGhnnaQWokAVEsyhG+Ysbmzm2+2+kuMBPgcKhQ0gHanopSxzUmOaz6nXrc/Dczo6Fnl0bCevbd38cD1Wpgc9qgK51ylusZAsPSRegreqzLUOFMYW+ojxDKR8knXoWQionUO2uJbubZj73oFUkrP6UgjgefxKEKIKxk6to/VXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736340650; c=relaxed/simple;
	bh=MUJn7dgIN4qxQ2b8yGGIjtxj/qPGRciGtNVEeBtG72A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=moFEUbaPsttHN04e2VWGxRy5rgF6MbLjyLigWYGmuCAKDwDd7DdDPssxnQvZ9gULF/QirXQ80iuUy9IynpYgB6TQRHqXfF8SNYq73AJV+7HDxgsuw9EeiL9KgCwj4eXKQ9l7aUQJQcwbRCqIz+hb/KvKfDzpF6zXt5RZRdoW44Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-4affbc4dc74so8746697137.0;
        Wed, 08 Jan 2025 04:50:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736340646; x=1736945446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q4NAkYOwXTO9Vbz5ywBO5Myw4esqfkb6xj3656tlG2o=;
        b=bjP1obGXqw/WMEbT4K18NGpeTBE4LIsl5VmvoDuUwj29jVqJh8/qxRnvQJridvXtDd
         laUFFXh15bTQ8hdsBtJQ/xm7deYXBcos4nVMElzs2M5N8LFVgMec73AYtrlR9gtesPI5
         uy4VY61IIF3U5c4iqJ9qx8aiL3n9gnX8A+lkMPPvW5sUfR7Ufc2BRCY2uDglf9hElSTd
         jn+N9KcgB8s2hrUHVyOiEiggvi4OvStN1pPao8IUPF6CcNB4RUdIoQFI1iuyTyOTr2QK
         fCWzCuR4GOqawoKOGsYR5SBs5sbtTJeOU9AB1TYpriYwEMTiBTVf1dB4MQUWAdPk3leg
         gXbg==
X-Forwarded-Encrypted: i=1; AJvYcCUaDAIR/StbSoXn0xvbJE1VFAE0LZr0f42gzf8Fvy9JVPjnhaDRP9NtAD7w/5MvmRl+lI9myhaVxxPBUg==@vger.kernel.org, AJvYcCVQcXTbm7KRa1Q3Hfx2yFISQyy7ZRjGxvGWXHlAlHJQdcwVE7Vhr5u+e6AcPmE5lt7yrnND2WzA56Qc0woB@vger.kernel.org, AJvYcCVnHLl1rc/5JDelOT4rqHh4ELVqkO5DucoRTa9X87HIjy2VgCiA5t8dguNtnW2YPU+erwCZcwxuOGU6wdAdv+w/F5Y=@vger.kernel.org, AJvYcCVx5eSjR68D6dR3agijAHwxIaYu7/myMIa/7jqyqwJqBspEbrrR6cS/IB0K3iRj1LOmdZ4VkZ9OP6RFF3riZb57pOo=@vger.kernel.org, AJvYcCWnhV8dTVtrwE/f6e9lNX+eW3y5o9VAwTJBKisOfz0fyOPG74/RUoYs566ULZNXWfC4DOg1Y6j8vaZh@vger.kernel.org
X-Gm-Message-State: AOJu0YyrnSSplpL3gO+9HTtgHkY1D3/izvlrs1fML1pM4gJ638m8ciYW
	i374jhdARa3jLbCE270V33/RHxbKkfuozkx0sQepeC2bGNCP9qg/bqpO/1gp
X-Gm-Gg: ASbGncvN+fjqtgDDjrTCbV9jQeQO/IGWUPkn37mtwrDihX360mctbfVk4HYO5RYU65V
	78UhXubIZ8LkSKjV2tIv7c7nGm23XkffN5NbS/5TEJD4b07NRAoebNDH3nOzNkND4eeqoEmr5EC
	5mInmwHuDCGuS7ZUmekbh5KarGZ0spEBH5xM5GJWpAnMLfSI72IVzfhldvMjExseTkRsYKnUFsi
	XaYFwhsy+Woy8auxKUbb8R1t5Z2cY1i8BwusCU5zz8D2vJnukVMYTBK4DWIW8CDoGbKLAoxCM+p
	yxXVUYUl3ODqjb3ubBk=
X-Google-Smtp-Source: AGHT+IG2YIimPZgjV8+V3ohfSLj0436yBzoxGfou/yGZis07gdsquYmgdvktECoYgJuh09HEWikvpw==
X-Received: by 2002:a05:6102:d87:b0:4af:c5c8:bb4c with SMTP id ada2fe7eead31-4b3d0e0f3eemr1643908137.16.1736340646318;
        Wed, 08 Jan 2025 04:50:46 -0800 (PST)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b2bf9d97c0sm8365196137.15.2025.01.08.04.50.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 04:50:45 -0800 (PST)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4affbc4dc74so8746681137.0;
        Wed, 08 Jan 2025 04:50:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUZlTvZbA3u31pVLL/Glu0N9usgMK1p2g09rBPocBxcY4518+M17mn008QHsmWvltnWid4/beLN7St4@vger.kernel.org, AJvYcCUcyAZUfXtYIy8r9+PakuZr5Sysw5EksUrw8LKgHj1wJCZtNEVKvba4HmWWElLLxWPWQbwF6YWkApGqZqry@vger.kernel.org, AJvYcCWxdA7sMgQ++GlpaMIGj5lYRxmhX8A7+ZTDeZaFRnmB5e0KLZMYQKsbeF0ObYzL+jkDHO4hGCdP5AsF4PMwIY/bfec=@vger.kernel.org, AJvYcCXDb1cn8WBGmb7XCfA7358vIhEjZ5v6wK+O4/xPOf8AYDkfgIjMTtveOdMoMBRp585A4m6lRGltwgJZPA==@vger.kernel.org, AJvYcCXa1LRg4wcdhShKN3R74/F39QHL58RXD3wSWbPPmh/ptymB0mFdI5eHEBD27XPwKTamI04Dqr+rYjxXCeFH0dGWK7o=@vger.kernel.org
X-Received: by 2002:a05:6102:b02:b0:4af:56a8:737c with SMTP id
 ada2fe7eead31-4b3d0dd199cmr1696534137.12.1736340645758; Wed, 08 Jan 2025
 04:50:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250107131019.246517-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250107131019.246517-1-krzysztof.kozlowski@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Jan 2025 13:50:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWQ8NmJbswGMCrMu3sgPtCLLSvdGONg_Ux_cNsvk7MLWA@mail.gmail.com>
X-Gm-Features: AbW1kvaf0_q9bTRRhsbwHxe9_rKnHnPxiUDNiKQ4wgA4C6jlHeSLeR_KGT4kkIw
Message-ID: <CAMuHMdWQ8NmJbswGMCrMu3sgPtCLLSvdGONg_Ux_cNsvk7MLWA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: ufs: Correct indentation and style in DTS example
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, 
	Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-scsi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 7, 2025 at 2:10=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
>
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

>  .../devicetree/bindings/ufs/renesas,ufs.yaml  | 16 +++++------

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

