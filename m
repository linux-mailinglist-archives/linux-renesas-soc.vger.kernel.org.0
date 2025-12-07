Return-Path: <linux-renesas-soc+bounces-25638-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 951A2CAB8B7
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 07 Dec 2025 19:18:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 15AEA300B93A
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  7 Dec 2025 18:18:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53F6823B63E;
	Sun,  7 Dec 2025 18:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="LZs12MKb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010044.outbound.protection.outlook.com [52.101.228.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23EAF171C9;
	Sun,  7 Dec 2025 18:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765131536; cv=fail; b=EYFnshMAu8x7OLQjiVS6CWBwdTKom7O5BrPr9GE+Od2ZV3hLUjBnNjUCAwbCBdxaTIQoTQaOE3LEl3kS+IoKMqj369wnFJlyqvc7eJNnSKasFFbuJKr8DJnz6rnQEOPQcs4NVVhVm214J8XPhiA/9jjA63OEd3sxANmdrRKlqP0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765131536; c=relaxed/simple;
	bh=S+J3b5lK0rFgEicZjkjTas7qAlP76hKC8ZqR/WCip9A=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=A/aM8a9q4Cm+S2yCP0Kc+X1/s1Ax1RXPKEGjnOwYxAxy0MBdG88kLHhYmoqrBuLv86vF90QOqlvOp2js6V1mdQzkUU4EkYgaLlcoLQuxPphsklqIBaco075rNV9pXwYWJQ/f5Vniqn3JXXg0+U3G5izuoSom4mIC2VqUo1vtNt0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=LZs12MKb; arc=fail smtp.client-ip=52.101.228.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UEC9SM5yY2HOMDUcCMWtGQTDD6Ui+4rU2OHe6y2BYGWO1CYuDFz0lE3Y655R6UIY1MNiRtXZEORtomAOaoU+tDXp6mccRpj6Wap65ThACfy3Nnx1/VzYBZV5f6+CakpXbpFLLvge2a3Q28iFHBXJ53I2piBNstQHWroSt5ippSfwnetHvgNsFOAVZxnUewHpeyGAiUIHmtwBz9o75c0gLRELbU3YlqGO/XmVh2XsPdsZADtL8O+QEVljvVaPZeu+wy956T93iqfb3ah3UC4SsukiCLGpo1QtFAVTev8KgHoReTaZd+NCninKpxO7bsTV1lR0rm9jSPtIiy0CmAhGPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3I8KQdMTBMN/+rsdmoB8KWmb9Q9QQZrwruYLANn82m4=;
 b=lWqF+9uGEjSfYAd77g+1E623JUih4dN+MbOhq1oRkQyXUMLA4DHZNIhst9jAFLhm+ZQfFBhAQcdWlRIyaDITT1Aii4syIztgJD591Wl1cM971UYrX2Oo5ZtRZhvjC6Vb6diBhYSrSk5c3xufF9uoNN1Yd+wYf4i2fdEx/oj1aXVeP8+cHParonWqfpcX9qPrLz5yuzznTZ5srSTrs1YT+hKRKP5biVHimEB7EMYjbnLMkbtZoo7+NVJPZaHLXMXspH7faIJKIcUMgCkZZ7KZJ8zFrHFpfTuTziaCgAsTc/gxxE3uHrT5gDWx6LItTebpSjEJEWqp3RUkU6QFX7jocw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3I8KQdMTBMN/+rsdmoB8KWmb9Q9QQZrwruYLANn82m4=;
 b=LZs12MKbEhJ5Err/RTdQ7FPWUOtexhFVvBTZTLQOHGqDuDJVl8Fht4spKPlw7S78RGDT6CndwbJcoXzTNfAyC/ZQzTq5iej1TKHse3z18QHFWPwHnXXGe7dPOEz5cV6S4PL4xzMGsDlR4ykzsaTtarvVaECDIWAF2K8Mm05OLEk=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSCPR01MB16195.jpnprd01.prod.outlook.com (2603:1096:604:3e7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.6; Sun, 7 Dec
 2025 18:18:47 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9412.005; Sun, 7 Dec 2025
 18:18:47 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Alan Stern <stern@rowland.harvard.edu>, "Rafael J. Wysocki"
	<rafael@kernel.org>
CC: biju.das.au <biju.das.au@gmail.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Philipp Zabel <p.zabel@pengutronix.de>, Claudiu
 Beznea <claudiu.beznea.uj@bp.renesas.com>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 0/2] usb: host: Drop resume calls on
 {e,o}hci_platform_suspend()
Thread-Topic: [PATCH 0/2] usb: host: Drop resume calls on
 {e,o}hci_platform_suspend()
Thread-Index: AQHcZ3fosvRmsVoD4EmZfZBInM+QcLUWYDsAgAABjGCAAAtaAIAADo8w
Date: Sun, 7 Dec 2025 18:18:47 +0000
Message-ID:
 <TY3PR01MB11346364790DE1F0D2441536786A5A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251207124742.96526-1-biju.das.jz@bp.renesas.com>
 <db985cbf-4813-44d1-a4c6-16826f935c17@rowland.harvard.edu>
 <TY3PR01MB11346E9D561CAE53CF47F7C0886A5A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <75630ef1-0367-4ed3-b286-664b63424f52@rowland.harvard.edu>
In-Reply-To: <75630ef1-0367-4ed3-b286-664b63424f52@rowland.harvard.edu>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSCPR01MB16195:EE_
x-ms-office365-filtering-correlation-id: 10f68f0b-8e07-42fd-ee70-08de35bd107b
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?0OO5ssi/z/dsr72+tfG/EEAeTW2tf/GGiWzfHJk+FVNiJyPJffFB9Zk0kVMA?=
 =?us-ascii?Q?RmWmJ7thHy2WT59vpa7L20y4gTcTEGEbi7RKG9ObB5NeChvW9vnBk0HVhkSi?=
 =?us-ascii?Q?9gpr60wuY1siwpuI0JvAi1/XfTsI75Deqm8m/r1RdTYW5s2ngQA6j5nRk6ID?=
 =?us-ascii?Q?HEvB+xU9VCXmMMOADa8144PH0tkRvIWZbwOijVgpC2VW5Tq/C4OKYBD8h+mL?=
 =?us-ascii?Q?/DhUAI2gABH7Nw2N3f2xEsz8wy6/YE6pmbmeutqTXb8WrekVCXIy7uK1eDTV?=
 =?us-ascii?Q?wEsxRUKzjy671rjlx7KwotS0EVOZNjFNx5c4DUAyyzxj3Ls7Gp5kpUcyUjON?=
 =?us-ascii?Q?V6Vns1qqEExxmEmAjQ1JTdTZtwoIKaNOf8e54GETIO/Tph7/5LYxlLK5Jx+M?=
 =?us-ascii?Q?KNo2mr4O+NzUEI0KG3OoVr0OReuiwRdEuqPPn3+4kKkavi88r7dJQRWq3DPp?=
 =?us-ascii?Q?4/CkXldNb/GC8YlJxlGdAUcxDRhw9NICY1NC1YPiqbio05tRoQBamuFswaae?=
 =?us-ascii?Q?/Kn8+vI2k1BWq/ecfsa1w76D2xmzezYgilCbmk9RqckZd+Q9ceq9TP7qN/G1?=
 =?us-ascii?Q?1f9HryKnpjX/ouX76cBv5iDrafsgrOmn33xeeRl3PT22+RbRjDVtvOqAgJeQ?=
 =?us-ascii?Q?oLwJIUEQ5IHh7PoBQJ974wD9ruf6AtLesukcD/LRhNucGnPfUa8DbDrKOgtP?=
 =?us-ascii?Q?nG9p+bOicnxAzm6sD9SREek0rpYRpcy/Tm+vGvwfka6AZ/MDEKX8I8Dwlbnd?=
 =?us-ascii?Q?BEA+bgVvhbmI+3oErit8+5Ja8E1y305k55QdAw73XGgg6IaUWFRCAm15o1UV?=
 =?us-ascii?Q?vIE8cUbxtdkaO7EmhNTX0TzwRZuoOnR/YVtvw4vQ+MjdPLVD1ToD/VqFneY9?=
 =?us-ascii?Q?MyzjZEJlapYq377z8qauy3sRci5kFNc71AkqLdTNUpuTpI5XUxQjN4ZCbuRx?=
 =?us-ascii?Q?yXA+hoqKzLBqOJU6dYyGxXWyfrM0sjzIs/Mpjn1rRtG1pUuQQeLGn7SBWwSj?=
 =?us-ascii?Q?WPPHzd2WMAOx0nAJzfuBEWfLsaYVyip7CjO7wtjgswcOOQi8hNSjmVIQtu2e?=
 =?us-ascii?Q?kGO8qgMV2Q6K4E38R44cSmOvhcjBhB7DSQJDKcebXJ9BRrjRa2RNUo/p2OVp?=
 =?us-ascii?Q?ssm3P+ApGpim4ZDPGTqIWrefQswFPWH/Gygiz2lCCkdqaqYpeMYrdN81+oaJ?=
 =?us-ascii?Q?pgHcmZg2Xu/clerT7/rJx00tcbG+heZ/RihIfhbhS352Yxmgs8LoStL249oF?=
 =?us-ascii?Q?6IKRHMjaTTv2AJWTEmw6HSXMaOQFTGvNimpa7fom9WxBVD3uiC/la1rV7Nzc?=
 =?us-ascii?Q?curYpQJNbTKYKv+GWOou5Jvq8GuC/0mmLqnCxcMqW+C3XhKOxhlDpS4ewA65?=
 =?us-ascii?Q?nTIDwkyT88yrnJBcR78H3VYH4DeR6R1/I0/Yif1jwUlwEVwlCfDKD4GMC1KP?=
 =?us-ascii?Q?v5os5hj2zJoH5tjFupKbQ350H92OUhlQ3vu5/AQMUCkBBDVIWpha9OYARqbX?=
 =?us-ascii?Q?LmwySgjKg64Ni6Ro2iEWWCw5rLQEp26VwNyr?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?CIjYNa09oZ8o2SqrGaXtUGydmEyIcXvxOnT7TkldiZbgmOpIIEU7UWIbP0e+?=
 =?us-ascii?Q?Xj3iN6eXP/jurEYFtU+FrS4823GDEANv1d2z7RNoyiLdXtpQCBdgZYClmoG+?=
 =?us-ascii?Q?PxvMg4xhCYVd83bPEU8ia7h1A7sA3jqE1I17AMemXXI1fTBF6K615taajTUO?=
 =?us-ascii?Q?C+zePNhtji+mdMbMJuYWDdeuSs2McJzCFIozxDtB5AbWkZieW5HLTw97qp9N?=
 =?us-ascii?Q?Hhr/7jIkVrFRupLfrv7DwVjPlieHm8rkvfm4wRjTewCV6MtD4nrOPAwHPEKX?=
 =?us-ascii?Q?WEn585LK28rMbbBcq6JhgbVrsaGkxJreBIIxBUdElpFIeCFtjOSymLm6cd4Y?=
 =?us-ascii?Q?g5GQnsI3pnaEBPcZR/xypisTmzoAB4UIt99209F481e5HDMNwzA7SwNSEcje?=
 =?us-ascii?Q?6h1s5zG8T9XA88WJVuAEzH/0ojizNBuxR+Mlb+QDnsO+vcYpIaxDKZ7CM/4/?=
 =?us-ascii?Q?0M5V9J7xsqO00pBd0Z9bwZudttJpzg2n0tvt9yl24ihnBgE9wiv8QpRvnldU?=
 =?us-ascii?Q?Q8ENzzUoCo9u6O7GzSRUd1HkUBJIkPwnfJxBldGxbF3iIAjChvNAZtGW2/d3?=
 =?us-ascii?Q?t5WKS7etO5419XyfCSBNI6HwiNEqJ+aBIled4YwEzOqtSq6LIFAODc6FWkvl?=
 =?us-ascii?Q?JISN+DaII/yiI/vIgnOQdBAdRpMYBmklpKaoSmOqAnyxCTxmchJFXN4MNREz?=
 =?us-ascii?Q?Ge2BvNHUaG68RFAEjwuf1IlsWMnfX6q1/1B5ypw57gMuHTlehpPHN70Vt93u?=
 =?us-ascii?Q?kb7loJRTSQFIoUplKU1syyYXrCLC7aiRegzowAyy3CdjrEwaHBhcCqLUBmuc?=
 =?us-ascii?Q?F22Dzet6BvGPpj0Z5aBPK+CMZtAPqdBApO+/DDO3nMYFEwO/LnCAFApdUEjG?=
 =?us-ascii?Q?GiVEEcTUTMdjYQdxEk8fNImGQxS+PT/79WS+Eju0wWkPFhNnpswgWEbfwr0q?=
 =?us-ascii?Q?jwdDFuQ/YWrj+8Eqq56+vWYdw8O2JIPetOJrGiSwxUjBR5TI0Jl2CcX0hZTn?=
 =?us-ascii?Q?TwCpNrXmMmL3Owiq/Rxs66MfknlEeycue1jJivzauWTTBIvsycUypnGxMUar?=
 =?us-ascii?Q?0zxK+O4qMT4iOnS8FhjNHRixefrUw9OpaWGKerX4SMItl8s/aZ21+U9oBbxn?=
 =?us-ascii?Q?mdPjJlGT9PUvPZO8mFMkrunLO5HI9OeoCyhLmrNxBWoGgdJT93OnDhgQxM3r?=
 =?us-ascii?Q?WW2TI8IgyqLbLlVr0dKjI9wofX4tFAQUj7Dd68VchVLQPVHhvznrXtElOY9M?=
 =?us-ascii?Q?mdqFbSGs0/GvOaJ64RIcKW5xuZH3MKWCu6KL87gYgRhaREFeBW+WgBTooHS3?=
 =?us-ascii?Q?kM4GSdMaXHjZwa9NicKj4zL+f6cPhWPpAtYlmMZMGI31wQygCSV/TEy9fMrl?=
 =?us-ascii?Q?fXqc6YPOd2QsXtKMj4KWri7v2nFvwizhtnv+AxAwRyke9H65P67Up0dCv6w/?=
 =?us-ascii?Q?HCvm0cI7DlDSpRoy7ejy8Uato/fzYfTyDA1cc80y5kXZ0S3evblQLln7116Q?=
 =?us-ascii?Q?l4uUTkDMFc35hjioUiEQdauyTsIFJcA32Hq5QHog8Mtd6BsRi/p3Vlso3gbz?=
 =?us-ascii?Q?vg6ywrFPhINzBLO9lJr81XghfgruL545QS6Dc1F5GTPmrKtL15X2CG0+3d8V?=
 =?us-ascii?Q?gQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 10f68f0b-8e07-42fd-ee70-08de35bd107b
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2025 18:18:47.4231
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uixKP/7+RS17FyUoUPH53gw6G1pzSUgwPDkIrOQt4UeZv5St6svUcAEWInG19jr0KKTzeEudfrctKwFlHGoURwBLK482TgYCycKv/AF1zXI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB16195

Hi Alan Stern,

> -----Original Message-----
> From: Alan Stern <stern@rowland.harvard.edu>
> Sent: 07 December 2025 17:22
> Subject: Re: [PATCH 0/2] usb: host: Drop resume calls on {e,o}hci_platfor=
m_suspend()
> >
> >
> > [2]
> > [   47.965220] Filesystems sync: 0.000 seconds
> > [   47.971883] Freezing user space processes
> > [   47.977739] Freezing user space processes completed (elapsed 0.001 s=
econds)
> > [   47.984772] OOM killer disabled.
> > [   47.988065] Freezing remaining freezable tasks
> > [   47.993681] Freezing remaining freezable tasks completed (elapsed 0.=
001 seconds)
> > [   48.001143] printk: Suspending console(s) (use no_console_suspend to=
 debug)
> > [   48.077166] renesas-gbeth 15c30000.ethernet end0: Link is Down
> > [   48.081846] pwm-rzg2l-gpt 13010000.pwm: PM: dpm_run_callback(): rzg2=
l_gpt_suspend [pwm_rzg2l_gpt]
> returns -110
> > [   48.081937] pwm-rzg2l-gpt 13010000.pwm: PM: failed to suspend: error=
 -110
>=20
> Okay, here we see that pwm-rzg2l-gpt failed to suspend.
>=20
> > [   48.082157] PM: Some devices failed to suspend, or early wake event =
detected
> > [   48.091749] dwmac4: Master AXI performs any burst length
> > [   48.091829] renesas-gbeth 15c30000.ethernet end0: No Safety Features=
 support found
> > [   48.091924] renesas-gbeth 15c30000.ethernet end0: IEEE 1588-2008 Adv=
anced Timestamp supported
> > [   48.092073] renesas-gbeth 15c30000.ethernet end0: configuring for ph=
y/rgmii-id link mode
> > [   48.100718] dwmac4: Master AXI performs any burst length
> > [   48.100791] renesas-gbeth 15c40000.ethernet end1: No Safety Features=
 support found
> > [   48.100875] renesas-gbeth 15c40000.ethernet end1: IEEE 1588-2008 Adv=
anced Timestamp supported
> > [   48.101016] renesas-gbeth 15c40000.ethernet end1: configuring for ph=
y/rgmii-id link mode
> > [   48.149094] usb usb1: root hub lost power or was reset
> > [   48.149136] usb usb2: root hub lost power or was reset
> > [   48.361219] OOM killer enabled.
>=20
> And here we see no sign of a resume for pwm-rzg2l-gpt.=20
>=20
> When recovering from a failed suspend transition, the kernel resumes only=
 the devices that did suspend
> correctly.  The code that handles this is in drivers/base/power/main.c, a=
nd it's rather intricate and
> difficult to follow.
>=20
> In short, dpm_resume() invokes the resume callback only for devices that =
are on dpm_suspended_list.
> Devices are added to this list by dpm_suspend(), and if the suspend callb=
ack fails they are supposed
> to be removed from the list.

Oops, I missed this.

I put a print in resume() of PWM and confirmed it does not call resume() of=
 the failed suspended device.

Cheers,
Biju

