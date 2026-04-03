Return-Path: <linux-renesas-soc+bounces-30837-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8JV4BnqNz2mmxAYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30837-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 11:50:50 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED26393006
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 11:50:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 17E553038A7C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Apr 2026 09:46:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF1D736164E;
	Fri,  3 Apr 2026 09:46:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B5E396D38
	for <linux-renesas-soc@vger.kernel.org>; Fri,  3 Apr 2026 09:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775209610; cv=none; b=hEGBKlANdh55WIXTq4FWv+u1XfIA6/BfnbBQxELoLx1MoxEwlBp8D/DxOXZ6+4BKmtTCbGMfrSXi5Yt+26Emc7kpzI+TSQcpw7AfmuSY+FS2npB53WXkZdistoMasuak4pZHqqjOhju20BtacomtVfRa6FiSducseWaH41HN5hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775209610; c=relaxed/simple;
	bh=xIMtkM1AO/+pCb46/YkL1W8hk340AiMC7+qsqj2101A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U0QdMMMsXh2cZWiQUYEani6UDm21H/qvi3107RydKD4/Y7JJe2TJS95kvXdq4NjLXGkqIMzTZTtaNIZx5jKAkypXej8Nt0dGibf8aYjWwOPqlKdPUG1qcn1XHM4ZpZex5OXdHD0Y35pQ1wAcCx5pqbFNRlpA1aLk0gCQmBwyuOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-605a27fa8d5so518033137.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 03 Apr 2026 02:46:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775209608; x=1775814408;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mf9z1RidjmeEkLdOPGa/NEhd6I83u2yY4czLjlv7UXo=;
        b=E2zZRb6WUL2VDY9wX1Noje7qHuoih0akwbVrNncePXSJArAaw7DmSZ2PlD0O3nUGYF
         xSWqFHsN0xshJBPlgySXo1JWYjuyrOhn/5pVN86TDGdUjBS9+yB25eJ9N/GY0ieriNt+
         3S3mhHWsE+yGoJtPvHfDQffUQ6EDCUEeYgEJqbBHypswho8OQA/Q+WPZLbW/QHsuvDjk
         +z6yeEx/GHzgV3NZVgWPA24JJoDJNsdK7G4E31TkPx42Wz50BY3JvN3I6lS9D+I/4s7g
         xpuh2em7kbhq513nzPKTF37TWSfnQMIBxGAeNKBk1W3rgfJWLFP9RFv8gbVN+CEtCHIV
         6tjg==
X-Forwarded-Encrypted: i=1; AJvYcCXGTKBdlbZa/KIDpcCwBeM9fhpsqvhxVcsUrk4raq+tke1eIPTt3OJgob+A7WjJ2/8wDC0CF0NYL4Syv7Xp3jSrMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqyPzdbOZTnoBabe6YSxKOxsQe3+2rx206ihe+ZAwX7YODJSzo
	YBZXN/S+z2sGOje86iw3U3nKdEN/yhKACVfkgQznCZ2lghf1GmJ2Bl02RnNrM2fk
X-Gm-Gg: AeBDievVw+ABQMVLJ3j8AZM/5lJug4pF/Q6PPaYRDC3jqlIE8EjYXC7mfjhd/n7Ly5j
	pgvAcZvx1c6by84+taffCDLEcWtyBFwrB3bbXsOF5tgmwm08qIRd+YQXRMupRrqKUQ9B1xGhLFH
	uL8oIVv2ZZyCZMrwCtEWe66b6+lHasAucgIxDwfi2NNSk6vCRmu032eGZ4RPrvoMNwkNc4wkrr/
	Yt5Ig2MejnUh7s5+FzVphO1rZurF2nq9bKRI4Ja5ErknPz13g2BtvEkCVZ6xYFADluxgL84mXpq
	e9tSiO9BsSQOqsak9yaD2Vo0FnWA6h2LRbxPIMz183NnCC5TijLQ8p3kicVFDSa76qtuG/9IMhp
	PR8XBsYozPMGTHkIsPkLXhNTO/NCmOciCxbnDO1MvJDQvLiHALafohYfeRlB4WWrBoawyVTH6+i
	VGpUMrie16QTKSRpmOrOQFQbNsLgJf08izd4OlNZ7Wmy8E8VCMRCdFHZmcyICQOds1OexQIOwNa
	Qc=
X-Received: by 2002:a05:6102:943:b0:5ff:ed38:1889 with SMTP id ada2fe7eead31-605a4e176f9mr979331137.10.1775209608137;
        Fri, 03 Apr 2026 02:46:48 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-60583049c1esm7322690137.8.2026.04.03.02.46.45
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 02:46:45 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-56cc67e01deso1619809e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 03 Apr 2026 02:46:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXW+ikDpPs+GljWPuySZsPpR43XaVd6m3Y6iNsdZeANd9rl7XYRi3DWHwm3mSgIXCKTuR+jRVerjpHIlkCIaH7QhA==@vger.kernel.org
X-Received: by 2002:a05:6122:4599:b0:56c:d5cd:1e7c with SMTP id
 71dfb90a1353d-56dab87d8b6mr841968e0c.5.1775209604909; Fri, 03 Apr 2026
 02:46:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260330132349.149391-1-biju.das.jz@bp.renesas.com> <20260330132349.149391-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260330132349.149391-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Apr 2026 11:46:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXY09WjDs=6ojnA0FyXSJTCq10Py5tBpOuMPRo1yAv6qg@mail.gmail.com>
X-Gm-Features: AQROBzBmMKipGCj9PSn0MXH_r7ou15tJCBurl67WKLPlkmCeCXsLcjgV8p4hKKM
Message-ID: <CAMuHMdXY09WjDs=6ojnA0FyXSJTCq10Py5tBpOuMPRo1yAv6qg@mail.gmail.com>
Subject: Re: [PATCH 1/5] clk: renesas: r9a08g046: Add GPIO clocks/resets
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30837-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.251];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,glider.be:email,linux-m68k.org:email,mail.gmail.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: 8ED26393006
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 30 Mar 2026 at 15:23, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add GPIO clock and reset entries.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

