Return-Path: <linux-renesas-soc+bounces-24545-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B523DC56608
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 09:54:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3F8FF343384
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 08:48:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0102D2C0F6F;
	Thu, 13 Nov 2025 08:48:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8BA22578D
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 08:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763023686; cv=none; b=B/axwtEd6rHrAZOIus4bTZkZxnnRcEYqlNI5QVx9zD4ukmhmcCMH/GLLBKrzvce2ODc4hN+JiRiEFQP2T7nQCXbs73RXVqmE7hdtdRK2cY7mQniHQrXOQt9B02KtXTrQpKbtlfqPI8QBjLNRJE/vVb84VNxSmt8qoZpUZI/me+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763023686; c=relaxed/simple;
	bh=0aM3HY/1aVJh4jGU5kIYvSVpXhXTpBy3+OCQo3m3IRo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qTIvUvAUgEjIZvnr3N/kfLpz8NQ8QcBpaidTAhJuQZTHBiOUhqA2grsoK+yCkxCaJ0vWTkwT9MQtZwlmh15I5mseffaq82l6HTbFvXcZDqWsRG5qwMUPDp4bTfHo4DkQnz9QOY6JsENj3l89bP1/W+SCIt5pehC910dhSC2wN0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-55965c96fd7so141499e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 00:48:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763023684; x=1763628484;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=75iAsF6vZT2LRBqNQRnHkvddKffQGnmtAsacOCaiC7I=;
        b=LKjeRnfhmDnXJCWh+8IVZR+6FDgg274b3rPL/d1CPDEO44vUToObw+H5tUSWmPmcw3
         VoDDP4JHXSZSfLuMPc/QX6z+4NIwv6QdVj8/E/MzozOJqsDFEYk+18CAydBbrHYzNCVc
         /emr64NQnIOfKV3scQHdlPPtdhJ0fmse48LunL0WkX23gFYQmR8x8aEKrydOr4lvfYSu
         +XXbnqp07A3Amn6Yh2/B4Jj8AcUZdQiVVDxUT7+tusAAJ0xdpQkNbGSU/Ss4oGXWcdaG
         no/29an+8YWmpl++i7gqdXD8ygipV4sGQZBDs7J5DaBVQtc3Xd9H4YcAG7Yc50/vrANK
         AARA==
X-Forwarded-Encrypted: i=1; AJvYcCX1o1zDnxXRXvJ0S5b2gM1WykFEh2NZS+dEd5/p3mg5Dhm6ey2UDYqFvodPLZc18/jhPTBV6hj8hcLV1V9rmpLUHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPbhF/9gu+lLZYPWrA6ct7YrwbIiKszdE3HcJvUlRsLcYqLDE2
	VnNhpZMB1kICHNzH0brL1aonM8dRlhgJJzYVkTj2PH07qzFoXBsNUIbu+ZoqE4Vm2lI=
X-Gm-Gg: ASbGncvU39t9KXVl+GgE4LgjZVvUuqkCyaTehjxlf0yclUNEiRP2+5askUnSjWm1Tl+
	n/2TzIyaflJVnrxKtrpg6Uu8Os6OdLTeL97hkLkMssX1TvLJl1snxWXdkNTaEN0II8tapyij++T
	VGVQvV3OgCmdOAECVJUIXQwtwsNEBgEq/HhY6zC6tbbekezCOwHuK3aCT6Eca3vHIk6qYyuK2wX
	DOIp4/oW1VShzYIt3+PcGEFSnyOzS9jAV0+TleOIzIZSJC2nmVJorX3v2vOdtx7skX1xlV3TteS
	wH737U/DDrNbWBvjnNvs6O43C3wfcLrimGR3HK33b6fdJUMx+b0j1rd/T4WmHef/kTaRfXEQ8ji
	9W5qkyrkutC57NO/CVGHFFgY/u75cG7gSkKVmo8OmSWLJ6yW3oXd73ZC4VT4fVLs/efzynDLiRK
	3uKJQWpjoChC11TPwANtTRYHDUpzk4Am9NrEurCg==
X-Google-Smtp-Source: AGHT+IHxn6W7L8FA4zSY2pntuoXRLqohD8pjxjqgUKHMBxEBw2R/M0SPF0H4IMozhYiDsm8AWG4Mpw==
X-Received: by 2002:a05:6122:2026:b0:559:6b0c:1ca0 with SMTP id 71dfb90a1353d-559e7d481f9mr2071426e0c.12.1763023683764;
        Thu, 13 Nov 2025 00:48:03 -0800 (PST)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55b0f4986fdsm492141e0c.21.2025.11.13.00.48.03
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 00:48:03 -0800 (PST)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5d61f261ebfso187897137.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 00:48:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUZmpzu0lA6OCwdugKRvaiP36FOmI+K42SeHdM2RRMXkBtNNybS14OVTO2TszNNoKJ5JqPSorYUS6D0znOBzI8ttQ==@vger.kernel.org
X-Received: by 2002:a05:6102:e09:b0:5db:f440:f1b7 with SMTP id
 ada2fe7eead31-5de07ebd7d3mr2100093137.32.1763023683344; Thu, 13 Nov 2025
 00:48:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112154115.1048298-1-biju.das.jz@bp.renesas.com>
 <20251112154115.1048298-4-biju.das.jz@bp.renesas.com> <87bjl6wkf6.wl-kuninori.morimoto.gx@renesas.com>
 <TY3PR01MB113468318B32BF2E23953198586CDA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB113468318B32BF2E23953198586CDA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Nov 2025 09:47:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXqBOpczZ-Kw64AQODSh0Q8HEAzBseUjwD7TO+dKq9==g@mail.gmail.com>
X-Gm-Features: AWmQ_blYo73iDu2aXnp11g8_9sf8FYwelNX4VYfCxNFVK76qka1yJ2ScCZVozO8
Message-ID: <CAMuHMdXqBOpczZ-Kw64AQODSh0Q8HEAzBseUjwD7TO+dKq9==g@mail.gmail.com>
Subject: Re: [PATCH 3/7] ASoC: renesas: rz-ssi: Use dev variable in probe()
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, "biju.das.au" <biju.das.au@gmail.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Thu, 13 Nov 2025 at 09:02, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > > From: Biju Das <biju.das.jz@bp.renesas.com>
> > >
> > > Replace '&pdev->dev'->dev in probe(), this makes few error paths shorter.
> >
> > nitpick
> >
> > '&pdev->dev'->'dev' ?

Woow, that "->"-pipeline looks confusing ;-)

>
> OK, will fix this.

Please use English where it makes sense:

    Replace <foo> by <bar> ...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

