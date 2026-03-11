Return-Path: <linux-renesas-soc+bounces-29199-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aNS3FS9wsWlVvAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29199-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 14:37:51 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C798264AC3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 14:37:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BCBDC30635AE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 13:32:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F084A2D8DC4;
	Wed, 11 Mar 2026 13:32:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6F731AAAF
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2026 13:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773235927; cv=none; b=iEVHHVm0aY07CaQtVYxbLJRDujvrCgzwOKN4l0qaREHvXi0swppMHz2gZo7A3aL5ys/pJodNgYOOgXdOWUWxix5FlrpjDAM4BxrzgbvKXq4dUjhRZrXa53/5pxEeL96e5LfZYcn1JeVW/nMAUR0tnAqQJkzyAMomJJFOG6Ob5ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773235927; c=relaxed/simple;
	bh=TEGOliZPIKjcYMq/SlpUhrjTFTqBozUfJkzHQj68wwc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PUgaNU8guNl3/auC12tZrkVoUg0oD24g9Iq7Q1xrGXkG8EQTDf3iQdaHgTyYjpaxl1qg+l0vs8hQOuUX3Crhv01udwPxwmadRyHrG81H5RWn0NOg6hIaFBrQQA1f19zwpwlaOm7KUCi36Sye4ZKhvvdwTctE90Hs0uf9t2DWFh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-5ffca37e8cdso3703700137.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2026 06:32:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773235926; x=1773840726;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aFGeq6M+ANIk5ThSAzANkY3DpNoGSDLWjfwUeKz6NR8=;
        b=ThLllop5D8KCxsF5nySuSbaNpVkvTymoXaudX3/G66RtTECZfbNehvralk8Zi1HeTv
         w83IgtX1WovRiLJF4G8k/vOgqJanjUfFJv/iCmy3CD30Vcpu6aHvjAaDsORn8VwdBtmC
         hfgoiKR4yEG8NPxp+R7oaRhBqzDa34WCe5Ehu94qp7bHwaFYqbvjmVG+EnawgP7myiLy
         KKcIKEqxArG1BJvAhjCv3rP241WpDI7HkCw2QC0IeeI1nPZvJr5iMiAvnVdY/DvoGNqf
         +aHQlfFKoKmceIywho6kr0D+0k0nxMgPtj9SBIP1ENRju29vJjGghnt34HrgOMpDOYk6
         Hy0A==
X-Forwarded-Encrypted: i=1; AJvYcCVpQumJpoCqWBJR8hA7rPjGxQx/Iz9sYxGpJAL9Zxoiqe2y3XT4ftyviUM5JXzCENs1Di848ahZ0xNnajIiDZogdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5mzz81UfnKlSRmE1YfPHrfmIg1CUXgYDjd4fIVmx+jN4QFwM1
	y09E3+IESytAT8w94qgRdno6YP8cwWOd1Udzm64B9n2YAHp4DomfiT9FWIYu/kHX
X-Gm-Gg: ATEYQzwYbPn+/jbJjgoq3dXtbPyuBRTJ76bVhRWe60qI0uh5VW7WkV6AUDYChL45nFK
	0DKRLKTIfpb1DertKzQHgR6vQrfREcz0kxv917JgXgT1T8qyo4bChGiKyahFtUg8MxnSaZmTml1
	BNunAUWEaI6rF3YKJBl3ENHv3bqeOBecLJakLpKURyAAY1b4YXzZB1OW/VeHDr0zpirqqMWe5/9
	89qfOnATUDC67rzpS2cSmutga+6tQ8oeVClC7Zv8pmj1jMENpJ5LWkHBpBZ9B+H/1+Aerf49VQw
	iAkzR4Tl4iCg1e/SIrsc25KXmEhFc0nUxthgriYm1J0fSIObvuSA5mB02vm2wtTwTiaAi6Q8Q8l
	K7DDIci1/W5XMeu1KNGhK1w7VM3Hukxe/MkURMLCFWQBcBVwAja+igXbfCuLax/fPCphFK0CIeF
	uqJ4MD6TmLPAuPiJIHvoCROQIKwuosIN3Ca9xsAVTSuF9jS2ErplNeG5Wdbgo5gh2S
X-Received: by 2002:a05:6102:dd2:b0:5ff:cc82:744b with SMTP id ada2fe7eead31-601def4d580mr1020020137.19.1773235925441;
        Wed, 11 Mar 2026 06:32:05 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-601de6ca1c2sm702264137.2.2026.03.11.06.32.04
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 06:32:04 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-56b16428b77so3863856e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2026 06:32:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWCqS6saPO8IM2Hn4waViWbJ/p53eVxhyd+LbxgFiXOhleTD6MRjeOEGNCijc4CEX9eumdx6JJi6+bsW607J+ncLw==@vger.kernel.org
X-Received: by 2002:a05:6122:c96:b0:567:4576:534e with SMTP id
 71dfb90a1353d-56b47436dc3mr914567e0c.1.1773235924026; Wed, 11 Mar 2026
 06:32:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260303233314.2928711-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260303233314.2928711-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260303233314.2928711-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Mar 2026 14:31:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUVj+2OfbBbLPWtes0=oQ2Z8s8dejFGv7fu=MCGaUJhgA@mail.gmail.com>
X-Gm-Features: AaiRm509M_cbkmHsZuryn42P-hmBtw9lLyP2WI9rw9d8OsbMr-Zga8Z06XMDeEs
Message-ID: <CAMuHMdUVj+2OfbBbLPWtes0=oQ2Z8s8dejFGv7fu=MCGaUJhgA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: renesas: r9a09g057: Add DMA support
 for RSPI channels
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 4C798264AC3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,bp.renesas.com,renesas.com];
	TAGGED_FROM(0.00)[bounces-29199-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,glider.be:email,renesas.com:email,mail.gmail.com:mid,linux-m68k.org:email]
X-Rspamd-Action: no action

On Wed, 4 Mar 2026 at 00:33, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Enable DMA support for RSPI channels.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
> - Added all the possible DMA channels

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

