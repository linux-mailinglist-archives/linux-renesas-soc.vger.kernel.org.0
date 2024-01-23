Return-Path: <linux-renesas-soc+bounces-1679-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E34A838923
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jan 2024 09:36:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AF6E4B252E2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jan 2024 08:36:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CB7158ADA;
	Tue, 23 Jan 2024 08:35:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62AA356B9C;
	Tue, 23 Jan 2024 08:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705998900; cv=none; b=hIP3aMQgWfXtychIaaBp9WTqiLMLXQFJhVamfWcTXGZU8LvOUTj6XjX0tyncsfTF3TKDL2BLpEnG9uhm5m2lj1XixEYPYFb5WKdn2Q268Rwnv0gHfevx2vPDkrSNAcy/DKl2TkUyPKqBxGtwvuFuDp8ROxCRuSe95yZ1Lu7jAaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705998900; c=relaxed/simple;
	bh=1ejOsp0WyLj81Cuzanl5KQ82KBzjBh4EzhBYQwtGcj0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZXb8Tl2/LhgWPhp+w9hrVLWC8eRC4uzGcJhq/CTtd+PcobSZXDETxel9n6odfoIcWsEDdT8SvHGUcPrF46CGX7QgzodHhmbOnHE7u5PQL6IWOPahc1Fa+H2IShHl7+42iHemEFrcXFboh39RKZtlP3hadXWt5jjhaxgR9Kt4myE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5ffee6e8770so19641757b3.0;
        Tue, 23 Jan 2024 00:34:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705998897; x=1706603697;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ye4ouHieVhEIcWhf8tZrStIArLF/Vpv3d73AE9gbFmQ=;
        b=hJHW/AzLrUwfs+E486HIcTnyvPga1ZwcM0S50IpTe2e/3/DOrXC9SA0QJphUSr4It0
         FG1p/H32tERn5qXe6G8hNq6Q0fKwYrdjdtz/o+K46OeiTLyZV/SXd8FywWLHDcDFPXlv
         cIOf3DCqm+bDlQbMQZjqXu1Sb/Wz02yjH6EJnIxaRH3ynSIzqY52b8QAsFftzkrTuY0z
         MwnxRPasOfvL/12t4T38HxA9+t44KWgPtAjAE05EPeXkOyesYUgjx5W+Jj4794kn9mP/
         Jhf3Ajvk/xl/PjYZAunNg2uUqUgqywwMoFy/kJLggUyq0jzIuDH1NYOhGzX6ZOdevxZ6
         wrQg==
X-Gm-Message-State: AOJu0YwAenH1tiqnEVk4TctdvA+BO4kUhsiYL2LUvXUFdRKHIsXT9QmT
	ODhfhXofsp7VMHwFyiUzc7lohzNYlFXc0H7Swyhmo1cWKAv2r802DimPTLBOT4Q=
X-Google-Smtp-Source: AGHT+IG03rJTTfo2tGosWcRva4v57CnH6WPxt6sCThCChvfe1VBon8kqQsykSWBlqQm/iVig1n3SJw==
X-Received: by 2002:a0d:ddd7:0:b0:5ff:84cc:7e8b with SMTP id g206-20020a0dddd7000000b005ff84cc7e8bmr4010039ywe.80.1705998897282;
        Tue, 23 Jan 2024 00:34:57 -0800 (PST)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id m18-20020a819c12000000b0060015b8057esm819235ywa.68.2024.01.23.00.34.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jan 2024 00:34:57 -0800 (PST)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dc250cff65aso2416113276.1;
        Tue, 23 Jan 2024 00:34:57 -0800 (PST)
X-Received: by 2002:a25:9103:0:b0:dc2:5436:7def with SMTP id
 v3-20020a259103000000b00dc254367defmr3111483ybl.42.1705998896617; Tue, 23 Jan
 2024 00:34:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <e98a6e47ebecc44fa41de6d88b4ed20c6efbd177.1705931322.git.geert+renesas@glider.be>
 <20240122152849.GF4126432@ragnatech.se>
In-Reply-To: <20240122152849.GF4126432@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 23 Jan 2024 09:34:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVx80ZH6F2q14-pijCrUBQZvqaw3oRfxKiiBz1w9WwTHQ@mail.gmail.com>
Message-ID: <CAMuHMdVx80ZH6F2q14-pijCrUBQZvqaw3oRfxKiiBz1w9WwTHQ@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: mstp: Remove obsolete clkdev registration
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Mon, Jan 22, 2024 at 4:28=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund@ragnatech.se> wrote:
> On 2024-01-22 14:49:45 +0100, Geert Uytterhoeven wrote:
> > After the DT conversion of SH-Mobile and Armadillo-800-EVA display
> > support, all devices are registered from DT, so we can remove the
> > registration of clkdevs.
> >
> > Add the missing #include <linux/slab.h>, which was included implicitly
> > through <linux/clkdev.h> before.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Reviewed-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech

Thanks!

> > ---
> > Patch written in 2015 ;-)
>
> I scratch my head reading some of these patches, I have seen some of
> them before, but could not figure out when.

Probably it reminds you of "[PATCH/RFC 3/3] clk: renesas: emev2:
Remove obsolete clkdev registration"?
https://lore.kernel.org/all/f54a30d7a9e2aa075d462db701a60b0b59c6ad0b.168632=
5857.git.geert+renesas@glider.be

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

