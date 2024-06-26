Return-Path: <linux-renesas-soc+bounces-6805-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAB591821C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jun 2024 15:18:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B8531F24F30
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jun 2024 13:18:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89EF618E10;
	Wed, 26 Jun 2024 13:15:10 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B93C33EE
	for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Jun 2024 13:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719407710; cv=none; b=uN59RyCTzqap9ZljJ+nAvzpDHT7sWS8OZdHderaYkqfgvjv2f0iwi+Gg7EPa7/3YnXTdZ219OBAlTtxRJBe5gS7K8b7utOdI6cPWqdvw2azlncyY+krJShnYDUHAg4fT4dxt2gqfiIsxVZ+7akv2wapygACzm4P1y8BQWijUMgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719407710; c=relaxed/simple;
	bh=eZwF15xRJS9E5D/Sx/3yB423yqrNXJ08hHTxU1TLE+4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qILpkYHbrHtDTxDxgXhTBEcjwpOyi7iU6wlI9Ru6dpsB/rr7wZpXJGWKhvvZxDb0rgNfRFyJ3P+fdG0U2SiISkCycEeYsfn1qCKnpmis71Mkw1JySFvVsISI4oT2pSpDB1Jav+KxNW7XRIUKPj6pxZRH9QlgSPGhUCo/nD8E+LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e02c4983bfaso6665345276.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Jun 2024 06:15:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719407706; x=1720012506;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kfQSSExrvIsNXm7BeP/uQeBaXNzVtE2ET/tqdk72fhI=;
        b=FTrjSLCbKKDtDPbmqR/jpjtMU4O4q7KeH2XyrG/hj71y+S6ITBCZbmy8pFoQE2c/oK
         vgwOfOvvizogAYlYHryPkn64pPAnG6NYpwDU6xHlYonOTG2ob4vF0y/HgcVaeNs/dV+t
         h/9i4a0Tq0KFW7xG0BeXGt3RBgcWOlKri34WdWao+nJMfx0igLXD1syht3CVSMSotpoY
         SSB3+ICkxz89+V4tTreX7pMx6sEmo6uAJ9Ag3up9NEKBiN7ggVSX/bh+VcPFl4fcRGJe
         WDRgCUDbYKeil8TR+IeWFNMxUVtxL6D83Hc2CcStyI/IhcgzvHK3ZiVs0XhVQ4CMN1nq
         GPag==
X-Gm-Message-State: AOJu0YwMh4Ifd0gLFv104GT7RQsy1xPPhZpGspw/ssay22Cb/RNqQa+V
	fZDnp0a57g3SVJ9UlacO1id9AsVRu1N5VqJerLdU3B0tFFq63prM20YFjtHg
X-Google-Smtp-Source: AGHT+IExlbZIzZ4dPixgE+VTSFXL6GBZ3ff8dQbZ7PZGfUA+AAy8rY+Q9D4Uanft5gZrQvoZv2r4tA==
X-Received: by 2002:a25:7a07:0:b0:dfb:96e:1f15 with SMTP id 3f1490d57ef6-e030107c9b8mr10267172276.42.1719407706207;
        Wed, 26 Jun 2024 06:15:06 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e02e65dbb2asm4388054276.61.2024.06.26.06.15.05
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jun 2024 06:15:06 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-648b16e5e47so3235527b3.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Jun 2024 06:15:05 -0700 (PDT)
X-Received: by 2002:a81:8453:0:b0:645:ea65:4bf4 with SMTP id
 00721157ae682-645ea654faamr65655027b3.22.1719407705516; Wed, 26 Jun 2024
 06:15:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87jzifkxi4.wl-kuninori.morimoto.gx@renesas.com> <87frt3kxew.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87frt3kxew.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 26 Jun 2024 15:14:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVkRjrxv4ohJ6FoEw+rAT4vFwo-yL-YAkgL4eBgzZNUsw@mail.gmail.com>
Message-ID: <CAMuHMdVkRjrxv4ohJ6FoEw+rAT4vFwo-yL-YAkgL4eBgzZNUsw@mail.gmail.com>
Subject: Re: [PATCH 2/6] arm64: dts: renesas: r8a779g0: tidyup sound DT settings
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org, Khanh Le <khanh.le.xr@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 24, 2024 at 2:16=E2=80=AFAM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> R8A779G0 (V4H) supports only 1 AUDIO_CLKOUT and 1 SSI,
> thus, #clock-cells / #sound-dai-cells are both fixed 0.
> (#sound-dai-cells is needed for Simple-Audio-Card, not needed for
> Audio-Graph-Card). This patch fixup it.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.11.

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

