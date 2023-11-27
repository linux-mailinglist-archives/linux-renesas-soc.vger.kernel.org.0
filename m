Return-Path: <linux-renesas-soc+bounces-271-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1B27F9D78
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Nov 2023 11:28:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F2F01C20A83
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Nov 2023 10:28:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3662D182DA;
	Mon, 27 Nov 2023 10:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94E0610F;
	Mon, 27 Nov 2023 02:28:12 -0800 (PST)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-5b383b4184fso40823377b3.1;
        Mon, 27 Nov 2023 02:28:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701080891; x=1701685691;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w2MrYlyFk9vAAKCcyLHvMRthDomGQ7+yTct4LR3NVc4=;
        b=CaMzy9TOqjlDaormMibwM3twyra1KpWYxiurnrlvpqR0n3BuNRA3RA+XQcewHfY5Xq
         TJa0XajDI8YMW5iO06baVSgdTqX/pgCVR92jAefRJ4e2vBYZmdk0z3bR84Z3WYfOjNHI
         U1loX2S8PRtxA5HASg82cEyGSe2QfeaRE2hAP3c7eb0Q7jiZeOktgJ26LsH9Y8/Bbhbz
         BrQDC3LS4G9D9tWeT/kjNAe/SeonWWyVhVpdfWBd8/I9BD/2B/utwo/MGgptGxN0d30F
         H1j2uRtToQ+YGZAP0p3XLCtfbnS/WR8ortP32xqbaVCCAoUpilyqHNZOj1A8RmFgUDPu
         iMAA==
X-Gm-Message-State: AOJu0YysdqJDFrVUY1oXTtFccIJgi5tJW/bxpk0B7YKG+t5kDEDiTb33
	lp0t+vsvcj/thc5RSvwfOQTympdPovVKVQ==
X-Google-Smtp-Source: AGHT+IFYlUbB0WokcuCPxMKOcuf3Su0WDdqpLjiYNKM/+CsSrbUZwwHu/kzwa/6+z+yqqzcfUBjW3A==
X-Received: by 2002:a05:690c:2505:b0:5ce:e0a8:ed6f with SMTP id dt5-20020a05690c250500b005cee0a8ed6fmr8291628ywb.22.1701080891685;
        Mon, 27 Nov 2023 02:28:11 -0800 (PST)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id x126-20020a814a84000000b005ca7a00a9b0sm3147065ywa.64.2023.11.27.02.28.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Nov 2023 02:28:11 -0800 (PST)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-d9caf5cc948so3600678276.0;
        Mon, 27 Nov 2023 02:28:11 -0800 (PST)
X-Received: by 2002:a25:cec6:0:b0:d9b:311f:e9cc with SMTP id
 x189-20020a25cec6000000b00d9b311fe9ccmr11611974ybe.34.1701080891379; Mon, 27
 Nov 2023 02:28:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231125233327.238575-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20231125233327.238575-1-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 27 Nov 2023 11:28:00 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVxmhXvt+xcDe_=sbx4d-U=KaDNHsHF9kRvdYKGzSUoiw@mail.gmail.com>
Message-ID: <CAMuHMdVxmhXvt+xcDe_=sbx4d-U=KaDNHsHF9kRvdYKGzSUoiw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: renesas: r9a06g032: Add missing space in compatible
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 26, 2023 at 12:33=E2=80=AFAM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Add missing space in compatible property and align style with rest of
> the file.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.8.

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

