Return-Path: <linux-renesas-soc+bounces-3369-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFC886E300
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Mar 2024 15:08:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4B8B7B224D1
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Mar 2024 14:08:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54C82A40;
	Fri,  1 Mar 2024 14:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="VzePblJt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2055.outbound.protection.outlook.com [40.107.113.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859BF386
	for <linux-renesas-soc@vger.kernel.org>; Fri,  1 Mar 2024 14:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709302133; cv=fail; b=L0ByIoAfIcqWM592bdFa9r+Gl5une8aIo8fEE812TH0LuwQQ0o9yb3VOJHDYiPjn6/T/bocGve9nR2CYmDZt1VjGSf2r09KhgERnJaUVRdb/hF9NPOhNmk/TzVYUCAAIz89rTBWiqdiNyUTIHt8Rqqvue9aLzw8vdfEHhI+5AmY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709302133; c=relaxed/simple;
	bh=aNN5E2nVEMmOf6YKrLTF9L/9+Po+rfESGZrwNmBxAZQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GixbUMpdIgSrbVXkB4i8uPqysCx574gKJVYoucElxUMMTvPoHWBxi1EY2qVegV10+mdSxZaCqEoL24sLSyajC1jkakv6uQjH+9PYasJaozDJhz8wSDHX0POFws7toZo8VVg4BnpeObasLOBAgG08yhtOCG5OuEqEj/lLVX56lB4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=VzePblJt; arc=fail smtp.client-ip=40.107.113.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d4wqpfJRX7/bHJBZg2Ov1fZEaeiv2gAI7mDYfj1v8LvDF6b3qlOUUj3kt2xclj03NZ2ohTloBYh8ZvsZVexMvX4OZdQkNZpnYDw+pUJrJz5BrS7I22zUulHsfVB4i1iJ3YHymkTVgtYx2jsE8gtWyVDxLLVgxwL6Su35QbIPH+SDwTu5q9frNNP8j8l79OI/nB83NDvDqKfb7EG+Uf654i+hsCyQIFd2EYBK+EownI5Oh5T2t3O5un9KZrX8OQWoDNs8VTPPiks579pzImDGASIqg3kArFEfNT7J5YSxH2js2OF/YsMG/fUjid8qbkgEaB29JfeeLJwBc0eLdOnWGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7K8H9GlnHHh1iBRL5P+baL86pqi2XBlRGrzIkVyPXpk=;
 b=cZ5fXiEi9BGyaT1wouLP827QPKqCpGTElwAp/ZkKUagZz6zJ7bkmUGvW391qwWLGZLDyF4S4ZVUWJUBnwcNBdsUSLqgnsymverj6KETD3SLKqH842UuJDrvKWAe9gvN0UMMtaMY7abY9ZcAKjjPD93dMVTQDp+Z4fXdE0lOuarLryvoXQoXYWaufPxdYm7HPlTS4azkWv+ACdNlyieiqnENoD2trpXnmSoY9lb+uLEb+jZAZyf6EiVD3o3R8Z/QPEM+yKPXKko2+arGTWGkU0hM1oeE7vZwl75+7qOh6l+GKGKyDw/vLyedA3CkL97PI2T5Dvr1h+By27RfQXy84oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7K8H9GlnHHh1iBRL5P+baL86pqi2XBlRGrzIkVyPXpk=;
 b=VzePblJt72a3xuzvhhrR2b540nHQCLG73tuXrD8rk+UP+sWr3Zh2kse5jqqGcNtYhL6cD+FEPuu3fK3jm6+GLAVWBQQFBmRK8jEqPIn0M/fBRVQOXIjysjOLyBA5hWPV7iEtQG4ZmW/lhQdUX1ExtwW9AMJU2WJcFS7isR13Zws=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by OSRPR01MB11523.jpnprd01.prod.outlook.com
 (2603:1096:604:230::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.32; Fri, 1 Mar
 2024 14:08:46 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6719:535a:7217:9f0]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6719:535a:7217:9f0%3]) with mapi id 15.20.7316.039; Fri, 1 Mar 2024
 14:08:46 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>
CC: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Marc
 Zyngier <maz@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	biju.das.au <biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 0/5] Fix spurious TINT IRQ and enhancements
Thread-Topic: [PATCH 0/5] Fix spurious TINT IRQ and enhancements
Thread-Index: AQHaXafXgN2WwhYqHkiPYeodnMDjw7EjB/lw
Date: Fri, 1 Mar 2024 14:08:46 +0000
Message-ID:
 <TYCPR01MB11269567609B2A2094D11DA29865E2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20240212113712.71878-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240212113712.71878-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|OSRPR01MB11523:EE_
x-ms-office365-filtering-correlation-id: 484075e8-b2db-450d-acfc-08dc39f91c8d
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 eYLm/ilV5iL89L3y8EmqSUiBpY90aul/rzwduIq5w2uydhtmV4IgNJgOSW3kcpZlG9TWewSJ4WzoY8uiejit3KTEKPyXTRiN8Rq4rKtzB1xWFf3hHD3rVsoTCkbDD7Hm/gOOR2SGTjTew4GfEKpQ+KP0BX62mgrmw6MrhrNZe3btGX+yAzUJzqB9rmBS4vw968jPlQcYMsdDas8ubKCMZslnB2ARhaBeisoHG4glDtHON5YXcN529vvMbAaxCS6TH5zoN8suUYLlQTYF+YXmkNS2U3QTQuxfWIj3NEOa4luCgj2IrCabGMjmDuJPjLb7yYDJcmhJZnmJjKPwIT9+65eUzO/jB4it44VAR3YQULotA2roIcFFy36bVzmAOjgdG9zSYwu7z70lVXgZ5TFKehtw+MsdP3ZXedbnQMH86d4tmMonAJa4qqHtPv/L6Aehoptzg1+YFx7nkmAX7dbdKz6Q/YCaaNXNEn5eRHj0xFUhHBBCNVjz9RY5FFmZKFGznF/MELu6crXK+m/8J8ci/GcTY7S2V4I6VuxZ0xr41dLGxPoCm1kAvufqwyeLUNUkZp1r2Aw8uck8BityWojU1Ev1eZi61u4bOq2Bqp8NIL7bsv1S1v/00qkji9Tvl36Wqo3U3ey3VFj8V269Z1YCzgjyUJ2LsY55Ql6ASqcc2QpUxxG09n3YJOQm9NNHcpRFeN490yqMpcD08qXwTerb3n+yN++1EiLYgD5Pw6j8qVo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?H/0Diu9YGPgdshAaChqnxhtr+w3uQBGeXz/NlccLBgYl4GnC46AOmEs6FE4e?=
 =?us-ascii?Q?LIWtb1s+ORwm90e1xy5W85LE7ph5HQmjB4M0XpeCQtH5Uln+pvbvIEJJ5oez?=
 =?us-ascii?Q?cAMvgOBK4iC+2aWf9n+LWCVsd41x4Wj2RSBSz2wD6dhGqS8NxLxfX6xjnQBe?=
 =?us-ascii?Q?tEOP0cdXkOjNNFGjFxOiSV/3314yB7TOra1XX4ZWPbmg2anGn3sCM9PVzEkV?=
 =?us-ascii?Q?pydLioiy21RnMmO0HMcbkAvjLybBkDh1NV+4ZoxTZkwIom7GvcgeGY9yw8sI?=
 =?us-ascii?Q?6sFM6lYdZyNwqzCRtKcSKTGlT0igvW9ixQnMW1OVHWYuZywybTUedj5C4FV7?=
 =?us-ascii?Q?6O6rSmySl0sF2ZDpGLYFYMG+QozOz3lmT6+ZtoJyppi8K7r05pio87x/Le0t?=
 =?us-ascii?Q?+C437sqMCaBdhXgIe1Kb/B0aaF4pBLrWWCyuoTPrLYF8nqcF8CTgPiLPz389?=
 =?us-ascii?Q?H1lOOzuCLVg7H4UeB+90qNXa3Q5tMGW5n/kPFsNf373ZOUKi3nmit2yXAxV7?=
 =?us-ascii?Q?whamNpAlVUMVOSLQ8oopgMGj07wXfylyINYLW54g+Sn5u1NYd9oGT2+O1aDA?=
 =?us-ascii?Q?VlVIJSlqfC6s8kfW4K2mAtLaHeGsbErVuA6hOkOxWaP+gdJBderoGMOYZoV4?=
 =?us-ascii?Q?WtKIVU8ytW7T8livdAbNIOPITUEpYA6kyYiJmG5tEN+RiQIcK7qmDAW8dqsr?=
 =?us-ascii?Q?saM9CIckhByfg5MJAf7uGjA0scnm655XL5+6Cm4eotWdVRCO9mqD7lJlHyEs?=
 =?us-ascii?Q?a1PhzM2aT/QoNVjsyhHAI6qUbVDY7faxBVJP/0/AurYq2Uz8sAe5zUiBRyuE?=
 =?us-ascii?Q?L+f1u9ZUV0Wha94z/qkvNSGE/RrsNHr2XcddASYmpucFxiH/p5X9OlZIsCes?=
 =?us-ascii?Q?3wCnI0TRYCnykmFw7m+4Be/7GKWnerY9LI6pRS4Ras1ULN1HUxfWQ40ZtiUC?=
 =?us-ascii?Q?ukmHemqPgIuOKvDqsEcZnbYVL4tCFMVIFKV77XqhUBCjFjCeumgm7Bw4WMRx?=
 =?us-ascii?Q?cHzzNPa5EKyrLFf/TrdE5QShfNzf5cbZJ5PYYBmZ3OyTKYcZCeU8tsqRM9F4?=
 =?us-ascii?Q?miN7idCRZiFBFzb0hIQt5e0BYXqNzyEb69/kHuih+zhzKmCmwyrwc2xTqazT?=
 =?us-ascii?Q?w99+US7B4o3UfSh97QLn5NXtZ+19Aj1muyrjUqC2iKtt08oz9R9mbqWPrPTH?=
 =?us-ascii?Q?wMMgxliNRPZl1tuX55xahJARm8G0gUyxLdmn8nD4PTau7F+vaFI66UKJcLaf?=
 =?us-ascii?Q?InQxmlwa/gExFgYnVHFETpuaUgpD9uuyFa9UBU416/I+iiqn5/jX1/7kWnf+?=
 =?us-ascii?Q?Wj2KPui+g4m1Gkzqo6bpKjIc3VdDLDt8WwT9hVc1BHSDMlFBM5+tjjOCfMLi?=
 =?us-ascii?Q?eIz24HSF2NqHJmEz8TEgkgr1RlMKW4HaCD/GVqMjb4DljGwnVhxGtD53ihuf?=
 =?us-ascii?Q?RN1woTv1c3g4JA4HQE1wzOjLITUbnU9PSpiw76KUNT+kt4yWwMSKSSWQcaFa?=
 =?us-ascii?Q?neuQEO1795Xy0bbAzop99gNq5FGlnbUtQFFMoy0/Am03cl7bM9n+yPyplmbd?=
 =?us-ascii?Q?4F+uH1HspyWk9846PwrWKGx8qx4PudWRXWPsk7wwMnYqcR6aTxcAgypg0Ie5?=
 =?us-ascii?Q?Kw=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 484075e8-b2db-450d-acfc-08dc39f91c8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2024 14:08:46.8288
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1bgWyjohBkvSPPDtTqvj18dIRh+9Th+atoVL1UZeeM9V/YXG9aKaB8L53aTKM1OY10i9R1qpTmJbxJQJ9zFtjx/HV0oBS6g3fpaQOY7Suq0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11523

Hi Thomas,

Gentle ping.

Cheers,
Biju

> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: Monday, February 12, 2024 11:37 AM
> Subject: [PATCH 0/5] Fix spurious TINT IRQ and enhancements
>=20
> This patch series aims to fix the spurious TINT IRQ as per the precaution=
 mentioned in section "8.8.3
> Precaution when Changing Interrupt Settings"
> of the latest RZ/G2L hardware manual. As per this we need to mask the int=
errupts while setting the
> interrupt detection method. Apart from this we need to clear interrupt st=
atus after setting TINT
> interrupt detection method to the edge type.
>=20
> Patch#1 in this series fixes HW race condition due to clearing delay
>         by the cpu.
> patch#2 simplifies the code and reused the same code in patch#3
> patch#3 fixes spurious tint irq
> patch#4 drops removing/adding tint source during disable()/enable()
> patch#5 simplifies enable()/disable()
>=20
> Before fix: Spurious TINT IRQ's during boot root@smarc-rzg2l:~# cat /proc=
/interrupts | grep pinctrl
>  67:          1          0 11030000.pinctrl 344 Edge      rtc-isl1208
>  68:          0          0 11030000.pinctrl 378 Edge      SW3
>  81:          1          0 11030000.pinctrl  17 Edge      1-003d
> root@smarc-rzg2l:~#
>=20
> After the fix:
> root@smarc-rzg2l:~# cat /proc/interrupts | grep pinctrl
>  67:          0          0 11030000.pinctrl 344 Edge      rtc-isl1208
>  68:          0          0 11030000.pinctrl 378 Edge      SW3
>  81:          0          0 11030000.pinctrl  17 Edge      1-003d
> root@smarc-rzg2l:~#
>=20
>=20
> Biju Das (5):
>   irqchip/renesas-rzg2l: Prevent IRQ HW race
>   irqchip/renesas-rzg2l: Rename rzg2l_tint_eoi()
>   irqchip/renesas-rzg2l: Fix spurious TINT IRQ
>   irqchip/renesas-rzg2l: Use TIEN for enable/disable
>   irqchip/renesas-rzg2l: Simplify rzg2l_irqc_irq_{en,dis}able()
>=20
>  drivers/irqchip/irq-renesas-rzg2l.c | 88 ++++++++++++++++++++---------
>  1 file changed, 61 insertions(+), 27 deletions(-)
>=20
> --
> 2.25.1


