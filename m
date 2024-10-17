Return-Path: <linux-renesas-soc+bounces-9812-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4CE9A1D89
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Oct 2024 10:49:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8EF61F279F4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Oct 2024 08:49:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA8571D1724;
	Thu, 17 Oct 2024 08:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F1jQSif/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930F61C07C7;
	Thu, 17 Oct 2024 08:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729154941; cv=none; b=KFxZgnvGzQ/8J5WyOFmf6oyKg3Hk1Ira4xr6E0rV7o7I/lALqZRSWj2rD+826eSpucdsidyiDd1mRRF4cJvAr5fwkbjmekWCAO2t1+4ZwZTHegDoh8Uur2ijmGnp4/YeCJVW918vvvJF3RTkMnuZ9ws3kOk34oV/dQ068uKAkrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729154941; c=relaxed/simple;
	bh=z3rc0arNo6EoJheplPvlJnqac7TJz2LgVFDCyu24lb0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bz+3Rmqwu4hfny1BGGgWB35BrCOj0qNfVEVe8x/EJxB166pcA51kMLAoLVGNDcs5G4hmwIRsCqjsAUDWI2a0Mqs0dZQn1SrJgtS9AGe07JWfauj9wgLdMDgEp+Gq0BTDYN+j8Od+ZP3eQgnhaZrmM/IWl9K6vvvwgIgjro2rFcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F1jQSif/; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-50d479aef64so262496e0c.0;
        Thu, 17 Oct 2024 01:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729154937; x=1729759737; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z3rc0arNo6EoJheplPvlJnqac7TJz2LgVFDCyu24lb0=;
        b=F1jQSif/PorVcM8qz8W3jEj9OSCqxRrxRbIDgkdlfWTJ9K1rivuL5CdqZoV2OgfqGD
         puHXVFBCH3aO7Pd0dX/eXFLqzHR32Erkpclb3mcpCVupuVel+wqwuVskPwBujtc2IlI6
         5zjsY7DHxxn1kqAGkBdqkF6cCVFjkTAEqxHEX3j+moO/TVHVe4BNHelMfxkx0dnGul4J
         tSSt1bI+2ekuAKm8J90fN0IyxMqXql22nA8Kcz+vwStSxtLRaNonRvcbkOgHZM5VNerf
         Kq/fOVvLT98l1/DDYoZ8tv4XCkznFRhYuuNx6gddvmbCigV2nJ8Ux6YjWrl4BIeDFlUt
         Bv7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729154937; x=1729759737;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z3rc0arNo6EoJheplPvlJnqac7TJz2LgVFDCyu24lb0=;
        b=HwvfkP+mN5r1/9WrTard+YjzruLU1af+2nLyIo77oiUWt8Z5MCIVseZHUz1lY89xUy
         Ot2EYm/lB8r/wHDQxsgtZjA3gEsQa0HjQVIePADizI187BREvkjBzcG7B2578L/AjREm
         feTexumLwodqhF0JXR4GbClo1qBBjDwOBxVYSSXHoDfrwNH5qajhhfBk63dXR3dfB5sX
         /d/SujnticjuGsjephGnp243FqLGwRImRNQT2U6/9kW5/hIr83ok98SJELFK3Dx1Bau9
         xUcQeU5oTIkoPdfuxZmT+m2eVZiDFEo13OkGgIz17AZL9rdoPHFApB2WEST19suBrSKE
         cqcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfSBL+rhGievsL/dDJ0sgYNsY/XUIRBFeMROJTwD0rtcnFmD5/46+YHNJYg2q80qbosLDWnQ9OooqQN+o=@vger.kernel.org, AJvYcCUsEoNJqmmM7G0y5Qn2FOj5EFln5TjsLxzOvO+K+Clg8aodzybZgnDvkTUYjFKptrXnGv+qR9rHcXwB+MuNTED8jYc=@vger.kernel.org, AJvYcCXe5zSFZtGu7iSD0qYD7yF/jOST0Py9QGNgc0FgU330Wfzvz74L1/DPAxSdCgHQ6UhH1oKTcTE/h6a1MSM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy/lc5c4j0KORWCKVS64t9bN7qb+AAgrKiV7+0ECSuyURlN66+
	JaGOQOMMpGTWmpgtWowf0WPCwe1zJ1RzUMujYbBueA5RVFjhLEXkkY+DX6pTyuKTzLvPeRCw9g3
	Zw+FfXyEV4kJiiLW+4lO4bNN6LHc=
X-Google-Smtp-Source: AGHT+IFtyKrJSCNfwFStA5EwcEd8+DtS1sM+dWFb+sLU4WBReDHJuaCxlsmX327ZyihKEI7heGUwyhJteVcUDG0S0PE=
X-Received: by 2002:a05:6122:caa:b0:50d:bfd3:c834 with SMTP id
 71dfb90a1353d-50dbfd3d605mr506422e0c.4.1729154937443; Thu, 17 Oct 2024
 01:48:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241015113757.152548-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CA+V-a8u8bkCjL-YSyMOiKOtfZC8upBwGzhrJ0o+EmZ9S3z5hGA@mail.gmail.com>
 <87h69cevrt.wl-kuninori.morimoto.gx@renesas.com> <242a31a6-8a0c-4db9-97a5-8a9c9f5c29b4@sirena.org.uk>
 <87r08fshm6.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87r08fshm6.wl-kuninori.morimoto.gx@renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 17 Oct 2024 09:48:31 +0100
Message-ID: <CA+V-a8vTprj8qRVzJBHHF3_D2XbKBOJpVp=3n2Ke1FX+Rgyggg@mail.gmail.com>
Subject: Re: [PATCH 0/3] ASoC: Rename "sh" to "renesas"
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Morimoto-san,

On Thu, Oct 17, 2024 at 1:22=E2=80=AFAM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
>
> Hi Mark, Prabhakar
>
> > > I can review / comment for Renesas driver, but can you agree that
> > > you continue to pick the patch instead of sending request-pull from m=
e ?
> >
> > Yes, there's no need to send pull requests.
>
> Thanks
>
> Prabhakar, could you please continue for Renesas Audio Driver ?
>
Sure, I will do that.

Cheers,
Prabhakar

