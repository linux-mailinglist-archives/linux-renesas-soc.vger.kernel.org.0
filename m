Return-Path: <linux-renesas-soc+bounces-32361-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yG3IH0+lAWpKhAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32361-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 11:45:51 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAC750B35F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 11:45:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7C8C73037DFE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 09:18:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72C483B6BF1;
	Mon, 11 May 2026 09:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Ws9WGaHU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010024.outbound.protection.outlook.com [52.101.229.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850B33A8740;
	Mon, 11 May 2026 09:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778491127; cv=fail; b=Rl8MgSL3JfCMGxyf+h0xTYfBnWovLy3T5mwcKRc5pDNifY/70LvE3oeOEHnpHuOa5XrYHEyLBobCtzXcCbkHi6cceJca20iBnnDSP/sJCAsg0arkLn7VxeQ+6DOWvuTB9lU1AceevEhU0WaJN9+ib0OjVLKTsl+JBeGQnTUTwDY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778491127; c=relaxed/simple;
	bh=Qk5p33frN5rTfezV1tVwepTJ1S5fO3enCMURETiH+mU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qMBiGOJ3c9/9990Xm2F2d2jGrWLVYUyYjeI8njcrddCc7GrrEYZ9sEXqD+8+MLepgkiKXw3kfYU2cvJlSJC0ISltyiIIbdUWs3VboK4xhqK9tatLa/8z1pLpDNS7kHFW2JoRm2I/46XO+U+IHNR8Z+DYIM539FNHB18agiUAApU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Ws9WGaHU; arc=fail smtp.client-ip=52.101.229.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W5i3fqNosplEI9oSr+YTQNuejM57h7pQ3nImW0bO6FX1s2UWG2sA36owVT1IEEdgC73zAu++YhT+F099IERJzd0w70Bv7vSAdBpudMtgEbpdplyenhXwVR8d/gC73VZUMDv/tIs0hKlYowIUrrhqgvz1qYhSWH7MaFcSYZ0cfntcKWIuxbH+WvimEJgpn0EZBVlVIii1JTdmBqq06Dlx0LoC7AMhJnintVT0e1ZNtLUHFllJN4Q6fKTOBN5EQRotRPZTTk+E2NcRaKtDbge3oDlEfvv3aqMSMyENLG+IUJGZnPyFcrG7PDkwu/lMgQXGBpCPbrO4YscKitSKtd+BOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RFvmUIS7cix/rNK34J6hP6QoVDq95wTfA5vVeuBNOss=;
 b=YOj/0+ByvwLpqeMqyOQTBU+J76HnaWHgl7lXS/NWLPqjjVZ5lPter9PSNbxD3fWDsi6MbYPVaD4gOODKtLaZdvn4yZjIyzJ19TrpMiyJmq/8F8+pgk0gIULp8UuMdy8O21Nf+sMkRfux8+acTgIG65Fcyf7tCzMibM7U35/m+P5ZbBOPMXEuzUaqpRtKUEPgWoKk8NfPWKQPng5XhAhZ2YbURFSuiZZ2H3q1OozHzYAXik0aeVvHZgrWElNSQkF1BBw1stKKvD9L0YLPyJw3BfURCIUMZve++zmEuxmuzK0hjhavPdu9bQnXWFfN/zvPHStT5pbIUHlCt1sdG6aMCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RFvmUIS7cix/rNK34J6hP6QoVDq95wTfA5vVeuBNOss=;
 b=Ws9WGaHUhkfGFpDucKJNyRcFKYRRPULfGyQsMbSS0+DS/h762hxC5Hyk+kiqhNrF6zXGhDxkCI2+OyqHtGZ7tVQwOnCEMIn1ns69fEFSOUORdo9cQFTAbcwSJV4CnmsYhjXJTMPUdXkGBcWqdXKGpOu8Z2uMRyt0Eg2jhgRsfPw=
Received: from TYRPR01MB14284.jpnprd01.prod.outlook.com (2603:1096:405:21b::6)
 by TY3PR01MB11243.jpnprd01.prod.outlook.com (2603:1096:400:3d7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Mon, 11 May
 2026 09:18:40 +0000
Received: from TYRPR01MB14284.jpnprd01.prod.outlook.com
 ([fe80::4fad:2240:4042:6338]) by TYRPR01MB14284.jpnprd01.prod.outlook.com
 ([fe80::4fad:2240:4042:6338%5]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 09:18:40 +0000
From: Michael Dege <michael.dege@renesas.com>
To: Paolo Abeni <pabeni@redhat.com>
CC: "paul@pbarker.dev" <paul@pbarker.dev>, niklas.soderlund
	<niklas.soderlund@ragnatech.se>, "kuba@kernel.org" <kuba@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"edumazet@google.com" <edumazet@google.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, "davem@davemloft.net"
	<davem@davemloft.net>
Subject: RE: [net-next,v3,12/13] net: renesas: rswitch: add handler for FDB
 notification
Thread-Topic: [net-next,v3,12/13] net: renesas: rswitch: add handler for FDB
 notification
Thread-Index: AQHcwqCaN2rRIQAij0SRnDy78eQ4NLYIyKMw
Date: Mon, 11 May 2026 09:18:40 +0000
Message-ID:
 <TYRPR01MB14284BB11B95A1F620034735B82382@TYRPR01MB14284.jpnprd01.prod.outlook.com>
References: <20260331-rswitch_add_vlans-v3-12-c37f41b1c556@renesas.com>
 <20260402125939.234488-1-pabeni@redhat.com>
In-Reply-To: <20260402125939.234488-1-pabeni@redhat.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYRPR01MB14284:EE_|TY3PR01MB11243:EE_
x-ms-office365-filtering-correlation-id: b5387eb8-f1b2-46b6-8b60-08deaf3e4a7f
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|18002099003|22082099003|38070700021|4133799003|56012099003;
x-microsoft-antispam-message-info:
 s15WQWQ0NKBcan8qBFA9EYQiWcpEwIyKrmCb7DVBvdoCuZsTnVqSg6xdT0NKapbpYHEmCUICd5TIqbgbfmJElN/vVbBBxM1qJiqwcvAOPOCyjvkpzx7DxTBkkieVUFcyZ4aIgZLsUGMiMgrC8XcA6yQL5OLyNL+hCUu0PBSNbN11Oao1IU0vX3dy0BeDotymYcGwvXJ0gEIt/39mgX2ZqcUOp9Vz6phYVfne8XvruRjIzSLFirXwTqSJNwbA84kJ51EaBEJF9Yemtdfj5Y4M0V+ZCF1ooYhR6azESXJ9dtj7OQ2GuXhWIUOFpGaIvloniDru8+R/PRAETee5osgl54GW1MZhWD0ouX0oUz98OIxxWz12ASpmOK4MjJ74JdPuyigq5PRoFwJtRY7qB6glbF3FOAXkwC4yCfmdYdNqFliaKrJC20yDhW4yxBAHxn7MlKhBo/fAXojH4O0c5tzezGkrsmgkzANBobTZ+qMaBtP8LPrbI/uVg0ZA77uf23W8SqPWRN/gok6yievWscEUK/2iATfhQ2AqQ2LA/5xxXqriYVJ104nw5ArWirA18y+lmPevUn2I/BXBAUpSsgubPFzlKU+N6ZCP8zwQmEZK4rj2/ZF4RU4ATKl53eHHdLd8B/qb8mBtIBDatEmflXxLlPGIG3jqpxhBDtCkqucWIfw90VkK1b+1t5OViEXv83qaRsCjU/UStf64rDbX+Ega4g==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB14284.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(18002099003)(22082099003)(38070700021)(4133799003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?LV8pqVYNATYzXROO7BOUrqk47lht4sgx1RPB1dmyAVDdXrLOcRWzFu4Cjk9v?=
 =?us-ascii?Q?Kfv2/wsLyPzbwWqEX7h55BKq5O83xtZjQHLvcNuaqYh+wKFmiLQzZvK8o4aE?=
 =?us-ascii?Q?qFvXweTjmZeU8tejrgi3TtM+DHfMxoX1OI0FQzWSlSj8EvCEUb1HVRsql8bP?=
 =?us-ascii?Q?FcYjvYmZPjfME9Cse3iB4g/68l/AmuA5b1lfXU8vKQAi4iBBIpxF4OPqVVCD?=
 =?us-ascii?Q?8eJdmkrR6785ABxFiFHF+Nvk1IHAK8s/6BSfmuTc+CpaMG36jPsWdBaxoYD9?=
 =?us-ascii?Q?k/US5a4TqUAD8TaIHXa7uAX6p54j1zfkGHmYwuh7b4oNc76LFf6SbbBUKJiI?=
 =?us-ascii?Q?/JYWavYVODmX8K/jwPFwOWobMt/BlBefmFjOBNO4NxzCJwa7Wjl7bUYFHs2N?=
 =?us-ascii?Q?l2nCGKOsfQhF3oyAY3zFmAJCcRax99+RVox8z/+g4yjj8s2vsID6VjB6bVZ9?=
 =?us-ascii?Q?OmF52QAGlt4yrkRSWDK28dT2NaRq8NItEyU4MGEQ0EPg/HVue6JvUmuEEloW?=
 =?us-ascii?Q?0HwvqOQs/iftczcKy2DdGsmB7ndV5lLxHbKs+HMdDR2XHvlzO0/K13kipbt4?=
 =?us-ascii?Q?MRoW0k1PkiBBlYanGDYfNeD30Yym3ENZx0QSzmINhL4nGRj/jVwQs/EbzF/g?=
 =?us-ascii?Q?ccOTsMn5p/xrY4h+X69N7mWZe0RKZF8Lv7r6HCBs2jGeb3yBdPLOGNyGUokt?=
 =?us-ascii?Q?Sbd24FTKhkrPiX9vsqRnb+PX2WSXDV+YRWzVMwbgk9npNCIcKm3wvMXyW41s?=
 =?us-ascii?Q?DKqD7jm+zh7KS+p+OsVDhQpzO5dCrosZhf77yLrmiJYjfFgT46METeJ/DFsa?=
 =?us-ascii?Q?V8KPc2zXcoi0Dx/qHVWxZXgRYErKKfjipiTKFVEX+V24Mq4/CUpLWxXqkhNq?=
 =?us-ascii?Q?uUmKVj8XylVqACOd3xGi0Irj6whjgZjNAWbjLLa159Ze/WxXxYPTV2jDPfja?=
 =?us-ascii?Q?tRn7JQDJlxG1znKU7PNiuGe+tej8fMhzsv2do48/v/EURHpp+LBzDojyXue7?=
 =?us-ascii?Q?nFHhxsywMZVgqPJSq1iFBlycP5raIyUxlOlgzw5PsNzPQ8MTc30qlQwiWRWu?=
 =?us-ascii?Q?l4V5VCW+lDvqJABv8BAjnaAFevAojUdOMIE+VDK3cw+JcNQi953l5t0TZSYw?=
 =?us-ascii?Q?1114NHXVAne5WJ1z6MRX9lL3dklLJdIfp9QDw9PYZYbfNcQdltIkUp0wPJ9Z?=
 =?us-ascii?Q?AhTbrqnhlPVCBfntLyGjZ5ptrzTPSE9ij9nV70Mt0/Edq9PofWzIUuaZOT8u?=
 =?us-ascii?Q?LHrmi5Vsds2qbqVkUEwPHb6whhDRwSq5qR4chVYUj9Pon+rcqFkN8dES0g29?=
 =?us-ascii?Q?TV5kSyfqimhKQSNBau9baKKxaX0aPHSXqJcxDWlCJUjoXIMZydyoWgWNMfm7?=
 =?us-ascii?Q?foKQbxQyGANZ9J0VNAUaFmOUmrm/5q7kg62SlIj87kqhGwoxtFyzilh9k4rX?=
 =?us-ascii?Q?SuvXmRrMxp4pQBpcbHfgHpVEvbAUSphpL5dnL//AE2Sg643CuvUqgD5Tm/Zz?=
 =?us-ascii?Q?i5eRyZTgeAQYx6aouhknFnShXx0K4KH1CuievO+5HwqXRGayZ8rksa9dRAVT?=
 =?us-ascii?Q?Tjp/YI5CvPgJGBnI8vmhAo0zEc8ZCWxg6AkApHOijoIYhlEIgaLKsuuYddfg?=
 =?us-ascii?Q?ZyzFeo/YKNbN4Z7DNeZNOeyC0CZFASJBAOqtpmkZCmEMoodMa0+6OmenTvGx?=
 =?us-ascii?Q?9Mil2lGyeh5C5EYux2BZVfBcIeiXi52A2SCvLZeZN4hP3rvCiuqA97vxWVoJ?=
 =?us-ascii?Q?OYdSOui3/Q=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB14284.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5387eb8-f1b2-46b6-8b60-08deaf3e4a7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2026 09:18:40.5432
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6+yNO8w0/bDnpFW2KQxvjAVtC6TBfliZ9CVz8Cs78BdBLc2QwZqpo5Y3fmkCthygpwo6pyn4iTxa5S2fiDziGJZijMC9xxwq3cX1ne/NF5g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11243
X-Rspamd-Queue-Id: DCAC750B35F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32361-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,renesas.com:dkim,lunn.ch:email,ragnatech.se:email,linux.dev:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,davemloft.net:email,pbarker.dev:email]
X-Rspamd-Action: no action

Hello Paolo,

Thank you for your comments.

> -----Original Message-----
> From: Paolo Abeni <pabeni@redhat.com>
> Sent: Thursday, April 2, 2026 3:00 PM
> To: Michael Dege <michael.dege@renesas.com>
> Cc: paul@pbarker.dev; niklas.soderlund <niklas.soderlund@ragnatech.se>; k=
uba@kernel.org; Yoshihiro
> Shimoda <yoshihiro.shimoda.uh@renesas.com>; netdev@vger.kernel.org; linux=
-kernel@vger.kernel.org;
> edumazet@google.com; pabeni@redhat.com; linux-renesas-soc@vger.kernel.org=
; andrew+netdev@lunn.ch;
> davem@davemloft.net
> Subject: Re: [net-next,v3,12/13] net: renesas: rswitch: add handler for F=
DB notification
>
> This is an AI-generated review of your patch. The human sending this emai=
l has considered the AI
> review valid, or at least plausible.
>
> For local reproduction steps see
> https://netdev-ai.bots.linux.dev/ai-
> local.html&data=3D05%7C02%7Cmichael.dege%40renesas.com%7C6a613b4020df4903=
a3c408de90b7ba4f%7C53d82571da19
> 47e49cb4625a166a4a2a%7C0%7C0%7C639107315963062459%7CUnknown%7CTWFpbGZsb3d=
8eyJFbXB0eU1hcGkiOnRydWUsIlYi
> OiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7=
C%7C&sdata=3DNSEhHV2iBtsRceQP2J
> ZppzzmHcbTZ%2FrvCbXxomHOUmQ%3D&reserved=3D0
> ---
> net: renesas: rswitch: add handler for FDB notification
>
> The SWITCHDEV_FDB_ADD_TO_DEVICE notification writes the bridge MAC addres=
s to the GWCA and adds a
> static rule to the MAC table. The SWITCHDEV_FDB_DEL_TO_DEVICE removes the=
 static rule from the MAC
> table.
>
> > diff --git a/drivers/net/ethernet/renesas/rswitch.h
> > b/drivers/net/ethernet/renesas/rswitch.h
> > index 6dfc53c6b985..443fc4e49602 100644
> > --- a/drivers/net/ethernet/renesas/rswitch.h
> > +++ b/drivers/net/ethernet/renesas/rswitch.h
>
> [ ... ]
>
> > diff --git a/drivers/net/ethernet/renesas/rswitch_l2.c
> > b/drivers/net/ethernet/renesas/rswitch_l2.c
> > index f1c5c96027ba..ea95a87ed234 100644
> > --- a/drivers/net/ethernet/renesas/rswitch_l2.c
> > +++ b/drivers/net/ethernet/renesas/rswitch_l2.c
>
> [ ... ]
>
> > @@ -285,6 +269,181 @@ static int rswitch_switchdev_blocking_event(struc=
t notifier_block *nb,
> >     return notifier_from_errno(ret);
> >  }
> >
> > +static int rswitch_gwca_write_mac_address(struct rswitch_private
> > +*priv, const u8 *mac) {
> > +   int err;
> > +
> > +   err =3D rswitch_gwca_change_mode(priv, GWMC_OPC_CONFIG);
> > +   if (err < 0)
> > +           return err;
> > +
> > +   iowrite32((mac[0] << 8) | mac[1], priv->addr + GWMAC0);
> > +   iowrite32((mac[2] << 24) | (mac[3] << 16) | (mac[4] << 8) | mac[5],
> > +             priv->addr + GWMAC1);
> > +
> > +   return rswitch_gwca_change_mode(priv, GWMC_OPC_OPERATION); }
> > +
> > +static int rswitch_add_addr_to_mactable(struct rswitch_private *priv,
> > +const u8 *mac) {
> > +   u32 index =3D priv->gwca.l2_shared_rx_queue->index;
> > +   int err;
> > +
> > +   rswitch_modify(priv->addr, FWMACTL0, FWMACTL0_ED, 0);
> > +   iowrite32((mac[0] << 8) | mac[1], priv->addr + FWMACTL1);
> > +   iowrite32((mac[2] << 24) | (mac[3] << 16) | (mac[4] << 8) | mac[5],
> > +             priv->addr + FWMACTL2);
> > +   iowrite32(FWMACTL3_DSLV | FWMACTL3_SSLV,
> > +             priv->addr + FWMACTL3);
> > +   iowrite32(FIELD_PREP(FWMACTL4_CSDL, index),
> > +             priv->addr + FWMACTL4(GWCA_INDEX));
> > +   iowrite32(FIELD_PREP(FWMACTL5_DV, BIT(AGENT_INDEX_GWCA)),
> > +             priv->addr + FWMACTL5);
> > +
> > +   err =3D rswitch_reg_wait(priv->addr, FWMACTLR, FWMACTLR_L, 0);
> > +   if (err < 0)
> > +           return err;
> > +
> > +   if (ioread32(priv->addr + FWMACTLR))
> > +           return NOTIFY_BAD;
> > +
> > +   return NOTIFY_DONE;
> > +}
> > +
> > +static int rswitch_del_addr_from_mactable(struct rswitch_private
> > +*priv, const u8 *mac) {
> > +   int err;
> > +
> > +   rswitch_modify(priv->addr, FWMACTL0, 0, FWMACTL0_ED);
> > +   iowrite32((mac[0] << 8) | mac[1], priv->addr + FWMACTL1);
> > +   iowrite32((mac[2] << 24) | (mac[3] << 16) | (mac[4] << 8) | mac[5],
> > +             priv->addr + FWMACTL2);
> > +   iowrite32(FWMACTL3_DSLV | FWMACTL3_SSLV,
> > +             priv->addr + FWMACTL3);
> > +   iowrite32(FIELD_PREP(FWMACTL4_CSDL, BIT(0)),
> > +             priv->addr + FWMACTL4(GWCA_INDEX));
> > +   iowrite32(FIELD_PREP(FWMACTL5_DV, BIT(AGENT_INDEX_GWCA)),
> > +             priv->addr + FWMACTL5);
> > +
> > +   err =3D rswitch_reg_wait(priv->addr, FWMACTLR, FWMACTLR_L, 0);
> > +   if (err < 0)
> > +           return err;
> > +
> > +   err =3D ioread32(priv->addr + FWMACTLR);
> > +   if (err)
> > +           return NOTIFY_BAD;
> > +
> > +   return NOTIFY_DONE;
> > +}
> > +
> > +static void rswitch_switchdev_bridge_fdb_event_work(struct
> > +work_struct *work) {
> > +   struct rswitch_switchdev_event_work *switchdev_work;
> > +   struct rswitch_device *rdev;
> > +   struct net_device *ndev;
> > +
> > +   switchdev_work =3D container_of(work, struct rswitch_switchdev_even=
t_work, work);
> > +   ndev =3D switchdev_work->ndev;
> > +
> > +   rtnl_lock();
> > +
> > +   /* Unfortunately all net_device members point to br0, there is no s=
imple way to check
> > +    * if the event was triggered by a port device setting.
> > +    */
> > +   rswitch_for_all_ports(switchdev_work->priv, rdev) {
> > +           if (ether_addr_equal(rdev->ndev->dev_addr, switchdev_work->=
fdb_info.addr))
> > +                   goto out;
> > +   }
> > +
> > +   /* Handle only bridge device */
> > +   if (is_rdev(ndev))
> > +           goto out;
> > +
> > +   switch (switchdev_work->event) {
> > +   case SWITCHDEV_FDB_ADD_TO_DEVICE:
> > +           rswitch_gwca_write_mac_address(switchdev_work->priv, switch=
dev_work->fdb_info.addr);
> > +           rswitch_add_addr_to_mactable(switchdev_work->priv, switchde=
v_work->fdb_info.addr);
> > +           break;
> > +   case SWITCHDEV_FDB_DEL_TO_DEVICE:
> > +           rswitch_del_addr_from_mactable(switchdev_work->priv, switch=
dev_work->fdb_info.addr);
> > +           break;
> > +   default:
> > +           break;
> > +   }
> > +
> > +out:
> > +   rtnl_unlock();
> > +
> > +   kfree(switchdev_work->fdb_info.addr);
> > +   kfree(switchdev_work);
> > +   dev_put(ndev);
> > +}
> > +
> > +/* called under rcu_read_lock() */
> > +static int rswitch_switchdev_event(struct notifier_block *nb,
> > +                              unsigned long event,
> > +                              void *ptr)
> > +{
> > +   struct net_device *ndev =3D switchdev_notifier_info_to_dev(ptr);
> > +   struct rswitch_switchdev_event_work *switchdev_work;
> > +   struct switchdev_notifier_fdb_info *fdb_info;
> > +   struct switchdev_notifier_info *info =3D ptr;
> > +   struct rswitch_private *priv;
> > +   int err;
> > +
> > +   priv =3D container_of(nb, struct rswitch_private,
> > +rswitch_switchdev_nb);
> > +
> > +   switch (event) {
> > +   case SWITCHDEV_FDB_ADD_TO_DEVICE:
> > +           fallthrough;
> > +   case SWITCHDEV_FDB_DEL_TO_DEVICE:
> > +           switchdev_work =3D kzalloc(sizeof(*switchdev_work), GFP_ATO=
MIC);
> > +
> > +           if (!switchdev_work)
> > +                   return NOTIFY_BAD;
> > +
> > +           switchdev_work->ndev =3D info->dev;
> > +           switchdev_work->priv =3D priv;
> > +           switchdev_work->event =3D event;
> > +
> > +           fdb_info =3D container_of(info,
> > +                                   struct switchdev_notifier_fdb_info,
> > +                                   info);
> > +
> > +           INIT_WORK(&switchdev_work->work,
> > +rswitch_switchdev_bridge_fdb_event_work);
> > +
> > +           memcpy(&switchdev_work->fdb_info, ptr,
> > +sizeof(switchdev_work->fdb_info));
> > +
> > +           switchdev_work->fdb_info.addr =3D kzalloc(ETH_ALEN, GFP_ATO=
MIC);
> > +           if (!switchdev_work->fdb_info.addr)
> > +                   goto err_addr_alloc;
> > +
> > +           ether_addr_copy((u8 *)switchdev_work->fdb_info.addr,
> > +                           fdb_info->addr);
> > +           dev_hold(ndev);
> > +           queue_work(system_long_wq, &switchdev_work->work);
> > +
> > +           break;
> > +   case SWITCHDEV_PORT_ATTR_SET:
> > +           err =3D switchdev_handle_port_attr_set(ndev, ptr,
> > +                                                is_rdev,
> > +                                                rswitch_port_attr_set)=
;
> > +           return notifier_from_errno(err);
> > +
> > +           if (!is_rdev(ndev))
> > +                   return NOTIFY_DONE;
> > +
> > +           return notifier_from_errno(-EOPNOTSUPP);
>
> Are these lines in the SWITCHDEV_PORT_ATTR_SET case reachable? The return=
 notifier_from_errno(err)
> above them looks like it returns unconditionally.
>
> Note: this dead code is removed in the next commit in the series
> (ed3ab4a0a727 'net: renesas: rswitch: add vlan aware switching'), which m=
oves PORT_ATTR_SET handling
> to rswitch_switchdev_blocking_event and removes this entire case from rsw=
itch_switchdev_event.

I moved this to this patch. Thereby removing the dead code.

Best regards,

Michael
>
> > +   }
> > +
> > +   return NOTIFY_DONE;
> > +
> > +err_addr_alloc:
> > +   kfree(switchdev_work);
> > +
> > +   return NOTIFY_BAD;
> > +}
> > +
> >  int rswitch_register_notifiers(struct rswitch_private *priv)  {
> >     int err;


