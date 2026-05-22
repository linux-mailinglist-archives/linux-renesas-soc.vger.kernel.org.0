Return-Path: <linux-renesas-soc+bounces-32992-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6AhNNdFdEGqDWgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32992-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 15:44:49 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A7A5B56A6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 15:44:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A0FC230F4186
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 13:18:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8A1E3A3836;
	Fri, 22 May 2026 13:18:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554943A1A5B
	for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 13:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779455936; cv=none; b=kmpU0eWgm1MZpaT8GRSYy3BYqjT2+m4WsrkXOujzGT2TBz+JVHs7/HSZUwVt6d9T8lfUX+KSOTSu1+u6tEGaVh2UUSg3qMpBSzFzBrw0Ku1b6HNNYQtqxSd27sUZ1eWPNvS19kdsbUysWHlEzuxFb0o7c3hypVZr+2gP39BqRw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779455936; c=relaxed/simple;
	bh=f/oq+Pmek9pWpvzHueumQVSjskt7sQj7Cnj/0sWZKug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eJr17NDQ5p/AzeNq7aKkvBqu5ccSnNcBuD6C6607CPhyeZHdvXEzeVhBIgakN8YQxv9qrAd6HToc4+AdrptBimk1ppU142KtD4fZBABcYAw62XWA7Wo4LFWsy0ejLzoSoQ23q9PAIx5IS2aGQMboTSh2CQKvJ/slPeMTWP/aMKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-bd124546379so1178562466b.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 06:18:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779455934; x=1780060734;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RAlUGw/HNtzbgT6oAPTSPOgW3T+XEEHWpdGiqyY+DBc=;
        b=NOJB5P/1raMNVETYOtx3sCydupIzY20O5OJuRur4WNXrhJ7NVdaQ0zjHMj31tbfwKF
         vC+e//BGnn9yyrw49JaGx8UnIuvS+kqOaVmowNvHYTaBFDXsBgo3KljpgdFglUUdRWa1
         wh2EnB3SD3MC5H03Pcr/mHncsQDnfaiPuvntnCYkOE+qgI7UZR5LzPhX0q6oXTCX8lQD
         gzpj0GDp7aJQT+RGZVKmEp+4dTZAQzeGgcmrPklH9O37UgVRbKS+uUS69ow8QObbpzUJ
         9Qf5CVYpL7X1k8mb0z3QxDAoA9rwvWLSIJJ+8X7u2JQhpWSfvPDRwk0vu7BBRKWKpEde
         sDbw==
X-Forwarded-Encrypted: i=1; AFNElJ8q/aLLOWnlu6sebmzUS1Io1Vj8QH2iRW7m7WTTm9IaHuPWMi7zwE8cB54H9ioXT/d6j8vKZ0uXRStU7LMDevimkA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqivVSeDzfry/8ophSN5HzIfSOhdY9dHZCbWKLAqasECAM5767
	m9rjYshS7znsEiWByUHNQep11sJ4H9dxNDram8rCGgHSItUjzWbfW1oT7IlRqtTpa/0=
X-Gm-Gg: Acq92OFqKCygZZaa+oO0GEqhlyh/fYDsqnFHCk0OR8NWNhVR0+idp19qZIakDp1lzhI
	Qb1ATjV2rQxlFFW8hRyVoFX9Mvdc4geMkHxAO6HbM/m/ADVpr47l1AWWbl80+Dy/00KfeAjTm+3
	RXunOG2z16IlnYtrHvUHxwnnzm5kYsouqMdZsulwC11eOl3UgLSLlZ6ua7aF14m7s44pouZaLuu
	W+Hys0pZnYZTfAWcHC9Nxg1bbme8hnv5OllIv/k+y/ehx52EFTfGrBlhKYut2ggN3yzihabNAcB
	NLvBfoEnXAUxPsEBKwXWB173JCSQ1xJmeqDdLSmNZEgT0bNzCCKPN5Nt0J8hTolrHtftXGTumyl
	RmtkWq1wK+zx8Dg4adKFWfLvnertbXsTRZ/okHxrwdFRKfqAXGRozT7OknobfQPmkx0vd4yYtxr
	dfcG7yTVP5cFlCLoRdUfHRP8lmYoIdxzcWK/u3dD6JO1R/vBx62k1MPVyJVWzP2pUizw/a2hM=
X-Received: by 2002:a17:907:75ef:b0:bda:17d0:cf02 with SMTP id a640c23a62f3a-bdd23af1a1bmr193607366b.19.1779455933684;
        Fri, 22 May 2026 06:18:53 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc264da1fsm53495366b.3.2026.05.22.06.18.52
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:18:52 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-67c2b4809baso15491458a12.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 06:18:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9iR/GfC/s6kSEfiASuqHQXHhwQGiveBo3IGd606Ij0q5+QdKRXvxiHwujswPc7qM1Pm7flwYKGNsxSjDnTE6Iqqg==@vger.kernel.org
X-Received: by 2002:a05:6402:42cc:b0:683:75ec:c17c with SMTP id
 4fb4d7f45d1cf-6889c4464afmr2034627a12.10.1779455931829; Fri, 22 May 2026
 06:18:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 15:18:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXoRBA-A8e=R8A4QOwdhVf2Xvca+PCD=UaKEjgFZU7RdA@mail.gmail.com>
X-Gm-Features: AVHnY4I_gegiQNXLEYR8j1H8kUfrINmIpRVRu3Rg4C4CjWJrdAfVaY1saWPkdfg
Message-ID: <CAMuHMdXoRBA-A8e=R8A4QOwdhVf2Xvca+PCD=UaKEjgFZU7RdA@mail.gmail.com>
Subject: Re: [PATCH 00/11] arm64: dts: renesas: Specify ethernet PHY reset timings
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,glider.be,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-32992-lists,linux-renesas-soc=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 50A7A5B56A6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Marek,

On Tue, 5 May 2026 at 05:43, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> This is the same patch for various boards, details are below.
> The discussion that prompted this patchset is at [0].

Thanks for your series!

> The KSZ9031RNX reference manual [1] DS00002096H page 60 FIGURE 7-7:

DS00002117K page 62 FIGURE 7-5

(and page 74 on the older document I had ;-)

> POWER-UP/POWER-DOWN/RESET TIMING Note 2 states, that after the
> de-assertion of reset, wait a minimum of 100 us before starting
> programming on the MIIM (MDC/MDIO) interface. Set DT property
> reset-deassert-us to three times that, 300 us, to provide ample
> time between reset deassertion and MDIO access.
>
> The KSZ9031RNX reference manual [1] DS00002096H page 60 TABLE 7-7:
> POWER-UP/POWER-DOWN/RESET TIMING PARAMETERS row tSR Stable supply

page 62 TABLE 7-4

> voltages to de-assertion of reset is at minimum 10 ms. Set DT
> property reset-assert-us to 10ms because the KSZ9031RNX RM does
> not explicitly spell out how long the reset has to be asserted,
> but this at least covers the worst case scenario.
>
> The Gray Hawk patch in this series depends on [2].
>
> [0] https://lore.kernel.org/all/CAMuHMdXJvrsXitGagqZJ_STdTTh_s1cBAKf6+esihaVWjfn40g@mail.gmail.com/
> [1] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/KSZ9031MNX-Data-Sheet-DS00002096.pdf

This link leads to the KSZ9031MNX part. Correct link is:

https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/KSZ9031RNX-Data-Sheet-DS00002117.pdf

> [2] https://lore.kernel.org/all/20260504225428.114959-1-marek.vasut+renesas@mailbox.org/

Shall I do the big search-and-replace while applying?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

