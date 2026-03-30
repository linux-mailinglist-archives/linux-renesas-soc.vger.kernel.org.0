Return-Path: <linux-renesas-soc+bounces-30598-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDlQLCWTymnF+AUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30598-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 17:13:41 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1143A35D967
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 17:13:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7A80C3157594
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 14:48:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B33F324B23;
	Mon, 30 Mar 2026 14:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BrEPOcJi";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="K8q6oQhJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9154F3242D5
	for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Mar 2026 14:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774882124; cv=none; b=NEYE/GmAZWuKamrRSzKI1iixrxXld0C5SB9zXCZKGEzB0E2jxeRQpIQFwTTM3YD2bL/dem2r4TtZsHYjcy9XzQkhdTMH0vpaYtNXPKXB+pfCZSG6gC4cSaxCzsJzWxgReiL4se3woRF9GQbs395ISQyw1wTEKIVacw12+E9/UsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774882124; c=relaxed/simple;
	bh=qRDMpKJX27w2zrmAyfZnBYRp0iKrPs7epsHO9Ew4my8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZDJYzRwSG67JIiNkGpjMnTvqis5Pkx7aO6PWGpBCLu4X50GKFp6XTvOpHmcE+NRlRX5MR6+MSTHUuxOSBLu0vnvp7cNdP/4ZbeTyV5shfI0/IZrHt0B+sOmTUVynHBLby1Z8WLksRUmSNgIi6RMPhvuTkPY7touxspbZ6pHI++E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BrEPOcJi; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=K8q6oQhJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774882122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZPJMgxubQOT61Bt8c1TkmO+q4Ej7bdY+pNKwDemJ1Jo=;
	b=BrEPOcJiBgKyawOW84vRe/2aaKHprKqX3AeT8xQvqyUdq26gDqzfFaE53ePL46sNJOnQ8k
	Yf5vLuPFGKS5Fn2EfGsEjROl8Dl0gMNT7TD4D3QAgNQbIvWaoNEkawF9DRABFOGCgVkSpT
	Rba2pLhQShN+d+br+Au/UrTmEDY1ObY=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-416-ZFBHyjVLNbq7yZXlck8xMA-1; Mon, 30 Mar 2026 10:48:41 -0400
X-MC-Unique: ZFBHyjVLNbq7yZXlck8xMA-1
X-Mimecast-MFC-AGG-ID: ZFBHyjVLNbq7yZXlck8xMA_1774882120
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5093025ffecso144875611cf.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Mar 2026 07:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774882120; x=1775486920; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZPJMgxubQOT61Bt8c1TkmO+q4Ej7bdY+pNKwDemJ1Jo=;
        b=K8q6oQhJEx3pnwO+3jLG8oJBEAddLRbv0kk5jno3mj2g50QrUs8oKawg8K8da2ZIwd
         r4FGXvNMTUtzI9qHaKsVrKsdVWtsD+aLqLhfwYxYl2kCKb4Bo6lUWbSZZJMHu2xlpL3k
         UIfg6GSawlT1jqE6TNlL/UHG1VOTBy1eeTbVwKrX9xjDjzDXLb56gtWQSQGo0WrVm4pU
         FG3yLZZ+JLOp6K+w2tfrKqpfnmsIyYN/6jM/Getsw7KqmzGl+ve5otXG3t7twa9P7Z1T
         b/DUjJ0vHwffMFZKlBwbe/721THxHotSdu6rpCmZty8sdZhcoy0NpHVGAWYWnoMgbMte
         RScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774882120; x=1775486920;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZPJMgxubQOT61Bt8c1TkmO+q4Ej7bdY+pNKwDemJ1Jo=;
        b=npZKoDGx8xLcUVYZuEChB/KxTDH/vznTHe8vek3tLOyxkSqNWosGJHU2kM2/+bClHl
         oK1snAMIcydCT/CbixgdFPCsT8nMPNUQq08NSNbRDyJZfBROuCTFD2i75abOMmLOjzoB
         MGum/xaau++Q4S+J1o5RRVFg+61EEEBxcyjUr8ALeWARyFQg3RVJs2bPVh6CcHac3Ji1
         UcWegxECi5Py4EzVPAg7uLKYCFe4wjGND1jEe6t8joeu1yGBeA8r+oHrUwjgxZJ/RnMe
         6ruerAwsdclkSgfIq15Ac5Vmqu5ZsUYIpAjGdbbIfD2K/DCHjs2zmMkIjvZ3zmQCx8js
         aTaw==
X-Forwarded-Encrypted: i=1; AJvYcCWs3RnpwmUD6gqzOLHQF6wf5vdSYCGa+cWQa83WOlGA7dwl6OrtYE2QIJZaGeSM+YjM1UNG5jMGkDKvh3Jz9wU6JA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzfw/baLF6P0JVn068IslO3zBNkWpvVF0ZTzYKHQvnrrYqNAsb+
	7SlZ3HHbKSfXoY5wqZhIYL4+i6Yu3ETF3rsVdpjRI1TDLWEPsOnL8yq03BulwgATxKzBH8gMKNn
	aWTQ0ZlfsEwV5ajL5ufKqzdkw0fivHCV9pgcR+m/lf+q0mhaLGA/U+Psl769O6+brByczKmxp
X-Gm-Gg: ATEYQzw9RFI7IXBXUseP9n4jywNGqSApGsH+9/K9v3m0les0DI8IO+89ypGbMDgaUnJ
	eE61VfC3Tz8nncIYhal7T5mmtIRu2zx3adgb0HIGA3UNufVjnvfNBfCFTd576Er1BSAA2VNNoyt
	UYJtzQfoNFu+70qKqSgYpfRT4KRYkglhNq178MbVh0Gj6c9UfeRccIDehZW0mrrjuBc5aXOy0pe
	V/4KZz1L+AzbUpp6Yuyx6oYKtUfGiIQ6OeAjXiBIreLA9sFhLEU8rIxIsKg0ISBSUOUafmxUn4K
	b01ZLZOfyAF7IxQEUe4hF+CsmlmUXrWoNSqA87ieOG9ej9t1ktbZmF7/NE1I8Ux3eCxUS0V4Zaz
	81MgiZKawbfvG5IkNtTaYD6pfeHMM9aZm0IZd/1EMLLChtwuWqB6dst/q
X-Received: by 2002:ac8:5710:0:b0:509:23c5:3291 with SMTP id d75a77b69052e-50ba39bae24mr162437941cf.65.1774882120184;
        Mon, 30 Mar 2026 07:48:40 -0700 (PDT)
X-Received: by 2002:ac8:5710:0:b0:509:23c5:3291 with SMTP id d75a77b69052e-50ba39bae24mr162437351cf.65.1774882119419;
        Mon, 30 Mar 2026 07:48:39 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50bb2dd8b81sm66397621cf.16.2026.03.30.07.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 07:48:38 -0700 (PDT)
Date: Mon, 30 Mar 2026 10:48:37 -0400
From: Brian Masney <bmasney@redhat.com>
To: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Jayesh Choudhary <j-choudhary@ti.com>,
	"David S. Miller" <davem@davemloft.net>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Antoine Tenart <atenart@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Pascal EBERHARD <pascal.eberhard@se.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH 06/16] clk: tests: Add clk_parse_clkspec() Kunit testing
Message-ID: <acqNRVLrPxABvecZ@redhat.com>
References: <20260327-schneider-v7-0-rc1-crypto-v1-0-5e6ff7853994@bootlin.com>
 <20260327-schneider-v7-0-rc1-crypto-v1-6-5e6ff7853994@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327-schneider-v7-0-rc1-crypto-v1-6-5e6ff7853994@bootlin.com>
User-Agent: Mutt/2.3.0 (2026-01-25)
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,selenic.com,gondor.apana.org.au,ti.com,davemloft.net,gmail.com,glider.be,bootlin.com,se.com,sang-engineering.com,vger.kernel.org,chromium.org];
	TAGGED_FROM(0.00)[bounces-30598-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1143A35D967
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Miquel,

On Fri, Mar 27, 2026 at 09:09:28PM +0100, Miquel Raynal (Schneider Electric) wrote:
> Create a new set of kunit tests to make sure clk_parse_clkspec() is
> working as expected. We currently verify if we get a proper device when
> using indexes and names. If we make an out of bounds request we expect
> an error.
> 
> For testing purposes, we must ensure of_clk_get_hw()'s symbol is
> exported.
> 
> Suggested-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>
> ---
>  drivers/clk/Makefile                     |   1 +
>  drivers/clk/clk.c                        |   1 +
>  drivers/clk/clk_test.c                   | 124 +++++++++++++++++++++++++++++++
>  drivers/clk/kunit_clk_parse_clkspec.dtso |  21 ++++++
>  4 files changed, 147 insertions(+)
> 
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index f7bce3951a30..97b621456bf5 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -19,6 +19,7 @@ clk-test-y			:= clk_test.o \
>  				   kunit_clk_assigned_rates_zero.dtbo.o \
>  				   kunit_clk_assigned_rates_zero_consumer.dtbo.o \
>  				   kunit_clk_hw_get_dev_of_node.dtbo.o \
> +				   kunit_clk_parse_clkspec.dtbo.o \
>  				   kunit_clk_parent_data_test.dtbo.o
>  obj-$(CONFIG_COMMON_CLK)	+= clk-divider.o
>  obj-$(CONFIG_COMMON_CLK)	+= clk-fixed-factor.o
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 47093cda9df3..1795246b10a0 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -5312,6 +5312,7 @@ struct clk_hw *of_clk_get_hw(struct device_node *np, int index,
>  
>  	return hw;
>  }
> +EXPORT_SYMBOL_GPL(of_clk_get_hw);

So that we don't unnecessarily broaden the API that's available to the
clk providers, you can use EXPORT_SYMBOL_IF_KUNIT so that this is only
available to the kunit tests.

Note that Chen-Yu posted a separate patch to add the includes for a
separate test. The two patches will conflict since Stephen hasn't picked
this up yet.

https://lore.kernel.org/linux-clk/20260225083413.3384950-1-wenst@chromium.org/

>  
>  static struct clk *__of_clk_get(struct device_node *np,
>  				int index, const char *dev_id,
> diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
> index a268d7b5d4cb..b814b45f1f7e 100644
> --- a/drivers/clk/clk_test.c
> +++ b/drivers/clk/clk_test.c
> @@ -3541,10 +3541,134 @@ static struct kunit_suite clk_hw_get_dev_of_node_test_suite = {
>  	.test_cases = clk_hw_get_dev_of_node_test_cases,
>  };
>  
> +static const struct clk_init_data clk_parse_clkspec_1_init_data = {
> +	.name = "clk_parse_clkspec_1",
> +	.ops = &empty_clk_ops,
> +};
> +
> +static const struct clk_init_data clk_parse_clkspec_2_init_data = {
> +	.name = "clk_parse_clkspec_2",
> +	.ops = &empty_clk_ops,
> +};
> +
> +static struct clk_hw *kunit_clk_get(struct of_phandle_args *clkspec, void *data)
> +{
> +	return (struct clk_hw *)data;
> +}
> +
> +struct clk_parse_clkspec_ctx {
> +	struct device_node *prov1_np;
> +	struct device_node *prov2_np;
> +	struct device_node *cons_np;
> +};
> +
> +static int clk_parse_clkspec_init(struct kunit *test)
> +{
> +	struct clk_parse_clkspec_ctx *ctx;
> +	struct clk_hw *hw1, *hw2;
> +
> +	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> +	test->priv = ctx;
> +
> +	KUNIT_ASSERT_EQ(test, 0, of_overlay_apply_kunit(test, kunit_clk_parse_clkspec));
> +
> +	/* Register provider 1 */
> +	hw1 = kunit_kzalloc(test, sizeof(*hw1), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, hw1);
> +	hw1->init = &clk_parse_clkspec_1_init_data;
> +
> +	ctx->prov1_np = of_find_compatible_node(NULL, NULL, "test,clock-provider1");
> +	KUNIT_ASSERT_NOT_NULL(test, ctx->prov1_np);
> +
> +	KUNIT_ASSERT_EQ(test, 0, of_clk_hw_register_kunit(test, ctx->prov1_np, hw1));
> +	of_clk_add_hw_provider(ctx->prov1_np, kunit_clk_get, hw1);

Can you just use of_clk_hw_simple_get() and drop kunit_clk_get() above?

> +	of_node_put(ctx->prov1_np);
> +
> +	/* Register provider 2 */
> +	hw2 = kunit_kzalloc(test, sizeof(*hw2), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, hw2);
> +	hw2->init = &clk_parse_clkspec_2_init_data;
> +
> +	ctx->prov2_np = of_find_compatible_node(NULL, NULL, "test,clock-provider2");
> +	KUNIT_ASSERT_NOT_NULL(test, ctx->prov2_np);
> +
> +	KUNIT_ASSERT_EQ(test, 0, of_clk_hw_register_kunit(test, ctx->prov2_np, hw2));
> +	of_clk_add_hw_provider(ctx->prov2_np, kunit_clk_get, hw2);
> +	of_node_put(ctx->prov2_np);
> +
> +	ctx->cons_np = of_find_compatible_node(NULL, NULL, "test,clock-consumer");
> +	KUNIT_ASSERT_NOT_NULL(test, ctx->cons_np);
> +
> +	return 0;
> +}
> +
> +static void clk_parse_clkspec_exit(struct kunit *test)
> +{
> +	struct clk_parse_clkspec_ctx *ctx = test->priv;
> +
> +	of_node_put(ctx->prov1_np);
> +	of_node_put(ctx->prov2_np);

Is there a double free of prov1_np and prov2_np? If this is dropped from
the test exit, then they should't need to be in the ctx struct.

Brian


