Return-Path: <linux-renesas-soc+bounces-13446-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD6BA3EA94
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Feb 2025 03:10:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABD877009C8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Feb 2025 02:10:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70B521D5AB5;
	Fri, 21 Feb 2025 02:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="QFlhsMAc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011032.outbound.protection.outlook.com [40.107.74.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08141D47AD;
	Fri, 21 Feb 2025 02:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740103849; cv=fail; b=NrtVhLbEVF0JZqG0eKmFW2LziSP0Rbhp8a6wjyQ5TmlpKJPhThp6Zg9OjtbF7tbWXJewxXvamhizxxP3aurwTxsXYOcUG/gLH4wZTgYbH4YxgluSt7X4f2QskJ24OphTLUnjKzHty2ZuwmZ35eHPv+DouEwb+pedH9BdIkz95Yw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740103849; c=relaxed/simple;
	bh=uRmohGjnCDd+ofOIXR0/TsTTVMAnPCRiGdRFfjfyMeQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Czm69rkTzrBS16fU9qUbcEDxFkJD0xAqzbO6G/RD3kQq9JJTjgJi9QVt/zC23eOncgNVVYjPaFDa++UWfPWK5W2pM4motyhx8+28QArqL+yAkBh3dY9BOlKbVxa3pZr5jn0b+5rn1ws+17/pmhGl244Xl50wYXFi0dYAoYcDNOs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=QFlhsMAc; arc=fail smtp.client-ip=40.107.74.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DesrlnhaVjFjdcsbxSvtcheoW+iQw9E3jSpeZNxxvSgxU52L0TCN/lu6hRZJhfWHAujqiNG936pmk3Hleq6xZl1k9V9b8cdUiLwqaCN0GiQkesYPq9kuddRVWbQW3yMI9c4NcT77C9FIZvZUMmuv6OdkA4OnlHHh0+G98t6rNPJg/gAUVxRksdjjJm7zELY7DM2WsD5Fq1WUmf3U0tmo93idmkv6I99ccLWY4yP4zdhhrERkGTCg+0hC1lc2R5Y1WcXV3tdKYzYQVTFUnfAaUysOW5Dv1WH4ElWyi+t1ih+QAh+gGWBUON6wnQw3KPVccwi6C1ppS7ehs/jmPhG+Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6B3cQCyVVIsKAfsS0E7ZLQmOYzLi2bpT4VEbx1HWUTc=;
 b=mhivh3UC9VmFo4YF14sdtyaJ64sUFD51snaKx6SkVLdnjb0GtD4UZ04Z7oklDTIHahyWhFFyiU1NiYVSqbB8a65a59xAAduhsWgWw4EzYRWWI28ZY/8plaoyCgirPnk2QTmyeshXOjn9lIATUu7oNjdTVzfvz8kjHnSpko0CdYNh4IdyzGkIhER375RhQwSe5m6Q364qEVsru/v1JaDCTN6eQHhMXeC7/9VmX8DA/Yxztu2ldqBLpP5p4nZ52OLMcqM5PtuyRBOnqLYKGQLQBOgZtqH6IuYeiGoXGYz92Gzf4NCoUQe5bydNclOOLBWK2EKd9toFkhy7rxSIAfuquw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6B3cQCyVVIsKAfsS0E7ZLQmOYzLi2bpT4VEbx1HWUTc=;
 b=QFlhsMAcYbxmW4mAJla2A5pYmarei97Rgd5UTaDQWaySBTcQIHmkBkZGi0Kdxt4i4kGQbXGQRE73U+ZHl5iglehjAW5IQ2w1qu0KuCUSXZ0GcKaI4sHka8TJbyLicxfFjdFbwJDgzowKsZldQbZlB6WjoXzK6IsYFQYFSN2Lw64=
Received: from TYCPR01MB11040.jpnprd01.prod.outlook.com (2603:1096:400:3a7::6)
 by TYCPR01MB8207.jpnprd01.prod.outlook.com (2603:1096:400:104::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.17; Fri, 21 Feb
 2025 02:10:41 +0000
Received: from TYCPR01MB11040.jpnprd01.prod.outlook.com
 ([fe80::b183:a30f:c95f:a155]) by TYCPR01MB11040.jpnprd01.prod.outlook.com
 ([fe80::b183:a30f:c95f:a155%5]) with mapi id 15.20.8466.015; Fri, 21 Feb 2025
 02:10:41 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Claudiu.Beznea <claudiu.beznea@tuxon.dev>, "vkoul@kernel.org"
	<vkoul@kernel.org>, "kishon@kernel.org" <kishon@kernel.org>,
	"horms+renesas@verge.net.au" <horms+renesas@verge.net.au>,
	"fabrizio.castro@bp.renesas.com" <fabrizio.castro@bp.renesas.com>,
	"robh@kernel.org" <robh@kernel.org>
CC: Claudiu.Beznea <claudiu.beznea@tuxon.dev>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>
Subject: RE: [PATCH RFT 2/5] phy: renesas: rcar-gen3-usb2: Move IRQ request in
 probe
Thread-Topic: [PATCH RFT 2/5] phy: renesas: rcar-gen3-usb2: Move IRQ request
 in probe
Thread-Index: AQHbguh2eMNLIva0HEO/fTv7ap9dSLNRBTdw
Date: Fri, 21 Feb 2025 02:10:41 +0000
Message-ID:
 <TYCPR01MB11040051BFF6ECA0F45FD6038D8C72@TYCPR01MB11040.jpnprd01.prod.outlook.com>
References: <20250219160749.1750797-1-claudiu.beznea.uj@bp.renesas.com>
 <20250219160749.1750797-3-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250219160749.1750797-3-claudiu.beznea.uj@bp.renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11040:EE_|TYCPR01MB8207:EE_
x-ms-office365-filtering-correlation-id: 647430da-388c-4c5c-adc5-08dd521cf134
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|10070799003|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?UlRHZGhIJXN3Y4y/Dlhbrt4NwwXLOa4E2AYfBeX8WjGdUnM/zR50I0KednPe?=
 =?us-ascii?Q?0Ia5Gt8BRbaO2ThR7lzKLFf89CTzDu8CguBshmw9ZBPB04CEw06xa6cTQbuF?=
 =?us-ascii?Q?xyClVRELao/iPw4jNzJ/IPF3Ie2kcpZGtk573r23vIlJNBt3wNjf2csmLM3i?=
 =?us-ascii?Q?Xp02wnRixxI0CTm5HsHkY4UwZMeYlYRUslvhjWC8Nse50DyXL0RahIGarWHB?=
 =?us-ascii?Q?iu+bArBxajaejKnCoeLu1DrmMLEFcEXcAE+ph9iVJaoE3ztUkDhaqLRIMStM?=
 =?us-ascii?Q?Metrrac/KwMn8q8xXF/GS1CJFjeFCQByeQeqcVt9ZfpmyO7r3zrKPTvI/Kl4?=
 =?us-ascii?Q?+UhlD7Kbrbx+Gl6Lh2x44T26BRl9EUFbveUUEF9llsaDnVME+JvCAdHURKMe?=
 =?us-ascii?Q?1j5YXqgbxMJukzXDLKgBETKdGEXAFS3BjCJ9cLmAWwssXgUk0SNGyf+a2xFF?=
 =?us-ascii?Q?fnDwbObOyh3SQwDOfEm3U9jTgARRQozI9YEKPUlGCUn2M5nPFsASRnrMx9zx?=
 =?us-ascii?Q?rb8yLNVWq2OtCIydxehbmmq424vTxOmuiQnHjftG8G+r4FQ/jM5E9hLlnGZW?=
 =?us-ascii?Q?My8Hl2FYFEdk8m7FF9SOSDm0PzxvpBg9EW9MvSypWFJNrVBqKf4Ub9qj9s0U?=
 =?us-ascii?Q?5UyJw0l/Owgo9s4ujylJsbxgulBN+q6/V6dg/MZJJ7agYkL3tQD9ISa3i2oa?=
 =?us-ascii?Q?U/PtayihBEv+c6s16BIxvAooLc3b+znWd57wTwp1M8Jr1fwqmeO5f1iq/bl/?=
 =?us-ascii?Q?N6E2BhF6o6UuqHYtKKXJ1CUEq7viuw856X8jajDJg/yiUqnXa92RJsjyW18O?=
 =?us-ascii?Q?kodTaZr50XeC78mmHQBFkOwCywV6qLRi4BLVcaTLmVawyJ4rnQdIKT48Hiwm?=
 =?us-ascii?Q?fqbpBNsbt3laaugDGlyGUTeMsSE5gq++/ddlBuO46qIOLzOAUx7gxNOUZeOi?=
 =?us-ascii?Q?paTNjm3VNpuujwtcTAy0Go3LbEuEQNBWJSVJgrluXcVj1QrcOp2B9Gbhrzdg?=
 =?us-ascii?Q?sqgCMgME80UwRhb2NFcoTU/1DopiJjk03H3P3P00xmir1ZaU9nIkReICU+/M?=
 =?us-ascii?Q?GZyFrp5qEJbQ/tQQ3Hgjz9NXn1ifpoEEeQ8IQ7D+wSH3V+ufJ4VI8t/K4Yik?=
 =?us-ascii?Q?qzlmiZzpjGSQSoQv6N9eV2UmWjH0Wt3ht3cS8OJ/+d2LfPVNgwaBLcQFlr1T?=
 =?us-ascii?Q?22AnGXeog/LoiHd1Ka1Q54neCiEbBYNp+ZDfmGfUU7Tg984yDafp4hk1Im/H?=
 =?us-ascii?Q?tybSe+bgDQY8qQT1EjFc1q1pATNo7jIxkEyuUZpiHsbn8KaBEjQ62jDncHXK?=
 =?us-ascii?Q?PX/yHZOM7Qz1PwpP5Bb976INkS8X179xEY365LC4oj/hApdcY2hRbyGWICqz?=
 =?us-ascii?Q?6pr920h//pMqJM3TbbeAS0lWWhWUIl2dmXbrMP67BQNS5tYkrKMLWmiHrMfa?=
 =?us-ascii?Q?U3kafVQ1o6kMUtqKivAXQC1ZWzKo+gct?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11040.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?nZQku0529waH2NUXlWMkecjeyhE5kv1AFj0euTq9LmpQHQGDz4XPNppRGhcx?=
 =?us-ascii?Q?DWPdp15BM+kuusaFwfzMzF29lSbMQO1X8FRRBYgNBSWbUgKnvnTM13DLocoq?=
 =?us-ascii?Q?YifOOS561WmLSZd86/13SkUWO7phK8UY9TFrgOIhRVmg0NKDe31xhEWCgFFb?=
 =?us-ascii?Q?yd7Z5L4ZpC1ZfpnVE3vimugZ54j+Wdj3MCVmLhIuGsKoWhvNUnEJ4RQ3ptzt?=
 =?us-ascii?Q?UvSBOeM/Sex76aydV2FcR/mux15CKZ8WO+SjiymKMU2qWjD3rG+FO77TkYek?=
 =?us-ascii?Q?5P4ELUbAgygRJ1QAIADGUARGStaFIa4E9sa4qpCgUrcyaygGNsmwPHwAD7ki?=
 =?us-ascii?Q?CSzbd2S9yVxKfg2/p8APXY3DTMOR/LJIye/6hTt6xN0e/hJ8I/FS1sXmkUWY?=
 =?us-ascii?Q?QFkWP9u93rhiSTU1myvAy10gQ3Xq6qt4UKXY7usS8fhXliwTDEPZvFA3l+Ay?=
 =?us-ascii?Q?/+xHTNbZk0GpmVj0vGDyUuqh5zi2Lgy7fEO3Lzot21WcviOmYrSLJuf3ao50?=
 =?us-ascii?Q?/nhnPQEKHVPGBcruUf4IfmK/SnCviYzzLJDs/VnpkBAMoimmR/4iEV3AhMqx?=
 =?us-ascii?Q?2WOCumVWJkksu9mPSK93xjCcsbBQeWmKa+Fz6nf9Yw53upWgmBxEnTKCFg4J?=
 =?us-ascii?Q?a57x+QuH+mtpAw9UWTRmgo9GxV0Q9yJvIj6HxenMecysW75l/G62s4V4iXtG?=
 =?us-ascii?Q?G1hG+rtVXBSXzEYLRrs+Wd8wmUroERTMmRLf6GASGFszlvJ8C63ihsmyOUT6?=
 =?us-ascii?Q?ZBsjCrujKampbHzaVHkkxarSPGVPar3sOfb+hkv7bJk7UewaNhT7mTyPl2iL?=
 =?us-ascii?Q?RsN3yfSc3hUY/vuhXCvgqRLwxv/H2NJ0zssGTK5HHjCGtbo77PlscA/KOdPL?=
 =?us-ascii?Q?pYbsLTAiMDn3Re29flFClxKMSgkOXeU9UoZGkzPkVPbfCvSmtJnVlF12IQDZ?=
 =?us-ascii?Q?6QMYO739mzLSujgF59/UrVRg+6+fnLouyDzbevQvtSZuGFKj9PJeD3TJnHo1?=
 =?us-ascii?Q?gcZ1CS86CxHgWXiYGUNXPhEKiD1euti+5L8vUqb1ErQLLX55MuS7qecR8sig?=
 =?us-ascii?Q?CBDm2j/X2+0BN5pwX1zxyl8Gt3DRSkdg4EKQSd7q0c3bnNpKkNnWatlfCuIX?=
 =?us-ascii?Q?EMvgo8ODIkjlla1vXfL1zrQ+pv/929VIHABHVSSE/G7Y1uhhsEbW+XdFRJBA?=
 =?us-ascii?Q?bWiqH39PrCBE5QSqZOySOy+98whXqv6rBViFFIlg5XIV8k9E8lchyD7QjMEE?=
 =?us-ascii?Q?x5leLEPFcRGkpIIZjPBYqH8c29okrdYcPX30slJVnlHOgS3kw1pz+IjXe8B9?=
 =?us-ascii?Q?zH3nRUfBSlUwtjZbwOm53tMDqefeyBLg0Nex1M8tXbAQuvwSoAf/YtVurMSi?=
 =?us-ascii?Q?eKEkzyZTUTcUJpcid+kL2c3I7YBy4zh/T5h6cKjwsDwKQOTZBtSVulwNGrxR?=
 =?us-ascii?Q?F4kuj88CN5Tjuie/Ru/yqC1uOMKTt4wC7yNKMsDdFd4PmeJ2sS+5KejR7Fr4?=
 =?us-ascii?Q?QZk+cnScoy3IaRuNZJj96nb2PqsWIeIpesOiQRad1Yqbofq8su+Uy2eGq93X?=
 =?us-ascii?Q?WiApELrHlJ7EZC/j7Uwtdid5CKr20KU0LI33Lrr0WwITjQtH8uueAB1ZA+ac?=
 =?us-ascii?Q?VmlPkIrUN+xiYtxhbCy/UhYda/+oXQDHaqnxA74Wal7fnrGsxDQMG0uJjSjn?=
 =?us-ascii?Q?B/IDPQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11040.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 647430da-388c-4c5c-adc5-08dd521cf134
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2025 02:10:41.5356
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OJjK5Y/HIAZpgI7u/Wq9afRmuQs1BRH957Vpynw1s9y+arYYp60Iuk9Xlb8DtnACx8rJGLjXK5n3RnkD8xEDlsQfJyAg67Ka9KsMWC1ZwhAzJAR4eJPUG3qRxM7Y5QSq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8207

Hello Claudiu-san,

> From: Claudiu, Sent: Thursday, February 20, 2025 1:08 AM
>=20
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> Commit 08b0ad375ca6 ("phy: renesas: rcar-gen3-usb2: move IRQ registration
> to init") moved the IRQ request operation from probe to

I don't know why the checkpatch.pl said the following ERROR though,
as I sent my Reviewed-by on the top of this email thread, this patch is goo=
d,
I think.
---
ERROR: Please use git commit description style 'commit <12+ chars of sha1> =
("<title line>")' - ie: 'Commit 08b0ad375ca6 ("phy: renesas: rcar-gen3-usb2=
: move irq registration to init")'
#6:
Commit 08b0ad375ca6 ("phy: renesas: rcar-gen3-usb2: move IRQ registration
to init") moved the IRQ request operation from probe to
---

Best regards,
Yoshihiro Shimoda

> struct phy_ops::phy_init API to avoid triggering interrupts (which lead t=
o
> register accesses) while the PHY clocks (enabled through runtime PM APIs)
> are not active. If this happens, it results in a synchronous abort.
>=20
> One way to reproduce this issue is by enabling CONFIG_DEBUG_SHIRQ, which
> calls free_irq() on driver removal.
>=20
> Move the IRQ request and free operations back to probe, and take the
> runtime PM state into account in IRQ handler. This commit is preparatory
> for the subsequent fixes in this series.
>=20
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>  drivers/phy/renesas/phy-rcar-gen3-usb2.c | 46 +++++++++++++-----------
>  1 file changed, 26 insertions(+), 20 deletions(-)
>=20
> diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renes=
as/phy-rcar-gen3-usb2.c
> index 46afba2fe0dc..826c9c4dd4c0 100644
> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> @@ -120,7 +120,6 @@ struct rcar_gen3_chan {
>  	struct work_struct work;
>  	struct mutex lock;	/* protects rphys[...].powered */
>  	enum usb_dr_mode dr_mode;
> -	int irq;
>  	u32 obint_enable_bits;
>  	bool extcon_host;
>  	bool is_otg_channel;
> @@ -428,16 +427,25 @@ static irqreturn_t rcar_gen3_phy_usb2_irq(int irq, =
void *_ch)
>  {
>  	struct rcar_gen3_chan *ch =3D _ch;
>  	void __iomem *usb2_base =3D ch->base;
> -	u32 status =3D readl(usb2_base + USB2_OBINTSTA);
> +	struct device *dev =3D ch->dev;
>  	irqreturn_t ret =3D IRQ_NONE;
> +	u32 status;
>=20
> +	pm_runtime_get_noresume(dev);
> +
> +	if (pm_runtime_suspended(dev))
> +		goto rpm_put;
> +
> +	status =3D readl(usb2_base + USB2_OBINTSTA);
>  	if (status & ch->obint_enable_bits) {
> -		dev_vdbg(ch->dev, "%s: %08x\n", __func__, status);
> +		dev_vdbg(dev, "%s: %08x\n", __func__, status);
>  		writel(ch->obint_enable_bits, usb2_base + USB2_OBINTSTA);
>  		rcar_gen3_device_recognition(ch);
>  		ret =3D IRQ_HANDLED;
>  	}
>=20
> +rpm_put:
> +	pm_runtime_put_noidle(dev);
>  	return ret;
>  }
>=20
> @@ -447,17 +455,6 @@ static int rcar_gen3_phy_usb2_init(struct phy *p)
>  	struct rcar_gen3_chan *channel =3D rphy->ch;
>  	void __iomem *usb2_base =3D channel->base;
>  	u32 val;
> -	int ret;
> -
> -	if (!rcar_gen3_is_any_rphy_initialized(channel) && channel->irq >=3D 0)=
 {
> -		INIT_WORK(&channel->work, rcar_gen3_phy_usb2_work);
> -		ret =3D request_irq(channel->irq, rcar_gen3_phy_usb2_irq,
> -				  IRQF_SHARED, dev_name(channel->dev), channel);
> -		if (ret < 0) {
> -			dev_err(channel->dev, "No irq handler (%d)\n", channel->irq);
> -			return ret;
> -		}
> -	}
>=20
>  	/* Initialize USB2 part */
>  	val =3D readl(usb2_base + USB2_INT_ENABLE);
> @@ -490,9 +487,6 @@ static int rcar_gen3_phy_usb2_exit(struct phy *p)
>  		val &=3D ~USB2_INT_ENABLE_UCOM_INTEN;
>  	writel(val, usb2_base + USB2_INT_ENABLE);
>=20
> -	if (channel->irq >=3D 0 && !rcar_gen3_is_any_rphy_initialized(channel))
> -		free_irq(channel->irq, channel);
> -
>  	return 0;
>  }
>=20
> @@ -698,7 +692,7 @@ static int rcar_gen3_phy_usb2_probe(struct platform_d=
evice *pdev)
>  	struct device *dev =3D &pdev->dev;
>  	struct rcar_gen3_chan *channel;
>  	struct phy_provider *provider;
> -	int ret =3D 0, i;
> +	int ret =3D 0, i, irq;
>=20
>  	if (!dev->of_node) {
>  		dev_err(dev, "This driver needs device tree\n");
> @@ -714,8 +708,6 @@ static int rcar_gen3_phy_usb2_probe(struct platform_d=
evice *pdev)
>  		return PTR_ERR(channel->base);
>=20
>  	channel->obint_enable_bits =3D USB2_OBINT_BITS;
> -	/* get irq number here and request_irq for OTG in phy_init */
> -	channel->irq =3D platform_get_irq_optional(pdev, 0);
>  	channel->dr_mode =3D rcar_gen3_get_dr_mode(dev->of_node);
>  	if (channel->dr_mode !=3D USB_DR_MODE_UNKNOWN) {
>  		channel->is_otg_channel =3D true;
> @@ -784,6 +776,20 @@ static int rcar_gen3_phy_usb2_probe(struct platform_=
device *pdev)
>  		channel->vbus =3D NULL;
>  	}
>=20
> +	irq =3D platform_get_irq_optional(pdev, 0);
> +	if (irq =3D=3D -EPROBE_DEFER) {
> +		ret =3D -EPROBE_DEFER;
> +		goto error;
> +	} else if (irq >=3D 0) {
> +		INIT_WORK(&channel->work, rcar_gen3_phy_usb2_work);
> +		ret =3D devm_request_irq(dev, irq, rcar_gen3_phy_usb2_irq,
> +				       IRQF_SHARED, dev_name(dev), channel);
> +		if (ret < 0) {
> +			dev_err(dev, "Failed to request irq (%d)\n", irq);
> +			goto error;
> +		}
> +	}
> +
>  	provider =3D devm_of_phy_provider_register(dev, rcar_gen3_phy_usb2_xlat=
e);
>  	if (IS_ERR(provider)) {
>  		dev_err(dev, "Failed to register PHY provider\n");
> --
> 2.43.0


