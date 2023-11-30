Return-Path: <linux-renesas-soc+bounces-462-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 373A77FF3DF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Nov 2023 16:46:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CDD30B20D27
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Nov 2023 15:46:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA2D5537EB;
	Thu, 30 Nov 2023 15:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B750B1B3;
	Thu, 30 Nov 2023 07:46:16 -0800 (PST)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-5cdc0b3526eso8924447b3.1;
        Thu, 30 Nov 2023 07:46:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701359176; x=1701963976;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uyc8PDqvDvm4raGeHSxFbmESGMbvvCvF1tiqW8pVi3U=;
        b=f61fV3PxHetvG5CefnkIJMMMNFbYKEFI52wViwazOQ+q6OR4QRbPOaXYKcrl0rXAnQ
         7HP2/zt0oT9GUKgyLwD35wvF438gjU7yLV5zaD8TLNOjHa/teQ9zRw1QwVFQx0Bt1s8f
         k0BiHOJCzUDoE74eP2DjfMnpg0MHCQemFM5iYsC4N6jmbWb1voayGju3vdFIupks9j9N
         a9w2Tjk7UHDyvyv9q2gKhSSUk2ufvWOrkNrfqKwRpbipPk54ZrIAU8B1KaBWmV/NYsAo
         2kc1mrKVGAwz2uMwlTL3E8rRcvUAXp82A1BFRUIrRLtptZbET4u0GXVOAEc6XKpzkLww
         riMQ==
X-Gm-Message-State: AOJu0YyXvmpOg/vDtnTh08AXWBS/hHJHTYsAtq9y3ftQ4OPqd6tXUUJ9
	25OrmMsIELUJcZ1l1YL1AXHX7ujdCy7ZdQ==
X-Google-Smtp-Source: AGHT+IE+kgR7bu9qnQ9IrHNPQRFEmXN7HFpZZBajmPzoASO0IDKcN7lywfU5d4HsS0KLyWwjLS1jRA==
X-Received: by 2002:a0d:fc45:0:b0:5cb:1b6e:da89 with SMTP id m66-20020a0dfc45000000b005cb1b6eda89mr18488137ywf.12.1701359175651;
        Thu, 30 Nov 2023 07:46:15 -0800 (PST)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id m190-20020a0dfcc7000000b005463e45458bsm429411ywf.123.2023.11.30.07.46.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Nov 2023 07:46:15 -0800 (PST)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-5cce5075bd6so9111217b3.0;
        Thu, 30 Nov 2023 07:46:15 -0800 (PST)
X-Received: by 2002:a05:690c:fcd:b0:5d0:83f7:d37 with SMTP id
 dg13-20020a05690c0fcd00b005d083f70d37mr11681934ywb.9.1701359174799; Thu, 30
 Nov 2023 07:46:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87v89k0yyj.wl-kuninori.morimoto.gx@renesas.com> <87r0k80ywy.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87r0k80ywy.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Nov 2023 16:46:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUkdSusCZuZ70ydd2XSUOJqChNiRpkET7U+4mbYBFnwiw@mail.gmail.com>
Message-ID: <CAMuHMdUkdSusCZuZ70ydd2XSUOJqChNiRpkET7U+4mbYBFnwiw@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] of: add for_each_reserved_child_of_node()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Frank Rowand <frowand.list@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Aymeric Aillet <aymeric.aillet@iot.bzh>, 
	Yusuke Goda <yusuke.goda.sx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2023 at 3:15=E2=80=AFAM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> We would like to use for_each loop for status =3D "reserved" nodes.
> Add for_each_reserved_child_of_node() for it.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Tested-by: Yusuke Goda <yusuke.goda.sx@renesas.com>

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

