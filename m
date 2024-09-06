Return-Path: <linux-renesas-soc+bounces-8789-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D922496EAC9
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 08:38:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 925BA281161
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 06:38:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21E5316415;
	Fri,  6 Sep 2024 06:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b="WxvyMOVr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazon11010021.outbound.protection.outlook.com [52.101.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D03B13D243;
	Fri,  6 Sep 2024 06:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.128.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725604678; cv=fail; b=iESMukPw0dxjNaaGpCMbmrZTKIgxY+TCkmfcu8GeUF47m+Ulb4W9aCFNEJUSG1Wyck8qAvi+YQMQ3jbelT1cJCep090+k1ygTxkFs02Ti38hIuPD3GiPkY/ctw9nCmU0yc8jj4INlHXeM6/v8QpEVCALvX1wqYVp0V9JIWX9b7w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725604678; c=relaxed/simple;
	bh=EJGd9ZsimyH8lvd0i95nJqSnZY6gv8C8BdKEcSMuuVk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XbqXxm4isQNsPMm2MTL5lxubVZhjh3zQxA1+zqC8J7r0sKaGxq1jRqYHhS15FQiLZhOMiudiduNEqF0EFzvAzZ760LNz+bi3JXQsA0hs1UAkx5QiDFwDHZ1NldQ/7X8X3QYQHX+rAWrn8vVKulcU3Dp15n8R8hZaomdaxZo5NnI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; spf=pass smtp.mailfrom=wiwynn.com; dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b=WxvyMOVr; arc=fail smtp.client-ip=52.101.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wiwynn.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uPW/3Qwj/ND69BaGV1MVJ2CX1e93BBheYMyQxh6SPU6zgrBCSy1ynWxoqhk0jTBje0S28Hti9f61FmpUugYbbLJwx4ay75EqCmPkERxJNNjlR30T7bmeizkW8cl1NincffL9u6b+QUbW1QWK7uLPEheOCFYe1tDJP4MiW7YTLzWhC9REQpiUuZkRa4C40nCqWifljTFjxKrj1heaQzPqth+gB8AU8W/J36bizJ3+udhrXcvATaTA/AAS8z1VkuXOr41D0AZX3YUVCo93hBUHCCVjEgW2rsM7Mg2g/JLYR0Xte200Tv1CMCGYWom8Lpxkj4Z1tfNLV9XyQcGeT/XoFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tt5sD1oCE3iRy3XFBkqJxOnQRlNazNGmBKEO0A0Asoo=;
 b=p4IBIJyAjlc5y3tiHYaS1ERwWGHYTGTj7KmCwduSy9PWIvO2Q09ra0ZWXUw4UM7RFVlT3cT+D3DNw4VPybuRqc5i4j/k7scYs4Hcgly42Q2BCc+gnTttO1LlKRfNrcnU1QsQdGEdN0tFcDsDvIK6EtJ+R0EmkiBEUp4o8R2yBFvct2B3dFEzgA9PkgzWxtHnauICZB0ngL109YXocmjfWykS0atJRpA6xCdUz0jGntIsa7DRs1rPyc4yKcJ1Qwff+jZVznAkkYpgwI9dZgX2R/5U9NQZoO+zBVBHzU2x53faBH8B+MD8l3qHO31hVRGpsu6khYeVe9KUqgFifH2rtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiwynn.com; dmarc=pass action=none header.from=wiwynn.com;
 dkim=pass header.d=wiwynn.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tt5sD1oCE3iRy3XFBkqJxOnQRlNazNGmBKEO0A0Asoo=;
 b=WxvyMOVrsbOfngm43jz7IprCyUgzDcW4px2UTWEQ6BVucs+iNn8toL77RKiyY0dn++nL0gE48WYwK0IWpuUzjTSL81RSTATpSm32jzn7SYTj+lIto0nOB9Qq1+GXIDH3txheeZeG4FvLZ/uagSNohllaE3nEJhLjsnt7zUGyt0Xv59fBo/sBmpCRvnF0tG7Xqqt/Tb6PMS0dGhF5O4lbtQDkZxPFQGeme1HU8oS6EVLQvXNNZTAY1Dcib65o+v4kkHjcHnSRtKLRmKYGew1Pd3GvbaBFEU/PoeoSIE4KAdDgYBN8QmZgINroNIVm9aMGfDK4IDRLPgkYdZDM+bbfPQ==
Received: from TYZPR04MB5853.apcprd04.prod.outlook.com (2603:1096:400:1f3::5)
 by SEYPR04MB5908.apcprd04.prod.outlook.com (2603:1096:101:68::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.16; Fri, 6 Sep
 2024 06:37:46 +0000
Received: from TYZPR04MB5853.apcprd04.prod.outlook.com
 ([fe80::ae7d:7486:9319:8d96]) by TYZPR04MB5853.apcprd04.prod.outlook.com
 ([fe80::ae7d:7486:9319:8d96%6]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 06:37:46 +0000
From: Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>
To: Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>,
	"patrick@stwcx.xyz" <patrick@stwcx.xyz>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
	<magnus.damm@gmail.com>
CC: Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v15 32/32] ARM: dts: aspeed: yosemite4: add ISL28022
 support on 11
Thread-Topic: [PATCH v15 32/32] ARM: dts: aspeed: yosemite4: add ISL28022
 support on 11
Thread-Index: AQHbACYdvfGLtgAtHEuApcV5Lj/1sLJKTRLQ
Date: Fri, 6 Sep 2024 06:37:46 +0000
Message-ID:
 <TYZPR04MB5853E02120EFB41B9AF9464AD69E2@TYZPR04MB5853.apcprd04.prod.outlook.com>
References: <20240906062701.37088-1-Delphine_CC_Chiu@wiwynn.com>
 <20240906062701.37088-33-Delphine_CC_Chiu@wiwynn.com>
In-Reply-To: <20240906062701.37088-33-Delphine_CC_Chiu@wiwynn.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wiwynn.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR04MB5853:EE_|SEYPR04MB5908:EE_
x-ms-office365-filtering-correlation-id: 0de0d73e-d9ab-4005-79b8-08dcce3e6b93
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?jhmnVOUWrxOPkedtiwjdWXd89FNHvhhwK2GihYHwewXayM8pAC/oDT7XYObH?=
 =?us-ascii?Q?rm2+f6686PfO2TSKOlPBZwzccEEe7nQUeYsj+nX9hh7cIF47uvJ3385CTxeM?=
 =?us-ascii?Q?JVB1/lkvscVWfnTFGXgoupLXpeD56nM3Y0VRiInN+vRJOxCClPiZrS+6H7Cs?=
 =?us-ascii?Q?ivgt1YAOIdULuFwpWpA40IfdRbwFMQATT2C6CRgnosQunZ86pFXV4a+2W7JZ?=
 =?us-ascii?Q?UPBHrPE/b68FM/iQHdLyaXovDH+0DZjMTgNmapt5WUzjZniKOqyp3CnNRlr/?=
 =?us-ascii?Q?kwC/YO0B3Ku+ZLxGbjz1hgIVcNN+zHl3WXiRh3uganaeLWsdY+4W2nc+ul1K?=
 =?us-ascii?Q?f3N+9VGpHPevE3haw8YpHniGfgleDqWPDhUEmwkDMd+BtLA/iQh5sKtqRXaD?=
 =?us-ascii?Q?Cla1u0K/VM22WMIzMuHnMeMcloGHltLdIuDXVk+3Z689h7BqLulMuFwQ1KWg?=
 =?us-ascii?Q?+CYaLUrlMhEOPItLDDQOibsdAUB7TncVfmz/iuIkl/bhgPmobKxFF75ia8oO?=
 =?us-ascii?Q?zlUZrwzUIDqsZOEzPovxatG/RdHhndTOxv0zzlGY6/S77SZFS1Yc+pEdPpdk?=
 =?us-ascii?Q?4EYCabhwhVQLwGelAv64nyCiTU2PGfzVxZWGioFp5pT0A5CHIhl9co+KQRfI?=
 =?us-ascii?Q?41RtloOusaRcVMC+l4zpdyaDvUp1HiGnWzvEmEq5cCojDzD9NF9SKxuV0W3X?=
 =?us-ascii?Q?ERBtcC9zClQEYkCinc7hhq2UQT6nJdh+cCs5Tf948CWYX0O1di42/zvx4YTq?=
 =?us-ascii?Q?+cMTWMi4RudrYEY5kJKjDSxj6asy0Y+OkKCZtOUB6FkNc7o3jTrWVyHt1ATv?=
 =?us-ascii?Q?b8aY/aBPALNWI8sA4ormbkXUWqP99wjApm0r3ukJKySw9aRG3VAAbLs0zIHU?=
 =?us-ascii?Q?weELsvz5462imGF7C95UhBQlTg0gB1NiyaRR8TPojbck0yH9gvw1hwYcrvon?=
 =?us-ascii?Q?uYDtNDHyXH++jekRvgKqDBUKSLFSvMrLiBaUj8c4UOR945UPJK1LaQkqnTDK?=
 =?us-ascii?Q?9B+b7S9VM9CQWQ9foNzwBiff2etxwZ/L8/XAfrsZTL52AFAWqRaKUWVTp8ds?=
 =?us-ascii?Q?1VrMb23uptbLiNaWY0sJOANn2eUgsprw7xWQd9HMVv4FiXGFi1AUp4xOa60j?=
 =?us-ascii?Q?txsu+sUpYpzrjYneccG8E72QZK8MNfjWJCE3z+cZ6v26w21dP2jmdCHLSUnH?=
 =?us-ascii?Q?vYXe/2fLpt27ENZkchrwY2GqAFObDtU0/l+q82inilIMHvCum+x74mCDXDJn?=
 =?us-ascii?Q?sHwUXutAJ9zCJqZde/xZAXu4LrShynKAGLH0isHK1/4lZTkKzyh8G26Xy1uf?=
 =?us-ascii?Q?kI1v9snkQCuafjo6FtPIOD7nKVcHuaVQNYKTiBgKnU8xWTVnItjKJAbqmpyh?=
 =?us-ascii?Q?AjOITlNZdAM3+E4lkFl6+8S474fMN4cKjnFxRQkdNIttuLjSdg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR04MB5853.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?uv92bypervrq+PZO8SyZ22/gDbQaBxoDcG9mb+tDOQGGN+56i9sWTd/2y7C1?=
 =?us-ascii?Q?rEXm9vEWfE+53Fd645shgqXGCgnvMieTISVhOnm7YurZgQdSgvGbzBz3yIyd?=
 =?us-ascii?Q?IjR/if6tTHeJb1S9iHFxwSITRgcFBpUyeTTBjxdMMefZG+MeNer61JVeHZYf?=
 =?us-ascii?Q?etBusQPAfNMzxT/ccu3pDii61Gu/mSkhHDy1MjcQTrWdvFi9ssbJsoU22z97?=
 =?us-ascii?Q?QCox//Asd+w+sg/yNDnXdwku0wivGSE2kn73SjUXs8xW4CNErYCUAoVS/2yv?=
 =?us-ascii?Q?irJmtzuRtuBDMmYoTtl3rfgkl1IaKEWAb7rWj1vFiO4f/lbcgbmaX1WFzUTB?=
 =?us-ascii?Q?fxZB+TQXiL/CpPBgPhS79S0WpD6RVwM2kigLMOQqINRrxx6Yc6UxXu+LaxvX?=
 =?us-ascii?Q?S3uHpvG4wjcO4X1dRc1iGvdf5uxDPPS3idrW+y6PH5Pp+PSS0T90JRO+kV1t?=
 =?us-ascii?Q?xUIaJsOxROvP2/42E1Rj0LCNhxzKl5RKxD3Qap742Lxdo0gc/mMDrPZ6Arwh?=
 =?us-ascii?Q?HYL37Uvp2HEd12NWJ0wEb0dY+K9eqyQY75NGHY3v9wmSi9woauCQ/bZoxPb2?=
 =?us-ascii?Q?j2/DyPAs8vOBoSThATB0BkPoMP+BuHCNn/kp+Qb2C4jc9noliXaFBthyCXie?=
 =?us-ascii?Q?DnXFEK9w9wAeCFlong6MhulMiwtj12iOmQvCJUztqxmuY8D1UBrdKdS1KIbo?=
 =?us-ascii?Q?cfIV/tnhn6EjqKr5iGaJQc3iC0Mh6CVBL44BgQRwpaWC2HJD173D8VN5wPJx?=
 =?us-ascii?Q?Ao33dzFXagkwrsCa3hD1PMnk2VomRdr+ZlNDz61bZire3tyyUUrhmArcLZ4Y?=
 =?us-ascii?Q?Pxr1ZRPoXyywxsgkYQ35xPbYNFq+5UScxNjs7RdvzftmJRAv0TZIlLgfCXOk?=
 =?us-ascii?Q?15zcGh7WJm/js5xjdfliJuhuX8uPShz3C2860+sdkZx+hsKzZ/EwmIs67mMP?=
 =?us-ascii?Q?zs+vDGKEU3sH/wD9NBtevaN2y/oSeedmK1o35Fns9TgukzHaNh98TPS8Kkz8?=
 =?us-ascii?Q?tS0QTi+uJOt7wDJj4IkEEMRdeNCu2sb/gIvHgl1EQdjdGbOMpnmHUtQthrop?=
 =?us-ascii?Q?RH+fgYRdMaZso1mslwLJt/pRojHm5hZ/U9JPdVeeCvJoMlOxNFriex7qGW3F?=
 =?us-ascii?Q?QxozSdfkzpmZXJShnvZRDuo0VijT1wd+OTOVZw3eA1HRMQhcvCcYOUgXDR8j?=
 =?us-ascii?Q?YRx7zXLxWrWp+CAUNtYa+gMv6Lf57IBgfiQwEcNcHuFDMyLlCsbFGp0qmEFm?=
 =?us-ascii?Q?z7mKhwePj9mN0+EHEuMhXT5ffauD1mj9Y0yReW7658jBDJaN7ssaFPtuHSOh?=
 =?us-ascii?Q?B42Rxr1B+pBo9W47OdmbFz2/YIv8q/7e/ib/dPKF1a3y2IDcE7CHKkKdMeCP?=
 =?us-ascii?Q?FvE5ydI7G1G6ycwumo0lFdvZUstx6MPULEm/etsGoy2v2vFOeKnWDxpw1vI9?=
 =?us-ascii?Q?xEDwP6oug+/VfrpD7jSm8Wp0T47NYRXVt1Mqc6rc4jpvs20kvOZVbSrGiyBU?=
 =?us-ascii?Q?MAfZbIW6vSnS9m4PZavt3Hlfq1hJhp4WFbAejTUWd5RqjYvNhBWxR378NBUQ?=
 =?us-ascii?Q?tdtXe0WEPUMXPiFbBWUHSxqclgaa8bYlkV45WXZS?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR04MB5853.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0de0d73e-d9ab-4005-79b8-08dcce3e6b93
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2024 06:37:46.7320
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0iiqVqrYQL8GluuTBCapNRTgIW1s/e12Ylf2clADC/tsYz+228M0XT6mmw3niDVWXtMPZcJ5QUPmsyIYXZn6JQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR04MB5908

We are sorry to bother you!
We are reorganizing these patches and will run the DTS check before contrib=
uting.
Please ignore the PATCH v15.
Sorry about the spamming mail.

> -----Original Message-----
> From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
> Sent: Friday, September 6, 2024 2:27 PM
> To: patrick@stwcx.xyz; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
> <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Joel Stanley
> <joel@jms.id.au>; Andrew Jeffery <andrew@codeconstruct.com.au>; Geert
> Uytterhoeven <geert+renesas@glider.be>; Magnus Damm
> <magnus.damm@gmail.com>
> Cc: Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> linux-aspeed@lists.ozlabs.org; linux-kernel@vger.kernel.org;
> linux-renesas-soc@vger.kernel.org
> Subject: [PATCH v15 32/32] ARM: dts: aspeed: yosemite4: add ISL28022
> support on 11
>=20
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
> ---
>  arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> index 0341b61aa1f1..e0cdda701c24 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> @@ -1088,7 +1088,7 @@ power-sensor@41 {
>  	};
>=20
>  	power-sensor@44 {
> -		compatible =3D "ti,ina238";
> +		compatible =3D "ti,ina238", "renesas,isl28022";
>  		shunt-resistor =3D <1000>;
>  		reg =3D <0x44>;
>  	};
> --
> 2.25.1


