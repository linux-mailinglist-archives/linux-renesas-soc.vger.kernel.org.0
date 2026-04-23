Return-Path: <linux-renesas-soc+bounces-31521-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0L8LAIvP6Wm9kgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31521-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Apr 2026 09:51:39 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E7844E2E2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Apr 2026 09:51:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0B696304EB8D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Apr 2026 07:48:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A07AA30EF91;
	Thu, 23 Apr 2026 07:48:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F40F29ACF6
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Apr 2026 07:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776930534; cv=none; b=IYHM4ZgD68c7ci5Qnv3RddshrY5sNTvLmD6fXjpPjsR62pTMwudjY//5fnczTEyPclS5DYdMb6gXQ7QX+K4CtxDScHdys+xT4TJOPKPY/vtOGZjPv3+KZp1Nep10AT/gHUwmse7sjPstGBzeJZbVqDyYBWvl9+HA/BEGj3bzzhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776930534; c=relaxed/simple;
	bh=bV6aTtX0hDvOCc3SXegbi1yOc8CAutUCssPxRF8+8rI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZbiZFUR35tCJDhze0aE8gXOU0YkpUj/nohbTVaCJGTKfaeXZwtz3dCDWMUr33TKjDMlrrCj6irHKo73Ndtn2Fhfyu7yGm6v5fVMYN0EDWLy7OqeGDtAYCI1g0Jcynczx+ce5T4FD2IzOCirdkV/zE2bP0Ux9gcWntYxu/fqnocM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-56739adfa1aso4428043e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Apr 2026 00:48:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776930532; x=1777535332;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0rz4Ubyu3jfWWynl0S5lveC14mxcG1dEX9l+5mJrbEc=;
        b=YrQaiOArBGqM13Bu6SHSxxvsX4wpszGo4NomQtk6bEod7XeqzPIda9tCfF2ZyXLRYK
         wFzjE6Nd2p+wLJSwsxd6EAzXW4YFSvYm2avdRvTgCmtCyzDahcJlR214W7qOBQHTetkB
         Q1hckJMZcXpG/NoZdjPDXQmBCZRZPfL+w2BhkUaMiWHnEkSoTs5SI0lbRJggjbMxWaW4
         n1iGwqr4GT5KCzMeRNRY7IAiYcfe+Y8Wa8k69wCuKrF6q5KS+ls4aYkl6yXuQV9Izl3+
         scqxf82UUvx123Ezze5nGdhqmqTT+62R9OvRsUibTe6JMnPcyMNZ2tDXPXT03zHNWz32
         dWWg==
X-Forwarded-Encrypted: i=1; AFNElJ9KKCvTkfpxQjL8fXc8iqGuX3r2KnWcoOxh6zH9WAcUzFm6Zipx8zh3x8ZvVCUvf06sw0cxw+yDn65ZFpuLtpjNfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLJt89GWJokjDZcXKyK9kkD7ISsr7Nadr2COaPs1/3uevoAWT7
	zp9sbNCvHPRS+TQ+ZNoFctOAK5swhK0ak1WwBXlcfDAwInmieNLQNTXP/WxmMpoT/4s=
X-Gm-Gg: AeBDietNyDoHqui+HDDd4pQnFs/O5nn9h2k5wc10nJvub4yRqu3I1IiMVjqC+/sx3hB
	cYeMKsXH65PIN8WriQ/rxsX9OJrgoNpSLdr7rYl7E3CHnvEI5RaMQMxCu4JkZmMr7YzsAFR/uIq
	orE6rgfUZwkzIqRhTPni8SU47x3fJsJ15SYXY/MVCSbPwBy5RFQUhKanMrh9AtBgQuoVl2vqTZP
	ULD18unrPUmpaJaIRpjZC4TKdv4hHp84aCSCFAuwiXQ8kowqsc/CmsJxqO+PQi2qUNaF5iS5kUn
	aR1pV5+L/5Yg3ywBE0+Ws8ZR8tm8GoM8Cber/KmOWy0dwoHiYMBHU2RmopxffiYx2XnBrX4HUYo
	vbaSIRMT9PLF7EuN10gjOh2D1xOvlEIces8ZuBsmT8tfwInEEzfPseZqiwoU0RgUYonX5ThS5vx
	GFdkFePVUvgif+sJH+9HIKDtzWgSLZPxXa3eQHJ1si925DitOXf/ecdtUov33Y8csT1EGiGIe0T
	vcg+TrP7CMxsg==
X-Received: by 2002:a05:6102:6a92:b0:603:273f:3576 with SMTP id ada2fe7eead31-616f4d72895mr14610514137.10.1776930532184;
        Thu, 23 Apr 2026 00:48:52 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-61a52772936sm6240087137.8.2026.04.23.00.48.51
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 00:48:51 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-56efdc96b05so3969257e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Apr 2026 00:48:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9y8pF4eOBxPePdmMi/CN8viF7/XSQOYMUqGjHJzw4LNc56p8b6htTTORWJEQ9A7kcvitoqAsEvpJzLjfuGMMsZDQ==@vger.kernel.org
X-Received: by 2002:a05:6123:5d9:10b0:56f:bb91:4861 with SMTP id
 71dfb90a1353d-572278284b4mr3012743e0c.0.1776930531157; Thu, 23 Apr 2026
 00:48:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326110648.29389-1-biju.das.jz@bp.renesas.com> <20260326110648.29389-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260326110648.29389-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Apr 2026 09:48:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXVZfsEHRSJO=C3iuEpa+2k2Xgji3uNxnkyzUrEEtz9xw@mail.gmail.com>
X-Gm-Features: AQROBzDG_5783iyOqKuu3KbfFJR0HwgxpR86ZMXywqtk_FNHF0_cGI7fUu1kcT4
Message-ID: <CAMuHMdXVZfsEHRSJO=C3iuEpa+2k2Xgji3uNxnkyzUrEEtz9xw@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] clk: renesas: rzg2l: Drop a check in rzg3s_cpg_pll_clk_recalc_rate()
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31521-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,glider.be:email,linux-m68k.org:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 62E7844E2E2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 26 Mar 2026 at 12:06, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Drop the unwanted check in rzg3s_cpg_pll_clk_recalc_rate() as the function
> is SoC specific.
>
> Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
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

