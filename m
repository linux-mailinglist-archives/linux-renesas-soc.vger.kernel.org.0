Return-Path: <linux-renesas-soc+bounces-22796-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6BDBC4BA4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Oct 2025 14:15:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7BC914E3E4F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Oct 2025 12:15:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F30E33F3;
	Wed,  8 Oct 2025 12:15:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE45A31
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Oct 2025 12:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759925743; cv=none; b=noTNX2mP7BqBe3NUUCY+v+grIcApn9gzOUby46ImQvffjZg4pz9a2HIhT1luzS07iqTHHVR6QgUdVoF7w3cf6z4aLPjt4RguStKtH4ClOJdT3wAoYvJMDUUYW0KRW306TeobWhx+mpVYAC9ogxrWt8S1NujTgamBLCAeQFQVQAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759925743; c=relaxed/simple;
	bh=LHfdiCrUQuEcAm5u+oBtBSBCUhJhATTh4SH+rcshlXw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e772xhy/iNRsrl6zQxuZva4oMN5zcK6QQJs4jwzIg7l9FXhkRGPyikPK/PLK6z//HI/A+Niho15azP3/j41Sj9rHQhzuPIgdVi7NydCEQg0ilMcgQhnR0FMrlpC4+sHxR42ZZbuTXdNlkoZWZzSZ3DCrkL70qDIp1YLeGNjLxC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-8e261568020so1454584241.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Oct 2025 05:15:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759925740; x=1760530540;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9odJo6RABd099SWeo1M5TAe6eHvzwU6j0ndjMHRUm3I=;
        b=Pn5CZjLJ5YJIjYJbiyDk71LzYxwnlnOJqxjgv5EKtDiW8cf7Xr2uh6GfMJ9fYSYcmu
         H5EtOwit3IMQivKWtrH24TgjNMZzVBLAsrBlcGrUtsvdH9XOslhfshJRRS5magzs0HtQ
         H9psZ7Qj2sfBGkgymKAFq2Giknadv9JVU8T57wSCqoAy7INRM8Hz+VyuCqRlxikGEHAA
         qeNrai7ND9B2NkWMvIXWVh6tNe2/KmaEAZbYkj9/nyE+9H7UWiCEiWD4GEKGYD8EWnKi
         koqddTMrNeYpDVBN3NanK97Q8EZXGnz3x2DFj/czjPqkShNWoaIV+R3WcZhMrIZfMAnz
         2Qtg==
X-Forwarded-Encrypted: i=1; AJvYcCUZCJT797nHR6pNi8flRf8870v9hV/f1WdCvqfXlP5V290Szt8IHu2a10m4KsWGaZHQLVEkdWyIMC7Gm2sXPYOS2w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlyRHekrNLOjWnDi72Jk3GUrw58y1ml+ggvCUvmUxglbLtQPEF
	rm5fQHgA1x7HXCMHcuvrc6ZeU1GiYuiyUnyC2Nt8Vgc+YRFNS2MTPjLuBy3uAEA3
X-Gm-Gg: ASbGncurhmWhakPmY2dOzI9bsquFTjQB/zACuzQOJMb2vrbhEUKXP4+zTQe1mH2wW7y
	IUUpI/gtFPJ/fbW/c4D63tRT0iFqFpxXL+Ps98vryW0TUCBG4XoAwZvQ1f6+Y/+5VbI3nawNXTB
	YaC+YCnufg0TWXX6RV5+NuuQioLVrfrpDYwfsxAwJqSpUIAchGxLGjQd9ftMJDtYcibD8Y0VkKz
	0fgYLH6cdfom7N21R45qZrJFIDKOZAfMbxjYjSUT5OEr/PBgzxCaIMrxzzAbHvMWq9XF5PX5ijy
	9Ec9A3J0IXTLxam6UmxlNfpTQSjfdItvfdsTcsxZAaLbBYi0S9H4dlkfxnaqd2Zac6u73H0QWZN
	i96SyuqKn+9CUxUa5xn4+lZJWA62AvMCmPdqdHl8C1Bh9yK+gtbDhjc1qHQY4P7aVgMP1MvE4ob
	kTQgTYihbJ7r+YhrNf+Aw=
X-Google-Smtp-Source: AGHT+IG5DOZO0LQeoun3Qe2AwmTPNdj1bPbvItUi9ryaaLmmgiY8piGkLm0MMVkKb2wmXwhbwL6y8A==
X-Received: by 2002:a05:6102:c8b:b0:59a:79c:f277 with SMTP id ada2fe7eead31-5d5e233f0afmr1214452137.17.1759925740563;
        Wed, 08 Oct 2025 05:15:40 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5d5d39f1a2dsm1582633137.15.2025.10.08.05.15.36
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 05:15:39 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-5ccccc1f7caso3999678137.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Oct 2025 05:15:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXUhgNriIcFuK0C9dEJpYNECJYTSWycOxKla0ve9cf43xSBCVkei+iWhcEDZfZiOeDR6x0tgAZMBtCIxzONZp/yPQ==@vger.kernel.org
X-Received: by 2002:a05:6102:44c9:10b0:5d5:dd07:902b with SMTP id
 ada2fe7eead31-5d5e224f3eemr892009137.13.1759925735291; Wed, 08 Oct 2025
 05:15:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251007133657.390523-1-claudiu.beznea.uj@bp.renesas.com> <20251007133657.390523-5-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20251007133657.390523-5-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Oct 2025 14:15:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXe+hU5ryDOhdyL3Ng6Dd=+Xj-S585-duRgq5kcm9SHBg@mail.gmail.com>
X-Gm-Features: AS18NWC41OCxyAm3HqpYys4LAep69bTxUP4YHs1nq_HCZwAoIiGa8nxTffJE60o
Message-ID: <CAMuHMdXe+hU5ryDOhdyL3Ng6Dd=+Xj-S585-duRgq5kcm9SHBg@mail.gmail.com>
Subject: Re: [PATCH v5 4/6] arm64: dts: renesas: rzg3s-smarc-som: Add PCIe
 reference clock
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, 
	robh@kernel.org, bhelgaas@google.com, krzk+dt@kernel.org, conor+dt@kernel.org, 
	magnus.damm@gmail.com, p.zabel@pengutronix.de, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 Oct 2025 at 15:37, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Versa3 clock generator available on RZ/G3S SMARC Module provides the
> reference clock for SoC PCIe interface. Update the device tree to reflect
> this connection.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v5:
> - this patch is the result of dropping the updates to dma-ranges for
>   secure area and keeping only the remaining bits

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

