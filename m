Return-Path: <linux-renesas-soc+bounces-32249-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDJJIBSR/Gn3RQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32249-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 15:18:12 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFBD4E91A4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 15:18:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6CA1A3024955
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 May 2026 13:10:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 406E7326D51;
	Thu,  7 May 2026 13:09:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3332339863
	for <linux-renesas-soc@vger.kernel.org>; Thu,  7 May 2026 13:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778159399; cv=none; b=jSGKZZ2WTMAS83hpHBqIFmFzvDqiapktUvXj3CDymZ753JCncG0GrdBuijkwaRGgNubF0fa5dfB33bJ2MKRlHOqILgVgvhYR0rE4YO3oq8d09oIWHkTPBkHas1Z3l0NgjKsgnkh0xf3dWiyvOTHQOm1+GlNAbgDcvswYPRK+TyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778159399; c=relaxed/simple;
	bh=Areegk53H6/XbQwws7oOwPR0aURFGvMPYh3hgBswYzU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n5rM/ucWsy0HOdf04i5Acwqr9MkYWWofcrFdWH6+87xNWYRyPVDYwUXbdA2ZGLa8N/r69AjikzEGoBjDW4xWiofyijtpntudr5fr2hj9CbZ78hKQjsgpUX64HyA6i+ugmx82H7zdWpznCnFfgYzE6bEXV7arec2Qj8ZISQSSihA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5751136c561so1505633e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 May 2026 06:09:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778159397; x=1778764197;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RPy2YmNGhR0rtoHJZwlFv0JUOZnh2OU1p9YLs4YHLbg=;
        b=GO8RmPyKQi3VMJFIs4gkyxNLS4k68MFpv2vO8JohCym2P1dcnyigKxdAC+YDRySqCN
         bChYk0Dul6UJgEieJgXHOmEbi2mCgP2TqhWpq6LrmTCtuq/1h4UkY7l5vBH8GNBmqxcj
         O3xVkyqUWOg3UPQWvKoJTghQ/sIbLIv1Qtm38gwigOlXKtolEYl7xHmulLU1scngt6rH
         WR9706drovruGWbH9MvLjPdANDft1abfmBBIKtF9wtVa0aK00utTxomDixHOsg3CS54R
         W9h4/exZQxZCURjqsXYIZ5S3uCcz85E9qz/Y2w2iRiCCtrqv/UcX8vMJL9u445aX2DM0
         oZOw==
X-Forwarded-Encrypted: i=1; AFNElJ9OEICpiXBCGJi/jLCsKn3ZZ+SwH+8yQtxBvIC/SYnLwKUJLSn9P6+YX8W9KxJgwoeZ3eOAQ7GacsiFBZxCTI3Xgg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhBRFlediuDyLgKVjMv5rgKfVlY6Ua2fxdtdm/P6HpHVSAo1z3
	PQSTNVddrrcj5VqmQkkCCRjWE1XAdrAUOfF9eUM3/EzFNFAnLDPmd126ILXSVyXT41g=
X-Gm-Gg: AeBDietHEKdQLk6rPdbf0ZK5BYAw4m23WUaaWyvdTGbei9eY3hsECWR8wd4jzh+3tqv
	vhxyCKpLQszpmA526vBbZzRxdBb7EgzyMgXqAHWy+YnGNvL/Uo8MyyMtH4FeBMWsck2VTe1hd6g
	BjorVkgffaPHtuP019fObZFqrZCCCgqJu+nyF47FYpCv/v//htvPIVaIpiR1pC6BkfS6On9yqfT
	/eLBCJlRS//mSh7CV38WJ4kU+fhQKn6VxuJbCWVuxTzZ1ANhJlTgK7QlLCX5Lpvz7X8E2W2WGXx
	EK6vI46VtZB6y8WUNQdx+6JGn3SfMGanGCd1g8gdVxfeeZxHG/sSqAgYObucQBgl0nHrC43Qeb8
	CoDY8VRpLxurNpt/hksSx6mgMD7HjEyuk2lX1m3k/r1Jnr6zdTzfPtVrk0M0psNZMVXPhmwFA9x
	ZZmMu+gpy56zkwa+MF//Zywd+KAWTUW31lQRgkufSYeArk8a7dBzA2boO3bfY64beevVGeWO2lv
	nA=
X-Received: by 2002:a05:6122:4d12:b0:56d:3451:4cc0 with SMTP id 71dfb90a1353d-575702f2869mr951843e0c.7.1778159396807;
        Thu, 07 May 2026 06:09:56 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5754dc8b662sm4791401e0c.4.2026.05.07.06.09.56
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 06:09:56 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-56f6afbd205so489147e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 May 2026 06:09:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+Q3tF5Ka5Rjd3h6k0exYNhErob+jYZS3ciamuppW/45EANEeN9Jcf+0B//H5VQvUdyIWSj6x/lcwqVddvm6SHzfQ==@vger.kernel.org
X-Received: by 2002:a05:6122:e246:b0:575:9f5:ac57 with SMTP id
 71dfb90a1353d-575702660a2mr904531e0c.4.1778159395782; Thu, 07 May 2026
 06:09:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504144523.153906-1-biju.das.jz@bp.renesas.com> <20260504144523.153906-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260504144523.153906-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 May 2026 15:09:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVipbaaooxJpv_ugAF6Jpe2iOyg-G3RCM9WXPxJjb4ihg@mail.gmail.com>
X-Gm-Features: AVHnY4KfxZaV6cffdYAzHZX2lA7S5y0ECaxEl9ey1qV3v-mxmJpGbhI-x0nZrsI
Message-ID: <CAMuHMdVipbaaooxJpv_ugAF6Jpe2iOyg-G3RCM9WXPxJjb4ihg@mail.gmail.com>
Subject: Re: [PATCH 3/3] clk: renesas: rzg2l: Rename RZG3L-prefixed PLL macros
 to CPG-prefixed ones
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Brian Masney <bmasney@redhat.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: EEFBD4E91A4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32249-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.996];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,glider.be:email,renesas.com:email,linux-m68k.org:email]
X-Rspamd-Action: no action

Hi Biju,

On Mon, 4 May 2026 at 16:45, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Rename RZG3L_PLL_STBY_OFFSET(), RZG3L_PLL_STBY_RESETB,
> RZG3L_PLL_STBY_RESETB_WEN, RZG3L_PLL_MON_OFFSET(), RZG3L_PLL_MON_RESETB,
> and RZG3L_PLL_MON_LOCK to their CPG_PLL_* equivalents to reflect that
> these macros are not RZG3L-specific and are shared across SoCs.
>
> Also fold CPG_PLL_MON_OFFSET() into rzg2l-cpg.c alongside the other
> CPG_PLL_*_OFFSET() helpers introduced in previous patches.
>
> No functional changes.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -62,13 +62,12 @@
>  #define CPG_PLL_STBY_OFFSET(conf)      FIELD_GET(GENMASK(23, 12), (conf))
>  #define CPG_PLL_CLK1_OFFSET(x)         (CPG_PLL_STBY_OFFSET(x) + 0x4)
>  #define CPG_PLL_CLK2_OFFSET(x)         (CPG_PLL_STBY_OFFSET(x) + 0x8)
> +#define CPG_PLL_MON_OFFSET(x)          (CPG_PLL_STBY_OFFSET(x) + 0xc)
>
> -#define RZG3L_PLL_STBY_OFFSET(x)       (CPG_PLL1_SETTING_OFFSET(x))

Ah, here the bad one is removed again, so no harm done in the end ;-)

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

