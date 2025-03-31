Return-Path: <linux-renesas-soc+bounces-15140-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC52A7655B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 14:06:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C496916A187
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 12:06:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D12001D89FD;
	Mon, 31 Mar 2025 12:06:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0465D1D5160
	for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Mar 2025 12:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743422783; cv=none; b=iB70NpI7E6pgW/7q67ZiBOY1HkA15Td7xxs3ZM5Rq6ViaccUAlGfkZ85oJv1+a7zScCHm3JN2yAsjOhRb/QOJ9FuDBqZEyTKbvMCtYI5PZBNJ0oAxQbgF5IBvb011h8vl2hK2ANdC/6gKK73C8qc3vyYgExuh7c5KmqtBmm9GIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743422783; c=relaxed/simple;
	bh=F4doezsjzGAkXIVsdgBRBKA0TyVu8FZzQMKH0nrrw6k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IGvAr+D6G1DNaHdNFQn5N9AE7kxrJZFHq1QVd9ncvocujGyBeU9OhFHPLYIeHupUtbqd70fJy/AqCImTY6KBms418XYp+L+gZRfkEivaUari7aQYEihIs3hxB3lxtn8ZkwwFx4dagaj8VwkgcMilSu3h6pYecXuBQPLxOZA17m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-47663aeff1bso43227561cf.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Mar 2025 05:06:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743422780; x=1744027580;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jnVzpIPjfuNYkV2+z5GWVf3RoFS63iMBrS4c64wVoso=;
        b=vlEspiBF2JkHBUcgb7qzxEijvgPHE8MEbnSjctZCQxZIAt0O7Mwm8uTq+aPJKyFVf6
         oLdOCZhSS1erN1C2EvFokr1dw3uMW1mhyZA+Ya7O4Zjs+Cbl5lpmbyCCcm0aJOGfbvvD
         HhRlh3qd9WIF6wZdQGsTLkgYlwuh203jo6E6hhfCwzpFoBXpwCXk1ZrwIxHNyIKH+dFZ
         jIGl3XQI45IMNYUdA36u7/SWasPT65P7CGXQLr2P7CbEjYKSZ8V1BZJ/HLnmtSJ/YmdG
         3zw7c6bba6QinopNOyITEYud2ygBuxKc9dggQLaveGgA3XnXT7CRUfuAH69Cpxk1cVSp
         aMyg==
X-Forwarded-Encrypted: i=1; AJvYcCVepXOzHh3cLp4Zx/HWOISdNjGdEsk7fAVFfzkwgv2NMIIzvxALV5ara2AemuIGhBhpIpO6ZhKUuFsWML9vo6Jxdw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg4iDibZlk+7FpT/k9jpwMXpIqHw38kX2/4bEKQNO059asPQqD
	Jdi6s1EsA2p+eCUiKW0uEHZt1mvy2Wrrd3siMtS1JzFtIzfqSibLngBOmc7o
X-Gm-Gg: ASbGncsen7JvtIBNqdSzoVKyvDaH4k68F9AjE5bNkDPSy71vqIbWdt9rVg9uLchAqWT
	NhovIVvsDtypzrpAMHM47ObvOfqx7MTY950/oIbbCA4z6ESvyj+qwPL9cXDQe5OZ8UdsUQaRPvc
	1OizscL5P5JU/edFZaxz/KAvylKViH1u+wj5zxVrNb0k8V1YN6VtCBkuOpHowAlNPo5KbXrjm/j
	9gjbn+WTAoQaAkkYcNOPNduF9CvI528YxBPWK18jj1jdxCidNQj4i7k2Y+92gQ+bm6UWkaNw5eL
	1Z9aipe1m7/eHX5un2FAYjo+WCgNtES/lnI+iQYserq8tg4hLvkHFT3k50zYnm68xK6bcNXmzTE
	0C7iYZ5r59U0=
X-Google-Smtp-Source: AGHT+IFaUhcAD4aMns49bivVwE8ccI/hfa8Jv8nki6/uCbgNOYSK0AaDyAm53+1HvZ4PrFsL/iJcJA==
X-Received: by 2002:ac8:5fc1:0:b0:476:fde3:8a63 with SMTP id d75a77b69052e-477ed7f6ff7mr148566331cf.33.1743422775589;
        Mon, 31 Mar 2025 05:06:15 -0700 (PDT)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com. [209.85.222.178])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47782a7feb9sm50426891cf.43.2025.03.31.05.06.15
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 05:06:15 -0700 (PDT)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7c55500d08cso396732585a.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Mar 2025 05:06:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUhVGXfTtx0jNvED4seTnNh0x267XoT1g1e5Rm3tLkkx72EmBhCNiugUsg5fhh6MAc9QwgsIrUfiENgAgGw+O5/aA==@vger.kernel.org
X-Received: by 2002:a05:620a:2442:b0:7c5:4673:a224 with SMTP id
 af79cd13be357-7c6908cf636mr1267288485a.50.1743422775175; Mon, 31 Mar 2025
 05:06:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250311113620.4312-1-biju.das.jz@bp.renesas.com>
 <20250311113620.4312-3-biju.das.jz@bp.renesas.com> <CAMuHMdXiGZAy4thzWq3JYDi9F=0DASnEbAk6S-+hDY8Gcs_jMQ@mail.gmail.com>
In-Reply-To: <CAMuHMdXiGZAy4thzWq3JYDi9F=0DASnEbAk6S-+hDY8Gcs_jMQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 31 Mar 2025 14:06:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXNTQiq+4JaNtf9dA0y93EiS_bd5_29rk4p0swO-ZHX2w@mail.gmail.com>
X-Gm-Features: AQ5f1JqEPz9GNxU0fMZZJoyliYUPlWNJFJlELMznkmhQtnEoB4tzo_ZgxRUe8ws
Message-ID: <CAMuHMdXNTQiq+4JaNtf9dA0y93EiS_bd5_29rk4p0swO-ZHX2w@mail.gmail.com>
Subject: Re: [PATCH v3 2/9] memory: renesas-rpc-if: Fix RPCIF_DRENR_CDB macro error
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 31 Mar 2025 at 14:05, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Tue, 11 Mar 2025 at 12:36, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Fix the below macro error found while moving the reg definitions
> > to renesas-rpc-if-regs.h in the later patch.
> >
> > ERROR: Macros with complex values should be enclosed in parentheses
> > #define RPCIF_DRENR_CDB(o)      (u32)((((o) & 0x3) << 30))
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/drivers/memory/renesas-rpc-if.c
> > +++ b/drivers/memory/renesas-rpc-if.c
> > @@ -56,7 +56,7 @@
> >  #define RPCIF_DROPR            0x0018  /* R/W */
> >
> >  #define RPCIF_DRENR            0x001C  /* R/W */
> > -#define RPCIF_DRENR_CDB(o)     (u32)((((o) & 0x3) << 30))
> > +#define RPCIF_DRENR_CDB(o)     (((u32)((o) & 0x3) << 30))
>
> The most-outer sets of parentheses are duplicated.

I meant: The most outer set of parentheses is duplicated.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

