Return-Path: <linux-renesas-soc+bounces-30677-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EMNXAv7fzGm0XAYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30677-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Apr 2026 11:06:06 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 079593773F1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Apr 2026 11:06:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A878F303F785
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Apr 2026 08:59:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E14C93C8721;
	Wed,  1 Apr 2026 08:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="FCc2mioU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D313AC0EC;
	Wed,  1 Apr 2026 08:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775033978; cv=none; b=eGrEL48y6EYR2x4PkhSaXaEMty6nTt+IwzsPv/ibaSeoUap5aSrqQm9tmXP6MusDi0thLdIqEjjZ/FcEsir2a49z4ozqIiW6cyFzK7VYjAzZxBpsP2ox4eGbmU976DIbsZiIHr68W7/0KoN2ClPoEm7aXJckZsQf3GwYdQhRnEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775033978; c=relaxed/simple;
	bh=VbFdMq7YtqJd7UMOCDrFbjpr28i5Wpb/2QUpdDPoTAw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ueVzXEfzU9UznauF1JXaYH/ABtY7LJs+unRJ5czvZT2QvGAqRyTxX2QH6298ib7/w7dgRBg/VJj8b0kjV9B0i2VWyLSUGKWAoQlonpAplG+feuT8IXELkY6UJIxtfklU/sH+YGFTe5DOOGJMeTHRKuBpBXUD4+JeLFEf0xBgrSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=FCc2mioU; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id CB22D1A30F8;
	Wed,  1 Apr 2026 08:59:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9F62E602BF;
	Wed,  1 Apr 2026 08:59:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C9559104509A9;
	Wed,  1 Apr 2026 10:59:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775033965; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9o8MaFCKhNvDQQOGJOIQriskUC+pXVGT8BSTas/AoKM=;
	b=FCc2mioUSJNqSy8zEA6YSaAVOkW85hhYpfbVo5k/rVve7f6y/M1WdrXIuZqcQoHMbvwfPC
	XM5oVuMFeheFhDZTM7u+4Qas8aKQHS0BcJKz4rfadGZwSQYwZUTHdXkZzhB2uxtlXGOLlG
	YkYWrxR4ii4CmLhJQOidmxnLpjkqr7jVPHHF+DZHsFUOetkgKfwFZbQm9MQdXp4oG5vj9Y
	JmC8lh4CpKwRAfCMySeA7wFm6GaP3CZBPeRY8hhebPV/TexDYquDCaPk5xy8IKGWFTuBPL
	JHOJG+xdY4gtnFjxEzEvQgjKi6SqWX512JRtzOoQHJs2RXamGr0RZg37ZT3bOg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Thomas
 Gleixner <tglx@kernel.org>,  Olivia Mackall <olivia@selenic.com>,  Herbert
 Xu <herbert@gondor.apana.org.au>,  Jayesh Choudhary <j-choudhary@ti.com>,
  "David S. Miller" <davem@davemloft.net>,  Christian Marangi
 <ansuelsmth@gmail.com>,  Antoine Tenart <atenart@kernel.org>,  Geert
 Uytterhoeven <geert+renesas@glider.be>,  Magnus Damm
 <magnus.damm@gmail.com>,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
  Pascal EBERHARD <pascal.eberhard@se.com>,  Wolfram Sang
 <wsa+renesas@sang-engineering.com>,  linux-clk@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-crypto@vger.kernel.org,  linux-renesas-soc@vger.kernel.org,
  Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH 06/16] clk: tests: Add clk_parse_clkspec() Kunit testing
In-Reply-To: <acqNRVLrPxABvecZ@redhat.com> (Brian Masney's message of "Mon, 30
	Mar 2026 10:48:37 -0400")
References: <20260327-schneider-v7-0-rc1-crypto-v1-0-5e6ff7853994@bootlin.com>
	<20260327-schneider-v7-0-rc1-crypto-v1-6-5e6ff7853994@bootlin.com>
	<acqNRVLrPxABvecZ@redhat.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 01 Apr 2026 10:59:20 +0200
Message-ID: <87mrzn6opj.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30677-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,selenic.com,gondor.apana.org.au,ti.com,davemloft.net,gmail.com,glider.be,bootlin.com,se.com,sang-engineering.com,vger.kernel.org,chromium.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miquel.raynal@bootlin.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	NEURAL_HAM(-0.00)[-0.915];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,bootlin.com:dkim,bootlin.com:mid]
X-Rspamd-Queue-Id: 079593773F1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Brian,

>> @@ -5312,6 +5312,7 @@ struct clk_hw *of_clk_get_hw(struct device_node *n=
p, int index,
>>=20=20
>>  	return hw;
>>  }
>> +EXPORT_SYMBOL_GPL(of_clk_get_hw);
>
> So that we don't unnecessarily broaden the API that's available to the
> clk providers, you can use EXPORT_SYMBOL_IF_KUNIT so that this is only
> available to the kunit tests.

Ah, good idea.

> Note that Chen-Yu posted a separate patch to add the includes for a
> separate test. The two patches will conflict since Stephen hasn't picked
> this up yet.
>
> https://lore.kernel.org/linux-clk/20260225083413.3384950-1-wenst@chromium=
.org/

Thanks for the warning, I will synchronize with Chen-Yu.

>>  static struct clk *__of_clk_get(struct device_node *np,
>>  				int index, const char *dev_id,
>> diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
>> index a268d7b5d4cb..b814b45f1f7e 100644
>> --- a/drivers/clk/clk_test.c
>> +++ b/drivers/clk/clk_test.c
>> @@ -3541,10 +3541,134 @@ static struct kunit_suite clk_hw_get_dev_of_nod=
e_test_suite =3D {
>>  	.test_cases =3D clk_hw_get_dev_of_node_test_cases,
>>  };
>>=20=20
>> +static const struct clk_init_data clk_parse_clkspec_1_init_data =3D {
>> +	.name =3D "clk_parse_clkspec_1",
>> +	.ops =3D &empty_clk_ops,
>> +};
>> +
>> +static const struct clk_init_data clk_parse_clkspec_2_init_data =3D {
>> +	.name =3D "clk_parse_clkspec_2",
>> +	.ops =3D &empty_clk_ops,
>> +};
>> +
>> +static struct clk_hw *kunit_clk_get(struct of_phandle_args *clkspec, vo=
id *data)
>> +{
>> +	return (struct clk_hw *)data;
>> +}
>> +
>> +struct clk_parse_clkspec_ctx {
>> +	struct device_node *prov1_np;
>> +	struct device_node *prov2_np;
>> +	struct device_node *cons_np;
>> +};
>> +
>> +static int clk_parse_clkspec_init(struct kunit *test)
>> +{
>> +	struct clk_parse_clkspec_ctx *ctx;
>> +	struct clk_hw *hw1, *hw2;
>> +
>> +	ctx =3D kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
>> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
>> +	test->priv =3D ctx;
>> +
>> +	KUNIT_ASSERT_EQ(test, 0, of_overlay_apply_kunit(test, kunit_clk_parse_=
clkspec));
>> +
>> +	/* Register provider 1 */
>> +	hw1 =3D kunit_kzalloc(test, sizeof(*hw1), GFP_KERNEL);
>> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, hw1);
>> +	hw1->init =3D &clk_parse_clkspec_1_init_data;
>> +
>> +	ctx->prov1_np =3D of_find_compatible_node(NULL, NULL, "test,clock-prov=
ider1");
>> +	KUNIT_ASSERT_NOT_NULL(test, ctx->prov1_np);
>> +
>> +	KUNIT_ASSERT_EQ(test, 0, of_clk_hw_register_kunit(test, ctx->prov1_np,=
 hw1));
>> +	of_clk_add_hw_provider(ctx->prov1_np, kunit_clk_get, hw1);
>
> Can you just use of_clk_hw_simple_get() and drop kunit_clk_get()
> above?

I will try.

>> +	of_node_put(ctx->prov1_np);
>> +
>> +	/* Register provider 2 */
>> +	hw2 =3D kunit_kzalloc(test, sizeof(*hw2), GFP_KERNEL);
>> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, hw2);
>> +	hw2->init =3D &clk_parse_clkspec_2_init_data;
>> +
>> +	ctx->prov2_np =3D of_find_compatible_node(NULL, NULL, "test,clock-prov=
ider2");
>> +	KUNIT_ASSERT_NOT_NULL(test, ctx->prov2_np);
>> +
>> +	KUNIT_ASSERT_EQ(test, 0, of_clk_hw_register_kunit(test, ctx->prov2_np,=
 hw2));
>> +	of_clk_add_hw_provider(ctx->prov2_np, kunit_clk_get, hw2);
>> +	of_node_put(ctx->prov2_np);
>> +
>> +	ctx->cons_np =3D of_find_compatible_node(NULL, NULL, "test,clock-consu=
mer");
>> +	KUNIT_ASSERT_NOT_NULL(test, ctx->cons_np);
>> +
>> +	return 0;
>> +}
>> +
>> +static void clk_parse_clkspec_exit(struct kunit *test)
>> +{
>> +	struct clk_parse_clkspec_ctx *ctx =3D test->priv;
>> +
>> +	of_node_put(ctx->prov1_np);
>> +	of_node_put(ctx->prov2_np);
>
> Is there a double free of prov1_np and prov2_np? If this is dropped from
> the test exit, then they should't need to be in the ctx struct.

These two calls increment the refcount on the node:
- of_find_compatible_node()
- of_clk_add_hw_provider()

However this makes me realize maybe I should call of_clk_del_provider()
in the exit() function. In any case, I believe keeping a reference over
the nodes during the test is correct and if there is an of_node_put()
call to remove, it should be the on in the _init().

Thanks for pointing this out!
Miqu=C3=A8l

