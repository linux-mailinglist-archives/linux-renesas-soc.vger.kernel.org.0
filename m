Return-Path: <linux-renesas-soc+bounces-10721-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E42C9DA7E2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Nov 2024 13:34:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 78F99B2C994
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Nov 2024 12:21:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24C491F9F7B;
	Wed, 27 Nov 2024 12:21:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318241F4299
	for <linux-renesas-soc@vger.kernel.org>; Wed, 27 Nov 2024 12:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732710102; cv=none; b=a1ecHI3Gi7dmiehVh9KIKqUyYy+50gdu1zzLZaQcH29otVB8/jXrzyAvFxFHm2kl/sC7rUuBh9nvbqvRN69KVIHH6ZZhF2Rep8QlVg41YDaFO1633uzzeiTbYFkmO8BWUDEa9SJ0fcmT5ZZWgxmd/pguaD8LtdnmNAdQCoo0t7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732710102; c=relaxed/simple;
	bh=37/40gNErqQrOFXdLpMd7PaOchEBKPuDEfrK+uTngvs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lUme6HXq1jiIOHPHBSpYKOBe7VFI1fi71PfdlgnRMSGCGTbCcSo+5CSPQoui3MsjRU2V8lWMZ0A7y4AH6wS8U71qj/DNBRaVjkvvJRNRwrV/i4uCWGgpgsl7gmmmYxrRHNEJ+rLS5HmTGKRyFXyrCE0L0d4Sg9g8AoUqB7CjID0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3e916196023so3053503b6e.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 Nov 2024 04:21:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732710099; x=1733314899;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WqZtqIp8q0Vr7PEluuoCPWk/fyzQgZNIuppdD8F6KCU=;
        b=upAe60rxWd1UEN9OD/mBjN52hA7ytQJEBmC2f6hlUu2z0nItv7pvgJoBKh9EGYhn0O
         NJTESBoyDY5Zl78JwyOp+9Y/BlpwhvO+7NVPcGqIJqjUEQMFyZ8N6JKWC+PIwqeKUDlG
         DmQgsy5AY9rIKsSYgPlhRCy5w+r1+LddvPQuFaQctdfCK0hF5Yayo0KOUEgMDeEDoa6s
         eTERCYuPIsu0DzP6OdcpJi02uvy5Lfbt7VHoVGJ1nT73wZmAsqTCeI8YT+xY/4e8Vhkh
         A2Y133T5u4fSUOeLs8sNZq1xZ6Yb7u/E/K9IIItRCaEJuBqYf5xl5Ijf+HdheL1BEJ4O
         hbSQ==
X-Gm-Message-State: AOJu0Yy6ilrhCkfgJsOcg1wH0sPJS7ud3ljW6ItlfakxFSaATm2srRt8
	stSMJL/nieSrdiEuF7qq0jBkgSNhFaSzauQGUpFGkUBMu31pOGMbUrT6uuK0h3k=
X-Gm-Gg: ASbGncsl7D31lXdVTDcfPf+/ZJQ9f3nJg/KssmNO3Gn5SFLu8D9pLDPJLHmRLrR3hpQ
	62txJ1/mP4Pd5qao7iS3g2sONKAxFyKlyu7gfFHkPDrrB3ciD0jFioGXdICl6FhGzm5lKd57hZA
	7ojwAdYvFVYC964HV00zOOH9rm3ayeXvXazN3TFZI0RMMvPoY/WdsaJamVQpR80Yrb7ehxTiWp/
	L/agTseaPZFYomOuevvw29YFI2jUCLs7X/EKBxiHPbHyIXbwQt+OAgijqwkT/HgHDX/uZa9W0up
	UfN52WxhwVe1
X-Google-Smtp-Source: AGHT+IEhWTgrtN255tsI6Z9nUxxR1pajVE51mvyaobViFwi4rC/K/38wCSbfno5DfZzBQs4Bvyk0Ew==
X-Received: by 2002:a05:6808:1b20:b0:3e7:ac6a:213c with SMTP id 5614622812f47-3ea6dd5511emr3087859b6e.28.1732710098965;
        Wed, 27 Nov 2024 04:21:38 -0800 (PST)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com. [209.85.161.48])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3ea5c94401bsm1106742b6e.40.2024.11.27.04.21.37
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Nov 2024 04:21:38 -0800 (PST)
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-5f1ecd0d9ecso1398362eaf.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 Nov 2024 04:21:37 -0800 (PST)
X-Received: by 2002:a05:6358:678c:b0:1ca:a437:331d with SMTP id
 e5c5f4694b2df-1cab1681dc8mr214345955d.18.1732710097693; Wed, 27 Nov 2024
 04:21:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87wmh6pqje.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87wmh6pqje.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 Nov 2024 13:21:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVRnpZ=H=kNKzEN_Xq_ZCEcJsYOKcdE3tjd26BLnEynLA@mail.gmail.com>
Message-ID: <CAMuHMdVRnpZ=H=kNKzEN_Xq_ZCEcJsYOKcdE3tjd26BLnEynLA@mail.gmail.com>
Subject: Re: [PATCH] arm64: renesas: ulcb: add Sample Audio Codec settings
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 14, 2024 at 2:12=E2=80=AFAM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> ulcb{-kf} needs amixer settings to use Audio. This patch adds Sample
> settings for it, for not to forget.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks, will queue in renesas-devel for v6.13.

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

