Return-Path: <linux-renesas-soc+bounces-32362-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UA6kArWlAWpKhAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32362-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 11:47:33 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD1C50B3FE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 11:47:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1271430772A2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 09:32:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF4CA3BD647;
	Mon, 11 May 2026 09:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="VMkVUGV0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011048.outbound.protection.outlook.com [52.101.125.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE7337C930;
	Mon, 11 May 2026 09:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778491934; cv=fail; b=P9iHFJAeIebKeLsi7B5bjX546u8hu/Ay2LFWS/6JsmeaggqQZ7tpKr2AKCviwsPCD7XACuc5ZPy5tt7o1FUloauIBh/wllgFpeL+PcrAPaqOIQ+GKmwEyO+KiWM7yzklFEbE2drgTdt7o2Bl+2m2pPOc2mQbWOMqNd5l3oCVnE0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778491934; c=relaxed/simple;
	bh=2eSBku/AL9TRvEChAzmZmGgcdmFtgPUfgpYI9iX6QWo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Unwncwx+MyaajBcjXwsvTJf9VTXXGBYZJC863g/qqLnEki9NpdgApVQOMAdFGDxGbRPqOD0GWIV6PerwMOVALsWsVlVpREh7epP3z+BuxmR4vPIhin4W1AS2qaKSisj0pIwYVI/4JgZUM3xmvYQPFV0YXAkIXS2iMw7RpJMYhwk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=VMkVUGV0; arc=fail smtp.client-ip=52.101.125.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HmsnWyt2wPSkzX9RkPx3V6aIpqNTCAJhEsfa1xsKN7HGnalbWqi0TQOMyj283lOJl20rpi0ZznUHHBSMLoSKapegmE9X3u6c+Jc/pTzfVDyypmGyc49Pb0CWqLjmxe+yiakKLf9xPwl0IAr3wHF4kdLNlCJX20Vwpz4XYPnYeAU2Lh4n8dvGZftfQwj+nvRJIOtchusfUAUdG9VES3OhnZYxsJ5oWpyl00DzsVgp94iwhJ0WTmbXwJ4njzdIbX++s4N1UWKoxbcTna7KMv82eo32DEnYmzu39aewyInxWHyQwyIC7PsWsImDpmxOBTbEeJgciS9VTOI0Xiv9BDSxDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+G4nq/Z3ET2dDRWFJL27maDY+peQFavZ6GavVr2zSJE=;
 b=G2XCRsRbjjrYP/eTRm0z+jb4I4E0l9KkCtBQ8BaPkhfR4FBY7Sx6v3Pr74ykDporkCG3Wgz5qPiJlRPUgR3wNJ4LpBULVXNhdEAFaR/MiZFFCT3UVopFU/hjsUIsllEj9OCwjnuheE70iwV+MELjblhDaZjNyf3EXVBAgVYPJacId5E8kkZlCQ61qjApbyl8vD+X0hlWFlRAiNb8SZVqYFHNd4rfeD8aRgii+69BRmDhOwkIabCdxpxFFfHyMjgJxQDw1IlAVwANmauGBw7SyfrGgirlQZnh2Z5bGGh1GLCe41VeTlany59scZ3l8whwqdM9hI5ocYuQduSKhcKSlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+G4nq/Z3ET2dDRWFJL27maDY+peQFavZ6GavVr2zSJE=;
 b=VMkVUGV0FzWV1o/Imx9ajWegeaGo35B/+UQ0J45fFPLOPvd3xSQ5OxBk2fGfVF5t5eSPSHaqcWERR8edpkP52NyP0vhd/smelpWeA+jysR/s+MQ8ez6JUTKMnk6VBPg+mOeQ0WWcp9fwIzzFxEaW/vmF5yCjdkDrW5KkK4nRaOE=
Received: from TYRPR01MB14284.jpnprd01.prod.outlook.com (2603:1096:405:21b::6)
 by TY7PR01MB17990.jpnprd01.prod.outlook.com (2603:1096:405:39f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Mon, 11 May
 2026 09:32:10 +0000
Received: from TYRPR01MB14284.jpnprd01.prod.outlook.com
 ([fe80::4fad:2240:4042:6338]) by TYRPR01MB14284.jpnprd01.prod.outlook.com
 ([fe80::4fad:2240:4042:6338%5]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 09:32:10 +0000
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
Subject: RE: [net-next,v3,05/13] net: renesas: rswitch: add exception path for
 packets with unknown dst MAC
Thread-Topic: [net-next,v3,05/13] net: renesas: rswitch: add exception path
 for packets with unknown dst MAC
Thread-Index: AQHcwqCTLIBxE/Ei60+bJbh6IMzE0bYIy+zQ
Date: Mon, 11 May 2026 09:32:10 +0000
Message-ID:
 <TYRPR01MB14284F0A935F6762E3F9638E782382@TYRPR01MB14284.jpnprd01.prod.outlook.com>
References: <20260331-rswitch_add_vlans-v3-5-c37f41b1c556@renesas.com>
 <20260402125926.234465-1-pabeni@redhat.com>
In-Reply-To: <20260402125926.234465-1-pabeni@redhat.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYRPR01MB14284:EE_|TY7PR01MB17990:EE_
x-ms-office365-filtering-correlation-id: 276d3e30-18ca-4f43-8aa2-08deaf402d4e
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|18002099003|22082099003|38070700021|4133799003|56012099003;
x-microsoft-antispam-message-info:
 lwIn2VjIU+7w/UWF+3rZqjRNMQvn2Kz5dv0HahO2HZaqobsdTz/+55jzbUVFJca8BmMl1VGCuIaW/YM84UPxbIvXAwIGXMVfMQ0hgh4dpcH75XtjkZAA/aFOzFwdyxhbzSZ15pDzcwpw/5cVw3NVgizPLxMUODmwl8iNs+ktWIzn/vv4ZPfjpvJaPNd5BV+/L+VDAcqIpc2898/jZUsOPSKpCPgSHPX4hWjzpRsnj+X2PjbuwqlQ3Nr5acnbqJpvz86qu7/n3YqRrAELde49MhND3JeSZUTcnvu9hajBiSnQuacKz7IV+sZTdDYrUKvRj0oK0wUr3W2SRIkj15nV+ukDwJQnbCyhzTmUkGVsrqZ66OMEycwIel4Dh+ue3aEHDDAt6+bpM1BZLltkrx8vXtiXZfI0w2mFUKXkIu3olYALA4tuXgHjC51iOBNMlb/SXfNjojoG4XGz2Db2BTgLZwo9CYiXWYPrYWcus0hp++VjWSo5Ua3UFrKVose3Lr//DaUW9tHRLjtWL273PQuLNnpNdH3TTzmuWUEdQqlPrBj3iuZ1Gm1KOjLrCLjjx1MAAcem7l0KUrr3ZXAhSwamxJ73kySJDAizKxgyLoq72Drpio3hm9M8gzegm9ENck6o6ZE3TnekNVz7Vkvj6AVQxVsr+oseL1QuTwFAssRKi3rncrBAmag34/Az4e9hs+52nlGQLXZ90z2vDCq3hArdlA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB14284.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(18002099003)(22082099003)(38070700021)(4133799003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?qCGLX16mwkjSIV2V4ymQMqSWLRqeqXM4EXcq/blYiom5ecr1sN/sehbnpM9j?=
 =?us-ascii?Q?sbKtshmGt1DhEgWAI3RsXoZSl/BqLsQpjVYvqcvAvKYLEQsE40VwDCrcCgrg?=
 =?us-ascii?Q?bexQTP0LeOFWGs1bZ/iwuU0kjMRLzp5peV4Sfc3rI4YlREV6+dNT4KIOXxUl?=
 =?us-ascii?Q?zmNtOjGN4Xo5xKHu/ZWQRpuFibZeKsDcelxdZE+zCL5Q6xK2RwVZ5fLNbtUg?=
 =?us-ascii?Q?XF3CWr0vfqPN+rfyIsj/5MN/H8UTNcqBY7/bIJC8tXh3FPobByP/Dt4tIcIT?=
 =?us-ascii?Q?OYx2vgPFfvfR87F2ElG5jwmnkis7cirYiMi3FQ464SzcH/vJ2/ctORnYlvB8?=
 =?us-ascii?Q?6APbfqbB/vQ2DhS7bbz7Uo9YuI0wWClPi/uuD3lRtpRXn3PedsJXoWH35smT?=
 =?us-ascii?Q?SrVjGS17Jsjjbvea7ciPBGqE5mhdVPpTRF7nMHGt7E2Szj0x7Orn0jcboje3?=
 =?us-ascii?Q?RLzXjMOBrbQjJ3/FXtgjshKX091w/IB9lXygEiFGqGLgXnCTdFbK5RR/eGNA?=
 =?us-ascii?Q?QSvyqutVVQMMu8TjwCyCmGIAVCNN6QC2WOIBxZ3JJFjwq/FOB9btxvusKuKS?=
 =?us-ascii?Q?EpIosyaPwtZI4Zsy0T5CGm+fUpWOTb+lmSMCal+vaBFNbOvwTOcR7Lw1bMFA?=
 =?us-ascii?Q?OVZgomv7OuiwGRWl1uPAe6tsqwO91AqIHMygZQ9LDL/y5pdbuRS68N3Y/2ts?=
 =?us-ascii?Q?pIklf2hYLQB4OWkLylqOmwngfVMQUpv3DmBMukp38ZhwlchPg+yREgl44T1r?=
 =?us-ascii?Q?84Z7torgrwjjI4WRpfff20p6WcZJOFjL8FUn1Tq325sBXnav0zmdYi1kxt1h?=
 =?us-ascii?Q?qeMnjxt7lam6i+FVmZsSv1bI1NVH7BwitOyaoWyQ2QuNbZTnwRClJ4+jc1QA?=
 =?us-ascii?Q?79+JytVemP1ZYcc5U2D0VgkbngWd3CsqlNpECS8zu4fMh7/6GVXYXnEJWx21?=
 =?us-ascii?Q?xXbce15p9iRP96med6V6aNDInn3HrX+SCK9WdnAgm7Z8Q1hiyQRosp+dASE/?=
 =?us-ascii?Q?txRduIE6/AVlehxCf8FygvyNtXcJhozO/oC/WQJWB/x/sAMRr5jsIbHCS9X5?=
 =?us-ascii?Q?DvMdrDFeI/gYiNgUYIDcYEgH0hMt7ToJmw/12909X33oadZcRlWMv597Y4ct?=
 =?us-ascii?Q?B+GhrKiGqrSHH21TrOnARz300VWVlPwK1Ebky7uIVF5gBVp2wHBNQYuCyPM1?=
 =?us-ascii?Q?eHEa4X6q32gdWyod3fX08JTgpTTUakXNnmL4p5q2ga2Iob1y3yNDpJyvFLyl?=
 =?us-ascii?Q?c05ZyiLMCsVoU+uSPbkDFkfF4eksdxsssJkjUo/vhhgu/O35ePQfUiIyyNjr?=
 =?us-ascii?Q?2Kn/n5ujA9Vd6Z/d2XwWfsvXg8Sh3N5CM1O4yAFb/3IES5bWkAYRnB6B4Ldy?=
 =?us-ascii?Q?ICMLTgfiFauN/lEqggpI+gyEaNv4yGHL7uGNDC73fdtQIB2UyirKGhMWbRFS?=
 =?us-ascii?Q?XhVbWIun6iDucvPw1pTQmR/myB+uOKafmFxJZUzNU9DQNP+JbSJcimhKgsMr?=
 =?us-ascii?Q?8l4jdyKM5pz567OgI0wpHISQdGKf+1iQCTLwKloc+LacES0ItH3kupqz2YeN?=
 =?us-ascii?Q?p3VPd6qs6KfhoNNxqiS2yHelwbGkLTGZoOBw+cjBIGPW6k9Q4XWdByZZGreD?=
 =?us-ascii?Q?4TkD5nZDpSvkNokvM+xrAqjKwmFldlEtQCOreUauOf+r7UMqz0ynkWrY41tX?=
 =?us-ascii?Q?lprYcywe1wjGi9Z84l7T3wopsKFqLCBhoKkutvqC4apiez3whINn8gfn3TAf?=
 =?us-ascii?Q?sB+YSmmcCA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 276d3e30-18ca-4f43-8aa2-08deaf402d4e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2026 09:32:10.5798
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0sY274TFv+20xbNdWjnZ86Ss5quSZdUSAyhYu6BUUECsAfN6WnCWjtc3I7Mt6jbaqny9ScK+z+1rDTx1U4dGHXkyH/tpB8YYiEnO7e4+vUo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB17990
X-Rspamd-Queue-Id: 8DD1C50B3FE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32362-lists,linux-renesas-soc=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pbarker.dev:email,linux.dev:url,renesas.com:email,renesas.com:dkim,ragnatech.se:email,davemloft.net:email,lunn.ch:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hello Paolo,

Thank you for your comments.

> -----Original Message-----
> From: Paolo Abeni <pabeni@redhat.com>
> Sent: Thursday, April 2, 2026 2:59 PM
> To: Michael Dege <michael.dege@renesas.com>
> Cc: paul@pbarker.dev; niklas.soderlund <niklas.soderlund@ragnatech.se>; k=
uba@kernel.org; Yoshihiro
> Shimoda <yoshihiro.shimoda.uh@renesas.com>; netdev@vger.kernel.org; linux=
-kernel@vger.kernel.org;
> edumazet@google.com; pabeni@redhat.com; linux-renesas-soc@vger.kernel.org=
; andrew+netdev@lunn.ch;
> davem@davemloft.net
> Subject: Re: [net-next,v3,05/13] net: renesas: rswitch: add exception pat=
h for packets with unknown
> dst MAC
>
> This is an AI-generated review of your patch. The human sending this emai=
l has considered the AI
> review valid, or at least plausible.
>
> For local reproduction steps see
> https://netdev-ai.bots.linux.dev/ai-
> local.html&data=3D05%7C02%7Cmichael.dege%40renesas.com%7Cb2d0350e94034e87=
022808de90b7b3a4%7C53d82571da19
> 47e49cb4625a166a4a2a%7C0%7C0%7C639107315835518827%7CUnknown%7CTWFpbGZsb3d=
8eyJFbXB0eU1hcGkiOnRydWUsIlYi
> OiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7=
C%7C&sdata=3DqrJsW%2FuZLYIEdu93
> AEAhZYgWm%2BcbSdguzJUvsjy7NFE%3D&reserved=3D0
> ---
> net: renesas: rswitch: add exception path for packets with unknown dst MA=
C
>
> This commit creates a shared RX queue for the exception path to handle pa=
ckets with unknown MAC
> addresses that cannot be processed by HW forwarding. The queue receives p=
ackets with unknown src/dst
> addresses and forwards them to the CPU for MAC learning.
>
> > diff --git a/drivers/net/ethernet/renesas/rswitch.h
> > b/drivers/net/ethernet/renesas/rswitch.h
> > index 15d3fa48b0e3..bf123b564ed1 100644
> > --- a/drivers/net/ethernet/renesas/rswitch.h
> > +++ b/drivers/net/ethernet/renesas/rswitch.h
> > @@ -1148,6 +1148,7 @@ struct rswitch_gwca {
> >     struct rswitch_gwca_queue *queues;
> >     int num_queues;
> >     struct rswitch_gwca_queue ts_queue;
> > +   struct rswitch_gwca_queue *l2_shared_rx_queue;
> >     DECLARE_BITMAP(used, RSWITCH_MAX_NUM_QUEUES);
> >     u32 tx_irq_bits[RSWITCH_NUM_IRQ_REGS];
> >     u32 rx_irq_bits[RSWITCH_NUM_IRQ_REGS];
> > diff --git a/drivers/net/ethernet/renesas/rswitch_main.c
> > b/drivers/net/ethernet/renesas/rswitch_main.c
> > index d404bc41bd1e..3c142fa3c810 100644
> > --- a/drivers/net/ethernet/renesas/rswitch_main.c
> > +++ b/drivers/net/ethernet/renesas/rswitch_main.c
> > @@ -680,6 +680,34 @@ static int rswitch_rxdmac_init(struct rswitch_priv=
ate *priv, unsigned int
> index)
> >     return rswitch_gwca_queue_ext_ts_format(ndev->dev.parent, priv,
> > rdev->rx_queue);  }
> >
> > +static int rswitch_shared_rx_queue_alloc(struct rswitch_private
> > +*priv) {
> > +   struct rswitch_gwca *gwca =3D &priv->gwca;
> > +   struct device *dev =3D &priv->pdev->dev;
> > +
> > +   int err;
> > +
> > +   gwca->l2_shared_rx_queue =3D rswitch_gwca_get(priv);
> > +   if (!gwca->l2_shared_rx_queue)
> > +           return -EBUSY;
> > +
> > +   err =3D rswitch_gwca_queue_alloc(NULL, priv, gwca->l2_shared_rx_que=
ue, false, RX_RING_SIZE);
> > +   if (err < 0) {
> > +           rswitch_gwca_put(priv, gwca->l2_shared_rx_queue);
> > +           return err;
> > +   }
> > +
> > +   return rswitch_gwca_queue_ext_ts_format(dev, priv,
> > +gwca->l2_shared_rx_queue); }
> > +
> > +static void rswitch_shared_rx_queue_free(struct rswitch_private
> > +*priv) {
> > +   struct rswitch_gwca *gwca =3D &priv->gwca;
> > +
> > +   rswitch_gwca_queue_free(&priv->pdev->dev, gwca->l2_shared_rx_queue)=
;
> > +   rswitch_gwca_put(priv, gwca->l2_shared_rx_queue); }
> > +
> >  static int rswitch_gwca_hw_init(struct rswitch_private *priv)  {
> >     unsigned int i;
> > @@ -717,6 +745,12 @@ static int rswitch_gwca_hw_init(struct rswitch_pri=
vate *priv)
> >                     return err;
> >     }
> >
> > +   err =3D rswitch_shared_rx_queue_alloc(priv);
> > +   if (err < 0) {
> > +           rswitch_shared_rx_queue_free(priv);
> > +           return err;
> > +   }
>
> Does this cause a NULL pointer dereference if rswitch_shared_rx_queue_all=
oc() fails? When
> rswitch_gwca_queue_alloc() fails internally (e.g., under memory pressure =
during netdev_alloc_frag()),
> the 'out:' label inside
> rswitch_gwca_queue_alloc() already calls rswitch_gwca_queue_free(), which=
 sets
> gq->rx_bufs =3D NULL and gq->rx_ring =3D NULL.
>
> Then rswitch_shared_rx_queue_alloc() calls rswitch_gwca_put() and returns=
 error. The caller
> rswitch_gwca_hw_init() then calls rswitch_shared_rx_queue_free(), which c=
alls
> rswitch_gwca_queue_free() a second time.
>
> In this second call, gq->rx_bufs is NULL but gq->ring_size is still RX_RI=
NG_SIZE, so the loop in
> rswitch_gwca_queue_free():
>
>     for (i =3D 0; i < gq->ring_size; i++)
>         skb_free_frag(gq->rx_bufs[i])
>
> dereferences NULL (gq->rx_bufs[i] =3D NULL[i]). This causes a kernel NULL=
 pointer dereference crash
> during device probe under memory pressure.
>
> Should the cleanup not call rswitch_shared_rx_queue_free() when
> rswitch_shared_rx_queue_alloc() fails, since the alloc function already p=
erforms partial cleanup
> internally?

I reworked this.
>
> > +
> >     return rswitch_gwca_change_mode(priv, GWMC_OPC_OPERATION);  }
>
> [ ... ]
>
> > @@ -1513,6 +1564,14 @@ static int rswitch_serdes_set_params(struct rswi=
tch_device *rdev)
> >     return phy_set_speed(rdev->serdes, rdev->etha->speed);  }
> >
> > +static void rswitch_etha_set_exception_path(struct rswitch_private
> > +*priv) {
> > +   iowrite32(FDMACUFEF, priv->addr + FWCEPRC2);
> > +   iowrite32(FIELD_PREP(EPCS, GWCA_INDEX) |
> > +             FIELD_PREP(EPCSD, priv->gwca.l2_shared_rx_queue->index),
> > +             priv->addr + FWCEPTC);
> > +}
> > +
>
> [ ... ]
>
> Looking at rswitch_init() in the existing code:
>
>     err =3D rswitch_gwca_hw_init(priv);
>     if (err)
>         goto err_gwca_hw_init;
>
>     err =3D rswitch_ether_port_init_all(priv);
>     if (err)
>         goto err_ether_port_init_all;
>
>     err_ether_port_init_all:
>         rswitch_gwca_hw_deinit(priv);
>
>     err_gwca_hw_init:
>
> When rswitch_gwca_hw_init() succeeds (allocating the shared RX queue via
> rswitch_shared_rx_queue_alloc()), but a subsequent initialization step fa=
ils (e.g.,
> rswitch_ether_port_init_all() or register_netdev()), does the error path =
leak the shared RX queue?
>
> The error path at 'err_ether_port_init_all:' only calls rswitch_gwca_hw_d=
einit(), which merely changes
> the GWCA hardware mode. It does NOT call rswitch_shared_rx_queue_free() t=
o release the DMA memory
> (dma_alloc_coherent), rx_bufs (kzalloc), and page fragments allocated by
> rswitch_shared_rx_queue_alloc(). These are not device-managed allocations=
.
>
> Should the cleanup call rswitch_shared_rx_queue_free() before or after rs=
witch_gwca_hw_deinit()?

Yes, I reworked this as well.
>
> [ ... ]
>
> > @@ -952,15 +987,31 @@ static int rswitch_poll(struct napi_struct *napi,=
 int budget)
> >     return 0;
> >  }
> >
> > -static void rswitch_queue_interrupt(struct net_device *ndev)
> > +static void rswitch_queue_interrupt(struct rswitch_private *priv,
> > +struct rswitch_gwca_queue *gq)
> >  {
> > -   struct rswitch_device *rdev =3D netdev_priv(ndev);
> > +   struct rswitch_ext_ts_desc *desc;
> > +   struct rswitch_device *rdev;
> > +   struct net_device *ndev;
> > +   u32 spn;
> > +
> > +   if (gq->index =3D=3D priv->gwca.l2_shared_rx_queue->index) {
> > +           desc =3D &gq->rx_ring[gq->cur];
> > +           spn =3D FIELD_GET(SPN, desc->info1);
> > +           ndev =3D priv->rdev[spn]->ndev;
> > +           rdev =3D netdev_priv(ndev);
> > +           gq->ndev =3D ndev;
> > +           rdev->rx_queue =3D gq;
>
> Can this permanently break per-port RX processing? When a shared RX queue=
 interrupt fires for a port,
> rswitch_queue_interrupt() overwrites
> rdev->rx_queue to point to the shared queue (gq) instead of the port's
> per-port RX queue. This assignment is never reversed. After this point:
>
> (1) rswitch_poll() -> rswitch_rx() processes from rdev->rx_queue which no=
w points to the shared queue,
> so the per-port RX queue is never drained.
>
> (2) When NAPI completes in rswitch_poll(), it re-enables rdev->rx_queue->=
index (the shared queue
> index) instead of the original per-port RX queue index.
>
> (3) The per-port RX queue IRQ is never re-enabled by NAPI completion (rsw=
itch_enadis_data_irq only re-
> enables rdev->rx_queue->index and l2_shared_rx_queue->index, which are no=
w the same):
>
> rswitch_poll():
>     if (napi_complete_done(napi, budget - quota)) {
>         spin_lock_irqsave(&priv->lock, flags);
>         rswitch_enadis_data_irq(priv, rdev->tx_queue->index, true);
>         rswitch_enadis_data_irq(priv, rdev->rx_queue->index, true);
>         rswitch_enadis_data_irq(priv, priv->gwca.l2_shared_rx_queue->inde=
x, true);
>         ...
>     }
>
> This means the per-port RX queue becomes permanently orphaned after the f=
irst shared-queue packet for
> that port, causing packet loss for all regular
> (non-exception-path) traffic on that port.
>
> Should the code save and restore the original rdev->rx_queue, or use a se=
parate mechanism to process
> shared queue packets without overwriting the per-port queue pointer?

I added caching of the original rdev->rx_queue.

Best regards,

Michael
>
> > +   } else {
> > +           rdev =3D netdev_priv(gq->ndev);
> > +   }
> > +
> > +
> > +   if (napi_schedule_prep(&rdev->napi)) {
> > +           spin_lock(&priv->lock);
> > +           rswitch_enadis_data_irq(priv, rdev->tx_queue->index, false)=
;
> > +           rswitch_enadis_data_irq(priv, rdev->rx_queue->index, false)=
;
> > +           rswitch_enadis_data_irq(priv, priv->gwca.l2_shared_rx_queue=
->index, false);
> > +           spin_unlock(&priv->lock);
> >             __napi_schedule(&rdev->napi);
> >     }
> >  }
>
> [ ... ]


