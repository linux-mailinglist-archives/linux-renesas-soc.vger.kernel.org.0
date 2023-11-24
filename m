Return-Path: <linux-renesas-soc+bounces-225-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8067F6DA9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Nov 2023 09:08:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ABCB81C20B35
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Nov 2023 08:08:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 179B87465;
	Fri, 24 Nov 2023 08:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64568D6E;
	Fri, 24 Nov 2023 00:08:03 -0800 (PST)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-da37522a363so1541594276.0;
        Fri, 24 Nov 2023 00:08:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700813282; x=1701418082;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HdqMHP0CicQk6etm9k8xzNIMQhbVBnmQltX+GSQmRjU=;
        b=odnRkzT0kwk6gwYuF75BSAvOKwaJmy8up8jV0JhPcncOiha2tw9cGsquNnK3S7qwY/
         SDkBlF+HOTSskmDKOWNjqa9JmXaabwM8YgQZBhhzEhplcN7uuTGQeSHoY9hUZDXceBQA
         /xS9WBIC3n1z1GfJoNBTHNOaxmtwxIn95Jpwmj9OAb2tr2AKvaKOlSA5vU33gDuOexTy
         zlskcziXaneTSzknTxKWFlD+uBChqWtK3HZqOUFHWDBI6zCLDuanAaE3FTAmmtI+qxTY
         SEJBquG7w1huDUwV0DIsCJ8DBBm6Hd69/+y0G5qsSqlXbg6wFDkXEyzfi0UTDwwRDw6O
         0Zvg==
X-Gm-Message-State: AOJu0YwZX14jJPicPQ4LpshYF3dIxwOUmWaEK/EgPhJkPHw1F4K75wNi
	iMoq4weEKVqTW8H+01n4i0r8Se+sxil0PA==
X-Google-Smtp-Source: AGHT+IGx2il7Ohv+rTrqbdNMIxfqH0O1Q/RAa6QA9BPuR8yYsytmIIJuU3dc9qnS16rQ+a/4LXNWvA==
X-Received: by 2002:a5b:201:0:b0:d9a:3bee:2eeb with SMTP id z1-20020a5b0201000000b00d9a3bee2eebmr1540118ybl.60.1700813282405;
        Fri, 24 Nov 2023 00:08:02 -0800 (PST)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id o21-20020a254115000000b00d7e96c6eaf5sm758671yba.46.2023.11.24.00.08.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Nov 2023 00:08:01 -0800 (PST)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-5cd2f1a198cso13885957b3.0;
        Fri, 24 Nov 2023 00:08:01 -0800 (PST)
X-Received: by 2002:a0d:d54b:0:b0:5c9:d870:cb18 with SMTP id
 x72-20020a0dd54b000000b005c9d870cb18mr1741216ywd.21.1700813280818; Fri, 24
 Nov 2023 00:08:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231120084606.4083194-1-claudiu.beznea.uj@bp.renesas.com> <20231120084606.4083194-10-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20231120084606.4083194-10-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Nov 2023 09:07:47 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUu1NTrsk9=zBHeDYK0=1gaaO6FodFBwQaZCAwNW4DhuQ@mail.gmail.com>
Message-ID: <CAMuHMdUu1NTrsk9=zBHeDYK0=1gaaO6FodFBwQaZCAwNW4DhuQ@mail.gmail.com>
Subject: Re: [PATCH 09/13] net: ravb: Make reset controller support mandatory
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, p.zabel@pengutronix.de, 
	yoshihiro.shimoda.uh@renesas.com, geert+renesas@glider.be, 
	wsa+renesas@sang-engineering.com, biju.das.jz@bp.renesas.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, sergei.shtylyov@cogentembedded.com, 
	mitsuhiro.kimura.kc@renesas.com, masaru.nagai.vx@renesas.com, 
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 24, 2023 at 7:20=E2=80=AFAM Claudiu <claudiu.beznea@tuxon.dev> =
wrote:
>
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> On RZ/G3S SoC the reset controller is mandatory for the IP to work.
> The device tree binding documentation for ravb driver specifies that the
> resets are mandatory. Based on this make the resets mandatory also in
> driver for all ravb devices.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

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

