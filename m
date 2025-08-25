Return-Path: <linux-renesas-soc+bounces-20933-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFE0B3354D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Aug 2025 06:41:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 516783AAEF3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Aug 2025 04:40:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE1AC2868A2;
	Mon, 25 Aug 2025 04:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="CclWEY+G"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010067.outbound.protection.outlook.com [52.101.228.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FE82737E0;
	Mon, 25 Aug 2025 04:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756096642; cv=fail; b=OGHQhsL5Oygow7U1JPOcVrluljWJHCNWBkbLYboQWDt8cX5C4Ywm1FWjj4QEUJYKeuKQcmy5tVfRebEgDRmTehX2ZA6wRrYq5k5DqfNiinLRSx2DldX52e0qPZom78Rs92q6JvBnzrtU7ltR9rxi/VGjVt38QmEUrO7MlvBya/U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756096642; c=relaxed/simple;
	bh=qjbS5xW+xTCehS8iKdheQP6kDotGdWupYADBfPSeIWk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hTb7KTOI14r3j1UL6jV+4DH9D0Qxq2rZ7rSpECG8S/FKFaHQdw6T6UJPx6S23Vqq6zylRrE3LlzUyU6HbxZRo25dZVnQfQ1MhXmhS5Yrodt16JUgD65dgKP8jr37WhAVXZgcV8pWoao8m6Au6yXfE1AWeiUB+TQ/Qo1Hx3IetXc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=CclWEY+G; arc=fail smtp.client-ip=52.101.228.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V2P0oZBEOfvrH3kfko60/7FH6eYzs7pHNcJhBGL0uB/IHRf5qD1JbKdle7Gys4NHgWq0gemILTfmBO0uDzeLCTmaTEdRidgoQC2McDJhvLpObt5cYQ95AdXXhwImln3jRU0wIxNi85zCSQzG3jop9pE1odjW/3Z6XF00cJInTSnZEQ/Suu4woiI/PofITpae100Hiym56rPiCJDQZnWK0/sVvj9q/nmAD0Dq+20QiY3XNa6w777ub2INpN4sopY0bkJeJC495eoZhhgSFsJqtxF5eTT4LRmVr5Sf59eoRlEW99JwMW3GpsrEY9gTXHspKun48q8lSYHA7QxQfPSMIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cJrE8pewps9F0AFfs55jym/LsV/aM4huCfw5nW4v/9g=;
 b=c1eD/MUNor8ZVovrQZsy6iU+/0UO2+OPckfJEA4g0naJZqpzup5uuUoVm7TvJopjlX9JrH0WJcYaIGfs/bovw9DBGxID5O06QtCk4raG3aWpAbR8g3UGzkbnMcIBhmIxG0eV/qvKSutS7ItAhOmfkO/QdeD4otWmJwiPSV/FJdekURvgnGN0AgltUVMobIVpX9/Ehae5nunQyYixGAiFHTrfgw9YnANtbYV1zO6H0gqgupFCLBP0okchsguTojoemnG4QOahBCSVgH36FphhpqoTcOD3EzmOno2gwi/ucpvzxvubocThyjtDowFpcqW0Qh78ZbWD81vBzjs1QcBUfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cJrE8pewps9F0AFfs55jym/LsV/aM4huCfw5nW4v/9g=;
 b=CclWEY+G8T6X8swMEdhK7wGD38RM1YHs5sANApP+BoiyPxOCqicyz341XQZnw3LAUxWZ3lt2QoKcNgtV0B5pWkPBBr3zDq3E4EGpgZUcfLZWyUnFOn/a61gs9ONQ6W2ucdIhqvQms0Nqfn8Q1Rc31ijHl9r0c3PzyLQ58oW+lHY=
Received: from OS7PR01MB13703.jpnprd01.prod.outlook.com (2603:1096:604:35c::7)
 by TYCPR01MB6718.jpnprd01.prod.outlook.com (2603:1096:400:9f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Mon, 25 Aug
 2025 04:37:14 +0000
Received: from OS7PR01MB13703.jpnprd01.prod.outlook.com
 ([fe80::fde:76ef:aab6:f60a]) by OS7PR01MB13703.jpnprd01.prod.outlook.com
 ([fe80::fde:76ef:aab6:f60a%4]) with mapi id 15.20.9052.019; Mon, 25 Aug 2025
 04:37:14 +0000
From: Anh Nguyen <anh.nguyen.pv@renesas.com>
To: "geert+renesas@glider.be" <geert+renesas@glider.be>, magnus.damm
	<magnus.damm@gmail.com>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kuninori
 Morimoto <kuninori.morimoto.gx@renesas.com>, Duy Dang
	<duy.dang.yw@renesas.com>, Duy Nguyen <duy.nguyen.rh@renesas.com>
Subject: [PATCH v1] arm64: dts: renesas: r8a779g0: Add new gsx node for V4H
Thread-Topic: [PATCH v1] arm64: dts: renesas: r8a779g0: Add new gsx node for
 V4H
Thread-Index: AQHcFXnu2CuOuzJNeEeVgv2a1gJvqQ==
Date: Mon, 25 Aug 2025 04:37:14 +0000
Message-ID:
 <OS7PR01MB1370309A85A300195896C0619A73EA@OS7PR01MB13703.jpnprd01.prod.outlook.com>
References:
 <OS7PR01MB137037775991BBBDB29E54105A77BA@OS7PR01MB13703.jpnprd01.prod.outlook.com>
	<87zfdw2wlt.wl-kuninori.morimoto.gx@renesas.com>
	<OS7PR01MB13703B662D2AE6ECB77F59584A77BA@OS7PR01MB13703.jpnprd01.prod.outlook.com>
	<877c0z2vz3.wl-kuninori.morimoto.gx@renesas.com>
	<OS7PR01MB13703654640293E4F1F95B694A730A@OS7PR01MB13703.jpnprd01.prod.outlook.com>
	<877byyzjcm.wl-kuninori.morimoto.gx@renesas.com>
	<OS7PR01MB137031EFD84919AA36666E1FAA732A@OS7PR01MB13703.jpnprd01.prod.outlook.com>
	<87bjo971ns.wl-kuninori.morimoto.gx@renesas.com>
	<OS7PR01MB13703647C4AABD03C6345F221A732A@OS7PR01MB13703.jpnprd01.prod.outlook.com>
 <87cy8k2uf1.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87cy8k2uf1.wl-kuninori.morimoto.gx@renesas.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS7PR01MB13703:EE_|TYCPR01MB6718:EE_
x-ms-office365-filtering-correlation-id: 69a581f3-a1b3-42c4-1755-08dde391109c
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Tq25XtiTnHcQ46m2y0YI7GGiDEP9L/mHr4ysO66Ye/hfwFCHvXQbUPgr8G0u?=
 =?us-ascii?Q?zx+3Apu3u13ZjbEFhN1SmeQPLZq+BACHlKduJHcJim+J1NaIkHGjnZ4qggj+?=
 =?us-ascii?Q?ZDw9p+iCZm1SPV2UXmS5FYZm+Ak7ic8iClbblq25weZqlk3B7y7Hyt7edmmR?=
 =?us-ascii?Q?A3KhKUno5VYftPeKTlRwAQa+SiYt5V2sDsTOiNCf3cKU6YWl+ThGVEJjTEFw?=
 =?us-ascii?Q?PlJic7uCQjYmyynXsBVANYCtVn+V30tv+fbf+ciYqMjSvRAkOxfhxqXq9SoA?=
 =?us-ascii?Q?I60RQHWsdIZFb9hNeWLeoWHL3QgjNsVep5W3VRwCKyJvj4UaqizPQQmnNI7D?=
 =?us-ascii?Q?TD6CAgQoUuS3vMKqDkAXG6gj2XbaRjkDqtPWcd72mpkXDIWnvGiDgWr2xjjs?=
 =?us-ascii?Q?w5cf4sMRM3VkoOYxQaCvr4F6fC7Foi35KjDnvF4IYQyce1EqQS2Krqa0kWHb?=
 =?us-ascii?Q?EEyJifjyVt2ei8Oges7ED5SThRzXAsp+xSSlu57q1XJHu1574avFomMSJh6M?=
 =?us-ascii?Q?U88Od0YVuQ1kizEKQgxsbrWNIs8SG2DHlfNVA7S0dhErPdnZLFAhG8/KCgEk?=
 =?us-ascii?Q?HWLsCdG5STsfo7t2is1KjtktScceioN7L8eyWxq50d7hq3khjXkACO7Y3aLA?=
 =?us-ascii?Q?I9i5Bx3waggFHye9IIaEPpPwA+i2rljkMSwEvwxp577sJQTCpG9liO7ua0sL?=
 =?us-ascii?Q?Qsl2s+HN1r+KlQVPa0oBWz+d1bDXpfk4UEEOmPp1a3fQLG0zqNy3zAwPRKNG?=
 =?us-ascii?Q?412Wo+HzWxhxvHz8ccUocQXZ8yBk9W9Ke5l8k5U0uUdjDETGAFTmcSFbFQmY?=
 =?us-ascii?Q?HP+duxoB+1kjh2HQo6A+cQf2kDAeaztXoWYXXs/2ozBnqtHxPjp9Fv+RYfDb?=
 =?us-ascii?Q?/Fmz/nHIuEMWq++ZkamWYbc/bXWEUZSWZI7YFQUIngbbKj6LPo4gwvGqRXhj?=
 =?us-ascii?Q?l5lA7cGL8Gr3AQKk7t0eFw6al82Rg1r+q/J2IyS8lg+kN+g+2QpcHPuW51NE?=
 =?us-ascii?Q?8AYJHPz14uFolFwNtO9kd5r6gvJ1MnmyTBaHbjw444zFrut9TlZcyba3YJ6F?=
 =?us-ascii?Q?RJL0el1L0LfTu0vnXeYQtZoNVRffc+nzLYAjopAiThKiOAb8fOQnAIKOG17c?=
 =?us-ascii?Q?/xiH2F1jhGkkOPMH22IWAeAMg4HyV+wL8TyQD+3LzBKPgIh7wNDDFCeBC8nL?=
 =?us-ascii?Q?jqP1Oz/gV2r5bxBXeIh5J4sf269mzsqhiZGtm6p33WZR2s9Y9LGZZXYYlfLZ?=
 =?us-ascii?Q?roFpp0IHpBCbhqtQMgC7uTkp/D5CuiWK6yDM7dXvZXWwt70kFLcn8EtX6ORZ?=
 =?us-ascii?Q?n0w2N/aAlBiSU0lHlKdofjCya1F56aGgtHRoTijDcRAkNZsr3t5I02aBNOk1?=
 =?us-ascii?Q?KqhOg0DIKfgTjvMH1vPBkLn/XJh+5SaR6cqoYuByN43xMX94EnE1GZWYjUGR?=
 =?us-ascii?Q?Hj6DDIPERtFARiSFY8zfkyOOy1q7eHaX5Y3yfc1j963XOvoH94d6yg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS7PR01MB13703.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?8j9Rpa6XvXzQ8gIpplcHe94VIwmX2h+oZDnQAg3WCg6dfYUZvFqEW7TcfYHT?=
 =?us-ascii?Q?qSlee3gJtMiGBkn6+/DrAyszLFGVq0PvdF/w7kN2fMcnqcGyA8B61ctCtqYi?=
 =?us-ascii?Q?gb+lK9NuMhQ5xkQoikNv7c37tK9uxvk4eR2cgCj8rVBNA8NoUtqSLEStrodW?=
 =?us-ascii?Q?0fiJbKAFMUvF1OOo7SX+1SYV+RdB8dLemFscW36YdVkquAGUiar4soZTptbZ?=
 =?us-ascii?Q?a5y/zhiFi14FS2M50MvZvxBNyzEIuCHAUZQAd5qd40s2Sn+xSkrmB8Okvaqt?=
 =?us-ascii?Q?8mM+hdZZaZ0mUqHcusD8W8vBhCmwXiwIaJww6li/fqfOwpLTvaoY9zUrDori?=
 =?us-ascii?Q?0eTjK87o10F9Yq+Lp2at8IZT5qCpJmE4Kaw5JiRk3fQsxuBkAwLJko64u5xb?=
 =?us-ascii?Q?x+3BS6SPRXKMLl/O4WvuVMfmgLx0JwW2puC51DkmbPj4sBeQWhG16yDTo+hq?=
 =?us-ascii?Q?eCernL6wd4EV+++JJoFjjYkamJmgfzIeMXPJ4Gj+I+b6TjzLu4RA5NCJjo7G?=
 =?us-ascii?Q?sgP6MDQTuEXVmidHtNOwKO06PriILtR25wogCihu1qIXawFpkveyVOTsVcNh?=
 =?us-ascii?Q?xyPkrnmoVDJt8eqKYAE2Pa3qY2RqBOAMarE3v0gIvydc2/aOp64TPt0k5juk?=
 =?us-ascii?Q?ffQ3ySOVnvQxd+1FmCGX7Do4gpIPVx/JGE/LyNClX836n0sXRva+nFCaJH/H?=
 =?us-ascii?Q?szW2k1luzZNLcDv464lH1DQWjYJmEl6Bs6Qp9SDkGsBoQV5cztZ0ZLdDwJqz?=
 =?us-ascii?Q?P4JWAgUt8Wflo3HLt77oyy60AOMgPENSj/RK/SUsGgWkJAJzqSiU0zFL8k+J?=
 =?us-ascii?Q?7xtBP/Csm9HLdXIRHFqnkdmWNkVo8+gH4uf/mzxRgjqNShAvhRizlkL0ptvz?=
 =?us-ascii?Q?KN0lhy3VTR8G8F6x+CimnW9+FsrzkSmk5j70iTU+bNw87X6ZkyQ7NrWpFzNQ?=
 =?us-ascii?Q?geoHN4k/4SvC5fPMH0PFqyxegRPwvzVJ3FT3GywH8ZxTqw6Yr7g4JoIB3HZt?=
 =?us-ascii?Q?ztV6LN2sqV/sCMi/bc7puLETriNhr7xKoQ414Y17pHJ834G9JWNKZlBHAe3o?=
 =?us-ascii?Q?0hWc02ujf18XYBMecEt+DRbroAvsP7SuwywNoc41yYU0N/lskJy/uU+o8GLL?=
 =?us-ascii?Q?CpqNbvRDy0wQVHX1Sx5HGqpAzynw+JimD1YIbTM2jK47SVvSmsv7jZfYBsv1?=
 =?us-ascii?Q?mp+9k92kgjrOCR/lwIvOq0BGnkq84Yrzk5eqA8c3x9ByPCzHTp+iK4/uCKW5?=
 =?us-ascii?Q?RmPuKfLqcu2StqpDvXJt6iksnHs91OQJQEi/AbSgFGApQqJ+z3RX/Qp+grRj?=
 =?us-ascii?Q?GVZ7VgSfYnYNjxroa1NWfeUgioQQQj//8RnCJ6WzRzcwKWbfUySBPLCzHjLw?=
 =?us-ascii?Q?+sX53gkyqQEu0QYguvrNIdM4TDzxR64NItP1XwN5gMVZX2G7Y42KwIruvfD1?=
 =?us-ascii?Q?5dh8YOPp1oc+fp1lXbLXzkFf8CyNmJ7QqJ4dr94x+5qguJBizUW2Ndo0KzyE?=
 =?us-ascii?Q?yjuQFvpx++EbW5hc9sIHUlFQ4lkNX1Q3mPPNUD1R+jv430fyxl8l4pgl2JpC?=
 =?us-ascii?Q?wKj/6VslcCfukJXaDZG7Ae0Tv/+ov5rN6A4mV8PlcWxF5JCD8HvPsmyIfb37?=
 =?us-ascii?Q?FA=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: OS7PR01MB13703.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69a581f3-a1b3-42c4-1755-08dde391109c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2025 04:37:14.4289
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vEan0LxCMQv1GTbLK/UZx4jg762UB7LpM0Jyylp6KvRoN13+7bF0t86lpBkd7YwNHDGJBHdB/pNb/shRf6ZZQBK5hunyYCwU+nyt49Bn2Ok=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6718

From 8a8391bc4ceaac5248267851b71c9cce6b5c434a Mon Sep 17 00:00:00 2001
From: Anh Nguyen <anh.nguyen.pv@renesas.com>
Date: Thu, 21 Aug 2025 10:01:30 +0700
Subject: [PATCH 2/2] arm64: dts: renesas: r8a779g0: Add new gsx node for V4=
H SoC

Add new gsx node to enable GPU for V4H SoC

Signed-off-by: Anh Nguyen <anh.nguyen.pv@renesas.com>
Reviewed-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dt=
s/renesas/r8a779g0.dtsi
index 744b482e9ff3..1913cde3a3c5 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
@@ -2121,6 +2121,15 @@ gic: interrupt-controller@f1000000 {
 			interrupts =3D <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
 		};
=20
+		gsx: gsx@fd000000 {
+			compatible =3D "renesas,gsx";
+			reg =3D <0 0xfd000000 0 0x800000>;
+			interrupts =3D <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>;
+			clocks =3D <&cpg CPG_MOD 0>;
+			power-domains =3D <&sysc R8A779G0_PD_A23DGB>;
+			resets =3D <&cpg 0>;
+		};
+
 		csi40: csi2@fe500000 {
 			compatible =3D "renesas,r8a779g0-csi2";
 			reg =3D <0 0xfe500000 0 0x40000>;
--=20
2.34.1


