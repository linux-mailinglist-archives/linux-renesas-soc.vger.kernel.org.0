Return-Path: <linux-renesas-soc+bounces-29470-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKYGOEDft2n7WQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29470-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 11:45:20 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CD3298288
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 11:45:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0CE993014C3B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 10:41:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 589C138E124;
	Mon, 16 Mar 2026 10:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="RE34aPUE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010042.outbound.protection.outlook.com [52.101.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2156A30CD82;
	Mon, 16 Mar 2026 10:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773657678; cv=fail; b=bDsHw8z+0niVNGS4AAfp8f+9oA3QehIcHlx14F7t4oNbVBssyYTM4hPiOIoWDXQRi5uvxi+G6b8k20OQah5h6d4CaUCC5Buoqmf9gXaGlrsaFwsYR8aITAINccs0FFMUdOtookkhgFZj8MyRth9wuS4d7oU5Mwv1nzEzyRQw6Ow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773657678; c=relaxed/simple;
	bh=4/2YSEy/8FqX8DIVcJRSUaa+E0YGT6gq+G2Pb0qA+IY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HLungYfIJcz2UGKujOs3wrK0cSNoX3+AMC02R6HsJQkzULe2neCWyhH36roi7+avrUgilaveL6K1PcqUrTjsY3/1ESsr6+xtztFQfokwflUb50iDG3ZnZKi7QeI0vxbgiE8Bnar8XyjUXilfR0MKAUQtISv/cyZoryGYhlVovxI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=RE34aPUE; arc=fail smtp.client-ip=52.101.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mZWlsdydX9ynXC5eo46hsKjLhA206WpaONsJBSbxnSsOO8Vq9nAb9BlbNfG6V0vUr5OaTMft+QDM04MK2WVv8TmjkeIy5nsGpEdY7q2OB/KT3/UA1vm+CH49l0IDp7OQreG2PsdLtvtLge5MoU+o2A7KB34WOa4qCL4utkYf+3BU9UhfNrY7KR3EeKaoG5kgCTxZQDPphnsRmuBFpnrCup/5NmEfEYCtw18FWZ/v1ct27gk9jK6OmV6LYQIq7EQwKLU6gF9Ptyg/XGEKgHQ/uWTAORg0Yz8G/1RBNJ1MsXKzAIZzEJG7MrQHDC8PyY63AvRyc+2i7mDlWCdd8Vt1pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bayVvv0/mILtzhzbYLT2xHuC19lbWZh5Qh9s9uBXQCM=;
 b=KvTuKvS2HlyhmqKvurrtohPI31X3oIYojTyNAj+DzVYEbyicaem/lIAJoNKj0ARHTdJWh3mEmO2e77u2XubGJE65yIDLvDF7bbZUakAK6GqaCBpa+sYxncVEupe6nBijgt2zBwgrHVqmDDBb39vyP70K6RUuYNckl8xqB7/TWSiari7UHW6m0FlkpKmr1vAKY3r7xng5IPfNHjjrdohCipen5Oh8unBVNkF2rzUff9kJ4dngfQ/3GIuli8w1JaGYuk7laAA5S9Ut/ANl+HuOW3JF6gSh0U9XLcowr6vQrQS2I7tYQxiS7PY4qQixWYR1S+0nac9k7EgvLSqs0SjFVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bayVvv0/mILtzhzbYLT2xHuC19lbWZh5Qh9s9uBXQCM=;
 b=RE34aPUEcFW2MTM412ZgdoS0RquLo+Fw1kaQAWxz0IhvbYjtgCKZZL/H86XdSjWfeZDr4RnXfB4CJXb6C1gIFjQhWrGwqKgqynpByCxa+nDSFKdhW/7uCgNCt1MIuRlLjLveHD+BNsHXcsZL0zLbWfA7MYGmMC8jZnwVFaRZ1f0=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYRPR01MB14147.jpnprd01.prod.outlook.com (2603:1096:405:21d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 10:40:54 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9700.021; Mon, 16 Mar 2026
 10:40:54 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: biju.das.au <biju.das.au@gmail.com>, Andrzej Hajda
	<andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, Robert
 Foss <rfoss@kernel.org>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
CC: laurent.pinchart <laurent.pinchart@ideasonboard.com>, Jonas Karlman
	<jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Dmitry
 Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Tommaso Merciai
	<tommaso.merciai.xr@bp.renesas.com>, Andy Yan <andy.yan@rock-chips.com>,
	Douglas Anderson <dianders@chromium.org>, Luca Ceresoli
	<luca.ceresoli@bootlin.com>, Jesse Van Gavere <jesseevg@gmail.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] drm/bridge: adv7511: Clear HPD IRQ before powering on
 device during resume()
Thread-Topic: [PATCH] drm/bridge: adv7511: Clear HPD IRQ before powering on
 device during resume()
Thread-Index: AQHccNTTduZlWQWrnEiAvemqifSjf7WxgQLg
Date: Mon, 16 Mar 2026 10:40:54 +0000
Message-ID:
 <TY3PR01MB11346084FCCCA7F5ED5DE8FEE8640A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251219104659.114032-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20251219104659.114032-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYRPR01MB14147:EE_
x-ms-office365-filtering-correlation-id: c7b3623f-6cbd-4a4a-5818-08de83488005
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|18002099003|22082099003|56012099003|38070700021;
x-microsoft-antispam-message-info:
 SYNn5ypwHIyCzEdv/Edvcy/ea2Y124z9Pf18O9lMIZtY+KiGYEvB5FF4BO55iGT1omreS+jXx1/UEfazwS4N2rGsTXhjsXeUxj18SnppC+kFhIktJAHd/MJ/QrD1ZXW3K/kJHDU2lY8o4WBKtJ0nqepNwz47U4nlUEkvGQOZmS50+fnkBuFViJUaVl1RLXmYw4zDxSuzqruwVvN/9k1Vd7EWF9zttz0lAbgpZxqhmxdjOxV2GlTS/6kt4wmS4qwuYq6K1Ul8iT8r7LbILpRP9IUKEqbEZMMsVCUb+tpmADFK+EhoLz0Z/tIVkDpmhcVzIK6GE7I1P7ArlN2LWWvtT8gabzUyir/6dBNXXkQWCd+Y8/yuZnK6Lr9VPyelry/sVU2y8FOK3oxQ6l51qr9571WNF75idTIq2L6rFUzY5BLthh7FN4wVR4vEpjPZDswoMi8+GNwGKS0u5TRabPiAFVUur6IMHnPpZ8Rl02Bq3zuANnz9v/+Lw45WSuNP16PJlp7RR9ri/trQXWaZCNF8OLEIAlBRvmeoEyFIA7S8z0Ov3tVw4NXfccx5rNqhcj5egzrYsTrDabekJXtxZMlKaUDAFfVlOJWlUpSimrYWhEPxJuDb6hGxUAVq6e+LqCLPzWUH4DQVlCZklg0Myh1NnHT0DkPgA5JcKUiC61qgSgPPrC1JYmDzXBMMlbEVjiVpn5m88bksFn5gHP5QQGUlSZQ8OIJFT9pt/mCExJ+Wa9smP1vA4X7xqccbS7haBC/NlkQFTbiotXQknSi9AytpnuetDgPLnaw0yH1ha6fq7Oc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(18002099003)(22082099003)(56012099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?NwrudQwcdW94QTvofBhmfK0/3w+ZRky/x8RbJykcj0fXTblHtd450dvfj/0l?=
 =?us-ascii?Q?7SMAAwcSyEQevmvCLc8+IR8yv1cRXEgQegpj0okWvsxBt+b9eFlCYp+XC5n3?=
 =?us-ascii?Q?sYXN2agHmFfXnvK+oMYfTL/A/Z87KZqFXBxjvwDujudqx7pEne2keFJ3Y/1A?=
 =?us-ascii?Q?sMm3NfetAA0uEl1zPw0SUZ4fCx7RJULfdwS17MOgoAfgnbmnXXupW3vJ11O/?=
 =?us-ascii?Q?sdXoZowGSh4W4i/FmKWxKeYNkijAuJKLsMbMNqpLjhNpHjhUZ2vqzNeKoSMc?=
 =?us-ascii?Q?C1Hc5dUhXRX/DFOeQ1M3mxxvwoJiEE/FcZkb5EMbmj70hq4E5CA/0IK3xuzr?=
 =?us-ascii?Q?dwGuoDY/v6rVw4H0w8U/WOFNYu4cReq+E3q6LCw8uRJo+vCJBbWu/rfiveAM?=
 =?us-ascii?Q?hwKuzxryLuhp3/e3OvpyGUrl7oo7gWTJhz0bIeRD8JHaMoLRO+erC3RZRZb2?=
 =?us-ascii?Q?Q01OE5/VEQVr+MmZHAk7HT00sOPjy2Mc91vYac9Om78fj2GRzRezu/Ws7sIs?=
 =?us-ascii?Q?vpUCmtwIsmRWQXBypvxHlVPwrUxOKwplVpUkXK9uOLRF8lR0USIXRuFuWHKL?=
 =?us-ascii?Q?/bpM+d948AS6tG9/H2yIf8ApaZuQTjsrpepl/aVgOeQxQvKxBBxocIYDYr/D?=
 =?us-ascii?Q?FRof9E2Qe1gkGr3fO/nuiIz0OY/iIp1PfjWGAH4HWd8okFw3GOZEl9gmdyCJ?=
 =?us-ascii?Q?p8FlIbFY9hWMD4LA18n6BB4NNXWjNqOZScME8sA2LGmr9QSvb/XqvK5xQfyY?=
 =?us-ascii?Q?IakHj31IyMlry5OPFkuSBPpN0+qJSqcxW5STbIy3pxtx3tTOS9p9PprLgKRU?=
 =?us-ascii?Q?AvgxPFf4r2ti1Sk2N0tskvhrbt0j/GNq9Q5Rai8EJLpGHpHNcTIeY6p110QE?=
 =?us-ascii?Q?nhLQL0fAZSqVyOUgthqnJVkdu0MUCj3LxBf9qx041UThvlNrRoPhIDWMS0Sm?=
 =?us-ascii?Q?c0jXye3L9CTqDwvWF3M/Cj7NrFJK4BO4/fwNm8lurOtKzllI9sIQ/hlLGFB3?=
 =?us-ascii?Q?b9H6H02bgyrGwJ4lzficZnrp3jL1W8cYIJYjOFlPyLsDwD0Tt3Wgrg+MClQK?=
 =?us-ascii?Q?8Cu4Iiuv+nARPJ1UrTFSg78sdaiXxquuvQIshcyL/5Y0g5xyXaEzBfkSHUQe?=
 =?us-ascii?Q?PvS39ghU39b4t7F4+j1wVhysm4iSaYgEdO8+vzahPKLarVQgH07OyXg+Udqi?=
 =?us-ascii?Q?wLiSSV/KU6v4QlZ9E6PDaq0hyDigfbr6Y+a4zlii3lK3FkUtrPx74XeYJAB1?=
 =?us-ascii?Q?KpEoZapWZcvi7DxntJSpDy35+xUNaj2W6fTZXFrR8pn9tnXml0BdwJsclO8E?=
 =?us-ascii?Q?TPiNdV5ISt9RxlH0IVIOmiPjTjtgSoIuveOwcdVphra4JxzPom3Ilcs2zWO1?=
 =?us-ascii?Q?huAYorYfR8btnPU/wRDHHMJUgkN2M03HQwJYCPMKCH52CqqGqbKecz3C5//P?=
 =?us-ascii?Q?LcDQqumZ0HAcnNWvGArXnGTq2gYsdoEd3p8BkpwfN11SnY0mEqNOYmJR+Pfx?=
 =?us-ascii?Q?AaLM57PNOh0uJyDKZw5N+laiFTkdxud/YhyhHFfkVrE2f19nyLIuy9ALqEoQ?=
 =?us-ascii?Q?1nDGuA2lLQf3smr6OBFvGwFQY63OKzTKzrFpX7MAyWxR5TwSJc2jnvsbvsXQ?=
 =?us-ascii?Q?h5zIFvIIM5qnoEYo/eafXSCyziSz8dB2d1ZFkgAMdOWsZhR2wAhivbJ6EWSS?=
 =?us-ascii?Q?fefdYBtZ+KTleXYkC39GqVtJbjOV0FRSO9osC7PjTHJ0xxeYZYLLrOjN1WuW?=
 =?us-ascii?Q?wP6j54rwBw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c7b3623f-6cbd-4a4a-5818-08de83488005
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2026 10:40:54.1542
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QhhcG/OVAJDQGwQAup5Nyw/wgw0XY8mKE7XIA7qlABE6vjJOnM0L/eL4ypU+/ecKKrwE8Vd/O/n3TQyn8DWpPpL+0JgsoeQC1N0Mz/DGQ8I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB14147
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29470-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,intel.com,linaro.org,kernel.org,linux.intel.com,suse.de,ffwll.ch];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,kwiboo.se,gmail.com,oss.qualcomm.com,bp.renesas.com,rock-chips.com,chromium.org,bootlin.com,lists.freedesktop.org,vger.kernel.org,glider.be];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:dkim,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Queue-Id: 40CD3298288
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi All,

> -----Original Message-----
> From: Biju <biju.das.au@gmail.com>
> Sent: 19 December 2025 10:47
> Subject: [PATCH] drm/bridge: adv7511: Clear HPD IRQ before powering on de=
vice during resume()
>=20
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> On RZ/G3E SMARC EVK using PSCI, s2ram powers down the SoC. Testing ADV753=
5 IRQ configured as edge-
> triggered interrupt on RZ/G3E SMARC EVK shows that it is missing HPD IRQ =
during system resume, as the
> status change occurs before the IRQ/pincontrol resume. Once the status bi=
t is set, there won't be any
> further IRQ unless the status bit is cleared.
>=20
> Clear any pending HPD IRQs before powering on the ADV7535 device to deliv=
er HPD interrupts after
> resume().
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511.h     |  1 +
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 32 ++++++++++++++++++++
>  2 files changed, 33 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/b=
ridge/adv7511/adv7511.h
> index 8be7266fd4f4..03aa23836ca4 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
> @@ -393,6 +393,7 @@ struct adv7511 {
>  	bool cec_enabled_adap;
>  	struct clk *cec_clk;
>  	u32 cec_clk_freq;
> +	bool suspended;
>  };
>=20
>  static inline struct adv7511 *bridge_to_adv7511(struct drm_bridge *bridg=
e) diff --git
> a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/a=
dv7511/adv7511_drv.c
> index b9be86541307..8d9467187d7c 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -790,6 +790,25 @@ static void adv7511_bridge_atomic_enable(struct drm_=
bridge *bridge,
>  	struct drm_connector_state *conn_state;
>  	struct drm_crtc_state *crtc_state;
>=20
> +	if (adv->i2c_main->irq && adv->suspended) {
> +		unsigned int irq;
> +
> +		/*
> +		 * If ADV7511 IRQ is configured as edge triggered interrupt, it
> +		 * will miss the IRQ during system resume as the status change
> +		 * occurs before IRQ/pincontrol resume. Once the status bit is
> +		 * set there won't be any further IRQ unless the status bit is
> +		 * cleared. So, clear the IRQ status bit for further delivery
> +		 * of HPD IRQ.
> +		 */
> +		regmap_read(adv->regmap, ADV7511_REG_INT(0), &irq);
> +		if (irq & ADV7511_INT0_HPD)
> +			regmap_write(adv->regmap, ADV7511_REG_INT(0),
> +				     ADV7511_INT0_HPD);
> +
> +		adv->suspended =3D false;
> +	}
> +
>  	adv7511_power_on(adv);
>=20
>  	connector =3D drm_atomic_get_new_connector_for_encoder(state, bridge->e=
ncoder); @@ -1407,6
> +1426,16 @@ static void adv7511_remove(struct i2c_client *i2c)
>  	i2c_unregister_device(adv7511->i2c_edid);
>  }
>=20
> +static int adv7511_suspend(struct device *dev) {
> +	struct i2c_client *i2c =3D to_i2c_client(dev);
> +	struct adv7511 *adv7511 =3D i2c_get_clientdata(i2c);
> +
> +	adv7511->suspended =3D true;
> +
> +	return 0;
> +}
> +
>  static const struct adv7511_chip_info adv7511_chip_info =3D {
>  	.type =3D ADV7511,
>  	.name =3D "ADV7511",
> @@ -1439,6 +1468,8 @@ static const struct adv7511_chip_info adv7535_chip_=
info =3D {
>  	.hpd_override_enable =3D true,
>  };
>=20
> +static DEFINE_SIMPLE_DEV_PM_OPS(adv7511_pm_ops, adv7511_suspend, NULL);
> +
>  static const struct i2c_device_id adv7511_i2c_ids[] =3D {
>  	{ "adv7511", (kernel_ulong_t)&adv7511_chip_info },
>  	{ "adv7511w", (kernel_ulong_t)&adv7511_chip_info }, @@ -1467,6 +1498,7 =
@@ static struct
> i2c_driver adv7511_driver =3D {
>  	.driver =3D {
>  		.name =3D "adv7511",
>  		.of_match_table =3D adv7511_of_ids,
> +		.pm =3D pm_sleep_ptr(&adv7511_pm_ops),
>  	},
>  	.id_table =3D adv7511_i2c_ids,
>  	.probe =3D adv7511_probe,
> --
> 2.43.0

Gentle ping.

Cheers,
Biju


