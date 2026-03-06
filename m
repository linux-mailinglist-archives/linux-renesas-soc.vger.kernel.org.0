Return-Path: <linux-renesas-soc+bounces-28947-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGgHDKzKqmlWXAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28947-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 13:38:04 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CAC220C5F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 13:38:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4D0303056531
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Mar 2026 12:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84183280330;
	Fri,  6 Mar 2026 12:36:04 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2C426CE39
	for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Mar 2026 12:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772800564; cv=none; b=Rtq49UTqqos0IpQP9jJwwdEkEXVWOeZnsC3cF/ZW4JRUoXCm0qa031WI8fymhXrA4Tk1WGnhN4VvbwQJlVBKRVlzUFe2PbQ1doTYLG8Q3jyeNy8ThvOrRMUwvbh9JfR0GfFsg7dWu/S8q1AUnxmgXb2IhFMHSYSn4sm7tlzKKsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772800564; c=relaxed/simple;
	bh=n2/SovO2hXUZ4vwoDsMjq5yl8OUXVJvop1qoGL191Og=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lw9IsKn5WMRxpWBqGcFlr8unDBMXfg5PtSxCuLBrVWHInMbZuLVTfCI7xIRVCwjnUO3QbrBOdSWdsv0sNDhrhyOzNXeiM+v9BawEcqD70EJ/mrA0jpWGaR4zQ0zN0O/YV2+RuRsZ9C+B/TLx/gWjELtG/CjrmUmCSa+S9UeqVC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5674d8be45eso3610035e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Mar 2026 04:36:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772800562; x=1773405362;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LuKpTyRyDds90U323Zaw/KGEswVAeRJ7S19meSiB1CQ=;
        b=q5U46J23hK21Yo5VRHt9Id8EJ5CZZf0cEMoGNWiCXmK/ildgiPCEHFwkqCO3HcAylN
         Zmmvmf2hnmXpx6JrgXPgPF4GwiYKyKJcw2Eg7XNYcCOkYWwEE3uPStIi81Wcpz9WRjK5
         Gy3LPyatGWlMH/1ISe6DUhHeWhvOQb2IHPPufL3RWRfUHH6xI6hP4oJHQpxKvtHs9BNF
         HfnQranGw3UiRsmuenydCM2Q5KMWTXphf0iPrT3BrBmJKR92qotmBF7Wba4eV+1zuhaM
         XxlOh7XqaxkRp9QLd9+JixJ5o7UJ1YQIoa230j5i7C4i563Gq4QM1MJ+21CplobF76pW
         jOvg==
X-Forwarded-Encrypted: i=1; AJvYcCWTdqckb1S3nktK5zCa5RxAwGxzqJ7i0beNtwDohpG8/UGLA8Yxhadu4tXrCc2Q1C0NX8G1mMAY/m0JvEZviSW2Dw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyM/fY2DQqFgMh1Vx5i12O5Du/dFlHQ/0JzRAUeVtxi76xnALmV
	AJBkuI5num9dnrONtlUnrNoaIBPWl6DTmaj7sMg577LvQbBWkyYuU0D5MHRZGqau6dE=
X-Gm-Gg: ATEYQzxcgssdBZnIkpsbQnBWQUdpPklCEa7auiFWingUMx9+lBdJEMPYv0/ZpVg9aZL
	MHvsqMsZue9iQ+qPlROdUal3IjsftnsRRWlIYG9Alb6m3MOZsfAgME8yms6xrP6C3AGGRgFjzeu
	yxg5TYUXeNOk9fUhs0cKUcVCcqdozUKqwxt2JqL8h3PwcFr6Dr37VRTOlrCjdnQlDnTPspXPzBc
	qKnoKLXwP06H5XyJJWQVU9xSFy8ZREzWN/5k7EMSRnnF0JFLefP9VG5x9G+xEcWfykE39jm0hkP
	E+cG/+srs6mIQna6QfPzwe8ebddOG3PhCQl9KYQvZ5ohgTvl/s8Ro9gT3vyiktquRz/DcoPNq26
	OpO9gnBsKJiI3UyUxdsq9V2HxRYjcFvOXpfy1sjjMa6iXe4GPdGO/tYDbPpJX0wCO1VpJz1ijPC
	s9GuAnZNsSPHwHLDJXugWKBfZDyQ19t1ym9d7ZSuE4AhFjJZQH4l4ZQVBGoGCW
X-Received: by 2002:a05:6122:178d:b0:567:516f:256c with SMTP id 71dfb90a1353d-56b07f28ebemr499691e0c.16.1772800562192;
        Fri, 06 Mar 2026 04:36:02 -0800 (PST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56b09a26142sm1283390e0c.6.2026.03.06.04.36.01
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 04:36:01 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5ffe16290e2so271959137.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Mar 2026 04:36:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXfHrsLUtVCtN7xZ6jwJ26hh3NwUC9q/0V6+7009HaFgjdaZj2WdnMDXKbG5DD9LWkY36Gm1neP84Iu3SaZFkKtfw==@vger.kernel.org
X-Received: by 2002:a05:6102:5086:b0:5fd:eea2:ded6 with SMTP id
 ada2fe7eead31-5ffe5fcfca1mr594823137.18.1772800561486; Fri, 06 Mar 2026
 04:36:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260125190314.26729-1-ovidiu.panait.rb@renesas.com> <CAMuHMdUtZqu6xTEena3VXB1_5vdFM1Pu+n9aS_bXXw3cekgY3g@mail.gmail.com>
In-Reply-To: <CAMuHMdUtZqu6xTEena3VXB1_5vdFM1Pu+n9aS_bXXw3cekgY3g@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 Mar 2026 13:35:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUE34_eAh520j7xudoBWgeoPZr8ggc5LQGZHY74Ka3fYg@mail.gmail.com>
X-Gm-Features: AaiRm50UsQ0_G8RtZRr9PvUmLvM6ZOddcq3QNPHABwMCoAn8E2y8IhMT-rwBY0w
Message-ID: <CAMuHMdUE34_eAh520j7xudoBWgeoPZr8ggc5LQGZHY74Ka3fYg@mail.gmail.com>
Subject: Re: [PATCH 1/1] clk: renesas: r9a09g057: Fix ordering of module
 clocks array
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: C1CAC220C5F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28947-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.937];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,renesas.com:email,glider.be:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Mon, 26 Jan 2026 at 16:25, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Sun, 25 Jan 2026 at 20:03, Ovidiu Panait
> <ovidiu.panait.rb@renesas.com> wrote:
> > The r9a09g057_mod_clks array is sorted by CPG_CLKON register number and
> > bit position. Move the RTC and RSPI module clock entries to their correct
> > position to restore the array sort order.
> >
> > Fixes: 2efea3b35cc9 ("clk: renesas: r9a09g057: Add entries for RSCIs")
> > Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-clk for v6.21.

Promoting to renesas-clk-fixes for v7.0, as I have other fixes.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

