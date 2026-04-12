Return-Path: <linux-renesas-soc+bounces-31202-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEzUJKn12mlC7ggAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31202-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 Apr 2026 03:30:17 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F026A3E25E4
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 Apr 2026 03:30:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 194563017C08
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 Apr 2026 01:29:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5604E30C63A;
	Sun, 12 Apr 2026 01:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q/8m0XBE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C31517A2F6;
	Sun, 12 Apr 2026 01:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775957392; cv=none; b=MLT59qNRXT5J33TWOGbftS9MhDnIa4nUk+HwJdJoLkk3IXC0Lato+IOBPsINnTPSlchvOiBvIo7NTHQIOntYH/dnwgxv9epZ992hnGwmQpXw0iP3QikX+1LrSCIxCeGsLbOIVPrMp6YlWg9Fny1hr6xxiFbGyZYSv9Xgs+qw+PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775957392; c=relaxed/simple;
	bh=AmxNp51aTVOo02sT1rCPMoaaTHHJuzhajP0ldlksCuY=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=YW5fv/ABuP2zdDXb7G3vAiISbdD/LKMtn6YJ3nVqW3Xm8sIE9vdCtonT9qFHD/y7eUJLixMIwWEVh57MxzLmb0wI5spwfglQqyQBcjP/fR1iy1dH/5SNVO/emDckCGQQ/eCWmrkVXAJlAUunU1+Dxtu534jDRQbRp9gSYWUxQjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q/8m0XBE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0182C116C6;
	Sun, 12 Apr 2026 01:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775957391;
	bh=AmxNp51aTVOo02sT1rCPMoaaTHHJuzhajP0ldlksCuY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=q/8m0XBEOZtGyzR7m3m3aITMpvREXWzA7dY4r0PA8ULL42JZb8xWcts4rmn8kjDQo
	 wzANHrIPl7qK00XuZ1lzxqdoeeLmDEsdYMLnX5FlsXBri8EDyf7C41GqmNZuw7XbkM
	 3MKSlV8FcvX3+yIiW9gg9YICZ6rJ38+rNgv8qOa7n68a4BsUG61OfDxRR18diw9+G/
	 PnRbF1TvjEt8ZdCPdwoWdEP8NQBciKPlsqdK2khIobRzDzEpJCKDRne7G9B9i+ce3z
	 qtGggSIiOg/95YKPkmuXVlMcfrtQUdm1ymwM3PvDdAH/2EtalaG7YfqfoXhNHwbxtV
	 nbZdDjpXz698w==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260327-schneider-v7-0-rc1-crypto-v1-7-5e6ff7853994@bootlin.com>
References: <20260327-schneider-v7-0-rc1-crypto-v1-0-5e6ff7853994@bootlin.com> <20260327-schneider-v7-0-rc1-crypto-v1-7-5e6ff7853994@bootlin.com>
Subject: Re: [PATCH 07/16] clk: tests: Add Kunit testing for of_clk_get_parent_name()
From: Stephen Boyd <sboyd@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Pascal EBERHARD <pascal.eberhard@se.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, linux-renesas-soc@vger.kernel.org, "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
To: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>, Antoine Tenart <atenart@kernel.org>, Christian Marangi <ansuelsmth@gmail.com>, Conor Dooley <conor+dt@kernel.org>, David S. Miller <davem@davemloft.net>, Geert Uytterhoeven <geert+renesas@glider.be>, Herbert Xu <herbert@gondor.apana.org.au>, Jayesh Choudhary <j-choudhary@ti.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Olivia Mackall <olivia@selenic.com>, Rob Herring <robh@kernel.org>, Thomas Gleixner <tglx@kernel.org>
Date: Sat, 11 Apr 2026 18:29:49 -0700
Message-ID: <177595738949.5403.11279360430887628318@lazor>
User-Agent: alot/0.12
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
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
	TAGGED_FROM(0.00)[bounces-31202-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sboyd@kernel.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[clk_parse_clkspec_1_init_data.name:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F026A3E25E4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Quoting Miquel Raynal (Schneider Electric) (2026-03-27 13:09:29)
> diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
> index b814b45f1f7e..8a17ad0d185f 100644
> --- a/drivers/clk/clk_test.c
> +++ b/drivers/clk/clk_test.c
> @@ -3651,9 +3651,19 @@ static void clk_parse_clkspec_with_incorrect_index=
_and_name(struct kunit *test)
>         KUNIT_EXPECT_TRUE(test, IS_ERR(hw));
>  }
> =20

Add a comment here to tell us what the test is expecting.

> +static void clk_parse_and_get_parent_name(struct kunit *test)
> +{
> +       struct clk_parse_clkspec_ctx *ctx =3D test->priv;
> +
> +       KUNIT_EXPECT_STREQ(test,
> +                          of_clk_get_parent_name(ctx->cons_np, 0),
> +                          clk_parse_clkspec_1_init_data.name);
> +}

Reading this test is pretty hard because all the context is in the
common setup. Maybe the common setup is too broad in this case and
should be simplified so that tests can show more setup and assert code
for the things it wants to do. For example, if the name can be passed
from this test directly it would clarify by moving context into test
function scope.

	const char *pname =3D "expected-name";

	KUNIT_ASSERT_EQ(test, 0, setup_parent(pname));

	KUNIT_EXPECT_STREQ(test, pname,
			   of_clk_get_parent_name(ctx->cons_np, 0));

> +
>  static struct kunit_case clk_parse_clkspec_test_cases[] =3D {
>         KUNIT_CASE(clk_parse_clkspec_with_correct_index_and_name),
>         KUNIT_CASE(clk_parse_clkspec_with_incorrect_index_and_name),
> +       KUNIT_CASE(clk_parse_and_get_parent_name),

Better to call the test something like
of_clk_get_parent_name_gets_parent_name to indicate what we're testing.

