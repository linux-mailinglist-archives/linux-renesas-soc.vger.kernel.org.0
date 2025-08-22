Return-Path: <linux-renesas-soc+bounces-20886-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CED4B30F7B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Aug 2025 08:48:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE9B817408B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Aug 2025 06:48:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31BF92E371A;
	Fri, 22 Aug 2025 06:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="TzbHDTAb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010044.outbound.protection.outlook.com [52.101.228.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8B626E704;
	Fri, 22 Aug 2025 06:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755845295; cv=fail; b=gNPfqY4ix46ev1MSSrGKlwfOOLCetP5HxmiKO1HfaHHNzbCAp6HB+N1aAWQ49zwn8SOu8PUaM6+q5r4FA13XMo665qDPh8m1QaOROSFGvxHfAcROt17Do2yGzXkqxImsgPNcatpXgDEDJZHT79zau3Sf5kwdHVMKu287dpFxwPw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755845295; c=relaxed/simple;
	bh=qbJNy0xx0Ie2NCBSHNd4M+tNCLZgojkusbMQtxJdWeM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UWBMVt4ad/rCPTQ55wN8ioTACOzJD+sxXebtP7BYKdeF1+2IhFOawaGMars1yvvMsLWRHa03HQoFjXg7J6tSQ8iNFrns4ndLZu3s9S/g/6ksBM+IC8xle0H9s4T6Z4vaFK3oezPIvf/RyxDTOaYpmpKTui9mgjVGVfBf+tlBOgg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=TzbHDTAb; arc=fail smtp.client-ip=52.101.228.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eu3fu691C0EEGCr5qYbgMC97V1wZ0VsiN2Hfmsn/ad8DJjQIEN2qUbLANsGFONLfns0creIU6/Wp8FOPAlgEwOmfgi2xwgGTfDtu0oxsIX0eC+7rJuw1laiKnPWJfqsBG/4RgPub33jVKXrxdpRaHLzNBXszGYNYLaozWguEJZVwQoLrXlADw2n5ErS8GkDlM4FcQGRrr7XWnSIwY/y3CxYyAeKhHV5qY/uBrK/XW2d40OQw7idF7nGoAX1Y1l3iwqSsOc5/RaLkIUxMGC5snHm/oMurSji+OryaSRuMKPHEOUehoBWmmxrg/YigetHrrwok8b+qbgrJJdYEVORXsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v56r4YpzQOYbA7IxR9RVLALj5+00buG/0M/kAdc1CZU=;
 b=NsrnfV96QXA0RossLyZsHjDOsIqI5nHjgwMUQRQiCj8vadvQEBir/hkFo+rQhhaB4kxlMO4WM2SRssVqmvM6qDI9bZO/PoEKtI0p90vSI/NNOG6kwBt6AqZ3UcmhL5LPdNULbfeRoLgI7gFDbUf05IR/Lwb4cdE2em1hDfXObncOsm0gSt4lHlt6BO9xS2S9xKuzM6ETrenfolKMQhgM6CgusudIbNXsj8pojpksYunu7Ep6Zn/QDw98fs1Y0+0O4Tt7q67itcspUHbhV/4KdMH+E94uBksa86ixpjIU31uxfHbj4XaFrhSm3A0cgP/nuXwClndm/wvIfaQIQ7yXMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v56r4YpzQOYbA7IxR9RVLALj5+00buG/0M/kAdc1CZU=;
 b=TzbHDTAbsVBYFOaUDSV8EL/XoVHTHOVnWVz6B7em6g9lKdWI0ocpm52LsnDWkuTSEZ16mACFVXQX7PaGEnjJ3BRRGS05RSTiLMT9gBbLBt4EOONvRraUAvG2m0KszBhpl3DB5L7DFIYOa/u1Lr83qNtyJPjAhCGeq4Wdn/1Y/nY=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS7PR01MB13860.jpnprd01.prod.outlook.com (2603:1096:604:368::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.17; Fri, 22 Aug
 2025 06:48:07 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%7]) with mapi id 15.20.9052.013; Fri, 22 Aug 2025
 06:48:07 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Conor Dooley <conor@kernel.org>
CC: biju.das.au <biju.das.au@gmail.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 06/11] dt-bindings: usb: Document Renesas RZ/G3E USB3HOST
Thread-Topic: [PATCH 06/11] dt-bindings: usb: Document Renesas RZ/G3E USB3HOST
Thread-Index: AQHcEfZvZDRnta0l60q2xS4yxsPDG7Rr+UIAgAC25fCAALs6gIAA0KiQ
Date: Fri, 22 Aug 2025 06:48:07 +0000
Message-ID:
 <TY3PR01MB113463A076C2122107764660A863DA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250820171812.402519-1-biju.das.jz@bp.renesas.com>
 <20250820171812.402519-7-biju.das.jz@bp.renesas.com>
 <20250820-onyx-salad-c5c96f6bd480@spud>
 <TY3PR01MB113464F2ED8BFBB823B038C038632A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <20250821-arrange-exhume-aed87b75305c@spud>
In-Reply-To: <20250821-arrange-exhume-aed87b75305c@spud>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS7PR01MB13860:EE_
x-ms-office365-filtering-correlation-id: cf547fe9-4835-418d-d68f-08dde147d9ee
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?ykWFSvIXacz4V+MiltWDqu5sWF7WyNJXXA656lSsmoomPoOHre60z93TlFJ5?=
 =?us-ascii?Q?vvVfihaPx2M7KOV/nbs9tuR5AMrzZbgneIw4ofqntlCStUz4QhRwWoZCPZVa?=
 =?us-ascii?Q?UpPAbRKbGD8gV0iVJDwZiCnCGdgIPs+/QILvPeOzlGxCFcbyQ1P5Oj5CKkAv?=
 =?us-ascii?Q?aiRou/wAFJfsb+egL/o/dq5b/mxIgjQcLArStjc8+s+6Z4h/j4myiJf6ns0D?=
 =?us-ascii?Q?r20ZsgBQ1u5+J9oM2+f8Kb1UdCeVSFmQ7rYhOUQuWmWcurtNDWo3S3nTsmR8?=
 =?us-ascii?Q?arBJ2cYZrOGTfj1/i4zKn4bWPAOeRx5yfXtYCgOv9TR3jrlQG05U6pMKv6Bh?=
 =?us-ascii?Q?JmY/tzqp14oEJg+ChKOfRkMthoaFUfIZxpzJKzdbGi9/7bJLqrqu0ZeVZ1mk?=
 =?us-ascii?Q?DlC8K7d+VBk6JP1QmxfUx5ET4yRQ50ZloYsFx0FAgd0pYjtiqD/0esPN9tq7?=
 =?us-ascii?Q?7HJW0isRnPHYgkIb1Vuq3jKdvfrj1yusc9YljylrI3fXY+pgKpQVQPgYWY6E?=
 =?us-ascii?Q?uajHgA7CzX9yUs1dKeYA0WMLNmq7w2k1FOUxG26uzZNvf7hJOsXW+8p3ozD+?=
 =?us-ascii?Q?+cZ5/DIaZ7i7wMISkh1nQwskrlKt4fjU+rNcop30pP81N39ODaHHYPDq1y/F?=
 =?us-ascii?Q?DtRoLIWPYmkCJ70hXo7gutAyEc3Vlm22omidmA61JtvU3E+PlRPFdyhjwvHI?=
 =?us-ascii?Q?6QeWAIbunnIvACJR8Wlpvln5gdr+bpp3OnDMYWLUr2ViKPxJ+4QB2diF4W7P?=
 =?us-ascii?Q?W9orb377+ob//fuieHTRYfnW3WKVRKl4dSHUIkzJlLBhhmW5kI7y5GGn6JDe?=
 =?us-ascii?Q?9mxZd5ux8ovywkWTh+botgyUO7kv1UmfxQiS1b5KSvwu4UdE2pYeYEAhoj+X?=
 =?us-ascii?Q?714uwRq+XzlOwpmaA9sxtMfDLOS/o3jdNYuyZeeffGsO88SZ6Q+HYgHETrD6?=
 =?us-ascii?Q?CwB1x/ekjOaTUXquxZOirQCy7wvfn0IzHDunVvNO3wlw9t33VsOArAVunco/?=
 =?us-ascii?Q?eo6SI/2n/mRu8/C92eKbAfykyBb92SPUTwHveMqGPt6XIou93ptymnOd7yt7?=
 =?us-ascii?Q?crI3lrernSOrz+Sz9sJGmQ5quzR86P8gzFVUk9UARHmA+YV0ebuNGVZ2rGCi?=
 =?us-ascii?Q?PTzdt8fiU25KTmFViIKcltYsjr9hUtR3N7SceK421UKoEgEoLbbL4Ku42vCD?=
 =?us-ascii?Q?DFH53s/7JzaMkjrS8Jna+71eyqCaKIgiWQM+zFaltXXdBvrqHrQz8Tk+PN3Z?=
 =?us-ascii?Q?I63UsinYMukhqFpmUS6Z6cphP8W4fyfbOw6Ffz803LCZEF3o/gxivzSj8kk9?=
 =?us-ascii?Q?HeKqP6M/x+RXYLoFdxqPGzschslaH9kR3n9OpNqard0JqTRnBRP5xNlDepka?=
 =?us-ascii?Q?4mWxmhj9bPYWJ/74nlkLEPEd8+bvawS2NU/uMjXktJzhqn7BxOdDKTmmrqGA?=
 =?us-ascii?Q?VVVnFWPR7VY=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?3XQIPI73Ty0pfz2Hf8SygzmiDd6LAiCzd0c+k7vBbw9KPG1kEMheuK4vboBg?=
 =?us-ascii?Q?CMy6MtxQQN1ssuKTT75r+2lfftCtSEWoUCYAgrJnVlLxhbT02CLriAGtOpCu?=
 =?us-ascii?Q?+4MdYb/k5gU3jlwrU2sAj1pPLIxTnvXSbylFjM+3LBdOuzPO0j1cevU23YKo?=
 =?us-ascii?Q?0jgZi6aWj1Dg7H0XqOFRbx8lDd90HNR0oBYn6Q+sGOmeEskwvAzgKNWb6/oH?=
 =?us-ascii?Q?a8QmEkuPpWs6esjfgE8VaVytzKLJ7bZfoafCI0rLLTNJZSNJLBHJ62Tvqfz2?=
 =?us-ascii?Q?11HUTQamVFoJq25fMwRM/AuDyUVE/XRAZh0Jrna3uhJETKP1V0Ibe2LSOUAE?=
 =?us-ascii?Q?xWaqgMycFBo5GoVNF6w3lsZ7tveLcBsymGhG8ljD5fLX5TmQB0D/wMOkEKUz?=
 =?us-ascii?Q?sOaj8GRkuhFjTZQaXewtAynhpEYIGjB8FTR6FHdKIdB22WOAmf/HBkEs28b2?=
 =?us-ascii?Q?lk86YFvGl9r0tEJ0qZKWYeO3eWffbSJrwVQd9Z9ya8GDxSR5FkXt8hGbpVqj?=
 =?us-ascii?Q?PDJ861dLNE8zNXA8x3+YjjqVSkCyAUWZQFQF9kp58Ox2yYmI1LMjnXWCOyc9?=
 =?us-ascii?Q?YcjE2pCq4T90FLJm/RBZJPpos6p1JjKk8Jkz58Aa8jcMYjdHTn7oDQnvXZQY?=
 =?us-ascii?Q?qM0cv3MrbB7pYD9I3ZNVhUZy+isQ8iyBI1RF4GAliJB8lnhYSKch+hCixHor?=
 =?us-ascii?Q?qT+D3M3xkDecaqeP0sRdVt5PQVbeb03dl5lvOkYdpcadN17Cr7qW5FZkJmbZ?=
 =?us-ascii?Q?3IXN+5wCTyJGwye8Q9jHnixACF9GbnjoCepuvujba9CEYMw0/uBoT/B/nWV2?=
 =?us-ascii?Q?IlQYlvCaJJah2jc5BvWAGR+/9l/GGZhnHGdIwY44pJe6qpxrodk1ZXxESffc?=
 =?us-ascii?Q?3/KgR8XuRq1Cxv5wkmBt5DfliadLpTTWkPD25OdDQgWT9ObNCsPkP6Uemv6z?=
 =?us-ascii?Q?2ieyBk+et21facTRiEli4mwhbeqdHG2wk5PacUUAEPYIe/gGVqHS/0D5WKpE?=
 =?us-ascii?Q?8hq9FCcMF8JrzNk8BpBG2CcgNoAmvG2rabL6EJOSq7sesWq4Az4sR65Lz51h?=
 =?us-ascii?Q?Bzlldgqn252xw/mn/JeollxX0dSLasNNiQe4JytYB+h6pjgO0c9Dtqh8cpMV?=
 =?us-ascii?Q?zB/uvfTE0gA9Cxssvv0xl07o14en58KYmRP6TwLzx8XQPzaovmg4MkxG9AQF?=
 =?us-ascii?Q?AadTR374REtgkp86Htqj5LcDwn+O3nOZd9Ol9s22Su4nq+4gqfZWnSbEcSK6?=
 =?us-ascii?Q?dF08ywFS8a//GtOdQXVvNCWb9LRxXHPUdszv53IvU265m6lCqTqcBnDgr9TH?=
 =?us-ascii?Q?nD1D8w5JMHoJFEFF72jSQJDU2lcdqkqXyCkYPIsrmUvHw2YzPVTmzY3+YnbC?=
 =?us-ascii?Q?LM+mFfTz5eIT6i4CUiaRNCBVirWd182xHaQVuwIi6bIHBhCoHtnaetWhPYXj?=
 =?us-ascii?Q?JeB4pED1iLyj7IbEj6Rvoc6iiCYzanq85Gf1vvmr6xoc3Dc4EIhjym/GJt9b?=
 =?us-ascii?Q?RpyN0hqLQapPkmu3h+XdTB9SxS2PTIk0pLDmih7Snlf1HQKz51RIk3Ap91yL?=
 =?us-ascii?Q?LP11HRy2T+iifrBBf4Uia+jMENDa7br7ef+YwfmQWbJLK1jtKRJqaieSvPk1?=
 =?us-ascii?Q?Wg=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: cf547fe9-4835-418d-d68f-08dde147d9ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2025 06:48:07.1637
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RNqyhzib35F2JVw8rM+wx/Vht6TYJ1qW9AOsUByLPu2XBQjoQgzZ0cnJtWUC8fMDduCKF5FX4qvpaNCGJe2qNKyIMnOsRs1p5KUUvb73CuA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB13860

Hi Conor,

> -----Original Message-----
> From: Conor Dooley <conor@kernel.org>
> Sent: 21 August 2025 19:16
> Subject: Re: [PATCH 06/11] dt-bindings: usb: Document Renesas RZ/G3E USB3=
HOST
>=20
> On Thu, Aug 21, 2025 at 07:15:59AM +0000, Biju Das wrote:
> > Hi Conor,
> >
> > Thanks for the feedback.
> >
> > > -----Original Message-----
> > > From: Conor Dooley <conor@kernel.org>
> > > Sent: 20 August 2025 21:11
> > > Subject: Re: [PATCH 06/11] dt-bindings: usb: Document Renesas RZ/G3E
> > > USB3HOST
> > >
> > > On Wed, Aug 20, 2025 at 06:17:53PM +0100, Biju wrote:
> > > > From: Biju Das <biju.das.jz@bp.renesas.com>
> > > >
> > > > Document the Renesas RZ/G3E USB3.2 Gen2 Host Controller (a.k.a USB3=
HOST).
> > > > The USB3HOST is compliant with the Universal Serial Bus 3.2
> > > > Specification Revision 1.0.
> > > >  - Supports 1 downstream USB receptacles
> > > >      - Number of SSP Gen2 or SS ports: 1
> > > >      - Number of HS or FS or LS ports: 1
> > > >  - Supports Super Speed Plus Gen2x1 (10 Gbps), Super Speed (5 Gbps)=
,
> > > >    High Speed (480 Mbps), Full Speed (12Mbps), and Low Speed (1.5 M=
bps).
> > > >  - Supports all transfer-types: Control, Bulk, Interrupt, Isochrono=
us, and
> > > >    these split-transactions.
> > > >  - Supports Power Control and Over Current Detection.
> > > >
> > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > Reviewed-by: Lad Prabhakar
> > > > <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > > +---
> > > > +$id: http://devicetree.org/schemas/usb/renesas,rzg3e-xhci.yaml#
> > >
> > > > +    const: renesas,r9a09g047-xhci
> > >
> > > How come these don't match? I don't understand your naming scheme at =
all, so idk which is even
> correct!
> >
> > r9a09g047 is SoC part number which also known as RZ/G3E SoC.
> >
> > I just followed the convention used in [1] and [2].
> > Please let me know I should change rzg3e-xhci.yaml->r9a09g047-xhci.yaml=
 ?
>=20
> What's the benefit of using that instead of the compatible, other than co=
nfusing me?

I guess, for an end user it will be useful to locate the document easily wi=
thout any issue

Given a choice to locate a document rzg3e-xhci.yaml vs r9a09g047-xhci.yaml =
which one you prefer
for RZ/G3E XHCI IP?

Cheers,
Biju


