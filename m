Return-Path: <linux-renesas-soc+bounces-6804-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B78719180F6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jun 2024 14:33:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6295B1F2360C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jun 2024 12:33:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 384F813CFBC;
	Wed, 26 Jun 2024 12:33:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807361E51D
	for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Jun 2024 12:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719405208; cv=none; b=OtvLa1VWQAQZS/cvDRjjJzhLDSZ5K87bXkT8c4UPi3Sq/g/tZ5Z0NeDH2UYpqIlzEC06/FXUaDWLe6Rw+TwccGDhVZjEXkui6NgtPhOxtSB3SQaK75ReKN8L0lJSxj4icx/mraWdLYN7fJMRwcFIe3BxSkart5dfH3WcJQ6UWYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719405208; c=relaxed/simple;
	bh=67gI+NaIcu9m10Rzp/3LuoYPiSQQ6YL9/9msCPU9vMI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F/6zhI1dpX9zFd0wS8VHHpQajMfvQaGJPVBejDLKuIP9hBV67ax71zqCj2VTXw8gp11hazNFoHAlCSNgfIIeKm9WZw5xYGJ7BCeSRtc/QxYc3Pkq3rcMuoVlqEiwn4ck7igtHicsw2WJjsGoctgY31k7zH9FKmsgn7eDUodOCy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e02c4983bfaso6615606276.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Jun 2024 05:33:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719405205; x=1720010005;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F3+wS6sDv1ZFzF7qMInC4nLfLHwELSp5x9O2Nj3TltA=;
        b=UiEtGni5uImcnO7KCf3jCSWQlxoBwYG6P+LNAPKc5FVzclXG9/bqKpbMFV99OV8GIP
         bfJVemHWRpAvB12oR+KG3P7DRkZUnGCemZAdL2SAsOraKNU9IO6Uo+6A2/J81eJ3CixQ
         q0PmQdR66SplTL0725a+/87wXvRXsu+wVAbh7tFuimuWg9XtH++7lNx1gkCGJBTPqxMn
         48dHBDBnmoQgN2oIE47swtPdczcE4aTkndQV2BXHzugIKQXF7AKAVqW0MV0mn9ACh7ht
         CL22Q5SgGGlGrgTZdXAB8Vn1R/xhlK0FJXv8TUIPPxy5hbthYdpDto9XPXChQeB9wy0q
         IJOw==
X-Gm-Message-State: AOJu0YwRzx7kb7hIx++PLtiAFurY0HqRuEIiht+zI6J6ISo4icAxr+N7
	+VYD/yxCIOtLybdzk1tqigTTejjaRlBR+Dw3K+MY4OTom1ohI00EvtHtxQO4
X-Google-Smtp-Source: AGHT+IEx6j2i7h9Eps2guy1V3lQ8nStTHdv1muTP4HfeU02200SANJa0TbhXSsDUzGwR0PWN1xVuHg==
X-Received: by 2002:a0d:ea06:0:b0:643:849f:a7f4 with SMTP id 00721157ae682-643849fa9aamr85289047b3.30.1719405205158;
        Wed, 26 Jun 2024 05:33:25 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-63f154d6011sm39265287b3.119.2024.06.26.05.33.24
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jun 2024 05:33:24 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-63174692a02so62611277b3.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Jun 2024 05:33:24 -0700 (PDT)
X-Received: by 2002:a05:690c:6d01:b0:643:ed61:11bb with SMTP id
 00721157ae682-643ed611411mr123980407b3.7.1719405204640; Wed, 26 Jun 2024
 05:33:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87jzifkxi4.wl-kuninori.morimoto.gx@renesas.com> <87h6djkxf2.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87h6djkxf2.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 26 Jun 2024 14:33:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWP2iDnJA8d9xOO2obn9hznNoSLufbxQPY+ymxvyCJjBg@mail.gmail.com>
Message-ID: <CAMuHMdWP2iDnJA8d9xOO2obn9hznNoSLufbxQPY+ymxvyCJjBg@mail.gmail.com>
Subject: Re: [PATCH 1/6] clk: renesas: r8a779h0: Add Audio clocks
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org, Khanh Le <khanh.le.xr@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 24, 2024 at 2:16=E2=80=AFAM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> Add module clocks for the Audio (SSI/SSIU) blocks on the Renesas R-Car
> V4M (R8A779H0) SoC.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.11.

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

