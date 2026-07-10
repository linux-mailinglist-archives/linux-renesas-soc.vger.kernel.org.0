Return-Path: <linux-renesas-soc+bounces-35050-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Roo4GqvhUGqB7AIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35050-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 14:12:27 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B739D73A968
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 14:12:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=qBXCa+db;
	dmarc=pass (policy=reject) header.from=bootlin.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35050-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35050-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EA1F33004C4F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 12:10:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B49A7413249;
	Fri, 10 Jul 2026 12:10:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40ED34071DC;
	Fri, 10 Jul 2026 12:10:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783685406; cv=none; b=R0XqmkeDuKEE2itrIbaQrGCYWqxk3wDVS2RUr4PLLNUJM3GeES+Pr9IfkfK2BTG2//mA/vxafd3qIeRxvh28jIYfZ9nt+NNfPR+DrvzwP0gbRE6i/IjDyEABrxvieIipqxtPTl0VpZPEMVRlB26RnAXWK5gBphPqtUxCVLat2m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783685406; c=relaxed/simple;
	bh=aQwcX9XYj4VW0rglRN9smWthALe2etv1kQSIKdoKzCE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=PGCofu+SkFWZezToD+jrjAG8QwZ3d/YchuLRfrwAHkpwesNs5Ob3XrS13U1yDArWk+bdS7f+3ThZdhX5RP3iBp1AD6m/XfLg9ZVD5ChDRuygZoQPFYHs7ql1wo8q7N5QPJHzET4kUkkVrMYakaYyXX9acwWpTJN+yaTQ4YnKUZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=qBXCa+db; arc=none smtp.client-ip=185.246.84.56
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D10F91A0F3A;
	Fri, 10 Jul 2026 12:10:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9A00A60342;
	Fri, 10 Jul 2026 12:10:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 685E411BD0BCF;
	Fri, 10 Jul 2026 14:09:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783685402; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gk9jwtLF3KGI28XFf4LplvEp5Vfvp7PmyBj6FTbwmKM=;
	b=qBXCa+dbAg0BNoCZk3+hs+XRRziKjwAkvc4JhGgW5DNe5/RJIBfvLG7PIV9YVJ40wWu327
	HwlDB6D6x6OAvhHiGXr5LdSSGbdnVAvwI2oozlhWDK4jX5Libs1WZqKCB/NX1OqKeX/qvj
	/JgoCoRzLITcujEVYb75FmyyDBuMF+jNxpOL+pM9YoO7NStT1WQ9deuM4RBUVw+1HufR7P
	QoXJQfuP7mQ0oxSuDOEqKEw3vIxcpCU/2SG4TMU8PHbwSnLF2Bme6b0altUu8FzzGBGP6l
	ITuhPTj+bYbZD0FFGJCMpOqGrDNidsELwyq5ggS51pqW576QB7qdwcP89awUjQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Antoine Tenart <atenart@kernel.org>,  Christian Marangi
 <ansuelsmth@gmail.com>,  Conor Dooley <conor+dt@kernel.org>,  David S.
 Miller <davem@davemloft.net>,  Geert Uytterhoeven
 <geert+renesas@glider.be>,  Herbert Xu <herbert@gondor.apana.org.au>,
  Jayesh Choudhary <j-choudhary@ti.com>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Magnus Damm <magnus.damm@gmail.com>,  Michael
 Turquette <mturquette@baylibre.com>,  Olivia Mackall <olivia@selenic.com>,
  Rob Herring <robh@kernel.org>,  Thomas Gleixner <tglx@kernel.org>,
  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  Pascal EBERHARD
 <pascal.eberhard@se.com>,  Wolfram Sang
 <wsa+renesas@sang-engineering.com>,  linux-clk@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-crypto@vger.kernel.org,  linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 07/16] clk: tests: Add Kunit testing for
 of_clk_get_parent_name()
In-Reply-To: <177595738949.5403.11279360430887628318@lazor> (Stephen Boyd's
	message of "Sat, 11 Apr 2026 18:29:49 -0700")
References: <20260327-schneider-v7-0-rc1-crypto-v1-0-5e6ff7853994@bootlin.com>
	<20260327-schneider-v7-0-rc1-crypto-v1-7-5e6ff7853994@bootlin.com>
	<177595738949.5403.11279360430887628318@lazor>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 10 Jul 2026 14:09:53 +0200
Message-ID: <87echbgi5q.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35050-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sboyd@kernel.org,m:atenart@kernel.org,m:ansuelsmth@gmail.com,m:conor+dt@kernel.org,m:davem@davemloft.net,m:geert+renesas@glider.be,m:herbert@gondor.apana.org.au,m:j-choudhary@ti.com,m:krzk+dt@kernel.org,m:magnus.damm@gmail.com,m:mturquette@baylibre.com,m:olivia@selenic.com,m:robh@kernel.org,m:tglx@kernel.org,m:thomas.petazzoni@bootlin.com,m:pascal.eberhard@se.com,m:wsa+renesas@sang-engineering.com,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,m:magnusdamm@gmail.com,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[miquel.raynal@bootlin.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,davemloft.net,glider.be,gondor.apana.org.au,ti.com,baylibre.com,selenic.com,bootlin.com,se.com,sang-engineering.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miquel.raynal@bootlin.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:from_mime,bootlin.com:dkim,bootlin.com:mid,clk_parse_clkspec_1_init_data.name:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B739D73A968

Hi Stephen,

On 11/04/2026 at 18:29:49 -07, Stephen Boyd <sboyd@kernel.org> wrote:

> Quoting Miquel Raynal (Schneider Electric) (2026-03-27 13:09:29)
>> diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
>> index b814b45f1f7e..8a17ad0d185f 100644
>> --- a/drivers/clk/clk_test.c
>> +++ b/drivers/clk/clk_test.c
>> @@ -3651,9 +3651,19 @@ static void clk_parse_clkspec_with_incorrect_inde=
x_and_name(struct kunit *test)
>>         KUNIT_EXPECT_TRUE(test, IS_ERR(hw));
>>  }
>>=20=20
>
> Add a comment here to tell us what the test is expecting.

Yep, done.

>> +static void clk_parse_and_get_parent_name(struct kunit *test)
>> +{
>> +       struct clk_parse_clkspec_ctx *ctx =3D test->priv;
>> +
>> +       KUNIT_EXPECT_STREQ(test,
>> +                          of_clk_get_parent_name(ctx->cons_np, 0),
>> +                          clk_parse_clkspec_1_init_data.name);
>> +}
>
> Reading this test is pretty hard because all the context is in the
> common setup. Maybe the common setup is too broad in this case and
> should be simplified so that tests can show more setup and assert code
> for the things it wants to do. For example, if the name can be passed
> from this test directly it would clarify by moving context into test
> function scope.
>
> 	const char *pname =3D "expected-name";
>
> 	KUNIT_ASSERT_EQ(test, 0, setup_parent(pname));
>
> 	KUNIT_EXPECT_STREQ(test, pname,
> 			   of_clk_get_parent_name(ctx->cons_np, 0));

While I understand the feeling, provider 1 and 2 are shared with other
test cases which would require restructuring quite a bit the whole test
suite for IMHO little benefit. I can however make more obvious the string
that is actually expected by redefining it in plain sight at the call
site.

>>  static struct kunit_case clk_parse_clkspec_test_cases[] =3D {
>>         KUNIT_CASE(clk_parse_clkspec_with_correct_index_and_name),
>>         KUNIT_CASE(clk_parse_clkspec_with_incorrect_index_and_name),
>> +       KUNIT_CASE(clk_parse_and_get_parent_name),
>
> Better to call the test something like
> of_clk_get_parent_name_gets_parent_name to indicate what we're
> testing.

Fine by me.

Thanks,
Miqu=C3=A8l

