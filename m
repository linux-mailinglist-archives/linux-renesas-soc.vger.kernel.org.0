Return-Path: <linux-renesas-soc+bounces-1581-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DDA82DADB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jan 2024 15:02:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BEA681C2048C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jan 2024 14:02:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4EF317586;
	Mon, 15 Jan 2024 14:02:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1CE17571;
	Mon, 15 Jan 2024 14:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-5f588ce1b6dso66987817b3.1;
        Mon, 15 Jan 2024 06:02:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705327341; x=1705932141;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SmpeOIqaC6PrGt9qvY+jgYWHyktprhcCdGj8iUM5P0I=;
        b=Yt4xlFkzSpjqRxhces7okltFQMXhwfO05Hlv8AD7dk+eVKltsf7BJ6pX9njOy1+sk6
         H9UMBZRI2rmvXW90PQhI0tDLkb90K7NVnGH1gl6XX+U9ZSEYfBE1/fdQzCXzuwdJHT2N
         9E8NBgLx0ffjS6qvGAgHBvNeq7zEO2W7u96RxaVfDf5uSMJ9Gs2rbbCvf2WER1SKPHvh
         eAgieqtnFDlO/79/bQ0J+NLXZNGp9nPPmET1RKEN7arHQyFxoxbqc9+0Pm2aQjARItIN
         ouYXgcPhX6O7nFcYK5k0soyeEbUAdp3uqgoceIEmG77WotkczCoKRwWeHWCWLYL1uWWt
         a7Lw==
X-Gm-Message-State: AOJu0YygMe1NckHxlY2dFQiFZvk93OlAdHkPVvrHqgpradDCGZYTZGKj
	l+J4CdXi+il8oq+aCevUXasdXrCSragDKg==
X-Google-Smtp-Source: AGHT+IE/elFYKN9BF86sLVhHM6ET7LPCmUG2/Qxw0T/S8lXbarHLYNVLV8XKSGAiXDjukIXZPgKM1A==
X-Received: by 2002:a81:c14c:0:b0:5e2:af70:4f11 with SMTP id e12-20020a81c14c000000b005e2af704f11mr3882804ywl.38.1705327339616;
        Mon, 15 Jan 2024 06:02:19 -0800 (PST)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id a16-20020a0dd810000000b005e847caa1f0sm3972757ywe.29.2024.01.15.06.02.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jan 2024 06:02:18 -0800 (PST)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-5f2aab1c0c5so76364847b3.0;
        Mon, 15 Jan 2024 06:02:18 -0800 (PST)
X-Received: by 2002:a05:690c:fc3:b0:5ed:b2a2:1279 with SMTP id
 dg3-20020a05690c0fc300b005edb2a21279mr3185157ywb.16.1705327338023; Mon, 15
 Jan 2024 06:02:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1704788539.git.ysato@users.sourceforge.jp> <17c6381a733d34e8460fd2979f8b53804e808e04.1704788539.git.ysato@users.sourceforge.jp>
In-Reply-To: <17c6381a733d34e8460fd2979f8b53804e808e04.1704788539.git.ysato@users.sourceforge.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 15 Jan 2024 15:02:06 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVSa0j_npPwcPqH0W2XG8je_A5osy4WjAe0nM_DpC7Ffw@mail.gmail.com>
Message-ID: <CAMuHMdVSa0j_npPwcPqH0W2XG8je_A5osy4WjAe0nM_DpC7Ffw@mail.gmail.com>
Subject: Re: [DO NOT MERGE v6 25/37] dt-bindings: vendor-prefixes: Add iodata
To: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: linux-sh@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Thomas Gleixner <tglx@linutronix.de>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Lee Jones <lee@kernel.org>, 
	Helge Deller <deller@gmx.de>, Heiko Stuebner <heiko@sntech.de>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Chris Morgan <macromorgan@hotmail.com>, 
	Yang Xiwen <forbidden405@foxmail.com>, Sebastian Reichel <sre@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Arnd Bergmann <arnd@arndb.de>, Vlastimil Babka <vbabka@suse.cz>, Hyeonggon Yoo <42.hyeyoo@gmail.com>, 
	David Rientjes <rientjes@google.com>, Baoquan He <bhe@redhat.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Guenter Roeck <linux@roeck-us.net>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, Azeem Shaikh <azeemshaikh38@gmail.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>, 
	Palmer Dabbelt <palmer@rivosinc.com>, Bin Meng <bmeng@tinylab.org>, 
	Jonathan Corbet <corbet@lwn.net>, Jacky Huang <ychuang3@nuvoton.com>, 
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Sam Ravnborg <sam@ravnborg.org>, Sergey Shtylyov <s.shtylyov@omp.ru>, 
	Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, linux-ide@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-pci@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 9, 2024 at 9:24=E2=80=AFAM Yoshinori Sato
<ysato@users.sourceforge.jp> wrote:
> Add IO DATA DEVICE INC.
> https://www.iodata.com/
>
> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>

My
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
on v3 is still valid.

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

