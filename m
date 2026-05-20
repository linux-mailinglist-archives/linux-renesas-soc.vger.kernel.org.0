Return-Path: <linux-renesas-soc+bounces-32846-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOmkMGhpDWquwgUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32846-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 09:57:28 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E2F589412
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 09:57:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6D8D730327CC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 07:57:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDA0F39DBF4;
	Wed, 20 May 2026 07:57:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FAB83A1688
	for <linux-renesas-soc@vger.kernel.org>; Wed, 20 May 2026 07:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779263842; cv=none; b=JUBFXxFz9J15C4YPICzPte1s502pxW5GXEDKTxuj1BcWo4DEeGjxZOVi+bk/H55JGupZaVT/Wrr7/jEzbwl0WxKBCzT3UdFrCzqSCNsz4OAZ69pIMV8oJL71dYVRyFdWTKMHDDF5Si+9BEkFA7r1IZt4TlXJjN+tVPp8mNyT6VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779263842; c=relaxed/simple;
	bh=vttU9sqwDyiNjeIypWh2+4bpJ0lWzS7An9QPEHok0rk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IoWomEd75wjxs03rwCkodtrzHJ+ES+2iSsyecU1xQnYL6R1J7vkrgF5rRT4sF3JR/ri273iaRTLlRrOaF07U1k+Vgi87H2kTc7Mtut3eqM1Llc54ZzI7TYi3NbLK9ztZYKS66cZwvtArRofnmdeKmFCaloDKStydiiLJmbbFJQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5751b7d147aso1617543e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 May 2026 00:57:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779263833; x=1779868633;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mP4IvGyOQMv8jR6AqNClc2139GxxUkZLqrvZUOhN+08=;
        b=ZqR9qkfEjDKpaET4/fTlKu9fOsJlvkw+4TEybWq40KYzQ4FrX0f64rCp4qMh7Jxach
         AEWpNN4PRTCT/WPQ+5Fol6m8VN8bMMOjGI2GPAshqWP7kyftoGhnZLyi+PSVELXplTfz
         qrf2G/i/5LLN2mq3voEJavAl8ydjlIFueCtpBP/L4VosZ61ZClYfIGc4GT9nmlHJCunp
         WI09hG6MDrAb/rRmTD0uZDqLlVeRmqueIEMzp1ExvswJyDdJlpWCt+XpT1xgqS4n2HHo
         yvdmB993Mj0a7xSvOJCf/dXt1OkhU51BwRBGK82K1qzHShN31qm3cl48n1YnZqVHAHxn
         711g==
X-Forwarded-Encrypted: i=1; AFNElJ+ecSK4sN+TKIS3UD0nl52NfyEkd623ufvaxF4pbNMLXs3pNRK8CP3EUxVPJhvwHwzgQN9AchltlPKAHSpc0oqlTg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1nwlO+4k8vNNbyL+0p39tCKzBV0WjieN7LkyfHZRdlZ9oloia
	eypSG6YcisUHEuBj+kcSS8JyeCfmQQcMj2WcBdrCBcZowB60+XYOV/O6tt0vQL23W98=
X-Gm-Gg: Acq92OGLDIRGdij2a6JkIxfB02lEO3VJbjXm9y5fyZnDIpBHos67bJ/JE8PI++oSDJc
	+LqZ59JFazKqMzTG48Bh+FX8X7y+oxV/0z75VYN98csyI5zLDOpm9LsgWT0IbSdkefX3BYaxGde
	lP85qXzaRGD5V8rjIpkamKYPNq8q4wuj7f7HNQEehw0E4MnHbKdpSTT7TXLHpdz1kkD4SymXZsu
	rkzOHPDjgVqReK3qUuOqEzA9nCYYJtO5a6mYltqRwr8NyCfJIOWLL6Wz1B3d3oYcuerAJRwmeCO
	Z5Sb9qlnR5wBoZycu+kttLWahIYm5R2d9PlHnSGkdFXhMzypHuaDVInxPJZM1wFtauCNW+K0mno
	iYZ9y0v4LSb0KoiSiriF4ZUNCVmgPpiZAk5vr/DglIAu2ZmGNiYtooDOmldhYwh7rCXj5OeYnDI
	pt7pV7ko/eUUoAHB+Ift90iI1F6PKLee3HssZ8tOIaWtFcVdNbPBn3fk9CrS7q
X-Received: by 2002:a05:6123:128:b0:56b:8e1c:582d with SMTP id 71dfb90a1353d-5760c09b0f8mr11291652e0c.14.1779263832861;
        Wed, 20 May 2026 00:57:12 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5760f5cd08bsm10065134e0c.5.2026.05.20.00.57.12
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 00:57:12 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-9567aa1a047so1125793241.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 May 2026 00:57:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ90OMDPZMaI5dcHWhpKF35tumFpXDazUvNCRGDUntlAijsQgMtvvRxvKwuD4L6nX1+0mcVrevKwIKLCWvjoAoCh3g==@vger.kernel.org
X-Received: by 2002:a05:6102:5489:b0:631:ea6b:23dc with SMTP id
 ada2fe7eead31-63a3cc0dccamr11327097137.2.1779263831882; Wed, 20 May 2026
 00:57:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260519135342.623943-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260519135342.623943-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260519135342.623943-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 20 May 2026 09:57:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUAbew81+-aOgRPPzFx=9bAYsPDVDRj7Z_VBcZt1guR=Q@mail.gmail.com>
X-Gm-Features: AVHnY4JQ9wdKc003sx3iEEgNQvICTkkCLSI-l3x3iSx-VDEvIu9SAakZxqdneuk
Message-ID: <CAMuHMdUAbew81+-aOgRPPzFx=9bAYsPDVDRj7Z_VBcZt1guR=Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] mmc: renesas_sdhi: Add OF entry for RZ/G2E SoC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Ulf Hansson <ulfh@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-mmc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[sang-engineering.com,kernel.org,gmail.com,vger.kernel.org,bp.renesas.com,renesas.com];
	TAGGED_FROM(0.00)[bounces-32846-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,renesas.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 93E2F589412
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 19 May 2026 at 15:53, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The RZ/G2E (R8A774C0) SoC was previously handled via the generic
> "renesas,rcar-gen3-sdhi" fallback compatible string. However, because
> the SDHI IP on RZ/G2E is identical with the R-Car E3 (R8A77990), it
> requires the specific quirks and configuration defined in
> `of_r8a77990_compatible` rather than the generic Gen3 data.
>
> Add the explicit "renesas,sdhi-r8a774c0" match entry to map it correctly.
> Note that the DT binding file renesas,sdhi.yaml does not need an update
> as the entry for this SoC is already present.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
> - Dropped adding entry in the quirk list instead added entry
>   in the OF match table to map the SoCs to the existing quirks.
> - Updated commit messages to reflect the above change.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

