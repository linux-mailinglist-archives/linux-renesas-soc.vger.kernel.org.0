Return-Path: <linux-renesas-soc+bounces-26844-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9C7D23DF1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Jan 2026 11:14:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE2D53016CC3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Jan 2026 10:12:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BFB435EDA5;
	Thu, 15 Jan 2026 10:12:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B6811CBA
	for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Jan 2026 10:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768471961; cv=none; b=tuQMu4XTj9+YOTovjYBOCnfRxa3LrRxOAn7cvaVjacD0UZQ68cFi814IW0x3c8qlWqYwHCv6R4raB7eO3uSIqHeDWUul6mSda+hjMuVvZBX3IYjtc+9Z/+UU8HTPvAOsiFQ9vTUTqpFsTonabINeV3hy1MIMBJvkEa6ToClg9dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768471961; c=relaxed/simple;
	bh=8N82thDgrk5p6pX6tvbenU7sVXEEobs2da6ZlAwkjnQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V+puw5Da62i2+4mUQx2NOlyMszTYP4KZlFl3RuL+hLu5u5nY/qspQPD0ZBM1CUfxH+P7ii+i/UmD15rGmLOz3eSYNbpeMizdCkUUTz2NKWc+up85VVpADPwiasejuL1oRGAI54WsrgYX1s9OSyruwKTST1Iu6lGXaD1As6SJKHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f65.google.com with SMTP id a640c23a62f3a-b876b691fbcso150436966b.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Jan 2026 02:12:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768471958; x=1769076758;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NfY7yocCbDQpyXldKITKmah5CeSNudO2PtXu0jreSTc=;
        b=kZFT5J3xiWm18rR5ESVer/OTVVceFm1Me/D9OgzR1kbqOagLTBjdgT5Mydi29N43YQ
         aZOpLewaEgL78XLOBRJ39QtCtVat8HEUSZ2deiGBcG1of+UOfwRSO6y25APycEkJjOr0
         Q6yE5nnlF9ClNkMEHw+0CveNYNfIhBzYyhfKLZtqkvU0TtuAqcogAPUPbTDtXBkAXI9y
         kbQmLh2GL9uR1PV9Ish0RJ3xay+ofa3j2I3m1gF0Hn45C9QRZS5hRYZ2WZc7HIwM+9xz
         ZL4Tl02wGDDqV+5OeauIePntU6eX6VbFNzwfpUieSaJy1fo8PD2WxDgq4JXbrIutIFXp
         Cj3g==
X-Forwarded-Encrypted: i=1; AJvYcCUWHJveJwLI0DxF6pm5O9Feu7rlwhae9CHmjLdwsTtzpG9F0i9V1oo+Bc59OhoETqrI90RHINRGUilYzHQBDtIXGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJJ70P5jwtIP27jS+3IyTcjAjliG3ywkx0A24adPC17NpUjAqG
	HepZa4XkZiNWFSZZ+F1LetN5cIX54VV/955gpoode5XitNwGqIpsDgMLgceqdO/wVgV9lw==
X-Gm-Gg: AY/fxX48ynQAv8x3BlmS+jj4eq8FgIY5JFrFh/jU4c9SyrQ8kJUO+SzLKO1I1Lzgmgd
	NbHTDK0ryj5cEm35TpdhIHVKuNMjK8V/hLUQhM6PF/FXf+Z5UPhx15K9mfSgfAAEUrO5lLsItuN
	k+z26TebRu+abopo15T0kVy3l3uvwg5Ukm62T8jS363GeMnu0WwdYYKKKZ/dMy6wNmNB6QL9KEd
	cm0SNj+4b4jO63AkLV3VjpeF7KA58j/8SwcM254ltk9XAryy74+9I+AmibLHQpdQ0bZzeHvZsb2
	lNjicXamf72fwOMU+68ER/kaNf2lRxMevkxm0qeoy3T+8xeDSlMEFQuqEAJxUUg8wziCeJGsx1J
	FdkBNz7t8ivkMFl2ocjY4fnl9rYYnvX8yj0ubjyf+O4CPLFxDMEKo+G6KL9pJ65iorD/SybL8aO
	PuC8lArfu0m3HN3z2JApuoKj5jlmEspYIiXQVOQZP2MNIfLZGR
X-Received: by 2002:a17:907:d23:b0:b87:e58:e37d with SMTP id a640c23a62f3a-b8761283a13mr483161866b.48.1768471958326;
        Thu, 15 Jan 2026 02:12:38 -0800 (PST)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b871f50cdc4sm1038099066b.20.2026.01.15.02.12.36
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 02:12:36 -0800 (PST)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-64d02c01865so1179888a12.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Jan 2026 02:12:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVQxq0gu0D74zLmXpxDxEZD/T0SIPHp+uaKY1DdL+rSMLpEJKEDmvdQA8DVXtNAIkOPLCK9ZRw9bpfj98Gn1WTUAg==@vger.kernel.org
X-Received: by 2002:a05:6402:234a:b0:64b:4745:11fa with SMTP id
 4fb4d7f45d1cf-653ec101f96mr4387853a12.6.1768471956067; Thu, 15 Jan 2026
 02:12:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260114154525.3169992-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260114154525.3169992-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260114154525.3169992-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 15 Jan 2026 11:12:20 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWJhmOcem=Au9xnrUGawjCMEsj=7LJFStcMRH5ZSPpwJw@mail.gmail.com>
X-Gm-Features: AZwV_QjFtS9gX1t1bcoAdGvEBCAD87MgrBFQL_PM1xjp6VHRWBnRuuHz0IuQFJA
Message-ID: <CAMuHMdWJhmOcem=Au9xnrUGawjCMEsj=7LJFStcMRH5ZSPpwJw@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] dt-bindings: can: renesas,rcar-canfd: Document
 RZ/T2H and RZ/N2H SoCs
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-can@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Jan 2026 at 16:45, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Document the CAN-FD controller used on the RZ/T2H and RZ/N2H SoCs. The
> CAN-FD IP is largely compatible with the R-Car Gen4 block, but differs
> in that AFLPN and CFTML are different, there is no reset line for the IP,
> and it only supports two channels.
>
> Sync the resets and reset-names schema handling with other CAN-FD SoCs so
> DT validation stays consistent and maintainable.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v3->v4:
> - Dropped Reviewed-by from Geert due to below changes.
> - Updated commit message.
> - Moved single compatible entries into an enum and to below oneOf.
> - Synced the resets/reset-names handling with other similar SoCs.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
But I am not sure this is better than v3, as it is 15 lines longer.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

