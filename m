Return-Path: <linux-renesas-soc+bounces-30350-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8D/UAN47xWn/8AQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30350-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 14:59:58 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DCAA3366E1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 14:59:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6337B30C55D5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 13:52:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B511A2F9D85;
	Thu, 26 Mar 2026 13:52:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7E62FD1D0
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 13:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774533156; cv=none; b=X5p5f9oucGICyxKj/zkisjfciknfkLnU0xJLU9Mw1EBOC4VPt269mRUGHpDK7QCVcbznLMH5gUQSznnkPckiKqVqEjI/jO4kgNQV0wh3TJKvJeoE3+RMbxaN5OrfIa9HxQP8Y/4zX5o2eCq/iHGJLnZJKJux5Czmt5aLv5VV170=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774533156; c=relaxed/simple;
	bh=2WS1pWOrnRdikMjrPLLMfFl5HfazgYWGkCTV2dU/KsI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jQZabpGEkBYpIXR/Nus5o6b6Ge6abgUJ3BX8dUMo9AG17uq6ip35kYr/P7vOvSjak4HaE89EQtADJi/ygzoY1AIqqUqWg9weH7eWsBNr+tqQcIwDrhefMZaqyuBnIZ8CRK33h82TPqXO9QxjPxbGLa+szbsk/6HxC6VZ+BfgKoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5ffe1c73287so374788137.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 06:52:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774533154; x=1775137954;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ysjP5a+B96pRuzECfyLK+hXAxAu29VfLSma5EDPanM=;
        b=U25WAFihAVK3Z4kAv1OPu+EYJ87ekXDrE9L1gVBMtcWhH/tIlLBrrXB9oFQHTNQwMH
         ZHmZvhA45GQL/374RDBnrIZCvJ7QduIsUSvalbohdWYSITjzdVHPAaLQKJNInOzS1N2e
         40XnwURtVZY58RUYkT6zUmRdI9URMi/k7mnEljYLy48Yy2jjDw6Zmb1DBMXHM6aVZpSO
         nvx/K7VgPnzhMV6cuBul+yg3CliJ1mx5QDYshDdh+E8z4VSFCXRTJb+pQj9rVMcrWLdB
         jKE2YHPnsda9re696iAnsMH3j4v1Z75LaVGU4Bw5hM5WTl6JT2aDvBZKRsCKBljzj6Ec
         PNQw==
X-Forwarded-Encrypted: i=1; AJvYcCUMqyG6Qoq2dGeMd1566o6QASju8Ku6/6M7Tng2CO79rN2Ti3sxYRJiPvz31mCgJN6r4d7/W5DJYEOPo0jBNc0O0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYrTq9IpvgPgO0J7yawogAk302mKu9xycLaz14z6yCSwKWzAIS
	4gAnJUDuIPmrYJ/T81ZQlBTmEYcFzg58ze1CUMZoilN8c+7xNyUHKqDP+MU/pD78Ffc=
X-Gm-Gg: ATEYQzz1ggpyqQu5R9JiP3T7mIg2PlNoxJOoPTNygjfNLbxWE+ZkI38OItG8sRCYSsz
	dlW7RHG71WoJPyRgDVyS8o+btmbiLxJM3oSW4qLecHNbVXihi0w6PkrKHsJRwvUNPkUnfwM8OoJ
	8EqNLWLuAmArK10buT0/tzlCt53GHabQQZR60sZ3xt8PGQ32II/wgg+DIRgKPIZR9sgWehoeCgC
	U9shwdmfe2UY19PLdB/MPtbTK0ltKczldwoKjgp0dx8blul8szc0HRqr8xFKkDkIf4U46ttgZd/
	u+jtkEPNfp2xyUxp2AaiMF+8tdEO1fTHlG7HoTv/Bcsja6/QJsghCFPz8ChppfhHjNnVjZHRL7m
	g/8bTfASqxXsDx20SeTQ2kH21kmhrhzl7xIxomqzVqvWSYNuIevPD2h15HZReHn6bZgazmOVEYV
	wFcl+5n6qS9fCJ8AuvnqQm33IENGmrPLyWRGzukD/ytRiWsVOelv/qcUxtgp2J
X-Received: by 2002:a05:6102:15a4:b0:5ff:b684:f796 with SMTP id ada2fe7eead31-603870e2672mr3490133137.13.1774533154368;
        Thu, 26 Mar 2026 06:52:34 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-604d50649ccsm3167343137.3.2026.03.26.06.52.33
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 06:52:33 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-94ace5d0e39so277549241.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 06:52:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVQOOO+lny42EkhcT1vDgIHEcoh0T58aAaX7dYhvfUXIo4Bu7kpFZaX2M/vAw0Gc2p8QZ2GHUXiyt3TmPIx1jwLzQ==@vger.kernel.org
X-Received: by 2002:a05:6102:8091:b0:604:d2c4:98e5 with SMTP id
 ada2fe7eead31-604d2c4a190mr1811064137.21.1774533153627; Thu, 26 Mar 2026
 06:52:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324114329.268249-1-biju.das.jz@bp.renesas.com> <20260324114329.268249-6-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260324114329.268249-6-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Mar 2026 14:52:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVE8m0eecRcNCXKZJ0sZaS8_0zki9U1+nD47gPmYY_7JA@mail.gmail.com>
X-Gm-Features: AQROBzA0Vdc8m-cj4-2ur0khV-FgVpkh92Y_dq8oIvaD3RiOpSnCN6m0_EvBGfw
Message-ID: <CAMuHMdVE8m0eecRcNCXKZJ0sZaS8_0zki9U1+nD47gPmYY_7JA@mail.gmail.com>
Subject: Re: [PATCH v8 05/11] clk: renesas: rzg2l-cpg: Add rzg2l_mod_clock_init_mstop_helper()
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30350-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,linux-m68k.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,glider.be:email]
X-Rspamd-Queue-Id: 5DCAA3366E1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 24 Mar 2026 at 12:43, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Refactor the mstop initialisation logic in rzg2l_mod_clock_init_mstop()
> into a dedicated helper function rzg2l_mod_clock_init_mstop_helper(). This
> decouples the logic for setting module stop state on disabled clocks from
> the iteration loop, allowing it to be reused during resume to re-enable
> critical clocks.
>
> No functional change.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks, will queue in renesas-clk for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

