Return-Path: <linux-renesas-soc+bounces-33005-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDoFOdtjEGraWwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33005-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 16:10:35 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E594C5B5E67
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 16:10:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5FFE0306326B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 13:31:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBB213C0633;
	Fri, 22 May 2026 13:31:15 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DCD3C09EB
	for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 13:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779456675; cv=none; b=Qr1N2nGSUQyu8yhVDpHFPaaw5Afw0sBmmZyGYaOJtFmFTs3A3q6Y8djndfvMiHdlHIKaLw+Mi42WrXmmUwvbbM71uPn13PPqOhin+GYnkT/4jzvrkn53onx+frY8bFrrO8gVjUZTiDngaoyFT8/lr3dxNoctat1Avjqj1W/8/RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779456675; c=relaxed/simple;
	bh=EDsocOg9oilebHbXj+PL9ilT70n9YNMr0dy80+Ke9sQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C/plQDct8FpgXKskXLbvF/CZ9QJXWCVmWH55PbO+8xeB1gqn9P0TMMEmrkqwWUFkxFqxrxXBcVfB9XjM9+x6+6kkDpR0FTuULFR4apC8imNFmJB1MkS/fimIpbRuJV9bXNnIzut8y+wQNJ4d2eC4eUgC+VqGSH9UYDS7GQa8GBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-63124a80693so2803537137.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 06:31:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456673; x=1780061473;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6+AhE4uoto6HB060rT5G1YWAsJ7a7Ie9LYO24VeIM+s=;
        b=kIb945lIgLEQ9ETlPzho9YI+i/TqM5Fq21ULZM82oUgmlV1vudu62ODsm/ohMY43n9
         YlCiKBM1t7mN7HdoRuoWuukMgnc4MdQ1/2urngvhi3xnyBwesVaqfvdJqCEdgddhUuZu
         HsZyd5fU3VmmhEOdVtInsqd3aInfceQgrfbDw0iBnnLtBl+MnsILxbCEPwqcmIAUS3Ho
         zk6PEixYeaYl7HLQOHe0qeYNPXNmoobOAglWPhQujNFfFTE0tUcx8WQfVPBxFm1TNPqK
         vLFOTKMl4ntv8X6l/X+m3pI0cCo3mYCr/QfdfFMKinObN0DDBoUg7PMO6acOjpskHBV4
         ZwpA==
X-Forwarded-Encrypted: i=1; AFNElJ+ixZ+64OwbVSUlxYLOoItzYraHELgPBPs4NB+QGhG0Q7gPbjojYMDCpdu9Cdlqjno9FdpZgIzqbi9vHbkxwnGLeA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmCOiSnY2sHnCslqeKqVqjvnmqMrvymEHpd457tJ9PMCU5V6fM
	xQJAVtZ9BXBLS6DyHogOf2VuR8VzvvSgPzcC8ejoZcC5Pxnd0D7o7eUe1ITEp7f7LlU=
X-Gm-Gg: Acq92OE/rvcrCDdQlldwxEcpK4El9bPgW4kgJFci7HmxqBAO1ZdipBKu1KDcScUG7FR
	SUde1F9FfLZ5nqdXH2lw38zvT5oM3ixDONpat0F9ZkeWvcJqJOk5jXx4QIFj/HewHVkPihTT1Nv
	5ANH8P1xbMcOfU8i8oVHud7P3hrhLvsxXc4fnHi0Y8Hp9989Z2tGvoUsRMzlQA10NNqemopsvz7
	CjKhO1HeK2WM0Huib6wdiCRnDjjBSTIfN0y5Gb9Q44WB9XCPZF86eEjjlfDhOtSnFHmzyrg8jt9
	50VHuor54MHF0x/hiqILN+MehDjHT8RI/Iigh0fw7UX1NZCaN23atffiGxD/MI7PonImZJPJYl2
	CpyEsHg3K/6FU5+y4L5S8ul/Qy4gdA44uymVS1TmF8HQL+D+kEoKoFo3Oaip7CjkT8ATXQUqxXk
	j37CTX//IGZwG+gRhr7eQHQ8ExvIfoYZZnMIb4MH5evPFJ1o1rg+bxkIaIcqL6yFu8
X-Received: by 2002:a05:6102:370e:b0:632:29a5:2b27 with SMTP id ada2fe7eead31-67c7151c86bmr1755561137.3.1779456673466;
        Fri, 22 May 2026 06:31:13 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-67ff3e4b6easm1311908137.9.2026.05.22.06.31.12
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:31:12 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5751770a178so2442471e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 06:31:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9XdMOHpbiHAd09r3CSaZepkpsT9hEoxjNqmYAPk4mTAq62K/q9KeZejZCCYy47cLsjLy26tnsh/aYWzatRz4qyDQ==@vger.kernel.org
X-Received: by 2002:a05:6122:3229:b0:56f:a3e2:66a4 with SMTP id
 71dfb90a1353d-5865e4a60a0mr2144772e0c.1.1779456671870; Fri, 22 May 2026
 06:31:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520115144.60067-1-biju.das.jz@bp.renesas.com> <20260520115144.60067-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260520115144.60067-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 15:31:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVJ0-2q71jOiCmWBa08fMeg_qmMuF5QdApnaghqv2w-Zw@mail.gmail.com>
X-Gm-Features: AVHnY4JCjos7DQv6shKRc2dtMgTnT_LOLrxwVA7QTM3Mzf9SauOWXKibkIBXaoM
Message-ID: <CAMuHMdVJ0-2q71jOiCmWBa08fMeg_qmMuF5QdApnaghqv2w-Zw@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r9a07g044: Add max-frequency to
 SDHI nodes
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,bp.renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-33005-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.988];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,linux-m68k.org:email,glider.be:email,renesas.com:email]
X-Rspamd-Queue-Id: E594C5B5E67
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 20 May 2026 at 13:51, Biju <biju.das.au@gmail.com> wrote:
>
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add the max-frequency property set to 133333333 Hz (133.33 MHz) to both
> SDHI0 and SDHI1 MMC controller nodes in the RZ/{G2L,G2LC} (r9a07g044)
> device tree.

increasing performance by ca. 33%.

> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

