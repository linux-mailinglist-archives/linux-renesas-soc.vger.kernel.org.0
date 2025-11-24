Return-Path: <linux-renesas-soc+bounces-25088-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A4AC818C6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Nov 2025 17:26:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A3656346AF0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Nov 2025 16:26:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E61E83161AD;
	Mon, 24 Nov 2025 16:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="jrsy4N+w"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011021.outbound.protection.outlook.com [40.107.74.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A93315765;
	Mon, 24 Nov 2025 16:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764001557; cv=fail; b=fM2bwmPTIHQnxevJhBzZtBlxwe3+9wGMOc7dWftdI30jATRI67xbmrnBDqDzzrFT0ge4RENDdiNlnj/TKvJNrm3J1PzbOEDyNOAPuVcFkCRIZaimMCn3x21UbyCtPKwpFkfoduptms+fbNLAZ37adQR/BtXZPAvmPkcYyCJ/Gj8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764001557; c=relaxed/simple;
	bh=dCo3I3nZbypq/Cf098jhr0a+BZdv+J74hNwmm9LC+xI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mjy+ZY0H78rswwAMvC0YYMFgTY1Er8voTq00p6kqEWDvNp6JkQXO+magcQZYdBenc97xg7Bvym1t1nTdTMRfW/Y0LQRZNS2oiV8nE72Pkk3w+8thhcQdApwTpNOo2zpc9ZHTK6Tz1Dqt/LLZoocC6OxAQnSpNaWM4YGaX7jt62o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=jrsy4N+w; arc=fail smtp.client-ip=40.107.74.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CSqReqY2e8NVDd1Z/Un+MyzisriULZdOlXEH939ABBvdBYDeSvpEu1RjnPZQhtCEK5c6eH7S/sX1hlvibsJb7OA85iByp/cZT1tzHrZ0/ktgJzPdq6Mxg6oy86dEx3lMNn+8iLd5dK4hwzI8xO42n/71KHB9AqpluNJkxwsQU+iNfrs9rIUUo3GBTuxwPbwQSwFeHVm8ropSb+T2H/fQO7v64s0+O2gPNw5gEqbXdWe3A+ZYDZ0JiNrzNq1wof71PvRnDUZEqV1mYhMN4ZfezsVMdWImULsUCkbr9priOHYvdYUAzzlvULm7pDj9XSBSuvpKQSEt8UU5pviciT6XBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rV9vw9Z5crKONqDh/mzpBtOeZK2llVZGMHbmpaQXWr4=;
 b=PKaEGs1FfHwebSWUPZ9Xic9pNbJNQ699QIpWUlmrAsQXTb9OmMB1RZjKw66Kzd8kpvMJv7211tUzTikg/Jm1XF3wtuaaVtPHsf4XE8BMWX32JLyMifS2QovF4ZTlNhQAkvL1lIcYBPJv598BaoyozkhfxFvB0pFeek4CGNMylSv5sHTpZKcOu7Hd4/CVqgdEVSwPNfafsiY+WcyjpeJEpfDg+geibFXW7q8FeCbdv31lDrHIkEzoWDeU+kbnWEPqGbWw+f5Jik3Ycpl4abG1g27zVXoA8V5dyIinFlaqtLRx3oBmZ7+2/f66DbLFST5PRr2UyYt9a2sqMINVwBL/iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rV9vw9Z5crKONqDh/mzpBtOeZK2llVZGMHbmpaQXWr4=;
 b=jrsy4N+wpm1ZgAyPL9HtrVptEuBz/M+hnZF2EFLNEoT+3KrEBk1JvOneSDtQRju/vNwG3CC+MXJWd+02vEQxt5E1E4G56lVNIZlv0f9+JxWaCxSPzx4Q3BL9aO2eCfg7DgoG9xVUX/ooI1+pYagmo2UiKg7AlwqXWltHlJQPuSo=
Received: from TYYPR01MB13955.jpnprd01.prod.outlook.com (2603:1096:405:1a6::6)
 by TY4PR01MB13095.jpnprd01.prod.outlook.com (2603:1096:405:1dc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Mon, 24 Nov
 2025 16:25:49 +0000
Received: from TYYPR01MB13955.jpnprd01.prod.outlook.com
 ([fe80::52be:7d7a:35ec:4b29]) by TYYPR01MB13955.jpnprd01.prod.outlook.com
 ([fe80::52be:7d7a:35ec:4b29%7]) with mapi id 15.20.9366.009; Mon, 24 Nov 2025
 16:25:49 +0000
From: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Thomas Gleixner
	<tglx@linutronix.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 1/4] dt-bindings: interrupt-controller: document
 RZ/{T2H,N2H} ICU
Thread-Topic: [PATCH 1/4] dt-bindings: interrupt-controller: document
 RZ/{T2H,N2H} ICU
Thread-Index: AQHcWtgeuYApnjoIckmnbCZssC+8vLUAQxmAgAGUkwA=
Date: Mon, 24 Nov 2025 16:25:49 +0000
Message-ID:
 <TYYPR01MB1395511BA753B32266C15CFEE85D0A@TYYPR01MB13955.jpnprd01.prod.outlook.com>
References: <20251121111423.1379395-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20251121111423.1379395-2-cosmin-gabriel.tanislav.xa@renesas.com>
 <32ffb736-d060-4ae9-b4fb-b836a6c869e9@kernel.org>
In-Reply-To: <32ffb736-d060-4ae9-b4fb-b836a6c869e9@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYYPR01MB13955:EE_|TY4PR01MB13095:EE_
x-ms-office365-filtering-correlation-id: fc5e34af-277f-46f0-cddf-08de2b762146
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?wMmlnavvsj4vRamBxLgnhFeO3qiRqkeXQ8YXHCHMrYZu87RfMlayfOpuWAZT?=
 =?us-ascii?Q?7A6716oET/qh5SF10hHGo06nC8OKbernlP8Lcdx0O1U2wWgbvwbqSotBpwdR?=
 =?us-ascii?Q?EiRCsYEHgwDKp+yjyKl41Gh/LO8Ca1INXYUEOl8RhDEWzKJ6TAkVyZYCwG+A?=
 =?us-ascii?Q?MOC/LufjY5Igfp/7aAuFv9gutcsF0NWHzLOGaMVIQ//XkI/6Y7opxZGLbBLa?=
 =?us-ascii?Q?JMTIFCAKxNhqBxlqCRFi4q58NG+zEpULCUkQS/kDf6QaQrDnREzOOoYaoQ8y?=
 =?us-ascii?Q?wwSGADBpz3L7GKsPo7ZzKVilGLX3d25zY9QWkKFlR+LiCEUCtynQ1ga1Wf0L?=
 =?us-ascii?Q?+z/W6orH9MebwFeUjg5WgNeDM+lr5ANLtEoBDIdcUDXsIlpVSlmFq3kpa9eG?=
 =?us-ascii?Q?DQ7K3z5dMfuMbferEELg7lpUQ7Sy/YwnVT6wpNN+U5c7++oHHHbRFWoWCOCT?=
 =?us-ascii?Q?t5Q/WMKMZM6e93K12VY6SqTtGX33Qmu5vLX7VjcBj/XVZhZUNr76eagNDIki?=
 =?us-ascii?Q?LPBTqUWak1RhyrJh9BHKSad/HF0qoYQeVe3yKrngp4uBlOcSATPjT0rU+eHb?=
 =?us-ascii?Q?MZN6Qz2gStBo4qf8Wn0ejAKVmWHGPBdqHm6eeyRpfpp6XXuv2fX7MUKdxNwU?=
 =?us-ascii?Q?VplR+jspoqQUPIVz7s8Max6EFD9aiiQ2dCpW1ZPEQpbDzXuItUKW1kSddTb8?=
 =?us-ascii?Q?C14l7r2QCyBhXut8TYdlMAFH/4mAfDIwX7kvDU/5kp2ymXoh3vFCoCqCDTSY?=
 =?us-ascii?Q?uS7i77NjmAFWCWJ71rLqTcdKEzYn2UhC/MELjrU9LZwbUG2Gxd5c+3hV2rh6?=
 =?us-ascii?Q?4+UfuUsix+sPThkbiA0b2DeGE5Gx+G/hsorNdya5dKgXV3asB6/oX38yaaIZ?=
 =?us-ascii?Q?8iwalKrXdqd+03H3EOWkx47cBCb15hfq/vLVdhJIiQJAi7a2Yh0cayr2ntqr?=
 =?us-ascii?Q?RtG1X4mMERMLF6dbML2/Vo9R8wvvjO6jWdmaMfVOD65lsW7Mx64ir7TrEV27?=
 =?us-ascii?Q?SRZjTXaY3Q0/6ON+2C5Bf8yR6svFzJPCMl7uWXwnt+GCebwJ4KNdzGZBHGlm?=
 =?us-ascii?Q?45U1WjgNsiCWLeRGMAaqCThTmvk5llqhM/f3L9rX+YREwprKcnFK0EeA6maQ?=
 =?us-ascii?Q?dex4vNLbdagBCQBoELtk8rzG1YPYJNjxPrsxNBxmdXqY4qw7N+slC+14z+n7?=
 =?us-ascii?Q?yw/SzlzlOekGlnrui36qvT6Jkwmy7szY5APjSL9y3eIQIalC0x6SYWmwQa3T?=
 =?us-ascii?Q?RhUXuMl7Gp4Mpjz5nMdz9xN0ZlO2GakD1mCU5cFsz5TcPwAAlW8t5bj+C4+u?=
 =?us-ascii?Q?deQcRWFHJ3qwtrIe71s2XqExoc54MOCiF4lnEu3tEUVd1Xw6HL0YU4MT7wyv?=
 =?us-ascii?Q?Stb7OYBP6z3U3dZblDq4m60at++CyaMy3CiSCGhzo3ff2PXjGgTX98dX3vj5?=
 =?us-ascii?Q?qQACSh8TdsCRcohE1Urvkgv4FfTrawaArCNqWOJ62TF+4P7Seh8PzF6JxOTB?=
 =?us-ascii?Q?EZxWE/ojr/uGH0sV/cWJHjsNYxTUVIp71qn+?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB13955.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?POEytzYxHm0ckJz1/xtkBwOtpEVx9JxtMpFPHZRfQ3QPr+GwmWLgfKyht3xo?=
 =?us-ascii?Q?2lqvLNeYpGitdKuLQ5v1H8EU6deYVao87M9SNyggxGbwnzWdU7ESmcqStWZz?=
 =?us-ascii?Q?la8ijmbxFC0bx4oYaGPnuCZE3ap3SCTsUQxhIbu+kyFWc+DNDhzNQyxPZsDV?=
 =?us-ascii?Q?pV1Oi4lgtBJ0PUbH1RINin6y22vE/n0JNP5Eyj94a+PGviLVrDqFNvcHLu+P?=
 =?us-ascii?Q?8QMdrDozjrgjY8DiEW7NuUvsqO1YQV6BRJxoBv1QpCMEed9UdxwUv8qVr1mo?=
 =?us-ascii?Q?e7wW7GQusMCHG22+1LJGUqUL5/k4qZes6bQUQsiwgSBYHhVN5ktB9GWLJ8YT?=
 =?us-ascii?Q?zUNCMYTXVoocLgoZqtskJkDvM/sLruF1+ATS8nXPl/ykMpOo9ybwBtGFHAkJ?=
 =?us-ascii?Q?GvxUMCzCSUvjQmhIxgkt9Ljrkyeh33YsgHlV1AGs5DEmzpM7EB4js4kIbfxg?=
 =?us-ascii?Q?SAFBm7QsnwD36IkZQx6hCz9UVfOAQ/4tsHVXn0s7AAF1pOc5jP9tLiNoAZx4?=
 =?us-ascii?Q?TN2yswbRyq1YL6q/BXr/twd5qMB5LtZtqMmeLIoPF7SXCoim2slrI7cRusbI?=
 =?us-ascii?Q?4O8PTN5wmgNgClagsvn8Uc9QGFXRw4Md/BdKrBP7VgYvtJ9lX5ZDJB4I+/A4?=
 =?us-ascii?Q?FvVFGXYQX41XIc2nyO3lRojGyGGtkxbzu+LjMc7rU6CV4DzJQg8C2s1zyW4j?=
 =?us-ascii?Q?lg6PBhHJljDrvOvixrmCXryXzRf1KAVpvu+s/JDmqO+4npOCdqwGZ5XlelJ9?=
 =?us-ascii?Q?fiwwWsW32gBCe5F/+yO43e0WvmkUyG5of1uHPRyR39gKft3zJzRaas6aXfav?=
 =?us-ascii?Q?qPuaM6CNLeIGpKCq/7Kd3rrPHHGDeZXm5VDpByvqVf4SYAZzRso0RZn9Ll/N?=
 =?us-ascii?Q?UIlqEVVdJ6vVNbuVwHKCIayackWQGYG1sPL8NoQJNwX9h/4fuNPq8ijGMT46?=
 =?us-ascii?Q?NJqYKs22sTbCrMWCshOeAX4pSc91uGunRb4ZQBB3KwivxrbaEWlYGty2t7Jz?=
 =?us-ascii?Q?xDoSjZsHWy5GpHuHbOA4/35Uuv6YdXJTTGvVVoT+UmZ5+hdfES6vVGdZt27i?=
 =?us-ascii?Q?rwaZnx6hMETvQHEJWgwLslFjQ3tHUWiApiQ0VSuXA5amzfB6ILRuGfj27uTe?=
 =?us-ascii?Q?voJUIAQKYnBTQ9V23UcvAW4aTyQFnEBOO1qcoqwa0Q7mnSFgO3a7TJGFTjZN?=
 =?us-ascii?Q?DLJ0MdGDkqULCZyils0SXSTIQ96MRvJ278iicV9j0eZGIC6u1njGvgV5XwWB?=
 =?us-ascii?Q?QKFu+U7B0er2g6lQRSgNQpVH+nDFK5aX4W0h5xqBKUxuJVcQh16/3D2PfD0c?=
 =?us-ascii?Q?Zu4b9XVL3mmXHGEoYjQQDkbl5jyGIOPnlaMgZV1b8MK0SiNftLRgpuMUU/0p?=
 =?us-ascii?Q?GaJcxUxI39n2rTXhrqAcRXgWCloQLYPHHZSudp7a1uyz2Z1rVuSp40r5hESW?=
 =?us-ascii?Q?ZAWiyRBQ9URmThB31oA6v7+amg7VbMhMh9iE/DBNL3I2wuvJB3POjabdUPXF?=
 =?us-ascii?Q?eSMbTg4+ztkrkwN2csIRg3DePs3uv0cDhqmq3lh1Q+GS3oY3CHIR8YUZYHPk?=
 =?us-ascii?Q?sVp2ZAko0hGWccv/sKkIOEGlNbH+/Bk1KmcNVsIMBkYxuBTQ8Mf7gBZJe9kR?=
 =?us-ascii?Q?msPnc10EKMNVSzwwyZ5oiJk=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB13955.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc5e34af-277f-46f0-cddf-08de2b762146
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2025 16:25:49.7378
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nByHRLrc3WV0zEs6scYH+h4/0UWR0/WXxqxtv7gr4P678Gl4iATSC0jyPrave8QbirzhSP3HQfOLIujDBarmov9yyS7+bOYPUYpF/qiYJk2xqH6IgSJIZn4SMDI+ueNs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13095

> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: Sunday, November 23, 2025 3:24 PM
>=20
> On 21/11/2025 12:14, Cosmin Tanislav wrote:
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - const: renesas,r9a09g077-icu # RZ/T2H
> > +
> > +      - items:
> > +          - enum:
> > +              - renesas,r9a09g087-icu # RZ/N2H
> > +          - const: renesas,r9a09g077-icu
> > +
> > +  '#interrupt-cells':
> > +    description: The first cell is the SPI number of the interrupt, as=
 per user
> > +      manual. The second cell is used to specify the flag.
> > +    const: 2
> > +
> > +  '#address-cells':
> > +    const: 0
> > +
> > +  interrupt-controller: true
> > +
> > +  reg:
> > +    items:
> > +      - description: Non-safety registers (INTCPU0-13, IRQ0-13)
> > +      - description: Safety registers (INTCPU14-15, IRQ14-15, SEI)
>=20
> reg is always the second property. Please follow DTS coding style.
>=20

Ack.

> > +
> > +  interrupts:
> > +    items:
> > +      - description: Software interrupt 0
> > +      - description: Software interrupt 1
> > +      - description: Software interrupt 2
> > +      - description: Software interrupt 3
> > +      - description: Software interrupt 4
> > +      - description: Software interrupt 5
> > +      - description: Software interrupt 6
> > +      - description: Software interrupt 7
> > +      - description: Software interrupt 8
> > +      - description: Software interrupt 9
> > +      - description: Software interrupt 10
> > +      - description: Software interrupt 11
> > +      - description: Software interrupt 12
> > +      - description: Software interrupt 13
> > +      - description: Software interrupt 14
> > +      - description: Software interrupt 15
> > +      - description: External pin interrupt 0
> > +      - description: External pin interrupt 1
> > +      - description: External pin interrupt 2
> > +      - description: External pin interrupt 3
> > +      - description: External pin interrupt 4
> > +      - description: External pin interrupt 5
> > +      - description: External pin interrupt 6
> > +      - description: External pin interrupt 7
> > +      - description: External pin interrupt 8
> > +      - description: External pin interrupt 9
> > +      - description: External pin interrupt 10
> > +      - description: External pin interrupt 11
> > +      - description: External pin interrupt 12
> > +      - description: External pin interrupt 13
> > +      - description: External pin interrupt 14
> > +      - description: External pin interrupt 15
> > +      - description: System error interrupt
> > +      - description: Cortex-A55 error event 0
> > +      - description: Cortex-A55 error event 1
> > +      - description: Cortex-R52 CPU 0 error event 0
> > +      - description: Cortex-R52 CPU 0 error event 1
> > +      - description: Cortex-R52 CPU 1 error event 0
> > +      - description: Cortex-R52 CPU 1 error event 1
> > +      - description: Peripherals error event 0
> > +      - description: Peripherals error event 1
> > +      - description: DSMIF error event 0
> > +      - description: DSMIF error event 1
> > +      - description: ENCIF error event 0
> > +      - description: ENCIF error event 1
> > +
> > +  interrupt-names:
> > +    items:
> > +      - const: intcpu0
> > +      - const: intcpu1
> > +      - const: intcpu2
> > +      - const: intcpu3
> > +      - const: intcpu4
> > +      - const: intcpu5
> > +      - const: intcpu6
> > +      - const: intcpu7
> > +      - const: intcpu8
> > +      - const: intcpu9
> > +      - const: intcpu10
> > +      - const: intcpu11
> > +      - const: intcpu12
> > +      - const: intcpu13
> > +      - const: intcpu14
> > +      - const: intcpu15
> > +      - const: irq0
> > +      - const: irq1
> > +      - const: irq2
> > +      - const: irq3
> > +      - const: irq4
> > +      - const: irq5
> > +      - const: irq6
> > +      - const: irq7
> > +      - const: irq8
> > +      - const: irq9
> > +      - const: irq10
> > +      - const: irq11
> > +      - const: irq12
> > +      - const: irq13
> > +      - const: irq14
> > +      - const: irq15
> > +      - const: sei
> > +      - const: ca55-err0
> > +      - const: ca55-err1
> > +      - const: cr520-err0
> > +      - const: cr520-err1
> > +      - const: cr521-err0
> > +      - const: cr521-err1
> > +      - const: peri-err0
> > +      - const: peri-err1
> > +      - const: dsmif-err0
> > +      - const: dsmif-err1
> > +      - const: encif-err0
> > +      - const: encif-err1
>=20
> Why all the interrupt names have nothing in common with previous ICU
> (renesas,rzv2h-icu.yaml)?

Unfortunately, the functionality is different compared to what was
present on RZ/V2H, hence the different names, descriptions, and order,
which I've taken straight from the User Manual of the SoC.

If the ICUs were similar, I would have tried to reuse the bindings and
drivers, but it would have quickly become too complex for what it's
worth.

> These names are supposed to share, not
> re-invent every time the name.
>=20

Do you think it is worth diverging from the User Manual to bring the
definition more in line with past SoCs?

The advantage of sticking with the User Manual naming scheme is that
you can easily cross-reference these descriptions with the User Manual
and find what you need, whereas "PORT_IRQ0" / "GPIO interrupt" would
give you no information for RZ/T2H.

> Isn't external interrupt the same as GPIO interrupt? How do they differ
> for this particular device?
>=20

External pin interrupts on RZ/T2H are more like the PORT_IRQn on RZ/V2H,
since the pin is non-selectable (as opposed to "GPIO interrupt, TINTn"
on RZ/V2H, which has selectable pins). Also, on RZ/T2H, IRQ is a separate
function entirely, once you switch a pin to the IRQ function it is no
longer a GPIO.

> And "Error interrupt to CA55" is "icu-error-ca55", but here THE SAME is
> called "ca55-err0"?
>=20

Same reason as before, I used the naming scheme from the User Manual.

> No, please start using unified naming, not re-inventing this every time.
> Order also is supposed to follow older generation, so bindings share
> common parts.
>=20

How do you want me to shuffle the order for it to be more like the older
generation?

I chose the current ordering because it matches the User Manual (and it
coincidentally results in an ascending GIC SPI numbering).

Do you want me to put the software interrupts (intcpuN) after the
external pin interrupts (SEI included)?

Eg:
  interrupt-names:
    items:
      - const: irq0
      ...
      - const: irq15
      - const: sei
      - const: intcpu0
      ...
      - const: intcpu15
      - const: ca55-err0
      - const: ca55-err1
      - const: cr520-err0
      - const: cr520-err1
      - const: cr521-err0
      - const: cr521-err1
      - const: peri-err0
      - const: peri-err1
      - const: dsmif-err0
      - const: dsmif-err1
      - const: encif-err0
      - const: encif-err1

>=20
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - '#interrupt-cells'
> > +  - '#address-cells'
> > +  - interrupt-controller
> > +  - interrupts
> > +  - interrupt-names
> > +  - clocks
> > +  - power-domains
>=20
>=20
>=20
> Best regards,
> Krzysztof

