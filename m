Return-Path: <linux-renesas-soc+bounces-11363-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9509F2D4F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2024 10:49:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 78CF6161C27
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2024 09:49:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60AA21FFC60;
	Mon, 16 Dec 2024 09:49:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFEB21804E;
	Mon, 16 Dec 2024 09:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734342564; cv=none; b=gZ10hRNhptBGTvj9hMx1C2UEop4GTUIbC1MqBp1vU1GAhoVktfsF17p4b/Xrtn94TtXfkEAWpz9OqCk7RIKurAnnaS6VTSxlc7oEoEYbgXS5H6NaQ3hPolcDx3sB/KvwP8tPZBeju907+bEBV5zGqsFTH2vLMQgM1uf6W0dyJAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734342564; c=relaxed/simple;
	bh=n0x3WRqr4ADX31+h2v0g99ljCXGAP3sn1bme2h1rOT0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JZh09kOp0XDuwg8M3e5h1c9+L/s7R7PCnLe67LiicjTlzRhA9YmP2cWYdkO6UenGkos1H3PLcqP1kZ5YAyYq+A3T27t8hmW77HX/1SHv6nMDWdNAiRQL/dTTsPHPRU185ezyoEx/GgEEiZUqcioTeVaQjX55IfRr2n+2SCAB7C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-51873e55d27so2130390e0c.1;
        Mon, 16 Dec 2024 01:49:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734342559; x=1734947359;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QMssFc4WlUyziRcYZ7/lgFWbIJiPIdNq0Bs3CRb6Zv8=;
        b=uIIKGeVrQd0U0mEG9F9ERJomEmVYNaUeg46dfRkqw4TGw8bzkZj7etu+vNa9J/AQGy
         tpOOzyoUBIrNR6T8UBsNi3MK5w2KHI2jj0JdSxPi8JhlWYbzKCqzxDnsbl0eZHzO062G
         Gw9R7qKo24CL6Nc919QsVm+YSVJXBAY48sCLqiCuYTqwF2JLnKoCaJQl5dsryGoJkprO
         XyPbmZNwXOmFWUSIWH42uHPxW/qlSixPMJFIOa8bawBQRYN03YQ/Ne3bIYpXJrPbsCQu
         Otu7I1/Y1SxiYwSFg0jSp9HifcQ5NjMEUp90jRs/sZG8KvyRzAJYYXM7RKFK/Tp5MYXE
         OrWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVO94BnYMsJEOF3mBVr3nyH70r4b3Jt/BtaYoM/qinpDlepll8z6LeEL5fEwofU0+nM0GZd4S1m2EMaj8LP@vger.kernel.org, AJvYcCWz4a7NBw7aQaIDKr3/mRx6entlazWgx+9VmNl9Kawdf+VaAzR0Mpfx7y9kQea7h7YCg6DQ6Hq9uetzzw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ4cOzwamxQ1yQlWLqzDYwSsNY+jCNAwjPaglRuaVK46iuTZyD
	4KeItzVWPJGe5l1vKJmY6J4c4QHaGVZ+G+BAbv9arnlNbLrqdQHigPX7WeeL
X-Gm-Gg: ASbGncs8V0ZWGs3qTvwIa0BrF43HzELoVLH4HXtDpQFhliOlkmvx3NyV82pOFqvWGdL
	OlD4kE9/4A+uLALqP4+H4g3Pa+2D8hST4WZr9VxfBnDbN7tGW7PkxqPYbXrXjpk++KwZgyymE8m
	ag81KC3tJbXHes45eYpL0s3uFoycs5Dqc427BOifo4pEznWt05v6IK5CtOsAyf4A5wDsXIGPCZ/
	BN7UWggqA6cToE2VYe5Spzcd8aB7FkhPXDYhUvkNLXk/Gj2CRRa+tbyaxZ6/5qLm/EEvEm9KCRV
	bNFv5YtMZhOIuR+K1LM=
X-Google-Smtp-Source: AGHT+IFJjSdtCpKMJAcE1XCO1DNQDIJeYeyK3bYxW0gzjcIZc3zjAJ1McrxY7oVn648HI6AaE8+kuw==
X-Received: by 2002:a05:6122:318b:b0:518:8915:89ec with SMTP id 71dfb90a1353d-518c5bd8a2amr11598612e0c.1.1734342559232;
        Mon, 16 Dec 2024 01:49:19 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-860ab6d6de6sm816758241.22.2024.12.16.01.49.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 01:49:18 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-85c436db302so1895522241.0;
        Mon, 16 Dec 2024 01:49:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW+vXYCm68dYDxTHlLSWTV4MNzfQ3YDfqIewsOho3KGfDeV29nMNr7XjflSvjYIMI17QajTa4OT9yp58zI8@vger.kernel.org, AJvYcCWhn8hDyk3ppUzpMpkn0dNqELG5nde4ye5wXvVdOhnv05lk4IzanZ3B19hH4Uo7QeeBdmT8Kn0gY8YOkA==@vger.kernel.org
X-Received: by 2002:a05:6102:1483:b0:4af:d263:de23 with SMTP id
 ada2fe7eead31-4b257b156damr12193210137.9.1734342558479; Mon, 16 Dec 2024
 01:49:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241214085833.8695-1-wsa+renesas@sang-engineering.com> <20241214085833.8695-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20241214085833.8695-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Dec 2024 10:49:06 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVZ6_LCZcPiL59A05XkNt88-2OwDTHZDdT0c7GMuFQNag@mail.gmail.com>
Message-ID: <CAMuHMdVZ6_LCZcPiL59A05XkNt88-2OwDTHZDdT0c7GMuFQNag@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] bitops: add generic parity calculation for u8
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, Yury Norov <yury.norov@gmail.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 14, 2024 at 9:59=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> There are multiple open coded implementations for getting the parity of
> a byte in the kernel, even using different approaches. Take the pretty
> efficient version from SPD5118 driver and make it generally available by
> putting it into the bitops header. As long as there is just one parity
> calculation helper, the creation of a distinct 'parity.h' header was
> discarded. Also, the usage of hweight8() for architectures having a
> popcnt instruction is postponed until a use case within hot paths is
> desired. The motivation for this patch is the frequent use of odd parity
> in the I3C specification and to simplify drivers there.
>
> Changes compared to the original SPD5118 version are the addition of
> kernel documentation, switching the return type from bool to int, and
> renaming the argument of the function.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

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

