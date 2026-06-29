Return-Path: <linux-renesas-soc+bounces-34503-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TZoDJhlIQmo73wkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34503-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2026 12:25:29 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0B86D8E08
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2026 12:25:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=renesas.com header.s=selector1 header.b=MG4NZEQ9;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34503-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34503-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4A32E3055DD8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2026 10:22:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AEF43B6C08;
	Mon, 29 Jun 2026 10:22:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011030.outbound.protection.outlook.com [52.101.125.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B9A3F9F5C;
	Mon, 29 Jun 2026 10:22:22 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782728545; cv=fail; b=BBGaKAPGa2gkayDWRmFKNM+yMHl1tjw1x8uP7Eev0XYv6uHH54PgNlBKsbunKcastP7i7vlsPATQAUpY/XKf76c4wEmQG01gHOSITHWhkpaZnpte9F7FMjKCTt6bPxA2N8MvhRy4IQ9OpV+W03d/akKIBZuwB9mQskpHZT5v5uY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782728545; c=relaxed/simple;
	bh=QB3tjpKoH7caFy00hLbtPa2sGbceX68fy8gyrw64qMM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=o6sXFYKxFDkAHpJl10t8fm7qffjnt8IvspbaHZR3Hb9MnbJAyFLrzf/1PgC2DUrYZ2R1jUmtIwHyzzJ2v811brgbfqv5p+BxRjhSALAaKHUWrZrgQXPOZibaYV5kSmVKvYaIKbJbz+essoYidzoty5VJuVXXN+VxMpPW4TWAsqE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=MG4NZEQ9; arc=fail smtp.client-ip=52.101.125.30
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u7n6dI7Tk4T3x3ZAuSLSKid92SVT7RsTKIZw+mHDbyrvBnAa2B30hvPuiksX+Mgk6PUvuKCMhV86YJ7tNfJ8oyJRukk9ymaumuC5XeX4ybFeasq8a3CSQYbsDnUcm9LpBgIisP175FmP7ol6SmvoB0E8+jj4Z5QlNrc3bZcLXrIeH2w7MOKledQ+jDibb4d0icNPedSNopLXw/qhtB5sy7SpCPK30ZCjUd2/xahps27S8YTyW90VNDWmeKoyePBypNcoo8Y8KafJmgX1+2hF4taBwcCEVcYAiVxFLa1DwXw51JwIuKlZAWFvBTQ5u/Qhhq0RMmEHa9FdeD0/soZUaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QB3tjpKoH7caFy00hLbtPa2sGbceX68fy8gyrw64qMM=;
 b=Plu7z9+egCwLB6g9fQ/eqT4j4uKfgJSIhWSYl66ChBmSKU0OzNA8JKS320h5hfyPKFPsHWwlcBOuldbKHgpTEOAsj12ObtnYearATS+utBvhVXJsXd9pSbgD4gLpRLfhV+YCLltxMEiRai/4jLgWixTZ+BVbPUHbfqDe5c/RKnY+iAQ180PW3/hHsDZr6NyC2h40fuIAtyrMV+A9tHDGFJ5DvxigpyDq3AQKyeLpPA2piqaK6jC4ONWrGx6Jaum59usyEtuvIAbCGdg0mjL+PFr4aqKQbcUZEIG9UhgQfl25peJ/YNad9sDgHxOpHTEy8rBYXI+VyVMGC6iYdgz3+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QB3tjpKoH7caFy00hLbtPa2sGbceX68fy8gyrw64qMM=;
 b=MG4NZEQ9jEGDePyYyarykS0frf1hgGHK70Gylred7BBw0S2fT6xoOeMgCyCYJSUxv8GnGJOGSY0Y5qtxdc8pkrYAzsSpiuHgwQWFUAn5TYpJGJbfc/2VL87HXoxFCa7lXF8SX9/B7g753km+GffnU6Qy64CkMN0O9G6dJRLkL80=
Received: from TYRPR01MB15619.jpnprd01.prod.outlook.com
 (2603:1096:405:29b::10) by TYCPR01MB8900.jpnprd01.prod.outlook.com
 (2603:1096:400:18a::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 10:22:14 +0000
Received: from TYRPR01MB15619.jpnprd01.prod.outlook.com
 ([fe80::a68f:5c9:9de8:4fa4]) by TYRPR01MB15619.jpnprd01.prod.outlook.com
 ([fe80::a68f:5c9:9de8:4fa4%3]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 10:22:06 +0000
From: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: wsa+renesas <wsa+renesas@sang-engineering.com>, Felix Gu
	<ustc.gu@gmail.com>
CC: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Mark Brown
	<broonie@kernel.org>, "linux-spi@vger.kernel.org"
	<linux-spi@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] spi: rzv2h-rspi: Fix DMA transfer error handling for
 signal interruption
Thread-Topic: [PATCH] spi: rzv2h-rspi: Fix DMA transfer error handling for
 signal interruption
Thread-Index: AQHdBYU3gG2A3yWcU0itbSVs/oBZOrZRCqMAgAALB0A=
Date: Mon, 29 Jun 2026 10:22:06 +0000
Message-ID:
 <TYRPR01MB156197735CBABA1699843B9B085E82@TYRPR01MB15619.jpnprd01.prod.outlook.com>
References: <20260627-rspi-v1-1-170c93ee14da@gmail.com>
 <aj6sEE5y62SOVsRb@ninjato>
In-Reply-To: <aj6sEE5y62SOVsRb@ninjato>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYRPR01MB15619:EE_|TYCPR01MB8900:EE_
x-ms-office365-filtering-correlation-id: d567f79d-38db-47fd-1fb4-08ded5c84527
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|38070700021|10063799003|22082099003|18002099003|11063799006|56012099006|4143699003;
x-microsoft-antispam-message-info:
 XdtULa9CLOOYfKkZ4BIflSrRjceN5I6oRY5RQGDinjQ+vBC+gjLFJEILV1I2PUbyu2IDgg1Q0O9ktoy8mjWg1YHPQU9RSby0QU2HVrvNtRfmGXCFM25+08p9gcBStjm29aHzjB9TT9XffY60mk54kkzYg1oqma6ZhvB96CshP5tTdZQPY5RS6V+1szZOIG9cntbjDaXJnjSJTFgW/w08xfVLKMI6cgtvY89OFwicyQCzcByMBJSU1i6SvuPmXjK3snS31J/9O8tNiUiuYAc0VnCVkErUuj5dqAVfdqjhUamVc7KsuN6EZolxZITp8kxxmILCOnmOgZfYxA1ev3HhMBqVHNza89OInLZmahK/C98GF8eMB1DNxtCfPh69MWYgaJb9wBLNvlxDt1qUSiXvNocHMxeq8ngPD7a+RpRvAWBLg6lf90FhphNNKTqYJqqG7B4sVHTWMJYUKOIKA/NMICt11pAfYh7LMalgd4ap4w/Fe6/QSpbvjnbJrcDipXOsEnfW/5InotZqVgM7M97kC7lXsf+HE5XoSzFFNbSUgxtSx0EyJq3+4m8uuSvZM8Ai5oRqC9VJnAH4njFzixDSR7Gi0mJGNqjHVLVtC98po2qGUjptqLfqdsXZoQqemd+SeXFEQHKeA+dbyXjIlbcsAjmNpj9oitlHI7xwscoBRgYleZO6LJ7+x6H7pX5M+yvZHZjOornfVG5qt8m+gdSq6siAVDI8BP1/EApzTFsppBc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB15619.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(38070700021)(10063799003)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?K/9JzW5oXrL/JWWHFcOi4VO3isOddaaEd6OVBwp/xfAyOQUpQTGi+dJQMfWQ?=
 =?us-ascii?Q?558Dvhe/sy1VbiOkgjn7TTM7q3StC1HUuNff2Cfoe5U+ghfMLKi5oOXqY3Yr?=
 =?us-ascii?Q?xMQg5OX6wSCrk+67s/LU02dIbmA8YCrHiUr0jkrQx3Lce4GrD7F4ZwGDsUE9?=
 =?us-ascii?Q?xOVMMlVq+bV2foNykJ/hcxmxdIDY//xbjGEdYmNqpHQlOrrzOZElgjI7z+eU?=
 =?us-ascii?Q?0OQJfPZCIQYUtx0cJEU1MhOmWBfjZRe+aKocs8hh4+1TUlgNyyxpaWGZcE/L?=
 =?us-ascii?Q?7cJBwDsw0ng8RWUOxZFNWpobOE3VGgwy5HI56a5LU6cxrClMO81WqxqchwOj?=
 =?us-ascii?Q?FLIVjzfdgiIWPOBn/NtNzarckMmplRdHYyeAs7RHbQ88F0Va5gaVwFothQTJ?=
 =?us-ascii?Q?1QcCVDlDkwlTM5B0BO5UcMKdGiHyEVmUXtH2VGvGj8jGFaVUYknptVmf+za0?=
 =?us-ascii?Q?W+D22LpYUX5O8vi9RGJVkQYEZY4nwlYZauG0q+wTfWIOQuWwthxNAQT1zh8G?=
 =?us-ascii?Q?+zi4WNjLtikYO53CbdFtIzr1dLzSxe10pEbe17dJ/JrkOI1vbRiFgWf36kJP?=
 =?us-ascii?Q?HhP9BE6aDTwJPVNblBA/qgTFtlI3L97HFwhyM7t5/jampCx718k9VMZy30zZ?=
 =?us-ascii?Q?CxwlB5zyzDFRdSx8rRJDRNDl7+RXmFCIM+G7hEQyUjKo35/b93i9QT1RKeWh?=
 =?us-ascii?Q?Xuo6Xhgsc2zJvOeU4TjoUPheo6TXTj4NKkKrZygsJMyzbDwqktideDEZPBtB?=
 =?us-ascii?Q?SitfLJmZVEVy7ylXYZVOUFd/n9FxglQjw4T6/V6SEwfQ//s5y98kO9fpsAzk?=
 =?us-ascii?Q?4qRs/pFluzjDQ4WuZCpSsSeXMD5Tp1oPkmJbIL7Rur/sO7rkrm9qCwlep74L?=
 =?us-ascii?Q?pUXrORJeX/ErS3pffXUb1SYFHUHw9MIdlHpQgrVJrEeDCRc38ZlrK4CFB4Dc?=
 =?us-ascii?Q?UlHRgXq4cTZ2etu3L3VZzGdSHb+MPqU+dOoCjvBw3QWDxMYh5Z4XbFSLhXQQ?=
 =?us-ascii?Q?O1GoG1LLMy6Y7ZqpCqMybL15Z7QMi/mVKU3Zh6QQnQEiyKoy7BrRcqquB2B1?=
 =?us-ascii?Q?aj9ox1WUofYR7Q99zdB5zAzPSdQekEwoDP+hnjIKAOa6poay/Y0Zcag1dYLc?=
 =?us-ascii?Q?NeBVVyejhkcAuQzpKdJxfCdArM681IELAM4zkdSVDlgFOqGX6pDpuw5ogrpR?=
 =?us-ascii?Q?qEPWkGmVMM/AsRj99LEydryXkyKm3l/2m5n14NV2aQtrdYHTJrsiQAWtyGpW?=
 =?us-ascii?Q?AcnH7vUQMD+29+bDohDTcDBkNv0dbPrngKsUP56dnHvhSgQmBj62VmXuVLV2?=
 =?us-ascii?Q?ZbnRFqqq63qV7KPFCnAtzouVyTmM3QOHEhMI8JZAcUByq0JgO0d5OhXOwacn?=
 =?us-ascii?Q?dOiWzeXrwaas4GVOQVVMI2UOtaNV6Mx/fyhxvSWfDipw6v2t23OFxrZee2mY?=
 =?us-ascii?Q?bTkhk2yyGEzRWqHz0XIiFCYsjklP1Q8p4suDSeP1t3FCPd/Bv4T+MC/nmSYY?=
 =?us-ascii?Q?myZG6J0gZaRBvz7AkYA4vj6+GO60bLMi1OX3LZ/U3t6V9A/gkWOPuB1wPzKy?=
 =?us-ascii?Q?ppqIuA5kjJqLpC8eTwzLK3m849tT+Ls2IGX2cKOgRv5DSpeTVN9VlU+Lsk1j?=
 =?us-ascii?Q?XWY6e2DKqLlCZiP2W8lzC6ngQ2a1lm8CsKPg7kZ6/VaiE3Oet79Cwk2Pggd4?=
 =?us-ascii?Q?6AjQ48zCIGLtH3+LFRO3Rttk8LUUHiZZUsm5m4YysilouNzQDjKLrA3lQl/9?=
 =?us-ascii?Q?fVFJ/xlgh0T6YY1Hr0LL0cCdj+ywRBaFyaYbEB55g5cc3sg8mktd?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB15619.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d567f79d-38db-47fd-1fb4-08ded5c84527
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2026 10:22:06.3404
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2pwCCatY3K9PWLhz51TDbZz6xcvc5R68A8mBGlBdWanLB5QwSRk6K8cy21m1zjbxQRSFgp/ElZzB8XWxORm0E1Zi00QnapboMkz1W+GgNMSnmrmsY1J7RU/qNXnVoIH5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8900
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34503-lists,linux-renesas-soc=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[sang-engineering.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:ustc.gu@gmail.com,m:fabrizio.castro.jz@renesas.com,m:broonie@kernel.org,m:linux-spi@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:wsa@sang-engineering.com,m:ustcgu@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[cosmin-gabriel.tanislav.xa@renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cosmin-gabriel.tanislav.xa@renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[renesas.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,sang-engineering.com:email,TYRPR01MB15619.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DD0B86D8E08

> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Sent: Friday, June 26, 2026 7:43 PM
>=20
> On Sat, Jun 27, 2026 at 12:02:29AM +0800, Felix Gu wrote:
> > wait_event_interruptible_timeout() can return a negative error code whe=
n
> > interrupted by a signal. The original code treated all non-zero return
> > values as success, which would incorrectly synchronize DMA channels and
> > return 0 instead of propagating the interruption error.
> >
> > Fixes: fa08b566860b ("spi: rzv2h-rspi: add support for DMA mode")
> > Signed-off-by: Felix Gu <ustc.gu@gmail.com>
>=20
> Patch looks correct. But it makes me wonder if interrupting the transfer
> has actually been tested? Cosmin, can you recall such tests? From my I2C
> experience, I know it can be hard to get the state maching back to a
> consistent state. Sometimes, it was preferred to simply use
> wait_event_timeout() instead and drop interruptible support.

Hi Wolfram, Felix.

I don't think we tested interrupting the transfer.

I can run some tests locally this week and see how it behaves.

Looking at it now, the timeout / -ERESTARTSYS path might need some
extra logic to put the controller in a good state.

I also think the patch is correct and should be accepted for now.


