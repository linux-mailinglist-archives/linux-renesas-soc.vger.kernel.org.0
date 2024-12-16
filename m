Return-Path: <linux-renesas-soc+bounces-11392-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E312A9F347B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2024 16:28:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9EB2F1883CBA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2024 15:28:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0247146599;
	Mon, 16 Dec 2024 15:28:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA5E1428F1;
	Mon, 16 Dec 2024 15:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734362893; cv=none; b=uyDbkf8woWq0yCan/7qIGDLvUAjb7gN5Eu/mcp0t9h3y1764TKKBjezMkLNMkalsmzpF7U5/GWmfTivs8fGC69q9kTsGDv0pgNi82kuxoJCcbyh8himsnm7fVSEQBqFiHvhjfSIwjckP92pZJGZ+tKiFtVtPnemW1BOEb9GcvoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734362893; c=relaxed/simple;
	bh=sxIqmI3QC9Jyvc8wVP1eMFzduE+nzsnPUOkuAhfCdHY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XQDvK3XjyIS9dSi9yihHDHNsG6MTUSjx2gkmJHTiKsmqTNiJDIKaIvTVnJXXtAyHBCN0ejGmvsNuNl65tRMGX0DACj4mf5kFTikccZFTjl+ay2acHbvHYlB2Gav9w1TZDLgA7iL/cJOvHKoztBr5Bxfu89uos7ZbBbLc4nMRohc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-85c5316f15cso973540241.1;
        Mon, 16 Dec 2024 07:28:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734362890; x=1734967690;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bqLTXavJUp9TPWAj6oFx3BCnwGmHXsE5vLQ4Z0mBcco=;
        b=r3/4cdslV5VC1WoumWsCJ9RDjZkIhHKbwiIBCAD6Y5WOiOtdiqHyRZzBE3qF4l748V
         seb2REKnJakkpu28TambTWzGNyvgX0tU49htReDSTuzBVTht5TiSeMf9QOC0FcPML+En
         Dmc9IGhngdUzaJydEToFQtm5eIGxLsLA6GkXpKh1yMNIEfLrLQyiO2SyRJwJm/BIO0dQ
         vArKS4ck1ljHgE8t+qj7iI00oWsabbUpRxS8Ntf120/Kr57kZweKMh+fRGCO5W+guC2G
         guvzHsW+sgxBlIxBpOdS6Z6w7MpFx73PXHu9LhfJXfShqTQpSEEeJ+4lybtM2ZDK6/0X
         xtcw==
X-Forwarded-Encrypted: i=1; AJvYcCW/AAHEzjY9pRFu/eFkp84Ri1en8tgttduzQi6DDR7h9SNfXTmAMhFc6bRRhnTkjRIc/OlYS3F3pMT6hBYrDIZGtFE=@vger.kernel.org, AJvYcCXebtr/LWpc5RZYzOFJ31fy97vdSyNTGTdFk9n3VgVRWmF+Nl97PTckwTW2tY0MsLsjYrjvoyMkPU5H@vger.kernel.org
X-Gm-Message-State: AOJu0YydA/olZhm5VA3eC6Mks3+30np8PxL+Evz9LdgdV3ykbAhLCLm8
	dRrY9K+0HrMV4tjOAjW28WEEjvzkkR/+QbqnH8d9jph7T61kSWIOi3ym7pt7
X-Gm-Gg: ASbGncvHtUOiya2HumTbweNVBO8+cvP2XBNp9xXei1l+CqTfoCxfpEEloW2mMKcNReY
	33xdaAi9ogVYoERscYKw/iJUoOcuqoM+pGKQPe4iUPwzl7zMrU11rMBGspmUKCcCMxfLVSzrmdX
	Ov30e87D3O4Fu4/ae7icSQcGpzk223KEvTyp467r1kyEOd0DmtWVRSmkaYCuJw1LYR2SAeFTf5p
	PDtq/Iqqa/aWf/lJDDL/dtFayDrv0Evu8LE8bJTC8H/wfPyexFJNVdTBFODGKWH3x8VZQVD1m3Z
	45NzJ4xpWcLVFPEg2Ug=
X-Google-Smtp-Source: AGHT+IF0o9gZrytu8koYAtvLvmeaxQXphhX7PchHoJ9j4u4V/660YINdAe2ZiFqzuw7Pvp2idG0glw==
X-Received: by 2002:a05:6122:4f98:b0:518:a0ac:1f42 with SMTP id 71dfb90a1353d-51a2425f86dmr335017e0c.1.1734362890331;
        Mon, 16 Dec 2024 07:28:10 -0800 (PST)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-519eb6faa0fsm633438e0c.34.2024.12.16.07.28.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 07:28:10 -0800 (PST)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4afdd15db60so1062789137.1;
        Mon, 16 Dec 2024 07:28:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV7i5P0VMUq/Zs8kIqZQs2yPoQOxbqaZvyiS3fT/0AxnUT2OqDC444GNJ2ou/2GDGf53+JFY88MhuUM@vger.kernel.org, AJvYcCVzbe9HwN2ePCtyyJ8VNeZBjIXtGuMsx0Imn43jTgbPwzDWBbRkZp2I+dKbQp2CXRTgOgoFjWxFaaU0YngmDEE17PE=@vger.kernel.org
X-Received: by 2002:a05:6102:2c04:b0:4af:fc14:f138 with SMTP id
 ada2fe7eead31-4b29ca14539mr353074137.7.1734362889759; Mon, 16 Dec 2024
 07:28:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241213173901.599226-1-biju.das.jz@bp.renesas.com> <20241213173901.599226-6-biju.das.jz@bp.renesas.com>
In-Reply-To: <20241213173901.599226-6-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Dec 2024 16:27:57 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVxiRqOiq9osCWbtx8DisJjwLwk+X=+drDC_J+orGZf9w@mail.gmail.com>
Message-ID: <CAMuHMdVxiRqOiq9osCWbtx8DisJjwLwk+X=+drDC_J+orGZf9w@mail.gmail.com>
Subject: Re: [PATCH v3 5/7] arm64: dts: renesas: r9a09g057h44-rzv2h-evk:
 Replace RZG2L macros
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2024 at 6:39=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> Replace RZG2L_* macros with RZV2H_* macros, so that we can define
> port names in alpha-numeric.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

