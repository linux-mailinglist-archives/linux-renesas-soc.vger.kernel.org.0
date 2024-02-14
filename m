Return-Path: <linux-renesas-soc+bounces-2777-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FB7854B2B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Feb 2024 15:12:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 62327B24603
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Feb 2024 14:12:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01D9D55E47;
	Wed, 14 Feb 2024 14:12:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C58D54BD9;
	Wed, 14 Feb 2024 14:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707919955; cv=none; b=RS/Oqc33vFQRLnxyYrn2igFcYsIwWR+g3iDBRQwlp5icWZMCtAssFvlnKTithiPB8KG8zHhjJs6PnP3wH/ixKbFakCU5Gx96u9zYs73QuIuSZch5cL9TMTJfbTHrO2vTMZpZ88z39zmOxX1HI1KEUbASND/Pz6e49RiCfdkwhCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707919955; c=relaxed/simple;
	bh=2GJQISDkv6jRPcP4DODxleLSjsThEWXj8M2v2WcKJQs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KMm0xLPh2UpjM6S91BvfM1fuDLki26QJZJCCf7BbIvBb/9qQo8yiSZx1wbuEYVNvLDGtw8xnTrYhyZSbTlwhz8/aj+kU6JOVk/+bRFkB6qBvbV5oLfOk8U9Y3xqNTtC6vfXDCPcuoTlW/+jKVevXPbmFxXwvqfKpHPEEFxv51mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-60757c46e34so19975577b3.1;
        Wed, 14 Feb 2024 06:12:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707919953; x=1708524753;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cb9+3wwx/AEqScRVEPt4G2UGdfMfQvmiqk4DpiK9PjE=;
        b=TfqW3BM+lz6BtXH6NyvDJ2nFgYmuR+p3GhkT/RfZShAo4YsNgGWjX7PieMjAVxZTuN
         OKwVQQAun+U7a2Ea35t/ENOKm94Pwo46kYYkZ3oIRvjnI7GvS069joA/9eFm4J5Bbhuq
         jTwTuhfO4SYK7hnOL+HzeYESBI1/a9s60frbQyAGUn3fAo24rujnLWekxhrWwGuRCxyS
         etfB4BL4lrizl8ex6/pDxA6fW6HmzPqSfR9pBNjf2xNS/OtR0obfH33JDbXbJ4PUIWJQ
         n0fDCeTDYtKviVKDzJGG+/O4JYWEEAQ/irFiRvwwD043Ots0VzHPZSq8wx87YYv1gcII
         HxXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUY1XXyvlG+8gUYWCM5mQbWUae5rzmiRas1OfyO6ABFdrOWb7TSRGsa9CYc+Qk3A0AcSEH6X8pOp51OzZw8wv4qTB1KHHL7K6Or0gK9lGRAkI5Vq93l/11VBfiudLwEw4nNqr6AAtGk3FfZTbOi
X-Gm-Message-State: AOJu0YytsVigKljyCoFf6jqfWpw+hYw5llpSWTW4MWDGA5+3Qy7ARfWA
	6XIbvowsfTRrnmi0nqMO3z89Ket36pyCXB9XiUawgdYSY9Da/WQLv814Dd+6O1I=
X-Google-Smtp-Source: AGHT+IGYihkpbcwQMUuxrWCKgub/LGUa3/RjFJq29oePROrxRNVlT2Dlo/AUGtRXi0Z7f5dhBUThdQ==
X-Received: by 2002:a81:520a:0:b0:607:7aac:6707 with SMTP id g10-20020a81520a000000b006077aac6707mr2646354ywb.12.1707919952836;
        Wed, 14 Feb 2024 06:12:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVhKmS+KCY2DRHC+8lb8H8q1AloYt8/6MI0XS0zfh6FZwFHferra/BnpLeYhj/8Gg1o+kxnVIGUGnlInw3eEknk/+qMu7dDkEAbIqhjhtO4rYbPAVry1FFK8R3Q7I7y99ds6va7IhEW2JkfXxsv
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id p4-20020a0dcd04000000b00604a80b94b9sm2204902ywd.129.2024.02.14.06.12.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Feb 2024 06:12:32 -0800 (PST)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dcc73148611so2110978276.3;
        Wed, 14 Feb 2024 06:12:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVETi8s0ljL5RFe8riMlqYO0v80JbmpWGYeltOw5nMZ54nQOvGJf1rJ89f3i/scwdsmVHjKmIMYINJ2Da0/zNOwI1Tir3dyZtZkZKBZfpvbqjTgAKeejmnjVGmlf9PVQkc5LNxMtiZHRMl7vkbV
X-Received: by 2002:a25:6942:0:b0:dc7:443d:d9da with SMTP id
 e63-20020a256942000000b00dc7443dd9damr2446212ybc.4.1707919952447; Wed, 14 Feb
 2024 06:12:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87cyszpwmp.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87cyszpwmp.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Feb 2024 15:12:20 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXih9g46JKvz_UsjH3h_OrJOJLnFv6ixpYjE6Q4DRxbsA@mail.gmail.com>
Message-ID: <CAMuHMdXih9g46JKvz_UsjH3h_OrJOJLnFv6ixpYjE6Q4DRxbsA@mail.gmail.com>
Subject: Re: [PATCH] ARM: renesas: r8a7778: add missing reg-name for sound
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Morimoto-san,

On Wed, Feb 14, 2024 at 4:12=E2=80=AFAM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> Sound Driver requires "reg-name" to get register info. Current driver
> try to get register info via "reg" instead of "reg-name" as backup plan,
> but this support will be removed soon.
> Use "reg-names" for r8a7778 sound.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Nice catch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.9.

This never triggered with "make dtbs_check", because
arch/arm/boot/dts/r8a7778-bockw.dts does not change the status property
of the rcar_sound node to "ok".

Can we just add a line to do that, or is anything else related to
sound missing in r8a7778-bockw.dts?

I do not have a Bock-W, so I cannot test this.

Thanks!

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

