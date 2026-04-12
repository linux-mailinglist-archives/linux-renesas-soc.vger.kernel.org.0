Return-Path: <linux-renesas-soc+bounces-31203-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yABPEE742mnH7ggAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31203-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 Apr 2026 03:41:34 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B35E33E264F
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 Apr 2026 03:41:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1120230205EB
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 Apr 2026 01:40:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7DF02C0F69;
	Sun, 12 Apr 2026 01:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QyzQDsmV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A631F1991D4;
	Sun, 12 Apr 2026 01:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775958031; cv=none; b=G2KsE71819LDmUsBXl2854gd1dBQ+hl4XoVLBilVpJ52C7MG3I/emmbUJOaE8L/yK2hgFDRV+DqS1bfrXauqTZua0losaP+ULZMqZYRJvDk8rVU4To1UOhsB2+6ZXmUwhJ+UWPDXObK1cfDv4KxpTKe8k3D9B2AI/nYrJ1biozc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775958031; c=relaxed/simple;
	bh=AC+RCvTCz+c2GqRZQE9ZugW202FLIvM+I/gCOZewGlI=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=OCYXO0JcUByZa1H1lO7AK/F5XUh9KwqH/8W3xRP6yTqdgTdHQOLWv0+MfGJ86gXvmHSQh4IvD8fIOcZNxd3JUP1QBs+W7UrNo3BMM7Qf7gNZ+cZG6UgjnPpsz46yzxjaldIOf18aDDdKFrm3gGuxw+8RTGB3QffmWZHIU+EVqMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QyzQDsmV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E63FC116C6;
	Sun, 12 Apr 2026 01:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775958031;
	bh=AC+RCvTCz+c2GqRZQE9ZugW202FLIvM+I/gCOZewGlI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=QyzQDsmVSomjO66kxUr9f+H4Zn0fdljrgQ4L+8TtDS6B4z9UXAb73YTVBBqf35UcE
	 mgVoP7gittjDHMYM9NEu58yIRFz65u2iY2FB4GfqBzjwpa8pNumvQ2fjffU+eLwDeh
	 FGZ0Hpw38ZmoBB/dyZCmAhZorf1hiCi59gXbRLemgIJ96rtZU3O2CNeK+YyzwM5Wbh
	 g6szmtKIuyrHfd4FRMlveqvHJY/KXH9LnWC+DD/EGmAvsMsWc6c/49dixAonnbMJWC
	 UJmzKSS3Kt31XE60gnLEzGsaArZ/2AwoPGIBJv9/53h6eB+frAQ8JotTrVPS2ttfFN
	 q1Tuz0nOvfJoA==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260327-schneider-v7-0-rc1-crypto-v1-11-5e6ff7853994@bootlin.com>
References: <20260327-schneider-v7-0-rc1-crypto-v1-0-5e6ff7853994@bootlin.com> <20260327-schneider-v7-0-rc1-crypto-v1-11-5e6ff7853994@bootlin.com>
Subject: Re: [PATCH 11/16] clk: tests: Add Kunit testing for nexus nodes
From: Stephen Boyd <sboyd@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Pascal EBERHARD <pascal.eberhard@se.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, linux-renesas-soc@vger.kernel.org, "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
To: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>, Antoine Tenart <atenart@kernel.org>, Christian Marangi <ansuelsmth@gmail.com>, Conor Dooley <conor+dt@kernel.org>, David S. Miller <davem@davemloft.net>, Geert Uytterhoeven <geert+renesas@glider.be>, Herbert Xu <herbert@gondor.apana.org.au>, Jayesh Choudhary <j-choudhary@ti.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Olivia Mackall <olivia@selenic.com>, Rob Herring <robh@kernel.org>, Thomas Gleixner <tglx@kernel.org>
Date: Sat, 11 Apr 2026 18:40:29 -0700
Message-ID: <177595802905.5403.1342882536380309490@lazor>
User-Agent: alot/0.12
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[bootlin.com,kernel.org,gmail.com,davemloft.net,glider.be,gondor.apana.org.au,ti.com,baylibre.com,selenic.com];
	RCPT_COUNT_TWELVE(0.00)[23];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31203-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sboyd@kernel.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,clk_parse_clkspec_1_init_data.name:url]
X-Rspamd-Queue-Id: B35E33E264F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Quoting Miquel Raynal (Schneider Electric) (2026-03-27 13:09:33)
> Add a nexus node with a child requesting a mapped clock in the fake DT
> overlay to verify that the parsing is also correctly working.
>=20
> Suggested-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.=
com>
> ---
>  drivers/clk/clk_test.c                   | 20 ++++++++++++++++++++
>  drivers/clk/kunit_clk_parse_clkspec.dtso | 10 ++++++++++
>  2 files changed, 30 insertions(+)
>=20
> diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
> index 8a17ad0d185f..cb0071955146 100644
> --- a/drivers/clk/clk_test.c
> +++ b/drivers/clk/clk_test.c
> @@ -3660,10 +3660,30 @@ static void clk_parse_and_get_parent_name(struct =
kunit *test)
>                            clk_parse_clkspec_1_init_data.name);
>  }
> =20
> +static void clk_parse_and_get_nexus(struct kunit *test)

of_clk_get_hw_maps_thru_nexus()

> +{
> +       struct clk_parse_clkspec_ctx *ctx =3D test->priv;
> +       struct clk_hw *hw1, *hw2;
> +       struct device_node *np;
> +
> +       /* Get clocks by index */
> +       np =3D of_find_node_by_name(NULL, "kunit-clock-nexus-child");
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, np);
> +       hw1 =3D of_clk_get_hw(np, 0, NULL);
> +       KUNIT_EXPECT_NOT_ERR_OR_NULL(test, hw1);
> +
> +       hw2 =3D of_clk_get_hw(ctx->cons_np, 1, NULL);
> +       KUNIT_EXPECT_NOT_ERR_OR_NULL(test, hw2);
> +       KUNIT_EXPECT_PTR_EQ(test, hw1, hw2);

I think hw2 is expected? Rewrite it like this?

	struct clk_parse_clkspec_ctx *ctx =3D test->priv;
	struct clk_hw *expected;
	struct device_node *np;
=09
	np =3D of_find_node_by_name(NULL, "kunit-clock-nexus-child");
	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, np);
	expected =3D of_clk_get_hw(ctx->cons_np, 1, NULL);
	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, expected);

	KUNIT_EXPECT_PTR_EQ(test, expected, of_clk_get_hw(np, 0, NULL));

We're also leaking the of_node if an assert triggers so we need to use a
kunit wrapper version of of_find_node_by_name() or do a hand code
version of putting the node when kunit asserts.

