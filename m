Return-Path: <linux-renesas-soc+bounces-28702-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOVNJRvfpmlkYAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28702-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 14:16:11 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BEE1F00AD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 14:16:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6B4DF30AA7E6
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Mar 2026 13:14:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD4FB423A77;
	Tue,  3 Mar 2026 13:13:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343E6423A7A
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Mar 2026 13:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772543639; cv=none; b=FO/LuoWKfK1aFqK6PpXwDP7g110d1w6Yc/hoXk4vjUBgQHMjEheHFTbMYOGjEDUECqW8oT6WnO9EG5nX2BSiqqul0Mi3mL/LcdzKRdIDgSQmQv+aFNSmhNxVnqzPKYMg4LlJITUE6bsJ65PMHyW+k7+rZA2lC3HXv0G8G6XcCwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772543639; c=relaxed/simple;
	bh=FEfFxP8X1sCVWYVq7jp9gZLcQaix0rbikm0t1pa0H6U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YU2mSX8HunjZ/fZFLkKgxZlmr7HwXZy1VEOcvUqurpU2cuU9osJZUlsAUhE1CZe2CT3TnHGdbApAEdrsZMxgEY1DQ/cIOx1e/BYJB/SYpHZhDN+AQsUR7U2iUOideNcNCVuxkxN5XzS1VSeE544yEPrDjJ99Iy1h2DGKCbtdmXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-56a84f2bf7bso5367232e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Mar 2026 05:13:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772543637; x=1773148437;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lPbwvUGe/7JcxTYMUx4R8OK85eDDkFysVThEgmDwHLg=;
        b=bajeWclsV9Xz3uteruYzjNOPx+HNHHGVqyJYIB7XtXy5HYtRc38VD1/MCv9Bxo7V9N
         aWIXoEzQI5tVQy+HHjJGbXxC29e5JQRnNm4fCBT6i5ouqxzeBb6/YkoKL6yLfvMg9Gyc
         1MR5y/ZWw74LBgbf3K02ktX3OOn12dufOuWgWsgP7x+3xqD+kgg056+Sjl7q8euxnZuB
         LJ75sZcCi9YTCCcd1Fexzfr5uGNGSUQDBv1HJ/V0rwz5XUZ8DngdhcvTMUV8rjprZ863
         /S4sXQupsu/V482z7HCn+N/FegkpTjhco/+bLG/JzOBwxN13TGvzyYtCRM8ocsnrDf+p
         +VjA==
X-Forwarded-Encrypted: i=1; AJvYcCWgttPo2mqrlbCXE06iuT0gZjYCWovS64ZiCU65p+cWvb3nkFVH1c0s6/1GLLuoRXUSHY2te2TbbhpYdIOJE2t+Gg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRs3fnBoTWo8Z/nfIhAWp8dcsBBfMzO+BOjOsG1jpZGh6hJ2ad
	5zfin+Y+c+q7/4G8CZt69cBnlbeYJA/c75f7lwovLOpSNwhg1/kF5WQv3xaZbnzs
X-Gm-Gg: ATEYQzzJe50UBGHUec6tEIUpbZRG8ugY+0gLBqAFlI5dFuXF2Pgdg3GKZw29FsrJTix
	VwdPyDEqxthpR8uV0GaIeqhY7hGpH54TgECR5JAaNdueJXyso6QBgmFEFTaYFEB3KJh4G6+xO3D
	sAPZB7ryNIr7XX518ivX0di360tp0FxSEXftazxy0+0SjmVSVBmvQlmmiqb64l76TXSE2Agk7bD
	sLXhf5eFnDkQmDs37k8qHUKPsWdlXOp16G4H96RiyYQSwvKPgZZ7D0wdxMB80KhXcvuhOcTlEBW
	qFRq+eGycwcc/5fjm7UWRtpntxVTpx+Q9i/6CXyqoLDiTCjsBo0uk5imu8vX1yhF3po4oiBTPUQ
	ZUssz65BXYr1yhXXi1V4KqnmnBdfDH+Zf6H9DCX7HiA/L/s7BeGEl0QTxb4a5OrkJo9kPMCPJCU
	L5aZiiwfxrt1twsrhBljkaZGFeyZYxGeCOK3tZhXWLSVMsc6K3wjYUZz6T4ICJ
X-Received: by 2002:a05:6122:d25:b0:566:3685:6ed0 with SMTP id 71dfb90a1353d-56aa0ab2443mr7709012e0c.19.1772543637110;
        Tue, 03 Mar 2026 05:13:57 -0800 (PST)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94df641e133sm14894230241.5.2026.03.03.05.13.55
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 05:13:55 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-94dd06a96easo3698343241.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Mar 2026 05:13:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW1QgW19B1VGjpLAJZ5waxEBUShVljVjEBTCFGqSsJ+cElVLT9l4BmQvkBzWieMF1twGtxJT/RFieoR/8Ca+2hFXw==@vger.kernel.org
X-Received: by 2002:a05:6102:5091:b0:5f7:24e9:ece2 with SMTP id
 ada2fe7eead31-5ff3252136bmr8506725137.28.1772543634838; Tue, 03 Mar 2026
 05:13:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260123225957.1007089-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260123225957.1007089-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260123225957.1007089-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 3 Mar 2026 14:13:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVEE3jsaPNjOsZUqd3GhJ7uhVGkp2RpPwGBBQoSEjWqmg@mail.gmail.com>
X-Gm-Features: AaiRm51-XWLKyeuQxkB4PJ_YjrL_4uS9zAdF4loOr7hgqzaPzAPVuA7XYGBMCHY
Message-ID: <CAMuHMdVEE3jsaPNjOsZUqd3GhJ7uhVGkp2RpPwGBBQoSEjWqmg@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: renesas: rzt2h-n2h-evk: Add ramp delay
 for SD0 card regulator
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 10BEE1F00AD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,bp.renesas.com,renesas.com];
	TAGGED_FROM(0.00)[bounces-28702-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	NEURAL_SPAM(0.00)[0.527];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mail.gmail.com:mid,glider.be:email,linux-m68k.org:email]
X-Rspamd-Action: no action

On Sat, 24 Jan 2026 at 00:00, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add a ramp delay of 60 uV/us to the vqmmc_sdhi0 voltage regulator to
> fix UHS-I SD card detection failures.
>
> Measurements on CN78 pin 4 showed the actual voltage ramp time to be
> 21.86ms when switching between 3.3V and 1.8V. A 25ms ramp delay has
> been configured to provide adequate margin. The calculation is based
> on the voltage delta of 1.5V (3.3V - 1.8V):
>   1500000 uV / 60 uV/us = 25000 us (25ms)
>
> Prior to this patch, UHS-I cards failed to initialize with:
>
>   [   32.723914] mmc0: error -110 whilst initialising SD card
>
> After this patch, UHS-I cards are properly detected on SD0:
>
>   [   28.379122] mmc0: new UHS-I speed SDR104 SDXC card at address aaaa
>   [   28.387239] mmcblk0: mmc0:aaaa SR64G 59.5 GiB
>
> Fixes: d065453e5ee09("arm64: dts: renesas: rzt2h-rzn2h-evk: Enable SD card slot")
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-fixes for v7.0.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

