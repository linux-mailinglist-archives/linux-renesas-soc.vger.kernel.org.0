Return-Path: <linux-renesas-soc+bounces-19488-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C7AC3B0022B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Jul 2025 14:38:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0244C3A55B0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Jul 2025 12:36:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3342F24DD07;
	Thu, 10 Jul 2025 12:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Q9PAKMnV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011010.outbound.protection.outlook.com [52.101.125.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081C7223DF1;
	Thu, 10 Jul 2025 12:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752151026; cv=fail; b=XiQEPwDFMQx+voS8LTm5CW0TMzY/GhdHTuQSoMB4yjh8rOazjOpGcC2UR6wpswdfRshBToQ67G9esQ2+8Hl6c7ME3pCD+8UlszOEU+azE4U33mrNh/KhNXXq1Sy56od/dNKnnpAgy3arGYPhu7MELimLrOd1K6/eE7q1gv8ZWWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752151026; c=relaxed/simple;
	bh=Zl93mRdqXaiATNU+rjKx/TqE4fTBDAhWc0gWykSgr+k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VjVYOwOw7iadpF60UMyum8S9KJ+2rYIc3gTeS1dZ2XZFIASP9OMs314R/rrD1n/VLGv9qL1jX8Nsd4LmPxYoWnewpRpAwF3TT7SEfuft0eCsbxnfq9ADoCQLIgqt3H281m7Uc8oYMqWm2zvOVfHjQ93Z6u0G1qXSwsk7aR/pTLk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Q9PAKMnV; arc=fail smtp.client-ip=52.101.125.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iTVlMlIcrO5JkhEoQjDQjhLVm/0YNaFeCb8qRmthicU2kzTqVYPosTYGmC/NfMLVp+ZtqRaZRjz90eFpz7Rt2DruJd60mi5AvT3QD/Q4uj59h/bmh83pKkUhnCdXwPIqZtB642TBz+xA1s8SLeTP/Xk/w3nrLUsWu2OiD+648vsCJkaMud1MratasOftdCF8NLY/xYvyvoXzxJ7S6iaX5c16JAYmbivCDfXyExt3PDj++pgTC16vwXsZXTvO3a1iQa7zjpBsOiWTynxAZG6EWKKOozpGt1Ru3yDJhS5U5ovTMr33+T+/LP56bqNQRX4+4CduacwXypqSTRihs7stAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yprgy/kcTb/Vg1YsLAveGZX3X2HGSXVEkhmqq0F4G8A=;
 b=Fd1I6ezyiNBf4yLHOSELAAdTW3f3ZPmuC7V3DOQdY+1QWVMDAAxpOLmS/Do7pNTDF8sPN0pVFcZ9j8vFEIxmBZnSJUXk89bhqV+5z3a48uZoux+huflzdPmF85LZar3Z3lwPehqt5Orc6sitGzMsR+qLuOSNkCbx3CpxyXZAx268HPFzcqk0pZI3xAZuTkwDXXMh8adz4JUOaVjS1HypAZvRhzmlqi0JwHX2NfOx+IHWY1fUMDVHLzQixmxpEtcgoGFq5kvI09C72Fj27EiVioPNcG72WOLxUe2PxeesLc7l5+SfYulIzaFabw/f6W3G0r/x0fasBiSAmeEV7xA5EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yprgy/kcTb/Vg1YsLAveGZX3X2HGSXVEkhmqq0F4G8A=;
 b=Q9PAKMnV1c9jIMt1LqeiUKZCTGhGOWn1giQi7AgOzSswN1ysESOKd18FF3HyWcni84fq5HHuiFnMz/OPMQbEu6QYkPR8LCFGYpHoStHhAw2E4IAiHk4Cm7F0X8KscChxuVvy7gKEutJcXcGX5RlXIYgTIpdaUyH5PnAGKvU7KhY=
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com (2603:1096:405:20d::9)
 by OS3PR01MB9545.jpnprd01.prod.outlook.com (2603:1096:604:1ca::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Thu, 10 Jul
 2025 12:37:01 +0000
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::37ea:efd9:8ca0:706a]) by TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::37ea:efd9:8ca0:706a%7]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 12:37:01 +0000
From: Michael Dege <michael.dege@renesas.com>
To: Andrew Lunn <andrew@lunn.ch>
CC: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	=?iso-8859-1?Q?Niklas_S=F6derlund?= <niklas.soderlund@ragnatech.se>, Paul
 Barker <paul@pbarker.dev>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nikita
 Yushchenko <nikita.yoush@cogentembedded.com>
Subject: RE: [PATCH v2 3/4] net: renesas: rswitch: add offloading for L2
 switching
Thread-Topic: [PATCH v2 3/4] net: renesas: rswitch: add offloading for L2
 switching
Thread-Index: AQHb7+qaUvmWH8hF00iTJeuZYkkm3rQoxV4AgAKJUDA=
Date: Thu, 10 Jul 2025 12:37:01 +0000
Message-ID:
 <TY4PR01MB142825AC7A0E8AA7AF53D9C168248A@TY4PR01MB14282.jpnprd01.prod.outlook.com>
References: <20250708-add_l2_switching-v2-0-f91f5556617a@renesas.com>
 <20250708-add_l2_switching-v2-3-f91f5556617a@renesas.com>
 <49f58ebc-04cd-469a-9dcb-6a2a7e0ff0f7@lunn.ch>
In-Reply-To: <49f58ebc-04cd-469a-9dcb-6a2a7e0ff0f7@lunn.ch>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY4PR01MB14282:EE_|OS3PR01MB9545:EE_
x-ms-office365-filtering-correlation-id: 76558057-1bde-4201-202e-08ddbfae7817
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?ZZShcplQmmy7pQxG8/Nmth/ZHlxrREbrvObuBprsmHMfwB2QQOCoCvgBQ1?=
 =?iso-8859-1?Q?ILDMRen81wBxRpFDN6qsJISQAzrb+D2lCRtB7p7D2krfYyOCZKLazj8xTP?=
 =?iso-8859-1?Q?CX/KsbJBseVZV/IKony609Z8ND8t46JPnkDHrJJWSssIpJG/znrnN+MFSP?=
 =?iso-8859-1?Q?kvjh4QR8o1OYiPORZOcf7Sz1pVqYVtIhi4EDt07C089kGvH9oBHgui5FdR?=
 =?iso-8859-1?Q?ecEZ6tJ0eKnICEt/+vWC8+SQzZBqwHYOAVzN5dSG7fqCqJO5nsyR8WJAf0?=
 =?iso-8859-1?Q?Yrtsrjq4sLRuuwY1Oj6g1o1WDo4aj4Vyke5rQigakUBXMfyFCBXaZE+k6C?=
 =?iso-8859-1?Q?GbAQNOY1lEzA6HWwmTcEGqWyv3/xy6kyw9NwRsn60dAau3MKzLm9VB4DwN?=
 =?iso-8859-1?Q?kr072Q3+OaTcwTY1M2WyZ8k10gDKAJiR191vESUETw7JaJukYYdJUeSAZL?=
 =?iso-8859-1?Q?5VosRriDBbk35ejS9EGKpSvqRw7ubOIDmfAYW0g+oUHo6YbAAbSVUg3VI4?=
 =?iso-8859-1?Q?bkD4XmTNyfGhbD2272EyUjigqFUTSK8AKXPCM7Xz9gsDWvpcgj35Y3p95F?=
 =?iso-8859-1?Q?vVmgs3uEQjvJ1FSqgQ8537qOY6BQR4XGMbxZZCBeyQZ8Mvs3urgAesQHFe?=
 =?iso-8859-1?Q?dOTmtUTPAKV+YZrDNTqqNcESPfkshAh03+FF8E2zXIDlgGBQ4CdycoU4p7?=
 =?iso-8859-1?Q?Kq/2oyQPVnq9dSDRA4M7bCYBlJvaM+lcL8EpJVPzI7UFsLkeUnRCPEQTGY?=
 =?iso-8859-1?Q?Z2v3LWc35G9Sk5ydXVlh68iOS93wRKV+elHHTuDi6N1TA5bAoIOCuvhbbv?=
 =?iso-8859-1?Q?+VTZECbIbjNqEWeV0Vc9W8kIklGDyY72kPMegaHA3t5geoaa5eoCqDljpg?=
 =?iso-8859-1?Q?hRpkYnmvDQTBzqUD6fnmJvwBhYVYHcMxLJS8e6G4WvrGjDniY3dPnqfR6s?=
 =?iso-8859-1?Q?dq7Va+tFJvJWNwnlypjKOxs0B26AfN69rscFr6vtY9ysb0orpJ0RqBtA9S?=
 =?iso-8859-1?Q?f0fnRSDfWxpOldyhU+sHDIjDpHjTf59bgm3C5GiYqsQm4vqSeS5VAgkTMl?=
 =?iso-8859-1?Q?Fl7E+hYPzLnzX2RnyZPHSVPJnBpvr238WO8ZESm/X7HR1tR5Ea9wQtomlO?=
 =?iso-8859-1?Q?kQdDVNMutFMxNVh/hkbnYvYI/rTQHZmoZHGN+rTFBW4xiWCPRBZvQ4OwYL?=
 =?iso-8859-1?Q?q/BgMTamKjHybQZJG3rWPZ0xkuI0doPPLXbL7tEpBc4b030Nd0+9mbV8Pp?=
 =?iso-8859-1?Q?VkpjwKFzBqa5ToWNiZuK8kXtvyT2BkvOUA8mTvxjP8aZBHnhMGbDG202oc?=
 =?iso-8859-1?Q?fVJBQyHUyE7vYCZQAhGBXb0s59MhqLm5WoO+qZMv70CZnZyG0azrHCUsiy?=
 =?iso-8859-1?Q?BCMbWSME6hlQB/fdWaYz0/quYREvDGV70MgBK/XPb5gbd6eyinbwbmk1Jj?=
 =?iso-8859-1?Q?usN3TmQ4uYdYxlxitPHqqVhY3jYuLeWa7jElRRcCT+gWlR/qXwU/vcHk+D?=
 =?iso-8859-1?Q?ZgQ2ey9r54oBJe21BMmtLTKR8/+jn8aUnLigt3MxgFcg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY4PR01MB14282.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Ons4w3j1YSWilJKM/AqyXyIVlnWut98XlWkEZP2jDnEy0IavicsqYl/nQY?=
 =?iso-8859-1?Q?uiY1SuKddoG1p6b/citHuLdITTvxw6YfNpXAIAMh59bYus4/JMih0YsZcl?=
 =?iso-8859-1?Q?96xr41SKj0wL/gweU5CDcBUi9kvBMsCoX2wM0KKE28dY473bd3SY5IqiBp?=
 =?iso-8859-1?Q?BTYVjLbed1MTFL/4j+2GtLgY2a1xfrz4029r5XMNticeFJwMrQQlJMlA9r?=
 =?iso-8859-1?Q?M4CO5/uo8TP0E4xBZtEoVigVbbdd+HtWa6hnJRaVh1sbxD7UAn+AZ7jpZW?=
 =?iso-8859-1?Q?c6SHWFb7qBFgZmoJ91Gg9wIeI0mr5S4jXtRC40kbWcylyZw1Kj05jGZhPP?=
 =?iso-8859-1?Q?pRICiguLU6aTc48fVVQZTM3bwZlI0AX1z13u/3eHRD3JSruV1Ns6oUsXJb?=
 =?iso-8859-1?Q?LKto7Sldz0ctZVdx9qSM83epR+4e5GwUj/4ASagTKBhXA+s2YdkKaPpcnH?=
 =?iso-8859-1?Q?3Qu4b7zDqNePaviDMBHYmy5pfwTx10IbMSotrCN17SquBiQGNi8k13Ephy?=
 =?iso-8859-1?Q?DIUx8NR2TO7cKysOhaGjjpBwcABsIKktGBJa6hbMUjY7wqM4Mm9e2EMybK?=
 =?iso-8859-1?Q?3GsbnW6yq14ctVrY0aups8YK8TBmSC40D1B9FFecHWbUo8uv0yE0iyJ/th?=
 =?iso-8859-1?Q?nfoEbkjSWnYWDAY8rW12cHLDE+yJhE4aSNvYVDcEP9W+OszPvfthFfGodH?=
 =?iso-8859-1?Q?05kQNIhOXfs9Wc2kKR0iyAr2kadIUji7godF6GQC4goOUNj6K+dA2KXzkj?=
 =?iso-8859-1?Q?ngUo2oVKVwGLt0PXUfrAz0GyRs8L70YAnLTA3lY1jjKeDSaawHHcQzoPt8?=
 =?iso-8859-1?Q?q43Sm65OhbCef/T7eujUbDmCsfoMUasA1NAZzOe6zpBdQNfsRidJ40Z1mE?=
 =?iso-8859-1?Q?WLkix/R2XgA2VytpBcw35fZBtGhp3N2LArkZQNjmWlAeHAMGF/EKnYejtM?=
 =?iso-8859-1?Q?SirswdDM7NyurKmTvOn6g8VeBzHAjhK1dvnjybSr2leZqyGVpnJOwl45Xs?=
 =?iso-8859-1?Q?hnDltqT+mqeukElMkmsFRvDqC5KYDjkXfGGNOw5VWU5pcy/eJ7W9fpHhgw?=
 =?iso-8859-1?Q?bhO6Uo0tbICQizB7nN/WYXz5nmSClQLPVWRrZ9lJML7G58Tx2TIi9ilmRH?=
 =?iso-8859-1?Q?EkcS+4HZVHeC0uHu0QjdHNeBN/gG/nV/BTN54/QGS//1djXEdvKhH5aA3A?=
 =?iso-8859-1?Q?gFhR5QwOyJ7UpBOKn0LLzL+Jg/fa4M6laPxRMn3F9mF+o/5+90wxsogQl5?=
 =?iso-8859-1?Q?VLBuFLEu6l9tMZ/FCm4XjesUFMLqqOjZjvTuJH0f+Ip35Woqzj0NfOOROQ?=
 =?iso-8859-1?Q?S+8TDRMSn1GiwvBhanJ60WJAwhe5k7USNjaU+kkDBx8sSny4KmsDWlQxz3?=
 =?iso-8859-1?Q?SVyQjv5UwQcUNW2g4G1nruOFWOwN4+pTBNmxOp+6+Wxgg5+jpciQR1ohhE?=
 =?iso-8859-1?Q?+r1ZfjUxh1jXnzl8KfOBw2La6td3uT8heExztxUs/eZuAyCDMiJJ+98Sjc?=
 =?iso-8859-1?Q?+f65JMJFeGRXVN0FCkG6xRgrlWbIZbJ2Cpjcvq4rV+XDMSwy/A/BtAPMPi?=
 =?iso-8859-1?Q?cCwjydJG+oGnbASYbYDlkOpxCXByiJ9siHf4aGNBh7jlDCaBU6+KEIbVJK?=
 =?iso-8859-1?Q?MvEmvR0tnVQV8Ac+eMA0vBPpFj4SpDFoTD?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY4PR01MB14282.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76558057-1bde-4201-202e-08ddbfae7817
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2025 12:37:01.6364
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a9psXlMPbkIlDBbCP/CoJt1Z12wQ74Qce4Uo5bxgjZMDHkxqoyb32VoxvyHf1vkSOfu9C0VeKR0nxmLhk3WGH6AoyrXhfvqVjP36jL/UNHY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9545

Hi Andrew,

> -----Original Message-----
> From: Andrew Lunn <andrew@lunn.ch>
> Sent: Tuesday, July 8, 2025 11:53 PM
> To: Michael Dege <michael.dege@renesas.com>
> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>; Niklas S=F6derl=
und
> <niklas.soderlund@ragnatech.se>; Paul Barker <paul@pbarker.dev>; Andrew L=
unn <andrew+netdev@lunn.ch>;
> David S. Miller <davem@davemloft.net>; Eric Dumazet <edumazet@google.com>=
; Jakub Kicinski
> <kuba@kernel.org>; Paolo Abeni <pabeni@redhat.com>; netdev@vger.kernel.or=
g; linux-renesas-
> soc@vger.kernel.org; linux-kernel@vger.kernel.org; Nikita Yushchenko <nik=
ita.yoush@cogentembedded.com>
> Subject: Re: [PATCH v2 3/4] net: renesas: rswitch: add offloading for L2 =
switching
>
> On Tue, Jul 08, 2025 at 11:27:39AM +0200, Michael Dege wrote:
> > This commit adds hardware offloading for L2 switching on R-Car S4.
> >
> > On S4 brdev is limited to one per-device (not per port). Reasoning is
> > that hw L2 forwarding support lacks any sort of source port based
> > filtering, which makes it unusable to offload more than one bridge
> > device. Either you allow hardware to forward destination MAC to a
> > port, or you have to send it to CPU. You can't make it forward only if
> > src and dst ports are in the same brdev.
> >
> > Signed-off-by: Michael Dege <michael.dege@renesas.com>
> > Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
>
> Since you are submitting this, your Signed-off-by: should be last.
>
>       Andrew

This is fixed in v3.

Best regards,

Michael
________________________________

Renesas Electronics Europe GmbH
Registered Office: Arcadiastrasse 10
DE-40472 Duesseldorf
Commercial Registry: Duesseldorf, HRB 3708
Managing Director: Carsten Jauch
VAT-No.: DE 14978647
Tax-ID-No: 105/5839/1793

Legal Disclaimer: This e-mail communication (and any attachment/s) is confi=
dential and contains proprietary information, some or all of which may be l=
egally privileged. It is intended solely for the use of the individual or e=
ntity to which it is addressed. Access to this email by anyone else is unau=
thorized. If you are not the intended recipient, any disclosure, copying, d=
istribution or any action taken or omitted to be taken in reliance on it, i=
s prohibited and may be unlawful.

