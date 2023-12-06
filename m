Return-Path: <linux-renesas-soc+bounces-772-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AD3806E20
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Dec 2023 12:36:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A24511C20EA9
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Dec 2023 11:36:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87D1D31A9C;
	Wed,  6 Dec 2023 11:36:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98DD31A5;
	Wed,  6 Dec 2023 03:36:54 -0800 (PST)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-5d74186170fso42084847b3.3;
        Wed, 06 Dec 2023 03:36:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701862613; x=1702467413;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q7uKADVFo67bwK9oLvgec0xCPe6KYQSC4PqeYTk7K8M=;
        b=wCd7RJ4chb2r3uf8Qosbe1Fmf4ZKLgAjxaa6mPUk+L8lXAy5heN3NmUZpeGpJ1vjIe
         shTz7A944KGjzQ0zkahp//hmyRir6iRYz/+4PV9wSAxxfXgwY66AT39BLT9t1cE1593S
         1Y3ZLzd9UnYhfhX2hGpmGYnuJnbRZwKgd5tclPlr+vKlFe0CkplMNcJ0qn07RMz8pcZg
         B8hRk3GA3nCv+U2/u/Z6ya/WxJHXFiumY5bIECHvLFiZunvjl14Lc6ii2/Vk2U4HaZjV
         y1ALkTFpkfAbKbiVBr5NRESLn3uHDOYc//opzffrbRDKoTUh4xTzBwX7NSHRVt+PR/XS
         WRIw==
X-Gm-Message-State: AOJu0YzwbN5hcFk+p7+0QOgMJ+o3VcQqP/y2TxlpLFhZTJcbD8GP+jpK
	Wkm3Hwz3SUMs0IGNW0x0LzSXIdEz7nMq5A==
X-Google-Smtp-Source: AGHT+IFcRlZyOhU4rv85Tz0KaWEXBAmvUQaQyMJXzGN7o+d/zc8yq6Lrq6M8ZxDlN/A44bkK37MglA==
X-Received: by 2002:a81:af61:0:b0:5d8:96c:690d with SMTP id x33-20020a81af61000000b005d8096c690dmr575820ywj.7.1701862613612;
        Wed, 06 Dec 2023 03:36:53 -0800 (PST)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id r20-20020a0de814000000b005d39c874019sm4620372ywe.66.2023.12.06.03.36.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Dec 2023 03:36:51 -0800 (PST)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5d96efd26f8so24131207b3.2;
        Wed, 06 Dec 2023 03:36:49 -0800 (PST)
X-Received: by 2002:a81:a103:0:b0:5d1:430e:4c2f with SMTP id
 y3-20020a81a103000000b005d1430e4c2fmr594560ywg.42.1701862609581; Wed, 06 Dec
 2023 03:36:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231120084606.4083194-1-claudiu.beznea.uj@bp.renesas.com> <20231120084606.4083194-11-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20231120084606.4083194-11-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Dec 2023 12:36:38 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUe4xNMOqMkRhnD0Ciq19uWoFRVbg0YPzB6-Y2gh6m-1g@mail.gmail.com>
Message-ID: <CAMuHMdUe4xNMOqMkRhnD0Ciq19uWoFRVbg0YPzB6-Y2gh6m-1g@mail.gmail.com>
Subject: Re: [PATCH 10/13] net: ravb: Switch to SYSTEM_SLEEP_PM_OPS()/RUNTIME_PM_OPS()
 and pm_ptr()
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, p.zabel@pengutronix.de, 
	yoshihiro.shimoda.uh@renesas.com, wsa+renesas@sang-engineering.com, 
	biju.das.jz@bp.renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	sergei.shtylyov@cogentembedded.com, mitsuhiro.kimura.kc@renesas.com, 
	masaru.nagai.vx@renesas.com, netdev@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 23, 2023 at 7:15=E2=80=AFAM Claudiu <claudiu.beznea@tuxon.dev> =
wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> SET_SYSTEM_SLEEP_PM_OPS() and SET_RUNTIME_PM_OPS() are deprecated now
> and require __maybe_unused protection against unused function warnings.
> The usage of pm_ptr() and SYSTEM_SLEEP_PM_OPS()/RUNTIME_PM_OPS() allows
> the compiler to see the functions, thus suppressing the warning. Thus
> drop the __maybe_unused markings.
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

