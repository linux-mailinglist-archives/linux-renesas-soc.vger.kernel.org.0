Return-Path: <linux-renesas-soc+bounces-7161-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 909AA929EB8
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jul 2024 11:12:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 45B371F220B3
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jul 2024 09:12:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 012584AEF7;
	Mon,  8 Jul 2024 09:12:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5DC3D0AD;
	Mon,  8 Jul 2024 09:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720429947; cv=none; b=ISgpoH1fRTKz1QHjPNZs4X/yhrfu3BSMrjYH/RkkMlqS3w+pAWhuPy2HV7YXBVJPQFjGiD5pbwSer5zAciT70xnVJwQ6qDTBQQoDuBEgb/7XVwufNT2nTidWpLoaVJ0qH0IdVw7kY2ob4rggNplTGmLREClFYk1yeVwlngBC2yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720429947; c=relaxed/simple;
	bh=Msc6Hmmrg5Kdw/mXY+luoJ+gd/g4nbFw/BtDhgNLWXs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UVYjjaYcpJ2dRPvReRbB8cH330Osf6+8/cV69ZQ8iJZfAury2Ix4qFCYoIIvZCp/4Y74/98a0vUgo0VMSVSMWpMCmG2OzYsM1wz8ryHGY9kkhF5d+YjrEEmLCy0K0sQ9PqSLMXRSlOOK9XUHrM3HSgefkuuF9owoAf4gUPHrwUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-df481bf6680so3526482276.3;
        Mon, 08 Jul 2024 02:12:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720429944; x=1721034744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ahnkBbNvvEAsWgJb+04cFvvCw3S6uxcgTdJsZlM5V2s=;
        b=RDTIyAcwU6M9Vp1Kv1urJ8rKxTdSuDNMJ3s4JvnNf3rtkkSu91gdb5hMK8yGVbrEDy
         OGxRcZXC/vhDbUmttHwuxFSaM45mFcA4zLs8wfNqxRpB57CNKSWNegkIC9L7ZNOdi5Ky
         3v2rGUp79HNSNElBvj6PZTI3h7CF5u3j7yuACXAP8tOhUaJR6W+170jU63x+WaLJYkEg
         xiZNUVBuHTMW08wow69uB4mFAQvcoE4ddH/CMHLBo/V9wukcCtVDifTVSkAJIG28w2Js
         D2sJBp4drkgpdSn73LN512PWSDffj62ZLw39th9+KGyEYn1pbd3m/OMd6v2KitDbTqna
         mqKw==
X-Forwarded-Encrypted: i=1; AJvYcCXTfICNuElbfwvoCcxcqjmqzEYhso0nZWydnSAJNB4dwUFfuJnZuBFBOja+W9HgzPNbFpREyQlTLyMGwTWS5dK9F+Ryo82fLW2p9i+twh1L1CwsKDtmrdJIO0E+s0DgWCJw0hawv7mLZv1MgHw1r+lqP9Zy
X-Gm-Message-State: AOJu0YxjcRHeClXP0ki1w03Sa2Yyam5eQs9oeIMLoW/TuG5VEHOrCnw3
	E/VlF9/r/DCcuBEDnf8qEkK2h9SByQrvgcCYrO5GKAa6Y0BQDG8yssM1k49o
X-Google-Smtp-Source: AGHT+IFvTr1lvK9gLaowwMwdpXRG5XDrfhpvIesJBw0vsQDYLMsGQDBOc4xQ4kh/JR+NKImV2rmyZA==
X-Received: by 2002:a5b:88d:0:b0:e02:6e8b:af7b with SMTP id 3f1490d57ef6-e03c190eb4fmr12092630276.26.1720429944228;
        Mon, 08 Jul 2024 02:12:24 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e03aa2a149asm1884317276.22.2024.07.08.02.12.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jul 2024 02:12:24 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-64b417e1511so34017757b3.3;
        Mon, 08 Jul 2024 02:12:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWUfXpcyFoP2jYKdxw7ufpwqv4zssba3MY8/JgECa0YXbPf/mAPTIPMo2AzjF0muBSkU1hxYQI5R7FfG8JG/fAaMA6inQcVan2kp9lp8xLxAAMNGO4pxMqmlL+dyBOq7TfV9PuIV6XYSc9Qp/2o30gNO7D5
X-Received: by 2002:a05:690c:4c08:b0:617:cbc7:26fe with SMTP id
 00721157ae682-652d5b0f582mr138841157b3.16.1720429943806; Mon, 08 Jul 2024
 02:12:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240708083553.30799-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240708083553.30799-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 8 Jul 2024 11:12:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXQD5jdAEzmgzh+TeSfTbHvJTePE6CdcVTLDNMOka-dHQ@mail.gmail.com>
Message-ID: <CAMuHMdXQD5jdAEzmgzh+TeSfTbHvJTePE6CdcVTLDNMOka-dHQ@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: rcar: Fix PM imbalance if RPM_ACTIVE
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	linux-remoteproc@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Mon, Jul 8, 2024 at 10:36=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> The pm_runtime_resume_and_get() returns 1 if RPM is active, in this
> case it won't call a put. This will result in PM imbalance as it
> treat this as an error and propagate this to caller and the caller
> never calls corresponding put(). Fix this issue by checking error
> condition only.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch, but the code for pm_runtime_resume_and_get()
seems to disagree?
https://elixir.bootlin.com/linux/latest/source/include/linux/pm_runtime.h#L=
436

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

