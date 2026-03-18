Return-Path: <linux-renesas-soc+bounces-29756-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aL72GceBumldXQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29756-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 11:43:19 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3AA2BA1BD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 11:43:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 07C17302336A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 10:41:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2607037CD27;
	Wed, 18 Mar 2026 10:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ZmjytHhE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010061.outbound.protection.outlook.com [52.101.228.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11F4365A0F;
	Wed, 18 Mar 2026 10:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773830509; cv=fail; b=cmXdPG7TvYvCZTyGyNVNBVC0KGGQ0PneHByU8B11JSHvN2Cbcb+fizrCwZ6AwitDB9TXbBAovAe7raqJfkLmdAuNXn76X6UpzYEgKfXwLOQioM/2Qg8i4NXd8PjQoH4m36Vqiw6n+GfauTxj2RN9scDE2aOSUSlAdYQsc/0eB0Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773830509; c=relaxed/simple;
	bh=JaffZ83uMkeGSobtkUu8Fk4bFyLRNnYcHpCRZnAlcic=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CObULDMM/LaRS+G/e+gqOGrvokdDTs+6yMvW0bG5hQ8AgNcRYJHUcJcXPL+zTrpVA3gjdynzuA8fGXXyorm4OoOePWBEf+Q+5wDXiDj5Is3N7BEaVNj76QUeCtfPNTxctPw9c5R3aWR1d40L8OFG5t4HhSu/9DS+v6ob1fgJeow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ZmjytHhE; arc=fail smtp.client-ip=52.101.228.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dHTPvSJYC3mynShT5gqvyUVcQWSO7JoHBcGxLqwVubz2iUzffwzxyfPPi/FhZ7Je2RPw1vz1/UVthBK/nerfeh9MLFzAkk6h5EpOXQaIpLk0cwmAGnoSmeibLCTFG9EnSglF0no1Awu6GBc2YfRveh69Owo8iUUFX4P8+G+JzVbi1G6ocQ91xUrnrtowpWv58dYZ+tU3CEeXcLYqBV46D0Zy48Fy3t61S1eo3oG8DmcuSOfdSvXR4ztoWGpc9nKAGxH1atGB6X7ew5vx5pk7VBQ4zjn3m8kup1jYIFxYOHjnJKO/TR7CEaesCbF8CgMa1O5P3QtVNPzfp1ABe8/ipg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Yn9wMOkEhavetx6j81LIZjKd7IcVWLupAI0ilzCga0=;
 b=BqX+4NTdXR+lHWpeJim7Q00Rm1kBPqQnbdRl63ojbsULQ4jxf0gIw5ARipWrpb3neJF5PhO6fMiiJ9qOSquyYJnxcHamP39DqSgKee1de0Z4JDsFsYGTrMw3iupfk5cR3VlARl6sOfBhELCes6eIX8kl6HLI8/xj4kHNbFfyII1YOLWNdSKN5IlJ/hNv8uwmqr2/b7MoKvmpXgBoxQd69niBXCDP6g9V52QXjT/RhcuQpHBcW/nXB8XG+ojwPmB4mOIXBEEorS7kIA57j1MY1onbQ51BwKK/nkTchcDXJ8/Ha8DXUu9n2sMFQRLjGrbgSSz3pygHyWg5T8O9/djIVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Yn9wMOkEhavetx6j81LIZjKd7IcVWLupAI0ilzCga0=;
 b=ZmjytHhEdIae7gHMnJHvJ9dGNiEPaMwuM9CwNNVscA/yBt+eg9y4xDOconJ/af2/S4B8xq/OZ6Ps9z/Vj85M4V71nWueMb17jaqE62MbqDwO2ksbWGaWiM0Jyf3gp8S9f2vJ7ytax/PnSPV5sSIR+DD0KOzfyq4vUfDk25V/wrg=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS9PR01MB15495.jpnprd01.prod.outlook.com (2603:1096:604:3bf::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.22; Wed, 18 Mar
 2026 10:41:44 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 10:41:43 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: biju.das.au <biju.das.au@gmail.com>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Steven Price <steven.price@arm.com>, Boris
 Brezillon <boris.brezillon@collabora.com>, =?iso-8859-1?Q?Adri=E1n_Larumbe?=
	<adrian.larumbe@collabora.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>, magnus.damm
	<magnus.damm@gmail.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH 0/4] Add RZ/G3L GFX support
Thread-Topic: [PATCH 0/4] Add RZ/G3L GFX support
Thread-Index: AQHcq92jqlOikktt60KW1zPKDVgZpbW0L7rg
Date: Wed, 18 Mar 2026 10:41:43 +0000
Message-ID:
 <TY3PR01MB11346576B64AA81E5E9E3D146864EA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260304134845.267030-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260304134845.267030-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS9PR01MB15495:EE_
x-ms-office365-filtering-correlation-id: 3e9476c6-b206-4d00-a73e-08de84daf279
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|22082099003|18002099003|56012099003|38070700021|921020;
x-microsoft-antispam-message-info:
 ClPDazLyDL9qPYVKh+dURdNFH4z4oX7DEkzZLQ145AYcm4yskz577NYUZ9n+1ExX3y9q1a8y2J6KlZb1YzBsLfRgENCsGYSN3aG+9TqAF1+YlfVVkZ4NZhqrYW2K6dJn88ziP1ZE79swZBsJ/CQi9P1wSQjoqOe9J4FOSU4SjiER7dRE6xe9Ncvp0xIr8sO5u+j1xTnl083kxk7YwBINUKtWdBqvMzZ5kR2t/9FE66qcKyABPEORwlTgolIPlHL774xoA6swC84Y52wckVEemaLhRpt2Z1zQ9zVtD/rB2+6c6AjO2zA0l9Uoj/HNl60ZatFYtVSE3oyLeAMbji4K/RBOC4CZyOffxOeW4fJnMC1/xxBc/9uMsdcmAUQ/2kCXnwZDnHxEx8nS0JXEv7hu6WVvQoToc9vGOk5f6S71prxbLMF5C7kPkU+0etrnVUqsU5vMeNope0/p5KEDeDZD1I7CcZiOhspNxGpWg18MKSkLkOqrxwpd+A9/ijbXtjmE7U/TKNK8L1ibd/jeMdX8np20y5j5cUT05rS1w6nNVJd+A++7oO/HcKSgJCoLboZ9MfbIS4J/7KTRQ8nJHMr7LbwyzSyZlJchXfSNkWygjaZUsl4ek/Na1TX1osypT1z3zlGZ43F226MqqwgVlCTkMetPwwIOPfHoeAqT6JArM2/3tb9pyfUMKfb9RNj8zLvxbj0+4iw0SASpNaMHTaw13YV3zca9sBKO7SL1Up2Aw8JKnSH4I61xo7jT53vmYwxkM5AYm2gDR4ncwyexVihtnFNhbmmZX6Doji59Yw1jilh3NkS2EP5M3Hsnyj/tqAkb
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(22082099003)(18002099003)(56012099003)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ow4vumcY8UDU60KW5/igkmQt4ZBbfWHm5ClDzDggk0CDqPyyiqkH6qiRlt?=
 =?iso-8859-1?Q?Vrkahn9iYzIt5eka2UvRbVUKuVUgueJsAfmJ/FyqjcRRqwyQ2S+tbkpj4N?=
 =?iso-8859-1?Q?MmQgTm4yFTbP+I2I6PCgeAfd4vtt6FNS/M3AOIvqTDbxsW/3dSIdX3bIes?=
 =?iso-8859-1?Q?SueQVYocmpQB2ZhRIg1bDPVjuHAR7UpfqSSCFq1rZNT//0BiL1625mJBDZ?=
 =?iso-8859-1?Q?ugUrqOulC8x2TYvOYspvDnhbbiHGq3gJSlY/SaH3132cJe3OxvGsmho7yR?=
 =?iso-8859-1?Q?EGqFrBGQnF1+2yfvprzmasTdGY0X1kmyW5Ugl6R5oDkuyjHgYduU46nvbM?=
 =?iso-8859-1?Q?+kKKnXZGwwviBQKYkBPRx29exseX2VTf/aDDViq58dDL3r2q802i5boQQu?=
 =?iso-8859-1?Q?PiFYu7B9UeFnRLWzO+u1I6ihzfwgtaeFKc/q2VAuwX2iA3okDgYZWBsfOf?=
 =?iso-8859-1?Q?CYN5+NxPE+zITc2k0Fa4qZbMaQEV+Yp6Vf1nf+JTOLhzzX8yQjACtML4Zv?=
 =?iso-8859-1?Q?s8kJ6lIed/BG8IW066WlfGlyjw+1HAzZOwoNGPdzBNRv2sW6MrjIOw8KNb?=
 =?iso-8859-1?Q?Dd46Nvi1hka5mtOxuvPkpqqYNaS5Yk5TZsufydmZVpqvO5FTYL57MK5/OM?=
 =?iso-8859-1?Q?1ziHmvFDc7G51f5TtB9+G2vcAsc5qYrBDqBKcQcobudVfXzN66FqhY7lfO?=
 =?iso-8859-1?Q?wh8plj3aSsVTbj+/OhOCPTh2h85wm6d/PA26HKkuEZjdr2KSu9sK6eCgaY?=
 =?iso-8859-1?Q?EgxVbH7PxyKl9ESpy6opbrhde8IVWbARewKNBJ0sGhIiUyCSc3ALon5BWz?=
 =?iso-8859-1?Q?3RT3cQ+S1jSZIG0eh788OCOqArNIyWIRHXo+y4VcezROLzzm27E/61683j?=
 =?iso-8859-1?Q?2qHwxSx9+G5TNmA+4rKdd/m//6uD6MH03fTfeZ0gNVnyhmhri0v5dij5Ik?=
 =?iso-8859-1?Q?IWvZUFiPOHHmhBXvfMmyyS99HLXkwgPKZT8nGMnP4/m4kVV2IgRPouIthY?=
 =?iso-8859-1?Q?bqT1uf17SpWbCl3CDVkorPvUZEUQKtSKQs2W9N/VS1O6vzaqOAAkV0c2Am?=
 =?iso-8859-1?Q?l0aBrSigJB/yUJv2XN/d4F8BVhUF7bKdR+scRuUCcOmZZqufvRIsvsvZ96?=
 =?iso-8859-1?Q?uF4teK2ZmZGxFhWm4h3OIlosfVMJDbwabCFZV/VVgXpdMAx+Yzuo1rAiW4?=
 =?iso-8859-1?Q?8TP1Qee0tWQdSELx/boCGkgkauToJhugUg/KI36OaPVLT8wh7aSaf75tp1?=
 =?iso-8859-1?Q?g2TdO5pFFfwV3L6LRmGPx/AyHvKh+cZ+rXKsE/6F0QheF47RDTdTw1jC4l?=
 =?iso-8859-1?Q?rb6F/wk7tDGQ9R2X7q+HbLpuGzQcsLkesVLe5O1hJsL6yP9oIYo1bBQyP/?=
 =?iso-8859-1?Q?FtqlpadajUVfJa+P9TfIV0raHqC7iFgPvqvirVaZrxEHhwbp8hwv+ffwXD?=
 =?iso-8859-1?Q?K/rxWyrsu+7togDbyjfsGveZwguMg7t2vb5GEsUDQOHGQhOx6CDgezytWP?=
 =?iso-8859-1?Q?1EST7m0TI7s2cUmG/KWM/7T2Ki/BgaqukEgvbCUcGKzke2PaMMAexIFsn9?=
 =?iso-8859-1?Q?8ufgK2BQeLnC19IowW8kDp6N3MNR04l3QL+fniHSaDxbbejXLI3gJirVAU?=
 =?iso-8859-1?Q?QnX1lLvvpxav5sDNlurk49q8Y/P4mNkm4rMh81kM+u4bWPQLUstT/3nDVt?=
 =?iso-8859-1?Q?797pyXHM3U3yNWBYqwW+YO+/yH591KtV43DoWWwUj8EkJnAT6hI5l+FRCh?=
 =?iso-8859-1?Q?fTWQmSfH4Hu8NPuxCjfqRI6aZi1+54ieNX0aKk3JTetajD0b+otadqGl6r?=
 =?iso-8859-1?Q?zRFzCz74rA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e9476c6-b206-4d00-a73e-08de84daf279
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2026 10:41:43.8849
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EFbtUt4X94T5dUS9Do4+BgX9qNU+SaGJVCYIfynAkc0W7jn0zZSsLuWzbLrpEBjW+TugiICKKImoJqdGsxuO0MioL+Nh6xT00iRXAK61DqI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB15495
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29756-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,arm.com,collabora.com,linux.intel.com,kernel.org,suse.de,glider.be];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,bp.renesas.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Queue-Id: BF3AA2BA1BD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi All,

> -----Original Message-----
> From: Biju <biju.das.au@gmail.com>
> Sent: 04 March 2026 13:49
> Subject: [PATCH 0/4] Add RZ/G3L GFX support
>=20
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> The Renesas RZ/G3L SoC includes the Arm Mali-G31 GPU as a 3D Graphics Eng=
ine (GE3D). The Arm Mali-G31
> GPU is a graphics acceleration platform that is based on open standards. =
It supports 2D graphics, 3D
> graphics, and General Purpose computing on GPU (GPGPU). Add the binding a=
nd driver support for
> suspend/resume functionality along with some improvements in panfrost dri=
ver.
>=20
> Biju Das (4):
>   dt-bindings: gpu: mali-bifrost: Add compatible for RZ/G3L SoC
>   drm/panfrost: Drop redundant optional clock checks in runtime PM
>   drm/panfrost: Add bus_ace optional clock support for RZ/G2L
>   drm/panfrost: Add GPU_PM_RT support for RZ/G3L SoC
>=20
>  .../bindings/gpu/arm,mali-bifrost.yaml        |  2 ++
>  drivers/gpu/drm/panfrost/panfrost_device.c    | 36 ++++++++++++++-----
>  drivers/gpu/drm/panfrost/panfrost_device.h    |  1 +
>  drivers/gpu/drm/panfrost/panfrost_drv.c       |  1 +
>  4 files changed, 32 insertions(+), 8 deletions(-)
>=20
> --
> 2.43.0

Gentle ping.

Cheers,
Biju

