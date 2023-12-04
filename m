Return-Path: <linux-renesas-soc+bounces-619-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF728033B4
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Dec 2023 14:00:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BB00FB2081B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Dec 2023 13:00:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89472249F0;
	Mon,  4 Dec 2023 13:00:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D30A103
	for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Dec 2023 05:00:32 -0800 (PST)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-db539f21712so2279043276.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Dec 2023 05:00:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701694831; x=1702299631;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B4uLjxMfCZPiVGwr1ETNjC9eJCAWm609taKdtXgu+uw=;
        b=nNgzQeKa+/Oxv8KdvjFh5GhfgnJg4E6noLQDT/mD3PhRKRBUGaXQgJwcriMPznkJ9N
         AXhVAdwGUHAc4E/o1DDCkJpXAfgZi+GYZPQpyiFm4Ufu0aE5RRi7iV/DtAmOkb69l8Ig
         ltg1jr1Z3BbYlUgUyeJ63zET8EJ5EGuLyLegn3mxQ5t4lJB4rACROyQ+4zhVUU7S8Noy
         0T6dC8EwR97KnX/KEmPOKVvPgsxi2pou3o40wUD2EiPwi2ZH+ri3S4LX+IGsroY091v+
         kez+T5AufUlDL2wUrnGy4Xzze2aqNT9/BywEh6qXk3Dz7kJ5Ra05b9C4cJGwgFaTdOnF
         HMDQ==
X-Gm-Message-State: AOJu0Yxz0siBRYHEQQaA3wmKvDxYrP+wDgnKT6JyDQVXZuYf40oHS3go
	Ee6rrFVesAlWszKURGqE7KoKcdl9UYbcRQ==
X-Google-Smtp-Source: AGHT+IFWk+skaSI+MHKB5BNdbmGzMKFZ2NxVUuej7FMf7vCEF+ToV7e0LZ3quJDoRZgs3h3Xp21oTw==
X-Received: by 2002:a25:bc13:0:b0:db7:daec:ec62 with SMTP id i19-20020a25bc13000000b00db7daecec62mr1818640ybh.41.1701694830965;
        Mon, 04 Dec 2023 05:00:30 -0800 (PST)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id h21-20020a816c15000000b005d75bce5836sm1739168ywc.28.2023.12.04.05.00.28
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Dec 2023 05:00:28 -0800 (PST)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5d77a1163faso12242117b3.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Dec 2023 05:00:28 -0800 (PST)
X-Received: by 2002:a05:690c:c0d:b0:5d7:e2b8:bcca with SMTP id
 cl13-20020a05690c0c0d00b005d7e2b8bccamr1589995ywb.18.1701694828558; Mon, 04
 Dec 2023 05:00:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231204124507.124758-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20231204124507.124758-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 4 Dec 2023 14:00:17 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWE89yQEqJA4r0VMUAdqr=GVZ4YFP4XpkBaVTsq5RfD9w@mail.gmail.com>
Message-ID: <CAMuHMdWE89yQEqJA4r0VMUAdqr=GVZ4YFP4XpkBaVTsq5RfD9w@mail.gmail.com>
Subject: Re: [PATCH] mfd: da9062: Simplify obtaining I2C match data
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Lee Jones <lee@kernel.org>, Support Opensource <support.opensource@diasemi.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 4, 2023 at 1:45=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.com=
> wrote:
> Simplify probe() by replacing of_device_get_match_data() and ID lookup fo=
r
> retrieving match data by i2c_get_match_data().
>
> Some minor cleanups:
>  * Remove the trailing comma in the terminator entry for the ID
>    table making code robust against (theoretical) misrebases or other
>    similar things where the new entry goes _after_ the termination withou=
t
>    the compiler noticing.
>  * Move OF table near to the user.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

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

