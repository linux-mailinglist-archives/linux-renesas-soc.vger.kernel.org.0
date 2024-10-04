Return-Path: <linux-renesas-soc+bounces-9426-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C1D9904DD
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 15:52:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F36921C21157
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 13:52:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 230FC212EFD;
	Fri,  4 Oct 2024 13:52:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E45C212F07;
	Fri,  4 Oct 2024 13:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728049942; cv=none; b=g6FL2/nT9lAVBoPHi7udDkLZb+LeB4q7VEGcX+twCqHzBgJbDpZNpXsuuPGLfI7aiITDCI4OFjt2vfns4o239gFr2cfvQ5Ze3IqRcno5mBDoUt4+zFfoTPufQ5tXtL7VyZNJuU1VmTHHmltl6F5n9Ltnh5n8awMOvuV2L0JmbCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728049942; c=relaxed/simple;
	bh=/sEtcG59LsHRduDhKH+HjrOwiV6BpM8Dq4LU2sQtLSg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bsy/Pq2ji1o2DgrYVXpt7esHKXgzCx31GV8LutnbWIHmwZPnxdqhKnhKsYbtrXdAuwvJACisaAtSgWJi/D9+XPD+7shU64bJNkYYLnbjYlJYdst/++54ReHQ4LucMqj5SvVXeRzab+EmO1IgSy+o9jWHQF9Kmyc8aI/jYvn0Lyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6dbc9a60480so18694187b3.0;
        Fri, 04 Oct 2024 06:52:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728049939; x=1728654739;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iqc9eFQ9Q48XFZmzZq6smy9WnpB1yeBfqFshIj1QAo8=;
        b=dWlo5R+1yu8i6silR7clx7gnSKdw4BKd2jRNSzgV76H6JMvwn7eH6A5QsLrNIUQa+/
         LI9sPw1u/73B6DxlnYwcvbqdhhUTt85+8yd4KcqoZurBCtD2xc7m735JKVISXBkIZ8UY
         V9KfJ55UMAQSEC/GlVme9tAyC4vaFboNZlRh/FsY83Q5P3jsHHzG+0ejcRmUanF6WGY+
         qyA6mX0Cjza3Mh+Gf1R+aiwBBLHhCbemvzXDrLPXEfv81qnp5+jwdUuUABuT9lVhWePR
         UEEG02PxurUoq7cKRO47lg7d4O117ymOInzWEthY98pZtGSOfLGowXFmYyT2d4ikwhIe
         lILA==
X-Forwarded-Encrypted: i=1; AJvYcCW5L7HG+J4UNM3OHajzgQh8TR6Xnwr8uDUbwjbLSmprrgB3DgOiciJjY6T4vK9F2wV2eX6NyAoFGY4e@vger.kernel.org
X-Gm-Message-State: AOJu0YyMAJFQJDQ1m7ql9NZNuaOLYcvd8sMkcPbNLFsZztExFywqMxiK
	L7FAf1DzfP156pUtJ2RYzxEeZoKTY2MTDrqJz6JI8jrk2jOrlzH2pF0QOckfrOg=
X-Google-Smtp-Source: AGHT+IHz+Am18f/SpDDryhzpVt6qwh6azHDq0saQjC6gfyUYCfMbmuQh+cT9nrBvX7NiMldsySwsqg==
X-Received: by 2002:a05:690c:63c7:b0:6d3:cfaa:edca with SMTP id 00721157ae682-6e2c6ffd491mr29310287b3.15.1728049939244;
        Fri, 04 Oct 2024 06:52:19 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e2bc2d1b4bsm6537327b3.70.2024.10.04.06.52.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Oct 2024 06:52:19 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6dfff346a83so16972427b3.2;
        Fri, 04 Oct 2024 06:52:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV/0nN5qM5sOh+slmrLRNyMa89aTJgT8w0CsBFVZClpXzy2Th4TIXlQ7O0tUnQpIEionhm5veJ3NyWa@vger.kernel.org
X-Received: by 2002:a05:690c:6f82:b0:6dc:45ef:d933 with SMTP id
 00721157ae682-6e2c72b304cmr29181477b3.43.1728049938894; Fri, 04 Oct 2024
 06:52:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240928092953.2982-5-wsa+renesas@sang-engineering.com> <20240928092953.2982-6-wsa+renesas@sang-engineering.com>
In-Reply-To: <20240928092953.2982-6-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Oct 2024 15:52:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUwJ+EY2qFZxXJc478W98OEWQ7c7tfmmEj8zVEii=OyvA@mail.gmail.com>
Message-ID: <CAMuHMdUwJ+EY2qFZxXJc478W98OEWQ7c7tfmmEj8zVEii=OyvA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] ARM: dts: renesas: genmai: enable SDHI0
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Sat, Sep 28, 2024 at 11:30=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> For this to work, User LEDs must be disabled because they share their
> pins with SD data lines.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/arch/arm/boot/dts/renesas/r7s72100-genmai.dts
> +++ b/arch/arm/boot/dts/renesas/r7s72100-genmai.dts
> @@ -244,6 +257,14 @@ &scif2 {
>         status =3D "okay";
>  };
>
> +&sdhi0 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&sdhi0_pins>;
> +
> +       bus-width =3D <4>;
> +       status =3D "okay";

Any specific reason you left out the regulator for SDHI (CVCC1),
but did add the regulator for MMC (CVCC2) in PATCH 2/3?

> +};
> +
>  &spi4 {
>         status =3D "okay";

The rest LGTM.

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

