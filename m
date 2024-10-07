Return-Path: <linux-renesas-soc+bounces-9513-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D2A992B0B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2024 14:05:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 151D71F21186
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2024 12:05:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47B271C6F6D;
	Mon,  7 Oct 2024 12:05:10 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9130A18B483;
	Mon,  7 Oct 2024 12:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728302710; cv=none; b=PCS9nvKsQwOaLoEethAnbkcMuLFH3nL5zCaxcZaIeu4r1HmWdRNGTz4RYmihxNNSO/JBrxtZyarDlHjmHb1y/27xTmEI7dU72ouMBS4/cOFkf28CIRbQ/IQYkG8GgAEM6b7YPbWN4zmglLh+P0l2LM8CdpnO6L4lInmKUILOZwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728302710; c=relaxed/simple;
	bh=gtlm+YbJqx+5/1HSrl33QH3ESLaEkO8tqDh1PRpW2Dc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O4ULdX/35uWOlAqOOZZSsWdpn7t+DkSc6vLC1AkRdAs0FRF0+fSbqTjaBjqiieEAiTdnm/nUZO8d0k0c0Y38IEh/rwaeExxzVtYexHXcxp9O2E+gIZdvejAZ5hFU5QEX5ntsvaaYYIsmJ9nr1ZwiiRQE01eg61Wi/3Zr3pjuRrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6dbc9a60480so35281297b3.0;
        Mon, 07 Oct 2024 05:05:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728302706; x=1728907506;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EXmKVzAQZn86c7HUK/8juEU7RqfMz4EookfMfTEtDus=;
        b=ZeAAD4McZDuUQDg7MFAnHHHHKmOGPXdqpW1ofMBbEVQ6JGnHemzTx09jGVWGbtJk9B
         AKdiXP75iLC+rnq5ALedVI+8IiwO6MRLJi6f7Be5Jt6GvfKp83fXTq3445kx9aMQEMZ8
         5nEsnni3JSb+dWKW3juaQRXTCrTgC2dXWdghW+vOAeWqY7yPAQD/6HnO0Ao/gSnxfqUC
         1K3Dng7RtWWZs8BDuUenSfatVZtT//lj3s+Wiow+xEY0MvAat68VO1WnU7iexdQD4NRE
         VhE4uV4U+YE5tFJ9a5dKEUvrIKzq/d8NYFmmQQnSJIc3bKq5VzLHagHM/M+Oa01bfvrL
         pu9A==
X-Forwarded-Encrypted: i=1; AJvYcCWH4JfPHUXMDj3CkkPl0A4f8vCIZK2K+JuBag3J0HvpKHA7aOv8CP2xeOF2IHRLIvhw3iIAORWghIHkLVS8EIhSi0s=@vger.kernel.org, AJvYcCWfgbKjjJmaVO8Gcc69gIQKT6p6iJ26fQYfUkY1AkZKA9quig+XVDl4N5Wjc4ACtTe+HVGHXbWwbY/U@vger.kernel.org
X-Gm-Message-State: AOJu0YzjIak5BcmyIs8CpQ79JvbmuladvtBG0Lsj4YB96NLD8FfMqaM6
	to8EUYcs2NLWmFTPF94f0MoWAvwPZocuwxWlL2XCYSZRdeH7PVDj/ZRee26E
X-Google-Smtp-Source: AGHT+IGj2z8Xn7pGUUS06ddOVxtgz7jVQUEr5SRSZT4wVrtRyP86dnCxuORU9AaPPbqCrthCm4w1Tg==
X-Received: by 2002:a05:690c:26ca:b0:6dd:d0fa:159f with SMTP id 00721157ae682-6e2c728a015mr78634647b3.34.1728302706139;
        Mon, 07 Oct 2024 05:05:06 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e2d926d8b6sm10158947b3.14.2024.10.07.05.05.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 05:05:05 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6e2346f164cso37840117b3.3;
        Mon, 07 Oct 2024 05:05:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUGAwdjfT991tViBXAxxfEoH7Mz4BsCrYsApWxKQ7CcwxYB5IGeET4pHj2lGfBryWAneqh51THL2+f6@vger.kernel.org, AJvYcCVOM58dzCpiOC0LZIEikE5uLOi7eAC/5r72oIhQQDYaQLCN9gYsKwO4M9kHz40+RLkbnrt7rM8sqzY6nh6kUvdCSkw=@vger.kernel.org
X-Received: by 2002:a05:690c:f8e:b0:6db:31f6:a812 with SMTP id
 00721157ae682-6e2c6fcba10mr104259927b3.4.1728302704891; Mon, 07 Oct 2024
 05:05:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241004173235.74307-1-biju.das.jz@bp.renesas.com> <20241004173235.74307-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20241004173235.74307-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Oct 2024 14:04:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWrun9=Oz6eD95wMQ=8Hb7JO5xgrNsZuxPWDrCrx3Q1_g@mail.gmail.com>
Message-ID: <CAMuHMdWrun9=Oz6eD95wMQ=8Hb7JO5xgrNsZuxPWDrCrx3Q1_g@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] arm64: dts: renesas: rz{g2l,g2lc}-smarc-som:
 Update partition table for spi-nor flash
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 4, 2024 at 7:32=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.com=
> wrote:
> Update partition table for spi-nor flash, so that we can flash bootloader=
s
> in Linux by executing the below commands:
> flash_erase /dev/mtd0  0 0
> flash_erase /dev/mtd1  0 0
> mtd_debug write /dev/mtd0 0 ${BL2_FILE_SIZE} ${BL2_IMAGE}
> mtd_debug write /dev/mtd1 512 ${FIP_FILE_SIZE} ${FIP_IMAGE}
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v4->v5:
>  * Updated bl2 size to 0x1d000

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.13.

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

