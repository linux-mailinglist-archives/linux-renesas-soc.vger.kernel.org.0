Return-Path: <linux-renesas-soc+bounces-31493-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8KbzMxOa6GlNNQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31493-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 11:51:15 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC44444459
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 11:51:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CB633307037A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 09:43:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EC653B8BD7;
	Wed, 22 Apr 2026 09:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="PmxvqzqG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010066.outbound.protection.outlook.com [52.101.229.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E2B3BFE52;
	Wed, 22 Apr 2026 09:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776851003; cv=fail; b=GDpbXkeoKzM+eWcOFoOxlhyDT9LCCAFvBINkhjlU5uvwqQa+ZVmFtp47Km2Wn4vh6R5ziq71hw7bjbHH1xYOAOmeZfkO05yaq0YC2UQ2yMATL1Xt0a8/8SPWxstfdi+5onxiX9lUcZtsrIDeTXLOns07pvkz5N+dsH5AB0cxCgU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776851003; c=relaxed/simple;
	bh=lFfp7N4t3f5zg/bm7fmS8+4dyjSTbXnSanVuvIg103Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mbw3LtX6wsJDZv9ZgCgHz5r0Xs1PzWl4/w/08tiHxj+8XuqWrTz4g9ZQNc7/n7moxpVX/2krXYIMGwAIPmPsUrl8ms/NiH873xQsVFHPo7pfLflGlps1XMix1OmHUcALQk6Jo+kgtZPHlszdO6GGsgGWUBsxQI+RDeAZ+TA/bR0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=PmxvqzqG; arc=fail smtp.client-ip=52.101.229.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=immxcXJKKXYg/8yPvp/aYxpqlgUIhLVSStcPW6ynVEN36exE2uRB1n0aT0NuOdKKZleMWDj4XJ+565VmbsrsAqxR6CjjyZ9Rdxo/E4rRtQ3c9zXwvoLkyDJdbYPVq6MN6weKvMmKLLEl1/ZCCC2nNEXPujeQv9TlE3acKWfyKsjusQfLkHv+LUOYNr05JVtEz6QrM01Y782Q7F/tcn5OtaxO5Yli81SkL8aszY5SpUxZ+XmkFpjV+lDzFfUd+Vk4UsBFwZ8kY+D9G+sNmChVB/fh4+EN7E082hsfKEzWxSRN+hn+/PJX9Zvp+nFYS3rWfrbGCj4FwVf/2efh7AiL3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+r+M31hsYS4ZKDN++I12EJ3K3xVb457izf7zsr6o1ac=;
 b=IkPaviDYt5miSlSwTtE9n5/qB5ePFU0agnY91RaY4utqo3tpk9HLODEKJBQGUzzLmyuTtldaRyMBN+Jp+YUgrax9TEdFW8VJ0QDJeoq5m3tKxP6zrLFISgejCVMTQzo1t8hIOO04qOTBxsltsawD2jyKCZTBKKYSbK2xb6xR/PzMvvk3+Dj1dsgncx045sudzysTx8VOGqzK6pWU9xPzKS1CbYmemRAhIRRgT4PCOqzvaUHxIQXgO4wZIweDK09tdBWo3Jre3PwwYq7gPKHmWvThmA+rkxpVW8j2+cwnay5Y71FOc+AC7IcYBThW8SA8rBPJ9N3gEFPLY6PmYiXAAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+r+M31hsYS4ZKDN++I12EJ3K3xVb457izf7zsr6o1ac=;
 b=PmxvqzqGhW6caPOtxUnfmyY/11qAZ9N4sC15cb8f9aSxSYH7C8kgwyATlDrEQSnFwwtxuzO1YGB+Wg5Rd7dQdc8avQelmqeYmR4rwb5t2IJb7Spiej+slznYemuWYONCuooD26lEV7BrXpIjCtfnv9ARUXBZQojzcBTb3Gq2OY8=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB11225.jpnprd01.prod.outlook.com (2603:1096:400:3c1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.17; Wed, 22 Apr
 2026 09:43:17 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9846.016; Wed, 22 Apr 2026
 09:43:17 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: kernel test robot <lkp@intel.com>, biju.das.au <biju.das.au@gmail.com>,
	Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	laurent.pinchart <laurent.pinchart@ideasonboard.com>, Jonas Karlman
	<jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] drm/bridge: ite-it6263: Add basic resume support
Thread-Topic: [PATCH] drm/bridge: ite-it6263: Add basic resume support
Thread-Index: AQHczMyZQlW0fW58u0OZPuZRZOfKtLXq3ayAgAAA6pA=
Date: Wed, 22 Apr 2026 09:43:17 +0000
Message-ID:
 <TY3PR01MB113462F86AB4C0EB2AF8BE39E862D2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260415113954.179006-1-biju.das.jz@bp.renesas.com>
 <202604221736.zHLIEw3V-lkp@intel.com>
In-Reply-To: <202604221736.zHLIEw3V-lkp@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB11225:EE_
x-ms-office365-filtering-correlation-id: 0d1c51d7-ebf3-412f-6293-08dea05394b3
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020|22082099003|18002099003|56012099003|38070700021;
x-microsoft-antispam-message-info:
 Uu7mkL/wDTPkRDz5l6AXM+XuaVcqBVIiuIgWkCpCCJgQ3xwjDTSLvoAY2lIw6Pr96tKme9/mMxuuAiYXIi3lff4WHK/YZ2ZNE8AnBH4NN/Qh3VBJiRmnWJTlw44IyfJQSTe9QTeUiuzszD81flKe2P/w+nuqr1I9ToavqfFxm1B3pI2DJiUCoUloNcgImrYhRR4mI3qd4juqERghUuTNgv8rO0xTRrlGRg8nC8PnZOk07tR1+v4yDdcxQyjZdAEkAhP+M7cES03eZ9vRZiH+WBovxZQKYUaVs+O3g8ILnRaUAk4PHJWxRQpaKw0tbuGTzS9OQtoRvd2pQLIlSe5rBCPn0E+rQ8zqtMNgWc934evR6i0y4gd5U17lgrQaLLgcdQXEltgQm/BZBKwYT26GRx8U5NAsIU3jGt17kxNCh9rxP9HsxBHWwOMiVhjTvhHi7kVX9bjaXbfoWyzPxUzCQqFC338Sol+bdI4MZI3yBvg9GJiIpcXaolKtykXfwuem37Oam/HyyZpr5hHRorRVEWrtDVBS59Gfcd1qYm+NaXbM77GoT0jW2psytaP6JBJ2foP+dXRD8uVfGWRAlj1pmgKLp9a+3PE9JieamX/DRy7Qrle54As1+O1V8fZssW0614PnM+Zh+WFTUeDuEY6qLdr8oCOUvz/RRrBzi5O1OVHzcukgLVVpHBim2FzdrdQQyo03rttaV9h12WMRfLozjBDNjc5P3j8suhOcUFnSDKFJdRpXzTXhc2OvGK2H5bmtv+Q++5NOWouSnU0MCFEeXw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020)(22082099003)(18002099003)(56012099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?KJuJ77j7p9mkoZnxHpksECZ6D6ZfDrHPTCuUhEU3+pcOr+i/DX5o8pok7wAc?=
 =?us-ascii?Q?gkq3bX8mdCCDh3/SrBw0EgkI3ipKOZXRJ3OuUxt7iXRk+P/2tadVctaSzTfe?=
 =?us-ascii?Q?r9o/gdIUyyYRIwjFMIRVeeljsSWjp6ymIfZGWcBCdjuolAoKyocHhfpxF34t?=
 =?us-ascii?Q?o3blZnnvAIPP/Nmk4fFO9FTVwaTWenUhiLH3Tv831O98zQ9WRS2w1iKRTlp8?=
 =?us-ascii?Q?LT87MJ8YutXxb9iPuenaZbPY4nZqnE46RsDDjq6umlUpdQ0MF2ywYC6iOHOV?=
 =?us-ascii?Q?cMEI0qOHWOOov9DnaQx9bfoG+J8QChdO3Kli3Klc5BtB/VkqzyTtXf0N4HzR?=
 =?us-ascii?Q?yCCmb7Lh9gsDKF3lyUHRjEOfVhxCDSd264nrkdIqMYCntp0A99FZC7kzeF+6?=
 =?us-ascii?Q?sgnnV4zFkbJJoucijvgXkZBXJ7gqlMYSvft3BlVQoGy8ZHPeRQCspnT1T0+z?=
 =?us-ascii?Q?67Zo+XKh8c/2Hi71ns4Y3xPEH5dGZ/GXeAduTLpjeLjCsHJJcXTcf3SmX+Oh?=
 =?us-ascii?Q?PTcjJgjSvuhGFoRUF3Tws5ZaNtqDy5I2VpTflP0oqRrPU+ItZRH5aX3JzPJW?=
 =?us-ascii?Q?ngPq5N6S0e5aaL8paRfshsxU9BWyNwBVQA1WJG61CDqmPr+DIU8vIbvRfeOw?=
 =?us-ascii?Q?PCjMBur6PhvAkLgJ3wBJPuZKZvr2p1yiGll8nuKV81/7fEa4FYUeP43aSsen?=
 =?us-ascii?Q?LvzAnM4pTdgk4PtyHGLhQ6t+L3+PjqrxLRhUi/CFW98dgCbCT204Sbe7r4Og?=
 =?us-ascii?Q?oiK5+4NaNQo09fBkD49WEOCJVKj63ONnjJRf8dhQrqjb+S7osCU8aHS0l7sE?=
 =?us-ascii?Q?frjuXcCD2P25etVXSRAkle+WoznDGXJZazNXcS0Y5uEHt6zfKuI6UmyrcQmE?=
 =?us-ascii?Q?EDjOOIOiAtYtIrshNsDk1MmQgmCy+uRJhocAVFROzSSYqwVja0FkhG5N/StH?=
 =?us-ascii?Q?k8JTg7355/IGNcy35r4tfIOYGOKCftI89jA7csCAeRdppiJsPdta+JSIe0Ny?=
 =?us-ascii?Q?oXxwFkDqc+d6dFhxTkkQnONvTt7lYbEvyBMpZt6hi5zujXLb0dTmxmY5uh+8?=
 =?us-ascii?Q?KcBOMl/nO+LDG3RFpReN0NPw7XWX2X29OFK6dfHz6xwb42pOFUUatPe1Vlv5?=
 =?us-ascii?Q?1+2CAD9i9wjLuqeVFbYxwKTdLRwvzhIoWbedwy8PVnDUMtFo+KjddAxGjzaT?=
 =?us-ascii?Q?9tMWIkA/Xugoq3jAIWj8xTYRCHK9DrpDemor9OxSEVPGaHzVA782mPU+xU1U?=
 =?us-ascii?Q?rU+3XFEvfLgGoHo4k/NLd07V0NRaocywjXb5eVGEVEN5RIfS1bhsSoxxOhAP?=
 =?us-ascii?Q?+E39moJrt/OWdpyX9vmdOO56sjhGvq3a9Ozlkd2M/Ymb1U7AtGULgddtxZrS?=
 =?us-ascii?Q?UH/8GrOjPo4hScSPT53fB8aR30pJKz2gvTQ9UNDpRnpPlanT5f/4wHvApDJd?=
 =?us-ascii?Q?GwLKS4c1nfKRxx0P+nzp4WTCGGmfufFpu83qn7DX+cFF4MwEUeokMnZq2mU8?=
 =?us-ascii?Q?gWbdLC1G8SREm9PohpZGx/NKKe0qAiZJoz45PQsKBfEzAfej1/FGWcstey+m?=
 =?us-ascii?Q?ID50CC00A9XI8H41AmQ9tj75m92VMnj5x0XI9OW0I0gH9VSIp7iEGE98Oa5o?=
 =?us-ascii?Q?OEemElegLPyP1iAluiDs0Cq8l0EorXFQqjVlYq8lWSD1RouLx0XBAJnJgH4F?=
 =?us-ascii?Q?TLbSYoTV4+06CRTE3/pOpFbvXwpmurvy0GnU8FuBcurv0B4G+cpiMYJCosOZ?=
 =?us-ascii?Q?1HVJpBbnWw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d1c51d7-ebf3-412f-6293-08dea05394b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2026 09:43:17.0523
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Jv7nK/A8LGJWpwqGgWDag0NGynU8XFWU4nTtBvYjO2iQQ3w9D76AMlZelWZUZa4YBTcBO8WtlgZD1gFUec98hYbeXx5nZgN0h1G8xRvgRl0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11225
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31493-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[intel.com,gmail.com,nxp.com,linaro.org,kernel.org,linux.intel.com,suse.de,ffwll.ch];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,ideasonboard.com,kwiboo.se,gmail.com,lists.freedesktop.org,vger.kernel.org,glider.be,bp.renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url,intel.com:email,git-scm.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,gitlab.freedesktop.org:url,bp.renesas.com:dkim,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Queue-Id: 2EC44444459
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi kernel test robot,

> -----Original Message-----
> From: kernel test robot <lkp@intel.com>
> Sent: 22 April 2026 10:37
> Subject: Re: [PATCH] drm/bridge: ite-it6263: Add basic resume support
>=20
> Hi Biju,
>=20
> kernel test robot noticed the following build warnings:
>=20
> [auto build test WARNING on drm-misc/drm-misc-next] [also build test WARN=
ING on linus/master v7.0 next-
> 20260421] [If your patch is applied to the wrong git tree, kindly drop us=
 a note.
> And when submitting patch, we suggest to use '--base' as documented in ht=
tps://git-scm.com/docs/git-
> format-patch#_base_tree_information]
>=20
> url:    https://github.com/intel-lab-lkp/linux/commits/Biju/drm-bridge-it=
e-it6263-Add-basic-resume-
> support/20260421-073706
> base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
> patch link:    https://lore.kernel.org/r/20260415113954.179006-1-biju.das=
.jz%40bp.renesas.com
> patch subject: [PATCH] drm/bridge: ite-it6263: Add basic resume support
> config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/202604=
22/202604221736.zHLIEw3V-
> lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 15.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-
> ci/archive/20260422/202604221736.zHLIEw3V-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of the same patch/commit),
> kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes:
> | https://lore.kernel.org/oe-kbuild-all/202604221736.zHLIEw3V-lkp@intel.
> | com/
>=20
> All warnings (new ones prefixed by >>):
>=20
> >> drivers/gpu/drm/bridge/ite-it6263.c:909:12: warning: 'it6263_resume'
> >> defined but not used [-Wunused-function]
>      909 | static int it6263_resume(struct device *dev)
>          |            ^~~~~~~~~~~~~


This patch is now superseded [1]

[1] https://lore.kernel.org/all/20260421105334.43411-1-biju.das.jz@bp.renes=
as.com/

Cheers,
Biju

