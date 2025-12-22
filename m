Return-Path: <linux-renesas-soc+bounces-26014-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C948CD6825
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 16:22:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B5D573032AB5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 15:18:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AC8A328B7B;
	Mon, 22 Dec 2025 15:18:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CFB5324B1A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 15:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766416701; cv=none; b=fxYg6DuchqmBdVy+b4dLsVmtkqVkSwn997Q4n/KwuXlUB7WIqghQXLx4YnpM4L4GZ7QLKgeHWnxoet+Yx6VVX4yLQzjPz38zTK7oZeV6Y5X/bQtQ1I7rc67ctdJsnuDA7TNJ4co+W0y1OyUPVnmZYDJFniJfq2SzSesWgquTnZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766416701; c=relaxed/simple;
	bh=You2LHiJuCtBh6XTv7Ju664H5Lt0UC+xcu6PaSr5KoM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AymBJqdxM/Usl1U2NZXAh5O7BUSZpu6xBSHyQu/Z5sqkFEKhC8JdU3aqMOea+MYlnPVEqk3m2sMP9CpmGsNIwliSsR0DIc1FIGLN3lJXSTbOdZXVaN7qrZJFVXkawzvUCEkv6eShzzrY8SqI30Qalp1veiJuvH4nJTbVMF/YxwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5597330a34fso3090243e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 07:18:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766416697; x=1767021497;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uKxdtjYCI1K/eW72mCjF2XLlbrzh1u8MnPH0lpvgX2M=;
        b=cCyr1pl7CYyrgh1xC4qvas7uk0Z3sDjDMaSWx1pvhfxpNJl8YJlrtINUp1sENwBJeB
         TEIdRCLF0jMpipOUSGGDivrCYRGgLI6Ky8wgs/ESkEcJfgNsIe3GkbpRN0qoP5z3eS/X
         os/A3nunyzfLuOLqxsGDAtKcs+bPOO8dh7gxzyO5T+ITjm6Z+7ql03RCYf+vq5IO0ULZ
         zup0eQeXji07eLzbjtfOPfE6yckni5kYlRu2IiywUJmyq/cs7SD5+vfCI92l+V7DOxmi
         HU9UsjS3uq3JSpPjg4mYsi8ttgxUpFOdUnKN2OjEf7y1Z5JZwGdfLMk1p5GcX6P5ajZZ
         Oclg==
X-Forwarded-Encrypted: i=1; AJvYcCWTv0xqAWyEgQK+l/ecvGZaIOIpHAeHUNsJaRpwPgk9jxUvSX3RgPUdRIW4U8yY9KodJvPDzwiHyhJ0UbuTfvZGMA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhODmvl1CSiKlzgfc5tD0KxW1wgjv8IVdls/R90xRGvO9D2JSq
	lu3ljv+/n185YW+Om6Jed5r3JRY8BGM4ynbB5EV0UIYBOIIvK9pHbFzq5fQQVG6V
X-Gm-Gg: AY/fxX6rVhm4HH2swqXhXsDsFKzAUFzH+GSVmRhtj2NcjJxak4eAOCP/1VMihT06uP8
	Aj8/Ir+D1iab54WwAiJ7dh9ZrESHpDWNogLy/SywlG3zhCkvK7DbQR3lvOAUZ/laCsTXwqKALRJ
	ZUmSTF4aHTBRJ2PyeBXs1WqhOzFaii5CupYChiC3BtQTl7+P3Xf62en7zq/Xa7YBUz2sqV188JR
	Zyi7ieW+oU+2ogLbOAXI5hUlUmKkiXl2DPjOEuCpDqmWxBiKzp84GNgVr75sFzP/G/c0fPvpee6
	ozln7i0IW5iWrwCvCBVgW1HelVp+vRGXSfIuXGdZv6ECHVx8Cc/3ZywJAJONl4ePZc90EP8SIh7
	DDqD9NVNM1OrMV/WNZx0yI8Z/xM0S/ltz3MyMwO3qtXt1j+gbSDLOqDJvV3McoUXgPhMyTVXEHS
	vPFmwQ2aenlRNtRy+PNDHCO1AK0CM2qGMzLjGWdR5Zo1BOiN3S
X-Google-Smtp-Source: AGHT+IEUy3IAaDzFhfa4qsgP0KcyKRQBIZZQdefiy6x7dqwdZYKaNsKawTrMCYHYVuUXkjBpASqeDg==
X-Received: by 2002:a05:6122:8c2a:b0:559:85d5:bfbe with SMTP id 71dfb90a1353d-5615be79118mr3291284e0c.15.1766416697483;
        Mon, 22 Dec 2025 07:18:17 -0800 (PST)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5615d1329f2sm3628346e0c.14.2025.12.22.07.18.17
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 07:18:17 -0800 (PST)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-5dfccb35b10so2615930137.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 07:18:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUxAHQDqFkOJY7CpmjLAOzVx44RGyv1YbZGe//H8BKGS3nvRpBU+pWBueYFhUS6/GSye9Qo7YEdaSGE5EBXLmo3jQ==@vger.kernel.org
X-Received: by 2002:a05:6102:2c14:b0:5db:e373:f0af with SMTP id
 ada2fe7eead31-5eb1a821471mr3659894137.31.1766416696825; Mon, 22 Dec 2025
 07:18:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251216123421.124401-1-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20251216123421.124401-1-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Dec 2025 16:18:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXiw9L-sxFbxMFZYrF2HKTZCDV3RUK4S4GcY2t2+4W2yg@mail.gmail.com>
X-Gm-Features: AQt7F2pvNKiquowwbuc10zjDvLuwul0dx8XtTuqQ1HR-ScVRfhC7JNDNOr3OYlw
Message-ID: <CAMuHMdXiw9L-sxFbxMFZYrF2HKTZCDV3RUK4S4GcY2t2+4W2yg@mail.gmail.com>
Subject: Re: [PATCH] soc: renesas: enable ICU support on RZ/N2H
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 16 Dec 2025 at 13:35, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> The Renesas RZ/N2H (R9A09G087) SoC has the same Interrupt Controller
> (ICU) as the Renesas RZ/T2H (R9A09G077) SoC.
>
> Enable support for it by selecting the RENESAS_RZT2H_ICU config.
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

