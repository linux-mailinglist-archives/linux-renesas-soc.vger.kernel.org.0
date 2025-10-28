Return-Path: <linux-renesas-soc+bounces-23771-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 981DCC155AB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 16:13:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 862BF1B21ACC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 15:11:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FAF133A030;
	Tue, 28 Oct 2025 15:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="tNslfIcF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010058.outbound.protection.outlook.com [52.101.229.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554E5223DD1;
	Tue, 28 Oct 2025 15:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761664139; cv=fail; b=UwBxnku+Qy2h9R8pySScH5cGLEJDQ/SjPUt2P8Dy6fE6HxTQLRI6ylpb2WxywZCUTXV97SVNGYIqaFNVSosyM2HuTtEFc/1/SN/nu7BFFrtoktlV32cFVPMvpMBdJIq3K6c3aCcCKj/HSj6PwxyBuxFTR71ZWcmWw4RuXITCjwA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761664139; c=relaxed/simple;
	bh=JzptUtMe91IIZXXMEyIG0uoE6MNGq0JZQZW95AqWUag=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZfofZ/KEj/9x5unpVZh0pXLddgi2ZPTM4CkKuKhG2RHQSlS4ZuU41kVnDciMsu7EIQWKBIXTEOLo9tixFc0Sh4b4vlPkzUQ8BuRpP0DMzlOtNy8zfuGobO4BbxR3lGseSVknzrKHtXm+Ewu2anJ7wTW7vTKwHPbpef10ia6XM1c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=tNslfIcF; arc=fail smtp.client-ip=52.101.229.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ogbW+3SXQRmwEgUzSvNEEz9gRrg38DolVps45pQdzFDPwkWA1Mf2bJiatcX4nHyPq0HMlPrYPBRKxZuevp5zTbEQRFSjIUGE/LhaPjXJZfTCvOHRICf1wPndhbDKfpPykxc7SrQ8GewTOQqPsf9bs4Yo0oKZ7w0ZQKPYd1QY5A14d61qzFtATcjJI9CqMKuRKe0cfbEAH+R/z6mRgwtSKcSO65Jo/b9J66nmwEdZm5Z6ianjuaj9EwBxfclCClg6Y7aprEo4WI/0hZiY3fM+gmTJcdjF1UfRJnJqdrlXcaB1oq10j1JOiIJskMyrtmr+7ViPINwvkp2AFAerbP6WBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ittlh8ehZXCE5cW3ciW2UpuqUdlKnZ4zIbo3PT061dg=;
 b=seqj8ydXfY/hAeH+8LBUaQqiRBPD1/WH5ufVqd3b6vBgH+2y8q/1oGylzzCrgVZXuVkvHNmMLRhp9G/sxOtOFadDQdbtMZQjjJQfU6rZK3v1jOhMQHN2372dDh/C5NgAiZzupwwaKDkBtvKylhoN8vhBfHRdXzGbsTK//bvNjqhCoQSMMKHVKgfPHxjHF+3pQWQ8sLNHEkg0/7PgXiB7TRXyh6A0UrKpPkl5BoXhKKyITiGCZxVuGGcw/o7kWJXyK7IY6b7b4cREd70HZj/esD1oF5Z7iUNReEROVzh0XHQyTqIBlSvN3sidgkbx7ICIVtcbSTz7QsA+dIKE6cnMzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ittlh8ehZXCE5cW3ciW2UpuqUdlKnZ4zIbo3PT061dg=;
 b=tNslfIcF3g/NGHwvJKfvr6Yi1gF0do8A6KTJzZcFQ4E1SmzozDvNGTwZ6a1Ius/Xi4eimwJedq7Phuyau9WflLfkoTC6qpFMY353pkffB6BkC1lRicGeClB2VG4yQe9/YunyjXZ3pv52njbxhvNVfQovswss3Vc77OTDnKsAcwk=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS7PR01MB11871.jpnprd01.prod.outlook.com (2603:1096:604:23d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Tue, 28 Oct
 2025 15:08:51 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.9275.013; Tue, 28 Oct 2025
 15:08:51 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Hugo Villeneuve <hugo@hugovil.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
	<jirislaby@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, wsa+renesas
	<wsa+renesas@sang-engineering.com>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, Nam Cao <namcao@linutronix.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 12/19] serial: sh-sci: Add support for RZ/G3E RSCI clks
Thread-Topic: [PATCH 12/19] serial: sh-sci: Add support for RZ/G3E RSCI clks
Thread-Index: AQHcR1j3wq1b0CnuVUKXsrbPNPXIHbTXpeeAgAAEJfA=
Date: Tue, 28 Oct 2025 15:08:50 +0000
Message-ID:
 <TY3PR01MB113462A9E19F5AF62DB26CA5E86FDA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251027154615.115759-1-biju.das.jz@bp.renesas.com>
	<20251027154615.115759-13-biju.das.jz@bp.renesas.com>
 <20251028105111.b0363ccd0eac7691191b6afe@hugovil.com>
In-Reply-To: <20251028105111.b0363ccd0eac7691191b6afe@hugovil.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS7PR01MB11871:EE_
x-ms-office365-filtering-correlation-id: d52bda4e-554e-482c-1186-08de1633e727
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?wj789KDTWk9U6ir/66kObu830x+y3Xdq3tIQuG8HegKTE5E1Ok0Mzq+MUzvJ?=
 =?us-ascii?Q?nFOOEcgkoKZO/uQwAU33PAUB7MFd6//L+LuCJU030sBKNp+E9gGRyf3saPK+?=
 =?us-ascii?Q?9wlUa1IWEZAviuMiNOqYD3OpP22g/jvO/KKXUy0TsdztWJ4g4u43Q8bKK2YM?=
 =?us-ascii?Q?IK3He0K1AY+5PZs58B2HSfrRRx9k4rUlZFsplJqgLoC28LSx6HPCU6ZRdAJa?=
 =?us-ascii?Q?AG9QJAu3TwiAw1YkkXE9A27j1FVUIJgihPNIC/7YmU+rwmB1L22AyvbEHQrS?=
 =?us-ascii?Q?3eZloD27B5/UjEU1cndJT7+SLrJv0xX2I+GACUw7aJP112UpXCLduVwuRnYX?=
 =?us-ascii?Q?rhn8f96S6NQsVFX2EKhFyUM0OHuNFJvR3SgtDdbldN56W6q/tBTxoLH1M2Zz?=
 =?us-ascii?Q?l/xIbvvsh7MR3yYaqulwTcBKxWHAY0T7OlS9hxCWJSgwQmJB8L0BCgpfpPay?=
 =?us-ascii?Q?+3GktOSSSsR5AOIa5kQcAk8D0AFtwTmZ6TVoW/koyRMp+X1o4X3N5oTlyczH?=
 =?us-ascii?Q?FHd/B8P1NZc/Ho8H1/7AW25kyLCVjf8nJ8i8YAZAnT2rw5iYWwJTWgCbvuIw?=
 =?us-ascii?Q?lE5jLhZl0Pxj8yiWTxu8X9NRWt74gn+CQpvDlb65RQ5NcrXQpCZkCVtW1eK0?=
 =?us-ascii?Q?ATyyxHZnNFoNW+Jbdkm5ZWMSSIaMYr+4i+yDczhT9rPwMcMZbkjIwSXhGi0V?=
 =?us-ascii?Q?6zNDWWgLw59Dwj7Hev8tE6+CtASWaTSTWQkRiNpBUmDFEf6fbLxaRmBHJ14X?=
 =?us-ascii?Q?EHticrRjZAuuQbJ7uy++mVPjPC3bcpridX0lzSYN8XY8+gpr5c187QxE0VkE?=
 =?us-ascii?Q?8+vHLtuq4fi42M+kT8vzs0CTPAaWs7nI/KsFbNAIm0NXzgqmhlnMwLvmlE8Q?=
 =?us-ascii?Q?4zoThZDZHuRAFQEMFuiptTxhKTG9BggwhqOqWVLcGzbUSjTMdgCMQXEg3yeB?=
 =?us-ascii?Q?hxrCYiZ70pvdeh62qGJZlAnIymY/QyzHh4ZeS/e1VlolnFxcf0wmFMlv3vuA?=
 =?us-ascii?Q?gf9RyWpy59Mh2uSNUq0OlwAfmE+w4W451IqAGfLVZFh7adFMOvrZamv9sLbE?=
 =?us-ascii?Q?uMdZCEeAoQm2NIX2uFSVAt4A4MPD1JZGafbwWXsyNkEiu1lUwmgCFsKE4ulU?=
 =?us-ascii?Q?pK4EHHkUv7PmKPUt3xic6sdBYLa18x7BQSOqFmjvGArVsxbWkNmXoK5pmXe+?=
 =?us-ascii?Q?kVv/WKZzZOIH8/d/NA4IGAc1mGyzBq/eda88cdzmnBgceN1hV1aEp4j/hgLD?=
 =?us-ascii?Q?syHhO1vHR0xdzdn9AeCNWbgYBCkrKa0L59rugVxuehxcEmQuPKRlKqPRfABk?=
 =?us-ascii?Q?6qlxeSht2NF+nq+leT/1N/nAr41MvJmkAHYwjoZnkSwGnFBrND0YlkvO4zym?=
 =?us-ascii?Q?rmoi1z+5Pcq9B+UWt5ipwEWYD0fS3NiTWkkVqbLWXCyRh6EpbSk/5oxmRhPa?=
 =?us-ascii?Q?CanrzIkrXuLEegmT9FNW6hfC41jihu53ooXZLgQ+bOMEUyVJQUjJ9QVRjIdt?=
 =?us-ascii?Q?rdi8si2Gdy2mcJcfpEHMUQTWU/OFcKNg2FIh?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?hDOagrOIoHoLKkwlR/Z+F0YvGKSGYHrcHmSebMpmJrU+D9Ua08kQ2Ns5tKcu?=
 =?us-ascii?Q?2c6p12jESMA3N3eJfS0A3Cv8LpOMWpSZW6tD/GaWK18ggpeNiO8z1Y6Tyucl?=
 =?us-ascii?Q?wNLtj4wqFp8hXJWC96SkE5+fgmCazaabPkk2eMG+1P711gAd8CYhWcOwX0n5?=
 =?us-ascii?Q?DsbTWYffTSeGFoq/bXtUh38Pfy/BTyVEvHOqwP9PKwSwj0deBXl67jgqpo/X?=
 =?us-ascii?Q?d3D2DuO0IvMa6sYAflMQLalkbXa/iczA6Wris7VqtxzwKCTmcscTd5ok7/qr?=
 =?us-ascii?Q?+wjTlhKwipOFKHE0tC3C9kfJdALv00vRyybQh2WrZPcckJN/l33q27JeAjTA?=
 =?us-ascii?Q?83voWl0i1DhzKuc/o8c4QBT8Zs1XagB0PbbZWy5690ZN2YcGuRodndXWLlhF?=
 =?us-ascii?Q?b9iVFrQ3Fwkg6O0c0rdvlZ/wiEkfsjitt17D6gu5PZh5/EcNnEuG1/JbLsMO?=
 =?us-ascii?Q?4R3uaReJ+iCyHsDT2z8VA0a10kFDEDGJFacwjnBijInKVQ4XgefUbtD/YvRn?=
 =?us-ascii?Q?dSzv5f9fE4EOb2knC1cRDvMJQRI6I4RxaNkH1qPXaHZj2GQuJ3vm1XRJNR12?=
 =?us-ascii?Q?WFBZCU0GVfKPNL2eGvxaILb2SxxYwl0a5UZqB1QM0vPYAiVa6+Z4bq91hQ9i?=
 =?us-ascii?Q?+7YOgvnSVX1Mja9EXinSYVeF4e/Ody0v3C5JcSwLQJ+mPOMCdh+PiTIMdhp1?=
 =?us-ascii?Q?yaoiRvplCwSfUAme1rCMt54Uh10mLVQQTXQNR1aguJv43CkRcrVoR+/B3gdq?=
 =?us-ascii?Q?H0gvQpJSN8R5BQA3t8TqMORHlcOYFHkSxWjmgjbgy9+gNrg6b2kq0Sv6KmJj?=
 =?us-ascii?Q?eCa+X4tpm+YBql2myg02DRf5h4PgJbpJRU646MjL/fi9GDvzTs8ak973Mq9o?=
 =?us-ascii?Q?Oi455/WJ5OxDZXrxqA6A/h2Z7aYBzHSLXS1WlDH59B3aI3GrNh9k999bBLoO?=
 =?us-ascii?Q?6v+PbpXiE+p0Kwy42jOR3e4yyLgDTDj93nOl2kx+mw6Rgmi2sfJ5DCNSPOJP?=
 =?us-ascii?Q?ZYWw+o0h5/tz5gSXsGYDcH4VCkRjAGIN1ZfeJvoru3QrEFTIns+6+OSoeTBk?=
 =?us-ascii?Q?X0kwK18JnbY3fQHz+eZkQw2GCe3Qc3/euyL2Qutiyd/o4LvsUKkJznxXdPR8?=
 =?us-ascii?Q?WUVH667+Z0AX0CGY8pS1FI1ln1KHMt/hZnNuFmHnAluA08cP/4LfaJkBtvno?=
 =?us-ascii?Q?BQ700IQw6e5WZ2+8HN/x5N3e7Pi58Bj4nKSCXD4iMEhyBByrFhsigkJwJcEm?=
 =?us-ascii?Q?EtUyNkh4LJ/tuTlLX7QJMoqnLepDeageFSySUvN1Ev9nzpwADXSxJw1BILMp?=
 =?us-ascii?Q?dUskGL7CC7oW7n1YMfK3UiTyjvltSzuhzMZaKN+5ua41a8RMCn4ropVsDigW?=
 =?us-ascii?Q?ID9UFIATVOLmBr2Fnn1dSm1On5Z4nb0nEngn0rwca49EDOLsytXJGZUNW3Nf?=
 =?us-ascii?Q?McB8kQxAn8pSXkonBB6CpyBpmNlLuNQnwxfVihG4LlMJp07DtPUOlKEMDsPK?=
 =?us-ascii?Q?8cckyU+722xAg5lhL8+z2hsqtPWVEWMz6oEj6Wsr5J1hsJ6gGN/a0cInp7GT?=
 =?us-ascii?Q?M8FkhEHf5cFGZSh+nBYPqAF7pv0Evx3TPThBC/PZeVC4UW5WaP3cN034bbIE?=
 =?us-ascii?Q?cg=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d52bda4e-554e-482c-1186-08de1633e727
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2025 15:08:50.9907
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 75DwmdhlOIuQBSK0tljFhvdWLWrqchXA6AwSEEqEBbDmFPlpK1TvnRHcY7TvPUwa0+kMrX4Fl5CuCoFG9GC/50nAHeCAef1babp/Qn2cRWA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11871

Hi Hugo,

Thanks for the feedback.

> -----Original Message-----
> From: Hugo Villeneuve <hugo@hugovil.com>
> Sent: 28 October 2025 14:51
> Subject: Re: [PATCH 12/19] serial: sh-sci: Add support for RZ/G3E RSCI cl=
ks
>=20
> Hi Biju,
>=20
> On Mon, 27 Oct 2025 15:45:59 +0000
> Biju Das <biju.das.jz@bp.renesas.com> wrote:
>=20
> > RZ/G3E RSCI has 5 module clocks. Add support for these clocks.
>=20
> In "[PATCH 03/19] dt-bindings: serial: renesas,rsci: Document RZ/G3E supp=
ort", you mention that
> "...RZ/G3E has 6 clocks...", and here 5?

5 module clocks + 1 external clock =3D 6 clocks.

I just omitted external clock here as it is available on both G3E and T2H.

Cheers,
Biju

>=20
>=20
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> >  drivers/tty/serial/sh-sci-common.h |  3 +++
> >  drivers/tty/serial/sh-sci.c        | 14 ++++++++++++++
> >  2 files changed, 17 insertions(+)
> >
> > diff --git a/drivers/tty/serial/sh-sci-common.h
> > b/drivers/tty/serial/sh-sci-common.h
> > index ef1d94ae8b5c..f730ff9add60 100644
> > --- a/drivers/tty/serial/sh-sci-common.h
> > +++ b/drivers/tty/serial/sh-sci-common.h
> > @@ -17,6 +17,9 @@ enum SCI_CLKS {
> >  	SCI_SCK,		/* Optional External Clock */
> >  	SCI_BRG_INT,		/* Optional BRG Internal Clock Source */
> >  	SCI_SCIF_CLK,		/* Optional BRG External Clock Source */
> > +	SCI_FCK_DIV64,		/* Optional Functional Clock frequency-divided by 64 =
*/
> > +	SCI_FCK_DIV16,		/* Optional Functional Clock frequency-divided by 16 =
*/
> > +	SCI_FCK_DIV4,		/* Optional Functional Clock frequency-divided by 4 */
>=20
> I see 6 clocks here?
>=20
> >  	SCI_NUM_CLKS
> >  };
> >
> > diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> > index 5f5913410df9..d45bdda2b6c1 100644
> > --- a/drivers/tty/serial/sh-sci.c
> > +++ b/drivers/tty/serial/sh-sci.c
> > @@ -2994,6 +2994,9 @@ static int sci_init_clocks(struct sci_port *sci_p=
ort, struct device *dev)
> >  		[SCI_SCK] =3D "sck",
> >  		[SCI_BRG_INT] =3D "brg_int",
> >  		[SCI_SCIF_CLK] =3D "scif_clk",
> > +		[SCI_FCK_DIV64] =3D "tclk_div64",
> > +		[SCI_FCK_DIV16] =3D "tclk_div16",
> > +		[SCI_FCK_DIV4] =3D "tclk_div4",
> >  	};
> >  	struct clk *clk;
> >  	unsigned int i;
> > @@ -3003,6 +3006,9 @@ static int sci_init_clocks(struct sci_port *sci_p=
ort, struct device *dev)
> >  	} else if (sci_port->type =3D=3D SCI_PORT_RSCI) {
> >  		clk_names[SCI_FCK] =3D "operation";
> >  		clk_names[SCI_BRG_INT] =3D "bus";
> > +	} else if (sci_port->type =3D=3D RSCI_PORT_SCI || sci_port->type =3D=
=3D RSCI_PORT_SCIF) {
> > +		clk_names[SCI_FCK] =3D "tclk";
> > +		clk_names[SCI_BRG_INT] =3D "bus";
> >  	}
> >
> >  	for (i =3D 0; i < SCI_NUM_CLKS; i++) { @@ -3018,6 +3024,14 @@ static
> > int sci_init_clocks(struct sci_port *sci_port, struct device *dev)
> >  					     name);
> >  		}
> >
> > +		if (!clk && (sci_port->type =3D=3D RSCI_PORT_SCI ||
> > +			     sci_port->type =3D=3D RSCI_PORT_SCIF) &&
> > +		    (i =3D=3D SCI_FCK || i =3D=3D SCI_BRG_INT || i =3D=3D SCI_FCK_DI=
V64 ||
> > +		     i =3D=3D SCI_FCK_DIV16 || i =3D=3D SCI_FCK_DIV4)) {
> > +			return dev_err_probe(dev, -ENODEV, "failed to get %s\n",
> > +					     name);
> > +		}
> > +
> >  		if (!clk && i =3D=3D SCI_FCK) {
> >  			/*
> >  			 * Not all SH platforms declare a clock lookup entry
> > --
> > 2.43.0
> >
> >
>=20
> --
> Hugo Villeneuve

