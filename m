Return-Path: <linux-renesas-soc+bounces-7297-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D087392FBA7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jul 2024 15:44:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8689D1F2276D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jul 2024 13:44:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6441816FF2A;
	Fri, 12 Jul 2024 13:44:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E67E143C42;
	Fri, 12 Jul 2024 13:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720791866; cv=none; b=oDyivnh2oQujq7IK80GOZVkdFI8KikTRFVsbYykPUVpImZsOmJg/gMogr29ngOsetstRo56XH1XQnONPK2Jg23H5MKpikW48SZzOYuFFNuBCq8QZHkdKp8LP04kL54U1Cnj5qinNPuQMETSSDVpH+Ibyl2oRKGo8JJzZpPPizA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720791866; c=relaxed/simple;
	bh=mNZZrJQ1BcgwfEMr2him+jJJtRk5W+AL/XnamSR+qv0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jdhejhbH5rVSO6KpNCnNcl1owBqCSCpMwmete3fJZhPeQ8cuEs1nDpfxcYpiPYTj7DZDbObOcF0i4jy0xJEZnQFTsU6R9kI2x1giBQSnSVKyc8F0ePrkd15ShqubUBp8k8aF0Kgj+R5lg535gvx3TsFi5Orazw0sQfUWEtWOSaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e035dc23a21so2073300276.0;
        Fri, 12 Jul 2024 06:44:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720791862; x=1721396662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iRFsX6Omh1AOXFZOKxNNO0aJQIdP6NLCM1kxRp7fxzM=;
        b=L6J0SO95aGwdtqN1TdoTYnjcCGDUzELWPSjU2Q97n2JdmJhre/70AGpa5BtBwo1kRW
         Z9g4cULbNVnOkfgdA2s/kOH4xmNErMrGwUvm2dENgATP/p+ao8mEfVpp2ZMc4zAjRkTz
         wdZfvJoK1j9Smsrdag/jCmS2Rdy6VTOW94jldBe1nCKbFrByEHflT0cZaGep9abmsSC2
         soAs3iGGFtgF2SUlBud/mQhm+9ondhjAQ+ctl+Z2L570qe99d0YJpanheoNkObsGl7ck
         gr2uKeux3vzZrUQjbOr01Wd3Gt5KA3xpr5A+Xwd527r8CYP44o7ysm+2do/ruw1oIgXG
         g/Fg==
X-Forwarded-Encrypted: i=1; AJvYcCW7Idq7DhJAvOkTPeBDHrVQyV9ZSdkOZ87yWuctYL7Y4hDuyXN8GEUGGtM2+HoIbM0dDSv4EBtawmN+WlVRqGWWY9NEz5Tqp66piZzNL161IkLivftCsDoYIjXbw6/paqx8j5bFfnva+lWjsUc=
X-Gm-Message-State: AOJu0YxCYt8YyUEoeMKLUk6UwRI3TkQZQh7wlNnpc5A1HtUrlzoG7xwh
	kJFiVCAYS6nXDQZW9poPcNvpatbawQqX4h8Bs+aauBte6Q7fBgCkxLsv+h0h
X-Google-Smtp-Source: AGHT+IFerKHojhaDSmLDlUUZcv05+hWyIMp0nOfQ5wAdTiRV/GqqiV+pA82/34RhY4GEVBdl3c2Rrw==
X-Received: by 2002:a25:bcc2:0:b0:dff:4a3:2de9 with SMTP id 3f1490d57ef6-e041b0549c2mr13422352276.20.1720791862368;
        Fri, 12 Jul 2024 06:44:22 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e041a9817cbsm1352087276.40.2024.07.12.06.44.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jul 2024 06:44:21 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6519528f44fso18637817b3.1;
        Fri, 12 Jul 2024 06:44:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWoG+0moPZRV6Jg54UZj4CPnthZfAsY2qLmzUNVLKNXZ4CVcyftC/lM3fMQZnMSkRoVzgbBZpmZwql4+Q7ojBPjHECPHA1H+3aQMUOhMj2nTjJT1n9veeoEnqFbfL7ZRqFh1falJcX7HtYZ+q8=
X-Received: by 2002:a81:4324:0:b0:64a:e220:bfbc with SMTP id
 00721157ae682-658ee69ad3amr126778077b3.4.1720791861504; Fri, 12 Jul 2024
 06:44:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240709135152.185042-1-biju.das.jz@bp.renesas.com> <20240709135152.185042-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240709135152.185042-5-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 12 Jul 2024 15:44:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVgnSwb5FwdgNZ1O2NtYGiY+9j1oC_2YTTUYq0W8+PoXQ@mail.gmail.com>
Message-ID: <CAMuHMdVgnSwb5FwdgNZ1O2NtYGiY+9j1oC_2YTTUYq0W8+PoXQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] clk: renesas: r9a07g043: Add LCDC clock and reset entries
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 9, 2024 at 3:52=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.com=
> wrote:
> Add LCDC clock and reset entries to CPG driver.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.12.

> --- a/drivers/clk/renesas/r9a07g043-cpg.c
> +++ b/drivers/clk/renesas/r9a07g043-cpg.c
> @@ -209,6 +214,12 @@ static const struct rzg2l_mod_clk r9a07g043_mod_clks=
[] =3D {
>                                 0x564, 2),
>         DEF_MOD("cru_aclk",     R9A07G043_CRU_ACLK, R9A07G043_CLK_M0,
>                                 0x564, 3),
> +       DEF_COUPLED("lcdc_clka", R9A07G043_LCDC_CLK_A, R9A07G043_CLK_M0,
> +                               0x56c, 0),
> +       DEF_COUPLED("lcdc_clkp", R9A07G043_LCDC_CLK_P, R9A07G043_CLK_ZT,
> +                               0x56c, 0),
> +       DEF_MOD("lcdc_clkd",    R9A07G043_LCDC_CLK_D, R9A07G043_CLK_M3,
> +                               0x56c, 1),

With the above clock names changed to "lcdc_clk_[apd]" to match
the clock definitions.

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

