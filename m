Return-Path: <linux-renesas-soc+bounces-9420-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2164899043E
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 15:28:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8BB01F219B7
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 13:28:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08EAF216A31;
	Fri,  4 Oct 2024 13:25:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E40C15990C;
	Fri,  4 Oct 2024 13:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728048312; cv=none; b=LWOLh71U4a02bT9p8x6R03wgRlbVJXvBgMczCywy3rlApx1zkemTghKXG27bmg+7EoTeW/liuYyt55x//J5WV5vfzFB4b5ZZQV7javqBYpt/1858eUYyTCi0nxXVjieFQENZkYDVyCSeIaAoHtwW/qa++5sX7fW99Xav8otJNk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728048312; c=relaxed/simple;
	bh=SjrxzMr996ygvusTx5OhuNHw2YZ9jIRTkf/YkZ8zNN8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HP58Chf2frQMzK1EJjfndCDLFwjFHghquahrMxQYJ+gECUgEFNLSe9te3jJwMCkuI4iQJJR2UDC0gashGIGg6JJ5DZC1uoZ19SS/yhvhYCxD/CCIm/oP9ubGCmbxzVtEDEMEJkGmRlVoaIlHJFpgDwSOXRbQMbCD/FyGkTLRUjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6e2c4ffa006so10140977b3.3;
        Fri, 04 Oct 2024 06:25:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728048310; x=1728653110;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=peaOKBmCvirERpICGFQEP+1F7ffTnIETsLLpGsqsrt0=;
        b=jWDPcIgCNv1TBDh6VvwM2dzBKWTKnYzp5HeVzuqZHJVJDekAtmTCg10kEp7EbkEUvf
         xrQ0VpUAhQnPT0TZ0vFE6tB/gz05dl30tv/2NNvrmTZwBwCB+uE7NJ8FEV6KtfTz0Elc
         jJVVtDmNPFPcfQWofKis8QQMINoudJUNjv5VW9YG2zJtRx2bwWvGHGi/sjmQAvLSp5bB
         eHn8VlpLbHhP20IUsLku4nb7lC3o3YxF/5wpMIlJD+XJHvnipevQsUo0X0VofJ4Mthwu
         mm1C8OBfiR0lIDHy1IoA5S/ujM+IwyAowpLWyRV0YCGkYQGzZl/7zP8dqxsRFeP68SgS
         Xg9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWexAbTPEoYfxIZ0xKe8JpeNjkczGyr/sAw24OqStfrzA0AeJvLCXgE6CS5ewHz85FwfogDt9sOY+Y2@vger.kernel.org
X-Gm-Message-State: AOJu0YxRSYuIZDjdPg01LZDRu6s1VkAd9FMbiawiLDF+qtadLanJ2Ug8
	hoZIi3gEATD0LDpvyb/qFPztMZ1fzS7gOdqG+C6119h6657R3YFaO3xep08N
X-Google-Smtp-Source: AGHT+IEwBy65yS9KYAWhoup9L/of6rXrvEUeUcoGq5Cab+EBqyWKvM6vUPMao8v627G2rsBXuV6QRQ==
X-Received: by 2002:a05:690c:6189:b0:699:7b60:d349 with SMTP id 00721157ae682-6e2c6ff74f1mr25149247b3.11.1728048309737;
        Fri, 04 Oct 2024 06:25:09 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e2bbbb77d7sm6459327b3.23.2024.10.04.06.25.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Oct 2024 06:25:09 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6db4b602e38so18003957b3.1;
        Fri, 04 Oct 2024 06:25:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXppX745JSrOig3HDKWrd6p5+IfEeBpgikIFPOXQx4q1phZBsYbJCwmUC2s4m2OFfj6NqEq4XznMY8Z@vger.kernel.org
X-Received: by 2002:a05:690c:61c4:b0:6e2:5a8:3447 with SMTP id
 00721157ae682-6e2c7036dd0mr24919767b3.26.1728048309061; Fri, 04 Oct 2024
 06:25:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240928092953.2982-5-wsa+renesas@sang-engineering.com> <20240928092953.2982-7-wsa+renesas@sang-engineering.com>
In-Reply-To: <20240928092953.2982-7-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Oct 2024 15:24:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUtfMfHKwhr-Y96AvzAcR5qXMtkYg4VSW+F_KUfSrA2nQ@mail.gmail.com>
Message-ID: <CAMuHMdUtfMfHKwhr-Y96AvzAcR5qXMtkYg4VSW+F_KUfSrA2nQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] ARM: dts: renesas: r7s72100: 'bus-width' is a
 board property
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 28, 2024 at 11:30=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Do not set 'bus-width' in the SoC-include DTSI. It must be set in the
> board DTS file. No regressions because MMCIF was not enabled yet for
> this SoC.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

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

