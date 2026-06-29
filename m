Return-Path: <linux-renesas-soc+bounces-34523-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id d3wXEvqBQmov8wkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34523-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2026 16:32:26 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D13AA6DC150
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2026 16:32:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34523-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34523-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9F2B5300D1DC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2026 14:32:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 485D83B4EBD;
	Mon, 29 Jun 2026 14:32:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6D2416D04
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jun 2026 14:32:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782743538; cv=none; b=O/X/40OaNpLvIAqTkO5iBX1Lh6kTHdhinEwU/xo+RE2I2/16zMUwairfdjjRMw6GA+8zCdA+eYwqvVQky4ssMV+mkSU+hIiTMmRJxamj6+s9/GtUjTUpbNU5DL6LYkIsMCpCl+gPL5eRjGS1zZnfoVZZtDRCUXcbW/UK/FWbO0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782743538; c=relaxed/simple;
	bh=6HRoK3x0AQKUC98OUBm801Q6IEvMxDRu7vC3ONMl4bI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZjhgMeIRaNnG5eOSukH4kE+qvOFTFUyC1V6IaulaLNZx0QqR7Nl9pWx5fAROom41DXyBsd62z5LDbxfolCXDe7kW0z9iX0O6+tQnumpJPjp7PIVpvBCoxBUIf5RZEyRVi3pPeSvc1ybdErxjvH6wUgZFzqP0TPIwZ68aPG23BVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5bbc717c52aso1481034e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jun 2026 07:32:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782743535; x=1783348335;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F5dAe0yde7h0g87UykwQHImiYSAjXBDEcHPO6+cdmlw=;
        b=mw05Aj9b7gIyRgnKjNLXoQ8R/2WnVKu2J20ic8MoDQ5CGehjDK/YcpEsA9jpmWqxPf
         jzankhquycohpCwLTXUvHMIVSE14j4OG1hm9I0AOOs8A0byZCkRyo8+6gCTXaUVMsThI
         dty/B+MSPNDkj+109WbwAXa2MmFVC13T7dY0N9dGXySW2KsjPOIL3RHONVj7h2aKhM0a
         x+AL8xO/THA5o+Ojg5UqmtsNWLMRvdbRa2XO2DHMe0LhQrh2xGMHI0FJihJMSSmTxcwj
         ey8Tu0jiGDFYPLzFvH+am4sKD8GV/jK1CouEOWIQZwUzLDs0rLE5MBAHWj+D1EQozlcr
         YUHA==
X-Forwarded-Encrypted: i=1; AHgh+RoqrUG2kJYt//EA5c0SH1yqy5BN87WYY4oLG3NLGNXTXRl5/wGaGiLl30ZDZ62DG2AZFO2pwUm0m8MQCiaM/tlrXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9sn/V19aa5kHcwB+PrxNoAeaud284s6mFLN2jC9GA50q4NxUB
	nx8+/RA3rzPq7Gd8IrT+T2d5nxbbJqixIi/ZN09OZ0KjiMvrNcyF0NVh46E21972
X-Gm-Gg: AfdE7ckOy2lBScwpI3vglfOKIbfqUGnFPDNFr2OpA59U1VICpc6jfKcgDsn1Z6mo2eb
	BE+s1/1jey4AO2zTN7DHjG1Uqxfs6Gj9zmNcnAIhGPvwdyy9MYKdx+4SvnqwhNKg80kJ56wJlmJ
	mir64sgf9KvmMWvL684Yj0adC5uE3J/PAFGX3FolR5Vr9iCH+UecFlxHmWUgp9ig6PPMJOo7lzN
	mU0a5z3ReYnwHtK+EuA/ojzKJpMRAp/Rhwmj3xT3bwTo4yHwKyYxPnhsh3ND4bRPalrU+LZwbkU
	veyJvB7BxqpJ6cCkD2gUAAqXfw2nlCUi9C/HlWVfmQHLiKj3zr3gdu0+NE7j0MorPIKN28pTqRY
	suwulxFnbeeHrJXVobsC+tfzLLPZSg2JDYQ0Yez5jxQ2qtN8pGlHSYUrOIm8Zx3N0d50Iy1hMyX
	jFexaOAa1Fpv0sOEHeb3Wz+IY5h+6nNiHAQVtgq7KSLk2MJN2fXA==
X-Received: by 2002:a05:6122:6591:b0:575:44b3:300d with SMTP id 71dfb90a1353d-5bd69e7b77cmr6863344e0c.10.1782743500670;
        Mon, 29 Jun 2026 07:31:40 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bda4b93102sm1996022e0c.11.2026.06.29.07.31.38
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 07:31:38 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-728f9ecd56aso1359147137.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jun 2026 07:31:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rpt26ZT7L4eQEGs7iXoCZRBlGoZOOBctx4COIlQBaAyAnGRNSYmqS8Fhq3MbcgjArSFqEHpXBKdZcd9wfa9yzeD2A==@vger.kernel.org
X-Received: by 2002:a05:6102:50a2:b0:738:20f:10de with SMTP id
 ada2fe7eead31-738020f155fmr2154680137.17.1782743498122; Mon, 29 Jun 2026
 07:31:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260623152851.478573-1-tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20260623152851.478573-1-tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Jun 2026 16:31:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXSSkX=R8oEBcdGnSiY32-QNpfHVgYN7oeV=4cHfaLq5A@mail.gmail.com>
X-Gm-Features: AVVi8CcgTvKk-M5mRJzGweuPSzZh9k4hEU6qBV5yTdVU6gaVQ0PgkwRdJZ4JHAY
Message-ID: <CAMuHMdXSSkX=R8oEBcdGnSiY32-QNpfHVgYN7oeV=4cHfaLq5A@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r9a09g047: Add LVDS clocks and resets
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34523-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,bp.renesas.com,baylibre.com,kernel.org,redhat.com];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS(0.00)[m:tommaso.merciai.xr@bp.renesas.com,m:tomm.merciai@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:tommmerciai@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,renesas.com:email,mail.gmail.com:mid,linux-m68k.org:from_mime,linux-m68k.org:email,glider.be:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D13AA6DC150

On Tue, 23 Jun 2026 at 17:29, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Add LVDS clocks and resets entries to the r9a09g047 CPG driver.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

