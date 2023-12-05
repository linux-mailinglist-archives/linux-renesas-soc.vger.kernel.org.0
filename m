Return-Path: <linux-renesas-soc+bounces-672-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DECFA804CC6
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Dec 2023 09:40:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A9231F2149D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Dec 2023 08:40:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0340CC8ED;
	Tue,  5 Dec 2023 08:40:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E31110F;
	Tue,  5 Dec 2023 00:40:33 -0800 (PST)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-da077db5145so3100451276.0;
        Tue, 05 Dec 2023 00:40:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701765632; x=1702370432;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yqSpK7I8Zapom4Gpk2QP1VUEOKVdS47utKZoeyLmpT8=;
        b=mmyLTg4VfOOANM2e1mla8a+zJ3L7RLQPRBumnlTRi+9CJa4U/XmcTZE2+JHM4fRGEo
         zlNA6b7eBGGJmLiPKjMozuGq0YVK9zb8y7tU4g+gRIpsQuHhJ7w7hFop9fdoZNH1McY4
         KMMPtoF8hE1Q4IpbyAawbZohXuznbPFoxv1tD8VQR5fR7UEGlvDSaIex1uhBbLtSAJKl
         5tzaoo62Ggn0Bo7TUMmdCA0xVKSNLnfwQvOEaPnWveTr5xRtgbnnkZ8EATDH4F+9x8KO
         GysRIZ/oDSd0GjG7C8ykUPvQ/3vTzxGPDPYJJXEO/ymeg+Zu4ns6ej12NFwGjYcVoIMb
         gXJA==
X-Gm-Message-State: AOJu0Yxk0t1BI9jONkSEsA/9awhFrR/kaPj+TpbItKwdVqaXET7YFpRd
	a1GAAK98umbOAIcpNgEUIueiyrSMKif9XQ==
X-Google-Smtp-Source: AGHT+IFWiGFQn2Z5mw91Jn1YAZFp4NVKA7Ep/XmSQM9FaZjy76cEVVHMFFJKHQCa2wZG+TjlG8ZwWw==
X-Received: by 2002:a25:e7c3:0:b0:db7:dad0:76c3 with SMTP id e186-20020a25e7c3000000b00db7dad076c3mr3212670ybh.95.1701765631942;
        Tue, 05 Dec 2023 00:40:31 -0800 (PST)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id e79-20020a25d352000000b00d89679f6d22sm2918253ybf.64.2023.12.05.00.40.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Dec 2023 00:40:31 -0800 (PST)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-5d3644ca426so51927197b3.1;
        Tue, 05 Dec 2023 00:40:31 -0800 (PST)
X-Received: by 2002:a05:690c:c09:b0:5d8:b575:967b with SMTP id
 cl9-20020a05690c0c0900b005d8b575967bmr2265862ywb.59.1701765631113; Tue, 05
 Dec 2023 00:40:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231204172510.35041-1-biju.das.jz@bp.renesas.com> <20231204172510.35041-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20231204172510.35041-5-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 5 Dec 2023 09:40:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVkyQK3AdRN6V9G_AWCYmUbfRF3q4Y-rBnGfqPbdcJB0A@mail.gmail.com>
Message-ID: <CAMuHMdVkyQK3AdRN6V9G_AWCYmUbfRF3q4Y-rBnGfqPbdcJB0A@mail.gmail.com>
Subject: Re: [PATCH v3.1 4/8] dt-bindings: mfd: dlg,da9063: Update watchdog property
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Support Opensource <support.opensource@diasemi.com>, 
	Steve Twiss <stwiss.opensource@diasemi.com>, devicetree@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

Thanks for your patch!

On Mon, Dec 4, 2023 at 6:25=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.com=
> wrote:
> Update watchdog property by referring to dlg,da9062-watchdog binding file

s/property/child node/?

> and drop its definition from this file.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> v3->v3.1:

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

