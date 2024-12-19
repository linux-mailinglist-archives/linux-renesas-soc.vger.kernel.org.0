Return-Path: <linux-renesas-soc+bounces-11586-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E409F83CA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Dec 2024 20:08:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E156D1676DD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Dec 2024 19:08:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2B2C1A4F2D;
	Thu, 19 Dec 2024 19:08:32 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F391A2632;
	Thu, 19 Dec 2024 19:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734635312; cv=none; b=dPjzzVt8Hqyt26elH5ZXYTeqiyBcK3Ywcs7KMdQBdG/nrn6GglHhQxQ5r4y7q7oPb6tDZeTLuppzsJNDY02ffdz4EEIeFKIRkxdcgp/Vniu1v5+4H8e43aFLv1OEDK1IlDJhi+UrA5M7tr76GmkwPWGgJMKVYq92ASEvtnE4gDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734635312; c=relaxed/simple;
	bh=5Ef+6rZWH8dDGtU7zv2iioXJYo0m2yELmssYQ0nJyMM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aNn21p8MH/5BG1uoppaKCUHfrB3Zt8+H5XZiKcxLPfpckL22ZWJTA5HOCM0IPVnM/842GAeNPjq0EWcONgNg+gAi/5NJkEdRrw0xnvgIPf8GD4/Q3PDY6/iHc8ShgKVMOu7DfV8/8+xEWKdgkIIa+N0idyz6qm5vytvbOq/k+7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6dcc42b5e30so14404246d6.1;
        Thu, 19 Dec 2024 11:08:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734635309; x=1735240109;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XPaniiWHezQ/g7pat40XY3/npFC9VXw3O9cONcVxZoQ=;
        b=gzj6KN+4s5/uYCLA7eeIlyY0XCtFaRNk3wS6gc3A7pvZGenMtTkWyL3+s20mFMQYfH
         KKmlDleE408jqnBGugrUn0HAgdlMxL67tgWKCUx2+jmjUH4wgJpCqmu1SmPlDDdxd7KP
         7iGdt2nFDfv0BoCwd2HoMQLjSGjiz4DZsUiI9XA6RB8wzdpTmwN6E3xMHmQVwwdIJ2kI
         ZP/fSV+ZZIC5hNXqRT6StnXFcYkH+cn2AjrrfpN6pPcLwhRmP37xiBw92ktweHtzfTuy
         7wyCjYYg/esPgftS+h7AyFIHUv4UImc5e0XZy3T2pbMVtWFnqR5N8oJ7PdCu+O06w/NN
         DpNw==
X-Forwarded-Encrypted: i=1; AJvYcCUtLbuAwfZHsDdyzCdFT3wDur72dGG2aPAhBWPZh+S/vb3+PbqQy4eqK4z0XbycF9OszBYo6NbVW7Ywi9aVYi5HO9s=@vger.kernel.org, AJvYcCWlHluEaNnHMTNHCA2HAfJjytj+0oKoTPmT4m7EV42fO5n4VJ75gY1VK6dfKzzFPT20K3rUx9YNHLo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLEetF8JGf3XqkGTsy91Y0ADwIfnb+DAlR3gFqLcxcZHmYE+ka
	b1GQD8zJnIDkZv8trU6O2Ff9K0p3Z8Ow4C1T/+0MTNZ3ABjHOj5WJFbK3oBN
X-Gm-Gg: ASbGncus4st9LuPSeHljvOGbIWChg7MMrpAu413nwo+i22vzc4sKU+hHFJeBEZD8he6
	/z/S+5rwxrHWrwpBw8vwD8Ra1M5KZDOWpPW7++p7znAzRdz/FzRUm3aEMQMNo7NdBWF2qXDvLJq
	JyTOweH+pvqLCpomz9Fd0jDXD/sNQdoRukhowxq9c9qPg+6nqWeGv4D3joRJ3MVPBKGhm9IcQdk
	uQZUH7dRGXai2ojwZLPbVBqAoLWhby66CvGMkrAXtub6LKz59Vi9293GcVw8jhFduSDBl36uqzA
	8LI3tQd3b0Sek7iQoVE=
X-Google-Smtp-Source: AGHT+IFMJDmRciNDbuBXZlymOlXbUot68jEvORAIIe7KzXL5fcZjIjYKUNccG/OjdQQDJMVJ4Z5/FQ==
X-Received: by 2002:ad4:5b83:0:b0:6d8:850a:4d6a with SMTP id 6a1803df08f44-6dd2332ee4dmr850246d6.1.1734635308898;
        Thu, 19 Dec 2024 11:08:28 -0800 (PST)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com. [209.85.219.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dd18137373sm9228926d6.64.2024.12.19.11.08.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 11:08:28 -0800 (PST)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6dcc42b5e30so14403926d6.1;
        Thu, 19 Dec 2024 11:08:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVm4YL9OPQkk+USFxQWvHTAQE52SejQ0UNalHANzb48Z8TuND1y+3AxXnAWz8ge6yLEQBIoLpPJuzkEuAzOsYkQ6No=@vger.kernel.org, AJvYcCXZEbsjv9RLlSnShdFioBCPdY1cIZjd3iPElBc7M7LKfCw7yUtad2YrZEQCmN8DsStECqDqbIKH5iM=@vger.kernel.org
X-Received: by 2002:a05:6214:d46:b0:6d8:9994:ac30 with SMTP id
 6a1803df08f44-6dd2335ddf3mr629566d6.26.1734635308346; Thu, 19 Dec 2024
 11:08:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241213123550.289193-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20241213123550.289193-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Dec 2024 20:08:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUEkN6Z7p=LspP+npB3xs4ui+D9oGG+Q15kQ-mYiaoK-A@mail.gmail.com>
Message-ID: <CAMuHMdUEkN6Z7p=LspP+npB3xs4ui+D9oGG+Q15kQ-mYiaoK-A@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Add clock driver support for Renesas RZ/G3E SoC
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	Chris Paterson <Chris.Paterson2@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju et al,

On Fri, Dec 13, 2024 at 1:36=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> This patch series adds clock driver support for RZ/G3E. Also add
> MSTOP support for RZ/V2H.
>
> This patch series is tested on renesas-devel and next.

> Biju Das (3):
>   clk: renesas: rzv2h-cpg: Add MSTOP support
>   clk: renesas: rzv2h-cpg: Add support for RZ/G3E SoC
>   clk: renesas: r9a09g047: Add CA55 core clocks

Given the issues with "[PATCH v3 1/3] clk: renesas: rzv2h-cpg: Add
MSTOP support" reported by email[1] and on #renesas-soc, I think it
is best not to include this patch and all other patches that depend
on it in tomorrow's pull request for clk-next.  That leaves us with
some extra time to fix the issues.

Unfortunately, I understand not all parties will have returned from
holidays by the time I will send my second pull request (usually
just before rc6)...

[1] "[PATCH 1/5] clk: renesas: rzv2h: Fix use-after-free in MSTOP
refcount handling"
    https://lore.kernel.org/all/20241218142045.77269-2-prabhakar.mahadev-la=
d.rj@bp.renesas.com

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

