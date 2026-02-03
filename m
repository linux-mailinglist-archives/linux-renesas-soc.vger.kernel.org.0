Return-Path: <linux-renesas-soc+bounces-27793-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qH14Bxi1gWnNIwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27793-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Feb 2026 09:43:04 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AE9D652F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Feb 2026 09:43:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 87D8B3004D0C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Feb 2026 08:43:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 764C9395270;
	Tue,  3 Feb 2026 08:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="RRYHvvgT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011025.outbound.protection.outlook.com [40.107.74.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C155129BDBA;
	Tue,  3 Feb 2026 08:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770108179; cv=fail; b=CSfuS2IWRlKTXQ3hHGWHIaxCx0EFe54OOMx1lN1OS1zHyxgMdOWNxw2bgkTZcmhJvJhMbnCMhftUyz3U90M8cINYdEc0yCqbHQnmczvAlRMNdNLOdZbALGVDLAWHOatVfbY0ATk24bqWPgyZWt55WoclO+pGwwt7zuUFLM2eT3U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770108179; c=relaxed/simple;
	bh=h6eKv9Urn4xxAlyTlAu6vk9mzFBr1MA1hC8pp8COpac=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eSSiCvM//89Cyq7Lxp9FgRA8Jx27GYMYVy7ae5Agx6IQBe33tKvKgyt10amFs4qirhIBnhI1w6aaCxxsGZbTjx+bvcw4pUd8QqPt+o+kDq/ggy/jJDdbEhAGbjNmAOJM3ymKW0sHH47/nydES+pQi3ghr+BRYZb/9pL2DsRIcAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=RRYHvvgT; arc=fail smtp.client-ip=40.107.74.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fm4p/GAICI1+QkR5BIkYwkafu0FowQmYINocC1YJUHcCkP54yFD+BDVq93GgNf01/WLVaYWiNmxY6IfVDJehAZ0iXj1WFvhweKLk9lt32nHRFZBgXRW7Vpypa9RbaKujPZQqHeEicAhZUDDD4qTShQSVxkn+oURnGggLl9xY+qqeeujSq192tvQq9H58W2JkB8IqKsGv3KCdWM0c0yS9SDZkhhNam0cRjeqrCwCCysLB44/khUixuijH9b6ua7VFpgwWDKtrBmt1CQvb03o7vtY51v+QAWw1jB18RVOoJPw55Mu8hFmYbC4LVJGWsHWo7O6pWwAX5GG7VcoQX4f52g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UYnVk3goULaIicdRlxwmKNO7NJLpf+hVVjOuWJg3Il4=;
 b=lyJfhVtE4Nib/q560+BLCn8sWNF5vbvoAJThdnBXIMVY4ROUdOt6hL8RH1DIxbTiPmGAg3vnKe+fC8pgNdL0OgWWC/HSYy4sMiAwv1xJaO2xJ+h4LyZcA2Cc24ds8t2xK786nU6zHTcJ7apO2Sj07KsJop90eLRfM3I1JgKTX5g5tWbfdLG9rfRiWVxtWWDqVVJJ7zuR9hnRCNg7Ua6s1IKPX0ToCGEmNJ/tk4BxdpZfJ0Aq+iiMP3O2cGtayPfKR/WfMLJm/nA2lq46TtnuGLoH6ijXrgUKEph1g8I1HTDeWcQlKIsLQrTpQVPt7J9/L1u4vBtK7/2HhdUZOw+fUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UYnVk3goULaIicdRlxwmKNO7NJLpf+hVVjOuWJg3Il4=;
 b=RRYHvvgT/p/RD7GNylZvhrTB61EGOxbf71/gxOoZ+SknCQwULOzB/ZtPkmxJDh0DXFxRlK+45BgbLEZrd7J7uRacbdt311385tAP/giBSXKaPwzaULS/w13PVFs4/h8/YYllntTsz5GwVRW9qpxOKEYhanTGSL2EeIv+KIV4Swg=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB7993.jpnprd01.prod.outlook.com (2603:1096:604:162::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Tue, 3 Feb
 2026 08:42:52 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 08:42:52 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: biju.das.au <biju.das.au@gmail.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	magnus.damm <magnus.damm@gmail.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, Conor Dooley <conor.dooley@microchip.com>
Subject: RE: [PATCH v2 05/10] dt-bindings: clock: Document RZ/G3L SoC
Thread-Topic: [PATCH v2 05/10] dt-bindings: clock: Document RZ/G3L SoC
Thread-Index: AQHckEmMBtpsOm+ky0qRIX+nrWpEGrVwsPQg
Date: Tue, 3 Feb 2026 08:42:52 +0000
Message-ID:
 <TY3PR01MB11346F1595704B5350F0DF7D2869BA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260128113032.337231-1-biju.das.jz@bp.renesas.com>
 <20260128113032.337231-6-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260128113032.337231-6-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB7993:EE_
x-ms-office365-filtering-correlation-id: 59f49def-cc42-4410-63e9-08de630037f0
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?gCTTgZn0IwuhpnEGlDu+W9+tE5XBAQc48dARd+90H/u+KBSX0qkNifWscBYQ?=
 =?us-ascii?Q?O5P3Jo1PZWvJAU9zXOg51xSVtWWJAPtaiN086ypts63GPpXHfs/WiC41HHUh?=
 =?us-ascii?Q?caIMcOfR0YIlaeiQzACZotkn8BvlhzdhdRCWbk68w5u2/ZUmZxEbvTOQT9VX?=
 =?us-ascii?Q?89vQs+bWVaJNZLdWNjqWnP+vU7tcfEmhm86Nmc0gwQSX6nFP5hazjgK9uDOd?=
 =?us-ascii?Q?v/v9HkGwxZcS31pRIz2WvExITNuNzyenVbSM9XCxVzZ26Kw5kd+UQ0oIWydI?=
 =?us-ascii?Q?HVUVWmobfzZWONKXDhZsTYRVuPs+LrK3cn5kHwaJXJqE3YMmpxWG3U1GnZsp?=
 =?us-ascii?Q?zGuYLDCPaNQ7gD477ct30KhzXaNSc8M8E/+1pRYBVhYLFJ5yfvhLMN38/SO5?=
 =?us-ascii?Q?ufaTrZcvBEejMRabfp5mvPnuoelDZAoABNLq5sSzIkXfLSeLAc5ITslQLVcU?=
 =?us-ascii?Q?NN3r77VDEL9d0aEc0YM9kAlsI4xwagpq/De5geHKg0qS0/uDWWB2Gk+Jfs/S?=
 =?us-ascii?Q?unEYlN+ahke/K2bvhQuAcil1dr4CfQ/BPDHiV8aVO40SbT1Cat9yS8XHvCOB?=
 =?us-ascii?Q?FE9JSe5xrWLDm1ea4mOg+GzqzfACtb6Fel2xORcWe1fHEDo6KazG+3WTADNn?=
 =?us-ascii?Q?YBfFcbrTk7EEzeEwcFMUJr+8VQG/ngnKBi3bV+63n2PsRA34QD+3s1WV/YzS?=
 =?us-ascii?Q?biRdulnUnJ0H8JhkssUre3JSRnNJ/bIyfJcDz3Q0VWYksoBCiVW9h49G1Nv9?=
 =?us-ascii?Q?iRSVYsPRucRBYcdnJKICIdwegaArwph1kp6gdL0sZBB5km0C9vTrpie6LrUA?=
 =?us-ascii?Q?tccbAy4e7k5XjByk8yRXRDyN7tYwRE03s56Pq9yfaO2OPph7OMoHUhDHT/O6?=
 =?us-ascii?Q?W36tz5PmxAq0IRBa5k4N0uOpJEOvqbSg5Nlg8DCplQUko6UWBtkSniS87W7G?=
 =?us-ascii?Q?J6COTpYIpWbam3AQWqAyEBblcNjBPJO+1JLMWCd236ekEEzti1OiQGf4pMdi?=
 =?us-ascii?Q?eHvIJghEA8718Bs+STsyvwMIuKvt4NoUPg3PfSGMHhFx/Eo9pYs/u47mc/8u?=
 =?us-ascii?Q?piuHSg1kCC9avsWzuZOeAMYbZbLuU+U2/kxW9Dl4pL2NMXWQej4hRcO9Q0r2?=
 =?us-ascii?Q?PxgSp7fQwMldEdwSbRgIdECsU00PXuLLdgkpmm/X4dHLiZBpqMxGCct1LpXA?=
 =?us-ascii?Q?fz06WKbHxeNsNiDsYtiVrLdAYSffhY5yiNFRqm98tLzukurxPiJFGZyVGT7h?=
 =?us-ascii?Q?aRKrpQbCajIW9cn5c8h1nAXD5iYLbVntvy/zt2nWvaVWrRo/lWqG68fN+SEn?=
 =?us-ascii?Q?/8rMo2W83YkX8M/nmkV1jz3A0pE5gGbbbImtbDw9uFs028wZFLqY51pN3ms8?=
 =?us-ascii?Q?rO8oYObHK+QcRrdyr5t/gzlEhrjaQl/G1/9hVtk3W3A8b8G+kkRLd3EEjScj?=
 =?us-ascii?Q?ia/0mdcDBSwDnN59lLUBW8UNRdCK9mjH5g0MRWfKXqcfXm4znvcb1J4KR/cN?=
 =?us-ascii?Q?R2sHg5ubL62RK3NKO8Hec0Mi/rZpPoM28JNwihb/jsdnz1JQ/2NL6GldTqab?=
 =?us-ascii?Q?J3zx7roeKd7jGI7cdKNsB6XfcDcRu02j7KLb4P/vQpZGpKGjKZS85Mu6I7eE?=
 =?us-ascii?Q?JVVRrWNtQPzM9TE1F3RIcjU=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?aV8oCP9snLHC1nK23qDJJfVtCYJ4CahCNpFxo3yqclUewgqpMA6ZiXc1y3f6?=
 =?us-ascii?Q?srlt18m0J+vMe7aPhFjDB4jKKUS3z/OW3KDP4Hr0T48+qYz/e4e97Mt22LUl?=
 =?us-ascii?Q?DkmEiM0dVmFyHxXodvS8ph0e07TSKGb63ypnu+CxhkDgKRxySNi7BcVuwCK7?=
 =?us-ascii?Q?dVCvY57a8IZtZpDSt6VW3zkQ0Lt3258ft0d3B6K8nwvbZr/1r8EHfA3HY4Bh?=
 =?us-ascii?Q?LsSsUUzyhG/wXw/dGiYS16Wx1iFNzznSoVwS0P4n9VEagApPJLNSysFaWEPh?=
 =?us-ascii?Q?IJ0s2ZRN9RQ87LJ7VzmIMr8L1o3j2OlFKUq+V7BCnHvVMxEchX8/mvzjQxW4?=
 =?us-ascii?Q?atI0APDSPvISenqsI6sUsUEDuy8lzpNeEyB/e4kRxm+rWus6u9vTScMgaQfg?=
 =?us-ascii?Q?iQHlEWqGjySEUvgeiWsnbMGLoey7WtRYDIjsXw2Fg4xqhUUHFXV9fcI7OktS?=
 =?us-ascii?Q?yHKsxbzUObCGS6lbVrlzgW5+FifrFs7wos+808NVt2M/yAc54/+6COleLVeZ?=
 =?us-ascii?Q?c44HlknJf3EIPn5QWFKkH1iRuzYrvOzCtcWadQRqGx+K2vQnDBzT+qwk0Wpg?=
 =?us-ascii?Q?47KWa+b1gLourbsr+/JpvxJfqVS1AvPRhSHcGHpU5SzUaeQUnpYBAvFOLL3J?=
 =?us-ascii?Q?bzPj+FNyqWUkyTVDDMpt4efGNMDBaqfy2bLRVCslX6ww7M3lJ3oIKPQNiQLQ?=
 =?us-ascii?Q?yZWBDkqP3/3YX7ij3EbvNe9TxIS5CGRFAIazwE+Er4ugyu+ffmLrwtLx5tXk?=
 =?us-ascii?Q?Rztz/nfd1EoOFEkaz1VSc0jcErFxc36BkAYpluzxTK8hyQd0z8StvQKEYcBJ?=
 =?us-ascii?Q?cDf0R8vUGyMhXZt9XT/dBh+CF7FhXh8YBU/4efHzi96RE4f1moho9CS2j/k4?=
 =?us-ascii?Q?KfpKKdXeg708Aacg3XW1y6zfdmxFUX/JZaZVhY9EjxN93wcNi7a32qFvFV3d?=
 =?us-ascii?Q?Kdn1H2/q4Unn+KBs9tGxMgpXftnoX1ms5avVUywJTuVtxrgTOFbtFb1ePZjn?=
 =?us-ascii?Q?4Xtf/x8BhKxJ+fH/oHOywou+67pWIIJp+D48cAVfScTfqYpffYUCsrsZtuOo?=
 =?us-ascii?Q?LlrINwBoo5oHz/JSv3BMKdcVC4TTJD0IDCCzwtLQTo2p+7+LB/YK3stUGr3k?=
 =?us-ascii?Q?l99sNUQ1qm0jeiiDR3uAMvJPajVeqTQ5vLDm6WdDEYgMhVIThrgutLx0331C?=
 =?us-ascii?Q?FjSCdNc/DPf5UvdUEqTvE/48phSRAPfAfA65F56Uq90dXcFB10P1Wvw1GSu7?=
 =?us-ascii?Q?344HZKbCzSnZrlNNBUDNRAUypq7OxRJoT63IU/XmLdyRH8LjZNFIK7wJ2V1F?=
 =?us-ascii?Q?XX/xtT4/RG95JU7TfVSHV4VYJ1ctvJItmBQJeucrhji3d7tVZNc1gjGa9hfv?=
 =?us-ascii?Q?+kWfuiwnWWVS0oDCpL6wslkM3arHaVGOPX7Yiashj3nOpG/QkfGs702lEXIC?=
 =?us-ascii?Q?gFHs+uM2tceOmoHXuYc0zWas5oL7mhOg9FQuMgBnxL8I6tNU55MCV6+BuqBi?=
 =?us-ascii?Q?48RRo6crSQeMs8tWZ4PI0U/K1LSHkarKxtd2Ol0Lglvtgl/eeq+QY4y21ReK?=
 =?us-ascii?Q?8HIyuQ99+0Oj4IAeg1Wo8DDDxkSGOVJf3Z3HZ6+ClgG7AjRW4Ie+8892nDB4?=
 =?us-ascii?Q?OlqSlVQ53iiy9bSwkdF3e0aFB6DJRSO2+i/Mr83nB0qi9uVkpXNTk7S+wxat?=
 =?us-ascii?Q?u3QMkBwEK4wRKHQci0dkUr33DJH8VDFoslmPyvn/HFxFtBefX0hYWb6JiGMC?=
 =?us-ascii?Q?6YFzmLd4XQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 59f49def-cc42-4410-63e9-08de630037f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2026 08:42:52.2233
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nvTW3n6qyXlK7FyfEBRLDGaaIvPRQZQKeqzl1DkKkSLKzi8S1n3QhLc6uOgO+ExxabMU0P25I0QG0pmMyQLS3c681ZzZSBV3KFJRJB5wDs8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7993
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27793-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,glider.be,baylibre.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,gmail.com,microchip.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:dkim,renesas.com:email,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Queue-Id: 35AE9D652F
X-Rspamd-Action: no action

Hi all,

> -----Original Message-----
> From: Biju <biju.das.au@gmail.com>
> Sent: 28 January 2026 11:30
> Subject: [PATCH v2 05/10] dt-bindings: clock: Document RZ/G3L SoC
>=20
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> Document the device tree bindings for the Renesas RZ/G3L SoC Clock Pulse =
Generator (CPG). RZ/G3L CPG
> is similar to RZ/G2L CPG but has 5 clocks compared to 1 clock on other So=
Cs.
>=20
> Also define RZ/G3L (R9A08G046) Clock Pulse Generator Core Clock, module c=
lock outputs, as listed in
> section 4.4.2 ("Clock List r1.00") and add Reset definitions referring to=
 registers CPG_RST_* in
> Section 4.4.3
> ("Register") of the RZ/G3L Hardware User's Manual (Rev.1.00 Oct, 2025).
>=20
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Documented external ethernet clocks as it is a clock source for MUX
>    inside CPG
>  * Updated commit description.
>  * Keep the tag from Conor as it is trivial change for adding more
>    clks.
> ---
>  .../bindings/clock/renesas,rzg2l-cpg.yaml     |  40 ++-
>  include/dt-bindings/clock/r9a08g046-cpg.h     | 339 ++++++++++++++++++
>  2 files changed, 374 insertions(+), 5 deletions(-)  create mode 100644 i=
nclude/dt-
> bindings/clock/r9a08g046-cpg.h
>=20
> diff --git a/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.ya=
ml
> b/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
> index 8c18616e5c4d..c0ce687d83ee 100644
> --- a/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
> +++ b/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
> @@ -28,19 +28,30 @@ properties:
>        - renesas,r9a07g044-cpg # RZ/G2{L,LC}
>        - renesas,r9a07g054-cpg # RZ/V2L
>        - renesas,r9a08g045-cpg # RZ/G3S
> +      - renesas,r9a08g046-cpg # RZ/G3L
>        - renesas,r9a09g011-cpg # RZ/V2M
>=20
>    reg:
>      maxItems: 1
>=20
>    clocks:
> -    maxItems: 1
> +    minItems: 1
> +    items:
> +      - description: Clock source to CPG can be either from external clo=
ck
> +                     input (EXCLK) or crystal oscillator (XIN/XOUT).
> +      - description: ETH0 TXC clock input
> +      - description: ETH0 RXC clock input
> +      - description: ETH1 TXC clock input
> +      - description: ETH1 RXC clock input
>=20
>    clock-names:
> -    description:
> -      Clock source to CPG can be either from external clock input (EXCLK=
) or
> -      crystal oscillator (XIN/XOUT).
> -    const: extal
> +    minItems: 1
> +    items:
> +      - const: extal
> +      - const: eth0_txc_tx_clk
> +      - const: eth0_rxc_rx_clk
> +      - const: eth1_txc_tx_clk
> +      - const: eth1_rxc_rx_clk
>=20
>    '#clock-cells':
>      description: |
> @@ -74,6 +85,25 @@ required:
>    - '#power-domain-cells'
>    - '#reset-cells'
>=20
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a08g046-cpg
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 5
> +        clock-names:
> +          minItems: 5
> +    else:
> +      properties:
> +        clocks:
> +          maxItems: 1
> +        clock-names:
> +          maxItems: 1
> +
>  additionalProperties: false
>=20
>  examples:
> diff --git a/include/dt-bindings/clock/r9a08g046-cpg.h b/include/dt-bindi=
ngs/clock/r9a08g046-cpg.h
> new file mode 100644
> index 000000000000..d8304a73efdf
> --- /dev/null
> +++ b/include/dt-bindings/clock/r9a08g046-cpg.h
> @@ -0,0 +1,339 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> + *
> + * Copyright (C) 2026 Renesas Electronics Corp.
> + */
> +#ifndef __DT_BINDINGS_CLOCK_R9A08G046_CPG_H__
> +#define __DT_BINDINGS_CLOCK_R9A08G046_CPG_H__
> +
> +#include <dt-bindings/clock/renesas-cpg-mssr.h>
> +
> +/* R9A08G046 CPG Core Clocks */
> +#define R9A08G046_CLK_I			0
> +#define R9A08G046_CLK_IC0		1
> +#define R9A08G046_CLK_IC1		2
> +#define R9A08G046_CLK_IC2		3
> +#define R9A08G046_CLK_IC3		4
> +#define R9A08G046_CLK_P0		5
> +#define R9A08G046_CLK_P1		6
> +#define R9A08G046_CLK_P2		7
> +#define R9A08G046_CLK_P3		8
> +#define R9A08G046_CLK_P4		9
> +#define R9A08G046_CLK_P5		10
> +#define R9A08G046_CLK_P6		11
> +#define R9A08G046_CLK_P7		12
> +#define R9A08G046_CLK_P8		13
> +#define R9A08G046_CLK_P9		14
> +#define R9A08G046_CLK_P10		15
> +#define R9A08G046_CLK_P13		16
> +#define R9A08G046_CLK_P14		17
> +#define R9A08G046_CLK_P15		18
> +#define R9A08G046_CLK_P16		19
> +#define R9A08G046_CLK_P17		20
> +#define R9A08G046_CLK_P18		21
> +#define R9A08G046_CLK_P19		22
> +#define R9A08G046_CLK_P20		23
> +#define R9A08G046_CLK_M0		24
> +#define R9A08G046_CLK_M1		25
> +#define R9A08G046_CLK_M2		26
> +#define R9A08G046_CLK_M3		27
> +#define R9A08G046_CLK_M4		28
> +#define R9A08G046_CLK_M5		29
> +#define R9A08G046_CLK_M6		30
> +#define R9A08G046_CLK_AT		31
> +#define R9A08G046_CLK_B			32
> +#define R9A08G046_CLK_ETHTX01		33
> +#define R9A08G046_CLK_ETHTX02		34
> +#define R9A08G046_CLK_ETHRX01		35
> +#define R9A08G046_CLK_ETHRX02		36
> +#define R9A08G046_CLK_ETHRM0		37
> +#define R9A08G046_CLK_ETHTX11		38
> +#define R9A08G046_CLK_ETHTX12		39
> +#define R9A08G046_CLK_ETHRX11		40
> +#define R9A08G046_CLK_ETHRX12		41
> +#define R9A08G046_CLK_ETHRM1		42
> +#define R9A08G046_CLK_G			43
> +#define R9A08G046_CLK_HP		44
> +#define R9A08G046_CLK_SD0		45
> +#define R9A08G046_CLK_SD1		46
> +#define R9A08G046_CLK_SD2		47
> +#define R9A08G046_CLK_SPI0		48
> +#define R9A08G046_CLK_SPI1		49
> +#define R9A08G046_CLK_S0		50
> +#define R9A08G046_CLK_SWD		51
> +#define R9A08G046_OSCCLK		52
> +#define R9A08G046_OSCCLK2		53
> +#define R9A08G046_CLK_P4_DIV2		54
> +
> +/* R9A08G046 Module Clocks */
> +#define R9A08G046_CA55_SCLK		0
> +#define R9A08G046_CA55_PCLK		1
> +#define R9A08G046_CA55_ATCLK		2
> +#define R9A08G046_CA55_GICCLK		3
> +#define R9A08G046_CA55_PERICLK		4
> +#define R9A08G046_CA55_ACLK		5
> +#define R9A08G046_CA55_TSCLK		6
> +#define R9A08G046_CA55_CORECLK0		7
> +#define R9A08G046_CA55_CORECLK1		8
> +#define R9A08G046_CA55_CORECLK2		9
> +#define R9A08G046_CA55_CORECLK3		10
> +#define R9A08G046_SRAM_ACPU_ACLK0	11
> +#define R9A08G046_SRAM_ACPU_ACLK1	12
> +#define R9A08G046_SRAM_ACPU_ACLK2	13
> +#define R9A08G046_GIC600_GICCLK		14
> +#define R9A08G046_IA55_CLK		15
> +#define R9A08G046_IA55_PCLK		16
> +#define R9A08G046_MHU_PCLK		17
> +#define R9A08G046_SYC_CNT_CLK		18
> +#define R9A08G046_DMAC_ACLK		19
> +#define R9A08G046_DMAC_PCLK		20
> +#define R9A08G046_OSTM0_PCLK		21
> +#define R9A08G046_OSTM1_PCLK		22
> +#define R9A08G046_OSTM2_PCLK		23
> +#define R9A08G046_MTU_X_MCK_MTU3	24
> +#define R9A08G046_POE3_CLKM_POE		25
> +#define R9A08G046_GPT_PCLK		26
> +#define R9A08G046_POEG_A_CLKP		27
> +#define R9A08G046_POEG_B_CLKP		28
> +#define R9A08G046_POEG_C_CLKP		29
> +#define R9A08G046_POEG_D_CLKP		30
> +#define R9A08G046_WDT0_PCLK		31
> +#define R9A08G046_WDT0_CLK		32
> +#define R9A08G046_WDT1_PCLK		33
> +#define R9A08G046_WDT1_CLK		34
> +#define R9A08G046_WDT2_PCLK		35
> +#define R9A08G046_WDT2_CLK		36
> +#define R9A08G046_XSPI_HCLK		37
> +#define R9A08G046_XSPI_ACLK		38
> +#define R9A08G046_XSPI_CLK		39
> +#define R9A08G046_XSPI_CLKX2		40
> +#define R9A08G046_SDHI0_IMCLK		41
> +#define R9A08G046_SDHI0_IMCLK2		42
> +#define R9A08G046_SDHI0_CLK_HS		43
> +#define R9A08G046_SDHI0_IACLKS		44
> +#define R9A08G046_SDHI0_IACLKM		45
> +#define R9A08G046_SDHI1_IMCLK		46
> +#define R9A08G046_SDHI1_IMCLK2		47
> +#define R9A08G046_SDHI1_CLK_HS		48
> +#define R9A08G046_SDHI1_IACLKS		49
> +#define R9A08G046_SDHI1_IACLKM		50
> +#define R9A08G046_SDHI2_IMCLK		51
> +#define R9A08G046_SDHI2_IMCLK2		52
> +#define R9A08G046_SDHI2_CLK_HS		53
> +#define R9A08G046_SDHI2_IACLKS		54
> +#define R9A08G046_SDHI2_IACLKM		55
> +#define R9A08G046_GE3D_CLK		56
> +#define R9A08G046_GE3D_AXI_CLK		57
> +#define R9A08G046_GE3D_ACE_CLK		58
> +#define R9A08G046_ISU_ACLK		59
> +#define R9A08G046_ISU_PCLK		60
> +#define R9A08G046_H264_CLK_A		61
> +#define R9A08G046_H264_CLK_P		62
> +#define R9A08G046_CRU_SYSCLK		63
> +#define R9A08G046_CRU_VCLK		64
> +#define R9A08G046_CRU_PCLK		65
> +#define R9A08G046_CRU_ACLK		66
> +#define R9A08G046_MIPI_DSI_PLLCLK	67
> +#define R9A08G046_MIPI_DSI_SYSCLK	68
> +#define R9A08G046_MIPI_DSI_ACLK		69
> +#define R9A08G046_MIPI_DSI_PCLK		70
> +#define R9A08G046_MIPI_DSI_VCLK		71
> +#define R9A08G046_MIPI_DSI_LPCLK	72
> +#define R9A08G046_LVDS_PLLCLK		73
> +#define R9A08G046_LVDS_CLK_DOT0		74
> +#define R9A08G046_LVDS_PCLK		75
> +#define R9A08G046_LCDC_CLK_A		76
> +#define R9A08G046_LCDC_CLK_D		77
> +#define R9A08G046_LCDC_CLK_P		78
> +#define R9A08G046_SSI0_PCLK2		79
> +#define R9A08G046_SSI0_PCLK_SFR		80
> +#define R9A08G046_SSI1_PCLK2		81
> +#define R9A08G046_SSI1_PCLK_SFR		82
> +#define R9A08G046_SSI2_PCLK2		83
> +#define R9A08G046_SSI2_PCLK_SFR		84
> +#define R9A08G046_SSI3_PCLK2		85
> +#define R9A08G046_SSI3_PCLK_SFR		86
> +#define R9A08G046_USB_U2H0_HCLK		87
> +#define R9A08G046_USB_U2H1_HCLK		88
> +#define R9A08G046_USB_U2P0_EXR_CPUCLK	89
> +#define R9A08G046_USB_U2P1_EXR_CPUCLK	90
> +#define R9A08G046_USB_PCLK		91
> +#define R9A08G046_USB_SCLK		92
> +#define R9A08G046_ETH0_CLK_AXI		93
> +#define R9A08G046_ETH0_CLK_CHI		94
> +#define R9A08G046_ETH0_CLK_TX_I		95
> +#define R9A08G046_ETH0_CLK_RX_I		96
> +#define R9A08G046_ETH0_CLK_TX_180_I	97
> +#define R9A08G046_ETH0_CLK_RX_180_I	98
> +#define R9A08G046_ETH0_CLK_RMII_I	99
> +#define R9A08G046_ETH0_CLK_PTP_REF_I	100

As per the latest update from HW team,
I need to add RMII_TX and RMII_RX for ETH0.

> +#define R9A08G046_ETH1_CLK_AXI		101
> +#define R9A08G046_ETH1_CLK_CHI		102
> +#define R9A08G046_ETH1_CLK_TX_I		103
> +#define R9A08G046_ETH1_CLK_RX_I		104
> +#define R9A08G046_ETH1_CLK_TX_180_I	105
> +#define R9A08G046_ETH1_CLK_RX_180_I	106
> +#define R9A08G046_ETH1_CLK_RMII_I	107
> +#define R9A08G046_ETH1_CLK_PTP_REF_I	108

Similarly, RMII_TX and RMII_RX for ETH1.

I will send next version fixing this.

Cheers,
Biju


> +#define R9A08G046_I2C0_PCLK		109
> +#define R9A08G046_I2C1_PCLK		110
> +#define R9A08G046_I2C2_PCLK		111
> +#define R9A08G046_I2C3_PCLK		112
> +#define R9A08G046_SCIF0_CLK_PCK		113
> +#define R9A08G046_SCIF1_CLK_PCK		114
> +#define R9A08G046_SCIF2_CLK_PCK		115
> +#define R9A08G046_SCIF3_CLK_PCK		116
> +#define R9A08G046_SCIF4_CLK_PCK		117
> +#define R9A08G046_SCIF5_CLK_PCK		118
> +#define R9A08G046_RSCI0_PCLK		119
> +#define R9A08G046_RSCI0_TCLK		120
> +#define R9A08G046_RSCI1_PCLK		121
> +#define R9A08G046_RSCI1_TCLK		122
> +#define R9A08G046_RSCI2_PCLK		123
> +#define R9A08G046_RSCI2_TCLK		124
> +#define R9A08G046_RSCI3_PCLK		125
> +#define R9A08G046_RSCI3_TCLK		126
> +#define R9A08G046_RSPI0_PCLK		127
> +#define R9A08G046_RSPI0_TCLK		128
> +#define R9A08G046_RSPI1_PCLK		129
> +#define R9A08G046_RSPI1_TCLK		130
> +#define R9A08G046_RSPI2_PCLK		131
> +#define R9A08G046_RSPI2_TCLK		132
> +#define R9A08G046_CANFD_PCLK		133
> +#define R9A08G046_CANFD_CLK_RAM		134
> +#define R9A08G046_GPIO_HCLK		135
> +#define R9A08G046_ADC0_ADCLK		136
> +#define R9A08G046_ADC0_PCLK		137
> +#define R9A08G046_ADC1_ADCLK		138
> +#define R9A08G046_ADC1_PCLK		139
> +#define R9A08G046_TSU_PCLK		140
> +#define R9A08G046_PDM_PCLK		141
> +#define R9A08G046_PDM_CCLK		142
> +#define R9A08G046_PCI_ACLK		143
> +#define R9A08G046_PCI_CLKL1PM		144
> +#define R9A08G046_PCI_CLK_PMU		145
> +#define R9A08G046_SPDIF_PCLK		146
> +#define R9A08G046_I3C_TCLK		147
> +#define R9A08G046_I3C_PCLK		148
> +#define R9A08G046_VBAT_BCLK		149
> +#define R9A08G046_BSC_X_BCK_BSC		150
> +
> +/* R9A08G046 Resets */
> +#define R9A08G046_CA55_RST0_0		0
> +#define R9A08G046_CA55_RST0_1		1
> +#define R9A08G046_CA55_RST0_2		2
> +#define R9A08G046_CA55_RST0_3		3
> +#define R9A08G046_CA55_RST4_0		4
> +#define R9A08G046_CA55_RST4_1		5
> +#define R9A08G046_CA55_RST4_2		6
> +#define R9A08G046_CA55_RST4_3		7
> +#define R9A08G046_CA55_RST8		8
> +#define R9A08G046_CA55_RST9		9
> +#define R9A08G046_CA55_RST10		10
> +#define R9A08G046_CA55_RST11		11
> +#define R9A08G046_CA55_RST12		12
> +#define R9A08G046_CA55_RST13		13
> +#define R9A08G046_CA55_RST14		14
> +#define R9A08G046_CA55_RST15		15
> +#define R9A08G046_CA55_RST16		16
> +#define R9A08G046_SRAM_ACPU_ARESETN0	17
> +#define R9A08G046_SRAM_ACPU_ARESETN1	18
> +#define R9A08G046_SRAM_ACPU_ARESETN2	19
> +#define R9A08G046_GIC600_GICRESET_N	20
> +#define R9A08G046_GIC600_DBG_GICRESET_N	21
> +#define R9A08G046_IA55_RESETN		22
> +#define R9A08G046_MHU_RESETN		23
> +#define R9A08G046_SYC_RESETN		24
> +#define R9A08G046_DMAC_ARESETN		25
> +#define R9A08G046_DMAC_RST_ASYNC	26
> +#define R9A08G046_GTM0_PRESETZ		27
> +#define R9A08G046_GTM1_PRESETZ		28
> +#define R9A08G046_GTM2_PRESETZ		29
> +#define R9A08G046_MTU_X_PRESET_MTU3	30
> +#define R9A08G046_POE3_RST_M_REG	31
> +#define R9A08G046_GPT_RST_C		32
> +#define R9A08G046_POEG_A_RST		33
> +#define R9A08G046_POEG_B_RST		34
> +#define R9A08G046_POEG_C_RST		35
> +#define R9A08G046_POEG_D_RST		36
> +#define R9A08G046_WDT0_PRESETN		37
> +#define R9A08G046_WDT1_PRESETN		38
> +#define R9A08G046_WDT2_PRESETN		39
> +#define R9A08G046_XSPI_HRESETN		40
> +#define R9A08G046_XSPI_ARESETN		41
> +#define R9A08G046_SDHI0_IXRST		42
> +#define R9A08G046_SDHI1_IXRST		43
> +#define R9A08G046_SDHI2_IXRST		44
> +#define R9A08G046_SDHI0_IXRSTAXIM	45
> +#define R9A08G046_SDHI0_IXRSTAXIS	46
> +#define R9A08G046_SDHI1_IXRSTAXIM	47
> +#define R9A08G046_SDHI1_IXRSTAXIS	48
> +#define R9A08G046_SDHI2_IXRSTAXIM	49
> +#define R9A08G046_SDHI2_IXRSTAXIS	50
> +#define R9A08G046_GE3D_RESETN		51
> +#define R9A08G046_GE3D_AXI_RESETN	52
> +#define R9A08G046_GE3D_ACE_RESETN	53
> +#define R9A08G046_ISU_ARESETN		54
> +#define R9A08G046_ISU_PRESETN		55
> +#define R9A08G046_H264_X_RESET_VCP	56
> +#define R9A08G046_H264_CP_PRESET_P	57
> +#define R9A08G046_CRU_CMN_RSTB		58
> +#define R9A08G046_CRU_PRESETN		59
> +#define R9A08G046_CRU_ARESETN		60
> +#define R9A08G046_MIPI_DSI_CMN_RSTB	61
> +#define R9A08G046_MIPI_DSI_ARESET_N	62
> +#define R9A08G046_MIPI_DSI_PRESET_N	63
> +#define R9A08G046_LCDC_RESET_N		64
> +#define R9A08G046_SSI0_RST_M2_REG	65
> +#define R9A08G046_SSI1_RST_M2_REG	66
> +#define R9A08G046_SSI2_RST_M2_REG	67
> +#define R9A08G046_SSI3_RST_M2_REG	68
> +#define R9A08G046_USB_U2H0_HRESETN	69
> +#define R9A08G046_USB_U2H1_HRESETN	70
> +#define R9A08G046_USB_U2P0_EXL_SYSRST	71
> +#define R9A08G046_USB_PRESETN		72
> +#define R9A08G046_USB_U2P1_EXL_SYSRST	73
> +#define R9A08G046_ETH0_ARESET_N		74
> +#define R9A08G046_ETH1_ARESET_N		75
> +#define R9A08G046_I2C0_MRST		76
> +#define R9A08G046_I2C1_MRST		77
> +#define R9A08G046_I2C2_MRST		78
> +#define R9A08G046_I2C3_MRST		79
> +#define R9A08G046_SCIF0_RST_SYSTEM_N	80
> +#define R9A08G046_SCIF1_RST_SYSTEM_N	81
> +#define R9A08G046_SCIF2_RST_SYSTEM_N	82
> +#define R9A08G046_SCIF3_RST_SYSTEM_N	83
> +#define R9A08G046_SCIF4_RST_SYSTEM_N	84
> +#define R9A08G046_SCIF5_RST_SYSTEM_N	85
> +#define R9A08G046_RSPI0_PRESETN		86
> +#define R9A08G046_RSPI1_PRESETN		87
> +#define R9A08G046_RSPI2_PRESETN		88
> +#define R9A08G046_RSPI0_TRESETN		89
> +#define R9A08G046_RSPI1_TRESETN		90
> +#define R9A08G046_RSPI2_TRESETN		91
> +#define R9A08G046_CANFD_RSTP_N		92
> +#define R9A08G046_CANFD_RSTC_N		93
> +#define R9A08G046_GPIO_RSTN		94
> +#define R9A08G046_GPIO_PORT_RESETN	95
> +#define R9A08G046_GPIO_SPARE_RESETN	96
> +#define R9A08G046_ADC0_PRESETN		97
> +#define R9A08G046_ADC0_ADRST_N		98
> +#define R9A08G046_ADC1_PRESETN		99
> +#define R9A08G046_ADC1_ADRST_N		100
> +#define R9A08G046_TSU_PRESETN		101
> +#define R9A08G046_PDM_PRESETN		102
> +#define R9A08G046_PCI_ARESETN		103
> +#define R9A08G046_SPDIF_RST		104
> +#define R9A08G046_I3C_TRESETN		105
> +#define R9A08G046_I3C_PRESETN		106
> +#define R9A08G046_VBAT_BRESETN		107
> +#define R9A08G046_RSCI0_PRESETN		108
> +#define R9A08G046_RSCI1_PRESETN		109
> +#define R9A08G046_RSCI2_PRESETN		110
> +#define R9A08G046_RSCI3_PRESETN		111
> +#define R9A08G046_RSCI0_TRESETN		112
> +#define R9A08G046_RSCI1_TRESETN		113
> +#define R9A08G046_RSCI2_TRESETN		114
> +#define R9A08G046_RSCI3_TRESETN		115
> +#define R9A08G046_LVDS_RESET_N		116
> +
> +#endif /* __DT_BINDINGS_CLOCK_R9A08G046_CPG_H__ */
> --
> 2.43.0


