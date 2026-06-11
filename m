Return-Path: <linux-renesas-soc+bounces-33863-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id i53BAeJrKmpupAMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33863-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jun 2026 10:03:46 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D64E66FAC7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jun 2026 10:03:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33863-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33863-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 668E13008D6B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jun 2026 08:03:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8138A346E6C;
	Thu, 11 Jun 2026 08:03:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451E336F413
	for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Jun 2026 08:03:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781165023; cv=none; b=jA/Tb1Ry2q7iddd2ZjsHA2G9Oz5mgghQzcXASMluIZcx1aatDfxCIgCXi1VbWE0Jbkhy2iBYPw76+to1ud3EygH3Me6KgnL7uTs3w+cDjc/MfNF3Eu9G074EplJlNLoykxj+ck1YvTxvlNvZpDtd1PZhgSsmhqM0pHgBVKnsgOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781165023; c=relaxed/simple;
	bh=FcwS1Ux5KwgtnX8CZVP0j4SNeEXvGKNAL+eLSlc/HUM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HL1xgQrDI/g2PVEN/fiLWI+ID+wU/xM4WjoG9L4qIAY9QBlvL4ma3AkP5OTy8fLtmkZx7DfL6S1/Srkt8GTaG8wFsrdxxh9qU65Ibl9Vi8NE7Q0Uwx6vJHdIP/Bxw6sTY+6SfVvYZkqm8bFrwC+3lpmNgXSpTVgB/w/dPs2X5/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.41
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-6c534af2470so4905122137.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Jun 2026 01:03:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781165021; x=1781769821;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w2NiokGN/wizVGUGbdWYAqnmeeSP+HB1QCep5aAksHU=;
        b=VKHvj8akY8trQMCX86EGobhkWItr7qfk8u/889VrZK/uROc0aEle2DBXAYmkyzl++A
         uRhPK4CXLNx6l/TBRNe15/Jm01Ky1l/FMF7jGVVwSe1DNS1og1L/u93FUhzRFMY2e1WG
         6huKy4fORAiAM+rtAiVy+9w1bJISi5rDwgMysxhD3W8MDEgsv4d5EyJnYZ9hOZogDU7O
         1eD+7TGBPDOiOqFRTrKwJA6zX17tBKYDxSsUlNJQCFotuLXTZ1k21WJITGHP+/+12Odt
         tsAH6cAVzQrq60BzEREUkvSkeT6QOkeC+R8F+wsbU/uE1Q0k6Zx5fUOPQzPzgGmQyrk2
         k73w==
X-Forwarded-Encrypted: i=1; AFNElJ9bD3EbQOr/XLKMlK0FxE6lE2tWYRvBW0O0zaiE2tl8q40Sf7dTSRfFASH5FDePWVSq/9J2F0KLDb6J1in1FCcNtg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOS1pZUiZhzppf58lIvpD/lJn3vGSa5zE+KlI8WR/pS4YgSSDi
	yTCXglDKv+dgu6TMJt6xc2mT0x9uTNngI4YkUSywudAkJ5uiPX5uRF3LcwuP2ji2Ndc=
X-Gm-Gg: Acq92OHubqNfy3sggiKPhD37GIpW0Pk+LPT44DymB6glBMJ6ir0YR7Jfxpmbgo+Qt74
	t9ki8JGEdAHi8rjk+keQVSbQQq+rjn7bz1tp2PblBsrCWf/c0/KnZRgZOSBS7MO3vZIQjd/GHkm
	USSiSkfbh/caOoYAVF+zlJlQa/SghCYWKeoPFWGUybvCAhYwREiYwGb/AFYO0KwDhuAV+TxPw26
	ncSx+j2ffz1dM/ypBh6vfpNfRdX7ouSBQmZ2c3K8z90fdD1dvATnex9FPNjaixi4LofcAUgLAX9
	cB9mj7QLWp54Vx2ClBseVb3A6Mcyro0+hPq4k53mq6y+HaXhBZl8ytHeU4gxeZHdCGgg12hvUT7
	6WeRAQtwHFMJ2oKgqxMJkBDvdotFG2wbiqNaT/bFSuNY1XsPcBS2QphIujP30OJHu81ZXfabNiU
	r/+hHa7lJ6aYUCcZJy99F9XHBGosw15Zhvy/1G5OxXHZ/nGlBACvZJVptT+QHBOG8EpX7s/qo86
	gc=
X-Received: by 2002:a05:6102:419e:b0:639:1e8b:ecd9 with SMTP id ada2fe7eead31-71d5ca6f14emr551992137.20.1781165021165;
        Thu, 11 Jun 2026 01:03:41 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96662f56c69sm447811241.5.2026.06.11.01.03.41
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 01:03:41 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-59d07df448bso5781025e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Jun 2026 01:03:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9hboec2Etjl8UemK4IspjKGr6vgfWfCYioE3XMZluGH05wgEV2Dnjr5sjX0RiBRVZzLlPFu+jKV+XVXBn6YRB+fA==@vger.kernel.org
X-Received: by 2002:a05:6102:419e:b0:639:1e8b:ecd9 with SMTP id
 ada2fe7eead31-71d5ca6f14emr533723137.20.1781164537632; Thu, 11 Jun 2026
 00:55:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260611005952.146825-1-marek.vasut+renesas@mailbox.org> <20260611005952.146825-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260611005952.146825-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 Jun 2026 09:55:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVU=msc6f3KpW1PeC1mB4dLKhAdqRaFx2i7GMRNDv+4vg@mail.gmail.com>
X-Gm-Features: AVVi8CctB5g3lahw0kyIeWwLgXx3I55B4rJDSwSay_Z70zWBy3E0yh5vjNFIWN4
Message-ID: <CAMuHMdVU=msc6f3KpW1PeC1mB4dLKhAdqRaFx2i7GMRNDv+4vg@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r8a77965-salvator-xs: Enable GPU support
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, Frank Binns <frank.binns@imgtec.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Matt Coster <matt.coster@imgtec.com>, 
	Maxime Ripard <mripard@kernel.org>, =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33863-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS(0.00)[m:marek.vasut+renesas@mailbox.org,m:linux-arm-kernel@lists.infradead.org,m:conor+dt@kernel.org,m:airlied@gmail.com,m:frank.binns@imgtec.com,m:krzk+dt@kernel.org,m:maarten.lankhorst@linux.intel.com,m:magnus.damm@gmail.com,m:matt.coster@imgtec.com,m:mripard@kernel.org,m:niklas.soderlund@ragnatech.se,m:robh@kernel.org,m:simona@ffwll.ch,m:tzimmermann@suse.de,m:devicetree@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-renesas-soc@vger.kernel.org,m:marek.vasut@mailbox.org,m:conor@kernel.org,m:krzk@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,gmail.com,imgtec.com,linux.intel.com,ragnatech.se,ffwll.ch,suse.de,vger.kernel.org,lists.freedesktop.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	R_DKIM_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1D64E66FAC7

On Thu, 11 Jun 2026 at 03:00, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Enable GPU on Salvator-X 2nd version with R-Car M3-N.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

