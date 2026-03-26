Return-Path: <linux-renesas-soc+bounces-30349-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBMUAZw6xWn/8AQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30349-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 14:54:36 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3F633658A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 14:54:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A0FF2307819A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 13:52:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBEDE30596D;
	Thu, 26 Mar 2026 13:52:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14462DB79C
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 13:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774533126; cv=none; b=PXOQ5pWdasRkSedvht2bjHRLhykQcFqx/VrAZAXOv1oHhGCeMlOsScO+l53098e1TWeQoaxAQY/B3PgWNFVMTwQWKezFqZ0eQlIv4mbOAK9GNys6jeZzmJVLM1/hQnfZx91YZocv29RsQ8u4dWR+wihCR/iUdvsjFEJrzYy4STo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774533126; c=relaxed/simple;
	bh=cDhfxyLE8KELmcN/V5Lg442JeUP5/oqeaxxHd9lzQWw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V9+pU8CwMPtqd9muR6OvWtdipeJMdW6vUuhdsMe+7GK4FiEyLsBCzWfNXnZc+BeIxzD052tl8CVVhHfYoKVoFWHAKq2Ngba1evHOm8PiJAtARTzbxBXQTlGT/7UjL6Sx5X3oI5U7w9kjFn2bgYyKqlIKcN2t46RIULofyUayFtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-56cc8a021e2so667413e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 06:52:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774533125; x=1775137925;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FMOdSdI6D4SgGqC7US2RBOxBiSABzWCafTcEjzVqecE=;
        b=puptB2NQB/95it1c7nJ7dLWZcQOM0hutut0iQHgghkJl+Ibu2PAg8DfEfNak6ydI+p
         3V/Crv/G5/sze3GRcABpXcVcMk+2GTPWEhuyyZ7zwsvIK7RWr9mY9xuZA7ykWQl7KP59
         G13lDavbn3zOYzD+nKicu9YoN6g96GcsZqgKzY02CLSf6744r8mbgKrY3kLBwbmx6ot2
         1JG1oqT3lNDsygIbP+wfKrzPyy2fr4a4KDrlYOv0hY9eSZIJZzkamHUEGRfJAUeqvsYb
         xWFoi6z4rD0rC4WB9k6ZaDCF0FEkpgKjd54hN4r/9xMmna3Kb2gKu5nHz49BOpn5Ejqu
         oEsg==
X-Forwarded-Encrypted: i=1; AJvYcCV0PU0kgEnyMOkMuyg3JKzCOsntX8bOQufsNo+lMUjcnvgZu0k2EXdxgRv33SFBRf4pNWE5WVD7A+/sU/TuwXNmYg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrkwD90ZVfSjxbajKeqA/xHNXw4Z9oHon2614555JCZq48fyrW
	PlDW2V9XU0y1re45rOpZz6KyjSvsRhZbAv6N9Tx5f5WgKC19lEb/ysFUcMLeeNnSBvE=
X-Gm-Gg: ATEYQzzfndH3SSfquQhfeRErnnh89uRVkWCvpbJD63c4wCQzKVa47KlYHSKj2/ZF64u
	L/8No1xP5xjctKGwBV/g42x0khyGUlK+8JPAF3ydkh0zA3khSY+YFU+Bzp+TlzXFP/bWpKYo7Vz
	wzCvacJ3T7HvGddVRH0yMYgErQmntFc7nCFnEZgWaLbEVliLRNS1wWtwsIpDUE4kzvmBeqGojPz
	8OYa4gOjTYqJQ35ggV8EkMv8ML/LXx3U7lrbPyR3K7vpUEHGt5IOd+LS++XjfoReON+0znqYF3E
	mPFN5L4T2GiSkSJhjMs1aOm4/Q1b91/0qUgRjferuUu70bH9BpgASOsXykhG48jC7wedM3eySCt
	+y9CHCEq5yD5EC8WcFEL896u723shwMBIDHWI9sWxVQ7T9wmcf5c18/ilAK2iadZ1LwSCi2WBvU
	s7qRBMieANypJ0mibuPLH+XYIRdhnVZwqW39xb8WIGnWL1EWErN2cIh/mtGe3K
X-Received: by 2002:a05:6122:8283:b0:56b:72f6:1b9e with SMTP id 71dfb90a1353d-56d3d6e4d87mr566043e0c.8.1774533124666;
        Thu, 26 Mar 2026 06:52:04 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d31d38abfsm4599307e0c.11.2026.03.26.06.52.03
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 06:52:03 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-94ac3958788so584892241.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 06:52:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX4YivIF4+CfOzyx9WRL0as+TXmOKJdjnz7wHMBmWK+KHp/ntx0vfFRq7wDGMbOT5z5Yb5CexyCUycQjjg/cqTXXQ==@vger.kernel.org
X-Received: by 2002:a05:6102:4b84:b0:600:ac0:ce33 with SMTP id
 ada2fe7eead31-604e49593d4mr560405137.5.1774533122927; Thu, 26 Mar 2026
 06:52:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324114329.268249-1-biju.das.jz@bp.renesas.com> <20260324114329.268249-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260324114329.268249-5-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Mar 2026 14:51:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV1oJUo-EhNh4C57rOtDLZEW-e8A0bVov3Dc5cbxgnt5w@mail.gmail.com>
X-Gm-Features: AQROBzAhPvwgDpGj9pCBr2oWG2oTfnhn5pVp1V4thQwYeL1ZFQS0nUmqDfQ7e7o
Message-ID: <CAMuHMdV1oJUo-EhNh4C57rOtDLZEW-e8A0bVov3Dc5cbxgnt5w@mail.gmail.com>
Subject: Re: [PATCH v8 04/11] clk: renesas: rzg2l-cpg: Add helper for mod
 clock enable/disable
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30349-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linux-m68k.org:email,glider.be:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: DF3F633658A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 24 Mar 2026 at 12:43, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Refactor rzg2l_mod_clock_endisable() by extracting its logic into a new
> helper function rzg2l_mod_clock_endisable_helper(), which accepts an
> additional set_mstop_state boolean parameter. This allows callers to
> control whether the module stop state is updated alongside the clock
> enable/disable operation. No functional change for existing callers.
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

