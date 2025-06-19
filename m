Return-Path: <linux-renesas-soc+bounces-18531-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E9EAE0547
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Jun 2025 14:17:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E835C189C235
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Jun 2025 12:17:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EDA022370D;
	Thu, 19 Jun 2025 12:17:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFFD52192F4;
	Thu, 19 Jun 2025 12:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750335421; cv=none; b=irYYFmdIpfZmxatwZXUFZWv2fyKo8Zedx7xRt/VnnXwxDhX21wHTQ3ih33jF7xYwJksAQ7S01pakdGWTe6w0ZA/avO4vB3FClxecBavj/RanZbiCUqRUMGU456jyjD6nrwEcrYyg+iOQhPiIjI4SnXt4t5kZO3kc5ttiztgFBkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750335421; c=relaxed/simple;
	bh=KOV50LtxSLTk8myNakTi6pYOjKVosHJ1Zs2xoj2+sYY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BJnoZGfQwNwQiHUMUt0Edm5UHKikKizh+xuYRV6Dcf65qVgrlPrv7DX2YeUtC+UwGp8pil1DJlihtjDR/poahfyxdv28SKqjgaWwZWXAWdtfO/F57JOcfizSpTWmK0kC3XIxMSyAvShnq7WWvkh2YSj9flC2Km0+YxqYm0nb8HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-52d9a275c27so627757e0c.0;
        Thu, 19 Jun 2025 05:16:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750335418; x=1750940218;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BIR2gsz9to+yAE2m695WmEpzHsU9ducBJg+W2fRJiJE=;
        b=q3FSIMPCu8S/Hr0bsHuSzUu65t1BoqvdzQy1GPUWu+xB7iTdRlVReGOh6uSVI1OJfc
         BdiWLxze7tUVKa6jl2zPdhXfwz0WcoQKly/o4iFziu2R8HCdFDvGjIktYgbGtn85GlAD
         rHaEW4vMVozzSP/ZTkycrfs2MbLzsHIrRS7bitUt1veDcekYdTktk0s0qKAd75CK/N7M
         54AO5swsIjWHNoYU3eYp/PI3bnpHhIwxe7mRYw/E49dY159RX9xgNcJElSLrjQZZ4vrC
         Lr7QWNlfv9ti7RAcy2878VO8YDjGXnDR6ebV2Hkg2/146sIhT0Z3TvMMHeZdPIjU2cwv
         T1cQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUfUmIT+rakdQ1UYsbt9QnueXUWYYBA86j8Vi5VkT/PiQ1UW1OUhBMDKpWxTJlZ6AQU7BRtXje3rs=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywfn8DrDpBqDawVG79IhZ+Q2VjKjH7U4nSrF5HLhZvHkffYVIgx
	kIVdwG5zJMQH7sesjraSNEf+NTCfzRhRAqfP7ucCOMjT2iyHEqG6kYko78EFyZGQ
X-Gm-Gg: ASbGnct9KoyWAfz0+8FerKUJIptKwxWvvP5O0Vi10ERwsLXeve0Pwk+h5QdQ4KZH2LH
	fjgCsze5vOXM236UffZgHgX80/EERyAwaf14NUGMTQm7TuoYl/GL4imS1EdyWe3UpgLXSBlcT5h
	nCzm++GMOk7UPSeWtNNijk1ONKxlsBV5HUqrQIW15V0rwpidcb4H56G+S2yLJZWZoFIVAA3YQ50
	rmKQTeHFsQIQMLWwsoLAoe7FdEFGL//1EVI0fiUTbBUwpZ67SgPEhr3ksAAoxSacD4ypiU7Pkpk
	atTw/xHcvDNqMgnraX6WxxBTBRfiAgvCEtHytKbYOl40L4HGQIxCS2VIHIlx3Km0rJJ3N02f+L0
	9eQbW+zDFqtxDSubcFHtyt8/8
X-Google-Smtp-Source: AGHT+IFJmDs8i09QXknen/DRO5LHV5Slmo91FMxHb0eEQYx2e9qqKSVekJBf46Sf2i6NKEtPDjrSGg==
X-Received: by 2002:a05:6122:30a8:b0:530:7e05:3836 with SMTP id 71dfb90a1353d-53149a7a652mr14784780e0c.9.1750335417885;
        Thu, 19 Jun 2025 05:16:57 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-531401e5bfasm2336162e0c.33.2025.06.19.05.16.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 05:16:57 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4e9a109035bso584785137.1;
        Thu, 19 Jun 2025 05:16:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVLr/TG7p68RS6TXoKLgoyoVdgkQXq22/+/DrQeHHp4ZHwR94LzfSN3Ll1Hppgaa9PS32FW1DMEGaE=@vger.kernel.org
X-Received: by 2002:a05:6102:6c6:b0:4e9:ba27:2c94 with SMTP id
 ada2fe7eead31-4e9ba273c69mr326957137.6.1750335416865; Thu, 19 Jun 2025
 05:16:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611093934.4208-1-wsa+renesas@sang-engineering.com> <20250611093934.4208-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250611093934.4208-3-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Jun 2025 14:16:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUkkTaL8aaYiw37hwBNL_QA1PFRkz9FNGxYR2N7sjADhA@mail.gmail.com>
X-Gm-Features: Ac12FXxkMEiQQG8WQUVpr0ffZzKYaMxjtDuztBTJ65cLJ9hMwug5HR4iSnoelSA
Message-ID: <CAMuHMdUkkTaL8aaYiw37hwBNL_QA1PFRkz9FNGxYR2N7sjADhA@mail.gmail.com>
Subject: Re: [PATCH RFC 2/7] clk: renesas: r9a09g047: Add I3C0 clocks and resets
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Jun 2025 at 11:39, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
>
> Add Renesas RZ/G3E R9A09G047 I3C0 clocks and reset support into
> cpg driver.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.17.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

