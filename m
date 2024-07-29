Return-Path: <linux-renesas-soc+bounces-7597-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA07D93FD8F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jul 2024 20:40:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 53FC21F22F57
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jul 2024 18:40:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C69CD189F55;
	Mon, 29 Jul 2024 18:39:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A971E187325
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jul 2024 18:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722278369; cv=none; b=f6D9lMApb9CFnv0Enc3D0qXmH9Qztyf/Jnp/OVxl0ZRlsPcaxnEmYzl/bevPLizrDJ9Epq2UBsv09d7W5lPvCSH9J1ar/Mb2aGBOPZ+ppJyi7eJfjKFo7/1vzL/IZIbl/jAH5KPg54OWcIe7c9P99HHhZASl9ONRjU8+DjxYfaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722278369; c=relaxed/simple;
	bh=CNeYktxidb6I7mzhw0CtiJz7A9LWFHTtcEk44Ap0P5Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m06Hz2RBONr1gyeqjl4iOaDMdAaVyjLzfdXPxZLrWI2GB+LTxl1kQeC1glx94pl/xmuFC7OAF6y9C0SVD3G1bH1PmPAp/4K3OnBXoBcrYCJWjtrVrZ21FqzAtjXJuUZMx8mFCByjaVwhmqHLoE9esD/DRxN93nPO6XLKuMoQxAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6512866fa87so17528687b3.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jul 2024 11:39:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722278366; x=1722883166;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M3hIaXK9mEDslNVqQoCYWTAqbsi+FTVOeWMbojRoF0c=;
        b=FIpyYYS4S0H9ti0HgU6iCdc22XE8w+2U1blh+0j9fKAgctNhimtviZEm7OL4AF6Om+
         8bHcbJCcxKXF/hMbhvjRO5FVD5a4lOE1/GCUiDgXI8kEh4+28NP1L4/frhegp5yyHk85
         vOgnEa2fdUGbebDs30Q2qIQZ+w71jhaauOgJM9RjJwF8dem/fOnkOMuN3Iksr67kdQ3n
         yUgZpJRAqWu7820aGHMY0X8oi5Zwbda0rNZi7BVZAQ3ZiWQHSgbOVJqnWyFAnrk4bcrK
         aV6VdMR8gcZCad4dSCpdQ6mz9yQ4MEY4SB68uRry9NsRgkR3bVztxPRDfk6mWGmlDokb
         Q1Xw==
X-Gm-Message-State: AOJu0YxwtQw6JsW13S8r8GBWtAKMc5942c4lv6fiUA2tZxcioYTpCQzE
	ySTLvCrfxiP5tctmkiCjC/osdGJROqrAvHuG5sNg3rk0fu6dUfqz3Cxus6/4
X-Google-Smtp-Source: AGHT+IEOUmifboFH3UXixquXQjavvyQpM/6oEY9tbNlj22S93z9vmbMI75hkcMCLJxJuOvQYYrZ4Pg==
X-Received: by 2002:a05:690c:890:b0:64b:f67:8fe6 with SMTP id 00721157ae682-67a090a6beamr72355017b3.35.1722278366103;
        Mon, 29 Jul 2024 11:39:26 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-67566dd928dsm21930157b3.15.2024.07.29.11.39.25
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jul 2024 11:39:25 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-663dd13c0bbso20691227b3.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jul 2024 11:39:25 -0700 (PDT)
X-Received: by 2002:a05:690c:c07:b0:62c:c5ea:407 with SMTP id
 00721157ae682-67a090a6bf7mr92209807b3.29.1722278365506; Mon, 29 Jul 2024
 11:39:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240725194906.14644-8-wsa+renesas@sang-engineering.com> <20240725194906.14644-10-wsa+renesas@sang-engineering.com>
In-Reply-To: <20240725194906.14644-10-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Jul 2024 20:39:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVncvZT5q=eAdmjQqdHh-n4f4EJ+=r=JzFDr4cbHvSqWw@mail.gmail.com>
Message-ID: <CAMuHMdVncvZT5q=eAdmjQqdHh-n4f4EJ+=r=JzFDr4cbHvSqWw@mail.gmail.com>
Subject: Re: [PATCH RFT 2/6] clk: renesas: r8a779h0: Add TPU clock
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Cong Dang <cong.dang.xn@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 25, 2024 at 9:49=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> From: Cong Dang <cong.dang.xn@renesas.com>
>
> Add the module clock used by the 16-Bit Timer Pulse Unit (TPU) on the
> Renesas R-Car V4M (R8A779H0) SoC.
>
> Signed-off-by: Cong Dang <cong.dang.xn@renesas.com>
> [wsa: rebased]
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.12.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

