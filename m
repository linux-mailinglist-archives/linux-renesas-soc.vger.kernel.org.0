Return-Path: <linux-renesas-soc+bounces-31340-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eF01NiVW4Wl5rwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31340-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2026 23:35:33 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 83ED1414F89
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2026 23:35:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2D349303076D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2026 21:35:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62775331A7E;
	Thu, 16 Apr 2026 21:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZkLSTvw8";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="LjpGSOO7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0EC326928
	for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Apr 2026 21:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776375330; cv=none; b=XEvmHf1LiA8sprbvETKxoL94tfyUpGjJwtSJt0Ebw26ia4cBs/cwe27Tpd6t48a9xVoHS+5ZZVorTlOGz6sxj6ITmSFD4XB2QvIQIZblN6NzudwhV8yJnWaqIEyKE/W7a528Ph9etqzQpGxN8B/a0ypeFFMCzhK9ixPH2F+PLTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776375330; c=relaxed/simple;
	bh=bQYDWw2yWRrPDsipu0p8v7TVMWjI3sci/lJJ3WtUqI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qkj05rr1mLCy1z/eXghGvkaEXvrma8AvNuJc7v7a8BlsuV8zAkFck6SBJ34V5bFxleqYQfHTXCUfQbNtVOm1mcU+X1E7Z4MAQJMLuBwrVotBEe3H8jJI01zLMvCowZ6j6tHyAhggub52xR8W1rNy0lv+yyZvK2SwKLzKoWCoaTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZkLSTvw8; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=LjpGSOO7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776375327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YRG/q659xesZWxPYzzEVSdkuUOn2ZHM5fkzo4uR4sjQ=;
	b=ZkLSTvw8ppVhgTcfYC3RhPkYFwMF3h5qa5NQ8D8q32Xi0cIHQQMUA3QvHBwVMyG5KH6SFY
	pnOYVt719kPUwC7EcK93cZxRd1V97HmLdmRz4SXFUHugxTsZ4NXy0/5pCbDLYCbh6XcXpd
	ntPjhRlf4TUTRRpWuMEDNVrNNRrUhJA=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-HWi9n-JnOCGOtRsTqsBLhQ-1; Thu, 16 Apr 2026 17:35:26 -0400
X-MC-Unique: HWi9n-JnOCGOtRsTqsBLhQ-1
X-Mimecast-MFC-AGG-ID: HWi9n-JnOCGOtRsTqsBLhQ_1776375326
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8aca172588cso228816d6.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Apr 2026 14:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1776375326; x=1776980126; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YRG/q659xesZWxPYzzEVSdkuUOn2ZHM5fkzo4uR4sjQ=;
        b=LjpGSOO7lKoizq5MRyY8hUfqoLUZgbLwNwTqY+oGo7PKu1FX54r+lDV5lVj0Uw0iNC
         orpUK5wT+Lx9uqKc55qamSGSW9xZNXH+PltsddwvJfC3GWyk7VvD9xiKtXeNMUmXCBlj
         JL8R4S5QghbN1p5sR5zd+noBOvzDs3131UA7SlgYG2HyWaXasAKDNBg2YhCt9/fyktoL
         tm8K5gAEGtWr3sM32D2uApXdTkV2zFiSBVz9DNE3uWz6l+ORomRTI77Vxl6MZsR3cyYB
         cfJ1aLOiZ2azEKn9bkYzk10eM5yRhbAkhCfl/cc++6kJ7snnN+JrtqdBhvPsOFIBTPXk
         NQag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776375326; x=1776980126;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YRG/q659xesZWxPYzzEVSdkuUOn2ZHM5fkzo4uR4sjQ=;
        b=H7KlDv42EYN+iJS49wxh1GaETpAOqyArSwtXshTFBYoxLFsXzZZZJ1uTJCHsR+XP41
         IbKQgDX/vrgF8eDD+ZoxpOyaSjodRxOqXHM1HKAt+vq/eI6Bknzacwpv6YN8eHLFvFh9
         Uqwmo6aem/tnzujUazmhUsor1JxOeqAG7lBMviFBhIry37cO9zFFFm9fFS7IQfj6C4rD
         eWP9xw8GdkNaHL6gAKKnfnSBFkK60HJDElKO1jRNiTsYkZpq5PPkIGx0mtSZs3hR5QOj
         OL8KhNT0uqMRLIXze9cgkQEUG4R5sxGzMQWhwuNlrKmW5oIvvR9m6wvXWdsx2jwjEuZd
         uh+w==
X-Forwarded-Encrypted: i=1; AFNElJ9koLUvkyYIOFP4CywI/NiqjtKsaZeMyIgcema7CAYCsmUbDROYnylO3jY8ejOdgOdBatjPAdd7GgiMFMNDaxTNmw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywcau5m89hfpxkWk/wAAshY369jzVT+QvFGePXgiDjG3T1GrlA5
	vy5cNL7Y2iE38hhrVHYlRFKn1+wPf9TLsyybzu6Pi9YY0C7uiUJwwg2LiijPDM0MgaeNJwoSy9u
	trhujn7smSnRvUom41wekMl447MepdEghV+4v68AIGNcBU3A38bCzgvlKbhRLNZ/KmHQHKmbc
X-Gm-Gg: AeBDietitdMuhRbq5p5iUX3+K5nZxXNzvros5QCLNFrTvbNSX8M6ZzGAesjOoOjzy4P
	mDDHzndQbEX8ELWrT5gVz45JGBcn5w9WgHrERv3ZLPk57POxZh7LIe4GDdDJ5MPCfL2kmwaySKZ
	otHJj21/iWiuS1kRQn6g2LA9x9hLdK3/TUC2ei4d5yRoCD1oiifQfHU/6jX1VfupW5cCkAHBt0f
	WwDQHsquxbo/+FTvGjJ8B9o7p4kenDsMIoj+/EoOy+l2FReNVCXakHs1vupJ7EFuzJIABbRkZyp
	r0dBkItkp3IndvODW1LMK1HEv4mEhkEWwZgda7jhn1xSth5Y4hVDgYWcUZ12k1a9mdDdBChnr3H
	B6wrmcCYvPL0QxolgIJSdpNWAEVyZDWlTHTZOGkvC/cz4ku/J0eUNDTkhO6lipK+lZJY=
X-Received: by 2002:a05:6214:3211:b0:895:498e:e9dd with SMTP id 6a1803df08f44-8b028024c49mr5543636d6.2.1776375326025;
        Thu, 16 Apr 2026 14:35:26 -0700 (PDT)
X-Received: by 2002:a05:6214:3211:b0:895:498e:e9dd with SMTP id 6a1803df08f44-8b028024c49mr5543066d6.2.1776375325583;
        Thu, 16 Apr 2026 14:35:25 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ae6cda5a2bsm45376176d6.33.2026.04.16.14.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 14:35:24 -0700 (PDT)
Date: Thu, 16 Apr 2026 17:35:21 -0400
From: Brian Masney <bmasney@redhat.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 2/2] clk: divider: Add some kunit test suites
Message-ID: <aeFWGYaRownx1jdp@redhat.com>
References: <20260413124912.3260571-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260413124912.3260571-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260413124912.3260571-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
User-Agent: Mutt/2.3.1 (2026-03-20)
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-31340-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[redhat.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[giphy.com:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 83ED1414F89
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Lad,

On Mon, Apr 13, 2026 at 01:49:12PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add KUnit tests to verify clk_divider_bestdiv() returns the maximum
> achievable rate when clk_round_rate() is called with ULONG_MAX, which
> is the canonical way to probe the maximum rate a clock can produce.
> 
> The first test uses a fixed-rate parent driving a table-based divider
> with no div=1 entry. The second test places a two-input mux between
> the divider and its root clocks to verify correct parent selection and
> that the divider loop does not make redundant calls to
> clk_hw_round_rate() for each remaining table entry after the first
> overflow.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/clk/Kconfig            |   7 ++
>  drivers/clk/Makefile           |   1 +
>  drivers/clk/clk-divider_test.c | 151 +++++++++++++++++++++++++++++++++
>  3 files changed, 159 insertions(+)
>  create mode 100644 drivers/clk/clk-divider_test.c
> 
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index cc8743b11bb1..c8f9eaef6f6b 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -573,4 +573,11 @@ config CLK_FD_KUNIT_TEST
>  	help
>  	  Kunit test for the clk-fractional-divider type.
>  
> +config CLK_DIVIDER_KUNIT_TEST
> +	tristate "KUnit tests for clk divider bestdiv" if !KUNIT_ALL_TESTS
> +	depends on KUNIT

Since the clk divider calls writel(), you also will need to
unfortunately add:

    depends on !S390

This is already on CLK_GATE_KUNIT_TEST. For the reason why, look at
commit a6c3da03ead11 ("clk: disable clk gate tests for s390")

> +	default KUNIT_ALL_TESTS
> +	help
> +	  Kunit test for the clk-divider type.
> +
>  endif
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index a3e2862ebd7e..0c915c6cf3fa 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -20,6 +20,7 @@ clk-test-y			:= clk_test.o \
>  				   kunit_clk_assigned_rates_zero_consumer.dtbo.o \
>  				   kunit_clk_hw_get_dev_of_node.dtbo.o \
>  				   kunit_clk_parent_data_test.dtbo.o
> +obj-$(CONFIG_CLK_DIVIDER_KUNIT_TEST) += clk-divider_test.o
>  obj-$(CONFIG_COMMON_CLK)	+= clk-divider.o

Swap the order of these two lines above for consistency with the
clk-fixed-rate and clk-gate tests where the actual implementation is
first, and then the test.

>  obj-$(CONFIG_COMMON_CLK)	+= clk-fixed-factor.o
>  obj-$(CONFIG_COMMON_CLK)	+= clk-fixed-rate.o
> diff --git a/drivers/clk/clk-divider_test.c b/drivers/clk/clk-divider_test.c
> new file mode 100644
> index 000000000000..3a5e3adccb2e
> --- /dev/null
> +++ b/drivers/clk/clk-divider_test.c
> @@ -0,0 +1,151 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * KUnit tests for clk_divider_bestdiv()
> + */
> +#include <kunit/test.h>
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/limits.h>
> +#include <linux/units.h>
> +
> +#define PARENT_RATE_1GHZ	GIGA
> +#define PARENT_RATE_2GHZ	(2 * GIGA)
> +#define PARENT_RATE_4GHZ	(4 * GIGA)
> +
> +static u32 fake_reg_a, fake_reg_b;

Right now this limits this to one implementation. Put these in a
structure and use kunit_kzalloc() so that there can be multiple, and the
runner can execute them in parallel.

> +
> +static const struct clk_div_table no_div1_table[] = {
> +	{0, 2},
> +	{1, 4},
> +	{2, 8},
> +	{0, 0},
> +};

You can pass NULL for the table to simplify this code further. I don't
see where you are testing anything special related to the table. I think
you'll need to pass CLK_DIVIDER_ONE_BASED to the flags when you create
the divider if you use a NULL table.

> +
> +static void unregister_fixed_rate(void *hw)
> +{
> +	clk_hw_unregister_fixed_rate(hw);
> +}
> +
> +static void unregister_divider(void *hw)
> +{
> +	clk_hw_unregister_divider(hw);
> +}
> +
> +static void unregister_mux(void *hw)
> +{
> +	clk_hw_unregister_mux(hw);
> +}
> +
> +/*
> + * Test that clk_round_rate(clk, ULONG_MAX) returns the maximum achievable
> + * rate for a divider clock.
> + */
> +static void clk_divider_bestdiv_ulong_max_returns_max_rate(struct kunit *test)
> +{
> +	struct clk_hw *parent_hw, *div_hw;
> +	unsigned long rate;
> +
> +	parent_hw = clk_hw_register_fixed_rate(NULL, "bestdiv-parent",
> +					       NULL, 0, PARENT_RATE_1GHZ);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, parent_hw);
> +	kunit_add_action(test, unregister_fixed_rate, parent_hw);

You can put clk_hw_unregister_fixed_rate() in the call here, and then
drop unregister_fixed_rate(). There's some cases of this below as well.

Check the return value of kunit_add_action() here and below as well.

> +
> +	fake_reg_a = 0;
> +	div_hw = clk_hw_register_divider_table(NULL, "bestdiv-div",
> +					       "bestdiv-parent",
> +					       CLK_SET_RATE_PARENT,
> +					       (void __iomem *)&fake_reg_a,

You'll need __force for the cast for sparse as well.

> +					       0, 2, 0, no_div1_table, NULL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, div_hw);
> +	kunit_add_action(test, unregister_divider, div_hw);

Same here... you can just put clk_hw_unregister_divider() here and drop
the function above.

> +
> +	/*
> +	 * ULONG_MAX is the canonical way to probe the maximum rate a clock
> +	 * can produce. With a parent at 1 GHz and the smallest table divider
> +	 * being 2, the expected maximum is 500 MHz.
> +	 *
> +	 * Before the fix this returned 125 MHz (PARENT_RATE / 8), the
> +	 * minimum rate, because the search loop was bypassed entirely.

The "Before the fix" comment should go in the commit log. The comment in
the code should describe how the code is right now.

> +	 */
> +	rate = clk_hw_round_rate(div_hw, ULONG_MAX);
> +	KUNIT_EXPECT_EQ(test, rate, PARENT_RATE_1GHZ / 2);
> +}
> +
> +/*
> + * Test that clk_round_rate(clk, ULONG_MAX) returns the correct maximum rate when
> + * a mux clock sits between a divider and its parent candidates.
> + *
> + * Topology:
> + *
> + *   [fixed 4 GHz] --\
> + *                    +--> [mux CLK_SET_RATE_PARENT] --> [div {2,4,8} CLK_SET_RATE_PARENT]
> + *   [fixed 2 GHz] --/
> + *
> + */
> +static void clk_divider_bestdiv_mux_ulong_max_returns_max_rate(struct kunit *test)
> +{
> +	static const char *const mux_parents[] = {
> +		"bestdiv-mux-parent-a",
> +		"bestdiv-mux-parent-b",
> +	};
> +	struct clk_hw *parent_a_hw, *parent_b_hw, *mux_hw, *div_hw;
> +	unsigned long rate;
> +
> +	/* Higher-rate parent: the mux should select this for ULONG_MAX. */
> +	parent_a_hw = clk_hw_register_fixed_rate(NULL, "bestdiv-mux-parent-a",
> +						 NULL, 0, PARENT_RATE_4GHZ);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, parent_a_hw);
> +	kunit_add_action(test, unregister_fixed_rate, parent_a_hw);
> +
> +	/* Lower-rate parent: should not be selected. */
> +	parent_b_hw = clk_hw_register_fixed_rate(NULL, "bestdiv-mux-parent-b",
> +						 NULL, 0, PARENT_RATE_2GHZ);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, parent_b_hw);
> +	kunit_add_action(test, unregister_fixed_rate, parent_b_hw);
> +
> +	/*
> +	 * 1-bit mux register selects between the two parents.
> +	 * CLK_SET_RATE_PARENT allows the divider's rate request to
> +	 * propagate into clk_mux_determine_rate().
> +	 */
> +	fake_reg_a = 0;
> +	mux_hw = clk_hw_register_mux(NULL, "bestdiv-mux",
> +				     mux_parents, ARRAY_SIZE(mux_parents),
> +				     CLK_SET_RATE_PARENT,
> +				     (void __iomem *)&fake_reg_a,
> +				     0, 1, 0, NULL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, mux_hw);
> +	kunit_add_action(test, unregister_mux, mux_hw);

You can put clk_hw_unregister_mux() here and drop this function above.

> +
> +	fake_reg_b = 0;
> +	div_hw = clk_hw_register_divider_table(NULL, "bestdiv-mux-div",
> +					       "bestdiv-mux",
> +					       CLK_SET_RATE_PARENT,
> +					       (void __iomem *)&fake_reg_b,
> +					       0, 2, 0, no_div1_table, NULL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, div_hw);
> +	kunit_add_action(test, unregister_divider, div_hw);
> +
> +	/*
> +	 * Expected maximum: mux selects the 4 GHz parent, divider applies
> +	 * the smallest table entry (2): 4 GHz / 2 = 2 GHz.
> +	 */
> +	rate = clk_hw_round_rate(div_hw, ULONG_MAX);
> +	KUNIT_EXPECT_EQ(test, rate, PARENT_RATE_4GHZ / 2);
> +}
> +
> +static struct kunit_case clk_divider_bestdiv_test_cases[] = {
> +	KUNIT_CASE(clk_divider_bestdiv_ulong_max_returns_max_rate),
> +	KUNIT_CASE(clk_divider_bestdiv_mux_ulong_max_returns_max_rate),
> +	{}
> +};

Usually I'd ask for a few other tests for basic functionality to be
added rather than just testing the maximum. However there's actually
some stuff broken with the existing dividers and the clk core where a
clk can change the rate of it's siblings. I have a series to address
this at:

https://lore.kernel.org/linux-clk/20260327-clk-scaling-v8-0-86cd0aba3c5f@redhat.com/

I think the tests that you have are fine.

Stephen: If you have time after the merge window closes I'd appreciate
it if you could take time to provide feedback about that series.

Puss in Boots please... :)
https://media2.giphy.com/media/v1.Y2lkPTc5MGI3NjExaXg5cGFhbGdmbTZjdnRkdWs4aXM5d3FlYnFmbTNudWFsZ3Fwc3o5NiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/qUIm5wu6LAAog/giphy.gif

Brian


