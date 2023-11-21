Return-Path: <linux-renesas-soc+bounces-22-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 836C97F2812
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Nov 2023 09:53:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B4B541C20E9B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Nov 2023 08:53:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1D51200D8;
	Tue, 21 Nov 2023 08:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBBB8CA;
	Tue, 21 Nov 2023 00:52:58 -0800 (PST)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-5cb4ee00da1so7227477b3.0;
        Tue, 21 Nov 2023 00:52:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700556778; x=1701161578;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Wl8R8fAKK4t9eUTJXFpP2qg1V1dEIIiPBOvyvaebwA=;
        b=c/z3c4HaRlBeR3oLtiCbOdO8msml+DiW/DwS4YlPkJJU0f8fnsJj8Vc2ke5S2wljbJ
         /+fHkihuQRBoOgfcRiUsB5NSnoDVQFPFq9CQa8fMGU+qQzX5TBZLvaAjJZypnm5V8DQQ
         t3v9209XWlh1sGP2FG/HRfHhZsqPjLcHUi/pxrZ9P4eFjJt8rMDut1LcQ6MdQjr3G+Vb
         rh2fgG7MTN5yZko03zS8OSOQ4G6pRyY+Vjc3jhyoWLOBAhsJRinxowZMRr0u39eEnAsO
         jMH6VVJXRFlbeN8iqDmHBnw5QgvxaFD512w/kUGQVkaGWs2zFpsbQZfuX619y7AMIU9r
         Q+cg==
X-Gm-Message-State: AOJu0YxJNIGGvg/b9ci0Ne/jnFrY8Y/y8BPRU3bYgqlAMjKL0+CWB7zi
	ngTDrZ6ep1SxQacmPfj1/qLoP3ooOINjxN6N
X-Google-Smtp-Source: AGHT+IHf6VmdIQ5ic0cz7rev2tDYiNkR9/yC7bvnuarbHai0QxB+3WZ3jbTKkO9hMKsEozSdM2PmeA==
X-Received: by 2002:a0d:e613:0:b0:5a7:fcaf:c1c0 with SMTP id p19-20020a0de613000000b005a7fcafc1c0mr1600971ywe.8.1700556777889;
        Tue, 21 Nov 2023 00:52:57 -0800 (PST)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id gb1-20020a05690c408100b005ca2883b6c6sm1355731ywb.10.2023.11.21.00.52.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 00:52:57 -0800 (PST)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-da30fd994fdso4994251276.1;
        Tue, 21 Nov 2023 00:52:57 -0800 (PST)
X-Received: by 2002:a25:80cf:0:b0:da3:b0f0:61f5 with SMTP id
 c15-20020a2580cf000000b00da3b0f061f5mr1506537ybm.6.1700556777324; Tue, 21 Nov
 2023 00:52:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231022181910.898040-1-niklas.soderlund+renesas@ragnatech.se> <20231022181910.898040-3-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20231022181910.898040-3-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 21 Nov 2023 09:52:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX3h_EV+Py3K2wU4TJi7G=a2pGGCA4UWtHTuP5rS2b50Q@mail.gmail.com>
Message-ID: <CAMuHMdX3h_EV+Py3K2wU4TJi7G=a2pGGCA4UWtHTuP5rS2b50Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: renesas: draak: Move HDMI bus
 properties to correct node
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 22, 2023 at 8:19=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> The bus properties for HDMI capture are defined on the incorrect node
> for the VIN driver to be able to consume them. They are described on the
> HDMI video source but they should be described on the VIN capture node,
> move them.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.8.

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

