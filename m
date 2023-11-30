Return-Path: <linux-renesas-soc+bounces-461-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD207FF242
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Nov 2023 15:38:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E0381C20E65
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Nov 2023 14:38:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 792FB3D380;
	Thu, 30 Nov 2023 14:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CA7EBD;
	Thu, 30 Nov 2023 06:37:59 -0800 (PST)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-5c8c8f731aaso11276947b3.0;
        Thu, 30 Nov 2023 06:37:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701355078; x=1701959878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aOrkeLOnFcH/lieblS+YxRTmFBi/1rCisPZByJbbcEE=;
        b=oZhfExsrY85zkz4ejNP30bUQ3GXoJccC/fDphoz3zCIOYOlgk2LLbnZRWsMLPrv1jY
         VOmNZ0zoF6Xu18+J3GaduyiBlB5tROU6HjWA5u2s7i1D/SUfdsHmQ9rRnFoXysRewGj4
         Xx6g9ka4VMDvTGBrA090yjMLLrBpCa+wZeGgtUL0vWLBVYpklnlTBcWzWOXu9af4+eiz
         R0OLTK8eWPttw4OsK3rrWTwb8KXBQRKjPk6QQ/PaJbDSz8KVjI09jdb5DC7dQm46/c3c
         noZrN22LZg1IhNtvij7Fqxntw5woYtyVbY4S4BA7sdPM3lH7zGFGcEOOpf/nTKPFgL/J
         a4Mg==
X-Gm-Message-State: AOJu0YzP6tKBNWmVatKQrofbq6wrt/67QL3WSe9diHOX7rRPfhge4Mr7
	dt9uYAZq17bB7L7pR/R6Z47Q3QK30k2k2Q==
X-Google-Smtp-Source: AGHT+IGnEoVSQ0aCzHWBfiatDfhIGlOFXoUukrHycNihm62ghkBtWkK1LvwweQVxiqzvjqNzkw9QdQ==
X-Received: by 2002:a0d:d146:0:b0:5cb:c143:cd90 with SMTP id t67-20020a0dd146000000b005cbc143cd90mr23631484ywd.35.1701355078338;
        Thu, 30 Nov 2023 06:37:58 -0800 (PST)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id n190-20020a0dcbc7000000b005ccf7fc2197sm392712ywd.24.2023.11.30.06.37.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Nov 2023 06:37:57 -0800 (PST)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-5d34d85e610so7187287b3.3;
        Thu, 30 Nov 2023 06:37:57 -0800 (PST)
X-Received: by 2002:a05:690c:a90:b0:5cd:fd7c:274f with SMTP id
 ci16-20020a05690c0a9000b005cdfd7c274fmr23354916ywb.26.1701355077508; Thu, 30
 Nov 2023 06:37:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87v89k0yyj.wl-kuninori.morimoto.gx@renesas.com> <87sf4o0yx6.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87sf4o0yx6.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Nov 2023 15:37:46 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW-Laqx+GJcJvWNUG1TfP0QCK8q94dzb8F5b09DNp_M_Q@mail.gmail.com>
Message-ID: <CAMuHMdW-Laqx+GJcJvWNUG1TfP0QCK8q94dzb8F5b09DNp_M_Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] of: add of_get_next_status_child() and makes more
 generic of_get_next
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
> Linux Kernel has of_get_next_available_child().
> Add more generic of_get_next_status_child() to enable to use same
> logic for other status.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Tested-by: Yusuke Goda <yusuke.goda.sx@renesas.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

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

