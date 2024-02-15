Return-Path: <linux-renesas-soc+bounces-2826-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D255855C71
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Feb 2024 09:28:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D82AF280611
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Feb 2024 08:28:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0026111702;
	Thu, 15 Feb 2024 08:28:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E8EDDD9;
	Thu, 15 Feb 2024 08:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707985731; cv=none; b=FwLHgHS7zK/QSOFJAdWqQLg6EHFMtEeQ+yYELn/g8W4LTQkRPlYk7ROIyqnOU7f1v2DhBOacrWTHtqoFr4e/5xr0EDN+N+WKogb2pTOI3NTVsteVv7mhJ1dExrQJMxndwzvsU4g62nuXZga99QdWgS974mwLC0+HtLIEuMQ2v2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707985731; c=relaxed/simple;
	bh=+yCxwEKKSG6fISdJT1tUcPSgfuvsXTudLPDveVFJc20=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rbnubvJNUweDQSYSbuoSumf7ETd98s372lINKQYxU37wRTwxEtPVnSx9L4yrILlwSXJ/aiX4wEmZnDyHQAS6JOdZU3jkVFn+wctJazOhTOHu/EOv0x5ysaI6T86X8vrFdfF6aeYVN+axTGR41Grs1J3R/otokrx2zS1N9MWpFMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-60757c46e34so5504787b3.1;
        Thu, 15 Feb 2024 00:28:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707985729; x=1708590529;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=74P+OGTCQd9afgZ87N6w9iKczJuwqlWRYbhKOMZQBF4=;
        b=dWb0y+CfyjFYT/CXWVyaUKr4bkR7pIaPydjaSV+pfihQdpxSmPkapTqy6jhq62LSD8
         3HpYFgA8NYVOXnMLvgySvB1Cc3DpWwkJnaotqO68BAv09nnh/X4UJoCbGvqCj+yvfTPu
         NLHB2M2g/Lv01XiXmtTOgzlzl2uv0Q4uk6yO+K6MmZEDR1IyjyKgZ2SrqcCGFaLOnOc5
         zr9i5tBvoWk/Ji2/+/2UbIz4JqZQ9whj67VDI6TTtPEIdm+iCsKimn//k14YMJW6fLJs
         oOr4Q1U/a5L9eHtbUwA9EvZ7/4CSdhcIdVdtubXuU2bMvFo/RsiWdhpHExY6tnkLEiLc
         SPdA==
X-Forwarded-Encrypted: i=1; AJvYcCVfwWxOKtPQPseikCXdXysSHM5Eoi1KpnDAiI1Hmf5HoA71tdD9J5eL/4ADnXeXVT9fuar1xSd9rDEuAj+e8LD780lMUFauh3NAB9//3G+rgf2Fv5xMj4y9pHRSCCkTUWXXHcVj0/AUAX67j4nX
X-Gm-Message-State: AOJu0Ywlh1wxszytmaAzYesM00QvW5avGpeK8cDQWDevhQ9Bx1c3hGQr
	M7stlKrMNq+CRLB3ebbfIiHShm3a6tWXD9842owA03WuZtS1DAF7z/SFfRcVzGE=
X-Google-Smtp-Source: AGHT+IECYy1kbv1UjRQyl9p4HPR/2Y3rfQJW+/G1kbqSoHV4lldCeTDd/EV+WmsphGE3RfABEgdnYA==
X-Received: by 2002:a81:6d04:0:b0:607:c7a5:d1af with SMTP id i4-20020a816d04000000b00607c7a5d1afmr1060646ywc.16.1707985728853;
        Thu, 15 Feb 2024 00:28:48 -0800 (PST)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id c4-20020a0df304000000b006077f869225sm160827ywf.73.2024.02.15.00.28.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Feb 2024 00:28:48 -0800 (PST)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dcc73148611so613861276.3;
        Thu, 15 Feb 2024 00:28:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUgcTVgsN+enYfdSYOHWHXmGntn16ZgHBs/1OkT3FYegBNLS3Ty5KnJumXLIR8K5ccHxv+L+yUkMAhDv4cq+6fgSm5NPE4xkyWFFf5jPb9ppqDcbB7inEaEPLzOlwo7wMxK7QFSL4kViVRSfmfD
X-Received: by 2002:a25:b282:0:b0:dc7:46ef:8b9e with SMTP id
 k2-20020a25b282000000b00dc746ef8b9emr942868ybj.29.1707985728513; Thu, 15 Feb
 2024 00:28:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87cyszpwmp.wl-kuninori.morimoto.gx@renesas.com>
 <CAMuHMdXih9g46JKvz_UsjH3h_OrJOJLnFv6ixpYjE6Q4DRxbsA@mail.gmail.com>
 <87h6iahb6o.wl-kuninori.morimoto.gx@renesas.com> <CAMuHMdXAbbVs=OOkqsKz11e2TtbUWSMxNAiG+kus_T-0cr_ZdA@mail.gmail.com>
In-Reply-To: <CAMuHMdXAbbVs=OOkqsKz11e2TtbUWSMxNAiG+kus_T-0cr_ZdA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 15 Feb 2024 09:28:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVjDfpsyXbG3ZPJ3YWup71kAUevV8CX+1tcbGmG=80nDQ@mail.gmail.com>
Message-ID: <CAMuHMdVjDfpsyXbG3ZPJ3YWup71kAUevV8CX+1tcbGmG=80nDQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: renesas: r8a7778: add missing reg-name for sound
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 15, 2024 at 9:20=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
> On Thu, Feb 15, 2024 at 12:35=E2=80=AFAM Kuninori Morimoto
> <kuninori.morimoto.gx@renesas.com> wrote:
> > > This never triggered with "make dtbs_check", because
> > > arch/arm/boot/dts/r8a7778-bockw.dts does not change the status proper=
ty
> > > of the rcar_sound node to "ok".
> > >
> > > Can we just add a line to do that, or is anything else related to
> > > sound missing in r8a7778-bockw.dts?
> >
> > In my memory, first BockW support used platform-data style
> > (=3D arch/arm/mach-shmobile/board-bockw.c) but was switched to DT style
> > after that by Ulrich. I don't remember details, but when it switched to
> > DT style, we already focusing to Gen2 board support. So I didn't use it
> > via DT style. I guess he didn't test it, because it is missing many
> > settings to use sound on DT. So, just adding a line is enough anyway.
>
> To clarify: adding the line is enough, or is not enough?

It's missing (at least) pin control.


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

