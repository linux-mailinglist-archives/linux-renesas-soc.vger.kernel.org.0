Return-Path: <linux-renesas-soc+bounces-1517-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3AC82C17F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jan 2024 15:22:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 696D01C21149
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jan 2024 14:22:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06D086DCE8;
	Fri, 12 Jan 2024 14:21:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F867537E6;
	Fri, 12 Jan 2024 14:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-5e784ce9bb8so52341757b3.0;
        Fri, 12 Jan 2024 06:21:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705069313; x=1705674113;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=510mmNWz2HjFAJ0z2s1UHej0ZGwB83j7sW3JtjgmIVo=;
        b=AScpU4jjFkXUJXLgFILg3EmycvVq8xYHyuVDKytqZPWdKF57Jn+00T5+LfLpbhJ3y4
         8alQNhv3tK07SgPS0+8eCvvHk5qUL5B536Yw/fWQHa55bm8dKazkV/YcA7xEYdwRiORX
         EYegs8XCsvUEpmiV0ThlsOyi6r86IjzQScJPbi/gfVYfk7rU3qyFhyj+buubHJsfdvKa
         b5XN7WmFAX29LnbLV43uC0nvuVYpkfy+w3SFn/oVAcfRaceojg0B3EpZJljWFdSCStpH
         R1NE4wfhJ0Aj2n48GsGkyvi4TJFCsD/8UwWavSu28kzPaRiv/aPelgiLASrlkjHyaycc
         UiAg==
X-Gm-Message-State: AOJu0YwMOBogPSE3fe6n5coJnh113x8ixavBXttLNuf7EBhJdJE3hnOm
	deLimzDZu2riy0l057ZZ3sMAj8piaBgO0w==
X-Google-Smtp-Source: AGHT+IHIlh21hc4Sr0HZVdMo4jFRr3s0lw1rZu6d7Cv0tYYJpCHTA2KW98Tyci9KjjqhKZFm31I0Pg==
X-Received: by 2002:a0d:d597:0:b0:5e4:8966:948f with SMTP id x145-20020a0dd597000000b005e48966948fmr1475712ywd.49.1705069313279;
        Fri, 12 Jan 2024 06:21:53 -0800 (PST)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id j64-20020a819243000000b005ce93212c47sm1368190ywg.134.2024.01.12.06.21.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jan 2024 06:21:53 -0800 (PST)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dbdb124491cso5132250276.1;
        Fri, 12 Jan 2024 06:21:53 -0800 (PST)
X-Received: by 2002:a25:8502:0:b0:dbd:73ad:9f2f with SMTP id
 w2-20020a258502000000b00dbd73ad9f2fmr497681ybk.17.1705069312892; Fri, 12 Jan
 2024 06:21:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87edeqgfbu.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87edeqgfbu.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 12 Jan 2024 15:21:41 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV1GLYZGn_TgYbxfPakkLpUNTsP5hsEk9tUqLzpb5wOdQ@mail.gmail.com>
Message-ID: <CAMuHMdV1GLYZGn_TgYbxfPakkLpUNTsP5hsEk9tUqLzpb5wOdQ@mail.gmail.com>
Subject: Re: [PATCH v5 resend 0/4] drivers: clk: renesas: ignore all clocks
 which are assigned to non-Linux system
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Rob Herring <robh@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Aymeric Aillet <aymeric.aillet@iot.bzh>, Yusuke Goda <yusuke.goda.sx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Morimoto-san, Rob,

On Wed, Jan 10, 2024 at 2:14=E2=80=AFAM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> This is v5 resend of ignoring non Linux system assinged device.

Thanks for the update!

> v5 resend
>         - add Acked-by from Rob

You mean Reviewed-by?
With an Acked-by, I wouldn't have to ask the next question ;-)

Rob: How to proceed:
  1. I give my Acked-by, you merge the series?
  2. You give your Acked-by, I merge the series?
  3. We do the immutable branch dance?
       a. You apply 1-3 to an immutable branch
       b. I merge the immutable branch and apply 4.

You get to choose, as there are more DT than renesas-clk patches ;-)

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

