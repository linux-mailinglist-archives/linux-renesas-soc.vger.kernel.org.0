Return-Path: <linux-renesas-soc+bounces-3745-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B0287AAD1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Mar 2024 16:59:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F7F81C22FAB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Mar 2024 15:59:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C006147F46;
	Wed, 13 Mar 2024 15:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="PfApwp4R"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2043.outbound.protection.outlook.com [40.107.113.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDA647A7C
	for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Mar 2024 15:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710345579; cv=fail; b=gNEBxrbeDhPmGUwK/46Bq7sapTk3IAfJUmAmRR7F4JCSRJQfPrzXCJSngFxGuoNIec+P/WmXos4Ql5N7TgpISk0nXTnOEHNxSvTUlC+3XydRrBEAKtWxu49y87iclAEiNO8jo/UrwedmMxq2NNCVKxJAIki1SlsHmoPXdNVBVEM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710345579; c=relaxed/simple;
	bh=zX6mVWdP8hd8k7c7i5V95P+C+tM76aJea3mPAijoj94=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tDcL6iKtFY7Il1nV7Ls1COG0qy4tTmzR1CCaaDVW4xxdG+QsduTriKh/36jQoC6Qz5x11uxAid+4jeud18bbHAdRqc1pyt+6HOX1SnA20n49Nn6wUcbODQ8k9EEcCiuQumFPFCGFzsmjoOsgiZK6TVL6bv+ncI+vRm7Mn+dgz1c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=PfApwp4R; arc=fail smtp.client-ip=40.107.113.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KdBZMn3OEa5VItUG5wQw17jsrQvAON9eVJ45GbDKQvNfdX5u5KCTZY/7BrujQmZH8htnCeFdf3iwOK7LgsprQMCNj6fUM0u4QBaQJFs1Sv9FgDv7yL1vsY8BrWl401655E2Q9Ga0EQB11kl/Ze0BXFbRQBPBSlAuELXqzwNOkcA6wH7+QGTV+I1DqwWGqopQwsPUf+JiPJ8njm8n2jDxRdiP75zfO9n3aXvL5gVPKCNwtNxYdz1N9bNIv5YQu5Hi18ic41uzaYDPWfHREPrOUvATkMea99Bf61U9S0l6Df9xmUDaNCFc8pyBKkwsljqsDAwKyLzzOff3EyBQDDXOqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zX6mVWdP8hd8k7c7i5V95P+C+tM76aJea3mPAijoj94=;
 b=I40zi/HGWBP2X+5rOPNOZDkxnFcJPOoxY7kef3XwCaM2qxEQ45nET+j4E9GdPeh70HBDNE0lHSPo0CNKZfUxEqdFw/DjUIaho/fEpPN9NtNVOZvEqEfeVGGkUbGRvpDkeW5OTTdinaUH3WSE+Q+Xr1ScWWc33PJcPUCTcCjJ0PpkexBBEzbnTgV0ATKd9EQ0rNKPB1TvKB3GLo7H4u6Bbb0aIu+HTq1xt2p7m2/WqLYlasTe5QXKpovkSkqZZ33YDkk4cUM8CZgrSQFWyFt7EWYK09uXMM5uzCLKdzrfQypjqxb7bacFClx1yFo5+HC3eQmPTRNkwZnvkzHh5dRYCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zX6mVWdP8hd8k7c7i5V95P+C+tM76aJea3mPAijoj94=;
 b=PfApwp4RCU/Mn42VKux5bz28UP2JFqaswCetUBYtaPU63Y9YDrDoSVGxsBEyPqP0boSGU6QjETs97qtp/Vy/wS5yLax4nGp3xT3DhIX3Hho6geS61CWhZ8pTe3Vo9agjrKpYr56y5wK2bgJz6RztcyYWLUWJsqVYiIFDkVT0vTg=
Received: from OSAPR01MB1587.jpnprd01.prod.outlook.com (2603:1096:603:2e::16)
 by OSZPR01MB6661.jpnprd01.prod.outlook.com (2603:1096:604:fd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.20; Wed, 13 Mar
 2024 15:59:30 +0000
Received: from OSAPR01MB1587.jpnprd01.prod.outlook.com
 ([fe80::aef6:c35b:b90d:2e3f]) by OSAPR01MB1587.jpnprd01.prod.outlook.com
 ([fe80::aef6:c35b:b90d:2e3f%5]) with mapi id 15.20.7386.017; Wed, 13 Mar 2024
 15:59:29 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>
CC: Marc Zyngier <maz@kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, biju.das.au <biju.das.au@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 5/5] irqchip/renesas-rzg2l: Use TIEN for enable/disable
Thread-Topic: [PATCH v2 5/5] irqchip/renesas-rzg2l: Use TIEN for
 enable/disable
Thread-Index: AQHabyx9nUz2ikiCc06PItpalmBxmrE12y+AgAADjSA=
Date: Wed, 13 Mar 2024 15:59:29 +0000
Message-ID:
 <OSAPR01MB15876D7985BD2DA5B0E25463862A2@OSAPR01MB1587.jpnprd01.prod.outlook.com>
References: <20240305183922.138727-1-biju.das.jz@bp.renesas.com>
 <20240305183922.138727-6-biju.das.jz@bp.renesas.com> <87h6hannrq.ffs@tglx>
In-Reply-To: <87h6hannrq.ffs@tglx>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSAPR01MB1587:EE_|OSZPR01MB6661:EE_
x-ms-office365-filtering-correlation-id: 7cd8edca-e221-4e3a-236b-08dc43769108
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 ad/rVUYffmbfmQC+rx8yknFhA1dkiQHamLeCmzuKTwzEZDprgExLDelhtVvLX3NAbTQfoJS6ogN9ShaCSCwadm1z3UPqez33ZdqhPnaD3GDEGSFamBm9I9NdQpi31QJsaXIB5uw+1KOFKMDvPpYn8S8x8GevEClQSf5WHSUNv2ojLyAF1Uhr/+ncUjcUaRbPL8cjL7O+qMiX49qjffn2yqFXWmQIkA4HOya3u6OGg8pNfn/td4s24rQT+xC35gV3GwVEZHT59xim9oBRSRCfZBlTS0ve6lebv76KldRU7YIdLkadTvgMiC1sjk1RGITTlfH9zyi/0JTfsdo4Y8OsHYTxLAoH4poFwfVUAHXEWQS9x0gjqD1AqwUB+IL5KeSR2+CiZC+lJ71pD4Ub5yyMlC4omAav+RhB/879R1Uv+D/GxCCfhylTJSqzWrp++8Q47p+E+XDqEBBVTifLkTK//+gC0oswhhOLv8mUQTm1/7rHpuEjLQEqEwTsFC/yncPYSvi+XOITQ0+Mn/+cXYSCFNGG/74nFuQfQi7Dd1CBiIlJYxr5hiWBtALW8FQ4GgZJZNe0GYdwSHyuYjUmEHX6BFpnwgIpwzxiGLAz/XwAEDOJn1q0XZ8l7Hi+m/yWPdkWElSgHa2vxWG9E/zmSJUScD+QW/C2w2S8JPd3b1sBAqoK8QmqagrQylhAnqu8nHzMuvaucjZKjecbGwYQhTizNozSBr9aUqHgxGgQFWgyz7g=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB1587.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?p2IBY+gj4pXy9yTf5ZOflF/W49BGjlQQr3i75SRrxBWbNfyjVY0Qk9o/ob2y?=
 =?us-ascii?Q?xehJ0Yv7c2q5r8gtMK396MFl+0hofwJ+ntf6YvqP0HpYJiWt12ma0ntCTY9c?=
 =?us-ascii?Q?Hujujk3yHHBkQj3UWeMkdGbR+iq1LTDgIDL9naAZq701gVuckRshhmRTtiuQ?=
 =?us-ascii?Q?TDYly2th+38WWVyyE0ljPo1ARf37o9c+qvAxAWMEXgDSq8GF0Xy6UcfsheQh?=
 =?us-ascii?Q?XrS1NJuNcZj4xsMh7tJOLPjCnbN0FWjSJa5VpeaqdODZFm7u9CRinGHyi6lT?=
 =?us-ascii?Q?pE5MFtD6UmSNb7+9k9+3OwsC6+b9VLYhDEbM/cHnBaLZcTxbtJLUTxe18yWN?=
 =?us-ascii?Q?l1c2e5LX35T4oxTfHmBV3xrcOcqy9QsJ3nEDhVhT6KkNFqMkD2x4knQlggvP?=
 =?us-ascii?Q?JSfLezIBx0G8MCMmo1UeCa/UTPmiEjTnJNg8TAaq+115U8F+tbIT3ZmyxRv+?=
 =?us-ascii?Q?YpmXgNieTZKHvUc65bZ7ACjIUML+l77jOYUmeZDHp04hCkiiEGuNCoAqDsbh?=
 =?us-ascii?Q?9EPQdCcbzcQpWD9xwxu2HpiPRKYharU4BO75jtXE0uG50qGXkoQ1rFNNhKGd?=
 =?us-ascii?Q?jMqhM4gO1cFb2mtjZmYY5253zygovObkLFrmw3fAqE4oNmk5L02gtBv5I1CR?=
 =?us-ascii?Q?MIanThEYKFYOJZhofK4Z8BfksgBdA5pPrRAPgqI8QRQtXwhw7dO3XSb6lIuR?=
 =?us-ascii?Q?2p2xbOUFx3HTGXOHSvld+r7L3UwSjZHhviLdj8UoRCEVlT3JYtA9yWQpDsqI?=
 =?us-ascii?Q?/ADRlLN1Blp7N4PAYvNSAYqUIFrlSJSjILcITNd0ss6Sz0xvnTe9yuKG49cP?=
 =?us-ascii?Q?bdn3d/ZAf2ee6vyOvzoP1ShNPa/ICoKqwNsmVYwQNRO/Ex33CxcCVU4Ylusi?=
 =?us-ascii?Q?5tyPBoAfpw4CL5kN/rsBKQmGNonV7MN8nBkU/nXDXrnd9iAGCE3Nj8izFsoW?=
 =?us-ascii?Q?JxdQz1kSElsO/zCHTLmY2lwGl/YchqeCCCARIV9FYz22EueA+HbkUS4a1B82?=
 =?us-ascii?Q?fpmwQUiF351ZnRr3zCX+tdbQ9cYJDE/r/+HZJVA4eg2KPVSxPWEGQnSWGHje?=
 =?us-ascii?Q?Gq6K/Ne1QaYEALazOtHBBbc5pLYRY0epKGjcH/lTARX7sHavk/8JQ9tdMFhl?=
 =?us-ascii?Q?eT2AsBoyad0gDfGoTo7QRgwsi0adKpN+XcDu6Kv3i6no6hhsZx/zC1NFgWZx?=
 =?us-ascii?Q?iYljwCSLMNygX12TAw/dJPXJ20iu/QtZnST+2CCYsbu/8yB+QgUcedUQqv4T?=
 =?us-ascii?Q?2+OruD12xkoT34X2kk7JpLg1aRtUr3UIC3f4EuyWJZ4gm2nfnfls/y5iunJ0?=
 =?us-ascii?Q?/YdVC+X8g2sP1YdLkyH0sXRNUWt4Kg/U7dmzDtorqcFZO4KJMgB4AFcdtI4v?=
 =?us-ascii?Q?nCwT+jSvQS+UFkozRD548zNa+xorPgTMmsZg7+1Uwp0RCIM7BovZ6cjAZeak?=
 =?us-ascii?Q?2vDYOn0zuKPNgww8rSEejndn9pEgaGWNUi6bNUGx0KsW/gscqIq8DKYtGFL9?=
 =?us-ascii?Q?tQy7vs0eml6dHqCaMn31sTxiYadTlLG6hkAkSHSdXF91JgrvX8AkBsEtgHwr?=
 =?us-ascii?Q?TA3RGUBf6S0+4SkyhOaSMPOYyVG6FLtc5RNW+BUgZq8npJNIYwssMwQOLZUs?=
 =?us-ascii?Q?Cg=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB1587.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cd8edca-e221-4e3a-236b-08dc43769108
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2024 15:59:29.7760
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vfgcB3l9pxB7HqYcjxyrK4z4dE6wVLQNMljzEHG+HDNJvegDBqFhEcm2bKXgm+rl2oOzDoLw9x/MD6tZqFXRWQzgBlQTWsiVMKgCPSxo7mg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6661

Hi Thomas,

> -----Original Message-----
> From: Thomas Gleixner <tglx@linutronix.de>
> Sent: Wednesday, March 13, 2024 3:40 PM
> Subject: Re: [PATCH v2 5/5] irqchip/renesas-rzg2l: Use TIEN for enable/di=
sable
>=20
> On Tue, Mar 05 2024 at 18:39, Biju Das wrote:
> > Currently hardware settings for TINT detection is not in sync with
> > TINT source as the enable/disable overrides source setting value
> > leading to hardware inconsistent state. For eg: consider the case
> > GPIOINT0 is used as TINT interrupt and configuring GPIOINT5 as
> > edgetype. During disable the clearing of the entire bytes of TINT
> > source selection for GPIOINT5 is same as GPIOINT0 with TIEN disabled.
> > Other than this during enabling, the setting of GPIOINT5 with TIEN
> > results in spurious IRQ as due to a HW race, it is possible that IP
> > can use the TIEN with previous source value (GPIOINT0).
> >
> > So, it is better to just use TIEN for enable/disable and avoid
> > modifying TINT source selection register.This will make the consistent
> > hardware settings for detection method tied with TINT source and
> > allows to simplify the code.
>=20
> I have no idea how the subject and change log is related to what the patc=
h is doing.
>=20
> The patch just consolidates the almost identical functionality of
> rzg2l_irqc_irq_disable() and rzg2l_irqc_irq_enable() into a helper functi=
on which is invoked from both
> places. The existing code already uses TIEN for disable and enable, so wh=
at's the change?
>=20
> IOW, it's zero functional change and completely unrelated to the above bl=
urb.

There is functional change. During disable, TINT source and TIEN cleared to=
gether

reg &=3D ~(TSSEL_MASK << TSSEL_SHIFT(tssr_offset));

During Enable, TINT source and TIEN set together

reg |=3D (TIEN | tint) << TSSEL_SHIFT(tssr_offset);

This patch avoids modifying TINT source register which avoids hw race
as mentioned by hardware team. According to them we should not
set TINT source and TIEN together.

I can update the change log.

Cheers,
Biju


