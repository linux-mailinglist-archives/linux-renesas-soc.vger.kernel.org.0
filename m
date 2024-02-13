Return-Path: <linux-renesas-soc+bounces-2692-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA24A8532C6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Feb 2024 15:14:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4CD3F1F275FB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Feb 2024 14:14:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E27355732E;
	Tue, 13 Feb 2024 14:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="mjXnJMIt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2079.outbound.protection.outlook.com [40.107.113.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110D656764;
	Tue, 13 Feb 2024 14:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707833672; cv=fail; b=Of+y7kfsGl/HjkE5Ihzry+8GcTkC9arDu5UoipaTlRdOm7eeSkHuuNr3hS9ws0B2haqCZgzr6Qgs81W7lVZq7tvBlyAfV9ZxtVy2LrFmzmLCfSDSg6O/yVJ8HwPzXz9vY2v2eKUmU/gvcYZJ8Et8UZGLtV2Kx5Kuz+5B5d6W7Kc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707833672; c=relaxed/simple;
	bh=UmDx3pima6m5+Hcl21wgDy2B+3Zq6ByBjbbU5/8YEvM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Z/ODpXttPDN0C4RmDKaVYRl1pngxxBQrLBMeV5jmRp+5lxk4FOMiAKG6nrD8oYhl4mwiNkp78ib6RD5RfCxtXzDC7CyUP8uzp7FgO34RrD6etvuj0R//D41IRdcTsSznAf3YvU41vMKMxRqxGF00LkdGFJBZbOb+65JGBvbKP0g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=mjXnJMIt; arc=fail smtp.client-ip=40.107.113.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KAEtbhSZwCmoYiXeN9RpayuXj6AsiDuVZFIQk+NLDE6tpmWgZu2dr7qVXE843loYCywvAZdUIqF4HjcBYMejT04tfaVZOT36zZ3wynRh5bQpDOaQ0q9BhoiSDHnjwUeFkmujJtbvlvjnjp4nqdxECTjvZLs19I1/kSCXMBjguJOpu5LOdl8ak/xxfd8R8hZkNb03NhvzViN+PPEk4yyXae+tBj7I+XiEuZ2+f6+RzmVzPLk8h5F9KLQTDYy442Lfi9GG+TXA2ce9Wzvoi4LgG/7NIrLPUz8bVFY3z6BAP/MJtwhEJhYitsDDnqotgpGJzl6sMhVqjQBxJsejqHhvcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mDFZshB7oc7UUPsmJsuNgZUJmQTA2SBgnPlMXsVZ1c8=;
 b=JpwbMtNdt9t2Fj3mz/axiIbZ0rVOjsmuHZbvVK0GCK50T3P+6nXnhK3r4JKHKXxDFjJwTbvU4hQpN8yjf39ZT2P15qQzuyM+BVrj+P29P35wmx3pYBHoFAqEe5Mq30VoSry3jkUo/3oJMpJEkILcTzGedzIgHTl/WiBPbHDF3ZGen/YCmKrI47y71Ti3mXQBJzBXrsRCRHTszTkanHaLlpKjNcg+vunZxe0VhO+ngqGCinkvQ2wnif1lxMUdCCOFOLMjvwbeGzKocSctPSY4jC6BpfUNPi6jiK1R/R1KFfj5DFfCwuhTsIyPxhX3dzaK49vO/le7MOVdsJASi+oHeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mDFZshB7oc7UUPsmJsuNgZUJmQTA2SBgnPlMXsVZ1c8=;
 b=mjXnJMIt5Rkvwm2lC0NahHycEbIbDnUDEU72mJ6WUBSxW8Pp0FuI6NU/slM5QrQMDMApwU4xlg08LzT/fejoXWUdUan+GroxO6LvK2pCjNssjfuRp2FnspITsYU3s0r+bPYz5lOq7+XdLJ355j5WdzEVEGj2fRzoI2GgmqVtmm8=
Received: from TYVPR01MB11279.jpnprd01.prod.outlook.com
 (2603:1096:400:366::13) by OS3PR01MB5621.jpnprd01.prod.outlook.com
 (2603:1096:604:c1::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39; Tue, 13 Feb
 2024 14:14:27 +0000
Received: from TYVPR01MB11279.jpnprd01.prod.outlook.com
 ([fe80::30fc:68c0:95df:41e9]) by TYVPR01MB11279.jpnprd01.prod.outlook.com
 ([fe80::30fc:68c0:95df:41e9%3]) with mapi id 15.20.7270.033; Tue, 13 Feb 2024
 14:14:27 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
	<magnus.damm@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH] arm64: dts: renesas: rzg2ul-smarc: Enable CRU, CSI
 support
Thread-Topic: [PATCH] arm64: dts: renesas: rzg2ul-smarc: Enable CRU, CSI
 support
Thread-Index: AQHaXoaLhbCm2bd3t0eNBmZOe0NYErEIUIRQ
Date: Tue, 13 Feb 2024 14:14:27 +0000
Message-ID:
 <TYVPR01MB112793DCB8D530E33E8CA3B1B864F2@TYVPR01MB11279.jpnprd01.prod.outlook.com>
References: <20240213141125.159758-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240213141125.159758-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYVPR01MB11279:EE_|OS3PR01MB5621:EE_
x-ms-office365-filtering-correlation-id: 1a832bd5-e3e6-4828-d6b8-08dc2c9e1653
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 3bzH0PaxK8E8xR8sUTvfNC3vN0hx/iftexq1ueK8rktKFSNyRiLNBp+KCzF7cQXZuMTCFPlfehV6u38A4mpHOp6Gex0tzDKSSwzOSu1hbqSn4dkrtlwxqxFRIokGqKcV0uBVgNi1Yyxl/BfxA38OcIg5qNKMQtOMgrO5YER3lZt6xhSh4ckCOnD3Vx01pWkxgZcxid5mgaXEZ2M2o3Ay3joXpJE7swXxGqULMP1kwU3X7YXpg3QT2rTsy1g6I4q9Fq5pN1AIVjtLiRBHn9/9QqxjnNzWbsiN9VhMsEWrjIbo4GiOviEf7j6PPwe8SXeEjQso7nC/ZiKnFhrEosBf6TO+9XKFXro2jw7+prTVkbs4TH55RicL73mLY3dtNG1ErwXcLQsHIvQN5fTwu6S1iEzTqFTCmTg7CHz9loSttOk4GgbN17M9Oz2lKf9F63mNk/qyCytUfxU2DZ6Jqe3q6TqmP0X+UhUP5y7cXj4b+uW3897z6670s2n6jjcTNcPnoubRb2cIRQneAKcN0aduSDFwqqMwDOT/qAK5wtmrLKQudpMMa62cs59ebMCCGDDvkxVdUjkEzJEAeboNv5VQfasST/JIyhY/xYi2Le9gTu2fvdpeEPsmHhitw86cwWnf
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYVPR01MB11279.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(346002)(396003)(39860400002)(366004)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(4744005)(4326008)(76116006)(66556008)(8936002)(8676002)(52536014)(64756008)(54906003)(66946007)(66476007)(2906002)(110136005)(5660300002)(66446008)(83380400001)(26005)(38070700009)(33656002)(122000001)(86362001)(38100700002)(71200400001)(316002)(41300700001)(478600001)(7696005)(6506007)(9686003)(53546011)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?u+nJWTaJCVlSxPB/oqncmkTPKYqQfsUhqPbRPlLST632jKsRO1Ukqv4P8zYE?=
 =?us-ascii?Q?e2UW81gXciV7rY1pJx5tL0LCMtbPobXmgD6PxV0EvH8DaMzSAssvfGkzp1Ni?=
 =?us-ascii?Q?8vr8DzQcEqs4458+5iFeHezlRsUQmFnvQTnayVfnV6iQeiO9cpDX3rbpVf+l?=
 =?us-ascii?Q?B4tkowFQ0Zyd2tGXOpNpexNyD9HOzY8n6xdykLaGiZJBsZRcaxfIHDYveFDd?=
 =?us-ascii?Q?PN41rKRD68oa/6DxUj10iqTO4wudIlpzXJ5aqlyvJV8p6RpPpP8xERG6yqXi?=
 =?us-ascii?Q?1LyISEZkaUrDLkfmmpU6kLgnqV8q8fbzdNqhLWH5PeqwLKcHjQEgCZwca3Pe?=
 =?us-ascii?Q?Apa+9D/bWVZT1UhGQ5BVs+O0MkVgoiyRf5ep6OL4jBE4DdWpUvlJJga8VdD2?=
 =?us-ascii?Q?pNNPfnjftwXQZJGRJHJAx4J/Sdw48zhe6e5iF78l8vZuJ37zrdh+NV5dFUqY?=
 =?us-ascii?Q?LwHaGMm+Yt9w557cN1LmybBjXGse6lMYz2KZPTQIV3ofhbiogEM09ZOfrrAn?=
 =?us-ascii?Q?SHXC05hZaG2zQNSdGqI2O9Iej5i6vRr8q313vKwlTzlbzQPgYm1aHCsyyzUf?=
 =?us-ascii?Q?BVjURbdkuR9804lUnb9Ks/Su+Quya2OKxFnsIkKPqSLz/w7w+BjKAF1kFS8u?=
 =?us-ascii?Q?/U89f6zdTLG4cccR1cWX7SmKlfl0HiuZi1871KrMyowrLVMEXtgYVKnJsFKe?=
 =?us-ascii?Q?5uvj6b+0ZH+M1oQnsn3B0v8x4X3f24UOZM+GphaswE62iDrGxlNRF5lF+q3w?=
 =?us-ascii?Q?WaTQNP3BBAPPG0iEYeFrOyfDBJwrR7QJV7KP4UgFkvu8VbpqNAT7lhUNhAg1?=
 =?us-ascii?Q?HH1mwXjFsftizJngSqe6kGtCBGCD4pelunge16cbkkI5IwR2tpZ4d2bQ03Zk?=
 =?us-ascii?Q?TXa8K2C0x/CSNU7AoVFxYEPZczqR2XAsDjERwlkfv81tHqx0K9WoaoDfN0Ww?=
 =?us-ascii?Q?KZMYg/A9RKz8ZshtBui2QOT1Eg81LW6+Y6L0uvOGuw0nOrGLbCGAwMe9Pnui?=
 =?us-ascii?Q?UBrsYiWqSIR/byPcQ5yduwCzFC4dnEIuPgsEl8Jql3bGajfbvjlgSo8GkjVn?=
 =?us-ascii?Q?NTiGZnQAlyKg5Ke/19Hti3fww2Zqx3MSl3J7c6mkQET06AcKEyQfV89+xIxt?=
 =?us-ascii?Q?GIIKyyRX0bDpQl2LLjfdQvas+7WlYnicwETljutRd3msAoGuW+wKO3YA0Ai5?=
 =?us-ascii?Q?qSElMOaN5+DY57SFNd5RVMyBsh5gDDiE1epwvzWkcm1lFXqwteEzKWd69gjx?=
 =?us-ascii?Q?3cUrcZC6k4bPYMbd0o24apbAhBM0d0bcsUMfhgAjHqkOxSNFolWa70StvF57?=
 =?us-ascii?Q?sqNYE9NTWeKvxu3HmGU1VEDJ16BLwpb2HBSkDIodtdlv/ecAMD7Mg0ae4nOR?=
 =?us-ascii?Q?8gZ6I2axJgRqXrae7y+Yy1KmI1jawtkt1I8D4otwl5vXnpF6a9OaNiHhG/ny?=
 =?us-ascii?Q?hqXzzFZeEnfIFDrfdSDYlmr4S7zZmlJhRhkGIWFds+J4ofS8icGYSF8Zfpe0?=
 =?us-ascii?Q?YVSk2OA/jW/lJBoWEeXp+6Vek607j5+vTwS2Sbp63DNMc+in5HYfGDVusHAm?=
 =?us-ascii?Q?tAubhtVvcfVrqWgJ/MQL51MspvwMo735o/z9HIStFmYVGydb/Crpd+IBjZpq?=
 =?us-ascii?Q?yA=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYVPR01MB11279.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a832bd5-e3e6-4828-d6b8-08dc2c9e1653
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2024 14:14:27.0468
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k9JTiveg4s1meu2NfIOVxihWaWsumkJq/+ia60AuKmRee5Le163N3ajI0u9Pu7BrU8yTaIfGxO8SUtRurofsebfsxkPUVYL2wiiFJeDc8HI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5621


Hi All,

> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: Tuesday, February 13, 2024 2:11 PM
> Subject: [PATCH] arm64: dts: renesas: rzg2ul-smarc: Enable CRU, CSI
> support

Oops. It is v3.

I have sent another version fixing it.

Cheers,
Biju

>=20
> Enable CRU, CSI on RZ/G2UL SMARC EVK and tie the CSI to the OV5645 sensor
> using Device Tree overlay.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> Note:
>  * This patch has a functional dependecy [1]
>    [1]


