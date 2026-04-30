Return-Path: <linux-renesas-soc+bounces-31854-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGvNI5x582mt4AEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31854-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 17:47:40 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 07EDD4A517B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 17:47:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2F5DF302F434
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 15:47:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E30B44CAD0;
	Thu, 30 Apr 2026 15:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="mMeaLQne"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011009.outbound.protection.outlook.com [52.101.125.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C7D20E334;
	Thu, 30 Apr 2026 15:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777564049; cv=fail; b=unRYxUoaa3QzPdCNkFVQM5Mj9U+4Ea0TcpChPe00T0EDh50uVMqAYu8ChA22TUMPtiiAzD3Pa0ZP0mZumR0kUbYXiJG8XUbQs1z5zPqFGgh8BT5FjL7bS0ngprPMFBrYWUjdUj5Hd4tnMvkdh6y9g4Ww7LRzUuWKrxl+LgjOqjU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777564049; c=relaxed/simple;
	bh=BnVC3TdEwAkYyL/1+/b+sqlK3e8VBzf4AUV0a4iY+XM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nADbQ0jn5zLSNIlCiiCK397zxmMV84IxOFMhcHSOMN5fqZcg97iEsizfjCesdlKGi9J2uJf75dRP+F9naxQyvYcKGZxnfncruMpfRbfFFl7A9jbnycCuRTOgxqBa+HnJhJcQveVQq/dZmVKsE15lYrAxfN4adBx9VXKS3HY5jKo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=mMeaLQne; arc=fail smtp.client-ip=52.101.125.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NxWmdd7Xw9GE3QiPC9ONyuiNbY7l1xlMgWkE9OfIhKHxtctpul191NqVf6fIqDsJ5PKZ/RU9uaDUUaT0VBqRnE0IMx7Q/+o09LS/nN5NK9CloNj68SI+RUu4urfMMEZj7FhlbttYvydjmOf8t4F9yUBJ6rGFtiMjOnMnsreuRYckUhOB5pkWfwHAxq6F6zXflKPXyYGs1cjnzCOkJ7m/uhFdaTmwiU37s0V8H6rhUEk+mpGtgoE6Kkm1UPhPkABRFmQoKD7p8EjTmGcTO4Yx4pH1mKmJsoKyggXTlAnGMR7mVrldXgrG2Pf3C0G3Gm2XZc/sq6zSeNROgZyyx7auBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y/oJK4o4VbiFKH5VAAaXa5/BGUJj22mVQaugu3XMmY0=;
 b=bZj8PDxvSd5bgQ+vc+9FRzDpHipjlrxwRKJg30+C20b6DEC0pg1gRkhrTxT+Qi3HRe5+MYZQD5K/YizxgTAQYgCDs16bIcamR3yWRvr+wxCWPJfJK8o3ouSfPf55I4R8YsJSPMjLeZVYDOfJQiJlJ9R81KHrTwI0Cq6EJ1E9EKMD0zRee60FosDVqMNQcyp3H19dTjNbPcXi3R4bJeJkFAY3iZ/ge8QAPyeuDXACaBj/9w8YiFOkVxLsjhmtt9bdJ9H4vGylTX/po4pI+kpaDijTq/Zp0QhfHHWKhKQ1tRNW5Vw7UhY7/IDYdZeVrokgciCwKouWSLZBmCs6uPP0hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y/oJK4o4VbiFKH5VAAaXa5/BGUJj22mVQaugu3XMmY0=;
 b=mMeaLQne12/foaBnA72/fzE2PBqE0naX4AF20bATdymME/X0rS0hPrUCFIM3fvquuUAj6NQRkTvPfmFXJKaJ3fOOPoUCbl7+LM6bCn+DH/JL500aOAm6Gjzn2PN8pwVCyPci8P/eTXydbROrTAtYc+OCNgqEjLjhvESYdiTjvJo=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB7076.jpnprd01.prod.outlook.com (2603:1096:400:c3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.22; Thu, 30 Apr
 2026 15:47:24 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9870.020; Thu, 30 Apr 2026
 15:47:18 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: RE: [PATCH 2/3] clk: renesas: rzg2l: Refactor
 rzg3l_cpg_pll_clk_endisable()
Thread-Topic: [PATCH 2/3] clk: renesas: rzg2l: Refactor
 rzg3l_cpg_pll_clk_endisable()
Thread-Index: AQHc2LTjn8TzLafkjU+dMRw85FkDTrX3v6Iw
Date: Thu, 30 Apr 2026 15:47:18 +0000
Message-ID:
 <TY3PR01MB11346D00E91533D8D4559161786352@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <cover.1777562043.git.geert+renesas@glider.be>
 <9cda94b9b37c562a305f4dd6091fd71246764fd2.1777562043.git.geert+renesas@glider.be>
In-Reply-To:
 <9cda94b9b37c562a305f4dd6091fd71246764fd2.1777562043.git.geert+renesas@glider.be>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB7076:EE_
x-ms-office365-filtering-correlation-id: d9703584-50e3-491f-fc91-08dea6cfc269
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|56012099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 DiK8ZnJg/GxmZaxo8IC6CRrnyaeMJx0br/DvI8K+wCksOW2rgzEIkkNDDCP84Tumpg0UWsNV0yx/ivO5x8OFLvpp6lWfZ2odcq42eN4+yUiuZI8v8GM6J0sc0o/UZx0hC0czIOzxq303IaJcD6im9jQc0uDgtW3vCVgXguLdC1lYaZR9SvfRYf76UpaPgVR2gbIST9p8eC1VyvBmP8K/gqZk3UOHSRmjWoq6suwa2dg111o8wpvS2q7SpPZFfaRjkk4z+I6g7RLQS6YHyHqdgWozOJvOxMvzGX1oukhzZjBWr411zh+AYvw1CQMoVRXPpcEL1xYpHsU7jTOnEzMcRFNoGkF4GuVV6enD9O60U64iuw16zCcDhl5Sh7K+H5ICwMlp6/TNxl/UN6alrfBbnsY0aLlrHqU1vxpP8p9daTn5XJwFDlPGpBjjJpJfMm1MYeCNknQXkIxCVq60RwEwKWOSoOfYm+VvWZYvOEIg+L/2sjt5evYvTJ2QscDpxwtMugw8JanbQEmVu6LW7FM4Yfu9CUggjtXb38LoqPTGObtK9S9IeLakhFoEK9+ZJcWbEk3NqUjjOOuafwazBoOpCjeCANLj6BBhXK6GyWVMA2rXDQR7cNeY75vLo8o1GR1V85W4M8EcN/et3yuc/gCy1tHpp616MvEllQMKQ0OTYR1c+xETRy0KjBDXFuLoQF+0Llo9JtDgj77jC5890EzJR2zK1XxltgdczFSjrn7oRb7vCaYZBsptJ/ZqTQBMaTAISKxK6xVI7Aiyl4z0lJu6s3PemC0tEy8fk6YczSxS07Q=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?qEywIsC1iyCn8GPdrTIKJA4k96lxc3BbJAvhYSIeA/aHzf43yhowjbX8VOXn?=
 =?us-ascii?Q?n7+pmgUcWEeprr8n2n5dWh0jrNlS4I77DDpOwMUt2aOVrKucnen6SYYMlwy4?=
 =?us-ascii?Q?hjwfLfZh8TIQ5o7DETp5TA3q5xefyUC3LSexB3cHUvRsfG0CL/5uW9E5Pxlw?=
 =?us-ascii?Q?vkewwGyopv1A44m9WgvOIcfgEHq4qsqdWf4JNlQ/6DE3k/2xJ2R8xGVadaec?=
 =?us-ascii?Q?PnzKcXPuUOYf/EFZUpX3mBJJDXXn/6bCN01f34HgSdXN848MW81gaLXIA8cV?=
 =?us-ascii?Q?HwJrBlOChFsWHA7PktaWY4x5s6bc+Fz2DCVbuvPMH1wxp2trIaKKWXG6t7JJ?=
 =?us-ascii?Q?ThOv2pwItdGq+tbTSzl8HvWC4RNM83D5qU9VDd2gZKSa/v/j9fJdgq/TutmV?=
 =?us-ascii?Q?80mCdr6IRYYjijzzw/UFzTMbRCh9GSpjTZx8KjFS6035zl+PasmDrqeyit3O?=
 =?us-ascii?Q?v3EmypcTx0Qvw2I6c9TJbm+f1aSBOWGxKiBYNk+50PCYvrmhLg3X4y+QYoBU?=
 =?us-ascii?Q?re2WBQunl5h42DiSflHLtIdtaYLZBitJ0rBJP1JoNG0hSSHRkMFbNllzkelG?=
 =?us-ascii?Q?45tT+KUxesQOsAcvM3uWGx1CWl7Fyo0jPtA3JTjyUYIzFDFBQ9fw6z4JR6dt?=
 =?us-ascii?Q?quRa1JrBiRsU3aQ5WxCJx0hatPIk4V7WgU81TEA99lTC++D1JUkmB6jn+Dh3?=
 =?us-ascii?Q?eV5Nj/x6zKEjUlZ1Al9LoMug3sBA3iT9/SjRVvQMRROQ3P/S5Z/bRq85ghCO?=
 =?us-ascii?Q?adKTTJGSPEniDyWmZyIDmHMZKeTcj8ZRu6qJg08dvOxu5laryvQb0QY8wmkh?=
 =?us-ascii?Q?9Pn0IjBZp1L24W+1YZWXisP9O0luqKLTBF8VPIX09q/WWcjLw8/DVB6elVKL?=
 =?us-ascii?Q?Biv6RzvWLAdzsxanHE4fip1yJUbDL1BefsV8DBPGVzkzzAkDRFFDReKb05oz?=
 =?us-ascii?Q?AoNYBpUrZEhBILYpSXCXAkFVUdT6MgyQXJT4KnWHApx1jTT45sRfIayUjycx?=
 =?us-ascii?Q?0/n0f9N+JVikFrZvHQYYEwtQrAgEaIDDTIbXgODlThSK++TJo8e+q4c2TXJn?=
 =?us-ascii?Q?EkD02QsI8w6u3fEqOjwTnT6XtSKMgPsn5rKDN8bSd5KoBiwAzBuctouR1wVP?=
 =?us-ascii?Q?8M18WCPE7mXMj30DA3yCFsIUFSJxwuzbbZ6hdgfCEuj7PIg9Hix9sROy2aQk?=
 =?us-ascii?Q?+e4lFFK4vhqo4W0ZpuOnPKHlcgrmOikB++ilLEaMRDmBbPe9Q+vWCU01y5Dn?=
 =?us-ascii?Q?attUC/UqxSqxZYRB5MGY0lxtL1+EAKdZB/BnpWfQ5Yi2qeybSCKL4UCaldtR?=
 =?us-ascii?Q?Crbpkj9zVoK4YDMBEeb4J7uH/Oz5OhLJO5oLN4kJRhhaSDHAUE+dpv8A9pWO?=
 =?us-ascii?Q?MYZ8ywxK7ajCBm78HPGU3vRr2fe1tQKhbBghtBIfzME7iQ5N/KB9pZbtNVfh?=
 =?us-ascii?Q?RppoGKTOWyh+M2YuI4o3+eiaGP4yrwcWfpNoI/BWoj7Z8EZs6NZzGeWL4gF6?=
 =?us-ascii?Q?98ZrPz/6tITdDt0cH0hmLP8WsOW7HwcYgXJqRYwYzWf963Vuk05zSHRKX4WM?=
 =?us-ascii?Q?CxbeQnoINeKr8vTSjQmPKiM2pnVMXwlb1ry0X/MiJfqCNWAshZj0hOD2vQx0?=
 =?us-ascii?Q?7j4SJ7tgvXJ9hn5ZucamsJ4FLqljL6HViQsYLhdlIQ9MrZHjzGjZ+ZkwamZl?=
 =?us-ascii?Q?gJLozzNefiTyJdO2HYx4wrGYi3YxJwhdz1f4rcA3AFvNacV8XONsRK5lykIj?=
 =?us-ascii?Q?myhVbCvgDg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9703584-50e3-491f-fc91-08dea6cfc269
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2026 15:47:18.3126
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QCJvtwEQIiQOAXliWlKm0RHIFtkyg/htT+mXhrUExu/1FqE9ONjsVA1QxqsK424xbkTNKMxVYHg+J3sfQ0jqW3cHGv8YZUCGEWTLS0frc94=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7076
X-Rspamd-Queue-Id: 07EDD4A517B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31854-lists,linux-renesas-soc=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email,glider.be:email]

Hi Geert,

Thanks for the patch.

> -----Original Message-----
> From: Geert Uytterhoeven <geert+renesas@glider.be>
> Sent: 30 April 2026 16:20
> Subject: [PATCH 2/3] clk: renesas: rzg2l: Refactor rzg3l_cpg_pll_clk_endi=
sable()
>=20
> Reduce duplication by introducing mon_mask.
> Eliminate an else branch by moving common parts into variable pre-initial=
izations.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Cheers,
Biju

> ---
> No change in generated code.
> ---
>  drivers/clk/renesas/rzg2l-cpg.c | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-=
cpg.c index
> f98b6eb4f501c676..426e93dc7a9891bf 100644
> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -1197,27 +1197,25 @@ static int rzg3l_cpg_pll_clk_endisable(struct clk=
_hw *hw, bool enable)  {
>  	struct pll_clk *pll_clk =3D to_pll(hw);
>  	struct rzg2l_cpg_priv *priv =3D pll_clk->priv;
> +	u32 mon_mask =3D RZG3L_PLL_MON_RESETB | RZG3L_PLL_MON_LOCK;
> +	u32 val =3D RZG3L_PLL_STBY_RESETB_WEN;
>  	u32 stby_offset, mon_offset;
> -	u32 val, mon_val;
> +	u32 mon_val =3D 0;
>  	int ret;
>=20
>  	stby_offset =3D RZG3L_PLL_STBY_OFFSET(pll_clk->conf);
>  	mon_offset =3D RZG3L_PLL_MON_OFFSET(pll_clk->conf);
>=20
>  	if (enable) {
> -		val =3D RZG3L_PLL_STBY_RESETB_WEN | RZG3L_PLL_STBY_RESETB;
> -		mon_val =3D RZG3L_PLL_MON_RESETB | RZG3L_PLL_MON_LOCK;
> -	} else {
> -		val =3D RZG3L_PLL_STBY_RESETB_WEN;
> -		mon_val =3D 0;
> +		val |=3D RZG3L_PLL_STBY_RESETB;
> +		mon_val =3D mon_mask;
>  	}
>=20
>  	writel(val, priv->base + stby_offset);
>=20
>  	/* ensure PLL is in normal/standby mode */
> -	ret =3D readl_poll_timeout_atomic(priv->base + mon_offset, val, mon_val=
 =3D=3D
> -					(val & (RZG3L_PLL_MON_RESETB | RZG3L_PLL_MON_LOCK)),
> -					10, 100);
> +	ret =3D readl_poll_timeout_atomic(priv->base + mon_offset, val,
> +					mon_val =3D=3D (val & mon_mask), 10, 100);
>  	if (ret)
>  		dev_err(priv->dev, "Failed to %s PLL 0x%x/%pC\n", enable ?
>  			"enable" : "disable", stby_offset, hw->clk);
> --
> 2.43.0


