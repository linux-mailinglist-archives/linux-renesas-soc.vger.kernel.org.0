Return-Path: <linux-renesas-soc+bounces-732-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC748056FB
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Dec 2023 15:16:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F261FB20A54
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Dec 2023 14:16:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9A7C5FF19;
	Tue,  5 Dec 2023 14:16:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF597CA;
	Tue,  5 Dec 2023 06:16:36 -0800 (PST)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-5c08c47c055so62638637b3.1;
        Tue, 05 Dec 2023 06:16:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701785796; x=1702390596;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=toeXBGSxtCl/y9uazlZXk7ynXJbfYUPNHJ5USUpIKxk=;
        b=es07HLVysw0eA7HwUwdBNx/ffE6o4jsFhJXOyh5e4tnkO4dwFj4q8qoDBRMyACixB9
         1f4v1x8lH4ZBqNNPvKyKOfMuMn7GWDZ71rnj2CX5THcVJv5BmEwCcYWB1SDckwETUDMa
         xUCKp7ZKg8qdPuj1dLzBS5x19fLzClnYcMFAQUJ6lxsGYBl8qjtLm+ke9AZR9+XZqNNA
         PtvwlK7Dkt8AeQmSgOycACkSzNIu0AviPwSGDpErFUsVyptcQFIkfB9sZM9iDAa/0KiM
         k6J633WqxNNsf006MQ/WCt2HlTtXxSscQ52IuKk7p+czAXL+4Tj2rMS7cJRaljT75i2K
         WnHA==
X-Gm-Message-State: AOJu0YwAg+esHyv4lKrnQ4sLzH66Kt6WWiZnwdLVh2UMeheC5u68Mlnx
	D2MHtghQt4pxrIvC3lT3LMgLq0xzaXPxUw==
X-Google-Smtp-Source: AGHT+IFT3HM12B6ao8hkxNlQLDPINn4qWtFzil3qh0yXHlp0pZbT7IIDhAZ7bQcptQ1Jh+r1bW7y3Q==
X-Received: by 2002:a81:ac62:0:b0:5d7:1940:53d5 with SMTP id z34-20020a81ac62000000b005d7194053d5mr4136111ywj.77.1701785795839;
        Tue, 05 Dec 2023 06:16:35 -0800 (PST)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id x127-20020a818785000000b0059bcadded9dsm4158934ywf.116.2023.12.05.06.16.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Dec 2023 06:16:35 -0800 (PST)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-db54611b920so3705367276.3;
        Tue, 05 Dec 2023 06:16:35 -0800 (PST)
X-Received: by 2002:a25:15c9:0:b0:d9a:c218:817c with SMTP id
 192-20020a2515c9000000b00d9ac218817cmr3694514ybv.4.1701785795466; Tue, 05 Dec
 2023 06:16:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1701778038.git.u.kleine-koenig@pengutronix.de> <639e796b36815a219ff1172cc758ba7378211d74.1701778038.git.u.kleine-koenig@pengutronix.de>
In-Reply-To: <639e796b36815a219ff1172cc758ba7378211d74.1701778038.git.u.kleine-koenig@pengutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 5 Dec 2023 15:16:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVEvGb1u_0M3cBjk69c_Lrp6QAR77YEwuHKV295G4Ueyg@mail.gmail.com>
Message-ID: <CAMuHMdVEvGb1u_0M3cBjk69c_Lrp6QAR77YEwuHKV295G4Ueyg@mail.gmail.com>
Subject: Re: [PATCH 2/8] regulator: bd9571mwv: Convert to platform remove
 callback returning void
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Marek Vasut <marek.vasut+renesas@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 5, 2023 at 1:26=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
>
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
>
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

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

