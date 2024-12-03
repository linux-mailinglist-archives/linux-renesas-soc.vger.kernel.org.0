Return-Path: <linux-renesas-soc+bounces-10861-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E96B9E2884
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 18:02:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 68A8A16476E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 17:02:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C7CD1F76DD;
	Tue,  3 Dec 2024 17:02:15 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E9518BC1D;
	Tue,  3 Dec 2024 17:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733245334; cv=none; b=aO7JB17vREYaZsO0AuuwaiyRF2e4aJ1D9oajS8BnJ5SOkqiTfqBCK4nIsjC19mjq3ta+g1uDZq6f9GT6j0bTYNKWNjGcjX8l1EiUc6Gf1Au8/DYStiOsq2GAlZNymH2IpA1ItGQeDTeQ5Cjf0qQ7oWJ7uhlyHGpzQhj+Ygnqr1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733245334; c=relaxed/simple;
	bh=tHd1xpF9ReBe59sxkmE3IDuWaO8b9RAA27+1QwWYrVI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cH3grY4smAlEbBcVKbRX6evd7hupQhsjlCTXDvGhVtxFe24xzBWLGaXJ0YDcQmBmtKEKUZjXTKJullFmCNYhfpyiVWXRDQEHhcnWSYCr/ouHFolNWZt8Y4BPB8l6H83LdRAWlg5uJC/IQ1FeusleoEUsnu+ULSa8GOoBj/8dXRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-29e2a50586dso2515925fac.0;
        Tue, 03 Dec 2024 09:02:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733245330; x=1733850130;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PKrpmCLU9PNcLqWaiy+hdhFCQ8nXgm75CgKRo23r1dw=;
        b=WtGRRxFwqJFil+LCzJ/Dh35/zFdx2YKYQ7xBYfTWvkQT1mkG5uvueOyWz79NB+KKNs
         LMHfC0jxqJONz5EAcnV2758D0s9mBx+n4hWprtmGN+V86+iERBtvxV/+Sly4qUAG5r67
         S4PCbVRNmROv14NQXN9WZm5jbzF7q+jij0P9uiLHRJ6y8mosWm0SFDhO/cpT0V96q5Cd
         fS4yHwenTqqp5VF1+ZLmcAvjbN1jDn97eNfNhbg9uKMIXsT2g3/k/zHNKHBWvY9kmTBJ
         gekiqCFyTVSrKWXY6WzVqZDKC7dZmnYBDR7j8TIAg9cxpfprMw6IckbiPK+jpYMU4KgQ
         kjnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUk+AxnAZovy4LZFIYxuY4HPL1KrTQ9gEJMCDRS6Low0dJLQG8HVdz2fpxPulz2tRNY3lqaDhf13GMZTqki7HQCFg==@vger.kernel.org, AJvYcCUt7wteWk8Uz5EdlBnijXE8019vbJdh6lHpFhtlaSojBRG3PPWznP3PfB3Q7q95kVFPer10o6EzRYo=@vger.kernel.org, AJvYcCXRSe5EM/iE2JmYIkBEclFCe8UrGOiVCV/jKNOldXDzJurOpQTyA18rDSKE29fdAYDFtzYrIE+sTkECXgLJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxX4/jJ+UDGeDnPAyezUyF6Urgxph+413oiru0TV9F8SWh393Cy
	T1Yxx3jbMaoWfDD+sFBehjLvcSpiWCJvii/hImiOuZhjEcaOEt0RjCcunyKU
X-Gm-Gg: ASbGnct4Fpssrjwb7mGM/cTN/FuZqbuMOVyfbsWNA+mUghiKda4aYsbl2Lv+jknsngO
	KGoYjDrLoignRtVHU1kKZHxQeuyw9s8sHHBGuIpuamVpptO25kqbDuRufCctu+js4GFmvD3GxPm
	lk3eTnCXmECCR0fVbL0RIrYmgqN7nyeflMieaPcgYHuhW8wXqxApUaRTPBNkxwQM+2fRHKKgNJv
	q5aIjqewP6hye63I6+m47ZJY7bMtCNTenSY7OEy8YSh1vHhpZqxk0F4CYcO8Xt2OKyRnxS3smDL
	qeXvYhuEiIsa
X-Google-Smtp-Source: AGHT+IHnDhYCcnhu6oKHnA4ywWogrCGwfCLe5za361VgeZPWxISKd7QzS0VIwlR7svIu7WdGF7VouQ==
X-Received: by 2002:a05:6871:e7c4:b0:29e:443b:edcd with SMTP id 586e51a60fabf-29e888da8a1mr3693838fac.37.1733245328794;
        Tue, 03 Dec 2024 09:02:08 -0800 (PST)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com. [209.85.161.46])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-29de92d8150sm3817050fac.27.2024.12.03.09.02.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 09:02:08 -0800 (PST)
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-5f1f81e51b1so2616848eaf.3;
        Tue, 03 Dec 2024 09:02:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUhkfhTr3kfqw6QCwqH6BlYfgO3S7S2cs0Q77lgGqimzYX5st99sxISBqcI0/rmiwVIt7cAuxNWCum5lz3I@vger.kernel.org, AJvYcCV/dm49I2W+a+YJamZkhw8dVO2tDqSv5cR7U2J0kdrSd0gCHtUORg1RIyl8A9LNNgcotuGwlfV5aY8=@vger.kernel.org, AJvYcCXBO8P1KRjrLM5sQBqe0Z80KlS/ckWz2PvHj2jzowmpey0yjNDRIoBxxFsgcUIgXqa9JtiBYahVVuxaMsU9MKMI7w==@vger.kernel.org
X-Received: by 2002:a05:6358:7a7:b0:1b8:33f2:7c81 with SMTP id
 e5c5f4694b2df-1caeaaa0ed7mr295075555d.8.1733245327728; Tue, 03 Dec 2024
 09:02:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <e097e5c11afe5bd4c01135779c9a40e707ef6374.1733243287.git.geert+renesas@glider.be>
 <b71bb27e-003f-4b5d-8654-c7639b105e29@tuxon.dev>
In-Reply-To: <b71bb27e-003f-4b5d-8654-c7639b105e29@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 3 Dec 2024 18:01:55 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVCQauLFcw+tsoqyXnbYuLhYHfJoeCbq--bBc9fDPjXPQ@mail.gmail.com>
Message-ID: <CAMuHMdVCQauLFcw+tsoqyXnbYuLhYHfJoeCbq--bBc9fDPjXPQ@mail.gmail.com>
Subject: Re: [PATCH] serial: sh-sci: Use plain struct copy in early_console_setup()
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-serial@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Claudiu,

On Tue, Dec 3, 2024 at 5:45=E2=80=AFPM Claudiu Beznea <claudiu.beznea@tuxon=
.dev> wrote:
> On 03.12.2024 18:30, Geert Uytterhoeven wrote:
> > Using memcpy() prevents the compiler from doing any checking on the
> > types of the passed pointer parameters.  Copy the structure using struc=
t
> > assignment instead, to increase type-safety.
> >
> > No change in generated code on all relevant architectures
> > (arm/arm64/riscv/sh).
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Not sure, do you think it should carry a fixes tag?

Not really, as it's not a bug fix.

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

