Return-Path: <linux-renesas-soc+bounces-28300-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GzhFbWAlWlOSAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28300-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Feb 2026 10:04:53 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7493F15468F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Feb 2026 10:04:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CD3D93003821
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Feb 2026 09:04:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC2D7311971;
	Wed, 18 Feb 2026 09:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="W90yctvY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010031.outbound.protection.outlook.com [52.101.229.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DDB2F5A22;
	Wed, 18 Feb 2026 09:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771405487; cv=fail; b=HVSiMEJD/wRoffI5Dv3CHrHqbGo/S8TVWtHUBnXBNHV73FtK6AzIuD37i5eORfTylYecZKBQCDP5ATnpVwwvFFqx4aBVIQn+GKdWhVlUfPby62zUWlrPcF92x3bV0hDh2OFGYa/27yO0+x7arE1hLX/S3CCYxWW1YYeKr5iThnk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771405487; c=relaxed/simple;
	bh=nog+rk6krFAjW2Ps5scNZYBVjIfjIVTZmigeJ7lMM84=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MqNqQfYIo+i7r8MwYhe+NrgcUfH0RCZZFJUJ6NUKX3426Ze6G3cuCD9QGdMMtSUOtwY97nNCHEL7ck7BmVN2thLp9JdhE/M6cyRpoUJp4d+tGpo20SPvxE9OZc+QLG3WIzi4DHJNzSlG/QuJ5T/FvPIcBD08oswFqBSu0WOMFH8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=W90yctvY; arc=fail smtp.client-ip=52.101.229.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jUPYEcR0St//5zWb9UeaQcwY4DUJVRJU/5NVXw5i+dw10mNKjzbZCt/Zl4FSjCnhxwPTsrwd9an6G/xokLdiBvTiEe1NvgUo6AzxIrbmIzAbTrsSBOGJiQQbCaZQX7zQBYdElSK7wb50loAGoB3RgTyI3wLOVqxQmbqcap30Y95r9e52tfDzVYL5oPW8gp4a+ZGO7Mbk39hbuJ+MpZ8qKkePZr6AYIHUAKEu0VA+PkxoKpOzuZCR6pGu4FBzujdrwKReSbz8eTNdpgLRdOgtu38bygAz5fz4Zmt2hxqR2RlJdGE05kUit4Wz7N4V9cCLqHMG+EGF9DzLNqZuXhZAjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IKUtd8jmWCm5IqWGZz7adgFDRjgN/+wmKGYTUhPx/Vk=;
 b=xzFPxFwpdf2j9u/XBSD7+51RfpaaF2mdLL0k8joLvLjgqR0f8IF3jq4U4zs7zNvcDL2FidzcFVGGQnMvHTgwJRIgA3alq99kPVRczwwIo2l0Ci13Sive693wMdQUCy513w3mmQK4MTq0dUasfSisv7Ulo7j3FbKB96sPTMkr3mBYTY7yeu1lcQ4bbPymyJVSnd8Kuy9yNFr1hz8Wz+0NqJI1gLBrs7zxAymMDZZncy7MNZFrjDhLPDa94K44L28kzk/c1ODhyaBT36BftuNQWUPf4zkPeghANpCAKF6xMtV9+uJW+Mgp4WJ/KMvIfl4TASkCjHKSug1TlQiH4TfmmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IKUtd8jmWCm5IqWGZz7adgFDRjgN/+wmKGYTUhPx/Vk=;
 b=W90yctvYYR80AVDW/lJ0lvxqPKJYccFGiqUK1R61wAQXAYP2BWb5zR5Gp9/VIQPKEpJEpRaBW/jglPuksCC6vWXjp0T/nwE0pc8aA3cICUCM8RngvyDydNiIwUIY+7fSf+58KAyxYse0fb6us9goSm0eYrX7TxUAl0sMrHMb8pw=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB10763.jpnprd01.prod.outlook.com (2603:1096:400:297::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Wed, 18 Feb
 2026 09:04:42 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 09:04:35 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Claudiu.Beznea <claudiu.beznea@tuxon.dev>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>
CC: Claudiu.Beznea <claudiu.beznea@tuxon.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, "open list:PIN CONTROLLER - RENESAS"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] reset: rzg2l-usbphy-ctrl: Check pwrrdy is valid before
 using it
Thread-Topic: [PATCH] reset: rzg2l-usbphy-ctrl: Check pwrrdy is valid before
 using it
Thread-Index: AQHcldsA6SwoZJU54kOOwSNySMhUm7WIPsGQ
Date: Wed, 18 Feb 2026 09:04:35 +0000
Message-ID:
 <TY3PR01MB113465C481AD1CA21B8C9B121866AA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260204133427.3762840-1-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20260204133427.3762840-1-claudiu.beznea.uj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB10763:EE_
x-ms-office365-filtering-correlation-id: 06ec617c-b60f-4776-947a-08de6eccbcb5
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?q8Xjur2u/8+mpSXAW9dCFsx/qPNfw9Vlf52ywGoW/qbH4mkKiEQ50nOWzGg0?=
 =?us-ascii?Q?LcvlLpVLo4T0pGaKxc5qpqkjVLt1zZB9m5XB0Yyi6d/9SRN4BkYFITObmSeF?=
 =?us-ascii?Q?z8OW7tf5X3V4Wh54czuILNyl3rO9peOl6cD4OCZQpXp/CFEhoNLmPMtPBq4g?=
 =?us-ascii?Q?nsnXuOWKDj3rSZNhtPmMAEnqYHFGKd/fovHdDBlr4p0uz7dSBEGh5IiZILoj?=
 =?us-ascii?Q?vzBau7Y3O7Y2OzVhNRq3WulvI80aSdv7EqT7/1HqbQw6xfzycY2CnLTSMZn7?=
 =?us-ascii?Q?Rj8XYFVEwazvKqqHIMjoYcxpI+zASlcJXGctVxS7ypyQ9bnrQvKAG9cUZc2+?=
 =?us-ascii?Q?o1HfhRP8dZOgnOlYJccikWIVAJUaVQb7zDNedqViszSy5FBr8ja9rcUVjBU3?=
 =?us-ascii?Q?wuO6h61PdrCBu885semvaNGztZXFGQKweI6WZjvXtvgM5Gh6KI7Zm9W2ST+E?=
 =?us-ascii?Q?qPfD8+ml19qn16o0T0ayI1Ef0WWmWRLIYgrmkb4ZLK1DfdngCfJyDh5ntTbK?=
 =?us-ascii?Q?rwVqlSLEmx1mgAzIpujtjK+rW2ROVntVgsxaC8bvOWke/jFsMM8IsRsKAr0A?=
 =?us-ascii?Q?3u/iELbyrGS1kE+4PMmXuT4I/+emEFjNZNZgzW5mvZPSVOYigwGQU3sCZPv4?=
 =?us-ascii?Q?CMvbrmssWJtWgG/kPm/USww8GwPA9jZQre9U6VkyzFPFS1cObQTuwjLvPMmT?=
 =?us-ascii?Q?+azIC/9NBTvrx15UOn01W5xY1TJ2/MmXA5BsXdc/zcLXdOCcXtBLzbj3rJGG?=
 =?us-ascii?Q?+4Tw7jBcaUYNQQi4I7+ocTa2W2LeQqxkWcEwZcT9QqlX8dUZIFNV3MnZQV1G?=
 =?us-ascii?Q?Txa21q9w8ngHnCLLIdJpOZYs5FqcS0LiIFi25nzn3OgUTlt95BJfzfGgCbpp?=
 =?us-ascii?Q?S9obh/7lZTRpSh3n/g5xcCQkfy8LmxlfBdk8byc+Gqc7EoUTjKrAnnhIB5Uy?=
 =?us-ascii?Q?RRBFwmzytX9/EHWhD01s7LFAyOJZMT8Ca6lQO4MdlLnaTw1ZSByKZabUk787?=
 =?us-ascii?Q?gWu5mNX5tCqDTWMunzhk70VaFuyTB0XLs7Uj85CsvK+aoH/qY+52DwappMKR?=
 =?us-ascii?Q?sGqqSBMAzEjtQOekCXP32em6qNXDVXw44VyqEUsEVdNwMm498J1z4o3K9yFk?=
 =?us-ascii?Q?GOqcTMIxsm2/C675lo2bEhn/X5AfFpJF7TAH9P7/TDcoUqdiNsLirp6pcXZL?=
 =?us-ascii?Q?kZScnBXBG6GaDNcZ9/WCSyNn3vyCUdTb9MKf7HMKD2cmZr5J0XGBo+RLEbaO?=
 =?us-ascii?Q?dVi5Ik1FCmhtjha2aZShm+vTyY8MFGbduB/y029/xIsUFPawl9HdwQRd0ABb?=
 =?us-ascii?Q?5ANu03fXiIgrDfIwwrGyDDdCl6PlFcgLPzmI87BcCZ7bJeQTME0TgZMtSe7K?=
 =?us-ascii?Q?R4LwLxSW1mmM/xDE7RUTQUB0b2zx28WwcyW2tfj3z6IWKHVWjrvqtKWC59H5?=
 =?us-ascii?Q?cB5/9C2T4VWsl0Ntzp36dVcuKGp+1gVJRSZsOp8F8m9fBPNuAGYCC2R00adr?=
 =?us-ascii?Q?pCRY/m1F6/NkFCaIomSO3UVvKHV3dsD/JITvSvtXqVpUfBq4Wru8Uvjs3xCl?=
 =?us-ascii?Q?ZrRmUJPjSYMyE4BWYl+4xi3QfN2rb25ivSMMt36DQgCMVPCgoOHZrBmjAdBC?=
 =?us-ascii?Q?cFhvqbDC52emmJZEPAyzAVY=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?R37PIyC4y+jOm50Baf6pfFRuNiiDaJgcATXkcJ2nDaTo5ca3TkETJOrADToe?=
 =?us-ascii?Q?pzXC0ZFGd/8VitaCQOAsAYILj6uCe4+q7HGaIMiAfhNH6vqsGN77fhdAJr0k?=
 =?us-ascii?Q?83LKGRD0N05utWEC5eWCg5gw2VwLmf+NIs4wXkzwaTMU90epvgdI/agIXI83?=
 =?us-ascii?Q?7DsO+7Avd+rLpuOqgiIt7ab56Kr2MJkqJoCg/9UVuJQDwAcd48Ub5WnYu/2O?=
 =?us-ascii?Q?gCaQRwF/0ZDlxDTPpWcJdyVaQwNFMLDghvidDAnU8u8/iqtdNtEAPjl8NTSd?=
 =?us-ascii?Q?Ch0/WCHraRvABYrYfln0e4NT9Q7JZoIB0DeQ8b4PqZu44PFbrKvqRUPUL/5e?=
 =?us-ascii?Q?tJ8I8wpAmsIET7W/NZ+rZ5neBdtDDipr6/JsLNvnzRjCDW32tQTNADj/E1nG?=
 =?us-ascii?Q?0bOaDEKUI+DF3zNqn6Gg7MMJOTf/T2UHq4+WnY3WuIyJGZQJ33WqudvI/J5K?=
 =?us-ascii?Q?WUFDlQaLkb7Q3Fpa1zMbXx2tnwjsKGN1ZgXJg/khMDOc48FGMjBmezGrU/Ba?=
 =?us-ascii?Q?gmZ4aJMs/2vnotNLD9IH21tof9xtZN1MQ6/EOvrSWTcykj63gi9Ueph0Acg4?=
 =?us-ascii?Q?JzAExotUzBM+2Hm1201DPo3Q6Lo4nQMzK4Y8zKni2c/Rg79b3jyyfH2GaCaD?=
 =?us-ascii?Q?hIOKBsJOoHco/a7+mCAxLARH7uSnMue2pub/SCBJNjC19JHJlQHsIpGZojzO?=
 =?us-ascii?Q?V6JaWmBMTuS7MZYGBEhAbEdJNgGkeGMBdV4gTw2xy4NJXGi1Jx4pTtUIYB0O?=
 =?us-ascii?Q?xBJOUKjlKYehLLrI9TmLDBGpIWdzBQKq6gdUYZLhzr7U9nxXP0QuCot4yz65?=
 =?us-ascii?Q?ZTHV819V2T/UfESwz8e3dIZGD0yvpIjkF7Kt4/5TakmmnLWme5YHxyAW7bI0?=
 =?us-ascii?Q?nh9FoJGtW4JpS20eaLlaDcjAUPNjpQcWTFIjBRYTJiDaknoDNf2pIiBhm58B?=
 =?us-ascii?Q?mJqGsBtPp90/wFyxKyoQQJR1tITgHpBhNR7hA3INZXEAmwv4F67SqPDtXeJv?=
 =?us-ascii?Q?3hsUc4xENNvikUjPZ1Nn7cyvheK4rLhmQbZ+YbFZdsOphkCyNCznF/zBHTb8?=
 =?us-ascii?Q?Ejig+Q/Utesjb6Vrm7Ia+Raa5c8oXl/vqmVgBV/0ySQUtw1NZlKP6j44XuWr?=
 =?us-ascii?Q?ZjvQ3WWIpG3XYUfz7+/cR78qWaLDmK895GcxDGQGTZCtS3LVfUruGBuNcviq?=
 =?us-ascii?Q?yNokWvvFqLTARKEJ2WUsw1XBXF3vGa3UsVKN4HUkFatSuukpV79Wb/qHZGf2?=
 =?us-ascii?Q?6RrHFMfqQ1fgP8kjzq49oV9yBzbGTwchEceE5VasyvfXC3s5k+ZVQyUR544y?=
 =?us-ascii?Q?TqkkYFQRLXjYEpsNiGsqotgSf3f4fz8ZMHPckPOCg3UWdqS0X2pm/JiwUHGZ?=
 =?us-ascii?Q?BPhdz1ICIVsOwnmpQAnMoFz1cEfYiZVL7EailyAJzUYGNnttQJk4PNghNGcY?=
 =?us-ascii?Q?raxuhZVzxZEulY732ENqdPpdyxvte+nrnoXmWOjm4tBHgVmtJptcSskgfeue?=
 =?us-ascii?Q?Z6UaAP+SoPdar518cwgUx0c0XNQAJxVY28cDCLC67X7U5ewGWdRJxsBnR14N?=
 =?us-ascii?Q?IsffheCh0EwTybJ5MDXvCUkcwVzNehI1TORTVB5xuU9PArbq4HOSU3Ve/TaO?=
 =?us-ascii?Q?yXjnAK4NdaITf1STiIQpDVbOnP6m5KqObwugKzikCFDmnqurrgSN+Jdtk4QD?=
 =?us-ascii?Q?XVk9efjk0DBsgemtjmBQQ2+faryl8bhO+aV+itxChqDkRXuqhx9Sgnt72i2U?=
 =?us-ascii?Q?o8IZuFM1tw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 06ec617c-b60f-4776-947a-08de6eccbcb5
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2026 09:04:35.1387
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fiu10TkdUz9oyYWL9QT8Uo8MG72HgzU0l5NzvYWV3FeRSYj+kDMXkJxwgHI2yw6QG28udALcNOF0Rhi8xSaFDFf3YOCiRKP+0Yd9EtZU2qc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10763
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28300-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tuxon.dev:email,bp.renesas.com:dkim,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Queue-Id: 7493F15468F
X-Rspamd-Action: no action

Hi Claudiu,

Thanks for the patch.

> -----Original Message-----
> From: Claudiu <claudiu.beznea@tuxon.dev>
> Sent: 04 February 2026 13:34
> Subject: [PATCH] reset: rzg2l-usbphy-ctrl: Check pwrrdy is valid before u=
sing it
>=20
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> The pwrrdy regmap_filed is allocated in rzg2l_usbphy_ctrl_pwrrdy_init() o=
nly if the driver data is set
> to RZG2L_USBPHY_CTRL_PWRRDY. Check that pwrrdy is valid before using it t=
o avoid "Unable to handle
> kernel NULL pointer dereference at virtual address" errors.
>=20
> Fixes: c5b7cd9adefc ("reset: rzg2l-usbphy-ctrl: Add suspend/resume suppor=
t")

Thanks for fixing it, as it leads to crash on non-RZ/G3S platforms.

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Cheers,
Biju

> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>  drivers/reset/reset-rzg2l-usbphy-ctrl.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/reset/reset-rzg2l-usbphy-ctrl.c b/drivers/reset/rese=
t-rzg2l-usbphy-ctrl.c
> index 32bc268c9149..05dd9b4a02df 100644
> --- a/drivers/reset/reset-rzg2l-usbphy-ctrl.c
> +++ b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
> @@ -136,6 +136,9 @@ static int rzg2l_usbphy_ctrl_set_pwrrdy(struct regmap=
_field *pwrrdy,  {
>  	u32 val =3D power_on ? 0 : 1;
>=20
> +	if (!pwrrdy)
> +		return 0;
> +
>  	/* The initialization path guarantees that the mask is 1 bit long. */
>  	return regmap_field_update_bits(pwrrdy, 1, val);  }
> --
> 2.43.0


