Return-Path: <linux-renesas-soc+bounces-670-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F68804C62
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Dec 2023 09:30:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 56F922816D0
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Dec 2023 08:30:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00B113C480;
	Tue,  5 Dec 2023 08:30:31 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDF5AC0;
	Tue,  5 Dec 2023 00:30:27 -0800 (PST)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-5d3758fdd2eso51194427b3.0;
        Tue, 05 Dec 2023 00:30:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701765027; x=1702369827;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MXcsyir3a7SBDDGCoBHp70/mRJJIxewAzXRQ0oT/0fw=;
        b=l3pCq2P8xUY6gIW1kjxSpIiPmIb4aYYEhL0j+1vQS/8WFwq9Ql3SnPKcjHIPtElXVG
         IP1F0NnojmJAYQbIN51KWy32BKctddu6zb3fM31KQr1UV5KpV420xN2HaWARF/Zxd51+
         I+d0VbfOqyaL5zASzAYCeEGtyCOsZmG2CsScH/oGsMne1hzUILBjG5rRxaPUWVM6Hfka
         GWJG8rSp2TNLrVU6WvwtBeCIZGWs5knITShR4qwLJQAQodYS1apAKj1q6hEq8rTxrx5f
         cUSOAuN94xvrilcU2og8QTvlPEsnn6kt07jH540PiiBpx25TctHISbseLNtlenBhAjM1
         r+rA==
X-Gm-Message-State: AOJu0YwbVvYVku819vkYzjjBydlhATFSYyfzKzLZrEq2sLbyD9CvqaX4
	qIuHVKuPbIn6ct3GmbBbzrbP9gBBC6NWcw==
X-Google-Smtp-Source: AGHT+IEuC9FmKfND1IgC/oooQgncgGNkX0d8XoCJWWzSWhoRO/096JYs4Uzj6jN8urGaGOEuJxnD4g==
X-Received: by 2002:a05:6902:248:b0:db7:dad0:76b5 with SMTP id k8-20020a056902024800b00db7dad076b5mr3316558ybs.81.1701765026994;
        Tue, 05 Dec 2023 00:30:26 -0800 (PST)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id j129-20020a25d287000000b00d7ba4c5e31fsm2937054ybg.39.2023.12.05.00.30.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Dec 2023 00:30:26 -0800 (PST)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-5d3644ca426so51844327b3.1;
        Tue, 05 Dec 2023 00:30:26 -0800 (PST)
X-Received: by 2002:a25:ca4f:0:b0:db7:dad0:76b7 with SMTP id
 a76-20020a25ca4f000000b00db7dad076b7mr3257272ybg.83.1701765025931; Tue, 05
 Dec 2023 00:30:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231204172510.35041-1-biju.das.jz@bp.renesas.com> <20231204172510.35041-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20231204172510.35041-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 5 Dec 2023 09:30:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW0VU8f2oRVuS0WZQazrF__rhGebOV_V7LO4uJKwecDLA@mail.gmail.com>
Message-ID: <CAMuHMdW0VU8f2oRVuS0WZQazrF__rhGebOV_V7LO4uJKwecDLA@mail.gmail.com>
Subject: Re: [PATCH v3.1 1/8] dt-bindings: mfd: da9062: Update watchdog description
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Support Opensource <support.opensource@diasemi.com>, devicetree@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 4, 2023 at 6:25=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.com=
> wrote:
> Update watchdog description by referring to dlg,da9062-watchdog binding
> file.
>
> Update MAINTAINERS entries.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v3.1:
>  Merged with patch#8 from v2.

Fixes: bd888a4377ae1030 ("dt-bindings: watchdog: da9062-wdt: convert
txt to yaml")
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

