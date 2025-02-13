Return-Path: <linux-renesas-soc+bounces-13137-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9E5A34A95
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Feb 2025 17:48:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 77BEE16EA92
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Feb 2025 16:42:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2B6A241684;
	Thu, 13 Feb 2025 16:37:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D6C23A9BE;
	Thu, 13 Feb 2025 16:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739464659; cv=none; b=ebFRLKaVWhU2KTe4PMEvGfE1uX4qRqlqz/RlyfZNfYuszOmF7Hy+eB2nghRXAwr1qoqUwLsWQfeuYGgIkwxq3UvXe94mb9vve5TSrY3gpSpT4PODr1uknXu6CUeKFMDWUgc6fPDzyqLJn9I/w1nOJVZ4u794yg4VWK8eNOyXAW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739464659; c=relaxed/simple;
	bh=CK0l7lhLTq4Xp3yGLyuG+nJaX7lurAythDmF7aJVzos=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e5hesszMd0NZiRweDSr3aZLU2wYdQYLqfQTvEO5HRLTPF4ca3zuGrvfg/3WrJ+0e1+RcOF/GeJxYlAVHwlrUlqTaudu8muWchbVch1EbFsDlnGUtuYGdkUxlV5csLztKmum0hKYEvM8jqVtoR93QX7ULZZBz7m1j0iSY8dAJcWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4bbc406499fso265645137.1;
        Thu, 13 Feb 2025 08:37:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739464656; x=1740069456;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XGv6Y4EFWbhWaAQ/I5rgl8Ej7T+QeeGkeoFH3pU7Lio=;
        b=AvV8L3UyWMIbqCrye3h5KmEMH6oHFc2xgRlkBiB35o73gil9wpMxsyPc7t/NthmU9A
         m0PWkKww80lLyMenEH4yuAJwE+tknWYWQQihB7gP/RkyRlXdbQYM/0hnv+lB3CsrSMrC
         SQICUjMJhYj31GGbDO/b6SR7Dz48IVMzcssLOBcVDwJCHbwIpF8n6M4FO68pCR0xoa9n
         Y1IbQPioXZs10m73p4F93qOLqbS2PF/1hlFEmvv2MPT5W0UqCN7ly3TkmK8tECeBV9/q
         rxbqxzwxAnnbGapr8GObBqXn/08pYp36fLUoMNZDDq96TWzzWRNJANDKRasjVx3WuYYQ
         40rw==
X-Forwarded-Encrypted: i=1; AJvYcCUxyy093YOjyutriIUcLaXdinqCRuw/UNc7ZhaWqSlrnsyI66/o3oEBmHdsWcL5lwRX7TaSI4IrrRC2@vger.kernel.org, AJvYcCVdTBttaZ2fbCx5/8cH1KfvYhkcND1phUTk5eBcLTpo86e2+vbDXJhnuIeEYyvD+yEN/NLzMMDQU9ssM2E66Dyvs5o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4LTluhiavYnzJHd4n0KrhzL1yBrVG7gsn/pL8ThvXjML5r190
	rZQppzAld8r5GHDFSEpg7nQkW9DnP2892126es04sShDBbKKQbd/gYzBgtT88RI=
X-Gm-Gg: ASbGncssjGc23Aq3jFIWP1WhMU+35G2Edid9RudC4q54APM97bUyg+4MWPqWqSMp8ox
	4NxkDPhwGBa6vrIINmBPuZtMAofo8nz1rdWhFSQeMQLcdhSURom7GhGzcLvmVsYMEAIPjwM87oA
	gUc+RKNy8mJSIVf3FOzTHlI3/84G9jb3u0a7OYQuvml+jzKvDM1VNLtug1FQFYm8Dh+Apb67R7a
	cnGDgNCyWxhC1FnixhZqZGQw70uiMquySkYVohcyRHHzqPkVcef3spTVpV0FQTWvRKjUkTZZQSR
	YjaNiII4DOY28ohI8BAQf6mz3Fy4x8dZWSWiUpmdBu5cncx/d/eyJg==
X-Google-Smtp-Source: AGHT+IG5O89mRMMeA2tLeQNundpG5OUxEHfxFxGe1SYYxjzieWOQJ0bZe8xznj40HaTI43IbEVAO7Q==
X-Received: by 2002:a05:6102:fa5:b0:4bb:d062:43e with SMTP id ada2fe7eead31-4bbf5271be6mr9125990137.0.1739464655739;
        Thu, 13 Feb 2025 08:37:35 -0800 (PST)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4bc07807a1csm207538137.16.2025.02.13.08.37.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2025 08:37:35 -0800 (PST)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4ba722d3916so332501137.2;
        Thu, 13 Feb 2025 08:37:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU5IRXUS9Vhi+F7Amt/sqMpxSPxNY306Lv1CEUH1EUIynDBbl0xy4ECyddT2X9/wVNWUzv0HoxyWnH6@vger.kernel.org, AJvYcCWQ+MZR1xd8T5iXaAzSjcVF6wKMGnN0+CD4NLsy6f7WVTtllQQFQ6gFKvRVrnS9MyERhRQ6jS4a3ETQWfkQ/v7pydo=@vger.kernel.org
X-Received: by 2002:a05:6102:a4c:b0:4bb:d394:46cc with SMTP id
 ada2fe7eead31-4bbf54922d5mr7706927137.2.1739464655329; Thu, 13 Feb 2025
 08:37:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <875xlrshp5.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <875xlrshp5.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Feb 2025 17:37:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVRuxPR7JjEnNV_UzUvsrGtssk7TFKK68u0QZiuYALQkw@mail.gmail.com>
X-Gm-Features: AWEUYZltp1ERIZ5YEJFcR7JiirUl6G1Yz3PhWzhWKoBojAQL0s9SOJj4pvG6kQo
Message-ID: <CAMuHMdVRuxPR7JjEnNV_UzUvsrGtssk7TFKK68u0QZiuYALQkw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: ulcb/kf: Use TDM Split Mode for capture
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 3 Feb 2025 at 06:47, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> Current ulcb/kf of -mix+split.dtsi is using TDM Split Mode, but only for
> playback. Use TDM Split Mode on capture too.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

LGTM (IANAAE), so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.15.

AE = Audio Expert...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

