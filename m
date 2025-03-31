Return-Path: <linux-renesas-soc+bounces-15133-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAD7A76409
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 12:21:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BECC47A1E2B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 10:20:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E8F81DEFDC;
	Mon, 31 Mar 2025 10:21:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A073C27726;
	Mon, 31 Mar 2025 10:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743416472; cv=none; b=YAeJxmKj0vbu1nFRDzM0bJanTtYBKac31dH8tQNNKss1QPdevgJeQBKi+bwDaDEsCAqhAvtQYHSLa6KhNCqJaQPS48e3IIFW6SCNEkZmIz1IwJCnXb5jX5eMMGB9+yItmd5S6z4c+d4ycccX2KwVxUJ7Fsk3FL71hd3Idp7Rf2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743416472; c=relaxed/simple;
	bh=EhUFn7ByxIRheu7cCrR5rk7g/D/YZExGnokymp+lLCs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GAJi/wJFYdidTvy/xWErn6WuLIqbRpCw6wg3sYc5jtvJxU/bLhhbT+CL/TD7cA+DnosvQ/eqtL4NGrGuXxe5Jy/fR8TXtgv7sc0hY3DVkQNFARaPXhP2vxP1MhOaDH20F2xM+o1YasJXe7Fj9f5x9IO5Bm8oHCwo+WHNdBjP3AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5240a432462so4040449e0c.1;
        Mon, 31 Mar 2025 03:21:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743416469; x=1744021269;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j/zZ4a7RgFOrEPBEIZ44dPyBXy9vhRPJteqUCfKTMvQ=;
        b=MA7Orx04/ZSpD0p29x5d/vl7/PIGOG+lfQKDrBIrmFIkP1Crg8gFZZ+aDo3o5+Pmbr
         aFyAT2TmcpXmRhjq/mUiOO52p1UbkT4c2sIhmKbkKyO3W/TYpZmSFH7mAHfgfzDNyepx
         sIl9TGpXMH4qMLaPCQAi34EowGgH3h9U7Pbo1yVOkBmqyBsNPbk3YETMwkvmGCBucgNG
         JQNuQ9ChWEDk8/ByIZwygJRLxa7gYCKps8JGeT1WStruc0koBs8ZC18Z65k4g7LUX/j3
         2H2UDjNjl58Sd+11AsvjufHKeX28R3oOG2R2FNFzNK7C1wbbye7maKkpuuD1mBpNXkd7
         FvJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVG9X65xVaFdoc/m8cu44uSX8t1MhWYEx+cE278IMy/Swh4FNHDr+yFBP7B01shnQovi+Dbgz4FYJBY@vger.kernel.org, AJvYcCVjN27NBONVbEuBmzmwWx1xTjRlrUz2VsrYVvoNoXooTfGvTCsn+ThdIYI6NqEC4MuC4X4tNhBoEPnC@vger.kernel.org, AJvYcCX9hihjRYr48xzPNMwQKyA2i288rvFGS+Xo9GaUv+KOPSzkpz0f2Z3DxSwo7cWqqyrHqGBIoa8GfuX06jWXHpIWClA=@vger.kernel.org, AJvYcCXa8OlVDRsmcDrViOZbFoyAI7JtbZ25o0kVljciQB7C4ehYwsJokUAgwJw+RWeHKk3BpyVmKSfHLqub9d+4@vger.kernel.org
X-Gm-Message-State: AOJu0YxKoGgxqpULJqwsPzrKKfHzlJ0ZVrlL1OJRLi63byMi/ak7+rcI
	2LTk2856Q7BMADfWkuUzfzaArVpQkcNfXJ9mWJ1Msr5QgBFk9gbNZgHQMreN
X-Gm-Gg: ASbGncvFhfegL8nKICimZtaJi1MFX+O6vKGuKKd+hY/YQuykkfr+as4IKBWQwN7p9jm
	YiUeKzvLgp28s76HSDZ+v6PUIH6I8davLc3C1qlv3tDmsDQVzXAzj24m2F8Mnufj/0PG8IaSCKz
	1bCHUfqjB1Cp9HR6xc89E/XqT3SkW5VLDTHNU2N+5K2mSp29effZRbQa2UR4i25ci+73qxQAFku
	GSWm30rMbMi+EWX8+cRaD5z6/Se4/Brl/Ag3+ZDwmhGnqdEZNFHhEaJirl4BjqYW9+QAM36LQA4
	Iw16XUnkDBuxRpAgx6+Zv1xS6+GahjhZrpgtBCrdnaVwi16r5RLN0OOTo6UnTQtfZHw8h7AeFea
	xB0zv78CKMj0=
X-Google-Smtp-Source: AGHT+IH59FrjLq44M6++ibD1rJ13EW3gcE11BC3R7l8v9t4RnL43wmhtocGfsY7bJQNG+lg4wkRcZQ==
X-Received: by 2002:a05:6122:50b:b0:51f:a02b:45d4 with SMTP id 71dfb90a1353d-5261d34a769mr4010896e0c.1.1743416469119;
        Mon, 31 Mar 2025 03:21:09 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5260e6a2cd5sm1482135e0c.2.2025.03.31.03.21.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 03:21:09 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-523f721bc63so5172873e0c.0;
        Mon, 31 Mar 2025 03:21:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUBepkvmSrFjggn/B9ISnqxF3HHJXYsWqYyuHn0qkaDWCNWai6sKByklFtp7Kw+m9tjZBMtVYiWPQrstrae@vger.kernel.org, AJvYcCUQDk8HW0H+bmhzlM19cIrjxVEKPRLhwhR13ULKv4oJDYRqTLGbbKjCzEVPj1wgxr+Fo3RImpCxkXyMQ0OwxFEg8r4=@vger.kernel.org, AJvYcCUhJnxJOSiyEDw5eA1MuFxFWm4FrCoIx7BcS+ktG/Kk75VRo7QokajFbWcfqI4N9ppKlxzEwqLyxUrT@vger.kernel.org, AJvYcCW5E09wJW2xo9O2kNS9d9/hXIhMJxItfxSMeEL5gtctNSSJLNETNBRLGTtI2sPIfb9fcC+ae8efbaSz@vger.kernel.org
X-Received: by 2002:a05:6102:a90:b0:4c3:878:6a62 with SMTP id
 ada2fe7eead31-4c6c2816727mr5972209137.8.1743416468763; Mon, 31 Mar 2025
 03:21:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250328200105.176129-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdXSoP_9P5rEQfFXP=SWSJ+3HY6XOZ0N2BMuke7=euHsVA@mail.gmail.com> <TYCPR01MB11332E15E9A94C41A6D46F3FF86AD2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB11332E15E9A94C41A6D46F3FF86AD2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 31 Mar 2025 12:20:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU4AGWR=4G2+U_tG8GzxE-j+ZT8oia9SwNH8YyU7jLu0g@mail.gmail.com>
X-Gm-Features: AQ5f1Jokh6z83TJlbRWca9C9DTM-vmySSDFCCTcPcmPTfsoDcGLzgfwCHeu_y5c
Message-ID: <CAMuHMdU4AGWR=4G2+U_tG8GzxE-j+ZT8oia9SwNH8YyU7jLu0g@mail.gmail.com>
Subject: Re: [PATCH 0/6] clk: renesas: rzv2h: Add clock and reset entries for
 USB2 and GBETH
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Prabhakar <prabhakar.csengg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Mon, 31 Mar 2025 at 12:13, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Fri, 28 Mar 2025 at 21:01, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> > > Note, these patch apply on top of the following patch series:
> > > https://lore.kernel.org/all/20250228202655.491035-1-prabhakar.mahadev-
> > > lad.rj@bp.renesas.com/
> >
> > That patch series was ultimately ignored because it was not clear how it related to other similar
> > patches for the same driver.  So please coordinate and resend, based on renesas-clk-for-v6.16, or even
> > better,
> > v6.15-rc1 next week.
>
> DEF_CSDIV macro for clk divider with custom code as it requires RMW operation.
>
> and
>
> DEF_SDIV macro for clk divider with generic API.
>
> So, you mean use DEF_CSDIV macro for clk divider with generic API ??

No, I mean you and Prabhakar should coordinate, and resend any series
which you still want to see applied.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

