Return-Path: <linux-renesas-soc+bounces-18505-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7240EADEDD6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Jun 2025 15:30:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8243C7A7E03
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Jun 2025 13:29:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0FFE14EC5B;
	Wed, 18 Jun 2025 13:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="vPevk9h6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011039.outbound.protection.outlook.com [52.101.125.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 196852F5325;
	Wed, 18 Jun 2025 13:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750253424; cv=fail; b=vFvcgqtoLVIKVG9fm+6deOX2dgksGtUxwWljKgRnMpGJkfJwP6tt+qjFHcA9BGrIfSAbBt8+KkEdw295i0y6+id5TUw57Iaw8EKBPh0Jx6TgUhZdIJaLqmPYg9eZe8zxtuHtL93frPsK2VzKxZE5e9IFte1DgTW7ZtpBy3hCJJo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750253424; c=relaxed/simple;
	bh=YWvOhdrhqoltPlmW++8F8DNqKM5OvSpnP5Q1YlO3Sf0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dZGm8el1WItVKb6KdMPswsWX5WvKz//SrdSqKIacMUOgctPZQVPb8TgKaigK1VWwd+RO57upLMqAJsRwxiDUMQCo8arElSaQ7AkmRZshU8RFoHU4HmkkZuw0EwPsRbYSDn3r4dtTa7FGcDzuYNGcwvWUjMB3kIV68yRPMx0CooA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=vPevk9h6; arc=fail smtp.client-ip=52.101.125.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RFl2/hXpIUdiMNxbDwdoIJ88V43kT7IRAsAWCJFo+FbnmJ4fHg6fC/2Euvh7ExFM79q0ArCDsusclR5JSd/giPnL2HJUrnzpfzDlVKszUjCmbr/y/BLwlaZp0jKfTEsg22pPMFtyDKwQ+EDRRsU9z0S+pOf/G98XIYROQE7FadU5jeeo7j+TVCzS5VscfjRXTn/c9a9x61mJMxoSqfd4SJffJptP526bgU/tv0gLpFC8GvqRYLszmeeaxfxlc9KGIm3pVJrrArNyh88b7ySjsVzAt6SbtKq2C3DLV6IOnYAG/HtN0rtHNFUjxwGLMlFLjUtifz+3tl0jcV7ZPp4yZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YWvOhdrhqoltPlmW++8F8DNqKM5OvSpnP5Q1YlO3Sf0=;
 b=jfqJws0Tg3FZrk9/dB0QyNLwaQWHT9t8U+3ijJDdmJ16LiP5h5MvUhn+N+WEqV1Sa7vGvjLPIBK7eZPRV+ZZ4mjkllHexrsiyo2+xi8QtaJGTmAnC79S1a532o0z0MjyOlfrPzTCvRRNs0dmh9hNQ/Hi4Yk9xA2/dqHledQyVv6+B4RY8K3CXDP5ERt/tr5sHhkYPwxUZ2o1yYWQqZ+tAeb4ClPhxNLT+RFb/DxFAMbKi3m0h9gQKdaW6qsDVvVe+bYuMHRkeqa7jshsMbCedBpazWkqrvLXf3Ot9jllINjufazq1qSowA+PhXU2Ra9chisjUaZDzoQZerSmwHHxhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YWvOhdrhqoltPlmW++8F8DNqKM5OvSpnP5Q1YlO3Sf0=;
 b=vPevk9h6tpPEj8+Y4xBV1ZbvftDGfk5mQdLm6pQgXhlgQ5TKn1x33rQww14dusqWnGj2PPwtGibopYiA9qLbPU12foAkjEvf0g7iFLud7jTR3wuDdgi13MXEJWt/DOoamVBtQ8S0XPrAMaWUFnU1ba9W9sAGaZhvTj9ryuJHuOk=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB10408.jpnprd01.prod.outlook.com (2603:1096:400:24c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Wed, 18 Jun
 2025 13:30:19 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8835.027; Wed, 18 Jun 2025
 13:30:19 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, "Lad, Prabhakar"
	<prabhakar.csengg@gmail.com>
CC: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Krzysztof Kozlowski
	<krzk@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Mark Brown <broonie@kernel.org>, Magnus Damm
	<magnus.damm@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v3 1/9] dt-bindings: memory: Document RZ/G3E support
Thread-Topic: [PATCH v3 1/9] dt-bindings: memory: Document RZ/G3E support
Thread-Index:
 AQHbknnX3xSm7+VbqUS1k2gBBCFIfLONYJ4wgAAIGYCAAAV54IAAD5qAgAAAPbCAADFHAIB6wseAgACnFQCAAFSkAIAADrcAgAAIj4A=
Date: Wed, 18 Jun 2025 13:30:19 +0000
Message-ID:
 <TY3PR01MB11346BFF955985663BF2B6E548672A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250311113620.4312-1-biju.das.jz@bp.renesas.com>
 <20250311113620.4312-2-biju.das.jz@bp.renesas.com>
 <TYCPR01MB11332F064115080582332B78986AD2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
 <CAMuHMdVy3B+i2p6unkX-n=7AYCfP5B8sW7F9GJi7URcvniGA2A@mail.gmail.com>
 <TYCPR01MB1133206083EC0249A827261EB86AD2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
 <CAMuHMdUyY8SsUQEZwxdCK-ggPuYy8L_WwnUgq3Cj7oYiTcyNTQ@mail.gmail.com>
 <TY3PR01MB11346123B74D86590C0F8B9CD86AD2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdWevyJ8Z4YWYx0rr=_TD0OTywbkPfNwRcw5k=yDV-i2Ow@mail.gmail.com>
 <CA+V-a8t1siG17NKna-ACUzCoXFTOyVxuLonTVSRLnNq1ie3iTg@mail.gmail.com>
 <CAMuHMdXw+mcj-P=Zm4R8WF0PxogPLfFCbALBRFN9Wn8UEo1FkQ@mail.gmail.com>
 <CA+V-a8u4PgttE0LaH7M=-5Br400sNE1gzk_a3L_9jfXZgCLd-Q@mail.gmail.com>
 <CAMuHMdVQ7pK+zvZm6MHsfGRctyOSurQpDYJztSfD6P1gvuw_RA@mail.gmail.com>
In-Reply-To:
 <CAMuHMdVQ7pK+zvZm6MHsfGRctyOSurQpDYJztSfD6P1gvuw_RA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB10408:EE_
x-ms-office365-filtering-correlation-id: 27732d36-c842-4749-732b-08ddae6c44d2
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?WmhMU2huQWhteUFHRDdTbXFmQlhUa1RzeVIvcG54Q29Ea0RvSjlOZkFzNlY1?=
 =?utf-8?B?cUVGanpyVFp5dnNCUmJFNUtYR1ZBcnFCQUwxb0pXVk50UWIyUVVzN2d4YnBQ?=
 =?utf-8?B?WDJJSk1rem83bld6d0c5Ny9RazNELzhKMThVUFhNV0pDRkl5ek50RjlEaklY?=
 =?utf-8?B?WjcrZE9mN28wM3dZNC9xZXozMlVMQzBuRjhJRmZVS2Z6QzVMMjlTb1BNQmpq?=
 =?utf-8?B?T3QxcFNWU0gvNFc3Ujg0MHoyNjd1Y0hXZ053MGdZTzNnNVY2a09hS1hGZ2F2?=
 =?utf-8?B?OU5scXpobzdValJPTituOEVva2NxQXdaeFd4SnIxM28xdDV0TEFpNUZWZmlY?=
 =?utf-8?B?UmlTZjNHOHB5R1BrVXhBK1VpWmhWV1Nyb0tDMVdlZjJKblR4SWxVYXFObURn?=
 =?utf-8?B?NUdiVDI1RWFFQlZta3o1QWVOblFxZG5JeExxMmZYQ1I4Q05KT2lRSW14bkwx?=
 =?utf-8?B?VFVQYlJNYXRZVHgwa2NUTjhycFd3U0hEY2d0MzM2OHNKWU53Vk5nRlFhd1Jn?=
 =?utf-8?B?eXNIWERPSk5xeUlCNlJ5QVpPRllUL1BSeUh4Qk1BcHFydmdQNC9Qa1RJK0xl?=
 =?utf-8?B?cEVIdTkyZ0h5dnBqd2w3SjQ2Tjlta1ZUbDRIS0JJZ2RwcVk0c0p0NjJZY0VW?=
 =?utf-8?B?Uy9KOGVZOWhpcTZUdGUyamtjNFNWS0pvRWVFdnRwT0VUaHVqcDlRM0IwU2Fp?=
 =?utf-8?B?Wi9JaGVVSUtMell0eDV0YlRvczdzVTMrbGJwQld6bDZ0Q1RORGticHh0bDlq?=
 =?utf-8?B?L3REWml6ejVJWmxQck1vNC9aZFR6dURCVk0rMFRXZWJTbldKVHNaTWRKMFpN?=
 =?utf-8?B?YlB0RFpHdldkTGZsMFJheVlXWUU3Um1GK2FXMmphZTgwN3dLZjVqZUhEcHRB?=
 =?utf-8?B?YjFQeUpZbHBsMHlZdU95TzRNTmpGTWVhdXd6NGE5UlV1ZnJ3bWMxR0R5L0h5?=
 =?utf-8?B?Sm1yZHZjZDN0UzVreS9xM1FXdkp5bEpPV2ZzOVJ5Q0dXME9VSXp1VE9lOEtv?=
 =?utf-8?B?Mk92ckxwbGltOEZ6YWpZMnhtZlpFRHlmYjkvMVNGMXpDRFQwVjZyYXJRTGs3?=
 =?utf-8?B?b1c4TURnRStRUjBTOTNNQ0dpK0pZWWIzRHhYWTFTZGMrQU1yT3RucUFYOFhz?=
 =?utf-8?B?SXFCSGdxdWg0VFUwazdQNzRtWVNNMkJIbU5CbzhJU2t1M2VLTksxSEgwOUp6?=
 =?utf-8?B?RFJFdjVGR0lmeW9DVVhGSWJ5L0l4T1NncEx3akYycUVqV2tkV0pVdWJtbWt4?=
 =?utf-8?B?MFl3bE81cmtXdXdDQkZSQ3ZoTzlTOW4rbDh3dlZvRnNBWml1R2VXbFZUMWUy?=
 =?utf-8?B?L0VjTEtJWk43MHhwUFFHUnZGbGkxL1NvUHcwWlhtTDNyNlpwWUJLYkgwSjhM?=
 =?utf-8?B?SWVhWHhsSXQwQ2ZiMjlUQW02K1hjRmIrdHppTnBpWWVVSFRyRmdHNmYxTG9I?=
 =?utf-8?B?cFVxZDNiRnYyaG1McCszNEFmZjZtb29xZDJkaWxUdHZqaThuaFFiQUFQekJI?=
 =?utf-8?B?dXRWK2cyOThhUGIvSWExQW1TQ1J3VUdXbnFuSVVBNHVKakZhd0lTL1ZLMHlo?=
 =?utf-8?B?aUh4M1BPd21LdUdyTDZvbmo0NTRVWVRueXh0MnZyV3lURSt3VXdMV1dHUjBr?=
 =?utf-8?B?azhaV0xlSW9ZaU01aW9USDZKSm1vRUxXODI1VUZnVVB0VVRQYUhzcll4ZCtt?=
 =?utf-8?B?TC9aUzVSQUxPRzZ4L1d1TmZxL2tEaWdHNEN1clg5RGsvVXBnMDltTGhVTXFi?=
 =?utf-8?B?dHBWeCtrbU5zQVlYZ2hjU1VYek1KcWQ1dW5PTDlxbkhQYmNnZjEzeXk2azVs?=
 =?utf-8?B?ekI0ZWdkOFdHT0p3Q2lCS3A4bm5qWUxDWXpYY0tERlRCdGxVNTNXM2U4NWk0?=
 =?utf-8?B?TlBTRFcxb3VuUjNvdnJHTDBTS1RSTC9sL0Y0di96enMzZzRKZVlHUnIxeHY4?=
 =?utf-8?B?RlJvcGRTclZ6d2hHbVZLODh4NHlKdGV0WCtIaENFcXROV0I1Y0NpWnVSUWZL?=
 =?utf-8?B?ZjZpVFp0M0RBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?S2ZBWXBOQVJXUlFGdTdqNFB4aTdHN3JJTk45SFhLQ1MzKzBkSVFMQThEY1VU?=
 =?utf-8?B?eWlWQUlrdDQ1MlFlODJiRUlXanBCNWtobUNaMER3YjZyclVFcDhlUEN0VHlR?=
 =?utf-8?B?L1V5L2s1anFhSFpSclZhSTBhOW5xSHNoMXVaaVEyaWp2cWIvSTJYNHBFNUFq?=
 =?utf-8?B?TEFCQzdEZmtTUDVRaC9DWkorSFI1dXJ4V3I4QzZ2QitDeThNOU1ydU5GMXov?=
 =?utf-8?B?RENMT0JncWZ2WGFOUFhNTW12VGJpTXcvT0tKT2p6WGtxTmZCUmhRUUJNMHl3?=
 =?utf-8?B?dGdYc2RYbWEvMjZLaXJmVno3dnNYd1pxNk5CQ1dJUXhnZXA3RytRUVY4b3dn?=
 =?utf-8?B?TU01eHBlYzljVEtGNGJMMjV2VXFDOXEzZDBSUDJQdkpFaVRjelU1NW5JN2ZX?=
 =?utf-8?B?MU5tb0FmR0t0NVBvdllWakJ6YVhGbUs0TE9YMUErRjgrcjVzM1R3dXkxaWFs?=
 =?utf-8?B?V2VWUVRzRHpCaFdVQU8xQzcyMXZOZUpsNW5vTzJxOXpTK2p6LzVWWlIrTC9y?=
 =?utf-8?B?U2N5YmNSSzBpaEJJYzVxYVZpOTRXNmN1MHNmcmZnamsySDZTWjlxZHo1M2tJ?=
 =?utf-8?B?YWlWYnhIWG9RbTlrWUNPT1NKWUEzRTFZeEJVWCtkdGQyL3ZsMWN2UFdBcXlX?=
 =?utf-8?B?K2tzWi8wdzRJSHM1THF2dEFUVVA0UWpRODhEUnc2Qzl5Z2ZGeFJkcjZpNUdG?=
 =?utf-8?B?U0hiVEFsMkNLM1YrbmNFVXlTMUVocWY5YnNRZ1VqQ0lkYS9BYzVQZ1ByMDJR?=
 =?utf-8?B?VWJ3b0J2UVNNc3dFWHNQQlhMS28vZ1BpM1d1QlBOUXFrYSt4UnZMa3pMRHJv?=
 =?utf-8?B?bkRQV1FDaCtxTzlBY2doZ1MzcHRyV3NaTUNGK0dGQ2NqL2ZHSTZvWU5ZWEg5?=
 =?utf-8?B?aWo4WkYyMlZOTC83cnZpbWhCVTBiRWFDSXVPWHdYMUdSZ2hMbjd6ZkVQUTUy?=
 =?utf-8?B?TUZnOEJkcnRnc1cyK3BzcXlpYXlUS21jMVdRZXNvUld1bHYxcWF3L3B5RmFu?=
 =?utf-8?B?cWMvS3BPY3VEWm1IR2ZmbmZHR1RlSkFnaWJQR09QejFrL3RsK0R1QWRlMmZV?=
 =?utf-8?B?azdINzVLM3VvZkJHem5MR0tmVUZKRHN3Y0pyT29mSmNYUFNCelpWdDVLK1NR?=
 =?utf-8?B?eTZlcGE4ZDRndFpBVEFCK0paWjBudE9RZHJPenQrUW9ETmcyZyszeUphRDM2?=
 =?utf-8?B?V3ROV1l6NGxJN1dkUXN4Nk9WWmtqVlBtK0ttUlQ5TW5OU1lYTG5TN2xwbTVU?=
 =?utf-8?B?b2lGZGl2a05YVDBGLy9KcWhZSkNtc1RnMFRFSFpHdnJPeWMyaDVuQ0t0Wlkw?=
 =?utf-8?B?b2JyK0llZUR4cEtmdnNmeHlpaUJ1dVZlT0hHQlNrK1BscFZHazhOa3NHV2tC?=
 =?utf-8?B?cUNJcHNVbWZ4aEVHbk9jUU16bFFrVHVENjBiOE9Dbm1iUnhrQlBUQXczeWJy?=
 =?utf-8?B?am54aEtpNVI2M2l3b2FmaE5seHdrTjFpQnpEY0ptb2dNRDBMNlh1emhaYWlP?=
 =?utf-8?B?dU5oNzJBUkJoVVVBOWtoM3dMMlRwTnA5Ynk2SE1jcHNidFhvYzBweERvejYw?=
 =?utf-8?B?ODM5bVhsUCt6dGh5NTFkUWY2dDJEemxrN2F5aHFTZmZVbWRkVDJEakJBa0lZ?=
 =?utf-8?B?L1h4RzJSS2lJd0lFUDZuNlluem12dzh6dFd1Zy9ESlhGb0hycFo0bFpJWTVx?=
 =?utf-8?B?L3FlUVNBalBGV3MvS0xuQnBDUnZhZ1dLYkV6UFVUOUhWRENiRWEyWHpGNGhi?=
 =?utf-8?B?QkZ1SndkUmNrSEJCenVEcndEQU83L0g3NnhRNDk1RlRjckQ1bWRjNjZncG11?=
 =?utf-8?B?SjJBMDVySytrT2pBY2lReWhoOS9BdlhGUk9vSlkvM3Fwa0hLZXVMNE9IM242?=
 =?utf-8?B?aUI5Ynd4Qkp6VXpkNUw1YkYyZjVnTTRGZG9JZ0pKZGo0aUw3MzVnY1NLc0ZO?=
 =?utf-8?B?QjB0QlgwRnRvanJMbGZoTXJWSElhcnF2Vk5CVUEvZCtOa1hwaFhSOHRCZUNZ?=
 =?utf-8?B?ZTRwVnBCRGhJUXI5Z09kcnl2TVUwdzlzcUFOZjVqU1JuejhvR2d6MGoyUGwr?=
 =?utf-8?B?eFpMMCtPMHAwUTlvSm5vYnFnQWdPa3pRNkg1YW0rNXhubGxhUktLTVNkNzdO?=
 =?utf-8?Q?uBoM84UK6saMXjd5RA8O5cTZq?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27732d36-c842-4749-732b-08ddae6c44d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2025 13:30:19.0469
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RH/n7/bWY93bJHro0pydK5gdW8cRhrT9sYYQ9uxLvRMPcW6iGCMf3iRNf9/QDfrRX6yGfwNwMrEWviKIAFfLTjnQjlDXTtitp4STjlviDcU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10408

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMTggSnVuZSAyMDI1
IDEzOjU5DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgMS85XSBkdC1iaW5kaW5nczogbWVtb3J5
OiBEb2N1bWVudCBSWi9HM0Ugc3VwcG9ydA0KPiANCj4gSGkgUHJhYmhha2FyLA0KPiANCj4gT24g
V2VkLCAxOCBKdW4gMjAyNSBhdCAxNDowNiwgTGFkLCBQcmFiaGFrYXIgPHByYWJoYWthci5jc2Vu
Z2dAZ21haWwuY29tPiB3cm90ZToNCj4gPiBPbiBXZWQsIEp1biAxOCwgMjAyNSBhdCA4OjAz4oCv
QU0gR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4gd3JvdGU6DQo+ID4g
PiBPbiBUdWUsIDE3IEp1biAyMDI1IGF0IDIzOjA1LCBMYWQsIFByYWJoYWthciA8cHJhYmhha2Fy
LmNzZW5nZ0BnbWFpbC5jb20+IHdyb3RlOg0KPiA+ID4gPiBPbiBNb24sIE1hciAzMSwgMjAyNSBh
dCA3OjI14oCvUE0gR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4gd3Jv
dGU6DQo+ID4gPiA+ID4gT24gTW9uLCAzMSBNYXIgMjAyNSBhdCAxNzozMywgQmlqdSBEYXMgPGJp
anUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiA+ID4gPiA+ID4gRnJvbTogR2Vl
cnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4gT24gTW9uLCAzMQ0KPiA+ID4g
PiA+ID4gPiBNYXIgMjAyNSBhdCAxNjozNCwgQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVz
YXMuY29tPiB3cm90ZToNCj4gPiA+ID4gPiA+ID4gPiA+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZl
biA8Z2VlcnRAbGludXgtbTY4ay5vcmc+IE9uIE1vbiwNCj4gPiA+ID4gPiA+ID4gPiA+IDMxIE1h
ciAyMDI1IGF0IDE1OjU0LCBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+IHdy
b3RlOg0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+IEZyb206IEJpanUgRGFzIDxiaWp1LmRhcy5qekBi
cC5yZW5lc2FzLmNvbT4gRG9jdW1lbnQNCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiBzdXBwb3J0IGZv
ciB0aGUgRXhwYW5kZWQgU2VyaWFsIFBlcmlwaGVyYWwgSW50ZXJmYWNlDQo+ID4gPiA+ID4gPiA+
ID4gPiA+ID4gKHhTUEkpIENvbnRyb2xsZXIgaW4gdGhlIFJlbmVzYXMgUlovRzNFDQo+ID4gPiA+
ID4gPiA+ID4gPiA+ID4gKFI5QTA5RzA0NykgU29DLg0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+DQo+
ID4gPiA+ID4gPiA+ID4gPiA+ID4gUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIChBcm0pIDxyb2Jo
QGtlcm5lbC5vcmc+DQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBE
YXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gPiA+ID4gPiA+ID4NCj4gPiA+
ID4gPiA+ID4gPiA+ID4gPiAtLS0gL2Rldi9udWxsDQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gKysr
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS1jb250cg0KPiA+ID4g
PiA+ID4gPiA+ID4gPiA+ICsrKyBvbGxlcnMvcmVuZXMNCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiAr
KysgYXMscg0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICsrKyB6ZzNlDQo+ID4gPiA+ID4gPiA+ID4g
PiA+ID4gKysrIC14c3BpLnlhbWwNCj4gPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4g
PiA+ID4gKyAgICBzcGlAMTEwMzAwMDAgew0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICsgICAgICAg
IGNvbXBhdGlibGUgPSAicmVuZXNhcyxyOWEwOWcwNDcteHNwaSI7DQo+ID4gPiA+ID4gPiA+ID4g
PiA+ID4gKyAgICAgICAgcmVnID0gPDB4MTEwMzAwMDAgMHgxMDAwMD4sIDwweDIwMDAwMDAwIDB4
MTAwMDAwMDA+Ow0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgIHJlZy1uYW1lcyA9ICJy
ZWdzIiwgImRpcm1hcCI7DQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAgaW50ZXJydXB0
cyA9IDxHSUNfU1BJIDIyOCBJUlFfVFlQRV9FREdFX1JJU0lORz4sDQo+ID4gPiA+ID4gPiA+ID4g
PiA+ID4gKyAgICAgICAgICAgICAgICAgICAgIDxHSUNfU1BJIDIyOSBJUlFfVFlQRV9FREdFX1JJ
U0lORz47DQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAgaW50ZXJydXB0LW5hbWVzID0g
InB1bHNlIiwgImVycl9wdWxzZSI7DQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAgY2xv
Y2tzID0gPCZjcGcgQ1BHX01PRCAweDlmPiwgPCZjcGcgQ1BHX01PRCAweGEwPiwNCj4gPiA+ID4g
PiA+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgICA8JmNwZyBDUEdfTU9EIDB4YTE+LCA8JmNw
ZyBDUEdfTU9EDQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gKyAweGExPjsNCj4gPiA+ID4gPiA+ID4g
PiA+ID4NCj4gPiA+ID4gPiA+ID4gPiA+ID4gT24gdGhlIG5leHQgdmVyc2lvbiBJIGFtIGdvaW5n
IHRvIHVwZGF0ZSBzcGl4MiBjbGsgYXMNCj4gPiA+ID4gPiA+ID4gPiA+ID4gPCZjcGcgQ1BHX0NP
UkUgUjlBMDlHMDQ3X1NQSV9DTEtfU1BJWDI+DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBBY2NvcmRp
bmcgdG8gdGhlIFJaL0czRSBjbG9jayBzeXN0ZW0gZGlhZ3JhbSwgKHRoZSBwYXJlbnQgb2YpDQo+
ID4gPiA+ID4gY2xrX3NwaSBpcyBkZXJpdmVkIGZyb20gKHRoZSBwYXJlbnQgb2YpIGNsa19zcGl4
Miwgbm90IHRoZSBvdGhlciB3YXkgYXJvdW5kPw0KPiA+ID4gPiA+IFNvIHlvdSBjYW4gbW9kZWwg
Y2xrX3NwaSBhcyBhIGZpeGVkIGRpdmlkZXIgY2xvY2sgd2l0aCBwYXJlbnQNCj4gPiA+ID4gPiBj
bGtfc3BpeDINCj4gPiA+DQo+ID4gPiBeXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5e
Xl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl4NCj4gW0FdDQo+IA0KPiA+ID4gPiA+IGFuZCBmYWN0
b3IgdHdvLiAgSS5lLiBwcm92aWRlIGEgbmV3IGNvcmUgY2xvY2sNCj4gPiA+ID4gPiBSOUEwOUcw
NDdfU1BJX0NMS19TUEkgaW5zdGVhZCBvZiB5b3VyIHByb3Bvc2VkIFI5QTA5RzA0N19TUElfQ0xL
X1NQSVgyPw0KPiA+ID4gPiA+DQo+ID4gPiA+IFdpdGggdGhpcyBhcHByb2FjaCB3aGVuIFI5QTA5
RzA0N19TUElfQ0xLX1NQSSBpcyB1c2VkIGFzIGEgY29yZQ0KPiA+ID4gPiBjbG9jayBhbmQgWFNQ
SSBub2RlIGlzIGRpc2FibGVkIHRoZSBjbGtfc3VtbWFyeSByZXBvcnRzIHRoZSBjb3JlDQo+ID4g
PiA+IGNsb2NrIGlzIE9OICh3aGlsZSBpdCdzIGFjdHVhbGx5IE9GRikuDQo+ID4gPg0KPiA+ID4g
SXMgdGhhdCBhIHJlYWwgcHJvYmxlbSwgb3IgaXMgaXQgcHVyZWx5IGNvc21ldGljPw0KPiA+IEp1
c3QgY29zbWV0aWMgdGJoIGFzIGRlc3BpdGUgYmVpbmcgYSBNT0QgY2xvY2sgd2UgaGF2ZSB0byBk
ZWZpbmUgaXQgYXMNCj4gPiBhIGNvcmUgY2xvY2sgaW4gdGhlIERULg0KPiA+DQo+ID4gPiA+IENh
biB3ZSBtYXliZSB1c2UgYSB1bnVzZWQgT04gaW5kZXggYW5kIE9OIGJpdCBmb3IgZXhhbXBsZSAy
NSwgMA0KPiA+ID4gPiAoaWUNCj4gPiA+ID4gMHgxOTApIGFuZCByZXByZXNlbnQgdGhpcyBpcyBh
IG1vZHVsZSBjbG9jayBmb3IgZXhhbXBsZSBmb3IgdGhlDQo+ID4gPiA+IHNwaV9jbGtfc3BpeDIg
Y2xvY2sgYW5kIHVzZSB0aGlzIGluIHRoZSBEVCBhbmQgbGV0IHRoZSBDUEcgY29yZQ0KPiA+ID4g
PiBjb2RlIGhhbmRsZSBzdWNoIHR1cm5pbmcgT04vT0YgdGhlIG1vZHVsZSBjbG9ja3MgYmFzZWQg
b24gdGhlDQo+ID4gPiA+IGVuYWJsZSBjb3VudCB3aGljaCB3aWxsIGJlIGhhbmRsZWQgaW50ZXJu
YWxseSBpbiB0aGUgZHJpdmVyPw0KPiA+ID4NCj4gPiA+IFBsZWFzZSBkbyBub3QgdXNlICJ1bnVz
ZWQiIG1vZHVsZSBjbG9jayBiaXRzLiAgVGhlc2UgZG8gbm90IGRlc2NyaWJlDQo+ID4gPiB0aGUg
aGFyZHdhcmUsIGFuZCBtYXkgYWN0dWFsbHkgZXhpc3QgaW4gdGhlIGhhcmR3YXJlICh0cnkgZGlz
YWJsaW5nDQo+ID4gPiBhbGwgdW5kb2N1bWVudGVkIG1vZHVsZSBjbG9ja3MsIGFuZCBvYnNlcnZl
IHdoYXQgZmFpbHMuLi4pLg0KPiA+ID4NCj4gPiBBZ3JlZWQsICJ1bnVzZWQiIG1vZHVsZSBjbG9j
ayBiaXRzIHdlcmUgb25seSB1c2VkIGFzIGEgZHVtbXkuIFRoZQ0KPiA+IHJlYWQvd3JpdGUgb3Bl
cmF0aW9ucyB3ZXJlIG9ubHkgcGVyZm9ybWVkIG9uIHRoZSBhY3R1YWwgYml0cyB3aGljaCBhcmUN
Cj4gPiBkb2N1bWVudGVkIGluIHRoZSBIVyBtYW51YWwuDQo+ID4NCj4gPiA+IElmIHNwaV9jbGtf
c3BpIHJlYWxseSBtdXN0IHNob3cgYmVpbmcgZGlzYWJsZWQsIHlvdSBjYW4gY2hhbmdlIGl0DQo+
ID4gPiBmcm9tIGEgZml4ZWQgZGl2aWRlciBjbG9jayAod2hpY2ggZG9lcyBub3QgaW1wbGVtZW50
DQo+ID4gPiAue2VuLGRpc31hYmxlKCkpIHRvIGEgY3VzdG9tIGZpeGVkIGRpdmlkZXIgY2xvY2sg
dGhhdCBkb2VzIGltcGxlbWVudA0KPiA+ID4gLntlbixkaXN9YWJsZSgpIGFuZCBrZWVwcyB0cmFj
ayBpbnRlcm5hbGx5IG9mIHRoZSBmYWtlIHN0YXRlLCBvcg0KPiA+ID4gZXZlbiBsb29rcyBhdCB0
aGUgc3RhdGUgb2Ygc3BpX2Nsa19zcGl4Mj8NCj4gPiA+DQo+ID4gR29vZCBwb2ludC4gTWF5YmUg
aW5zdGVhZCBvZiBpbXBsZW1lbnRpbmcgdGhlIGR1bW15IC57ZW4sZGlzfWFibGUoKSBJDQo+ID4g
d2lsbCBpbXBsZW1lbnQgdGhlIGlzX2VuYWJsZWQoKSArIChjbGtfZml4ZWRfZmFjdG9yX29wcyku
IFRoZQ0KPiA+IGlzX2VuYWJsZWQoKSB3aWxsIHRha2UgY2FyZSBvZiByZWFkaW5nIGZyb20gdGhl
IE1PTiBiaXRzIGFuZCByZXBvcnQNCj4gPiB0aGUgYWN0dWFsIHN0YXRlIG9mIHRoZSBjbG9jay4N
Cj4gPg0KPiA+ID4gSG93ZXZlciwgdXBvbiBzZWNvbmQgbG9vaywgc3BpX2Nsa19zcGkgaXMgbm90
IGltcGxlbWVudGVkIGFzIGEgZml4ZWQNCj4gPiA+IGRpdmlkZXIgY2xvY2sgd2l0aCBwYXJlbnQg
Y2xrX3NwaXgyLCBhcyBkZXNjcmliZWQgYWJvdmU6DQo+ID4gPg0KPiA+ID4gICAgICAgLnNtdXgy
X3hzcGlfY2xrMSAgICAgMCAgMCAgMCAzMjAwMDAwMDAgIDAgIDAgIDUwMDAwICBZDQo+ID4gPiAg
ICAgICAgICAucGxsY20zM194c3BpICAgICAwICAwICAwIDQwMDAwMDAwICAgMCAgMCAgNTAwMDAg
IFkNCj4gPiA+ICAgICAgICAgICAgIHNwaV9jbGtfc3BpeDIgIDAgIDAgIDAgNDAwMDAwMDAgICAw
ICAwICA1MDAwMCAgTg0KPiA+ID4gICAgICAgICAgICAgc3BpX2Nsa19zcGkgICAgMCAgMCAgMCAy
MDAwMDAwMCAgIDAgIDAgIDUwMDAwICBZDQo+ID4gPiAgICAgICAgICBzcGlfYWNsayAgICAgICAg
ICAwICAwICAwIDIwMDAwMDAwMCAgMCAgMCAgNTAwMDAgIE4NCj4gPiA+ICAgICAgICAgIHNwaV9o
Y2xrICAgICAgICAgIDAgIDAgIDAgMjAwMDAwMDAwICAwICAwICA1MDAwMCAgTg0KPiA+ID4gICAg
ICAgLnNtdXgyX3hzcGlfY2xrMCAgICAgMCAgMCAgMCA1MzMzMzMzMzMgIDAgIDAgIDUwMDAwICBZ
DQo+ID4gPg0KPiA+ID4gSW5zdGVhZCwgdGhleSBib3RoIHVzZSBwbGxjbTMzX3hzcGkgYXMgdGhl
IHBhcmVudCBjbG9jay4NCj4gPiA+IEFwcGFyZW50bHkgSSBtaXNzZWQgdGhhdCBpbiB0aGUgcmV2
aWV3IG9mIFJaL0czRSBYU1BJIGNsb2NrIHN1cHBvcnQuDQo+ID4gPiBUaGUgY2hhbmdlbG9nIGZv
ciB0aGF0IHBhdGNoIGRvZXMgZGVzY3JpYmUgdGhlIGNvcnJlY3QgdG9wb2xvZ3k/DQo+ID4gPg0K
PiA+IFRoZSB0b3BvbG9neSBpcyBjb3JyZWN0IGZvciBSWi9HM0UsIHNwaS9zcGl4MiBhcmUgc291
cmNlZCBmcm9tDQo+ID4gcGxsY20zM194c3BpIGRpdmlkZXIgYW5kIHRoZXJlIGlzIGEgZGl2aWRl
ciAoLzIpIGZvciBzcGkuDQo+IA0KPiBCb3RoIHNwaV9jbGtfc3BpeDIgYW5kIHNwaV9jbGtfc3Bp
eCBoYXZlIC5wbGxjbTMzX3hzcGkgYXMgaW1tZWRpYXRlIHBhcmVudC4NCj4gDQo+IFtBXSBkZXNj
cmliZXMgc29tZXRoaW5nIGRpZmZlcmVudDoNCj4gDQo+ICAgICAucGxsY20zM194c3BpICAgICAw
ICAwICAwIDQwMDAwMDAwICAgMCAgMCAgNTAwMDAgIFkNCj4gICAgICAgICBzcGlfY2xrX3NwaXgy
ICAwICAwICAwIDQwMDAwMDAwICAgMCAgMCAgNTAwMDAgIE4NCj4gICAgICAgICAgICAgc3BpX2Ns
a19zcGkgICAgMCAgMCAgMCAyMDAwMDAwMCAgIDAgIDAgIDUwMDAwICBZDQo+IA0KPiBJLmUuIGlm
IHNwaV9jbGtfc3BpeDIoKSBpcyBkaXNhYmxlZCwgc3BpX2Nsa19zcGkoKSBpcyBkaXNhYmxlZCwg
dG9vLg0KDQpMb29rcyBsaWtlIEkgbWlzc2VkIHRoaXMgcGFydC4gU29ycnkgZm9yIHRoZSBtaXN0
YWtlLg0KDQpDaGVlcnMsDQpCaWp1DQo=

