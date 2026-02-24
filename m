Return-Path: <linux-renesas-soc+bounces-28429-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANuiE92unWmgQwQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28429-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Feb 2026 14:59:57 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8481881D0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Feb 2026 14:59:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7902430634FA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Feb 2026 13:49:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AADB5399021;
	Tue, 24 Feb 2026 13:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="q8IetM2g"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011067.outbound.protection.outlook.com [40.107.74.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D27F39E6CF;
	Tue, 24 Feb 2026 13:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771940949; cv=fail; b=n4Itfpmmi1Le8t+Ag1yx9Xa25e8Xd/37SQHyZTPnaqqPb47jG073nq3cg1ZXROQORQNmIvmUXK3L0+yvDigECO62OHXvQ8QB+nhOIm9bS13NL7ym8kHmUIjKPgX7SehAAKnj6abkhk8aZuLtdy5vDQnFYKHeJq8JzwTb4GpZYWY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771940949; c=relaxed/simple;
	bh=OjUerpaaR/XBNkFEify00hA5w4s40vQ8zKkZaYLX6YQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=J8da9XVDfrLvn1bTsPXEHGLXxte6vrlcAl0mQgrOPkEzgjeGMqxOrKeIoEQ1JNepxDrMr7l6TbOPNQ9s12w1VVugWUgDyYH9wEyVlqmvaSylEqQ79zsCZBRL0JERkmNDj/2O5DNZJvPvfDRPhlt1BnxAH5OT+8utWQUa3q8epjA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=q8IetM2g; arc=fail smtp.client-ip=40.107.74.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BOxh/zIEol9k2OeflftBBvRXJxI+jmzhw+lSIpLqx+YaX4QoI72bLAV6DSoQ3UeCBddTZKxd2Z56ja8xhBXsHLN8OaRhUYN78aQwaTf4wM1fXOO9vqtZzvO0UkZPB2ao3d5m1FzgZlfvCqMk/emsGyJXLWM2zCszPw+lrd6urBQZcqVOFt5UM6jAHk1yCKtDDzzju/HibtAV+MJjyXOdHYHvjzeADbpjJHB/ZKVJA6aVXi1WOgtYtOJXFyeEnBvIydFzYPEpOFMazP7mC+qxQdfbPClTaiTwbzgMCBFJQFxTO3tGYwIYG7adYirhicKoZIa78r7zhFkBMwBDUivaOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gRzH0ovhB/8DDUcySGzjjWi1KtiBB2Een5cQdABNYHw=;
 b=BPmdB4b1n2X+NHOThK7O6BoWFKIbau9uZyrjHnu08SMqf9Djfj/xPKBM7COe2js6TgDf0SYN0GYDVaI1tmDlihRyPY81pmZ2Hg0lsoXUvYnUXDsg7qMoS9dm5gDBwavs0R3yH82IJvxFiCUoKy2RqEny8Q10tHj9po/jI/fcLsddeyJDq44l4pV5rZFauDlblduCi2wT2Eda1cXORVBVXwOujrmUe1vBFt/PFyfL1VlmPHGjg66y5Qf0/a4yiJVADKCTUXNlCOUw+vU8dvAQ6Z1OgE+wGRJ9AccUalnUdy8C6Mfs/gv8nih5byFBVAQthGXdzs6OlGlWkjUrv3nXcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gRzH0ovhB/8DDUcySGzjjWi1KtiBB2Een5cQdABNYHw=;
 b=q8IetM2giNpo/Il7sKHl2Xkykhbkqih6fXiOWE2f7CDMq7mmWHbPsUb8yOxqX1fapx8g+KQ4Y6AgoCkmwGYYDgXH/SgHDmFCLbHWf/yJioB+IXdI3CWTpa/w0cbqtdvaKmoQ2G0cA92amuE68LVM/f1saCmV5A93Se/AR0fYLsE=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS7PR01MB14361.jpnprd01.prod.outlook.com (2603:1096:604:38b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 13:49:05 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 13:49:05 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>, biju.das.au <biju.das.au@gmail.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 4/9] irqchip/renesas-rzg2l: Drop IRQC_NUM_IRQ macro
Thread-Topic: [PATCH v3 4/9] irqchip/renesas-rzg2l: Drop IRQC_NUM_IRQ macro
Thread-Index: AQHcl1oiDzZx08cphEugQ4MV7mjhObV1jssAgBxqkXA=
Date: Tue, 24 Feb 2026 13:49:05 +0000
Message-ID:
 <TY3PR01MB11346D71BA9B86D8D3EDA6C488674A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260206111658.231934-1-biju.das.jz@bp.renesas.com>
 <20260206111658.231934-5-biju.das.jz@bp.renesas.com> <878qd6147f.ffs@tglx>
In-Reply-To: <878qd6147f.ffs@tglx>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS7PR01MB14361:EE_
x-ms-office365-filtering-correlation-id: 98014bb0-898e-4ee1-0d8a-08de73ab79d7
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?TyDSe1egUQSZLFfCsjYIm7bL99PsBaGH8192M2CfbFuf66MDequipJc3n9L1?=
 =?us-ascii?Q?TqbwmmSE1eLnlU/mWxoYT4ci3FTjG51aP6bhFtAfVsMuqDfqAq0iDItGr/KY?=
 =?us-ascii?Q?WqmFXKWz+dodYaIoXK74u3j5+GHhzsGuTwh8dP8M7FiuSYyrvThqa5o12Wpp?=
 =?us-ascii?Q?yzNeY7ji+QpWuxwWq9pA0DO5PFP1hX3dne7N2M1ujnbk+vx1dr5jVJl1DRZf?=
 =?us-ascii?Q?YXMVEPjxoPSmI5DS5Q/w0FOqX5OLdKl8DhHvl0yZAPGI5Xf38BgZWc9Ufxv5?=
 =?us-ascii?Q?8+uyAYkvQlGUQuC+O+zslkPkkddm6b9Cx/XYcPUh11z9VajAbfvDa2sXmm/c?=
 =?us-ascii?Q?mZUAka/keNc6Bkvfdj6A5BHGpA4Pucb3UR5iFFr8Eg+cYPoVkNjhmPAexhiH?=
 =?us-ascii?Q?m4jNW+Xnr1g5ScM9WIUOF27dOK76SWY6UWlQzVC2uhJYOxOomsrp8GBFifm/?=
 =?us-ascii?Q?ztbLOHOfQIS+9kDK6xvTeVQhkePk8bDvfGJmlAAG2NaimPXwjKgbg8evhn2H?=
 =?us-ascii?Q?V1/rFXbGtPwUCR9/h20ktwPQj7NFN67leE7PzKhAtz/4pMlPKaSEqTlL/t/j?=
 =?us-ascii?Q?aZcBKdJG8melg25wrlYtHlo2pB5xJ7PufUx0K7EBQ60c5+qykPaVf/lme4Mt?=
 =?us-ascii?Q?pysJR59uwqmdsDraF0EAHoSdVBOrn5Y2v3otHFzbXm8d5q3x9GzFLmYtFPgB?=
 =?us-ascii?Q?y8wWr/BwCoZ8vD9aJ75/E1x0Z6GB5fBXsEr4e9Gm9xQCMlE/YSFnrfuW5G88?=
 =?us-ascii?Q?bFdqcLNTPzEI0rxwmPpGetnKqcNIQwuNoF1EGHkMtsJQ6RGx1L9T6Uq1sCae?=
 =?us-ascii?Q?BrPNfoS/5gaT7tEY0LA/GgYJKNRknr76STrFopBwXgp3j4yxP/QSG7ZfyIYI?=
 =?us-ascii?Q?YSUYJwxFtDMCvX+GfTzGBlg7cyIszJ9RTWskFsDRb6RqzqNnxzASyf1XiBOz?=
 =?us-ascii?Q?hIdlrc5cGYP9mCrWbCdxhWyVYBhLwQv4aZXMcM9cu+xNmq5nqFG6IirN+aVg?=
 =?us-ascii?Q?Wn387wEnZ57ejD4eBS9/2roqum4UXKvR0dyQnBo9/ECVm0Y540krQgN9hAgB?=
 =?us-ascii?Q?sqLnT8gJWeyCqvSuCNgy3vvE2ibcYq35/aBImY7kAnOQ5F/a36t8Sea1n7W2?=
 =?us-ascii?Q?rgMZLVOXYNiSPrCoBq5hhP7JlBeJRG9QLBit93SGLbW8iNIVYxDvMTd+vxSx?=
 =?us-ascii?Q?Ye+sQd3iSdgQ1B26gci49sd9Rc5yt9erJblBrTsdSH/CsK2m87H3IROx6hPE?=
 =?us-ascii?Q?EP0t4fQP8fnKW4JBLUSc3PgnY6yFGer6ALc5QiW3TCJ1lh9+53GUj+M/EgTI?=
 =?us-ascii?Q?feVTEciwgnSbLPfqK2c+j4MhEWnOWo3ufG90NlONcG+5bMsHWVRMV4tI4e9V?=
 =?us-ascii?Q?+/FvPj+A6qAzF6CBnZrlCurA8rz4CUvMPQgp5ItjQlDM+nYsT5vZkajTIcgX?=
 =?us-ascii?Q?+zVnkadkMJtwyMpPIdUGL59cBvUepRjeZpnOtWLya4342ROfF9ZppewYQo5R?=
 =?us-ascii?Q?2waXF0sAmrJVLNvMs8XxnFYWw2V06RZtOxVVlaUHY7TJpwaYtEz32rdXAV6x?=
 =?us-ascii?Q?pbE0Q2fqyHuOhfktqvjCxU2NZ92inDhCCNKj0jHIlAXQ3Bg8SDqMQwZ6yaU8?=
 =?us-ascii?Q?MbRVHzmm8n2HcdleqTkeVJU=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?dC1fjJ2KYv6xi6D9hMaAetpN8gt64uyqpIuuB0XqVw29qK2SZcFEKLfR1Twj?=
 =?us-ascii?Q?hkyTBaGggnq7G4N7zrCVZKfM43tOk6qBrwEx51E7Fd4lsx4RaVx4svLQw7yl?=
 =?us-ascii?Q?R6Cckme/Ct7XPww8AwGZpZY5PotZeLJo+zCfaUUx+0santVIwcNpqEH5gdcU?=
 =?us-ascii?Q?2EhOKeArV85mt3BUcP/ihIlDHwkAxh8M96aIk6VFHqt58/wAcW7qLYWLWf1K?=
 =?us-ascii?Q?J92LyTZQK2w4GXISuUsJ0oxE9sQss699jkg6PfueQGuZlgpDfvThxw0tj8Zn?=
 =?us-ascii?Q?t4WhBcwlSGyc3yyVcUWZsuiVdCRwtOC5PHkf0+nRhXYn7ySbdrN2pB2GtEKL?=
 =?us-ascii?Q?Jkzj344q/tYdmvahef3RDXspspvu7ref50ujrWFZ82IrvuQKiA9lsw7STSdG?=
 =?us-ascii?Q?wQJN5qQX2OIqRZ7Z2LrHmSNZHEipKt5Of7XxJFyGPlnnee41mXiR1IixbC6r?=
 =?us-ascii?Q?RxR6NCoIJ/WFofA6yCDk6+0p6wg1MwHpBXBIsmeKFaATT0ojLAoIuoUnBp74?=
 =?us-ascii?Q?mtScZNMuhvLyz/4YAvzkQoFSnHeRB5CxOfMKa6EbzkZDq8ZH33TvYhs8PD3M?=
 =?us-ascii?Q?fx3A+Zp2KVNowMf++j6r5EMUvysLYxDV1i4XbtbCVOOwy1g0RDyWOI8iIjz3?=
 =?us-ascii?Q?ExihSZhX7ooIfzeoi65qIooX0oAyKM0an+zxet5TyB+WXfhGxaOVWUnqCsNb?=
 =?us-ascii?Q?nREID9zf0WDv4/PrwCKlQc9Ihq1Xetkj/rymr3KAobMh5qGxa/vT8G10vzhK?=
 =?us-ascii?Q?J6dJzcFwq58Sg2EHhQyN6ZIpY2haPhfxFgz74yAIjdPG86iZA3ZiIuEWe746?=
 =?us-ascii?Q?fUsUslH+CpzR2Cla+jogxIrlBzlJuTN1IZ8o2Q9BTAE97tDOlXQPIzu7A4zH?=
 =?us-ascii?Q?f61bPJ6CcOXdvworP3MmlsSsH/iocRc8fPGXSKuy99IupXJLJkcVV7njEgG+?=
 =?us-ascii?Q?8MJt5mpIjF42Y/UalcBUggoy8kH2+m0rlNYzloYxGrMsHIQt6R1DeVSoMaEu?=
 =?us-ascii?Q?w8L3hM6ha/sfTQoRHboej8bGnCmzBgvIP+Y7jUdM+dlMmwjBCoG//nkmZoSo?=
 =?us-ascii?Q?a+r+J+ddn0sLXb4zAMgPeLBYejE6jLC3xEFKACnqAXXdy7MnPCy8l972QUr4?=
 =?us-ascii?Q?TYMekBp8U7N6ujKpxQbPDFvYUx0hiPeZD2c9Z33Iv8laKuk276lnrLgZv2Ml?=
 =?us-ascii?Q?t3OZPyhz0PycXaNKTc19n/CivPdVxAF9O/yvjoXZ3eSTSXjCF1aUAtoKvpFe?=
 =?us-ascii?Q?nr5V3wMlo5BpLkk0G9PEQXmQsO05egFy+EN6pGA0GJaAAtOFp/xC4y9eGH7y?=
 =?us-ascii?Q?GEBjMr2R/zkycX5FBvVcY7Qk1JPIoODu07iyoj3/GUQ9/eZ8ZDbu7URMvcT6?=
 =?us-ascii?Q?Vry2YwOeWUu7AwcvRT+gCac8r2LirpC6czEfmFW7v7/VLrMjckEJWSScZkQx?=
 =?us-ascii?Q?bTdzvm4u/ypnoqPziBtSUY1G4ktavXcMGiekpY5bI6QOp/Y4KjM+ynlRyay3?=
 =?us-ascii?Q?ZY+FbeAdgfybBWG8Mmb2SjCsJgJNtnKOT9CZNylDSkgPQrVetiWljnbyJFWv?=
 =?us-ascii?Q?fOD9CRRQx2Bs/6PJTpTRp+E/imHd5vUiBiyYFy5UADWP+hhC+FqF4MOaXO0h?=
 =?us-ascii?Q?0EXWhKiDCNubgqUgQmyyzYmp+hf+dT0EIOZ1JQ3jjO5XdY4gkdMac3zMoY+B?=
 =?us-ascii?Q?mg4NQ9vev3u2rfWtHZn9xYC9OZWihAGKa8ldPpUAdUfiubMtgU5SafkrLxhk?=
 =?us-ascii?Q?3qlIVa0QFA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 98014bb0-898e-4ee1-0d8a-08de73ab79d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2026 13:49:05.3391
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aRyK1V8av1PSQOg9WMKnob3KR2/poO1gkccW15DiH4oWFT0rb1FwyEgFH/0F29chR1o6XKYxRk9A1qFu4ouj+HKHKzK7bD1F6N0qc72HUXI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14361
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-28429-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,glider.be,bp.renesas.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[7];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 7C8481881D0
X-Rspamd-Action: no action

Hi Thomas,

Thanks for the feedback.

> -----Original Message-----
> From: Thomas Gleixner <tglx@kernel.org>
> Sent: 06 February 2026 11:50
> Subject: Re: [PATCH v3 4/9] irqchip/renesas-rzg2l: Drop IRQC_NUM_IRQ macr=
o
>=20
> On Fri, Feb 06 2026 at 11:16, Biju wrote:
> > +/**
> > + * struct rzg2l_hw_info - Interrupt Control Unit controller hardware i=
nfo structure.
> > + * @num_irq:		Total Number of interrupts
> > + */
> > +struct rzg2l_hw_info {
> > +	u8	num_irq;
>=20
> Odd data type. Whats wrong with a good old unsigned int?

Ok will use unsigned int

>=20
> > +};
> > +
> >  /**
> >   * struct rzg2l_irqc_priv - IRQ controller private data structure
> >   * @base:	Controller's base address
> >   * @irqchip:	Pointer to struct irq_chip
> >   * @fwspec:	IRQ firmware specific data
> >   * @lock:	Lock to serialize access to hardware registers
> > + * @info:	Pointer to struct rzg2l_hw_info
>=20
> Why a pointer?
>=20
> >   * @cache:	Registers cache for suspend/resume
> >   */
> >  static struct rzg2l_irqc_priv {
> > @@ -81,6 +89,7 @@ static struct rzg2l_irqc_priv {
> >  	const struct irq_chip		*irqchip;
> >  	struct irq_fwspec		*fwspec;
> >  	raw_spinlock_t			lock;
> > +	const struct rzg2l_hw_info	*info;
> >  	struct rzg2l_irqc_reg_cache	cache;
> >  } *rzg2l_irqc_data;
> >
> > @@ -136,7 +145,7 @@ static void rzg2l_irqc_eoi(struct irq_data *d)
> >  	raw_spin_lock(&priv->lock);
> >  	if (hw_irq >=3D IRQC_IRQ_START && hw_irq <=3D IRQC_IRQ_COUNT)
> >  		rzg2l_clear_irq_int(priv, hw_irq);
> > -	else if (hw_irq >=3D IRQC_TINT_START && hw_irq < IRQC_NUM_IRQ)
> > +	else if (hw_irq >=3D IRQC_TINT_START && hw_irq < priv->info->num_irq)
>=20
> Ah I see. To make this more expensive by accessing yet another cache line=
. Simply embed a struct
> hwinfo into irqc_priv and copy the data into it at probe time.

Ok, will simply embed a struct hwinfo into irqc_priv and=20
copy the data into it at probe time.

>=20
>=20
> > -	if (hwirq > (IRQC_NUM_IRQ - 1))
> > +	if (hwirq > (priv->info->num_irq - 1))
>=20
>   hwirq >=3D priv->info.num_irq
>=20
> This -1 logic is horrible and error prone.

OK will fix this in next version.

Cheers,
Biju

