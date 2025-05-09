Return-Path: <linux-renesas-soc+bounces-16845-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4CFAB12BD
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 13:58:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 77DCD5278C6
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 11:58:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E4722741A8;
	Fri,  9 May 2025 11:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="hdzVej+4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010044.outbound.protection.outlook.com [52.101.229.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01FC028F934
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 May 2025 11:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746791885; cv=fail; b=cFzQ1J+EVwWbF7CSw3mskO3BuSrqdlDtjNcRfetFGFkbV1VfyxFQq8YHwSXbjNKUu6jztd9ax0h+6bwyVlZPeSWS6W3EMpwNExnBr6I3vYGCw1cT6WZqpfmiyAOyCXy3FXLj96IhVU63FxAmXOBDSXsea6phrqz4o5aFMDfAlB8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746791885; c=relaxed/simple;
	bh=qbrsXbjx+ZEiEtRrOXUvtvAn5xXPl3q8q2aV1PJ4/gk=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Oas2ufLMG8ZIHuxxyBAi+tTzWox5Te9dZj36P9IkqUmDR51rc7sdhi4crc38DRbZAi7ydjFRn2ugkrlgPfwVA2xo9/4Nq8YTw5T72typpAEg6jXnuDo/Fc29Lnss8bwsCSkMJP52+8LK0is3eD4Tw7uWyOBdPUIbp5uMQB5+8rA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=hdzVej+4; arc=fail smtp.client-ip=52.101.229.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MPn2jSBIjTgSbo9ztknIHT1imIWS94rMGrqnjvWwT991SY35YLtsE5l44W9lpTRZTnvS4CSYb694v3l8vc+WjHEwMXRKp+AU6vblbNRGosCXpf3Aj5vYS1jfS6ouhIM5kOdoxpG+Bq52y5EvWd4ZnndUulfJ2d4PDth0mPN9ImC4nVx9EQMY0QiIadaIXmYtFdx5VUkcY18zuB5haKmpBVbLrKQKYPXMTaFunyXR1auPKQo6mEzUPP7xXzTL7ZldnsyeEkTQIz9OdN1mWTIQhUxVqfaD7IUN/85mXR9jSoH/OddC1c7z4ueqQO8icrivYTWQmhH9fdZkN8Mi0QVODQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GvBT/6M08i/mvVw9G9LlGWqc7tqX3bXvRV6Y+gJ7sBE=;
 b=qXtcmZI1xPZDx29qgdjISAC6HLNGaCsENA3trNUVaXDiyISIwUqXat1ohCRjQFrZ86/jaXnu6NrV2li63V4tlpNfmbzVG3DAqSrxI1/q3AuqAlPymN9eoRGV/25X7htKdrrDS7R+DUDAylO2MgS7XoBKIICWFX7s+DcVR7uQVF6W1cucyMdA+4u+q8wfqiDHkCK/oRwrO+WfdabERBIav1WejjNr5ccDwSEKw1z98uM74v4J/Qt4ju1s18OVcqJJdY0Y8lGnh2a9R8fHDvPLqb29WaH8pNj4szS0ynThiVuI8QZLqrDT9Orf2FrsXGorgYyIO+nvOfn1s3OpJS7k+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GvBT/6M08i/mvVw9G9LlGWqc7tqX3bXvRV6Y+gJ7sBE=;
 b=hdzVej+4/yE6heDcFz++4JAhr3FS1knBFEM4nReJnIRlOr9dE1wKva28ok4tGHgfoUkJi/OjAzP2tKlPYXxY527/Rlu7ootENjPz582zFSe7qvJ0KGsZVMew4sI2CO6CiY4wzUYuAGCPJ2ThACYzNh4LWXR21rY+d5kqfFxYdzM=
Received: from TYRPR01MB14284.jpnprd01.prod.outlook.com (2603:1096:405:21b::6)
 by OSCPR01MB15842.jpnprd01.prod.outlook.com (2603:1096:604:3e3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Fri, 9 May
 2025 11:58:01 +0000
Received: from TYRPR01MB14284.jpnprd01.prod.outlook.com
 ([fe80::dc7c:6361:a82a:933a]) by TYRPR01MB14284.jpnprd01.prod.outlook.com
 ([fe80::dc7c:6361:a82a:933a%6]) with mapi id 15.20.8722.021; Fri, 9 May 2025
 11:58:01 +0000
From: Michael Dege <michael.dege@renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: [PATCH 2/9]  Doc: devicetree: bindings: rename
 r8a779f0-ether-serdes.yaml
Thread-Topic: [PATCH 2/9]  Doc: devicetree: bindings: rename
 r8a779f0-ether-serdes.yaml
Thread-Index: AdvA2TWah5fzeMQjT22krypIc8kAwwAAGazg
Date: Fri, 9 May 2025 11:58:01 +0000
Message-ID:
 <TYRPR01MB14284C8E8145635A1AD8314F4828AA@TYRPR01MB14284.jpnprd01.prod.outlook.com>
References:
 <TYRPR01MB1428415607B42877B763427F0828AA@TYRPR01MB14284.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TYRPR01MB1428415607B42877B763427F0828AA@TYRPR01MB14284.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYRPR01MB14284:EE_|OSCPR01MB15842:EE_
x-ms-office365-filtering-correlation-id: 71c1851b-4f86-4e7d-878a-08dd8ef0bfae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Sxy2e6MGmY3szEAgnx0xkWSFTrTrfz4Z5xgExlJOOqbXnEYf1FgDDuFOmPV2?=
 =?us-ascii?Q?gtVK5s9l1SAy2KunvmHgos5bjLd3Tr+ezj8xCrywz6BiochdsRKWtds3UVyU?=
 =?us-ascii?Q?/EkXfgzllMLpkYJFG/+IzfovtUh4aHokavNOihUWULouLwtvIWB+cnsWW/Uj?=
 =?us-ascii?Q?5dZsBwOc9AH/QorrcHQNRqvMov+ubFb2grw/mprI9b9X5G6t1hBS+Ki0usB1?=
 =?us-ascii?Q?n9FjAuZZuPKx1JsZIxchHEwi7sDhEyy3cx/EZMDUgnMyFABTuHmIjCHnt77S?=
 =?us-ascii?Q?SVT/OFCjPglGuwLMr3avYe+xWHkIxwSe8GGLmtH/g8jKi2pH1uVnS3JkYeL4?=
 =?us-ascii?Q?FBxiLBT4+V/DJFLWWz9slY14ROfn/+qlCWzlBRVKjdx7ywyQRhhNwPn/zuev?=
 =?us-ascii?Q?zmE59r5g966qcdAt46kiITLzyMOQw7URHA5mFkQqiP2gd3aMBOAgK7ExDHLe?=
 =?us-ascii?Q?iOgT4XDh9KxjzqWVI5Z18k5Z5qCTVb5eK810jMHuM8uObWhg+fU3zUv4lq14?=
 =?us-ascii?Q?CBwvHANJLqo05l0OH2pCljmzMHsocDKQp/scbhGmrpQQvFtQSkgy0V6uMmhj?=
 =?us-ascii?Q?+VyNWrCNNpgc8v5ESav5sCsxvVYp7ew+fY0HdpbeYwq+ZqmajLkAxbreCCk6?=
 =?us-ascii?Q?Q938Qpd6J3kIgLC7vJGI+jZT3kriWheI4eS34pTlaVC17VrvWsG67AeNHS2x?=
 =?us-ascii?Q?//rkXKy3/iZOgJ8ikxMREWbfXe+oqv9HTHOc5gU5vmcYSPOSvKb8K5qDALDU?=
 =?us-ascii?Q?QS7gl9B4hYUi/g8LOgXs07NtkkyZtnW+ligkTik/DpRtavIUN2VbdmkbX4Ou?=
 =?us-ascii?Q?Y3UuVJE4yijOrk4Cs9kgF+utCQUIYqfdZzpq/8lqCkJuJflur5jBH/iIg1KQ?=
 =?us-ascii?Q?NUjITTLUOSbuUBmPim+k7ngwWGc3ef1zMJTHV3oXIGkH7Ix+Tlw5gDchzRyb?=
 =?us-ascii?Q?hM0X0ljRr8bZWh6S1KT6HzVxm6x5DWYMvyyco7hMXg1fU13emBzz5IY09l9D?=
 =?us-ascii?Q?2onqaN2Pki6X4m3W0A5AF9XbLQbADHELfZS4YW5Y2Sz3DK00v5ySUdZa4LVO?=
 =?us-ascii?Q?oFzjIa+ROBakZyPk9iqB+qwiHPz00Yz0lI9uAY6voEhPofXVsOcQSpSkEKpa?=
 =?us-ascii?Q?Hqlj40joqDXzVXiDokbXmRRJnPGZe+6USyLQ7WHywyhIG4m1Ay0QduGrXVw1?=
 =?us-ascii?Q?5WUeoW8++CtjQBNAWkyapuyUbREb9CLNNFtylY3Z4PGaikOzMX/orhOuHeZp?=
 =?us-ascii?Q?VRDwWT3Q+NlZ+dnd0Q0I7pss62BA1o0B+eJvxsICsWJXFJD/xG4xb64dTGo1?=
 =?us-ascii?Q?/UHIBG4ToZpe5Cbtva3k4hAB+EL++QGrBM4ZphBlumo2GFKrPlJvaKMk/GiB?=
 =?us-ascii?Q?lXdUxTa6QUmbbm2qNbSWTA0AZE38A59vNvCYMRX+PSF+2MYYmDpIoMVKC8MY?=
 =?us-ascii?Q?5V/c4y5UAeR9/laQgciizvSiq74OPkgBKb8uYxr8J3kvnk/KTFegFpRivf92?=
 =?us-ascii?Q?MdAgfOMpcjVP+jw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB14284.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ot8zaHQfjnvOaBJraFwhap5vU00HnL+KDsrlJhebJJHf9yZpIMMtJOYJ+VyV?=
 =?us-ascii?Q?/NQVHhJsQBrR0f5TG7u4tFGkdXqcK4ErjXWqmH+4hx1AD7opkMqSprVRU8ZT?=
 =?us-ascii?Q?ReVKY6hbTeu28FpViaJU9I4oHlveU0xxh65qM6ZBgQFbVIeYstBYaXt0mkQF?=
 =?us-ascii?Q?4rPkRvz/T1Tsf8U5XwBy1kyZX+pXeIOCIRnSvE6LTgt4ltaejQTt4OcWveLL?=
 =?us-ascii?Q?lRslpufwQdSQbu/nPgAXLzOAQimQnvB0TAK0GzKqjDuduWz9TdnOR36s38cE?=
 =?us-ascii?Q?YYExjUecVIBbhJhtGfiIK0yOYAfv0x9QL93tBQ74Glsaq0tznMzVLuwzWpZI?=
 =?us-ascii?Q?KSgE2L3uwIud3FS1pslFbJmV+vJsGVIF2EhArLg2cHA1hAItxQxZTwPOgu/8?=
 =?us-ascii?Q?6LuodxoTG9hKHfcJ+1LFqvsGzJCgZSY5nuB32Z4mM7XEQ5Lvjr1+qgVBUNeB?=
 =?us-ascii?Q?6zz5IwGZ6WVd9KEZWlo80OeGDsXu3NBEpTTB0WTUVJN7JUcG3Yzbjo+ztBYI?=
 =?us-ascii?Q?S0g2qXFVgEia8fxHgKUBTTC+Qi+45jhxYXS46Da6T/U7VmxpBjELwqKIx4B3?=
 =?us-ascii?Q?Y5SroLlv76ar+VSXrYoA55JDIt7tYCZgnvIeLs7zSfQFQ3UbrJPt3XKnAtKl?=
 =?us-ascii?Q?UwLsZI/opwaSUJ48ke+fyg2FISeUl6cAIluXIy7VT5tFxNlr5rYMY+X14TTx?=
 =?us-ascii?Q?ZYYjJK/t+7o1KBFMi8Ma6Y9bnlrIo5viwcm4LVi9SM8n+hn8a5jvNoHjH5qy?=
 =?us-ascii?Q?rjwcrJGw+kRX80t+0PoozfuFeijh40nJs2QhkE0vC/qT5FutBxiCqzJFG8cj?=
 =?us-ascii?Q?MHOmTj0VjvvF2hwyMYCD3JnMOXV0YQP/+VpBUnJeR6Pj+57WEOm38f+BXEyr?=
 =?us-ascii?Q?aOuFDmGAj5n3IMDyJCs6OuyA+AogoLenMP8xyaqxcD76esdWfrn1/iw0U9Ie?=
 =?us-ascii?Q?8SfVCA5wQrZSczVHJMWubIJ/G7AfMz77lVXnF9XrAinvg1rCSjFHAPHjxN2C?=
 =?us-ascii?Q?bx2FQTKKlucpP5nZupqPCC2T2gRVsWK7QWeKaJotAqAZr59oAD1fkwO2rFLW?=
 =?us-ascii?Q?bYAueHyi4C2RclOmif5vufU/Ck4y+1pAQOSGNulGQIlLBe4ua3QwMfJu7+l9?=
 =?us-ascii?Q?1t5H73OftRfjczsrwM4m+CXHZ1VbmKCTDpL29Unq843DP41fHU1j9cZwyda9?=
 =?us-ascii?Q?ypxtmM+VXNOKjy9vaWOy81xM8RriaQyc3mRDwR8Mdsq3Bu0eGA0e6jXQX3JH?=
 =?us-ascii?Q?ZtshGk2y9WxBTjBfbAqLM2ddU/KBka8peTSNxiTNjiVQDTNe+PvTf1teRxLW?=
 =?us-ascii?Q?CDRWiUtgF8rVKDUnH6FzMwdOQEf+kuybETYB1tzQHp+IffUm9DQOTwCTYOAk?=
 =?us-ascii?Q?G8i60XSEwimuixKqo9jSYuGWkgloWlAFZN0zeH662vEiuC3bVfn7fGy2L4cU?=
 =?us-ascii?Q?cH89nqhXElix3MbICXXkfqv/VEEyveQp4qa98Oew5RF9ro6D6Viq+6mOXjFd?=
 =?us-ascii?Q?TvxSLcXeJ+CTZrDalrg/FH3putdkpuQGm7cXT+GTxMbXX1x+xS81FRyFidPm?=
 =?us-ascii?Q?jaLs4Ns+xOTGDIEzuWv/ZMtgweD1W4WQnQ1j9IYZ?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 71c1851b-4f86-4e7d-878a-08dd8ef0bfae
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2025 11:58:01.5447
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DFezuvpWQ0VzJOMdRA2gCaEhq159XABvc6XpCN7VFLu75hEZEsBRA7TY1dJoq2/PyOIUjfZYzans4dW21HGj2MXYB1vooqNAjDrraihc5vE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB15842

From 17e2e2044613eb2e738fadfe2b776593759a3994 Mon Sep 17 00:00:00 2001
From: Michael Dege <michael.dege@renesas.com>
Date: Fri, 9 May 2025 12:29:58 +0200
Subject: [PATCH 2/9] Doc: devicetree: bindings: rename  r8a779f0-ether-serd=
es.yaml

The updated serdes driver supports multiple devices. The original name incl=
uded the device code of a single device. The new name is more generic.

Signed-off-by: Michael Dege <michael.dege@renesas.com>
---
 ...a779f0-ether-serdes.yaml =3D> renesas,renesas-ether-serdes.yaml} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)  rename Documentation/devi=
cetree/bindings/phy/{renesas,r8a779f0-ether-serdes.yaml =3D> renesas,renesa=
s-ether-serdes.yaml} (100%)

diff --git a/Documentation/devicetree/bindings/phy/renesas,r8a779f0-ether-s=
erdes.yaml b/Documentation/devicetree/bindings/phy/renesas,renesas-ether-se=
rdes.yaml
similarity index 100%
rename from Documentation/devicetree/bindings/phy/renesas,r8a779f0-ether-se=
rdes.yaml
rename to Documentation/devicetree/bindings/phy/renesas,renesas-ether-serde=
s.yaml
--
2.34.1

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

