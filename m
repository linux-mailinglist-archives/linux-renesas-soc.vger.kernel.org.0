Return-Path: <linux-renesas-soc+bounces-28711-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gF0/BmXmpmnjZAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28711-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 14:47:17 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD901F0A47
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 14:47:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6E0B53048D9A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Mar 2026 13:45:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35E9230DD2A;
	Tue,  3 Mar 2026 13:45:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D2C261B6D
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Mar 2026 13:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772545533; cv=none; b=uo6tE4pKZg5K9kYs43cCz5/8k9+AdCh2Tp1cOGfqqWqyg2zBqFt1BTrayTRGqpIGd9Y9kaUoH5kAQK7KI2fAech+yum4aVrem+DKK0LgkGLNUHEz/YQLr+g/Nl2f/bYqQ1dcyA7wln6i4OL0fHNp6MPN5Tfnamu5/mCT3Dg4Nx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772545533; c=relaxed/simple;
	bh=SNR2xpDpa8W7QuRujmnxUoyX2RpkimCf5xkJXD338gI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EKJkQ2ecV14+odOBbge+6XlKC7Xf4/6rEkMPDC3JGPWsMHWD9kJMZ6ls+QzpGbeZZR8y3+O6JqmTPqnJzHw/jR9nUfruqOPgeBq/BdUwnnCwGpRnHosKp7AOEtien8xkU4vd3APrFMiBm7EAz173+T3f/tfuNk/+30586UbogbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5ff9d225a0eso145280137.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Mar 2026 05:45:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772545531; x=1773150331;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mkmGwXveHkztkZyIBSY0oYR0tIf3nTxHZrajuRtCfLY=;
        b=beG179FG9BozlBe1RgBcvN0xF15mB+kvpHy2ynm+KHfvnreJwKlK/683aPPEV283N9
         zPjUEStKpfeJZtQ3hKIUyPV/n3VBmk3eJWcS6he1Fj2tgqaSxktdP/u6z/mMMuH8tvo0
         gm5dbZLwwknyIh5VdOsQq18FPOzEYZVN/cd1Jec0fvvpmeOUSV31z1UYXOni5t3oLbzL
         /jHBjzIF0iT49FckznMc+9n9ioE8cix5TuYZadOZgxvkYRvhhgVE8YaeTxb9H+YQZS1o
         RRO55pOGQIlVUDpv6TM9A4r/pIlAN0G5cqD5QgePAOiysk4/93qyTilX+g7Jg2pjZxbU
         hpWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUFDF8t0ZpGCAz2gbYa22no4PPtsgPt7hpgbSmhuuMc/tEDqCUPyoipZF4gkQzYA+Zs5LCywWNOr/0IsGEVEHWiw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzbqgz+fs/KwtVFoE+PKCLBUT7loXyO/X8YROzDBq3Duhd7zZJG
	2NeGP7C/lvT0StOdElQhTYmi29m9osmQeEYUfXus1UUJ9n0Yk3LwxJOcWWgEH/HU
X-Gm-Gg: ATEYQzyQ2OlQNnYKykmBYWbduzuX9mC1N6sChhLx36sGTdWvbRwOzftXhXthyNNHI1C
	vtueTbirpKVJ76sDm2JTkxX0fLL6t6SS+ErO8mouXKjgVa374KsMikdl/y3dzql0YpRVOFaq8rR
	T803zNbOLw1s0CDnuSitPmj0ICBVKztWmngifCosa5TuZT6VPwQCf3t6AlUiSScnBOFgLMGV7Tc
	0CVvjMVMRnsm807QnOiHoSO62d+y3zEYeSGQI1HyND9mcAuM+IEagfIkI+jOM3jUIPG+p1EG2mb
	6V+qVCxFz5Ki8KZHe2BQd/WnhbeAqPXBOHRyZm3fRdJPfUnxRSfzHp2DC9ioudIsBhW//qDZNZ1
	J9qpRApwty+s988GQN1ng3fb8gxb5vC6J5YO/ZLsdnTwPmKtFOD2sEiW8fyGg4wuVR/0qeG5cjl
	X2P9L9wmDVgfyXIjy7aLXFz5wOB8qXQOyxz8cGyQVLZARVgE6m27QMugkhikOs
X-Received: by 2002:a05:6102:390a:b0:5fe:c17:a2aa with SMTP id ada2fe7eead31-5ff322d3488mr7931825137.5.1772545530823;
        Tue, 03 Mar 2026 05:45:30 -0800 (PST)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ff1e3e6013sm17013031137.0.2026.03.03.05.45.30
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 05:45:30 -0800 (PST)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-5ff9d225a0eso145266137.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Mar 2026 05:45:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWi2dH2Dl7qh72DWQPHFcEJjJRpW/0JkWBBfiAvvQCohiL6HzjfAw1jYBrKVvp+xhwozw1Os1Da+N6JPDqQtpSa3g==@vger.kernel.org
X-Received: by 2002:a05:6102:c47:b0:5f5:487c:83d2 with SMTP id
 ada2fe7eead31-5ff325d53c9mr7848373137.38.1772545530401; Tue, 03 Mar 2026
 05:45:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260213131742.3606334-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260213131742.3606334-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260213131742.3606334-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 3 Mar 2026 14:45:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVxz_PywgAAJk-ogGtQSxokw0=Rdd6QRU9kuFm5ZfdkpA@mail.gmail.com>
X-Gm-Features: AaiRm530N02eB2qKZhtE3cDoZ7vWzVsvl_vuwpysdaQWZ03UidaUkNSht_tuOvM
Message-ID: <CAMuHMdVxz_PywgAAJk-ogGtQSxokw0=Rdd6QRU9kuFm5ZfdkpA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r9a09g087: Fix CPG register
 region sizes
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: CCD901F0A47
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,bp.renesas.com,renesas.com];
	TAGGED_FROM(0.00)[bounces-28711-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	NEURAL_SPAM(0.00)[0.516];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,renesas.com:email,linux-m68k.org:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Fri, 13 Feb 2026 at 14:18, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The CPG register regions were incorrectly sized. Update them to match
> the actual hardware specification:
> - First region (0x80280000): 0x1000 -> 0x10000 (64KB)
> - Second region (0x81280000): 0x9000 -> 0x10000 (64KB)
>
> Fixes: 4b3d31f0b81fe ("arm64: dts: renesas: Add initial SoC DTSI for the RZ/N2H SoC")
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

