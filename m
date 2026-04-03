Return-Path: <linux-renesas-soc+bounces-30836-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4NtuFmCHz2mwwwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30836-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 11:24:48 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C70392BEA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 11:24:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A2EE33006501
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Apr 2026 09:24:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0C5337FF56;
	Fri,  3 Apr 2026 09:24:45 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682C027B50F
	for <linux-renesas-soc@vger.kernel.org>; Fri,  3 Apr 2026 09:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775208285; cv=none; b=DpL8GMD72T6dxBJPvOGTrQlVHoq87vLICggxJc1fmSFzCstqUOTtQlEwSYQhgonpfftTZlb9dWk0Bebg8dGPXtZ7nAlW5oNdj2Rni7gYki8PP7gu3ZZ/7v+9wwF8oBThxbe+flTECalPSsYIdUp3vG1rrMK3ZsFFrM21Y1OQp7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775208285; c=relaxed/simple;
	bh=fLdFcRFTuaQzK9ctusblMFlkcfRxlRR1aaxYuKPajQY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NvOoqGXK/RgDYaYUjH1HxEZkjYe/87U4DL8h2j4brqw2eaTnKkanCHiUFu7apbmpa84DIAdNMOmWwcMXcpdMteoAPMUq6WT5rNl3WNy9c7lfggrQ1hFtFtvSVqRo5ejIQrOCBgODDQjFVcypJMmOjTicnaNQZvpRDJ4pcqqjOnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-953a2634777so525130241.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 03 Apr 2026 02:24:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775208282; x=1775813082;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qGwkV+UjFh3ES3arE17ExSNnkFY3YqomwgIxcqNhunY=;
        b=MZz90YFORgPUmm5BePuyCDON2bDs3kIuDjAGFnAcMI5zdleO5epgO9l8faHiDOw+cF
         w4mpl0guwoZBEnJs+r/VK9sDG3ALtzuGqQgo9xIftlLNh7NAiBSY4yx3Jtr/RefJz0gj
         YWMuz/8kELorJW6d97+mjNTMpWjSDRRVS1TG3KcHAKNu9XwaL1O23lZwSKoxAjbiZAfG
         /06HOx/1r9kF8V8WxFuH3UYjqjjgXWQRinhA9WbPFDxG3AmSuV2Z/hqn8z1Mx72kWMWe
         K8Kr44s1VzLXMt60Q5NPBTNeHYgZ6KDOKk+UpzgYunTZvbmddYLMxM5y5B3a+j93ZiDa
         UQXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlp0xpNIy+e1GrUq+DgzTOdVeiMxkE2dhpa3Dfmau2hTVi29BMzZD6lmMk9QIRzLMCEAzpKGySbvtcn8pLG0AKzw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFnlIWLEpZsWUi1UEVdq2ceh9WVvdKqQYFeYdY3fLlxVr8YGWh
	Q3Xz1zCuf38VDlUwOw7xZg8JtSVAeRz+JUeldU27tNFfCVZw5B6eOpWbobQDnA3m
X-Gm-Gg: AeBDies9fCEcLZjhB1KOjgaC2t66DrH24XKfqiOWjbHg3l+wCCCldmruPW/wM52RJnf
	A9u4ihyIQBLEeXbPPPLXG6vW9/8Uhcg4Vi/v2wUHrWbrma0gG/iGIH4FpuRBqUPoMClFRX8rQsx
	eJnrQ7HEHnOQ8utyHChfd9Ol00hfF8/LTYFBAjbpSwOwpnrMOtrVbZkfXDWQ7a76e2aXVtbvEWl
	7qJdxaLDVdReA/lLSzgRY9WkFKgaDpoak1Sv/ACekViY69dtcYuhkj7Xz/x33xJeDIIWrYiZnHO
	u17T0HPegbCAbqEtpFjE+m5zudDR6adtmucm2th4/haBSMLwmZmxHCa5JhoD3pqcAB7BH6pogU6
	xrwwDqHdqBj5/u0UbcKbvRwosHgkAJ+yyoZNbaPEuyRr9dUytspFbws5D6lmmthH31qLSvAULcr
	KDFqAFrPAfs+HJZ1WiXzRvY9NCrHbs/NRc+VFOygOcMZGSDmPOSf3Z3+1EY6rM49H7
X-Received: by 2002:a67:e113:0:b0:605:6f36:43de with SMTP id ada2fe7eead31-605a4dcf1bfmr595846137.3.1775208281875;
        Fri, 03 Apr 2026 02:24:41 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-953fb8515f9sm5682624241.6.2026.04.03.02.24.41
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 02:24:41 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5673804da95so745241e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 03 Apr 2026 02:24:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWNJefB4Bp76rJ9snVAoC0pfi/ea0BLFiSWPZBKrXTmy5K0CHnC7F9W4vjmYxWylSpw4Xt936saQ/pICjuJnsOO0A==@vger.kernel.org
X-Received: by 2002:a05:6122:4d19:b0:56d:9479:edbe with SMTP id
 71dfb90a1353d-56dab828397mr717575e0c.2.1775208281444; Fri, 03 Apr 2026
 02:24:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327234244.91707-1-marek.vasut+renesas@mailbox.org> <20260327234244.91707-7-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260327234244.91707-7-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Apr 2026 11:24:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVTMoGsv-7O_FvUd1pudKc5aPE9ZMUsh=WJVVEk2PwP5Q@mail.gmail.com>
X-Gm-Features: AQROBzA_E4MRqEH0wurp8MczanbrSi-ukqv2OYZut5h7OMTTpNrF8PdeZIFzPjU
Message-ID: <CAMuHMdVTMoGsv-7O_FvUd1pudKc5aPE9ZMUsh=WJVVEk2PwP5Q@mail.gmail.com>
Subject: Re: [PATCH 6/6] ARM: dts: renesas: rskrza1: Drop superfluous cells
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-30836-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.827];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux-m68k.org:email,1.18.168.128:email,glider.be:email,mail.gmail.com:mid,mailbox.org:email]
X-Rspamd-Queue-Id: B9C70392BEA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, 28 Mar 2026 at 00:43, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Drop superfluous address-cells and size-cells to fix DTC warning:
> "
> arch/arm/boot/dts/renesas/r7s72100-rskrza1.dts:32.17-72.4: Warning (avoid_unnecessary_addr_size): /flash@18000000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
> "
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

My bad...
Fixes: 98537eb77d3ef185 ("ARM: dts: renesas: rskrza1: Add FLASH nodes")
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

