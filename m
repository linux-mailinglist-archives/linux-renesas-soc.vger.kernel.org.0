Return-Path: <linux-renesas-soc+bounces-24358-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F3ABAC41F29
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 08 Nov 2025 00:25:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CFD904E4DC7
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Nov 2025 23:25:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DF0830FC24;
	Fri,  7 Nov 2025 23:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Z3PvF9vV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011056.outbound.protection.outlook.com [40.107.74.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8BF2ECE9D;
	Fri,  7 Nov 2025 23:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762557947; cv=fail; b=qQ5SQhHjLFGsLJZRPG2o52LWUR3mYk2CeKnU7Wp277I6qIfbgDLu8OkGPZDOkJhFB3zLexlAusdltirJ/4jkEo2dji86lEW+g56Fa/RU0UdXVrQ9YE5KwRhlTqUt4FnCI252cKmFCC8AN4IvuyP4oje/ymWSs3UthmpufZJIg0I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762557947; c=relaxed/simple;
	bh=KXRJ0XVU2mwMaVqoex0XM168sO73eAzKLsQmpOI0aOU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tz3am3SQbVWhjJqEkeOprtPdpDH5DUchhzSK/WIcsewzxajMZQcZ5D0y+ZlkmUlItDmQ7RWvGxZ26qPtJ80uoOcYI9Cb4OPTmNvI0KdyBG/+UThuP+nQaYtbDqrRxGjJZ1i4xV1koIRkjYVc5RkHw+mct2ziO1G+gfju7EKz8AQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Z3PvF9vV; arc=fail smtp.client-ip=40.107.74.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RvgnDY28ldHldvg0uBIgpc5oVbZQVeVTi/lXM2QBlQg6HsaDRQ8bd1Tsa3wiFG/oyIkXo5IXPJVJLb5PbNeddM8Xk3lRdg1sEiojVZo7n8cMhbHkjVnWwJdKBsdeKi7pyewsiQiOHRMjmrtWGDjjlhFjQGnrkSY37m1BizuFpUYmOp9nxZ1gGAK226/0ZMlxDNjFkRpa64lJs89hjflktKlg3FM7MXiMHzfYtyJqx1yQOpHUDOJsWfjpVnjRt6dIddG34reD2mS2UUDKUcq9gcA7SpGZGC+gzX/fLHZ2Di8Mr3DJVr1Vm+JyVnSe1N44KlC18k+H3ufngmRV9fDDMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9KWB+qeKRoXtfvRpIY/8yPkj0JwFbVhl0k7h4vHLBkI=;
 b=EsoiZLob0ORaM5wYLRyWBVfI1j4b3+quKpkmR+P3unng5GablKSKfFKmrfaPlqGltZUDRBggqJqsYU5QcsyEzMxUxZNep4wFR60owmt/MfvQOZdJt469rJj9WRECFkK8H1GnG8NznKJQC7PR/96h7FzoFtpHnoGtMmoVJ87uWQatEIdCjsuabkTeUna7SwI4bPJTHk7BWOxBSDIPEvwDPUOqjZuHlCdpKSvDNTKB3Q0eRj/yiElXy9MMpv0unTp5ZyJYKI3GyBXp7O36I+LMfW3Hd4FtZ1Wdqx+ZlYQtzU//fyqudT3LkGEdtx27GgaQvTmGI2IMfJt0+NYLb72hyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9KWB+qeKRoXtfvRpIY/8yPkj0JwFbVhl0k7h4vHLBkI=;
 b=Z3PvF9vVDpZCBk5rWxLRaNW+gA8e/YX5z4QDvEcAuRDyTazS/t/YVRIdpWm18we02C2yrf+F97H14Sp93QpqFIR/a5KFDuTvB4os1nweAt8od7uwpkMHCX2DmqlnEcMGyHiat02D8faynJgJgYJ8Qc9FjcgLVmdvB6gJhcpv5j8=
Received: from TYCPR01MB8327.jpnprd01.prod.outlook.com (2603:1096:400:15c::5)
 by TYYPR01MB12306.jpnprd01.prod.outlook.com (2603:1096:405:fc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.10; Fri, 7 Nov
 2025 23:25:40 +0000
Received: from TYCPR01MB8327.jpnprd01.prod.outlook.com
 ([fe80::483a:c2dc:6c8a:420a]) by TYCPR01MB8327.jpnprd01.prod.outlook.com
 ([fe80::483a:c2dc:6c8a:420a%5]) with mapi id 15.20.9320.008; Fri, 7 Nov 2025
 23:25:40 +0000
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Hugo Villeneuve <hugo@hugovil.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Biju Das
	<biju.das.jz@bp.renesas.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Hien Huynh <hien.huynh.px@renesas.com>,
	Nghia Vo <nghia.vo.zn@renesas.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v4 1/2] clk: renesas: rzg2l: Remove DSI clock rate
 restrictions
Thread-Topic: [PATCH v4 1/2] clk: renesas: rzg2l: Remove DSI clock rate
 restrictions
Thread-Index:
 AQHcTqM02+OCahzeqkGZBdprKCVrd7TnaoQAgAAejkCAAA1GAIAAHs9QgAAWXoCAAA3QcA==
Date: Fri, 7 Nov 2025 23:25:40 +0000
Message-ID:
 <TYCPR01MB832759A2410465D46E7095DC8AC3A@TYCPR01MB8327.jpnprd01.prod.outlook.com>
References: <20251105222530.979537-1-chris.brandt@renesas.com>
	<20251105222530.979537-2-chris.brandt@renesas.com>
	<20251107113058.f334957151d1a8dd94dd740b@hugovil.com>
	<OS3PR01MB83195AF3F1964548E1512FBE8AC3A@OS3PR01MB8319.jpnprd01.prod.outlook.com>
	<20251107140750.00bf68e4b2f5354015e65ad4@hugovil.com>
	<OS3PR01MB8319E496A32EDBF5719BAB478AC3A@OS3PR01MB8319.jpnprd01.prod.outlook.com>
 <20251107171809.6033526ffe5e57ec72bd4f96@hugovil.com>
In-Reply-To: <20251107171809.6033526ffe5e57ec72bd4f96@hugovil.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB8327:EE_|TYYPR01MB12306:EE_
x-ms-office365-filtering-correlation-id: 04b6f9ae-2d44-4dfe-391f-08de1e54f713
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?4eUh9mdndeVy+7EL75FME8mQ0RUdmUshLH9H00E+77nJ4nXE0q2rb8O8WfQ7?=
 =?us-ascii?Q?UUtaEYpqUTtAorlPyFm2+1Y93KnMaq095TJHzDBg9yz3hPLMCbhViH2hPgTm?=
 =?us-ascii?Q?TuLG7ci+Al+SdYDcNnP5m+FyJOSjVRcvfcvb0QpLAJfOQKgG/5B1Qz1KBzBN?=
 =?us-ascii?Q?TOEJvg0o84EwVCpFYZI3QzNmfJBPkmsKIUTIAaTgcxhehuZpM1qM+1oTei3i?=
 =?us-ascii?Q?EhGNsYNqH9fobpvV8Adf+CkF0G52FPPD0XzX3CnWBdg2qXr3Ph87YcuNVlQK?=
 =?us-ascii?Q?4xslmnLXy8ZvGsRxvLKj7nvlR46q3ClodRYV8O9xmMqYyEHkjp6dHaFgF646?=
 =?us-ascii?Q?5kZvHeAJsNiMQEF0X5NJkdZXFU3fnMo85D0hj00xh7WsgoMF/AJ9tpnpmZig?=
 =?us-ascii?Q?0/5R9W4GA+aXwdoiC/ZQnHsH6PoAeOpKHvTsI26oEnxtPEM3onjyJbn+2HpI?=
 =?us-ascii?Q?YczR+8g7G+GAZaqaKSt0YJotbJsVzPhIfwpdufO2vbCnA/IgRHXuOgdEAMfo?=
 =?us-ascii?Q?Yn6WOIpYRUE6Va2SDeTOlZjkTnKJR/5znmK38eLOEACDwbFVxiQPXGQQ6M/F?=
 =?us-ascii?Q?NG7v5de0I8ZtLEjpJqYZgT0w8aNtZleSHjkKHFMimdFXv/UMgE80A56aWAcz?=
 =?us-ascii?Q?g+NqsaQAfMKS+TcTZD9Wg3gfCsPCzAB6bkFPqq3UYO3/4f8Dss0/Xaxw+2WI?=
 =?us-ascii?Q?4okLW8S4Dbf599OTBAp1h/iWTLgkNh+Ps1SoiciBH+njl9HY33lQO0BFVxKh?=
 =?us-ascii?Q?aXaX1RAFdX1o1SscRWtFUfUXH/ItAtDUyBd3J2Z7uDY0K5Io1xQMO9i8N1az?=
 =?us-ascii?Q?9g1MfyAI7lnqO3PUVy74EXEZh81YFFM9SSGGgI+rX9XsHU8J8fPcLuqV8Si+?=
 =?us-ascii?Q?+ZrMbMOv8Mk9VBYAhUR1VrBBPHeOPujgeBvltA65OiDkhiUUn1puW4qJWX4H?=
 =?us-ascii?Q?I9RzmtMF4Oi7dlR+8WwSIuQmtZGL0HmJFOV+I8wZ0STDXa28pzA3Toeq86sQ?=
 =?us-ascii?Q?hz3MMjznsRHh9eWyI3a6B7jkct2514XMUI4B/IKnFfD5Q4wix3sf7xl5fl7t?=
 =?us-ascii?Q?m9p5b+myF+rIETMcLmiaNG0WLCkDXw3yLzM4IG6VebXhpuo5biWVtL7pUTO1?=
 =?us-ascii?Q?X61N6CJFDaJsPE19nTv8PBus1UP4yOIioN0mN3lIPocdu1KpWClbf708aUQi?=
 =?us-ascii?Q?8APjZAT3vkOpYzzhyTY8jlHnwSLwGic8dVYY8aJKJsdBGsIV2HH/6/HfYDWf?=
 =?us-ascii?Q?VVgeuGLkait7NWIvDyxrBUz64jLvRDT0nMm1duvi3KiKfvuR+CxIaleO1jhp?=
 =?us-ascii?Q?0iiBiy//M76KISLElojlATDU3xMsEY6l0zCh5ObjdQRoT2g8Htc3iQsNJKz4?=
 =?us-ascii?Q?r9xKIsGj8xizdOosqCXw5uJYmhuIb0PW7ZdtdsaryYw8u0t1XOpM+D7Hp9u5?=
 =?us-ascii?Q?eYNSI5CHirl6YVVyl8OMaBpSCajO2xO+b2ARw5xbpKnFT0Ved7Fxf9RyOCp+?=
 =?us-ascii?Q?ygRymR2FLZvX6o5LpJschOS7Ox2oLf8BJp1F?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB8327.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?f5WtNYC3q1C1E3uzABJCNHG1CM83uzCw5vTkdNMpkhEY4F7y3xrLr5nWjdm8?=
 =?us-ascii?Q?A6XbRtDoJVKTdUzjXFDn897CdbTo5ZC0u5VPFTuGdZTNkfyC98ppv60Ht2mI?=
 =?us-ascii?Q?XVVsB40f+28zmWBjs82AZWL5vVXWJC3rnp1FfFSgb5PATOmQD9c8c0Xj2WU0?=
 =?us-ascii?Q?mD00liSTnSqMJsuHwu+RCA8H17QH4M7VYs8jomGx10R7sg/VQ7rlHJtKXA8p?=
 =?us-ascii?Q?ucxMSazNlqv6euTN9LXWBj/8hbHnN705qWCAlEya+1DKbO70I26z2i1tHON4?=
 =?us-ascii?Q?+9+o1b+qKP7SHqQc5u/h3f6DPSqaQ+fkC3QDZ22+oVdAEoHLs4DWb330I14h?=
 =?us-ascii?Q?KPH7LeIAwWyrnXPcuOaK2HfegnNDiu3RNXSahUEgPpkYbxD5KkdlXF1KFxM8?=
 =?us-ascii?Q?ndgSL/Xy88Lr1TNcx/13LTktGvCyEevhuzOlbIqOTOTiKNOzJOYnF56WZ4Un?=
 =?us-ascii?Q?arUl6Cdb3D8wQysG2bfKdB4Tl74QZl1OmH39X9OxRzhl1/xiz/f3qNkkN4lr?=
 =?us-ascii?Q?eHQ2xkLskVDllaxpZL1HvOFh+/TKp7K5uASMEXS46xI9Lo6ngjLobi2hPg9o?=
 =?us-ascii?Q?MstGjiDcwAbSNGKighMe5wq91Ogj6e9gIwGy3SA+UThZp+uZjf1w1Hu7jzyk?=
 =?us-ascii?Q?J7QDl8T994e6w1/lbgUTZpww53NK8BAZ8geGYwkxtqn7jZGzWZ1RFSX2h1dc?=
 =?us-ascii?Q?BozSH5DUiO+LlN4P0+biAX+MGF2ZfR86NoMYcUeZAOTxo7AIYs2XRC1TrTjZ?=
 =?us-ascii?Q?9pQBSlUgi+Ovxg0nfowzI4tqWbjIIrOeczLqEzBUfy10DzDGYgyIMTB8MYd0?=
 =?us-ascii?Q?UDrDpsLzyL7jWEY8VjkPuSbU1LEw1QsapV6gLVZevgoDtl2B8WspvGqn5Sew?=
 =?us-ascii?Q?dgIfufhiSwestsBPeIfrACIwIr2JxtJchYre8S1Obah4jjiTyvO2tQUBCKzU?=
 =?us-ascii?Q?qjmGdux92bRa7Ki4HVcuv6I1ZkB60XVhmjUB39BRHsmJkPhLHz0AlqkWhVFX?=
 =?us-ascii?Q?mgDZwNAYCRB5SBy4Y7IeKcYi9AEoL0dUO7sasgpxIibODd1UWdsLwq0m1LfY?=
 =?us-ascii?Q?/2JSOZxZIKwyjy2DbSKmoAbtFo4UqV1Xe3vPGyTyq5YdUn6eUcI/yd/dbE64?=
 =?us-ascii?Q?wrTHZUAHOMxgqPJ0xfHc47Zm6fkECSFfBiGyNF71aIWPmoSfWHN0alG/Cxxy?=
 =?us-ascii?Q?Qy7MTPdm1IxOMCpcUDVYdT5ZvfNRBWi2UaFnMX6iwUJURVI3JDyzjXATNsDf?=
 =?us-ascii?Q?1uxXiPHITdZLMHAKvtfVYMnz5rTstd4PbnCm2dfTRWY+gjin9ChV1wpuiZku?=
 =?us-ascii?Q?oeUR6+AzkGnktiCNh6VnBfOHSEehZSP2tGOLqjq9QuYNcpPrsyZGPDvDYM/s?=
 =?us-ascii?Q?2n1PPbNG3/r8Ga+JCF/6/A9hCtCiJymJxu6ly8OXB4jNXEmmB2R570SyZECX?=
 =?us-ascii?Q?H9kXPhnguw6y2TisF+s6CWiWGA5LCvsgez7MyAH7Ep8OclN6ctJopvcjV63k?=
 =?us-ascii?Q?kI9HQazIzBtc8F8Y7rjKRSvBXdCRdU6GVfXQ9JX8xu7kVRAkPcythSp96nLA?=
 =?us-ascii?Q?6d5SsWl8eyIm08YZE4MNUSrBBdiZAHc3Ls0rJwqO?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8327.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04b6f9ae-2d44-4dfe-391f-08de1e54f713
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2025 23:25:40.4313
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g3SYYR7BT6Qn4DPjnn0gFGjRlOMZZROd7pP/CjWOeRXECwWeYHQlDh21oPXzI+7HN1+E5udysYWgz5HcuaBO5n7l+dCr8Vc3yENVsTWxap4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12306

Hi Hugo,

On Fri, Nov 7, 2025 5:18 PM, Hugo Villeneuve wrote:

> > > +				if (params->pl5_intin < PLL5_INTIN_MIN ||
> > > +				    params->pl5_intin > PLL5_INTIN_MAX)
> >
> >
> > And if you want the same behavior as before, shouldn't the comparison b=
e with "<=3D" and ">=3D" ?

> I didn't see an answer to my question/comment about comparison with "<=3D=
" and ">=3D" ?

The hardware manual says:

INTIN		20 to 320

So, both 20 and 320 are valid values.

Meaning I only want to 'continue' (ie, skip)   if ( x <=3D19 || x >=3D 321 =
)

or rather

if ( x < 20 || x > 320 )

So the original code of...

+				params->pl5_intin =3D (foutvco_rate * params->pl5_refdiv) /
+						    (EXTAL_FREQ_IN_MEGA_HZ * MEGA);
+				if (params->pl5_intin < PLL5_INTIN_MIN + 1 ||
+				    params->pl5_intin > PLL5_INTIN_MAX - 1)
+					continue;

....was wrong.

I forgot to mention that in the patch.     :)

Thanks,
Chris


