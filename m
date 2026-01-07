Return-Path: <linux-renesas-soc+bounces-26358-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D7ECFF44D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 07 Jan 2026 19:04:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 513F0329EE4F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Jan 2026 16:54:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72512339878;
	Wed,  7 Jan 2026 15:21:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F66330B520
	for <linux-renesas-soc@vger.kernel.org>; Wed,  7 Jan 2026 15:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767799319; cv=none; b=hqO9BJf/3DbGlEwY/+M65CrF/tx/1IUdcqUtkcErxnKFoNcycpY6RHyaephh80Plvd+wu72rskzLJ9eHyDu5bV6J5DYoBLfVRqoyADJf3WSWkZLnI4fYCCgg6db5BF2YGTxXkPujOpLX4ijqnFWdPX4wJVPhppMCcKzF6EIYWfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767799319; c=relaxed/simple;
	bh=xirnzd+sOTLBfOoqrKyZ5orvmCZslNDx5L/n4t/ve2s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qXmxVe2Y073kQ2OO/tOdYTAhU/TWD9mzvCW4Ff3q07MfnaS4DsnJmAKfw+5LvSS4l7U32+AVVOoZqIy8dSSuhHQvPIAf/WlmzEMetkh2x0Tho3Sb4ddl8Wucng6S/4DkM8hn0PzoLObkn7XKm9Q37muMxTQtqIChwF0gamHbX9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-93f4f04d9f6so531792241.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 07 Jan 2026 07:21:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767799306; x=1768404106;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VGXfYeh3k2PdpEfY5u5umPkWwmBYjzfyvyHueENf/WA=;
        b=Z2HDJpS4TJpwXgS1ApTXB+WDjBl7me6worwXqER56vMeggVtQ91RmUR4DZXlSrdNkY
         klIUYmprhQr0ACyUz+Kk1nPsIFY0BvTZdeqKoF21XgjgWhhCV2FkFknZg9GniRCRP0nn
         2RNWRfuq1yQ8YLqsDVXUAH3m24wnbb9Kdbylu3vth7DU6h9CtephDJOJ0ZSQOf1OkdvB
         FrZyx9oY7bzJnEO7ogtaRUR5S0vxmRkqzhoeNpuT3h4RuPhYOV90n/S8Fq58dJM7bP7Z
         YA1gkLzo4VlxQYAOntTbiJRIhy7vJIOdl3TUJE3nt8UU242DKBYmN4f2Ul5Wn2woRp6Q
         HT0A==
X-Forwarded-Encrypted: i=1; AJvYcCVuGR0tVQrBOct2B99Jvb61ePoYM63mC9I5DqEA5q8BYnoZwHlThH4+OOtkNKhvp4A8EUdoSDHYCRWuH2SlRLibdw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6bYvnzUPHEB8AxbelQ5ygXHEJDBuJKtmIRpPgpbOtihUFT2FD
	KcaLsVXKpfuT6L6CYofi/4Lwa6mDObo2TxHWc3urZniqj6XDXARhK3GX/1OVjC1V
X-Gm-Gg: AY/fxX6I7ZpOgDwReFbvcQdgX2ntrRnYxShf4r3VoNIOT81L1l1KZklcp072x63J0Es
	+cfREWRsuHc1A4NGq+hDiqmR8OtY+7OJCHtMJyodcFvv+UbkJN9TDXCCiC0qRZPGOk3enzXITZR
	EeOU6QkDFVXsxL0pFZpim/THhYH+Lf6LSd9JjuPjUNhE3kzw0hs1WZ/0QMbb0gDhKrvilESHzqO
	IqLgU2imIUHeRxV2yn7p2SmGSD8gdW/TJYU18tj/0kERRX6SlyKhxCpI4s5krsYZ8pyn9aosaV6
	Lehz5UinRPplQl65ifMi+1lF4e5aRhL0oJkkSNsAnl7GjWXrSHGBS1J+Y9JGKRLZrZi/Vv15wLE
	LUn8wr05oWMqZMXcQuY39XgYkKeAFqptM3iLbiSrnGNMHKLV/fsapVd1x4GFlo5Y9NMJAAoK+7m
	4Kdd1xf7lBTjMVgR4rIzRpp3hmjAxkHHaS0AvdyPIb/qbPKAZB
X-Google-Smtp-Source: AGHT+IHCz9qTsFxZGB9WrFdIsz5G/1ng2t67JWUtEnOHfPOSmtxuYRFmD09NOH87ZHyg9ITIjzsApg==
X-Received: by 2002:a05:6102:944:b0:5dd:37a3:c389 with SMTP id ada2fe7eead31-5ec75566566mr2627265137.2.1767799306503;
        Wed, 07 Jan 2026 07:21:46 -0800 (PST)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-944122aee82sm3031166241.1.2026.01.07.07.21.46
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 07:21:46 -0800 (PST)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-5ecddf73062so482454137.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 07 Jan 2026 07:21:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWgqlIz6aykycIbgszUfYp96hH3zD1/Mz9yAV7WOIGmpflS3W53y3WoQk9KYXwWT4Q/erzIIzbh7SZUX0g9iThsZQ==@vger.kernel.org
X-Received: by 2002:a05:6102:f0a:b0:5db:cfff:fd66 with SMTP id
 ada2fe7eead31-5ec75774023mr2670446137.22.1767799305872; Wed, 07 Jan 2026
 07:21:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251224165049.3384870-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251224165049.3384870-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251224165049.3384870-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 7 Jan 2026 16:21:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWAbdVfTGtAdVCfq31yTNYVgmXoVB5JvPOHde-ZsVMBhw@mail.gmail.com>
X-Gm-Features: AQt7F2o6g6AUCQi8FFgmNntpDHUQy0QJrCdwxLZBZDunb38OI9ggwtqmRVYkm64
Message-ID: <CAMuHMdWAbdVfTGtAdVCfq31yTNYVgmXoVB5JvPOHde-ZsVMBhw@mail.gmail.com>
Subject: Re: [PATCH 3/4] clk: renesas: r9a09g057: Add entries for CANFD
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 24 Dec 2025 at 17:51, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add clock and reset entries for the CANFD IP.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

