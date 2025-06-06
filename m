Return-Path: <linux-renesas-soc+bounces-17894-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F595AD018D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Jun 2025 13:59:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 524E8178E88
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Jun 2025 11:59:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B8122882B6;
	Fri,  6 Jun 2025 11:59:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0362882A7;
	Fri,  6 Jun 2025 11:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749211145; cv=none; b=VOpYlkwC88Nldbd57X0f4FtLP/S+bmmOyVZvCxXmMCtvr0N9bA95Kzqae0HGiEnkh8owEuVUsDbosDFw1Z/ZWtFdV2HliVHl67rA0tiqawqKEp20PJJ2ObIwTCyi6koIX6RE6qk0X6p95nGq81pf8P9nmRzBPVcge4K5dI7kHlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749211145; c=relaxed/simple;
	bh=VNzFnnjmlBp/RMn3jvFeMwHEGzosLKTGr8Q2T984OKw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jz8sqLm+IFc7XnOiaIQiTCYgktqtq3/gwY6JxV0nCKSM0cDLyJZ7oJprHtfXRYQqW8SHgfChtuIep8qsMzVzpVEAb1dW0Sj6nD7ZNLx1qHgLpjTbdes/uUhTVCk2DhwRdUyiRvaKbnYudYGWn9kqoTN2Ns/HMlQ5p9S1BJw4TYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-530cd3d0f8bso711464e0c.1;
        Fri, 06 Jun 2025 04:59:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749211142; x=1749815942;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GkkIyvqOfr9ngi6miRPVbPTmpqHilBK6eOIDZuISEqs=;
        b=Y5zJfvsGnJ/t51ugHoiqwJstdFq7FXclwXxF3CT76aR/kLIREOlZNLpCbHCTqSkTOe
         rYH0KCsKcd28voDnG5Q9JARcsehM91VVFSXvQCyf1dMEl5+zhWGjzZA3bZE0hVdu/sdl
         dSIkGs5fqpF4/I0LuAedIeMrEV6icWB2vkYrer6dHQ9kSIjD7TXpE+Ta9AjizNfOnk1V
         0mV1pQ1wyQKoyzMZDCMPa7GfAc83UW1QGM2fhU81hbpTBOI6D1lRlvucHt2bDu4oF58V
         UZZXQBn9GLxlO4GP+JiJL2xqmA0luZpQ/Y8AxV9on1TrBvwrGitM2KEhopdsJF1ZjFLz
         Zg7A==
X-Forwarded-Encrypted: i=1; AJvYcCV+y4DGFK6XyWVXupckYa5px+uj3DfsaDRZAVeocKD3/nepWnQY0VZqkmg8cpCGqA4M+ynskD4sTZAsZFMw@vger.kernel.org, AJvYcCWi15lDB6QKRkwUtzvmBobqed0HEKPFU99fmlZpMqfSj6wulvLG7NLNd+IxwBYIpuV1FGlDF2QcWjAj@vger.kernel.org, AJvYcCWvLhvO5cakVrs1212OrGipU1nFK6rZs0mQtHK7Zy9tka2PBp+Bfs3fW/aRfoH1c5/AK8V3vPZ/wzC41T6Qdwk5s/8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi2oe7yFsRCQCkUzqmp6MmX9mRiyJbvVo2lqLO28GGPIHHTwia
	rC134+Q8CrkeLMnFOUsQrAFe5Lg8IOb87ZxUt2e+bxMTHo6v6sJ6oxPUZTbWW3uj
X-Gm-Gg: ASbGncvMt3TDE12eFZ4dbjNq67BPaDNb5b+BTKIANnXzDkrGdDdOSOASVJm2Xc4j7xn
	37TN97rdlmGBS7qxW+fsyk6M0HUSh+WlLmp0UOcyarPJng/83casaAtFd00ddQ1r57kn6S5kEnY
	klaJijjqxLDaPT+jPozQ3nOYZSDYuZxSl4ENk+cvOxHQerQnKKcx0cVrnliyHmiiLav2kuxSLpt
	aXqE8og17AS1AKlITE0zRdf9Q06FtyZaCGCZyM2/BlMqbe8N9rugOs10QQiv/QaRT50VVS7AEIo
	4vGiWr89vOcZ5GxS7T8F3vEpXgLoQQXM6bGKG8Dy3/Gr5hH/BWwXMBH2wd8Ox3UQfTqydSAYyVv
	7gQSQH00uMlo7KQ==
X-Google-Smtp-Source: AGHT+IE1sIhNlyo4aUhjctzlL5t/v6W/0ioCcOUUcZ+0FNgWuKuK1NBY3FRpGW7t3iwEuekCDhyEGg==
X-Received: by 2002:a05:6122:640c:10b0:526:1ddc:6354 with SMTP id 71dfb90a1353d-530e45c78eamr1858178e0c.0.1749211142224;
        Fri, 06 Jun 2025 04:59:02 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-530e62f42b8sm970467e0c.19.2025.06.06.04.59.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 04:59:01 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4e770bb7b45so274150137.0;
        Fri, 06 Jun 2025 04:59:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUfh+1ROspvczqPnGryP1qyVAgYvUYFyF4pIZIa2SSGUoiLamiuoalRD30MZ8U+yPze7hrYMqQ8uoyx@vger.kernel.org, AJvYcCV4FTIKcC2IBqdyTUq3mRssQu4h7ejlmqVsMWHDbGM5FHQUQDfftGvCrV3IIE3nSHbszh/MGI7f2OqOhEhNz0rTwC4=@vger.kernel.org, AJvYcCW30TvWqdbkM7dRWx5a8Yidnscts6UY/eV1BR/3EMHA9DR7TkXpGnVDThYqlswTf2IviMYsYmaWhLe4tRro@vger.kernel.org
X-Received: by 2002:a05:6102:440e:b0:4df:84d5:543e with SMTP id
 ada2fe7eead31-4e772928b20mr2281122137.7.1749211140760; Fri, 06 Jun 2025
 04:59:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250528133858.168582-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250528133858.168582-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 Jun 2025 13:58:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXMEzPYfDvefSzSx9hZGY=4eyRY2MHHnr5JBHV3ujFdrg@mail.gmail.com>
X-Gm-Features: AX0GCFsl-TsxaSk2EijYe-2lJ04s7VyuySx5VPceo-nG7KhS3hWpW4y_WadxEEM
Message-ID: <CAMuHMdXMEzPYfDvefSzSx9hZGY=4eyRY2MHHnr5JBHV3ujFdrg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: phy: renesas,usb2-phy: Document RZ/V2N SoC support
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Wed, 28 May 2025 at 15:39, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Document support for the USB2.0 phy found on the Renesas RZ/V2N
> (R9A09G056) SoC. The USB2.0 phy is functionally identical to that on the
> RZ/V2H(P) SoC, so no driver changes are needed. The existing
> `renesas,usb2-phy-r9a09g057` compatible will be used as a fallback
> for the RZ/V2N SoC.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

There seems to be some minor differences related to VBSTA interrupt
handling, but the documentation is far from clear in making clear what
that actually means, or is used for...

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

