Return-Path: <linux-renesas-soc+bounces-29368-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCVyNCJCtGk4kAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29368-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 17:58:10 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CF9287AEF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 17:58:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 44559308A162
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 16:53:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF1CC3C9EDD;
	Fri, 13 Mar 2026 16:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="pOFQXmpD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011000.outbound.protection.outlook.com [40.107.74.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7493C873D;
	Fri, 13 Mar 2026 16:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773420780; cv=fail; b=uKWorGtn8tsVyq7K5+zSiHqo30GRugqwICKpAY/OPjtbRbJZAo9+vjqu8Zv+xqmg5BqUekS/299y87n/Cvs5u4qU8ZAXyFZ5I8Gw0vRli/7LmCo8zU/XYRyXxUSrfSWXd/zlidlw1S4par8Y341NHV+Amm4mZwvD4+nT2AiPGUk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773420780; c=relaxed/simple;
	bh=3I5qocg0npFdVpeSeCCAPuVh1XVlNAbibtAdaYAd3E8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eCiwQWndke1XyDx/3CjWgNuHRdVs6WLABSj6jPcfThWH9Aa88Tv8a7dvQdLhgkZ5yQs/kg+5qNd/JAsYIeIJWigwB4tsMJZgq8k5v8RKS4a6ywQPEVjr+LXVMYgnKmQXJajASyodpYg6Pa6U6/hon2keZXZrBuOVhCxFudWjezs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=pOFQXmpD; arc=fail smtp.client-ip=40.107.74.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I/kzrjm//pUCG27Jpba5IbDhJTGhWMf7CActDYtZBqAX8/yINEUr7s/P5x3AsUOvP5X+rJgmrHQNr3reiGRRAhzZIUA9egeNnM2T/RtxaBNeZ9BTQ7uFP3bYnS/3ExBK8ka4OwRgv5i+G1nJMVEdHhwCA+XPyFGBWLvrGIT2ncAfR2lHLmlglMbOAa3pf1jzNo4Szu+6VxxUNq4IHSjmdQFcYjsW4MmiqhwY/JCXAbn9X2m2bSAVHWA7uPiPWMSdxyVeASqwkivvpjO7aULZSojmjIpu9IGYDTMmVrcxbn6MsI90uisMu5ZQkqlnBvQoi8B9OZCriOTHur/rjZvMBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pyTkV2TTuDS5k6euFf9gvNZyF4Dfi8vr9z8JXHe9y+A=;
 b=ps2Tfmb3s8oULgfBcDZQNvDvR6VsrGpgvP5p3wxGOI4hKQwf1FWgnSKTL60tf7H44/PUAisnmE5NBxmlpzJZ4qFXhrc1zIQ5ZeD7iT/Wr789cQ5XnDxenOW5vSIYRtCZv+dKqkNj0NW9fFJzMhoBEUlsTRWTBzxvMD2kFxe4uuuVIQYN8yk7OKpOf/61g6ZRVswFtuiCYfYkmhJQ9Sjoz9rvgFcyD+beySMXh7Gwmn+lZWXimJADXsqUX5GnZGd77YKba41bmMKtsitxo5rnRaSfKWKq7bc3c8ZnxsQ8yPesQYQOhMP4mMZJvOsccoUW8G/UFMhsQ5RDZeee7nV5XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pyTkV2TTuDS5k6euFf9gvNZyF4Dfi8vr9z8JXHe9y+A=;
 b=pOFQXmpDHAbk+n3u/EGx9R2ZfA/YdXt0nXfwGSC2qlFfC4RoqASt6iQmgaxDBmTBVU0snP4Q0xNTjlMsOj4LHCzgHn0zYt97loZWqc1DTyFkDpASZ8Oe7VY8cFD+gzZXI9mPX39Wg4DQCPg2bm8kDMm8lLE3zA4zAXI1peVgW74=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY3PR01MB10268.jpnprd01.prod.outlook.com (2603:1096:400:1dd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.16; Fri, 13 Mar
 2026 16:52:53 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9700.017; Fri, 13 Mar 2026
 16:52:40 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
CC: Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, magnus.damm
	<magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 0/4] arm64: dts: renesas: Fix PHY C22 compatible strings
Thread-Topic: [PATCH 0/4] arm64: dts: renesas: Fix PHY C22 compatible strings
Thread-Index: AQHcswgXxNnjGhc1/UeWMH+iCL4MUbWsrS6w
Date: Fri, 13 Mar 2026 16:52:40 +0000
Message-ID:
 <TY3PR01MB11346A57519DD3EB5BB4456D38645A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260313164008.40933-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260313164008.40933-1-marek.vasut+renesas@mailbox.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY3PR01MB10268:EE_
x-ms-office365-filtering-correlation-id: 1e6e7f6d-4be2-487a-a15e-08de8120f097
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|56012099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 rWxODcwuOKZ7YUCtqpWSI1gWH2wHVLI2MepCW142JFF8cTFC6yOHjb0/VoVvHMXCG/9wuvifxXxmWu33+0HdmP+M6P6hLcGLZs4YQzFK0962owPeAP2FT/5qKqAMdfKEYEBp7+LDtyV54mUqmNia4ULvRzBlnapmTPZwaaDZfVxcoORSL3IlA05aMuy2vZSaOxnCBkfrJfYH/sc9vDx69bAKgPLGrhVuZ9PUn5BfFdxW/50+5UItcDk+rschInMEURJiPts1SC7w2ceG1W0dPa2XA0AqAR7ubH2ScdyRYPfKaph8fmkD1u/2jZk/Fv0k8SsosQk+FajL4fJdXOQHYh/VI3kuQiXr3zJO1KdLUUdM7Zxk6J8cETie3NUMeff1aJ/Wy0ZjcYVMwIJl7hb7eRYNwdmieD34lXn62NF9UoIkgFrbh91RjsPBHwAn0gTrEh7Paguiq1ZN9x819LvcpIiC3BH1+kv0e2YhabEu8aBW7N3tnwuFUdKSzEdGED5zv93awqCwJy06gGGSG/Q+/gG/CWLNGOT/nv3iyCEFr7zrWexu58LSrCk/Jc+8jy4gHhpzRsQl+SLASb7MTv1GcJztIi53Ns6/5IaJHp3vlb3tR7tz7vVKdO5CUvA9YO/ZXeGs7cGt9XhNw+MA1uvcdor9Jnq9+T890NGp3Ai0f3knUUYd/uOHqOLVR5M+3fMQW9Ld5dnAF8aAyjwcqPduMJ9LUYb5hzYUko4b/A2nqUm2tny000E5Iu0f2QGp+pfk/CfUQ7eTjOXdkA9AWWDuvbZMnMDBPqD+1ScsoJV5vaw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(56012099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?BG5uO4Pu4sqfylrFCPajFK5AzVWH5yN6BE6NW4fSEl3YxMySxFc2B7xnXLXa?=
 =?us-ascii?Q?HMj8SF914iowUol3yiNPLSKEm0TfesnUT89wk5KwZzylt5L+xe+sdFaw4+8C?=
 =?us-ascii?Q?oSwFrv9Wy/w1rm9m5+0WJsmuIOOC/sEhRRiCbgsQ1V1LPgYYdpTyOhQPdiwx?=
 =?us-ascii?Q?Ltyl0X4CrKyn5VxkBTfagiwq8ilTnUEOSC7RBxcGViNtVU54y+Tia1OF+YYL?=
 =?us-ascii?Q?tYRV8TrllM+e1yQTXTjhPvv+7dlsRtoMvhNNcKmhk7kjrlc/GJIr2mTR0cNj?=
 =?us-ascii?Q?a+Va2T20+7oeveZNTi3rJviWaGP5ZjSnUig/NGZXEzSr2Kufo+66JK4PIFpQ?=
 =?us-ascii?Q?4+9li6IpdMSsTQvBqxYthUAIfJGeAI0R6zDrJj7L9kH0l51rP04evVUbi3j1?=
 =?us-ascii?Q?CMloTUneYxMDhHHRNlcFACrTrSqi6W50/Ekn6vUmMDotJLnfbropj9zvAL3o?=
 =?us-ascii?Q?kWfclDevFNmXoB21BNq3nJRbFU4SmMsmmfPE6SV1ukYCub2+t5gYhWiyWbIt?=
 =?us-ascii?Q?7AjTtAqndkUuaE0QCxKKOXwbCR+gnbSMjG73cdWB3oy54hbqRv5H++0D4xif?=
 =?us-ascii?Q?DDf+eaNKQcQRpsUIpIQ3p4XA9by+8VkXHmC6hLVmg+n/nzb2xhayhhA6k6VK?=
 =?us-ascii?Q?Fez2KNBxrqMfGvn26l1cb2cneBDwodHr1xtGDeQblRzp83H1J4KhrFigttvM?=
 =?us-ascii?Q?+B/P1GZQLIXumFTSutU7VfNI6q3lppuYHrrOqH8id8odDlWLWE2H5Mmxqma9?=
 =?us-ascii?Q?mSgL8FyreqyH7pGlyIcKltwD0OA/654sCb+2SvVR/Xby3vsuOPy2XVC4+MYj?=
 =?us-ascii?Q?IpgB/4WAqvFV59SsV86Nzyw3HyViYNkpy1ePJx6+9MlsX8dLhLVVh7As07tV?=
 =?us-ascii?Q?1qmJqpltGq1JM9XWPFl6+54qwO//PbDEdHueKIJrBqdPQpSYEvGB9AZdCyYv?=
 =?us-ascii?Q?DTvJvnobywlnvAeHd/YpMsi6N6QVN9yXhL0M/SLzsyKsX+wx65u64ZpDMkg7?=
 =?us-ascii?Q?IUZkZIwUsTKnjFIQNMZ40KMyUamWFiHdej65s4sPVG7tIMft3A3QoQhNBdVZ?=
 =?us-ascii?Q?XuT+8c3PeqGi1HK4mnLwXhOHH3oK0mF5kkNn0JHBGoHAx0IMZnPjMjcLvjIv?=
 =?us-ascii?Q?Cj5swACQtlmYD5tE3w+fwRIXQvDWXamz8CkJusOdvhJPoPb+3LV4q3A26o6q?=
 =?us-ascii?Q?Psi1hthVnbRksVOuIrE8ODSuPGIaF/EfU0cSz5iYrnuZyXFEjwMNaBMN3zaR?=
 =?us-ascii?Q?KMN5KBS69PsKeVdDvh6TNy6zKfycC2FTvOfT6TrS0nj8/b8Riixc3/oAtAbV?=
 =?us-ascii?Q?rOKNqgiDNlGR+5ejIY+898oddCNB5NP+QH5mrRVE/XTYah1LDIrCuFJbvkvI?=
 =?us-ascii?Q?6JMmkSKzprVhUq2/aTPUClYdkDvlMpI9nUHqRmGNMKCDjcxsgBn5k5UUOrte?=
 =?us-ascii?Q?rN3ifYoTUjc4GOfIFe9qmJbmn3xFWIRJOQNJN6lTY1VVmCKQQiX4A6TlfK1O?=
 =?us-ascii?Q?gwKNUFBI6Qd7VwwHVzhkI6sZUihKSZfC/ypmZQ3psGzsBN83tkITsO3xbIoe?=
 =?us-ascii?Q?kJu8EtGIQhXY83vW0BpiDsXcFZCcHMbFkWT/cNhKXelI7tZ/hXb2y5mjiuBo?=
 =?us-ascii?Q?oKoz06XQ4n5mhbwBFe+GUMzctV30XOGjS3nT9/Gh5QR4DFnGKQuchUbNw869?=
 =?us-ascii?Q?LC1ofhfmNrqp3Sh0H9AhCgzjQzAk148lIh+P08DCaHjkBRWXaU0gAj2j0izc?=
 =?us-ascii?Q?EePgLAjTBA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e6e7f6d-4be2-487a-a15e-08de8120f097
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2026 16:52:40.7951
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZXJpWaxTXHW7s/HPNOByasQ87Ewuj0x7TmT0bsFAoLhrbbAd0dsTJDQNQlch43LMB/DKb1ODwCLkS9ewyfcM8ZxynrE/wcrIt4kU4FhmOuE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10268
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-29368-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,bp.renesas.com,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,glider.be:email,renesas.com:email,mailbox.org:email,bp.renesas.com:dkim]
X-Rspamd-Queue-Id: 34CF9287AEF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Marek,

Thanks for the series.

> -----Original Message-----
> From: Marek Vasut <marek.vasut+renesas@mailbox.org>
> Sent: 13 March 2026 16:39
> Subject: [PATCH 0/4] arm64: dts: renesas: Fix PHY C22 compatible strings
>=20
> Realtek RTL8211E/RTL8211F and Microchip KSZ9131 PHY schemas indicate that=
 compatible string "ethernet-
> phy-id001c.c91[56]"
> and "ethernet-phy-id0022.1640" must not be followed by any other compatib=
le string. Drop "ethernet-
> phy-ieee802.3-c22"
> to match the schemas.
>=20
> The KSZ9131 schema does not document "txdv-skew-psec" property.
> Fix what is likely a copy-paste error from the "rxdv-skew-psec"
> property, use "txen-skew-psec" property instead.
>=20
> This is compile-tested and schema validated only. I have discussed this w=
ith Biju and they could
> perform tests on real hardware to assure no breakage. Please wait for the=
ir TB before applying.


Looks like there is delay in delivering my patches. I already posted 3 patc=
hes. I will test 4/4.

https://patchwork.kernel.org/project/linux-renesas-soc/patch/20260313130623=
.297712-1-biju.das.jz@bp.renesas.com/
https://patchwork.kernel.org/project/linux-renesas-soc/patch/20260313130920=
.298392-1-biju.das.jz@bp.renesas.com/
https://patchwork.kernel.org/project/linux-renesas-soc/patch/20260313141150=
.406528-1-biju.das.jz@bp.renesas.com/

Cheers,
Biju

>=20
> Marek Vasut (4):
>   arm64: dts: renesas: Drop RTL8211E PHY C22 compatible string
>   arm64: dts: renesas: Drop RTL8211F PHY C22 compatible string
>   arm64: dts: renesas: Drop KSZ9131 PHY C22 compatible string
>   arm64: dts: renesas: Fix KSZ9131 PHY bogus txdv-skew-psec property
>=20
>  arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi    |  3 +--
>  arch/arm64/boot/dts/renesas/cat875.dtsi                |  3 +--
>  arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi        |  3 +--
>  arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts      |  3 +--
>  arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts |  8 ++++----
> arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts |  8 ++++----
>  arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi       |  6 ++----
>  arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi      |  3 +--
>  arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi      |  6 ++----
>  arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi       | 10 ++++------
>  10 files changed, 21 insertions(+), 32 deletions(-)
>=20
> ---
> Cc: Biju Das <biju.das.jz@bp.renesas.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> --
> 2.51.0


