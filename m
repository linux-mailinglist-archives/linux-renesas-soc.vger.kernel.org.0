Return-Path: <linux-renesas-soc+bounces-13785-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FE8A48535
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Feb 2025 17:36:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A500F172176
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Feb 2025 16:27:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9229619C57C;
	Thu, 27 Feb 2025 16:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="OuRFYi+U"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010000.outbound.protection.outlook.com [52.101.228.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9951ADFE4;
	Thu, 27 Feb 2025 16:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740673630; cv=fail; b=iopLD/j5pedh/1Isy3nT6/DeFpJKeECIR/HezcMXbA4KB15GpdflrC+rwQUS32+lVewZkrViZOFt3gbxgdtvtPAHf4qR6mFu8a5/oVx8lC//bfYG95EZD5ZEpH3NjGTsnaHeScKroo1Wyz51LYshKgGPookiQUIqj9iZI1YTC+Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740673630; c=relaxed/simple;
	bh=0Z7E7Gg8TR4jkeBymwNNc8tt+qdlpwXNf1XZtiUsXQs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ApEawZFLE4Z1GvwqikVI2/fePzITqihiGnBodOFpRyg56kui6FMENKJXlTDodB4hrO/FHmT3hTshGwYBnZ1EeKSuzM3V3WnkzYRlnzFjXLm5kh1JZOSCZWDwWq12xxPcPAaFEVOyWFJrv73Ne+yplczkK6MQ/vGkl7B1/rdWjBc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=OuRFYi+U; arc=fail smtp.client-ip=52.101.228.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wp9A8/CQDqNwF3WF1iHfyAmP94GgYYC4waE4159qf8oBVtyKXSpJN3Kur+Yso7FIf6uOnwiuceHKrR3dO2NFP9oG9jwO6SNHmkK/tF9yF1XulweBYuW3eaFVC/P9+Q44yspbBPeg1Wk/qh6MVXnPkwU1NVXagVN3P+BrQv33Sje1TuUCun6pvyi+eXsT+S1D1OPGwlhOQRuJdNtymm9NXOze5mTx92XbhBULpcrFZA3g3xFAGI9+0dGLC8kc3P2+SydphZmSGNcMFP2RMLf6wl9qLBQkd8x0TW99TVn7Yy/HQXDBQjw55CCLm2ZIPFGlz0c2y5wuTOrqTk7IPJcqhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5qoSOEgANlJasmjjUyRXBvDVmuH1tHzla/HQuvQVMJE=;
 b=XKi88SWqQTOzVZ/KvCrXT9Kg2iDeP3v78Eb+Qo2QPLSoKGm+VwOloKONvrUvKAWlNLG/ytdOpH/PJx95mwFg2JeGdkslrtZKEN+Wat+DVz/jOp5VtkR3mFm7nZSSYMnQMa0qA5PXr8XPt7i65RtcHhPzDwgvm6DSjZ5aG2NTeDv87HzWdwB0XRL2YlAp80Xy3cJwNPlIG1161vBE0PMTQxyEJXY3bHcxQMfwkDZCErSHc/11V0VhRELoevFH8Ora8staBCUEU9kgMHt3/llWFPPXNuvXuI0aH7Yp9uX9SQ189OSe3A3zigpwv7F8HysaCYDj10CCpp5yIMuesof+XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5qoSOEgANlJasmjjUyRXBvDVmuH1tHzla/HQuvQVMJE=;
 b=OuRFYi+UdEMd0Wim4ZylqoI/mo2508674RXQWbcFOazDEs101QvHGvEu2nDXvnzLTBm30M6q7rcwb/btU0pVgC2RlIgfRzn8QP1VOINSY4vCv8jIIXar8M71XDUG/ndD5s6t0/6arG79Vq/fpbZMlVH+uUhIOhQd9jkws3/nfJc=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by TYCPR01MB11547.jpnprd01.prod.outlook.com (2603:1096:400:389::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Thu, 27 Feb
 2025 16:27:04 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479%4]) with mapi id 15.20.8489.021; Thu, 27 Feb 2025
 16:27:04 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>
CC: Ulf Hansson <ulf.hansson@linaro.org>, "linux-mmc@vger.kernel.org"
	<linux-mmc@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v3 3/8] mmc: renesas_sdhi: Add support for RZ/G3E SoC
Thread-Topic: [PATCH v3 3/8] mmc: renesas_sdhi: Add support for RZ/G3E SoC
Thread-Index: AQHbeJzJXGThVn8cpEWsdB3fagweKLNbY8wAgAAAqKCAAA8aUA==
Date: Thu, 27 Feb 2025 16:27:04 +0000
Message-ID:
 <TYCPR01MB11332A1479400BA79FC4BDF0F86CD2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20250206134047.67866-1-biju.das.jz@bp.renesas.com>
 <20250206134047.67866-4-biju.das.jz@bp.renesas.com>
 <Z8CBsrD2gKL-V-UG@shikoro>
 <TY3PR01MB113467C0A5623F4446B88038786CD2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TY3PR01MB113467C0A5623F4446B88038786CD2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|TYCPR01MB11547:EE_
x-ms-office365-filtering-correlation-id: 2c859b8d-bb68-4e17-95f6-08dd574b920b
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?JEIovK1dp/20iOX5BQq/QQx29SqsAnHkzhBRYxhecfGtEac5BwTL/vJ9Tzxp?=
 =?us-ascii?Q?gZoz4vjjnla7Bsjb228LrHISqQHNNAzCHr2TVXrqvr/HsbBPutDp0HYC2DxB?=
 =?us-ascii?Q?NGDLerAYt3mdWXwUjs6aH9KhJxWD8Vgc9R8QKdmEleC+o4UXrHUUs1moLrVA?=
 =?us-ascii?Q?oYaWWUDnH3VSxUVaGvgAlY7tGipC/eavMY4Y5KQiF2SMjQRre9Xihtn92bmJ?=
 =?us-ascii?Q?hjYD2mj1X2AUtwUc+D9kf+S0DyPmjbFjmvwD6t2LERdYcrlYfC6yQW9fjkK2?=
 =?us-ascii?Q?7yrPAgeDO7ar1sanKii0YssfPeIeXRQNS4+t7+1MaQo87DhNH7F4j0L9xM2T?=
 =?us-ascii?Q?bu7GM0yYNR91OnryWS3H2HIpMcTj/kWMSrBZYcyPxlMSsoOzFkCLALUrCbq6?=
 =?us-ascii?Q?ljREI5BFbpRTt7ZMNfWdsC0Cy6JOIT/KUIV6iny9qMvugzkrPHjQ0Eajnjhb?=
 =?us-ascii?Q?b9l7JZUnz7n6/la7jC+3dXvtkUZ4ei/WPyL87B9DMQYODse7q4TCwhclZLAB?=
 =?us-ascii?Q?dzpA72Lzo69KSmPpxfzfQLd7yt7mkybC1S7258KLvV8fWQcJSmWxpgUFm6mV?=
 =?us-ascii?Q?I49jIa6KV7ZfkOnzMj4E19k0tnDp3xjJNEr1LWV5okEBrmV+vLYlsI9OChAr?=
 =?us-ascii?Q?Xnoy2bPLgcOZU8/4E9oAM7XwBfvygH8oj0aEWZ+I8sTo2MBYNMweYqVdyXgt?=
 =?us-ascii?Q?tpCCvJydNNtTSQSuY46KgQ9vrtS/cpyMoAeqGWNzqi0I6jv12PGWBrdydnMg?=
 =?us-ascii?Q?5+b1B0rTvhfiX1esb5anmM3EHD9UkProydMDhIg7xqWmlMSzAIkdMmcKlPGf?=
 =?us-ascii?Q?340acVdjC+A7XlFZTKFWhQ8ra7AJnEns/X2+JRcSe2ZG95WQrIB0hN01vEvj?=
 =?us-ascii?Q?7wf6X8EgkVviI0iaXHJwqbVny18w5uQMYcsIR2H92RknWJyOnL8dV48c4l3D?=
 =?us-ascii?Q?WY1wVFa/UTQbyJ22NOJWJ+f5TlF8N/4YkP1517rde5yMNZUOoXsVmDk9iNqa?=
 =?us-ascii?Q?GwxaviN0+m9R/pzoOcDOu0D1ilWnoM+7lQIjCGsYeMhlZQz/k9cbh3MuHT/8?=
 =?us-ascii?Q?Ysj241PJ0ubOZvTirpKi+7iVRcdnsdd0lOyb4wcMhHobFB92kXyZ9uqCCb1W?=
 =?us-ascii?Q?vcFSliPPQuGpRoUNTY08+p/13oJFoS7O9H/mLgziR71y4LaderVJXaHO7G9P?=
 =?us-ascii?Q?dKZgzMWURNxfixyVElUmxFraW6fkmve0MPahSOA3L2n4VGnxTzlvxatLyAo1?=
 =?us-ascii?Q?XSSLGaGH0CNCXWKgE3OrRa+1ZeqK5zrpNtuNplvzygmsFPR2yOwZXKbYsQVm?=
 =?us-ascii?Q?V7oJRLYk1DlrIpYs8wl/DWlD37LntDx+JqBzDg4478slAtKqcXBlIXt2IvSz?=
 =?us-ascii?Q?mU0KW1m2GN7lHu1RJP7Dx1S/NmS87MFpzoDHaM76xx0HVPP80befSmffpBgz?=
 =?us-ascii?Q?aQu/c4zEApaUc65eVDozV/6A7AD9mr5Y?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?xJ42LMKpJ0O9Tz+iVwqi6u0ISDUPDh+iT66dt23sTzrzWvxZCv5TUVYT5HEt?=
 =?us-ascii?Q?TDPhUTjlgATkOv/0uxVgEjPuwaOADTXR5SfCPKeMiRuz6wDETsJhXv+vS3uJ?=
 =?us-ascii?Q?68LDRpGKXNhTPBHZMxF5usjrksD2ZPJvzBd4qFqD3gW7dPMPi3OyBeshiwPO?=
 =?us-ascii?Q?hKMScYiwIDACkq5xJoPnWD5MndeoKD/P8S5Lf8HH6E5kJCawPOhY58UlGiyH?=
 =?us-ascii?Q?JrcwbtUu/FcvF2cHw9ZIDoIp42ni2l5yYMD6tgRQsQ5OtK93jVDa/ylM6Q0G?=
 =?us-ascii?Q?fmaoCDpZk3bmK79410Ana3Y5FIXwJvZeajejQoPXW4RPzF+j4WZox5sMESIv?=
 =?us-ascii?Q?/P+3rKSmdGvhum/CCWO2fHy/Qq+54EcU9bjRu+l1CyHTFOeIFzKl54yuMYlX?=
 =?us-ascii?Q?fW1G/6rMG2gxK3tQUKtv1lX8Hgw6vdXxf6PGA1XB+SfnlUAWaun5kmxmEJac?=
 =?us-ascii?Q?LvWUJuaY5UsvSycyGSQ+WnWWhTv88H4QBsSlxe+eL92T+I0Rz0y122e1CiK4?=
 =?us-ascii?Q?M00M6/z2iyzzGUSk6+Wh3sUVNjFiwCKHlwSygT2bpfM8mTIzlapUdoU1Xm5N?=
 =?us-ascii?Q?5QfrcThK5rVQmote/Qqm7uQV/Oso+L+AnjK72m/Rdx0U5Z2p0Qq9PnM7ryU0?=
 =?us-ascii?Q?Jmo/o+wQ3eCgCCmGf3knmVsDCu5o3BAHvfh1QH+BgqW6XlffB41tkSu0SwD3?=
 =?us-ascii?Q?6V1RsIamgivMimidyrEFfYhDGWuzRmVM2DVhh29xpFH0mDx3FyuubfPrmFpl?=
 =?us-ascii?Q?qk0FRphXyJJ29HduCNv59SqOL5oL/yH0BUcHRhf2avn/bOKkYDwHoCkdM30l?=
 =?us-ascii?Q?lhYMUmNRtHECzKjpsHPNKax/hMW4ctMv/0tW5XVV7+vztn7g8BkEzjQkgXVT?=
 =?us-ascii?Q?ZCw1tEorxW/XrxLkY++/5BSYH+3gBosmochtf/sitx2W3pKFXLuLLCvCaU2z?=
 =?us-ascii?Q?A7kFcF5ITaK+pzCCnuoRzk1grKX4I8n9pIrBLros26UxEjcIwNH+voyRIEmT?=
 =?us-ascii?Q?b9Qveg9K5xX5hS2aPqE7VTkSlP432t+JaCUpK8cXYzyJxUkr/OJ9sJ7E504h?=
 =?us-ascii?Q?I6PEPfsBou5TNsAwU9x5nQDl3MTKgUYPt08XxmZzJyWb3ORrI3vfHn8YcJg4?=
 =?us-ascii?Q?fP4YuDjHfsc2gt1KE544hVCz6eysT/4iJxUqayLAIJA2BRMC+Y9lpJPcfHbe?=
 =?us-ascii?Q?wmfhZyofJYgfKKHmzdrH7e/eqXYfG6PK0YKg/S5d6BQtSQDgj5ZOjo1KIv6b?=
 =?us-ascii?Q?yKl3sevU+AC3+481EJcRD0aVlffh1ThR7L4GT1mlA7yp3dc4mEtoF1DvJnYw?=
 =?us-ascii?Q?IaUOIotVS7bG7WphQRTyIzkz9Ar2alIJCGiHEZ9WXg3zJyjTdQGZ1yISebHp?=
 =?us-ascii?Q?vu8ougeOJrTmJTtjfBhfIGcci+smjFtQPpChOze9BfFtDlVqTxb3q+b8sf34?=
 =?us-ascii?Q?tiSGOB0AoDfCwSHaiEFfJuFlUfAxjJqtX8BEeFVnHFXfvydEdHqymWs75Gcs?=
 =?us-ascii?Q?9RLVooUzvFP6pfFCu2hxiwRfT7eQnUx7CnLIasgtWxHygigPf0hVpoc/afLp?=
 =?us-ascii?Q?fq+mkHupXEf/VI5wl5g6quwRJuNZI2MU0FKGyoChQIAqO0J/cZkP48ynaxDE?=
 =?us-ascii?Q?Zg=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11332.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c859b8d-bb68-4e17-95f6-08dd574b920b
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2025 16:27:04.0720
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bZPWaZOmQBFCZirTfy/oa+6bgYe6VQqxLm53BOlkVaE2yZt4oIlNgfqhoyUlLYd6WD3M+G+zsjXDuzGF48E3tlGIROHCYLwcbIOFebwMqlA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11547

Hi Wolfram,

> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: 27 February 2025 15:30
> Subject: RE: [PATCH v3 3/8] mmc: renesas_sdhi: Add support for RZ/G3E SoC
>=20
> Hi Wolfram,
>=20
> Thanks for the feedback.
>=20
> > -----Original Message-----
> > From: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > Sent: 27 February 2025 15:16
> > Subject: Re: [PATCH v3 3/8] mmc: renesas_sdhi: Add support for RZ/G3E
> > SoC
> >
> >
> > > +			/*
> > > +			 * HW reset might have toggled the regulator state in
> > > +			 * HW which regulator core might be unaware of so save
> > > +			 * and restore the regulator state during HW reset.
> > > +			 */
> >
> > Since this is a hard reset, can't we just reset the regulator to an
> > initial state? It seems strange to preserve a value when the 'preserve'=
 flag is explicitly not set.
>=20
> Assume, this happens after the card is switched to UHS state and then the=
 command won't work in UHS
> state if we bring the regulator initial state of 3.3V ,
>=20
> In external regulator case, we don't toggle the regulator to initial stat=
e of 3.3V.
> That is the reason it is still working even when hard reset is applied in=
 UHS state.
>=20
> Am I missing anything please let me know? I can debug further.

Previously I got an issue, where the card was unable to detect after hot re=
moval and plug.
Now it is working without this change.

Not sure the previous issue related to delay associated with hard reset.
I am doing more testing without this change.

Cheers,
Biju


