Return-Path: <linux-renesas-soc+bounces-31372-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BBDO6GT4mlR7gAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31372-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2026 22:10:09 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A86A41E74E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2026 22:10:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 24083302BA4F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2026 20:10:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90D8031D730;
	Fri, 17 Apr 2026 20:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oNumil1L"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C961231195C
	for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Apr 2026 20:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776456602; cv=pass; b=d73R+x09MRcjdL0dYkcUr9vsxG9pcxWQ/RpMQi6HWo6EGXG0D14jiviSYNpAsEl6nN3DixPqz+KYQmLibor9/lcoF9xN6c+9I+uiKoZm1xxOzM1RNDvAQaB668AHF7UYi4+q4y1Z+Vy57m+lwrA6JGies62h5i9RE/Ba1lmrPlE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776456602; c=relaxed/simple;
	bh=KfwyHjnRK5PORHQvawsRF5yf5Ku9YrebmoGX+N/P4LE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sFzkUx9TFARFOKYcD8i+Pgg5pJCDww1qda2shhiken/SfnP1ONS9gnhb1eAXDn0x+VjOxgv8SEIlKDSt+SLuGw5ChzboRroXL3dzxvqWgq0uMkFz6ns+dwzf8HB/Tm0pZLdE09n4cH2w6J09SEaCPTgmkYu7dw8vmKldTmscMaI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oNumil1L; arc=pass smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488ad135063so10070895e9.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Apr 2026 13:10:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776456599; cv=none;
        d=google.com; s=arc-20240605;
        b=gXha6Si53OYcQi1DjKxCd4UJt5A3sfjG4XJjzUYC+X3q+C215ArzFAiuq13ge+2Rin
         QYJTfzYT/S8R+Dq5ezjUuTSwdb6lcIN//Yvl68vwfaevCcUV4CyHX6bRBoNSX76UHePv
         d6KBCzgLFLvjBDVaUe/FnRJ/UL/LKM9I6OAeICPe0+y9mpSbCUFXf8uEkrz+NML1hshE
         1WLH8PvJjQull25UlzdVGMfcK2rAw/PRqy9KQlCGgbkEnZQvcpbys1/Fuw+Uu7Hv8ukE
         J3JuRBY3cQlwEx9kmdzYmEl3VylB4PH9AY/P/FI9QBwdqepwmTkn8g9YbHWebIGg5zJr
         R85A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AmwNr26QUFCamE57s7GyAkLLk252aiE5LvYXuYWjq+M=;
        fh=9sPXieJBpFxMtcak3Z8UapN+V8l3XP8aX3D1+xnGmHw=;
        b=EMqWyREwjWXwyWO4cK2guU3H3UdxneMq21i7L+cs8ObxHZKGczaZRWcXYok8VDacAL
         LHFN1bhhaBNf35kByq8moPwbbkGEAvKL6xkPUkOCRkinuakq+F5WzMhlFbnnttiY9a0I
         H0M2SzrQp291cY9ICOuWWx4TWkTKKdodMThq03vde1ueZLo0/KXe0vAfqxrr729Ih6RN
         pVFal6S0HBFS3BJDwJNh6XJq1AqjT+wOUFYPI9OZo8t+8CsKL0qLCNPSU/JNtRNpnTug
         UA+qHtE1O1qOG9isJV0bxRGREz6cJeMxc1+LR9PJs/ZLOwiyILYWRhfyAnGYORu+Lhfd
         ILEw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776456599; x=1777061399; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AmwNr26QUFCamE57s7GyAkLLk252aiE5LvYXuYWjq+M=;
        b=oNumil1LR5oMhsYq1vYJHTixUc0Is6YtP81Bcor5W4AtyljB+CaQwuIw1TUdyg0u6K
         GA/4OkSPA8SsLbukgic4g1ed8Yv7L2o4p2TtIWttPryFqCDWZVVQ+6oHcAQUgTDcwTMN
         Ixj809n0Ytp0jrLjpobJ85dG2bYMJ7GARFYhD9DiHRkiVNClmkwMfKyCmoKDTVk6thWt
         tQ8b2auBCIYu2hDyz4VRPajMNUpD0HG8h/Ehu77YKWQOWtUlmHcPfRfN82enwc0mh89i
         dyIDk+BES5xaPFe07xK4eSm44o0CouUPznSiSzSMeKVWMjxTZnfhat3Fo47nx30l5DZM
         107A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776456599; x=1777061399;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AmwNr26QUFCamE57s7GyAkLLk252aiE5LvYXuYWjq+M=;
        b=NBvBHdGQ5G7hn0C054RoufBie6SuGC8EFn7496SZFW+tQ5Ca6FLb1qw93EG3AFmbkX
         iSiKVBTJ0fdI725JS+5yaeNX7vyhb3ThbQghY7U8Gchcomuh3uU7soO24s0qAxZe/xdQ
         y8aghM/PVh5pNZoXUPF96qLrjtqc44AtUzbfFu7JGnVj9LnDlhBAK0t3Kmjt9+LL2CUz
         729LGJe5EP2gnjKzltngoVKkl/Vbfsl+U1hsEzX579ln0lQPfA1o/ZTJaGP+ioCSpd47
         C/jZLKatM4l8CfvGfDXfZ1qYHlgL/cgOBcGbUVz7s9CmJ1YtjxcDatzBNpKHwnw1fhfa
         vfRQ==
X-Forwarded-Encrypted: i=1; AFNElJ/STYiSaooza4WIbJpzDla9abmofh+leGVfCizYEYCFJEhHviBmHc2sn3Y38MKWiGjGYwXMJuh4A7AMzNRdg+Dipg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyefzpFuhvw2FvUY/Wz+APlKghmYla3+wXKuPDWtDi6Zt7ZnNSz
	LEJlBB0zgBxMWUL5CnH1ajapyhm2qQvLWaKM6XUMpn4Dg15WpJqMuLxdQ0RmVJwUPsMamSXYaQN
	eF4N0YImFWr2AtvqjmnklcKwIrzniZQQ=
X-Gm-Gg: AeBDiesrSGjX9bK/kej8zG+J6WiOOgkvNOiGzRybOwauQxxXJDuokCBi8hf2V6ldXGm
	cc4edLcfNbRC48gLtRQiLgvVXrdI1qt0HPZobl3DZyx0+r879OOjWcNn2Bn9kZ5vqsoPDfjDtVS
	Qc/IwnXam2J2sg50vS1IHXMf7kjPpicaaD9qWzItKl4u8wGxD0Npx0kYhHnrFWqAOWS5oGpOr+m
	pScxJ1dwNnc7L3s+lItuWFX5pz6XOzG+NxtvJjbC6n0ObzxlYHJWfL/2UDLXJLLwbsnXAs/OCVD
	ABa4xnmZfnQub/51jCZYCbWLn8KNoxxoH+4ffC/YhX5S67/wZ7CuTtZLWGGJ/UDo9EkUjJBT0lS
	jccI=
X-Received: by 2002:a05:600c:4e4f:b0:488:ab37:b442 with SMTP id
 5b1f17b1804b1-488fb793c6bmr62517345e9.28.1776456598956; Fri, 17 Apr 2026
 13:09:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413124912.3260571-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260413124912.3260571-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <aeFWGYaRownx1jdp@redhat.com>
In-Reply-To: <aeFWGYaRownx1jdp@redhat.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 17 Apr 2026 21:09:31 +0100
X-Gm-Features: AQROBzAEtmMXjO06LBb6YG-tErPT_P69RRflXysSetryNstd7QucEKwDevvjwhk
Message-ID: <CA+V-a8tTeyU82NdM9pgYvx6HH_BLzcoktAm_d1bR=+=VZc_TMw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] clk: divider: Add some kunit test suites
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31372-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-0.996];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 9A86A41E74E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Brian,

Thank you for the review.

On Thu, Apr 16, 2026 at 10:35=E2=80=AFPM Brian Masney <bmasney@redhat.com> =
wrote:
>
> Hi Lad,
>
> On Mon, Apr 13, 2026 at 01:49:12PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add KUnit tests to verify clk_divider_bestdiv() returns the maximum
> > achievable rate when clk_round_rate() is called with ULONG_MAX, which
> > is the canonical way to probe the maximum rate a clock can produce.
> >
> > The first test uses a fixed-rate parent driving a table-based divider
> > with no div=3D1 entry. The second test places a two-input mux between
> > the divider and its root clocks to verify correct parent selection and
> > that the divider loop does not make redundant calls to
> > clk_hw_round_rate() for each remaining table entry after the first
> > overflow.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  drivers/clk/Kconfig            |   7 ++
> >  drivers/clk/Makefile           |   1 +
> >  drivers/clk/clk-divider_test.c | 151 +++++++++++++++++++++++++++++++++
> >  3 files changed, 159 insertions(+)
> >  create mode 100644 drivers/clk/clk-divider_test.c
> >
> > diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> > index cc8743b11bb1..c8f9eaef6f6b 100644
> > --- a/drivers/clk/Kconfig
> > +++ b/drivers/clk/Kconfig
> > @@ -573,4 +573,11 @@ config CLK_FD_KUNIT_TEST
> >       help
> >         Kunit test for the clk-fractional-divider type.
> >
> > +config CLK_DIVIDER_KUNIT_TEST
> > +     tristate "KUnit tests for clk divider bestdiv" if !KUNIT_ALL_TEST=
S
> > +     depends on KUNIT
>
> Since the clk divider calls writel(), you also will need to
> unfortunately add:
>
>     depends on !S390
>
Ok.

> This is already on CLK_GATE_KUNIT_TEST. For the reason why, look at
> commit a6c3da03ead11 ("clk: disable clk gate tests for s390")
>
Thank you for the pointer.

> > +     default KUNIT_ALL_TESTS
> > +     help
> > +       Kunit test for the clk-divider type.
> > +
> >  endif
> > diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> > index a3e2862ebd7e..0c915c6cf3fa 100644
> > --- a/drivers/clk/Makefile
> > +++ b/drivers/clk/Makefile
> > @@ -20,6 +20,7 @@ clk-test-y                  :=3D clk_test.o \
> >                                  kunit_clk_assigned_rates_zero_consumer=
.dtbo.o \
> >                                  kunit_clk_hw_get_dev_of_node.dtbo.o \
> >                                  kunit_clk_parent_data_test.dtbo.o
> > +obj-$(CONFIG_CLK_DIVIDER_KUNIT_TEST) +=3D clk-divider_test.o
> >  obj-$(CONFIG_COMMON_CLK)     +=3D clk-divider.o
>
> Swap the order of these two lines above for consistency with the
> clk-fixed-rate and clk-gate tests where the actual implementation is
> first, and then the test.
>
Ok.

> >  obj-$(CONFIG_COMMON_CLK)     +=3D clk-fixed-factor.o
> >  obj-$(CONFIG_COMMON_CLK)     +=3D clk-fixed-rate.o
> > diff --git a/drivers/clk/clk-divider_test.c b/drivers/clk/clk-divider_t=
est.c
> > new file mode 100644
> > index 000000000000..3a5e3adccb2e
> > --- /dev/null
> > +++ b/drivers/clk/clk-divider_test.c
> > @@ -0,0 +1,151 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * KUnit tests for clk_divider_bestdiv()
> > + */
> > +#include <kunit/test.h>
> > +#include <linux/clk.h>
> > +#include <linux/clk-provider.h>
> > +#include <linux/limits.h>
> > +#include <linux/units.h>
> > +
> > +#define PARENT_RATE_1GHZ     GIGA
> > +#define PARENT_RATE_2GHZ     (2 * GIGA)
> > +#define PARENT_RATE_4GHZ     (4 * GIGA)
> > +
> > +static u32 fake_reg_a, fake_reg_b;
>
> Right now this limits this to one implementation. Put these in a
> structure and use kunit_kzalloc() so that there can be multiple, and the
> runner can execute them in parallel.
>
Ok.

> > +
> > +static const struct clk_div_table no_div1_table[] =3D {
> > +     {0, 2},
> > +     {1, 4},
> > +     {2, 8},
> > +     {0, 0},
> > +};
>
> You can pass NULL for the table to simplify this code further. I don't
> see where you are testing anything special related to the table. I think
> you'll need to pass CLK_DIVIDER_ONE_BASED to the flags when you create
> the divider if you use a NULL table.
>
Agreed.

> > +
> > +static void unregister_fixed_rate(void *hw)
> > +{
> > +     clk_hw_unregister_fixed_rate(hw);
> > +}
> > +
> > +static void unregister_divider(void *hw)
> > +{
> > +     clk_hw_unregister_divider(hw);
> > +}
> > +
> > +static void unregister_mux(void *hw)
> > +{
> > +     clk_hw_unregister_mux(hw);
> > +}
> > +
> > +/*
> > + * Test that clk_round_rate(clk, ULONG_MAX) returns the maximum achiev=
able
> > + * rate for a divider clock.
> > + */
> > +static void clk_divider_bestdiv_ulong_max_returns_max_rate(struct kuni=
t *test)
> > +{
> > +     struct clk_hw *parent_hw, *div_hw;
> > +     unsigned long rate;
> > +
> > +     parent_hw =3D clk_hw_register_fixed_rate(NULL, "bestdiv-parent",
> > +                                            NULL, 0, PARENT_RATE_1GHZ)=
;
> > +     KUNIT_ASSERT_NOT_ERR_OR_NULL(test, parent_hw);
> > +     kunit_add_action(test, unregister_fixed_rate, parent_hw);
>
> You can put clk_hw_unregister_fixed_rate() in the call here, and then
> drop unregister_fixed_rate(). There's some cases of this below as well.
>
> Check the return value of kunit_add_action() here and below as well.
>
Or maybe have something like the following (while keeping the wrappers)?

KUNIT_ASSERT_EQ(test, 0, kunit_add_action_or_reset(test,
unregister_divider, div_hw));


> > +
> > +     fake_reg_a =3D 0;
> > +     div_hw =3D clk_hw_register_divider_table(NULL, "bestdiv-div",
> > +                                            "bestdiv-parent",
> > +                                            CLK_SET_RATE_PARENT,
> > +                                            (void __iomem *)&fake_reg_=
a,
>
> You'll need __force for the cast for sparse as well.
>
Agreed.

> > +                                            0, 2, 0, no_div1_table, NU=
LL);
> > +     KUNIT_ASSERT_NOT_ERR_OR_NULL(test, div_hw);
> > +     kunit_add_action(test, unregister_divider, div_hw);
>
> Same here... you can just put clk_hw_unregister_divider() here and drop
> the function above.
>
> > +
> > +     /*
> > +      * ULONG_MAX is the canonical way to probe the maximum rate a clo=
ck
> > +      * can produce. With a parent at 1 GHz and the smallest table div=
ider
> > +      * being 2, the expected maximum is 500 MHz.
> > +      *
> > +      * Before the fix this returned 125 MHz (PARENT_RATE / 8), the
> > +      * minimum rate, because the search loop was bypassed entirely.
>
> The "Before the fix" comment should go in the commit log. The comment in
> the code should describe how the code is right now.
>
Ok.

> > +      */
> > +     rate =3D clk_hw_round_rate(div_hw, ULONG_MAX);
> > +     KUNIT_EXPECT_EQ(test, rate, PARENT_RATE_1GHZ / 2);
> > +}
> > +
> > +/*
> > + * Test that clk_round_rate(clk, ULONG_MAX) returns the correct maximu=
m rate when
> > + * a mux clock sits between a divider and its parent candidates.
> > + *
> > + * Topology:
> > + *
> > + *   [fixed 4 GHz] --\
> > + *                    +--> [mux CLK_SET_RATE_PARENT] --> [div {2,4,8} =
CLK_SET_RATE_PARENT]
> > + *   [fixed 2 GHz] --/
> > + *
> > + */
> > +static void clk_divider_bestdiv_mux_ulong_max_returns_max_rate(struct =
kunit *test)
> > +{
> > +     static const char *const mux_parents[] =3D {
> > +             "bestdiv-mux-parent-a",
> > +             "bestdiv-mux-parent-b",
> > +     };
> > +     struct clk_hw *parent_a_hw, *parent_b_hw, *mux_hw, *div_hw;
> > +     unsigned long rate;
> > +
> > +     /* Higher-rate parent: the mux should select this for ULONG_MAX. =
*/
> > +     parent_a_hw =3D clk_hw_register_fixed_rate(NULL, "bestdiv-mux-par=
ent-a",
> > +                                              NULL, 0, PARENT_RATE_4GH=
Z);
> > +     KUNIT_ASSERT_NOT_ERR_OR_NULL(test, parent_a_hw);
> > +     kunit_add_action(test, unregister_fixed_rate, parent_a_hw);
> > +
> > +     /* Lower-rate parent: should not be selected. */
> > +     parent_b_hw =3D clk_hw_register_fixed_rate(NULL, "bestdiv-mux-par=
ent-b",
> > +                                              NULL, 0, PARENT_RATE_2GH=
Z);
> > +     KUNIT_ASSERT_NOT_ERR_OR_NULL(test, parent_b_hw);
> > +     kunit_add_action(test, unregister_fixed_rate, parent_b_hw);
> > +
> > +     /*
> > +      * 1-bit mux register selects between the two parents.
> > +      * CLK_SET_RATE_PARENT allows the divider's rate request to
> > +      * propagate into clk_mux_determine_rate().
> > +      */
> > +     fake_reg_a =3D 0;
> > +     mux_hw =3D clk_hw_register_mux(NULL, "bestdiv-mux",
> > +                                  mux_parents, ARRAY_SIZE(mux_parents)=
,
> > +                                  CLK_SET_RATE_PARENT,
> > +                                  (void __iomem *)&fake_reg_a,
> > +                                  0, 1, 0, NULL);
> > +     KUNIT_ASSERT_NOT_ERR_OR_NULL(test, mux_hw);
> > +     kunit_add_action(test, unregister_mux, mux_hw);
>
> You can put clk_hw_unregister_mux() here and drop this function above.
>
> > +
> > +     fake_reg_b =3D 0;
> > +     div_hw =3D clk_hw_register_divider_table(NULL, "bestdiv-mux-div",
> > +                                            "bestdiv-mux",
> > +                                            CLK_SET_RATE_PARENT,
> > +                                            (void __iomem *)&fake_reg_=
b,
> > +                                            0, 2, 0, no_div1_table, NU=
LL);
> > +     KUNIT_ASSERT_NOT_ERR_OR_NULL(test, div_hw);
> > +     kunit_add_action(test, unregister_divider, div_hw);
> > +
> > +     /*
> > +      * Expected maximum: mux selects the 4 GHz parent, divider applie=
s
> > +      * the smallest table entry (2): 4 GHz / 2 =3D 2 GHz.
> > +      */
> > +     rate =3D clk_hw_round_rate(div_hw, ULONG_MAX);
> > +     KUNIT_EXPECT_EQ(test, rate, PARENT_RATE_4GHZ / 2);
> > +}
> > +
> > +static struct kunit_case clk_divider_bestdiv_test_cases[] =3D {
> > +     KUNIT_CASE(clk_divider_bestdiv_ulong_max_returns_max_rate),
> > +     KUNIT_CASE(clk_divider_bestdiv_mux_ulong_max_returns_max_rate),
> > +     {}
> > +};
>
> Usually I'd ask for a few other tests for basic functionality to be
> added rather than just testing the maximum. However there's actually
> some stuff broken with the existing dividers and the clk core where a
> clk can change the rate of it's siblings. I have a series to address
> this at:
>
> https://lore.kernel.org/linux-clk/20260327-clk-scaling-v8-0-86cd0aba3c5f@=
redhat.com/
>
> I think the tests that you have are fine.
>
Thanks for the context, that makes sense.

Cheers,
Prabhakar

>
> Stephen: If you have time after the merge window closes I'd appreciate
> it if you could take time to provide feedback about that series.
>
> Puss in Boots please... :)
> https://media2.giphy.com/media/v1.Y2lkPTc5MGI3NjExaXg5cGFhbGdmbTZjdnRkdWs=
4aXM5d3FlYnFmbTNudWFsZ3Fwc3o5NiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/qUI=
m5wu6LAAog/giphy.gif
>
> Brian
>

