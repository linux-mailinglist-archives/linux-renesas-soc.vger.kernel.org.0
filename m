Return-Path: <linux-renesas-soc+bounces-29845-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IK3yFx9au2lfjAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29845-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 03:06:23 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 335BD2C4BBD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 03:06:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D893A302FE55
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 02:06:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ACA03803CD;
	Thu, 19 Mar 2026 02:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="p5xaKRIS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011020.outbound.protection.outlook.com [40.107.74.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18282199931;
	Thu, 19 Mar 2026 02:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773885965; cv=fail; b=XxiEK8rREPbt1LuwreaATBY9c6i33UtVjfLbSTn/UTsmnQNj/YV8A7c2KdaWG7xewsnKs5eOkhbDicOW/soJCwZeJPdvV5MGoZOPbbVztL5Q43wY6/ISrXizPa4BBT5YGyVBRYLNRCnKbbrjpSK/hikWChGX7FrGpDV47KtdrlE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773885965; c=relaxed/simple;
	bh=s5aIuxGneAa5rF1I2x6CAK6H06ncuuvdBAFzB7Udjo0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uR7CSViG5OjLPJhLMLxBP+s/01ZwVER5mH5c/QEnzsne7uC8EvLevvsGozRVuoZsoy++7xpCWWqo4dNvyogfJ91ce07qG33tczyQRhWCWhiMnLMg8aRJwpUMMa9L2O6UJZv2rVGa2fdFx8kMKF+gL5kWI5MFOscihekdbTwZlT8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=p5xaKRIS; arc=fail smtp.client-ip=40.107.74.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b7Ikt/ufDNjPnWG9BTqDlu5neupIlkR54KCOCbTRKoODbKoR/leR4VZdS4EhK9cLNy4mMgFhXOEcqQfDFYZgXy8bJc9Zl03PYUfsM7g/OrNb9uymjcgdfn2QorxNb01EUdzexz85vD1XgMqnYLku8TGB+7mJfqlwkb1SKeIaKoUCzQOeMLb8vZnr++wAdrp7XwPIJizNxgEU+p6sgxkaV4gw4qSOkUXjdVJZ4K4AHMchpWr5WAMoy9fYky9W6Kn6qncVOrwDUxdlJVFhLzF2mq0vObNmn/y1KX1//R8A13RJ9eMsjqhlEuFXS0JTGAm60PXjF8cTSRE8E95V0/YMkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s5aIuxGneAa5rF1I2x6CAK6H06ncuuvdBAFzB7Udjo0=;
 b=SWJCy1oZkssDn6g9RQRRb+PGipgdk4CNQsqV9gtro8noce9oXczRJq/5JWXjs1mUEg4yANPC6tu1cSIUCcuiU+0ynV6AG6IjSUFX1HQ0wsb9W2BuPbfrWbcKTW+rEJp8U8OJNRsaSz0DUK2GYRmCwLHHPhmY1H6UNDnU+nl9XeDUV/l9svNau07X3646CdUfJtlWHUKmBW/m6RnSg2n3+w//aMIoVF6dJqpi51/iSjvNXnlrXNXDn1bgT1RlVJVNy4F3zh3+lkxe+l/YO9owKHb6It9LHdZ69ZH2Qc1F4mYjqY0qpZBY+j17TIaGTkCWRzXtRVaqgj2uOiGVVvsaKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s5aIuxGneAa5rF1I2x6CAK6H06ncuuvdBAFzB7Udjo0=;
 b=p5xaKRIS0psmrkfGwUEvPW0TwsV/iUJOK7ydftAnFzw7cDfWcY+ejOQ/Sbackpe6db0lJp0B8JjBjxZZVOPQRhuAEuPBhMRgyQHhguzfX5FuAa7ofS9MyEw4Cn+47CS2qkgX7YFHGebiqQcVpb8l455Eb4gHu+7Pidn1vjNat2c=
Received: from TYWPR01MB11935.jpnprd01.prod.outlook.com (2603:1096:400:403::9)
 by TYCPR01MB10229.jpnprd01.prod.outlook.com (2603:1096:400:1ee::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 02:05:57 +0000
Received: from TYWPR01MB11935.jpnprd01.prod.outlook.com
 ([fe80::dc30:6b24:b7ba:d429]) by TYWPR01MB11935.jpnprd01.prod.outlook.com
 ([fe80::dc30:6b24:b7ba:d429%4]) with mapi id 15.20.9723.018; Thu, 19 Mar 2026
 02:05:57 +0000
From: Dawei Liu <dawei.liu.jy@renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "linux@roeck-us.net" <linux@roeck-us.net>, "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "corbet@lwn.net" <corbet@lwn.net>,
	"skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
	"geert+renesas@glider.be" <geert+renesas@glider.be>, magnus.damm
	<magnus.damm@gmail.com>, Grant Peltier <grant.peltier.jg@renesas.com>, Linda
 Xin <linda.xin.jg@renesas.com>, "tabreztalks@gmail.com"
	<tabreztalks@gmail.com>
Subject: RE: [PATCH v2 3/3] dt-bindings: hwmon: isl68137: Add compatible
 strings for RAA228942 and RAA228943
Thread-Topic: [PATCH v2 3/3] dt-bindings: hwmon: isl68137: Add compatible
 strings for RAA228942 and RAA228943
Thread-Index: AQHctn204ex+FeF5rEmz/2sFsNGYCbWzxvhggAAtJwCAASQvEA==
Date: Thu, 19 Mar 2026 02:05:57 +0000
Message-ID:
 <TYWPR01MB1193530289B4CD8F3853D7887D54FA@TYWPR01MB11935.jpnprd01.prod.outlook.com>
References: <20260316053541.3903-1-dawei.liu.jy@renesas.com>
 <20260318021921.75-1-dawei.liu.jy@renesas.com>
 <20260318021921.75-4-dawei.liu.jy@renesas.com>
 <TYWPR01MB11935C44C0ACE3F319FC2ABC8D54EA@TYWPR01MB11935.jpnprd01.prod.outlook.com>
 <20260318-neon-blazing-swallow-f7b60a@quoll>
In-Reply-To: <20260318-neon-blazing-swallow-f7b60a@quoll>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYWPR01MB11935:EE_|TYCPR01MB10229:EE_
x-ms-office365-filtering-correlation-id: 090382f7-5ab1-4b88-b3d3-08de855c0f35
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 S2t/GMsCIaeynGfdOJQlJMEE8ZQs3sMA/uEL6bYCYe1amBdr0qiCIyvTpa9fqDQPTeNiCGAJCzG5/ZfPGKDasjE41lnht7zhY7nn33tOafQky+2ng6ZycY7LMxjUmDgXSqlgnLcfYq060RcKUcZcNoxB8QZea+K9PXmNM1zu9bjkwZe/bOr1OnGBYiVRRQSTq0HrKUW8mCk3JTjVNp1WCdI/1P2sxuxh/F2Wg4a2qXFzaDm+YAthqNIIR/c+qj+klhRIp0upzdDZA8M+QGEhINpjsHE5wPydSRWZ1YI7pb1J4gmnqhw88xmvw3CpbgmscpjR3th1ro+E51sxQAXWX8Dc6VhPRYCtLq4ATxuykrTwdkUgx8M537dwouO0E2pGybB/mBM36j6IuHqEPFVUMsFObuJvQQPphql5QYsoKMHeBjfXEO4YX+SlbCMhUee1UpnRY/nMiYli2o8+db5OykwjnlM5SZ5SXah88I9kbwTfsY+EyusH5IdPT46jZd5QuAQPuLMzFdKg/9/ewOdvJqLvYO4OBSaiEmdCeVV63zqo8VUXM5BjbHkFgS8LxabGZThsk0iLDmZQbmHKzSLrQAC539dVfw+YihBCeV6ZASyUKAU+EOCcHy25umrwVjv+zotqsNzeLQNY2afT6kj+JXA3qaXlACHuq8jVppxKiVpnV6G6HthrD1twVZR1DTCAKu9TTX9Zvt08skRpuiQF7K5hahgKwX+mjoEFuzvUEssMtqM2Uu8Lt+7UXzsEJO8Wr5Ph5wMkN8knDVI5mI0MiYUAKPP/iZAQ7eyhKOqtTRU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB11935.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?zUK3Xqf4yys9DUneeVD7h8v47iWujg60xkuepf0xWKW4yA+YJeTk4GJf/HVy?=
 =?us-ascii?Q?S4hVo6Nz2aLy9cA60lFpWQup+GyNjMKeVkNLvYoQOYOYkBHGjBKyxt5/52+0?=
 =?us-ascii?Q?N318Wbssb5KVE8u9/NYll8kW47Z/G9JmDuYbOq1mvniO1RmBxQKAnIB1n3ab?=
 =?us-ascii?Q?HlD9ouu0oqNswjs+9KxQiqPrxqdDbXvftDqVxx6j96NTOS9ecCzl/0ROm0rb?=
 =?us-ascii?Q?tKdBxr142UNWmktTTEwcf/mF3bXiPkVatGlfbcKgwj8D1FsO8ZfeFLRakP/H?=
 =?us-ascii?Q?tcaZa49j8z4t60binrhb9+bH3IYVx9wgGLH2pa4RvJa7YX6Sa8tg1dxO1lxD?=
 =?us-ascii?Q?dPErMhSdNtxeF2fnIEGAeKLBlwWhj4itCb+oIJB/7Ej9oYucnfn/pCzG5LjH?=
 =?us-ascii?Q?tgSAGohkDqdH/fyLZQ6vw3l9waXBL8+AXHXkNB+0Z7LhFJjYW0npBHBvFPFg?=
 =?us-ascii?Q?55MV2kXjv/TzTyQy2khpD4kP9OettHTHSNtTehj5abZOMchrdB6tpTGYSO0p?=
 =?us-ascii?Q?hFZmBfQqVksOiLrVYjyfxFqYvYR3lcc+MJdJwNCSI4IHgvEUHiodyh4kwgMS?=
 =?us-ascii?Q?5uCoOeMm9MAD2x28ZArnWBs/37fWOVWNhR+2Qzms6IqUM4aZlRnmXt04nc1v?=
 =?us-ascii?Q?M7LIdQ8sNZV7m2HA6Ya5IIbH+jN7cUqy+kM9hnjLWhQQchFcWRSQfvk7FSka?=
 =?us-ascii?Q?n1n8FWLo9jI/zaaRyWxLqL/WkUnNnQZHzK8vnmRNUBTBI2SiuI2lcK0ZJPPS?=
 =?us-ascii?Q?rd6gYEIicEZ+FeBGjb+9x1uJB6PiMA3aHwdhSsJyZQB7CRNyByLvYEgiKFFe?=
 =?us-ascii?Q?i39dCCymIHPE40DlE72jVIBV7DstTInwdANRyLvTwNFdyol0/iZrmQgWUhAj?=
 =?us-ascii?Q?kB83Nt3WZQXV6o3OJSe2Yzqz5Pmf6twW92L6extR0m9NXq3zy5jbr8pHrK6c?=
 =?us-ascii?Q?7Cs930ysPuHGJ7fHNA8JO70YyeytyppMxvyI85MDm2P+KU2GC5eV534O8yVk?=
 =?us-ascii?Q?XHfsFYPcCLlHPMeB2QjSaHWedj3U3aQTP0EuYpN21/iBVz6lCx95aWMDqlZP?=
 =?us-ascii?Q?03jS6WiJbuflkcUlsCkJeOp4JWXdX+Zcc9trIO3eQwgGWE5lBSQ5EF1Nuyvv?=
 =?us-ascii?Q?MsfwTb97ghsF/tFfUcUVi5Qgwk7TR0kFAo8uebpAIFnGEx9r5qMFLBAyH2NQ?=
 =?us-ascii?Q?kDTh04WPzCsEvVYSfp9F+9TEOA0FSowvsbrilHgeRvIFPE7XWhDURY5VnuS6?=
 =?us-ascii?Q?hYh7IjUfBYUx6VYz1nmQnPZueqvsvoICpmONy2oExm4Xgny2iwiB65bqjGln?=
 =?us-ascii?Q?l0t9ldDPWqowkblaLpQorEdbBDUAzz0Q0/5JX5Q+ip+047XR22sBDVBFyEj0?=
 =?us-ascii?Q?Gv7Ft7hCKraMWqa47c1RR1MHrE8TdVce1Eeo5UUSkzG7zQKbcOuw4sI3pWDt?=
 =?us-ascii?Q?QuayUik9olXHiihBuioc14tuDOeIdfPDqd2ELVwuTLV7K4CfXAhTJWLWzlYj?=
 =?us-ascii?Q?TPOVIvcdvJQ+si5qxTUReuHtsozMXdgDSUiRS86sMIJlWuyuUHqF0lFu84Pq?=
 =?us-ascii?Q?oykchpofMy03/EVzUiQfa2BHZlBRTVZuz7kDN5YGyDaT/v2k2FNtltL4tGzS?=
 =?us-ascii?Q?V5AYRLuKFYU/6349ss/y/8rv+XmvpOVMTOfx8WapCaBEr/0AM6c1d/U2qQY3?=
 =?us-ascii?Q?MU7fsldQOQXmSkFRD1dYx5TF/ux2nJN5FtIFcaMAgdoGizY5FGFNvcJ0hxeb?=
 =?us-ascii?Q?FA3Rp1QRAQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB11935.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 090382f7-5ab1-4b88-b3d3-08de855c0f35
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2026 02:05:57.1310
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 38vjvSqQZA//i32tDA+Eic1vguGhMCMNQkEIBEZwxPZyKI5XrVRuvkLutIELUL4TC4ShKQoMyfAw0FPqEh4cGNcPK1fX0Uh/+JTbGKnT1ko=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10229
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[roeck-us.net,vger.kernel.org,kernel.org,lwn.net,linuxfoundation.org,glider.be,gmail.com,renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29845-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[renesas.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dawei.liu.jy@renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-0.950];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 335BD2C4BBD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> Why do you ping few hours after sending a patch? No, I will not Ack
> it because I have bunch of other patches to do and pinging after few
> hours makes a very bad impression. I have two weeks to respond to
> your patch.
>
> Considering that recently some Renesas contributors did not review
> patches still on the list but sent a fix to them, I find your request
> even less appropriate. Start reviewing patches on the list.
> (above is of course not a request to Renesas maintainers)

Hi Krzysztof,

Really sorry for the early ping and top posting. This is my first
time to submit kernel patch and I did not fully follow the submission
rules. Will be more patient next time and will try to review other=20
patches on the list.

Best regards,
Dawei Liu

