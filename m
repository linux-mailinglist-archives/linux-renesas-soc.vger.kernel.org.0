Return-Path: <linux-renesas-soc+bounces-32240-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOh/EBGJ/GleRAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32240-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 14:44:01 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D984E85A0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 14:44:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A9E29300CFCB
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 May 2026 12:43:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82A693C4540;
	Thu,  7 May 2026 12:43:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253483B19BC
	for <linux-renesas-soc@vger.kernel.org>; Thu,  7 May 2026 12:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778157839; cv=none; b=uYlLTkl9AvSt9QkZbbUcx8gKuQC17DhdLeJtzT2ieW+kNHuyq7wHHzs/jkh+HXD4iOgDKDteurDatyL1O5udIOO3T8DxrndGEqwn46OGnQBIJY73obQZ+xm+t2THW6MElm67rX89Z4hrb11K/lb21rMph1o6B7aFFiQluqzjV/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778157839; c=relaxed/simple;
	bh=rft0aVnDH8ZzPFslD/JdSdefiUxSK0vyAFPTrermtaI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hJCE+oSzKm+0qGIgmZWBtQWbD/79zNT+z0naTbUhXftO6bs6mXVrn87S8Y19gBWi4pMFI38dtXQ2LJ1xRPpknfipI94W0mwvsxzIl+jdjOdV2KvzRHE/kUWagcV7N0Lxi8xgCyN6xFbGP9Tl/vJBNfRWObhg4cnlKOb4kc1Zt4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-bc2a455fd55so114734166b.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 May 2026 05:43:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778157837; x=1778762637;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XU1MIdjdd4TqOwGpxaQwie0Eo0zv2bJJ/ujL1e37AW0=;
        b=AdCT0b80HW/+jEoJgVogXsnyy9/ecVvn/TY59Vbu2idYhqqAMhrFOWonj3ya4d4s2g
         ag30icgYoTQSKdj5A8Y7cd3/VloDG3IBYraE+HBPJOcxQxCeHGqBWOSPWUNd/DZmJ3Cq
         AHy2VJBzne47BODm/k6defXClXyt1yOVodwyrrE/a/eLm18FPbyaCvyPZJ9nysp8GAMz
         CjF4THOQmgIGmyYQyX5jQsC0v/HaqzVvn1nHEBeHW6uRL6JV/M3RM+b+xERXJurKpe4C
         /X4FzXj9Ntfqxxggj+L41ZaWxTIBOrl55J4+3fHJbblOb1AjYm+NUYntnPF8NTvCzGeQ
         3Cvw==
X-Forwarded-Encrypted: i=1; AFNElJ9BI9KMF61SsLkxILZT18AX6P04mFFZtwbfm2dSv94CCFjTT4egfFCbUpbrgUgtypEj4jCPYgmoIysv6gg0ylVbPA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLCsjy/r1t/3ViuXy03CeTbshruYsYgPEmrire5c5B8U++ihvr
	CzOb9SXgOU8TPNI3FylZ686sEeM3gSNwLPncz6xBrYxFsIkJYcFk3uiQWNzQshzLmY0=
X-Gm-Gg: AeBDieuovst5JUEcZNd47ZDngzY7bGOjOWvO2WDOHI7Mp9jGLG738cxs6FN//FiM60C
	LyMl+wmj03kxmr3c/FnksLG2H3oh9oKlxqzHdX6UUWsy+xndlwC7B1L63b8Ex7m7JG5/U8E4oDX
	3NlCkREgTY7x4YwDjNUg95sHNGIMDCtBmJih3b+RSsZsJ0ADo9tYYRqOWFcMqQX+b64hGZk0ce4
	XuyfFrO5m32CSrOdheY2zWWOZoy69k+sgtPx9A0MMKgyW8/4RqqS9orGiCKo4ju1asp28f8Ne4h
	gRgZkfbxis+Gw1LfrR51O6NOBFTqAVy2gBUmm2dAjUHIFHhb0DHiZ8/hFdqQxwaede1IbP6yLxO
	576AzrMs5dnOd2l0clneOOPNT6tvSUhp9dKHNmVYRvM0ihFcnA4WmvEc9hqRC46kkUzQrKM/ID0
	WXERqZ2S4dmjjEHQYr17+sGTYgYsYdTe26qnEyM2df9rJjRapgFlN2POm7EaHofY2PCjfKGOkg4
	phJP5TXdQ==
X-Received: by 2002:a17:907:1c20:b0:bab:cac3:b9c9 with SMTP id a640c23a62f3a-bc56d037fcfmr442664966b.28.1778157836239;
        Thu, 07 May 2026 05:43:56 -0700 (PDT)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc8351448a8sm77937066b.50.2026.05.07.05.43.53
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 05:43:55 -0700 (PDT)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-bc1f3a393c0so117999466b.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 May 2026 05:43:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9jL2+YT2qFxM2h8UYljKHvkrGdEtzB3PN1uGW+4VhiqSubBpUxLpffPxIDwuodMMWTYFJDLyyt37q9NtAZsRQuIg==@vger.kernel.org
X-Received: by 2002:a17:906:7944:b0:bb7:be3b:ba3e with SMTP id
 a640c23a62f3a-bc56e01902emr413569866b.45.1778157833530; Thu, 07 May 2026
 05:43:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505071544.8965-1-biju.das.jz@bp.renesas.com> <20260505071544.8965-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260505071544.8965-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 May 2026 14:43:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU2Dt4=ptwoaXNttV6gAa=G4mtGRYtA_z3qdqcUtd8A2w@mail.gmail.com>
X-Gm-Features: AVHnY4I9idqK1VcaIrFYUBfD3vXqjTzr4uBBYEWs1epY9RmzhXeZEn8Y3hIUwgM
Message-ID: <CAMuHMdU2Dt4=ptwoaXNttV6gAa=G4mtGRYtA_z3qdqcUtd8A2w@mail.gmail.com>
Subject: Re: [PATCH 1/3] clk: renesas: r9a08g046: Add clock and reset entries
 for the RSCI
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Brian Masney <bmasney@redhat.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: A6D984E85A0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-32240-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.990];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

Hi Biju,

On Tue, 5 May 2026 at 09:15, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add clock and reset entries for the Serial Communications Interface (RSCI)
> found on the RZ/G3L SoC. This includes various dividers and mux clocks
> needed for the four RSCI channels.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r9a08g046-cpg.c
> +++ b/drivers/clk/renesas/r9a08g046-cpg.c
> @@ -137,6 +167,7 @@ static const char * const sel_eth0_rm[] = { ".pll6_div10", "eth0_rxc_rx_clk" };
>  static const char * const sel_eth1_tx[] = { ".div_eth1_tr", "eth1_txc_tx_clk" };
>  static const char * const sel_eth1_rx[] = { ".div_eth1_tr", "eth1_rxc_rx_clk" };
>  static const char * const sel_eth1_rm[] = { ".pll6_div10", "eth1_rxc_rx_clk" };
> +static const char * const sel_rsci[] = { ".pll2_div5", ".pll2_div6", ".pll2_div7", ".pll2_div2_4" };

OK if I rename sel_rsci to sel_rsci_rspi while applying, so it can
be reused?

>  static const char * const sel_eth0_clk_tx_i[] = { ".sel_eth0_tx", ".div_eth0_rm" };
>  static const char * const sel_eth0_clk_rx_i[] = { ".sel_eth0_rx", ".div_eth0_rm" };
>  static const char * const sel_eth1_clk_tx_i[] = { ".sel_eth1_tx", ".div_eth1_rm" };

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

