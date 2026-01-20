Return-Path: <linux-renesas-soc+bounces-27132-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YOD/N3PXb2mgMQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27132-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 20:28:51 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9CA4A62D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 20:28:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B3D55745E9C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 17:22:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAD753D3325;
	Tue, 20 Jan 2026 17:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="QRLvQ6t9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010053.outbound.protection.outlook.com [52.101.228.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF88E3A89A8;
	Tue, 20 Jan 2026 17:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768929714; cv=fail; b=QIk+acVn7tNaRJphc+suNPYsJna05NpqKMjtDH+oTeU/fRq6DMFEiQz4+jZyzZBVu1Rq72bA8rqLbIduN6YcmSlJ+nP1eShE4w5KfqW7X3BhEk6Pcn3gGTvry9UbXKJWP2xYqXigDwsMLuLy/4rgxknGXyPZFOdnrO5EzWyuRC0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768929714; c=relaxed/simple;
	bh=OCM/Im621SpuX2FCXyldvuBppN9lN4XPs3JuSwTRlhA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uLqGD7Fj7HjyXqLlMw2R6UzGAbatr6V3omHvhEkftwgdc9vn07537dxaRN9uv9u0kjMYYGncccGebxzA9TSnUkxD1t+rmlqTBsz+4WeUtG9oeAZ2qFrjXRywdNv/fgjcWqd/tEpyWETQe+RAgxkVJ28heX6w56FyKFM/eGqjXh4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=QRLvQ6t9; arc=fail smtp.client-ip=52.101.228.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n8rPpC7GhRnRbb3KtxABJXEfmopy4Ny/GvzWbEkOfSskXSFOFNqbUDTBigmb2lXG/+2MJKKwSCF0fv4JA26Y+nMFR0FdGOjg16pHJ7/1/E86GOwQRBi3y+ja5MVG1hUX7rFQSS5wteFgF5e2gJNE6X3bzoddp94eBa+RFXD0TghaxiXULXOTHoeiFkcitV8yIb+g9zrLlQAHcBsFYR+YteYAkk65B+W/YOSuaw6uMqzUSKvNiiGp1hVQfm1D85maEtFwVLO2yVGaH0ZlVxlySOCI1cZwIQVLLNv2ZoW6FDpunnDLa84+1I8tXvAORqBZIwaCCf3sccQMUP7olowecQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KnjSyh3L/X2sjWmdd1PIRaJTU+pHI8v0CNrYlOM/g0A=;
 b=v74Z2C6M4g2yrvPMKSRw4cX497J9bho4rODSwSGa47YojGNU1HbIUje5EkaltCt5bcmDGdsOWT+UxCWIR99cgrdYrQPzqIsFLlCeL7s/Tb+kFOXQhxNb8FNmNn97ysTxPAQYXJ5hz+waC43dfYXiWkyQ/3q6JTYn7pkYXo89GCItInZlDmYZH6F4enX4ezUj0hidKpp47pD6juC2XZr8H9zi0s3bdMzJ29k63UvbMJOw9yWG4KxSId6BheVehFfUl/UMPzTUOHUGaDCCIuG+HOaJGpN9ZeJ9+sjq3exFkELm40qA8c8z70+ncL5KlDZ5ZEipX+yq/YtEBGfp1oMnlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KnjSyh3L/X2sjWmdd1PIRaJTU+pHI8v0CNrYlOM/g0A=;
 b=QRLvQ6t9pM84pDZxd3quqWODpPOuyBrOMX5k1PTW+qXqCZL3fMED39z93OsTg3VQFzimnqecv6aiDXyxUnxurJnbv3ITHnLqEoIIqwUJEDLviDVLGsGpVSn3Tq1UFDJA8GOd1V9bhXDoFfrwJ2aEAtuC/tHLetZWjDPZG3pEEnw=
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com (2603:1096:400:448::7)
 by TYRPR01MB12140.jpnprd01.prod.outlook.com (2603:1096:405:104::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 17:21:48 +0000
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430]) by TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 17:21:46 +0000
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org"
	<sboyd@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: RE: [PATCH v2 2/5] clk: versaclock3: Use clk_parent_data arrays for
 clk_mux
Thread-Topic: [PATCH v2 2/5] clk: versaclock3: Use clk_parent_data arrays for
 clk_mux
Thread-Index: AQHcih5XWopd3cKd4kG3WwPzAVBphLVbTjZw
Date: Tue, 20 Jan 2026 17:21:46 +0000
Message-ID:
 <TYCPR01MB12093F60A107DEB355308B7B8C289A@TYCPR01MB12093.jpnprd01.prod.outlook.com>
References: <20260120150606.7356-1-ovidiu.panait.rb@renesas.com>
 <20260120150606.7356-3-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20260120150606.7356-3-ovidiu.panait.rb@renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB12093:EE_|TYRPR01MB12140:EE_
x-ms-office365-filtering-correlation-id: 5dfa6c69-f9d4-4401-a825-08de584863ad
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|7053199007|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?m/5+78REFtBrivpUlR+an1GZPRM0N7UxG/eAKfSqjPCwTkB4TiW6Eo4YS+ja?=
 =?us-ascii?Q?hZl6604zCJ3jR97vbN2FdtzJCqx4Rsn8gapsuExgj5k4pupGV6x6iGIMAAMW?=
 =?us-ascii?Q?pQ/dJq6W1AuGxF/VAOy/8i/K8+Z5xYjkLBaG0yyqMrxEgskzMkCxrh/iCe3U?=
 =?us-ascii?Q?xctMTD8codyNzSABr76HzFoAnQROweXr1JNcBCKquaIZShbgMxe8oOoq3ATT?=
 =?us-ascii?Q?vNZhccSppVcdXKO+jp471cD3qag8x+TnHclNwAQ0/reL0gAWBujERSL+RsHz?=
 =?us-ascii?Q?CJDPp5O0qwo8rPYnikOvXS84R4zzd9aVzN5Ai61m/6EF1UfmjFo+XcnCeBcs?=
 =?us-ascii?Q?kVny99Pk40FCnqLp0BpKwfs3BoWOv8Fo6oUCFiwEdhif4HQS+E3+dnd9jQsT?=
 =?us-ascii?Q?RHQdK1Qn1oStHEkgWtFBtorDAUrdnXulasLVZhZepzc934TnxmyXmJy5KrOR?=
 =?us-ascii?Q?uzRoeVViWUviopALOk6mo+dP9lgBIZE/vSdMRoXW5N7Gh93+dQ0ubhXzA2Yu?=
 =?us-ascii?Q?zrqsWkORf1S+7QQWp/flEgmHG2co3EnnlXMJBLyoTwcWgoX4ZsIOgc0p8UBq?=
 =?us-ascii?Q?b2loZMpVg400ch6XU8T9hAh37cowXMEdtoAi97U/38r5+A2ZLv9CamO/7EMj?=
 =?us-ascii?Q?jBvNqepWkpmC+V13MqjLqDfrCICPGn7WqaKHIY1/EQwYLW+bO2h31ima2e88?=
 =?us-ascii?Q?6mr4nLlQ0TM3XEuOOdGTX3ikVsEiScXUVrffGvh0Ou32JCzFZzZ7+j9yyYNI?=
 =?us-ascii?Q?w9vD/NjJxvjXT/Ad+8P9+4eteXurtOmy0A+/7SGl6r9v3+Ukx9GAvJE1sUKU?=
 =?us-ascii?Q?7Ovh/rnNwzBBdQ6CWecJbS+pKE42Yxggmfrq+bw8CCeTKAiz1KDtNiQ7TQ6/?=
 =?us-ascii?Q?n1Y0gglVvq4VyLmvjrsQ7ioa1WDcaZUMn9ChpLrcpw6nRsgImXTLYy6eYSNS?=
 =?us-ascii?Q?cmIiDMYklIoQIo1Ha3hmykq836FUTXUEl/hhTEXMtgxjs2onGT+3i5ym4Pdm?=
 =?us-ascii?Q?w/54H3XzOY+yxoGw23phpa8wuE003jQq5Xl5wgqXZwYzLKPh54S3v/+F+Re1?=
 =?us-ascii?Q?8XiGy43I7GNHqsRIUWDensZq88Vl+BZja1RTCTIG3t9hpsrfK2wVGlpfQXqr?=
 =?us-ascii?Q?4CnDd1ccE0ZstbL8OI4i+21/jYSoYS6SS/AuRUBJ9VYiUvEOWYh2oXIO+M+h?=
 =?us-ascii?Q?4xelN4eLGLHxcjNEamFI4nrFY40GKv2H2cnS+FQ8fG0zM71l9a8Lk0s3weCs?=
 =?us-ascii?Q?oFZ6K8FPBK1dUc+GmoqKApmM2GDR3uVgwdl5/UepgOfCX/2caVU0aZ4YrKZY?=
 =?us-ascii?Q?hUgkQbgbSib+pXl0I+Sj6gQW0Vjc0FoPIG4s9NHAH4xrCZ1SjshVpzRe5UlX?=
 =?us-ascii?Q?mGg6uZv5hXahSUAgt62JTSxAWQnO39A+mD+szQs3KQa2U0zJHjg147YhAW1H?=
 =?us-ascii?Q?d6v+SQRSF19OP2u21VeNx8mDCfZedJRcnYZCNLXtr8M0WYdcQ4eWKhHM3WGV?=
 =?us-ascii?Q?Q81RpE8DuPIATIViM1X/WQ5fCIr+r2n33+53ZumFY/AbM6Eg0qQZOTtNsCum?=
 =?us-ascii?Q?gtgRf9O2Dxp0rnNlOAHYk49MxWzUdLONAAzKa6AzlikH96mLASAk4BdW+liH?=
 =?us-ascii?Q?AGcKdm9+F17ez0p8MeXIUWY=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB12093.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?c5xXEAB/0lnLmTrR/t75WrbqhM51aIfUjdUHubKsLzKSeffyNiIAKuWPE6g5?=
 =?us-ascii?Q?o/dOG36pdIPBqkgBRZFE+XHntkw9zeiGF4UX/lKrkx80289tRrOO7aiwoMqI?=
 =?us-ascii?Q?wFJfN+q7EiKXjyKNmEYBBVJImy2fzRbsF8z0gzj38RYFHYegbi/WZNgSQ49e?=
 =?us-ascii?Q?v7kIxIPSrCBEzReXtJebYdHS+LyCpjhX4d4hSDeNqYSNi5Sp7v8WoHaz52KS?=
 =?us-ascii?Q?NChSwNIzVRfth6PUJfhQPtGCIaxOOM3TCYwDmA52VJPgP110o7sFTOuvRPsP?=
 =?us-ascii?Q?Y08+FDt0cYeozRCiJyDA6PxG9fcSLPPyN9eSy7pBg48Cn6ikrQVNNUbrES1p?=
 =?us-ascii?Q?T0WPtwho92QwuddsQ+qJB2DARa9HCZfcGC8kk2UvPtIE/EJJXFuTf/jOgug0?=
 =?us-ascii?Q?7n/SyvPhpQnfsIuTEjuc2bdOoQopxm9fiEuWk7ZD6N1tNK2G3lcN6lVcboVb?=
 =?us-ascii?Q?0BuAkcmHQOZy8hrnt1G8KPbq7pqC46bsf7x7lDC4MpX03UQHKg0ZtJBar9al?=
 =?us-ascii?Q?Vgu0LctR06krHgUzD6CUmoVgTOrrDnXPCncTfxaKz3XUfxVrgK7YnyBPXH+R?=
 =?us-ascii?Q?yCvzh6aHKGWV3pkBmhigE9jsMAzyVUNyujUcrdIlP5fRM27soujl2ldfaPjI?=
 =?us-ascii?Q?WbkUEgiLiESHFfc8+pQi8dan4Oalt5DpVjjvdL8tX6zzecQurLaxHJbjorH8?=
 =?us-ascii?Q?8QyW6LyyYE60JD2Mxy4tLzj/lnvcsYrm61b3HE/2xJAP+62t+LAqXnsMxJGc?=
 =?us-ascii?Q?Tip9qX2CXnWADf2NASKLDZ08XSt8saqXXUDlUvjahXotxxRJdgyXUTHJAG/S?=
 =?us-ascii?Q?PgQfTBV4g8RFhJkoOijnyii+qmS+Y+IjTwGuGjaXz9VEGgfS0UzlqHeJ+Fv1?=
 =?us-ascii?Q?VojBcZd//+N/cOC5Rr2nbGwye6tLLwH3ZaJjmoGJ44eaNe0GtGyI4ByV79Uw?=
 =?us-ascii?Q?t75OE7DFf4/P8xG2ymXifO84SXCrnXjwDEhQdR7gvuYvJ9rvYTh5KDKu4p6X?=
 =?us-ascii?Q?yZEO6UVDpMAutI1+1K+6T0kscTd+mvnX7siGHYC4pq/kfLncdHowxqg3Ap4Q?=
 =?us-ascii?Q?obU0xVwyg35rhG5AFdKCpHD7lt3Kl9qYw7BcMM+a1KoZB05ITIfzyFHK8FJ8?=
 =?us-ascii?Q?DLPbLlsU6OXiGYU1zFFojhcDk23AhrsarL8UWRBEmBtSfJStbVYZWP6BIqTP?=
 =?us-ascii?Q?a+55FkEd/uG7g9r7WEHrCAdFn5S3i1Q4L3fBoUHnFpb7FD/TCMTbQ+064/iu?=
 =?us-ascii?Q?KaksjV7SzIxd4Pw+j5sLGQgSsBeYrys4ryiDGwF+yd73HqpTYjrGx3IbfExG?=
 =?us-ascii?Q?YsP0nOmTSA2Tdgvvy6fmkwF9FXQOqePOvlk2p2AUUtNKQ16SPO9B5ENZ0xza?=
 =?us-ascii?Q?VKoGqtRq0NCchKrjpJxhxWadWqNDjb76/QrcmmYgI7YZR/pAdUHGrJAP2R5T?=
 =?us-ascii?Q?/+23HoId0hnZGktw0NxqNcfntgT5TI3z8VR3mwUhOgiyQMRhpNx9WpMZy1X0?=
 =?us-ascii?Q?sPAZ6ojpZsva8zC6twON7Wgyxzy0fUEMSTjjuCxIkFrVfec9dOwXtIaC5FL1?=
 =?us-ascii?Q?ML5p/bFUynPgrC6/d6xqYsctUsuzuz3ShIMDnBIN1ZwVbUjKH/C7TnIIXdcG?=
 =?us-ascii?Q?C+4as7jPZTSSrxo8zBVmm6C3tvnl+CSSyp9QNW9ZzWBlngP2WeMUPFljK8hY?=
 =?us-ascii?Q?1VXzWCDABmUg4eoktzK5RvvH6mCVKRJ7Qgy2ad1FOE/84+zavCk3oXMvyjKX?=
 =?us-ascii?Q?eRGAw5C21iCmooGv/A376EWMxTw1E2A=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB12093.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dfa6c69-f9d4-4401-a825-08de584863ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2026 17:21:46.5917
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N/63JrdDPQLPnyXYGyRgc19gnFsm0P5sBVTIGY69rU2OIt+q8GwJiY9566lSsaGsQG/WcrFcYyg3uJuk95Id3c6PDMdOKN5qOJKIa9C3yq8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12140
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27132-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[renesas.com,glider.be,gmail.com,kernel.org,baylibre.com,bp.renesas.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[renesas.com,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fabrizio.castro.jz@renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[renesas.com:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	RCVD_COUNT_FIVE(0.00)[5];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,renesas.com:email,renesas.com:dkim,TYCPR01MB12093.jpnprd01.prod.outlook.com:mid,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,baylibre.com:email]
X-Rspamd-Queue-Id: 5B9CA4A62D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> Sent: 20 January 2026 15:06
> To: geert+renesas@glider.be; magnus.damm <magnus.damm@gmail.com>; robh@ke=
rnel.org; krzk+dt@kernel.org;
> conor+dt@kernel.org; mturquette@baylibre.com; sboyd@kernel.org; Biju Das =
<biju.das.jz@bp.renesas.com>;
> Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Cc: linux-renesas-soc@vger.kernel.org; devicetree@vger.kernel.org; linux-=
kernel@vger.kernel.org; linux-
> clk@vger.kernel.org
> Subject: [PATCH v2 2/5] clk: versaclock3: Use clk_parent_data arrays for =
clk_mux
>=20
> Replace the inline parent_hws initializers with static clk_parent_data
> arrays for the clk muxes. This provides more flexibility in how
> parents are described and will simplify extending the parent lists in
> the next commit.
>=20
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

> ---
> v2 changes: None.
>=20
>  drivers/clk/clk-versaclock3.c | 48 ++++++++++++++++++++---------------
>  1 file changed, 28 insertions(+), 20 deletions(-)
>=20
> diff --git a/drivers/clk/clk-versaclock3.c b/drivers/clk/clk-versaclock3.=
c
> index f387cdb12f48..ebd9d75d7f55 100644
> --- a/drivers/clk/clk-versaclock3.c
> +++ b/drivers/clk/clk-versaclock3.c
> @@ -900,6 +900,29 @@ static struct vc3_hw_data clk_div[] =3D {
>  	}
>  };
>=20
> +static const struct clk_parent_data clk_mux_parent_data[][2] =3D {
> +	[VC3_SE1_MUX] =3D {
> +		{ .hw =3D &clk_div[VC3_DIV5].hw },
> +		{ .hw =3D &clk_div[VC3_DIV4].hw }
> +	},
> +	[VC3_SE2_MUX] =3D {
> +		{ .hw =3D &clk_div[VC3_DIV5].hw },
> +		{ .hw =3D &clk_div[VC3_DIV4].hw }
> +	},
> +	[VC3_SE3_MUX] =3D {
> +		{ .hw =3D &clk_div[VC3_DIV2].hw },
> +		{ .hw =3D &clk_div[VC3_DIV4].hw }
> +	},
> +	[VC3_DIFF1_MUX] =3D {
> +		{ .hw =3D &clk_div[VC3_DIV1].hw },
> +		{ .hw =3D &clk_div[VC3_DIV3].hw }
> +	},
> +	[VC3_DIFF2_MUX] =3D {
> +		{ .hw =3D &clk_div[VC3_DIV1].hw },
> +		{ .hw =3D &clk_div[VC3_DIV3].hw }
> +	},
> +};
> +
>  static struct vc3_hw_data clk_mux[] =3D {
>  	[VC3_SE1_MUX] =3D {
>  		.data =3D &(struct vc3_clk_data) {
> @@ -909,10 +932,7 @@ static struct vc3_hw_data clk_mux[] =3D {
>  		.hw.init =3D &(struct clk_init_data) {
>  			.name =3D "se1_mux",
>  			.ops =3D &vc3_clk_mux_ops,
> -			.parent_hws =3D (const struct clk_hw *[]) {
> -				&clk_div[VC3_DIV5].hw,
> -				&clk_div[VC3_DIV4].hw
> -			},
> +			.parent_data =3D clk_mux_parent_data[VC3_SE1_MUX],
>  			.num_parents =3D 2,
>  			.flags =3D CLK_SET_RATE_PARENT
>  		}
> @@ -924,10 +944,7 @@ static struct vc3_hw_data clk_mux[] =3D {
>  		.hw.init =3D &(struct clk_init_data) {
>  			.name =3D "se2_mux",
>  			.ops =3D &vc3_clk_mux_ops,
> -			.parent_hws =3D (const struct clk_hw *[]) {
> -				&clk_div[VC3_DIV5].hw,
> -				&clk_div[VC3_DIV4].hw
> -			},
> +			.parent_data =3D clk_mux_parent_data[VC3_SE2_MUX],
>  			.num_parents =3D 2,
>  			.flags =3D CLK_SET_RATE_PARENT
>  		}
> @@ -940,10 +957,7 @@ static struct vc3_hw_data clk_mux[] =3D {
>  		.hw.init =3D &(struct clk_init_data) {
>  			.name =3D "se3_mux",
>  			.ops =3D &vc3_clk_mux_ops,
> -			.parent_hws =3D (const struct clk_hw *[]) {
> -				&clk_div[VC3_DIV2].hw,
> -				&clk_div[VC3_DIV4].hw
> -			},
> +			.parent_data =3D clk_mux_parent_data[VC3_SE3_MUX],
>  			.num_parents =3D 2,
>  			.flags =3D CLK_SET_RATE_PARENT
>  		}
> @@ -956,10 +970,7 @@ static struct vc3_hw_data clk_mux[] =3D {
>  		.hw.init =3D &(struct clk_init_data) {
>  			.name =3D "diff1_mux",
>  			.ops =3D &vc3_clk_mux_ops,
> -			.parent_hws =3D (const struct clk_hw *[]) {
> -				&clk_div[VC3_DIV1].hw,
> -				&clk_div[VC3_DIV3].hw
> -			},
> +			.parent_data =3D clk_mux_parent_data[VC3_DIFF1_MUX],
>  			.num_parents =3D 2,
>  			.flags =3D CLK_SET_RATE_PARENT
>  		}
> @@ -972,10 +983,7 @@ static struct vc3_hw_data clk_mux[] =3D {
>  		.hw.init =3D &(struct clk_init_data) {
>  			.name =3D "diff2_mux",
>  			.ops =3D &vc3_clk_mux_ops,
> -			.parent_hws =3D (const struct clk_hw *[]) {
> -				&clk_div[VC3_DIV1].hw,
> -				&clk_div[VC3_DIV3].hw
> -			},
> +			.parent_data =3D clk_mux_parent_data[VC3_DIFF2_MUX],
>  			.num_parents =3D 2,
>  			.flags =3D CLK_SET_RATE_PARENT
>  		}
> --
> 2.51.0


