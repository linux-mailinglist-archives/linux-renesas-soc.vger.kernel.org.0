Return-Path: <linux-renesas-soc+bounces-34525-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aGg6CBOIQmoO9QkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34525-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2026 16:58:27 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C9E6DC5EC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2026 16:58:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34525-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34525-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 284D23230ADC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2026 14:46:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E44F6426D12;
	Mon, 29 Jun 2026 14:44:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6104266BF
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jun 2026 14:44:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782744270; cv=none; b=sFGr2GBtYoRdukYGq4N283p1r+NRZvAuePHLenBFg6FKHHeQPdxBKr6HZXJNY3Q7j3e6Ruv9Qv9eqHkpUimT8AnIbtc1EAtuMA/MEYrhjsvMK9H80ct3Wln4lbq48/Jwnh3x5W7mLDos52ho68/HJLitgABYRSn7UlQBIjzwjGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782744270; c=relaxed/simple;
	bh=kVTh23sJez09owmKcyEw5w2806Rb9SC0opFLcX1IrTs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cBkWDyhrr1PLhlo7m12xzvedYoyzKLpq0z+kEJE4Ju7D+uGycJ4hDwovG8EQi+2miBgF0IUj8WkU3U99kT/1ws6FVT7kd8U3mT+W+HIztD1/hGXop3UJyWDJO6mv+FbUrsLLMfZi61qmygPG8GF90i30H30vENhHex1k0dO0rlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-59f8a140a51so2550049e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jun 2026 07:44:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782744266; x=1783349066;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=msXjx8KznxQkzXcrCPFA3zsW20N5m9gILYTYEJqxx1E=;
        b=ojdDWn62PHjiToy8GF9Xe2GHmwBM5f3CQSUH7pcLTLWYWZYzzkMG6Qs4Uf1eTVgD9R
         IJUkNJ1f0M/gXbUcxYx32eMXPFAQVEM1FzTiUaiybGrJrysEzhR6bktD82rOREY747VZ
         RiloVJNdN8L6QlNfcV3mcmLVoZMSpJWN+/SFnN9xZI/7EcWj4ubnlZAAWzONgh25vyq3
         haKCAVSxcXDq622lHZDj9Ba2WOVXQZAQVdkx4m3msW49ZKjp5yUqXw2tfGMkTVJdy+Ow
         W0ZablqUvZKoxP7LzTnZoeFJq9BzBZX9tPK8yd4QwlGUmExfUHxZk8TfsZwld5aE+F/g
         RoBQ==
X-Forwarded-Encrypted: i=1; AHgh+RqIrlTe5j1V5aQYjSPWEc/J52Jt5swE9eT6QwYL5p9ga/OCgNUNkBT+CUEpbGY5BQ0soGsht3XgfPqEgajYe3Ma8A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk+mFmbTSIV6qB8qCn+O79fcsuTjAZT/5mPQ2Zsn3iP4BLi/oQ
	wpLkSOltvHldyp1+hJo19Xh5cixZvJLeCibSj0KTwZoHoaUlNl7nX1l/OMZ6HbGO
X-Gm-Gg: AfdE7cnEvZ1Qdtwm2FzXKf6DcuKxRQrY1N7M6FQz7AHrHSpeq+zrBLLz14A3JHsQ5zZ
	6j0YShxhWYg4qBQImWsMAqofxIl8InmjLdTIQyDvcr9N9xLBmTqDwpCiD0bHGWRYviUEu8dTl3Y
	n0dbCOR/L0zqoxqmgDn0bXDXfaeI18UEvLwuNhA2dGi42YDOPY6m/snFdHh9HW/b0psGqQ/N7sS
	8link1FRrBJobTMLQnHKxGouelOHmmgvHctbciZSI4BD2WSTG2Lfzp1YtVsL8czYCs52WfmSGi3
	Jb2qP0RRI0t3pIJus/rkabR1CAgMi0QC9C6ZkjjdhuMKnL4hSTQXHw3FgpM5qxj+zjGhI7I5kH7
	1BCZv/LWkofNmMulm7fkMaukDu8F2RLI2oUL+qKbGqKKY7U8+nR7M0UCdEFpWYD4++uy/rZySLp
	GI0mz9bFGziXS3SfifklGpKOAuN8O5aTDqLZWRIVaU+3cthnDZsw==
X-Received: by 2002:a05:6122:1d89:b0:59d:ac8d:e130 with SMTP id 71dfb90a1353d-5bd69da672amr8164557e0c.9.1782744266300;
        Mon, 29 Jun 2026 07:44:26 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9692fedd988sm3351687241.13.2026.06.29.07.44.23
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 07:44:23 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-738a5cc517eso788195137.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jun 2026 07:44:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpzPueFNLd03+dBR2gGD1tNz54E6Dbu6ZGmeXsoex33hD0wBgxagIb2VjI4Ya84sXMX+gW7+rZRqeo7XHRnlNxDeQ==@vger.kernel.org
X-Received: by 2002:a05:6102:41ab:b0:737:8ff4:147f with SMTP id
 ada2fe7eead31-7378ff41b94mr3107111137.17.1782744263174; Mon, 29 Jun 2026
 07:44:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260625135216.130450-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260625135216.130450-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Jun 2026 16:44:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXF_2HiWosZfsm=wVUN7C0ow5eFtOczQAoTzsNKDw_+Dg@mail.gmail.com>
X-Gm-Features: AVVi8CeObIM6aaBJ-mhYyAFRlYPaZfnGXmLPaP4HjXsOdJzbgQQdrv_VqcGn0JQ
Message-ID: <CAMuHMdXF_2HiWosZfsm=wVUN7C0ow5eFtOczQAoTzsNKDw_+Dg@mail.gmail.com>
Subject: Re: [PATCH] can: rcar_canfd: Change the initializing flow for clocks
 and resets
To: Biju <biju.das.au@gmail.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Tu Nguyen <tu.nguyen.xg@renesas.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Duy Nguyen <duy.nguyen.rh@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-can@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[linux-m68k.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:biju.das.au@gmail.com,m:mkl@pengutronix.de,m:mailhol@kernel.org,m:magnus.damm@gmail.com,m:p.zabel@pengutronix.de,m:tu.nguyen.xg@renesas.com,m:biju.das.jz@bp.renesas.com,m:duy.nguyen.rh@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:linux-can@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bijudasau@gmail.com,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-34525-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[pengutronix.de,kernel.org,gmail.com,renesas.com,bp.renesas.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,renesas.com:email,mail.gmail.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 65C9E6DC5EC

On Thu, 25 Jun 2026 at 15:52, Biju <biju.das.au@gmail.com> wrote:
> From: Tu Nguyen <tu.nguyen.xg@renesas.com>
>
> Testing CANFD on RZ/G3E shows that many registers do not reset to their
> initial values with the current flow of deasserting resets first and then
> enabling clocks.
>
> Based on the HW manual, clocks should be supplied first and the
> resets deasserted afterward.
>
>  section 7.4.3 Procedure for Activating Modules: RZ/G2L
>  section 4.4.9.3 Procedure for Starting up Units: RZ/G3E
>
> So, update the order of the initializing flow for resets and clocks
> to match the hardware manual, resetting all CANFD registers to their
> initial values. Also update rcar_canfd_global_deinit() to assert
> resets before disabling clocks, so the teardown path mirrors the new
> init ordering.
>
> Fixes: 76e9353a80e9 ("can: rcar_canfd: Add support for RZ/G2L family")
> Signed-off-by: Tu Nguyen <tu.nguyen.xg@renesas.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

As CAN-FD on R-Car does not have rst[pc]_n, this patch has no impact
on R-Car, and I don't have to provide my Tested-by :-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

