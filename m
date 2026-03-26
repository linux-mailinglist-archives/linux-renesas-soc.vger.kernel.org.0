Return-Path: <linux-renesas-soc+bounces-30352-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MsaKds6xWn/8AQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30352-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 14:55:39 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8789C3365E3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 14:55:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 327C4305F25E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 13:53:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3C5A30216D;
	Thu, 26 Mar 2026 13:53:32 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB1D2F9D85
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 13:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774533212; cv=none; b=EMMZOsZYtoY/GigO4YBlsMPsVbrAVC3IzQ2ewbSxQIYlDWBho3nbnYAB/PPBarzUbqwivJUdV1rxOk0JFRVCbEni+jI1Ij6aMgW5TdIw+L/7pFPYTxs1dT08uEzG5petxIJHJQSnNhvoQ3NcWlfRlTQiuDid30gx5rOZonhUQ7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774533212; c=relaxed/simple;
	bh=W8Dd4FlEsGFbEKAdC04ppgwIlS4Qx8iLEtMN2s3o6MI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TVNkjMiHMTTC/PeyABz39muqBlZRW0rKLbVUKEKeosFfGpvb2KWGy7tCOhHjinenvfKTewxxfMGv7Xi5pxrdRDkgJRhLrYHnS1YegAOulW0319Ig/13iFXjQ3QsKOJgo6qEXKDGrRmbsDEKMf0EAUTRYlSbD6BMB0AxvBLqDG9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-951a4e8d1efso161015241.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 06:53:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774533210; x=1775138010;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=naOo6LNAxTqdEVDTz8K5c9QHOQ72iH8wNq/q7MgHwUE=;
        b=FzJat2BdtQHpYs6Xk/24ZJAb1xbfkF8wcF0XOIkvf6UH/f04cx/ScHF8Rf99KkEWpm
         i7mDXR1hEauofGjF1aqY3+WnTDWdKBHWj1lnSt0+2h9b9RMKB+kZKw4qUITIfd1TyhB2
         Zawm/vGVOEn6mHtoL69PD6VvuHnrNwas3oCjLwn+/Lb5LdU1VjZj0uPDrdv8kjiBP+ju
         lTETsu4jlavuVMKTuEU58EH++fsJAxyQb6VVIWPyHZUW17u8BUucPTvjezgUiTYawL4d
         o6d4cnjiOzJXpvewYdRsWpKQtzwJa4W3j1mQXvDQe4K9sl8naPleh8wMsd0SPQxZj+CQ
         12mA==
X-Forwarded-Encrypted: i=1; AJvYcCWuGVXO8OpyVmuSd8Uy9STvSIHo/AY9R5xZ+uWerZEd5ZilM78ZAfFwGXgup7U0uFwGp9kMCIiNkgJq83pAfaXrwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJq6VDNZkVM/mL9GdPai8MvtvCtHkFDbT3xtCGH4JMdogjzTJz
	9/M6L1AoTIL++C4qEgowHHpEQV+pY4FxOfcOAj9AyvuHuzbtSZownkO814ouXaEDIYQ=
X-Gm-Gg: ATEYQzz3mbgEYfzpBRTjMIbspkAubgsvsXq9o31D66ztgTL6DVLPUQlr015ikXXGDD5
	uMWAtSMCw4ubSbzb9NEJfptD4pXs2Y2EIM0xmPMqAMh7DjqXKz6g+8QLyd8VTuS7aKtxIx89UZa
	mVKJg9HNYMC1sbjqs3kGbjgIWh8rihDuZQGobdCgyP3LZeW3av4ljaGWcy67rewlRCZaqOu2P++
	rmop7Z1yHDV/8rCVOXqKSSQzzaNloDNMjwg6uSA8AYMznOG7EciCGYPhu1fsbOBnHMcsVGhitad
	ouUHf3kkFKS3nRo7KrtJXIvCQlj7vczgMiW7AjX+xcjLhfcOI2xS6R6Wl6nMlEmHL/qcndbjMCp
	DwzLbz9mZXFEth3aooeGRMUrwy1M5vj2jZyQe0fBtGqVn6bAarIZSpLPV9mCJKh7uR4/9gfTA6x
	A7X3RL1wijNqP7DexE8iFHAHlVkZypUduSNRSy8HU7K6NVWHArmocboZIAWP+L
X-Received: by 2002:a05:6102:2c0b:b0:600:39ea:6ad1 with SMTP id ada2fe7eead31-60387536b1cmr3341706137.31.1774533210305;
        Thu, 26 Mar 2026 06:53:30 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-604d50677f0sm3205553137.1.2026.03.26.06.53.28
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 06:53:29 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-950cd03fb5eso281369241.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 06:53:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX3N8glAj0jDQtVU1zce/G1cFGPtxKAa0QFXNpkH649pon45qartlyetmNaUmBwibj8MhN9Q3Aai+/tUEQ20ttVCQ==@vger.kernel.org
X-Received: by 2002:a05:6102:3f51:b0:603:2432:9fe4 with SMTP id
 ada2fe7eead31-603873188dfmr3448093137.27.1774533208645; Thu, 26 Mar 2026
 06:53:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324114329.268249-1-biju.das.jz@bp.renesas.com> <20260324114329.268249-8-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260324114329.268249-8-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Mar 2026 14:53:17 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXe7WWKCgFnb4gEmU9AgOimEsTNkW7h5XzPDHWFrxrgAQ@mail.gmail.com>
X-Gm-Features: AQROBzDJ9v-y5IGqDTpmUqEx_zp1MmiMWDxFz6VTCxNWICBWoGWwBcRnChicpzc
Message-ID: <CAMuHMdXe7WWKCgFnb4gEmU9AgOimEsTNkW7h5XzPDHWFrxrgAQ@mail.gmail.com>
Subject: Re: [PATCH v8 07/11] clk: renesas: Add support for RZ/G3L SoC
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,gmail.com,bp.renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-30352-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linux-m68k.org:email,mail.gmail.com:mid,glider.be:email,renesas.com:email]
X-Rspamd-Queue-Id: 8789C3365E3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 24 Mar 2026 at 12:43, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> The clock structure for RZ/G3L is almost identical to that of the RZ/G3S
> SoC with more IP blocks such as LCDC, CRU, LVDS, and GPU.
>
> Add minimal clock and reset entries required to boot the system on Renesas
> RZ/G3L SMARC EVK and bind it with the RZ/G2L CPG core driver.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

