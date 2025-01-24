Return-Path: <linux-renesas-soc+bounces-12460-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E79A1B657
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Jan 2025 13:54:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB4FF16B7CC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Jan 2025 12:53:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C513442F;
	Fri, 24 Jan 2025 12:53:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CF013AF2;
	Fri, 24 Jan 2025 12:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737723237; cv=none; b=MserfcSMyTTJRWHvBfH50KdEj27PHy8mpHzD6YKdKy0wQFyyqZcOs4n1diXHWsUkJPr/AQJKzpiPqaLxLMWw2tneEa8MWAt7gdsRY7ZabjDWn8JVtzmBVOAx6DfhWsSmP0NKTuEW4JPY57skgy/eMx9BgjYPgVQ6CV9iGrvdv40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737723237; c=relaxed/simple;
	bh=OX4JrxR/4s1y9/rmRHQtUfnrJWHWTeUE/F8+osrOcx0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oY61YzlNK+twy855+zzzXSd9qwprpTFHkn1yqiG+sTClN/rz6Cs7T7KbEeEQX1cYPO4GEsNii8MRGSHO56VSAB7XX6KewvqrTmzDyqNzEpbe9RVmZm6/WuFU17lL+oMUnqrKnzY7AevbKHyAE9LyeD9bK7QL4FBNZjgHoy2Zc+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-51cccb020a9so1286919e0c.0;
        Fri, 24 Jan 2025 04:53:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737723233; x=1738328033;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8vCqBVQc6QVNSLONn1NhDnhThvyou4XtcZ0IncMgdkU=;
        b=LOkE9TE2CxZtdpbF55QEhKTPonLHu3B3IVUtyrTD1deL448A811yYRR+UvH3ZRA4nn
         lMq/9ngQZzqIKHdRkQ0KPVx+FqZs1m94/uTs9HQJq2J7RejGR2AWSH0l6SIvWfzMz+GP
         aa5/WzOh5i9aPiUvUppqtXeg4IZ64OCHsJHcUFTxbZDifD2O39EIVoB8bH42GchXShPZ
         xJ7Th0icIS/4OhJd9ER4isjGcrnE9f5BQl2uNo7LVT8hbJ0h/Aq+mLFDUkW7Y60kdjSE
         fn+irZcw1kJE84K8N8y0B3URTlc6xgLHw4BDcCiETyVSNnUi7YEYv3xF7JFaCZDDFm7C
         qunQ==
X-Forwarded-Encrypted: i=1; AJvYcCUD6DupGrIBRUtDU/t+OFSySEf6YaNViLZKQPupA61PmKf7fo9xPbF+Rf5rOS6B650nDFXiUEsjnIqoR6JR@vger.kernel.org, AJvYcCVKuD+N9wR4aSiD7kULF5FXg20UovHeAjl6pBQ2g8P8ETYWPdx29yDbJuOjYnAToeOUHdLT8nT9ArS4@vger.kernel.org, AJvYcCVblAFvE/azmB2aLmVcGzbc+Kea+Qaa/Ck2RZJiwKD0rO2M43CS/bdMC0kvaDSlWbkB7bbEk4Q4j+jXM35qF/iwX+Q=@vger.kernel.org, AJvYcCX7g1Xe45IY2sOV1vSk7WYeGXEmTzFDKOOD417Bo/Q7ZSWFWyMoUXxDxGeCKWAbqJ71BGe/4Nzi1Mt54qvW@vger.kernel.org
X-Gm-Message-State: AOJu0YyXfxe3eY50K52a59uaBUEp7FNA+uZTvOxFGGHn6hCIB04wofsF
	RImQlMMlP3EzRpgM38NuyCu6WUYL6T/rld8JUuwdJUPyR+T3bgvGbZWbTRr5
X-Gm-Gg: ASbGncsOiOTfulGxq1eDoyukQ2h0gZ8/ci3NuyKE/CO4WhavM8LvMDCaUwadTmu8Zqm
	UA3JxsPsik72wOmDDppHY0AvbSuchq8eGSN0Ut8EenMab9pzbPJJ/wMwAlzb6sl/VHWVdm5Rx1q
	ehdcwxiFcsjKoqclYBid0vEzEj+WEq2L4bG9hpK85sb0bGDLsJsY09opKMIvLk4+mykd5o+J6V/
	TjCxjriI3qJUpghEuYBY2pnEOEdaluP2SIJgJ9LbTBveTKb/oTIhcJgViQcOlBCU4MswJNpr0et
	AK47gOn6YTCyuvgVJz++lWpBEAgPX4SpjI84BBamTWc=
X-Google-Smtp-Source: AGHT+IHIJke78tbrjnppYK+Xxorv++56Mh39lFjqvbe1qQSpwJrD0VrW/IoRxSY0KPt0hHX+H/0xcw==
X-Received: by 2002:a05:6122:2105:b0:51b:8949:c9a8 with SMTP id 71dfb90a1353d-51d5b33f5d8mr26517347e0c.9.1737723233474;
        Fri, 24 Jan 2025 04:53:53 -0800 (PST)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51e4ea726b9sm362750e0c.14.2025.01.24.04.53.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jan 2025 04:53:52 -0800 (PST)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-85bad9e0214so841394241.3;
        Fri, 24 Jan 2025 04:53:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV4W+VGNnL451UAoO9C4gcPcZxA63FKZLM4NaFQATyCVnnGkIElOlQc8mbrM4Pr+0m1bbNlc7Sf7WQzgxID@vger.kernel.org, AJvYcCW0s8Z5gvtYve+oDn4c6vFYkb9KJ8PIFPfNEwcv1sULufUmrXvpMlsN8MxKWW2IvicenvhrsUjVV/7Y@vger.kernel.org, AJvYcCW98oybTFs56qwgqeEocc5E9k2lGsD5S56HGq79T5betB8Zshl4KGlehyi4l5mmZgZLPWeF1XpC2DeWfgKuHoKJFSQ=@vger.kernel.org, AJvYcCX85SZuo8Imw9h3Yl4QmUPTHNOVua6tzV+Ko0ilcA/ML436LosiYxMQQoXKasoeiAlNPzfhykMZgAjPUigo@vger.kernel.org
X-Received: by 2002:a05:6102:50aa:b0:4b2:ad50:ac27 with SMTP id
 ada2fe7eead31-4b690bb794emr25991463137.9.1737723232635; Fri, 24 Jan 2025
 04:53:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250120130936.1080069-1-claudiu.beznea.uj@bp.renesas.com> <20250120130936.1080069-4-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250120130936.1080069-4-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Jan 2025 13:53:41 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX79Qu3WvKQSWMSgJd9c6BH24uSxAp6=MMQoi0Ah4LaXQ@mail.gmail.com>
X-Gm-Features: AWEUYZnyRxV3qUkQe-uGiVRAcw_ytlQsurVkMdIOo7hXhHch4St9nd8fCg0O9FE
Message-ID: <CAMuHMdX79Qu3WvKQSWMSgJd9c6BH24uSxAp6=MMQoi0Ah4LaXQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] arm64: dts: renesas: rzg3s-smarc: Enable SCIF3
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: magnus.damm@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	p.zabel@pengutronix.de, claudiu.beznea.uj@bp.renesas.com, 
	wsa+renesas@sang-engineering.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 20, 2025 at 2:09=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev> =
wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Enable SCIF3. It is routed on the RZ SMARC Carrier II board on SER1_UART
> interface.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v4:
> - dropped checking the SW_CONFIG3
> - dropped the include of rzg3s-smarc-switches.h

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.15.

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

