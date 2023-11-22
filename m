Return-Path: <linux-renesas-soc+bounces-131-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DCC7F4C79
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Nov 2023 17:34:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DC655B20C8D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Nov 2023 16:34:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 247334F1E7;
	Wed, 22 Nov 2023 16:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3621D101;
	Wed, 22 Nov 2023 08:34:31 -0800 (PST)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-5cc62cca0efso9551077b3.2;
        Wed, 22 Nov 2023 08:34:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700670870; x=1701275670;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ophsLbscDpT/fxf0eBhWE8ZK8OIp8kFL24DJaRjaQW8=;
        b=XlNhJpVG0IUme74oamEOlp1oUOtTcL7W5kJvyLDl0PmqzoDk0Je2TG3lHI+VrQvE5U
         2oVgtZHl3dZRh2dBDSrTzYM4cPmyAkOhnkb+8F7BCTFMKFc9NJLzzyAkc4vAHdZv+1vz
         AMSsg6e/2h2Gp8yIKxPCSFVE9925W4Kf5fU30Lse82MeGTOJUwWvgwvDNQvlP5jqNA9V
         n01VvGeCNC1fvLE1doTAFzGBUc98jPGh+fIygZQ+mMdqztX+Faplk23Cs+HxCZyN8/6C
         Ok4/aBaZVJ+eSZmldyXFfRGUsX+tqXuvrYEvLP1zS6e5aTQXHj7iDkZNXwV/NiHB8bb0
         7RNw==
X-Gm-Message-State: AOJu0YzeJJzYJKDuafmswgauEFJ0D1CDiiZKbMOZpna0wxtyvGx1d3wh
	8gw9Z8GYAQeK0uNY0uoHmZ2V1/42ojGUsw==
X-Google-Smtp-Source: AGHT+IGxOwoBoFb6bhUx/nujYr41iMhIuJe5EFQCCe+cDSqkpRY/GmB9x2NxAdNR7LXbeaEU2UaUwQ==
X-Received: by 2002:a0d:e695:0:b0:5c9:70b9:84d5 with SMTP id p143-20020a0de695000000b005c970b984d5mr2828263ywe.8.1700670869750;
        Wed, 22 Nov 2023 08:34:29 -0800 (PST)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id p13-20020a81ca0d000000b005cb994c12f6sm1153749ywi.115.2023.11.22.08.34.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Nov 2023 08:34:29 -0800 (PST)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-5ca9114e0e2so35656247b3.3;
        Wed, 22 Nov 2023 08:34:29 -0800 (PST)
X-Received: by 2002:a0d:cb58:0:b0:5cb:576a:ec1c with SMTP id
 n85-20020a0dcb58000000b005cb576aec1cmr2804676ywd.9.1700670868874; Wed, 22 Nov
 2023 08:34:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231122121235.827122-1-peterlin@andestech.com> <20231122121235.827122-13-peterlin@andestech.com>
In-Reply-To: <20231122121235.827122-13-peterlin@andestech.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Nov 2023 17:34:14 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWHx6FoTCZZqaUAES5wJ=JBu7iLvVtNdBZAHB9mgBX4Gg@mail.gmail.com>
Message-ID: <CAMuHMdWHx6FoTCZZqaUAES5wJ=JBu7iLvVtNdBZAHB9mgBX4Gg@mail.gmail.com>
Subject: Re: [PATCH v4 12/13] riscv: dts: renesas: Add Andes PMU extension
To: Yu Chien Peter Lin <peterlin@andestech.com>
Cc: acme@kernel.org, adrian.hunter@intel.com, ajones@ventanamicro.com, 
	alexander.shishkin@linux.intel.com, andre.przywara@arm.com, 
	anup@brainfault.org, aou@eecs.berkeley.edu, atishp@atishpatra.org, 
	conor+dt@kernel.org, conor.dooley@microchip.com, conor@kernel.org, 
	devicetree@vger.kernel.org, dminus@andestech.com, evan@rivosinc.com, 
	geert+renesas@glider.be, guoren@kernel.org, heiko@sntech.de, 
	irogers@google.com, jernej.skrabec@gmail.com, jolsa@kernel.org, 
	jszhang@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	locus84@andestech.com, magnus.damm@gmail.com, mark.rutland@arm.com, 
	mingo@redhat.com, n.shubin@yadro.com, namhyung@kernel.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, peterz@infradead.org, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, rdunlap@infradead.org, 
	robh+dt@kernel.org, samuel@sholland.org, sunilvl@ventanamicro.com, 
	tglx@linutronix.de, tim609@andestech.com, uwu@icenowy.me, wens@csie.org, 
	will@kernel.org, ycliang@andestech.com, inochiama@outlook.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 22, 2023 at 1:17=E2=80=AFPM Yu Chien Peter Lin
<peterlin@andestech.com> wrote:
> xandespmu stands for Andes Performance Monitor Unit extension.
> Based on the added Andes PMU ISA string, the SBI PMU driver
> will make use of the non-standard irq source.
>
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>

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

