Return-Path: <linux-renesas-soc+bounces-27969-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WEbYAY2ChWnpCgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27969-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Feb 2026 06:56:29 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 257D5FA7DE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Feb 2026 06:56:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7E75C3001CD9
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Feb 2026 05:56:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 294502EA168;
	Fri,  6 Feb 2026 05:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="pbmIxOGH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011028.outbound.protection.outlook.com [40.107.74.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2CB2E9757;
	Fri,  6 Feb 2026 05:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770357383; cv=fail; b=doC0XmgaTPmJ+sjoAXmNe2PTcuNtNWjBw3NGwxvd31D6HxjnYmZnF9I33k5QJwCWqzKg1oj6uTbpaDd5Z4slyszqIDY0qI1to4B0VbKzAvuWNAnInjrwPnGS3ySa+DI6qivLiZR+tMMXT3AplVhibQyRvxcHMQem2dS81ObOUIA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770357383; c=relaxed/simple;
	bh=QyTPDbdeWDGB7CmjQI0WjBiUC5fOpxrjOagG6/MKsp8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KLuI+/WeWrcebcFpCm3QfIZ65lZENXku9GTjx3bFRgQqjEBMjNULh2jVdwzpIifKSXbV5h0/KWO5UUsDnVxKKC4e6/tHYaWedvE/JHta2B9IhX/2HnQHGi1DT2Q/rsRwU0DAJ3thojia/HJKL9U8CKmuW5zHqfuHO4s4a3xQbEA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=pbmIxOGH; arc=fail smtp.client-ip=40.107.74.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SwWvMrjOeraWSAJT3yJgOgKtHZuHLZD+sLsj6zTB/69Uc1gTQrSz/x1II4TU3qccn2IEfqP0Gy4nGUs/WIeD9tDVNuofMIrqOjxUoePMST+T5seIdsAVR2Jf7XVl+z1PVa5XtFCClqb8aD/mhGxKtb+Kxws+C5frpH/2rMSN9bOooGL6m9n9b1u8CuN6WyOSEA8nTGGtOC7hy8dmm4w1AyYk7pGWoUZkHzsTFP0dmyHUuD09QsXRF24RL0F2h5S6rldAG2UmcEsXMLw0kskVJVCGDNWAuhVqQ2DQxqtYfMtDz/cMVFjJug4PV8pUoIz9HeMY/UaiHcluKGhXha0a+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QyTPDbdeWDGB7CmjQI0WjBiUC5fOpxrjOagG6/MKsp8=;
 b=I3eMDREgPXEZg6ygdhzdxOiXomJdPWz7zc31BDoRbi67Erh/WrTObz7bmNLLp5ltpMLZ4AvQiD6K4EwhmQkE6Vg0vRbCPpzTEB/Jo2jl2bdYziLLHXQ7xxoXx0UNBSNdBirVnDRkr79mYOAlGPBtevNOc4ujRsChxAI8eHi3bh5Upi4KYcnrio4XznQqT1RnPw8P79r9VOWTH+FsOpekNJZ70LZfZ4pkIj2rrWMCR+svlIvzecdHzLF5fjgPowQaRtgdiaTNP0NgBo04gge414+RwmhzE7M6NIoiU9vLEMqliZSOt8EUxowyTAqb1UvJtwnZsLf6HYZSKGJQRBnwBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QyTPDbdeWDGB7CmjQI0WjBiUC5fOpxrjOagG6/MKsp8=;
 b=pbmIxOGHzsyqo1xbaBm7hu+RzbdKk8xkPGymwdIpwuGxXXUQ1Jjh2dHJwlvRiNJrT8R7XQ3fUOa18MmjTZrX9+sYtS9AzNSUTUlZAQGgo63Pbpz6/aB9K//BiiwWiTtdoY66zD4eOcGimRLNNaWPWBkiM2/WM0ufjxf+Lrfy39s=
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com (2603:1096:405:20d::9)
 by TYWPR01MB9709.jpnprd01.prod.outlook.com (2603:1096:400:231::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 05:56:17 +0000
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::655d:9c47:4499:eb3a]) by TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::655d:9c47:4499:eb3a%6]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 05:56:17 +0000
From: Michael Dege <michael.dege@renesas.com>
To: Jakub Kicinski <kuba@kernel.org>
CC: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Andrew Lunn
	<andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Nikita
 Yushchenko <nikita.yoush@cogentembedded.com>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH net v2] net: renesas: rswitch: fix forwarding offload
 statemachine
Thread-Topic: [PATCH net v2] net: renesas: rswitch: fix forwarding offload
 statemachine
Thread-Index: AQHclqRWEu5tfvE8tkWGA8MYssbwd7V0RboAgADnI/A=
Date: Fri, 6 Feb 2026 05:56:17 +0000
Message-ID:
 <TY4PR01MB1428209D62D2C8D38DE0C4C898266A@TY4PR01MB14282.jpnprd01.prod.outlook.com>
References:
 <20260205-fix-offloading-statemachine-v2-1-fafcf0c6eb1d@renesas.com>
 <20260205080720.7d59ef82@kernel.org>
In-Reply-To: <20260205080720.7d59ef82@kernel.org>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY4PR01MB14282:EE_|TYWPR01MB9709:EE_
x-ms-office365-filtering-correlation-id: dc773763-d15a-4bb3-5021-08de6544720a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|7142099003;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?5XLPxo5GLou7Wx3P5OSUpEZNlsgUXLElKv2DOFEmpZ0Bk8vN8N8N+D2LI9vJ?=
 =?us-ascii?Q?NotZlMExjWNfzffQiS+xe0KUanmgUdiHlangsjalgyEv6KrTMEc/1g2bSg8y?=
 =?us-ascii?Q?JfmBb3RN62cpeFs40VfoIIAlpYHtDEeTpIPWRR403jaBiJwQcaEkOqfloMZi?=
 =?us-ascii?Q?xWcjzC+xsy4kx8XjF0hR4s5Tebubs34aT3sV1Y7P7p9t2RNiCn7L1XMOAsSw?=
 =?us-ascii?Q?XMwXTc6EER5jFu+T2oKrw9F5Xfr4K7XUbxl8zyGVP57fjr9fsJc5pdidg6sb?=
 =?us-ascii?Q?5GwtVKXRnt2A338sBrer9v4bZuHrlVOFYWCIp6gu5+A1Ln6cZL7U/U8priDf?=
 =?us-ascii?Q?OhqUUI3zm9hj5ukmaRwQ/hjMX7z8dkKLVIMlvRAr1JstnoCpEbPuq+oGpUj3?=
 =?us-ascii?Q?0h2XripJ0E+442LOPPVOfGjFJCsoZtE2ytbPDlcdhJXrBnM4cBMP6tZtEafg?=
 =?us-ascii?Q?wANOpVi8zZQChaYfK8QO/tMRhC0wPglc1waUM7xc5S99woDobqkYdfCNW1jA?=
 =?us-ascii?Q?xatxxxeKP1XZs3oQz3ymfkBLhgbhxgDTO0H+tlFANDf1ABrMvQd3SCGUlaob?=
 =?us-ascii?Q?Lfg/idFXqe3JGsQauP8N1yFVrNzC9HSg2ssacy/fH9NdvdWpmcCC6b4/fYiw?=
 =?us-ascii?Q?XwcIlGWsm1Jeimz3eP6CeEJ99cKf9A76etKMiDOBr8uwbXIV5vqDqvo2fQps?=
 =?us-ascii?Q?ficO9CdRJhkO6rffKIoUGohFdlWj4zU1YMpxornwhWwvtpku3kqzNUfMZakJ?=
 =?us-ascii?Q?Ej/wU+SXKE39WOJdZry4i2Enp9hYsf+xtjhJJ2bV9Ou6tBtxwrufZHgUYgxz?=
 =?us-ascii?Q?2v3FRKqVD+vFf5uJsp7aaLXXFxuP71pCxibK5dagSomtR4JPFHtdim5vWXKz?=
 =?us-ascii?Q?D/tU45QlbYHaieuTPnAVSwiMk+3NxO0q4An6F433gIol/vbXcRVSZhRaJexu?=
 =?us-ascii?Q?kOGyhVUtS3PZ9eaZl597ozHe0IeuOZqKtPir1a3Sqq8+FtesWNlr34KZTVxq?=
 =?us-ascii?Q?CE7FxlychjThIbWqGSni+0vTaxTZLx9kdrCjqPuUwX3w7mSGIpoUzik5Kjvx?=
 =?us-ascii?Q?VpAVKi27SItPguIf6TvwEw/sq+O62a5hueL0cWyuRsqZZUUk77AOmtqHSHM9?=
 =?us-ascii?Q?xkkJT11lXI0jXl1rB6AyyDXkhnj8RcGPnLnIpKTBAjsv1v1dGT+I8JSlAZ0t?=
 =?us-ascii?Q?1/sUi35+eLn4VvhMvyjUkb0QjItiUdy2xtv0Dqd1gFCPFn14crDVSKWc20YT?=
 =?us-ascii?Q?CDmtrZCV0TZz9DzNPBmMdQCXtKABnU01a5KMHkBqPB2COz9G46ndRoHursHD?=
 =?us-ascii?Q?QLqVEOa4XafHO5ZXPQrfkgEiQroKo59u+Ngl0NaN5aRWkn75GhBrhZoHWJTM?=
 =?us-ascii?Q?BPjukMJd48ohZa2JSNZQ6pLQcNMxM9y/0Er0UmvcXvYs5yEjALXOiXZgOFH0?=
 =?us-ascii?Q?ZbDXMk4OM1SYqG3JVMVgi67o/LFehEAFn7dpXghuWqOk7A9aiGmygDuPyElI?=
 =?us-ascii?Q?g32KriZsK+xaUxZlPXCK+HLbcQ9JkHNCeSn8sc3qyKUT4Hxczp/B5v5NlwU7?=
 =?us-ascii?Q?+I4Q3FUT9RSwQ/MmrpuTV8fYyWSJUukETotGQbkB2xXNzcV4bGyHMMeBWldB?=
 =?us-ascii?Q?g08pwpss/cZ0xxpcHIzoPG8=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY4PR01MB14282.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(7142099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Rg+r8a2yzou+Mm7JeebvynkGVTIc28IACfDolTw6Xq6YZInc1fYFNn1YoHpV?=
 =?us-ascii?Q?t4M/vnRIk/oDW4XPLVEPTsEtjlGw0JaOofNtyAYZT9yBtHgxMTiXl1eIKhgF?=
 =?us-ascii?Q?NxNywkWcqFG3DYJEzyhB0ZTmexxNkgSyUWfPLLhSaqec3HU6w/cdy5d/g98l?=
 =?us-ascii?Q?r7Q88yB6zpc4IuYFTfBF/9wlGUalK9pUYNppS5128vCfGs7yYTda0j7o1ALu?=
 =?us-ascii?Q?+gahpNnOMrtSIABorKkD820ZVEFrubpbPJjUNCnbH16H8tl9VwzmXjx3OmIu?=
 =?us-ascii?Q?ooEi/w5NWl7r6xMU0xgvmXYRkRxChhHKbI8w7Ru/IHMtFipE/fkdBzFs8Nq7?=
 =?us-ascii?Q?y4T4kM3Cf1rGnSjaYwYi62kjgYECfB1mKKYBfqnAF0aqVgq7JFRBA/NLDeka?=
 =?us-ascii?Q?hoiEzm3UGUY0I+DR5ZmZqppuzGaw63LRBUBR5wapKuAUG/7YHC0i3+GEHI9z?=
 =?us-ascii?Q?iSH/uxjP6NKPPD4QhmOeAxxTyYP2O0tegXApyVUbS3C1xDn1jqsbvcsuvmVQ?=
 =?us-ascii?Q?I7UgMWuqCOFRxlUyABlZNtPV0G+1Sn4vxW0BcwMHH2MP7T2rBCcShLN6fHbO?=
 =?us-ascii?Q?xJ6U0CNAlYi8HA1gh42YHtaguszUDzxXz/SqV6AShJ70lMgFFsCC/i+cauB3?=
 =?us-ascii?Q?dEz6Ky+N7/iSmy0mMLstVG6pGgBkq6qwBpT0h9qVvhlfR3g06XW2VvaF/4ch?=
 =?us-ascii?Q?DrYDuBrILlPnt3hYc8gumaHJL6+sRjLQWd/Xx9i70QRZTjpdsD8ULipdSrOR?=
 =?us-ascii?Q?kG1xFdXT6R2xQfyueEnRUKiYCuADCsOcEhiHko6+Dr8j6/WzSOckOs5qQZ66?=
 =?us-ascii?Q?+6ssMKF4u84+NFv3/3FHJYMc41uJFVSkaHlJtgy7AaMflX+/6JESoxTmpf6f?=
 =?us-ascii?Q?OXMIjcmNdISa6YHx/PMEK+/aQg7gAD0uRd8yWV1JEJ9rlmgjvIO+17FUf6Mz?=
 =?us-ascii?Q?gcUlCjhaRpSvNNWVGyMQAanKaoKBRhyHYjGCT5dF6qcOvKbiO49e43olTT71?=
 =?us-ascii?Q?XY+g0ZiIhg730rGTWJXd3qXqUjgUgL+GQ91EaROs+KX9I4JduOoEu+To65aj?=
 =?us-ascii?Q?/VVdBnRlpd4Mh4wJQEsjeZN4jmqET2jnjFNv54ItAk2SpFJibN7wv1SwscV4?=
 =?us-ascii?Q?0MNQ2U31+ViBXDqhA9+jb10CQ42xOwATMaYNDYejRBMr9OM9aUEJpPJ8E6ax?=
 =?us-ascii?Q?3p9J+SvVEUa2JmDc2VarcpspnHcqkmbagHBCoX1lvVte3vL9mcXKBJ82Mu/+?=
 =?us-ascii?Q?z5wAAUE6u9Le8aS/wyPu/ABtj5ar7asEwBiqkI9+HtwhcTUQaDLm4IJchPvy?=
 =?us-ascii?Q?Dqucow/CPxqfw+Cpz5QZiXHoGvJqJ1XvcHnyVP7N3IranzHaCs27cRocQJIA?=
 =?us-ascii?Q?tTu5x0yQO2iFORzvg/JNlXFmLuAAzK21WXNlK3pBCTBN2c0dsUXU7X59IOGQ?=
 =?us-ascii?Q?p2aZSjbd925SkdOyUrhSQNs5frllDzL/HAW7pHY+qUQm8wL8xX0U7sb19A9z?=
 =?us-ascii?Q?s+nIDno5ZUf2RdbTrpwrtOaWd50eg40WPzZd/B7BTolEKH3n5fngltDWzhGW?=
 =?us-ascii?Q?8Yb9SkeSQ8mTu1s++S8qGRTl50gswzShrrm0zm5VwfFIZx4gJjouDQaFeP2m?=
 =?us-ascii?Q?6foRnlZXAHJH44Nl5hgrcowNKtuVcwPmVnM9QjgYkdn/9Fk49ro3NWFEUWAJ?=
 =?us-ascii?Q?ivKjlz2Beg4OdM/AF8UccDZwqljfLSW7UdKHGXAOnyM2xKXEhw4t8cCBN6wu?=
 =?us-ascii?Q?7GjEkE/TZQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY4PR01MB14282.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc773763-d15a-4bb3-5021-08de6544720a
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2026 05:56:17.8505
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F2LOPhmd1uFB34hdwFXuskz7s+riQ8TssWCyeovGW5FM8OlGHRGgS+tG1gjNMjlrN2XqLTcqmjRO+qtN7ve6k7zEQ3zSVQ8V4kjzm6kdhgY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9709
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27969-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[renesas.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.dege@renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lunn.ch:email,renesas.com:email,renesas.com:dkim,davemloft.net:email,TY4PR01MB14282.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Queue-Id: 257D5FA7DE
X-Rspamd-Action: no action

Hello Jakub,

Thank you for your comment.

> -----Original Message-----
> From: Jakub Kicinski <kuba@kernel.org>
> Sent: Thursday, February 5, 2026 5:07 PM
> To: Michael Dege <michael.dege@renesas.com>
> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>; Andrew Lunn <an=
drew+netdev@lunn.ch>; David
> S. Miller <davem@davemloft.net>; Eric Dumazet <edumazet@google.com>; Paol=
o Abeni <pabeni@redhat.com>;
> Nikita Yushchenko <nikita.yoush@cogentembedded.com>; netdev@vger.kernel.o=
rg; linux-renesas-
> soc@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH net v2] net: renesas: rswitch: fix forwarding offload=
 statemachine
>
> On Thu, 05 Feb 2026 14:35:21 +0100 Michael Dege wrote:
> > A change of the port state of one port, caused the state of another
> > port to change. This behvior was unintended.
> >
> > Signed-off-by: Michael Dege <michael.dege@renesas.com>
> > ---
> > A change of the port state of one port, caused the state of another
> > port to change. This behvior was unintended.
> >
> > Fixes: b7502b1043de86967ff341819d05e09a8dbe8b2b ("net: renesas:
> > rswitch: add offloading for L2 switching")
>
> Please wait 24h before posting a next version of a patch per:
>
> https://www.kernel.org/doc/html/next%252
> Fprocess%2Fmaintainer-netdev.html%23tl-
> dr&data=3D05%7C02%7Cmichael.dege%40renesas.com%7C22dc6b8fb523473170cc08de=
64d0a6b3%7C53d82571da1947e49cb4
> 625a166a4a2a%7C0%7C0%7C639059044486368599%7CUnknown%7CTWFpbGZsb3d8eyJFbXB=
0eU1hcGkiOnRydWUsIlYiOiIwLjAu
> MDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sda=
ta=3DWN7Lp3B4q2jOl9REKdbaoVtL1o
> Nr7%2FVME%2BPCJQxoPg4%3D&reserved=3D0
>
> The Fixes tag is not in the right place here, it should be above your SoB=
 and the hash is too long
> (consult the Documentation/ for exact
> format)
> --
> pw-bot: cr

I will fix the issues.

Best regards,

Michael

