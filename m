Return-Path: <linux-renesas-soc+bounces-6325-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACABE90A78F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2024 09:43:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DDD51B2BCB3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2024 07:37:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3DAC18C344;
	Mon, 17 Jun 2024 07:37:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94AB618754D;
	Mon, 17 Jun 2024 07:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718609853; cv=none; b=oazrnA05qBYqkYJT2RwYrKlvZPEkz7iTAS3izEi3tPyO/stIVfrsws3+D52z4PP6AlXe6Are+uBmyW5vhRJxxJX9yYeI25Ur2U48KKVTZMPnx+kL68ozomFOwXaBad2jIRrN7bkH3+dN31JzXAYV/9R4stCIBHUYGlhjB6KiVFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718609853; c=relaxed/simple;
	bh=aRWdFzLVfZURJmJduJBKPPGYnq9whgbZmBnQ57F0zTM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F3Ln+uF9ezQYbiHrhzEDNl73bovLVbayx0TmZMClm/tOYz4Y/mCTsapdse3n5+XnwN7AnoHqraoW5o31tl8maoK0P8myDZptvy8thslI0v3VJ7YlgssHtdcVNzjuO/OHWqHnCMpj3lnr5HagKaJ8MAuoqnYRxC//LnpwLxXigy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6316253dc52so29589607b3.0;
        Mon, 17 Jun 2024 00:37:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718609849; x=1719214649;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CkULF+2ESB/U0wrTn2s5lPj+LcRpJ2ZK8TfZlI/6LPY=;
        b=f934UQyjVNcCPF4GR4SDiieo6Xy+jEAlWdl8L82GsU6CUr6XspvLW2pQCmZ8W/D1A8
         v+obOKbG38GnHcBh7uFH1tZ03cbeT7yNHIxp8rI1ZwdxjMup/H6aWGREhd2h12qQH+GY
         NxwEfUDQaAWl293Cu2e0oGbx//eEXT13lsnsysuHvlx6NvZt9e1lr7tVle/HTNvDNXdp
         oQEJ3N2CVUToQQRSdk9Q3MMlqitfUm2ilfzXTLJyNOt1Uhl4Hq8KP2Xb82k+XaUHJSjr
         SaPoDi96cAg2m/tkGPbNKzOW68WOXbbYNm0oykS7z5yXyq6bir55V/aVM0aY/wwz4o4m
         Bzcg==
X-Forwarded-Encrypted: i=1; AJvYcCWvUNmcDdDagaHtP/n88+55ALkMJZ9sKzFNVDB6cfaSFdqVer7wuOxKz63cOBx+lFsJhUkDLypBnKouCXj3eC9F6nnKtRy2iMTfYmOIxL7AXsxaIrKXR8jZbp6ohpEa8+QTSjw6PVl0iedZQy1fh7ZTGwSCcWEMpaGDgfy27hmzKdRt3I6NzUGJ4cDi5TYfzCk9Mdxvl6FkKcsnNpTQyRVb4TOey2Da
X-Gm-Message-State: AOJu0YyfbfTZAcw/tjLFWK+e/RfD48hsFn8sfg7OV8zsgcAXdepdb1ES
	bShj4ywNa6P7hSROcI2UMGxdpkeknLAcNapTDqxfYkI/fyfTnTStOuTx9mWJ
X-Google-Smtp-Source: AGHT+IETGMetluZrPaT0awRlvXhyTyrX5WNulhjzR+Nda40pF+TWY1wP0Rgo4p284EQMNm+qX7IX4A==
X-Received: by 2002:a0d:dec7:0:b0:61a:d21f:a131 with SMTP id 00721157ae682-63223a411ecmr76150057b3.37.1718609849210;
        Mon, 17 Jun 2024 00:37:29 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6311a446193sm13559347b3.78.2024.06.17.00.37.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jun 2024 00:37:28 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-dff2df7de4aso1326349276.2;
        Mon, 17 Jun 2024 00:37:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXls+8+6IjFdC1g/TnJjWD4AVUceWYBnMMoIDt64xmIJ1QFINsXJqIphnMFre6oQQJ9hii1bwUYdePVr7CcbcYx4BkyzVyPS41GUhmB6p1N77FAtvTx98kgF+J1fYSuuVz87wFPxT6p6VvhSZpiQNinoTcii3FwdGfYgUzSU29fxHOGZ/Q9TVGCEaSb4do5fpYViofBy/N1BwGhBuLwkGS0Keg7V2MB
X-Received: by 2002:a25:ad48:0:b0:dfb:6d6:a542 with SMTP id
 3f1490d57ef6-dff153a66damr5859831276.28.1718609848585; Mon, 17 Jun 2024
 00:37:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240613091721.525266-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240613091721.525266-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240613091721.525266-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Jun 2024 09:37:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXVF+Lk+biS02zo9L3j5R6OSSdsFig9dtm+oFc__63g_w@mail.gmail.com>
Message-ID: <CAMuHMdXVF+Lk+biS02zo9L3j5R6OSSdsFig9dtm+oFc__63g_w@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/3] mmc: tmio: Use MMC core APIs to control the
 vqmmc regulator
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2024 at 11:17=E2=80=AFAM Prabhakar <prabhakar.csengg@gmail.=
com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Use the mmc_regulator_enable_vqmmc() and mmc_regulator_disable_vqmmc() AP=
Is
> to enable/disable the vqmmc regulator.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

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

