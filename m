Return-Path: <linux-renesas-soc+bounces-14950-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C39A74597
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Mar 2025 09:39:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 453693B0D20
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Mar 2025 08:39:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22062212FA1;
	Fri, 28 Mar 2025 08:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="UNya4wxJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010064.outbound.protection.outlook.com [52.101.228.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927992F3B
	for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Mar 2025 08:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743151156; cv=fail; b=UcidKrjeP7ex/e5hy+z5N1VwWSerEGE8a1ytNoFnDnBbAOz5DcXELl7x0xj6eMUta06VwRxzW6Iq6sdYbfgZsRl0UhFORxMgxY0JXvSCARh4N3RZ8+bTOZvsY+nXLy2m1ssoAPdlx745xJfsO3mqJnUZKjF7C/+iBhKQ00hGxjk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743151156; c=relaxed/simple;
	bh=oPxkvRM9Ft5m5PfD4Rnk0eaU6ys//kHVO3CYCUU/qL8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=i7lWWY0bv75FJvtLJipT79SRtxH1GHpLiwOMbERxLcFbg51pejZKkfjN18CGQUn+RY6+RiHAqIoekCfg9wr7zX7QaovOLgyoAPjgAZM9HQ9zxQVTwdjnTNY5c34PFSZ+9YrKxMpV5YGTUa4qAyuE1/qMn/WdgfjrrR8y/DsJnI0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=UNya4wxJ; arc=fail smtp.client-ip=52.101.228.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pTxgLxVMKIyUlt9YnxzxjIF9NxhJJYLNcJQWfDU34tpPqxkesVc1P74jZSYWWib7pG4R0yZbBfGysqbYyLYPwHbgh9MLH81pRll3y1IaVVZvZ7A5CTP8NLsyCpsgcJCrS20W9qYaqKI1+lzbzlwDDWrv66o7UqVR+B17M1oLk95hG4/AzHBSHN2UpumIHM+5+G64nyJjffTzpeyyuAnfCiU4DwCJWyNbyFybPbt11IzVPsTmESLhbMqcgMJZKahLYqiON0zwJZecybI5E0a/dhAYQHwkQEdY30P2ep/MDqQIpkbAaSYB+GbudmI24wbOGVuKSsnbhTjZ5ap8zPuH+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oPxkvRM9Ft5m5PfD4Rnk0eaU6ys//kHVO3CYCUU/qL8=;
 b=vExf74yX3efzCKOBpMxfVHv2ZhzeYGLaEha8NWuGarB7y1Rl0EiLM13m9FBvoXCLbEe6dnPymvywl6tZXEugNFJhfsWBEWqD0Q+5o0qff0xHUZSd+yJD//fFrszc1caYYqCA3GQupWRhBw3uYnRZdfrjz0fUExieL0uJcZmDQ1Nf/rqPR808RXHkQMK42Z50aO13y2AlAIStm/p35WxhTqBuWxHQGttr2EwtkR+j5kF3HFZPxxHWXcno+FRXQPj83QGkdQELrNchZHDA4MVzSrnbGfImCQ0a696nbogiXNlsB7hY0rd6e4U/yVGoQgzqd4n6dhU3gFDgqQTbBq62xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oPxkvRM9Ft5m5PfD4Rnk0eaU6ys//kHVO3CYCUU/qL8=;
 b=UNya4wxJjusCRLrT/o3vEYtxvDKeVj+72rusagl+G/+az7LF0KVFgJOiMb9Q53CKiPH3NDSqoYOpowjivXClRan1E8qMVHRhvtVfZJGFkCBy+xG7gY9ubpTZ4PWakUcAZQ9pfdpP4R60anqFe9DlGtWNKjCtZE2WTdpk8mpNW7Q=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by TYCPR01MB9464.jpnprd01.prod.outlook.com (2603:1096:400:198::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Fri, 28 Mar
 2025 08:39:09 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479%5]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 08:39:09 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Fabrizio Castro
	<fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH RFC INTERNAL v2 1/4] soc: renesas: Kconfig: Enable SoCs by
 default when ARCH_RENESAS is set
Thread-Topic: [PATCH RFC INTERNAL v2 1/4] soc: renesas: Kconfig: Enable SoCs
 by default when ARCH_RENESAS is set
Thread-Index: AQHbn08iM6VwmqpspkW3kmRobnuFALOIIghggAAXg4CAAAE7sA==
Date: Fri, 28 Mar 2025 08:39:09 +0000
Message-ID:
 <TYCPR01MB113323E38C18B2D1EA97EEAD386A02@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20250327193318.344444-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250327193318.344444-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TYCPR01MB11332B9F7292BEFFA29547F2586A02@TYCPR01MB11332.jpnprd01.prod.outlook.com>
 <CA+V-a8tk4M0xgy5LtVitxwYc508m-4KdtnnD8P5Sru5W-gUC4A@mail.gmail.com>
In-Reply-To:
 <CA+V-a8tk4M0xgy5LtVitxwYc508m-4KdtnnD8P5Sru5W-gUC4A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|TYCPR01MB9464:EE_
x-ms-office365-filtering-correlation-id: ff62fd59-691d-4e31-8951-08dd6dd40268
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?NHh6U09kU005NkQ5Kysydkx6YXJhQmVsK0FXdmlSQUxxSm5jZ0dCMFNETDBB?=
 =?utf-8?B?ZnZjc2RVa1ZxM3F5Tk9Oajc3WWdtNnoxUit0OFlDSkZ5Y0hoblRYSTRmTk1n?=
 =?utf-8?B?YmhOdVczaE5mNWVucGlGTzVLL2p4eEJJQkJaSDQ5V1ptUkl1NHltanp2U3Jp?=
 =?utf-8?B?SzlVa1dvaWxtNThjaW11Tkg2K013M1JPeWdTdUZWM3NLUjJmQjZnamk5eEkx?=
 =?utf-8?B?TUFsUm9aZk8xOGJXcFBTZ3FWeG1CendSMG5zUWFEcFNUbUJ6aHBGcUtLaTJJ?=
 =?utf-8?B?S2xJcldIYytUUmMxV0twM09IN0Y1NDBGdFRTeTBOVnJRQUVMZHZOVUEvL3Ux?=
 =?utf-8?B?dHlQL25mOTNWN294ME9oSTZqRnFWK1ZLeUMzNS9VekFQckw5NnRVaDlNVEdV?=
 =?utf-8?B?WXluRzlWYUFac1ZrbWQyNTdibmI0aWw0cTN5UXNUSzFRZnZ2dnE0aWJiNW90?=
 =?utf-8?B?eThabHM5SHJhSllYcnhmNEJkc1gyVEtFUGRvamVTMmt4b0R2aUZGNUZtVUFo?=
 =?utf-8?B?c3kycmFxdFhjaDF2UnpDcDUwTWRiVFFVM1hHeU9nclkydGtlRWlWbmViSHh2?=
 =?utf-8?B?U3dDTU5PNm51ZGZpWSttd1RMSnVlV21qV3ZYOWFWTHQ0QWpOWHVSWmhFdUNS?=
 =?utf-8?B?czl4K0V4aXZGRnc5UjNzSlpPKzlnUHJpS1M5OXZNaG0zbzJCZGJMYjRieHNa?=
 =?utf-8?B?bExZMkl1N1dEOE92OWtCb0pMTUhDcVFUaW9ZcCs3blRrU1JPNEtEci9uMEhL?=
 =?utf-8?B?VjhuSzJ6YjRrMFFNNzVBZEFIbjJZbkEwRjF2dTdUdHhrVm5aL2FGdyt6WTBz?=
 =?utf-8?B?bHp5ZHZZSTNVRGV4U0kvb3Q1cmZ5YWxwbTZndlN2MExucWgvME9ydVAyTlZs?=
 =?utf-8?B?ZGxVcTFkUGUvQzk1YlBKcGh3bjdocjNReVNpdUw1L0R5QjVtVGMwdXJ2SzVQ?=
 =?utf-8?B?ZkxuSzNvSkx1WFcyOHdNTnV4eEtyN1VzOHJQLzFaT0YvczNXRXpBRmFKSUgr?=
 =?utf-8?B?RklVajIzRmMrQkw3VWlPTk9WQXNycUMrc2ZZWkVtYi96U3BDQ0VkTDlrYzRa?=
 =?utf-8?B?dld4dnJKQkNnMVpYRzVHMnF2TGNma3pqWGNIMytFMTdHaEVhdjhtN3p1ZjNC?=
 =?utf-8?B?Wm9QVUlhUXJEbVJhQWtnbVgreDN2aWZtNGhnakQyWlJnRnZ5SEJBUERkN0xY?=
 =?utf-8?B?enR0eVhrZWQ0VmQ4ZTJYemMxUU9RT2RrMWwxZHhpcEI5ajJ2L0w3VzVVdUMv?=
 =?utf-8?B?TW5QZ3BnSEo1MjlieElLd2xzSTV0bUtKWmt0eXpBMHRleGVPQkRWQU0wNEdL?=
 =?utf-8?B?a2xhZHZPL0syQTA1SkJwemZ3WVJHNmg2bVJyY1JSdENWU3MyYVNJTE41NmtE?=
 =?utf-8?B?T3hsbWR1YlEyRDhKRDhIbWxBL0t3WjVzcUpPM0dMdm9CaG82MVBKN3puUVlJ?=
 =?utf-8?B?NHhPTWpHNTNXZTVybytlWUc4UENQaC9vaGlOZGVmTHNiMTdkVWZFMnpjbmZH?=
 =?utf-8?B?ZU5ncXRGMlNiaGI3cThWck84dTJxUFpabUJTN1huYW5ITlQ5WVdvNHJCNk1E?=
 =?utf-8?B?YWJiSXMwTDJsSFVBdjB3RTg0ck9rQk9hK1FSZ2p1RXE4cGFRU3NOcnBudmhw?=
 =?utf-8?B?N1JrdFhMSDhkcmJHbm12d2ZLQk43TkFRZkNlU0VkRmc4YURaRHdkMWhoTGNE?=
 =?utf-8?B?Z2k0cmt3cWFjWThXdkxEbzQrNDd4Qmt2NHYrMzVMbmtkQ2JlOUIrVlhCMU5G?=
 =?utf-8?B?ejVSUnFlSGo2SHdYa0EvUkJ1Y1hHUWlGNzZJSUhlTW1ySUovNHdYMXVObjBS?=
 =?utf-8?B?WGZVUjZYbGdhakZhUUVUc0F2U3hIWU5LVGZhRnN5ZFlGaVhyd0FIT3VTMllL?=
 =?utf-8?B?MExYV1BpSkk3YmVDKy9Lamh4aTN1ZERYcFllVEtlRUtUM1BsTWs4NHpXUEky?=
 =?utf-8?Q?n6JcX7XU/cbek20U9Nu9Rrb863mWS22u?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZlVSZ3UrNGV1U3dQbXJXTEVKRGtVZldBaEx6WW5iQWtNMDF0UCtZNnNiVHgr?=
 =?utf-8?B?UUx4QVdWT05kRkRrVHk2Sk1PYzRseWFpQTIzZUhuMFJDdGJRVnJiV0xkbVBi?=
 =?utf-8?B?TEI4QzZ2Ynh1WEN3cHpOMU9vSUZyVjBsUHN4dFZMcFRHaWljV0dVVG9EMXdU?=
 =?utf-8?B?aHROeE0vTUdvcS9vVTBUd0N2VHJqeGFYTDJNQUFVYWd0T2Y2ZnpxNGdnZ1hv?=
 =?utf-8?B?SHVaRjFLQ040TVptTjJjUmZMVGh6dGhadFJCTEN0d2xTS0NlVlVzaEJSbXcx?=
 =?utf-8?B?WUtXcDJYZ1EyQk5DcWk2UjlQd1dwdFdEbDR0a1RRWU1RR0pZWi81TVV1bjdL?=
 =?utf-8?B?cUZjaTNMQ2NpRWtMbTlGSWloejlBUUhIemkrWnJpUTFIWFhEWkpia29XU0hu?=
 =?utf-8?B?L1BtOGo1Sm9KbVVLVXdTTUhDaEg0Wkd4K1B2OXZlbExLcWhzN21tQWJTTE9V?=
 =?utf-8?B?Ym9vVmI0cGdCQ05rR3JEK212RXYya3hYbjRmSzN2d25LRFNHcm91Q3p2Vkl4?=
 =?utf-8?B?WUhKTWgwQ2FYemZldTk3Vy9KV251RkVEbjNiYkhBdGVjTXl1VFhUQi9NaGVX?=
 =?utf-8?B?MStsNFpMU3FHQ1VVbUZENytKdEdKZmNPTDZWczgrUUd2WUhWdjF3V3RoUWQ2?=
 =?utf-8?B?dk8reDhIbzhUclRod210QzlJSTZPYXpTMWNWWTRuSlZpSW9zQVdyclY0dDdP?=
 =?utf-8?B?bUZxaytwd2ZRM0hzcDBOSURuNE5uTU5LYTZ1UW5FbUUrT3ZaYldWQkNaNVUr?=
 =?utf-8?B?K3FCRG93ZnZFaVpwWXN1SzJVeExYbjJiVitBbmh1OXhSb0xBY21Zd3NsbnlC?=
 =?utf-8?B?b1IrTWwvUGdZT25VQ0tMbFZMRTVvOEdUQW9pOFdHYnhVZkdPOXBpeTNhRkR4?=
 =?utf-8?B?aW5vVUFuTDFJbDMxS2JwOUtCRUsvOHROMGEydkVzUXRDM25GTHpSVmE5blg3?=
 =?utf-8?B?NmFlUEVuRzRZREh0UG5YTXl5amlIOFQ5cUp4NCs4Sk4vWWpKM1V3SEcxaDBp?=
 =?utf-8?B?OG5tcjFCbVFtT3hiajJzWHI4cWRoam1OL3VQZ3paOEhWSE8wUXFqd1NSWGYv?=
 =?utf-8?B?UHRMa3NGOEZmT0VuR3RmdU9PK1dzTTVDczNpMy90Y3BKcnlmanZTdkRpZGhI?=
 =?utf-8?B?Wnk1UFRsc2pDblJ2ZVlVUzBsUGdDQUNaWHRoMUQ1Sm1LQzdVSENnNUhmRmp4?=
 =?utf-8?B?VFdEMyszNFNmNjAxQTNJV1daaDNJVjhicDZGQjkxWG10c2xaMk9TTXNQZStG?=
 =?utf-8?B?VGhNZEtvZncvYlZCSVN6MWhWcE1CNTNTN3lldnV0dXdEMUR1cWVaVzZqbDVi?=
 =?utf-8?B?MWlESUlvOGZlOW5tdDdHayt5QXR6enFTT3lSNlNDNmp0eXRzTFV1TE9QWGll?=
 =?utf-8?B?UjVOdm5xQjlHdkRoRkZqclhER1dpRGFralgrWDNhQjR1QzhRMmwwQlV3SkJ3?=
 =?utf-8?B?eGFHMTZXWHFid3ZnNU5GK2taTFg5RHUybkwvWmJQYmdEVmdwNW4zNkJnS1dn?=
 =?utf-8?B?K1d6RnpuejgrRDR6dUoxV1Rud2QyMTJlQlFOMkJJQ21UMjFsWDBUWmRXV0ph?=
 =?utf-8?B?RXpZWWJvUjZ0Uzg1MmxnWkFIZk52cXFyQVppa2FNYXRYR1g4MjlDMFVFVWJD?=
 =?utf-8?B?Qy9rSEV4eEZwZSswVGpBNVlNN29sc0ZVYlNRZ1lIUVBrRGtZZGtMYnNIdkMx?=
 =?utf-8?B?a29PY01OaFNUR0ZuV2FTcXROMDUxVytpTkY2cENiMUdocTRkKy9YYXhTN25G?=
 =?utf-8?B?NWFzUjZ3MXJ4ZGk2dGdUVFRkUVZpeXQzMEtYOC9XeXdmMVViY0c5NlYvR3Vv?=
 =?utf-8?B?V3prNy92Y1FPQ2x5UUU3MnlKazdnUWVPVXRmdEk4VFd5RWk1eWZXQnNXcFdL?=
 =?utf-8?B?YzZSNzdCZjFHdnFrY293YUkzTEdnRFZvTGp6SEp5RTF1dTYybzNlOW5QaEEr?=
 =?utf-8?B?OWV4VkZVa2RrYnIwd0RPVWxSZVFMa0JCVkFDZzV3ZjFPVzU2aVNWRWdtSi9X?=
 =?utf-8?B?TFo4dEN1eFZCaVhQUmVYRnJMUjZ1SXR0WFJoajhvTUZUVW4xY091RFBvMUxn?=
 =?utf-8?B?NnJuSUZmS2tQc2hrYlRqMEltZk5XemFsZEpId00zODY0REZFenhmeHBEMjNK?=
 =?utf-8?B?WVRReXZhRlBzZGdNVUNxd1pjcStJZnZONUZXU3ByamUxNjhjSXNsS2xINkJ1?=
 =?utf-8?B?MEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11332.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff62fd59-691d-4e31-8951-08dd6dd40268
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2025 08:39:09.7197
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eihMb1pSrN64GGmW38WHICXMH24OTvydZLJz8Y8jSS+th7g7pn7iDToESX1KgSwq49Nna9xTg3ChIcEv+WX/JgIAJh4Rp0rBvsUodoiB+lc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9464

SGkgUHJhYmhha2FyLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IExh
ZCwgUHJhYmhha2FyIDxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNvbT4NCj4gU2VudDogMjggTWFy
Y2ggMjAyNSAwODozMw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIFJGQyBJTlRFUk5BTCB2MiAxLzRd
IHNvYzogcmVuZXNhczogS2NvbmZpZzogRW5hYmxlIFNvQ3MgYnkgZGVmYXVsdCB3aGVuDQo+IEFS
Q0hfUkVORVNBUyBpcyBzZXQNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBGcmksIE1hciAyOCwg
MjAyNSBhdCA3OjE14oCvQU0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPiB3
cm90ZToNCj4gPg0KPiA+IEhpIFByYWJoYWthciwNCj4gPg0KPiA+ID4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206IFByYWJoYWthciA8cHJhYmhha2FyLmNzZW5nZ0BnbWFp
bC5jb20+DQo+ID4gPiBTZW50OiAyNyBNYXJjaCAyMDI1IDE5OjMzDQo+ID4gPiBTdWJqZWN0OiBb
UEFUQ0ggUkZDIElOVEVSTkFMIHYyIDEvNF0gc29jOiByZW5lc2FzOiBLY29uZmlnOiBFbmFibGUN
Cj4gPiA+IFNvQ3MgYnkgZGVmYXVsdCB3aGVuIEFSQ0hfUkVORVNBUyBpcyBzZXQNCj4gPiA+DQo+
ID4gPiBGcm9tOiBMYWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVu
ZXNhcy5jb20+DQo+ID4gPg0KPiA+ID4gRW5hYmxlIHZhcmlvdXMgUmVuZXNhcyBTb0NzIGJ5IGRl
ZmF1bHQgd2hlbiBBUkNIX1JFTkVTQVMgaXMgc2VsZWN0ZWQuDQo+ID4gPiBBZGRpbmcgZGVmYXVs
dCB5IGlmIEFSQ0hfUkVORVNBUyB0byB0aGUgcmVsZXZhbnQgY29uZmlndXJhdGlvbnMNCj4gPiA+
IHJlbW92ZXMgdGhlIG5lZWQgdG8gbWFudWFsbHkgZW5hYmxlIGluZGl2aWR1YWwgU29DcyBpbiBk
ZWZjb25maWcgZmlsZXMuDQo+ID4gPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogTGFkIFByYWJoYWth
cg0KPiA+ID4gPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4NCj4gPiA+
IC0tLQ0KPiA+ID4gIGRyaXZlcnMvc29jL3JlbmVzYXMvS2NvbmZpZyB8IDQyDQo+ID4gPiArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQs
IDQyIGluc2VydGlvbnMoKykNCj4gPHNuaXA+DQo+ID4gPiAgY29uZmlnIEFSQ0hfUjlBMDlHMDU3
DQo+ID4gPiAgICAgICBib29sICJBUk02NCBQbGF0Zm9ybSBzdXBwb3J0IGZvciBSWi9WMkgoUCki
DQo+ID4gPiArICAgICBkZWZhdWx0IHkgaWYgQVJDSF9SRU5FU0FTDQo+ID4gPiAgICAgICBzZWxl
Y3QgUkVORVNBU19SWlYySF9JQ1UNCj4gPiA+ICAgICAgIHNlbGVjdCBTWVNfUjlBMDlHMDU3DQo+
ID4gPiAgICAgICBoZWxwDQo+ID4NCj4gPg0KPiA+IENhbiB3ZSBhZGQgdGhpcyBjaGFuZ2VzIHRv
IG5ld2VyIGRldmljZXMgZm9yIGVnOlJaL1QySCwgUlovVjJOPw0KPiA+DQo+IEkgY2FuIGJ1dCBJ
J20gbm90IHN1cmUgaXQgd2lsbCBiZSBhIGxvZ2ljYWwgY2hhbmdlLiBBbHNvIHdlIHdpbGwgaGF2
ZSB0byB0b3VjaCB0aGlzIGZpbGUgYWdhaW4gd2hlbiB3ZQ0KPiBhZGQgZGVwZW5kZW5jaWVzIGZv
ciBleGFtcGxlIGZvciB2Mm4gd2hlbiBTWVMgZHJpdmVyIGlzIGFkZGVkIHdlIG5lZWQgdG8gYWRk
IGBzZWxlY3QgU1lTX1I5QTA5RzA1NmANCg0KQXMgdGhpcyBpcyBSZW5lc2FzIHNwZWNpZmljIGZp
bGUsIEkgZ3Vlc3MgdGhlcmUgaXMgbm8gaXNzdWUgZnJvbSBleHRlcm5hbCBtYWludGFpbmVycy4N
Cg0KQ2hlZXJzLA0KQmlqdQ0KDQo+IA0KPiANCj4gPiBTbyB0aGF0IHByZXZpb3VzIGRldmljZXMs
IHRoZXkgZG9uJ3QgbmVlZCB0byBwYXRjaCB0aGlzIGZpbGU6DQo+ID4NCj4gPiAxKSBJZiB0aGV5
IHdhbnQgdG8gZG8gYSBzdGFuZGFsb25lIGJ1aWxkIGZvciBJbWFnZSBzaXplIG9wdGltaXphdGlv
biwNCj4gPiBqdXN0IHJlbW92ZSB0aGUgdW53YW50ZWQgU29DcyBmcm9tIGRlZmNvbmZpZy4NCj4g
Pg0KPiA+IDIpIERlYnVnIHNvbWUgaXNzdWVzLCBzb21lIHBlb3BsZSBqdXN0IHVzZSBkZWZjb25m
aWcgZnJvbQ0KPiA+ICAgIGRpZmZlcmVudCBrZXJuZWwgdmVyc2lvbiB0byB0cnkgaXQgb3V0Lg0K
PiA+DQo+IENoZWVycywNCj4gUHJhYmhha2FyDQo=

