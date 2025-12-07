Return-Path: <linux-renesas-soc+bounces-25636-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE7ACAB7D9
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 07 Dec 2025 17:48:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 99D4C3016359
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  7 Dec 2025 16:48:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2417429A9FE;
	Sun,  7 Dec 2025 16:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="bIWC29oY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010071.outbound.protection.outlook.com [52.101.229.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A126F1C84DC;
	Sun,  7 Dec 2025 16:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765126083; cv=fail; b=SFqHplp8BQ7gDGo6NLXLEQpsU7uC3xXfg301WCDK9O06PPAYFadxmqJzli7trN5kbXIAQt8sNGhWFQvTNHLWrUTSd8zpAwM9tI5gnXGZZUKfdUc4tnBjA3S7N4FO+Px/6bI4bX7zcc3zqOMkSvO4BZ9mzKxyXrY9n2SrRJth/uk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765126083; c=relaxed/simple;
	bh=7Y8NhxrIiFdflP6neluA56nSS7rhZqFJKm7PLR5NTqo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=n/jabAuKZ5lt8TJMQ63dukRTx1lctxJXEwB5Pr+/Lj/h3yC/LD8+/Y/1lBAvDUq70+fKQYMjRf4SP4GlMORU16PCP1R0AlqyIuriwWx5ndgVYvw/HOyKFRtcya95yFi2rhwPJQ/5nIRpJldC5gfmnPtIKivE7J3KjlvGJGVnACI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=bIWC29oY; arc=fail smtp.client-ip=52.101.229.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OeftJ593MmgIcY1vusqnIOaxMimbuqd7ixxfdTTNmXM9EQHGeyUopGmCeBgQ1CTMqO6RCgqIvxtmYKD34c2bqn+ZIqzR9zvCqcCDIbsBJ8hnLSKC4lL/zpk88/Hubgs7TPZkWDj8VTzu9XrlWSpq4Urtu9LklK3BIW+3knQ5LZHi+9DbHhar8Fw5Hs1uM3PeluTnQFh6JetGlRXV03Ih+wdd6d+T86uWyb6tK/FVSkloM4pfHIM1A4mdRKNcoZLyjbfLDYNIpBv5VF93FGrIJD256sXsvZ9g4oPZHfuMmTp0+yJp7Cs+P0Hbdi7JIeSxhfxjHI/ouFCQxRfD6asDXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZcqtW8+fodv4eIA3XzmXv6D/WsVH6vvWmBFVWzYoL18=;
 b=AAbYGW6gWRJJr6Y5+Wu0f/khtb46fCi8gGZIgfmZ0jqEpN7xAMHR4JxloYkzpCKGfNrSX5JlROFaZpf2kzEyB+qUIkN6JPIyLtyvSEAXY6u+pdAhyK8h08nebWthym1OrOnNWDmf+TeNbL4pQm/6jSs1P7S+p6dY58Mk7czhEhQKuvgKsYmH1onrPHzbStyHoBLSTm44lcXAmi7PoaDbkpPEfHvlPiLjriuQunU4oD1LFeJ5DIR4xlDoI52Jw4bX6XlSY5w7HEif3XiCEv6ZmzHWzHrJCeQAzYJ21zlmQTazVk+2u02/PjmKpL3VQ0CTmMoY9YjkahMcXAO3WF2nHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZcqtW8+fodv4eIA3XzmXv6D/WsVH6vvWmBFVWzYoL18=;
 b=bIWC29oYb/c6vjpZVkVK+bmY0w+RXYBN9Kl6J6OGXIMFfhu6RfEJAkHKq4vcXNtPapd5Z87FG64j00XVJPFQlR4hKQOT9MOSUChRvGrG3YfCS6KM2i2KOvbdCdwRLbnyUHnRiFzvwZlUmDLSLN8K1N0xDCmFrz06fd9X8xXq9Y4=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB6602.jpnprd01.prod.outlook.com (2603:1096:400:c5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.6; Sun, 7 Dec
 2025 16:47:54 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9412.005; Sun, 7 Dec 2025
 16:47:54 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Alan Stern <stern@rowland.harvard.edu>, biju.das.au
	<biju.das.au@gmail.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 0/2] usb: host: Drop resume calls on
 {e,o}hci_platform_suspend()
Thread-Topic: [PATCH 0/2] usb: host: Drop resume calls on
 {e,o}hci_platform_suspend()
Thread-Index: AQHcZ3fosvRmsVoD4EmZfZBInM+QcLUWYDsAgAABjGA=
Date: Sun, 7 Dec 2025 16:47:54 +0000
Message-ID:
 <TY3PR01MB11346E9D561CAE53CF47F7C0886A5A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251207124742.96526-1-biju.das.jz@bp.renesas.com>
 <db985cbf-4813-44d1-a4c6-16826f935c17@rowland.harvard.edu>
In-Reply-To: <db985cbf-4813-44d1-a4c6-16826f935c17@rowland.harvard.edu>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB6602:EE_
x-ms-office365-filtering-correlation-id: 1c9c56a6-1563-42c1-c2e1-08de35b05e31
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?FbcO0yaYF6JHLk8ArnlzsL16vozCiyW411z93D3jQ6EUdl5T4mqCtqrtlARY?=
 =?us-ascii?Q?ARN1uG4N+VhMbHy9cU9l5m38ZyvsnrH2uaVR3LXGe0V8uF0OvC74A+I4pKLl?=
 =?us-ascii?Q?mxiyChf2oCpDSskxQZxK5kqYTMYCS7bKOyPuobWRi/6Vsyj6FtVAmMa/Deu7?=
 =?us-ascii?Q?moNbL4jK3B+9QghAqqTlp7J08Zie21RuQB08dpWL4rTpzyPOx+m6ytWfU7+G?=
 =?us-ascii?Q?Mn+N/pY2tlwyDdUsdWLA2I5PfQnqDy1Z0TWgVEXvzCOBvnuleIF15oZAual1?=
 =?us-ascii?Q?mDesiLL5VrqrcMG15qvxP1jvP54vZ/w/FZU3q8S9FxXP1RwhXrWCGefuT/Zq?=
 =?us-ascii?Q?qB4cfTTv1UmAUIUPFMJE05rp71so9UJCAkrF49BvRPnRs4y/fX+rhINhVtDp?=
 =?us-ascii?Q?G6bgsfeNKeHgOXph5UmAMsgYYco8jsaUzmfOSdha5aU69oLLpS9lOxE3HoZ9?=
 =?us-ascii?Q?uS4eMDGrwzezhQ5osOU2DHJw+Swmwm19NGtBLt2Q414IOrXjvMQ0wtdutLV4?=
 =?us-ascii?Q?omQeFwiqWV6lMnl1uXY9tDf8FSw/yQ535OUlvqOXc9KN7DW+xy7VASerAIjo?=
 =?us-ascii?Q?p3cuR9y7s2qnjyPI0KH/KQkPmuSSBRtGdmVk/XceNQlCvKM62At/xIQyHXwX?=
 =?us-ascii?Q?oUylm4S61z1YVYYgiJ3x9+D6+vRcpPRLtGYMOAu0q/emnI3CLBJQ1Rj5WMdq?=
 =?us-ascii?Q?6Pe/cpTuIUGt+wEPajnfCghN3ifzPJ07RLWYDD7HezbdmIZQJNj1iqC2W+oa?=
 =?us-ascii?Q?2Km6Klclt7BT2eWrOhmRw6Ew9dIvX2yyb6VLnEwKli+GTrIFXCLXTrIFmfFR?=
 =?us-ascii?Q?XFb4X95ORqT6Eo5n7AMLcsEpQFLw+U0PskEKc9r+4YV8U9Kx6rBu/b31Cth7?=
 =?us-ascii?Q?GFZ+83s9MwqfssZ3trz81wSqerOh4LAtcKRFQZlVN0x/xY1gGyzAD8tqeWmF?=
 =?us-ascii?Q?8I+WQ3iezYTfWfCOpSPHjR4zouIlYxn39spJuThi+DpHypffWlC01EzUXd3h?=
 =?us-ascii?Q?eCdrPkQ1obea9L+w2Q2ISpGSF+tsob4Rm8e2A0jvcEVnQM8ovnhblbMthpjo?=
 =?us-ascii?Q?EaSCiRzFuMUpHVBsf9O1R6jY/rAoC0ywxlgxbYDrT9h69cjFGo9UAzO/nkn7?=
 =?us-ascii?Q?aK77Td+jenHlvaCUbHa4UIaDkIqpjG+D7nvtBxbH6h38oC3PXsKbbe5+ZhQ5?=
 =?us-ascii?Q?fgl0h/nPTS5JAwbToGaSaR90c/Nw/Ubqlw8UZzeBYFoRAyM3SOBK+mlDtCwm?=
 =?us-ascii?Q?+bh8ddDcUHSL5AusS3Py7jqwj0zASmbSpPSid8J7rBmZuWddAHzpWt9ScmFa?=
 =?us-ascii?Q?z9Dx04HXuRQZiVu4nsqcSYmL9NJcame31TMQlONRXZvkNoTFAJ7m1kQK2QX2?=
 =?us-ascii?Q?EJF2QniusXiAsUQSRf3LlrAUO8DcYu/7iuLZArGwOhRahfjIq7b+QrVgtgpk?=
 =?us-ascii?Q?N11DX7IPh3EAJt26LXxLS/L48QHoZQOOsDn8YLXM+y2nwbRJV+b/OAGbAj3m?=
 =?us-ascii?Q?PuSTHS+XHhm/+U31B3INkwfPY0WWAERwjOqq?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?H0O1gq4/f9WEjmVclcFg7Yjz6NUz7VAURthdaTo5IWU0to1nkULy9zi0wyRN?=
 =?us-ascii?Q?sy9lO1ZJuTxs99LZkJPjtdiZrk0W71bBQm3kg3DAsRImDEHKtu/37kbbgei5?=
 =?us-ascii?Q?zw/In206w/2/bPTQNlImKWYNZ9Jrac8JLWoHSn95kmUIJIGZ23YGCurB8PXS?=
 =?us-ascii?Q?GZX6mEJM56JBC7/HJZKmDxvaniSwlCIWdB6n1EJ6nhg5MS2m3XpVwpvZQ6vN?=
 =?us-ascii?Q?H1iuMd3D8nktJIgJUaNng2FQ6TcTxz3tt56D4KZ3jNgtIUb23w+VkQ8Ehqzt?=
 =?us-ascii?Q?uyiAUp+M3Jsby5zOhHOcgFDBbmVtVAogODaH9BB5uCP+GZ22jy8sGRpvrzy2?=
 =?us-ascii?Q?CWmMbO/62kd+wkUslOPtbHo/npDowRKzjtP7TqoH8WJlrwyk3LrAU08swO+G?=
 =?us-ascii?Q?YIbGTMpWYNuzvgUF2zCYwG3QFI+00QYWqJmaSdyWYvaOQONYig64MS1YkvZ2?=
 =?us-ascii?Q?vAMCQCLtceWvFYYc4I1frRpVPRBI6U+vvtWGerxarSsWeHhpt4q5LjeLbNfC?=
 =?us-ascii?Q?eWrbE34jx9X2zEqwUZDwWfVXY0k4d08RV2mgBwix2taQmzHdoDWiQRuNGM36?=
 =?us-ascii?Q?ujNu++bTIBxvTHsZJi9BdzuokVkAXAExOHlwcCte8YdxiB3nILuOXlSvY7f4?=
 =?us-ascii?Q?+zr8m63nWKE00G4ULeqmAp2y3eJFKZt7RxDFONxyAQLrD9iEp9PHdx0xDF4b?=
 =?us-ascii?Q?eWVQCGP4u1VhZsQozoF+VoKIKOChwTSJIDyZApzeOCEW81HKnBkJ2dsHKpaA?=
 =?us-ascii?Q?BZcOvkVp8PqTj4R+r/vMCald9NFA8PF5Seuq6wgg58jtrMed9FG/uIlohTsl?=
 =?us-ascii?Q?/NcMFE5qhCA/w0oI1N2GiK3hFIGJ+ZxEYLRdC/GQ/9ZR+gjeBvy22Bnq4Fls?=
 =?us-ascii?Q?eKMSZIM3zzhP3+/6hR3mey2EVBKpHvwAe4FqgOaMujMZOoGuNuhh0m7d599b?=
 =?us-ascii?Q?u7PRHcN7qLjVvKRtIzdOxlRIf1JcTJ8dydQSQgdWZo/qaM+WYvcD9SHkIUmD?=
 =?us-ascii?Q?iBox85D6M/6u7snK5eD/iIcofLMkQyiUrCppEoDH0CnoXA4yjv/je0TIUc6x?=
 =?us-ascii?Q?KIl/CHOw9N/8VqvDZHKOU/pHIKXpJYO5ZDlwUvUiVjkt5pHXEJM+aCDK3Epb?=
 =?us-ascii?Q?MV9sjj3qilwERkF3SXltIieIbsW0Julf1fkkh8sEHzkbFzAvhxsTtd6uWPKu?=
 =?us-ascii?Q?16kiCarzuucnvMCUNoizM8wc0IDXMNhs+RyfYpMSQy84pzCZig+sKoIJVS5L?=
 =?us-ascii?Q?HdCEAYTW82fhvmqUoW9sU2MBAQpduv6+umV41sUKLjSwrROSU2GHvoURiqKb?=
 =?us-ascii?Q?mMJEdNXBZaKICCfJozeqKYNK95JdhldbUE4MilDC8aqH07T/qceIEReNmBRJ?=
 =?us-ascii?Q?+Pyf/6pFsad8BA6hYisuYmPSk+dXbYfTMFUxCYLhcWH4LP6KxP5Bf2tQ0+BP?=
 =?us-ascii?Q?JtRb805l3f8Mts5pClTP6B7mqj6R/SRq1/b31CDGkvWLF58OCS51VLOUaLYF?=
 =?us-ascii?Q?5lpovaCbu+Vmme9hfTjzG76wwGStQc0ph8OyFoMmjLLphLyfdfzhl3Nl+bi5?=
 =?us-ascii?Q?Bmo37mgwb5Faorr3YaAq8oDOGpn9GLNPK9w4KWXRhn7xYz0sXVCMvFBriUVI?=
 =?us-ascii?Q?Gw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c9c56a6-1563-42c1-c2e1-08de35b05e31
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2025 16:47:54.3826
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: um297jM2i1dcsgAO1K4uUFyUDNq3KRFWlB3DUu6zHWAAl6PXBZUXWhUeOm5Hg2sCbwnw4DST/235MJhPuU9heS5kgEpqVRk23DTs99RnH/w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB6602

Hi Alan Stern,

Thanks for the feedback.

> -----Original Message-----
> From: Alan Stern <stern@rowland.harvard.edu>
> Sent: 07 December 2025 16:36
> Subject: Re: [PATCH 0/2] usb: host: Drop resume calls on {e,o}hci_platfor=
m_suspend()
>=20
> On Sun, Dec 07, 2025 at 12:47:25PM +0000, Biju wrote:
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > As per the suspend_devices_and_enter() [1], if .suspend() fails, it
> > invoke the .resume() callback.
>=20
> Quite wrong.  If .suspend() fails, the core assumes the device is still a=
t full power.  It does not
> try to resume the device.

If there is a failure on any device it aborts suspend and jump to Resume_de=
vices that
calls .resume_callback(). Please see failure logs of PWM device failure[2]

Recover_platform:
	platform_recover(state);
	goto Resume_devices;


>=20
> > This patch series drops redundant resume() from
> > {e,o}hci_platform_suspend()
>=20
> These resume() calls are not redundant and they should not be dropped.

ehci_resume() is called from both failure and resume path.
Maybe it is OK to call ehci_resume() twice. One from failure path and one f=
rom resume().

>=20
> > [1]
> > https://elixir.bootlin.com/linux/v6.18-rc7/source/kernel/power/suspend
> > .c#L519
>=20
> The message on this line has no bearing on what you are doing.  It merely=
 says "Some devices failed to
> suspend, or early wake event detected".  There's nothing about invoking t=
he .resume() callback.

See the logs[2] in case of failure.


[2]
[   47.965220] Filesystems sync: 0.000 seconds
[   47.971883] Freezing user space processes
[   47.977739] Freezing user space processes completed (elapsed 0.001 secon=
ds)
[   47.984772] OOM killer disabled.
[   47.988065] Freezing remaining freezable tasks
[   47.993681] Freezing remaining freezable tasks completed (elapsed 0.001 =
seconds)
[   48.001143] printk: Suspending console(s) (use no_console_suspend to deb=
ug)
[   48.077166] renesas-gbeth 15c30000.ethernet end0: Link is Down
[   48.081846] pwm-rzg2l-gpt 13010000.pwm: PM: dpm_run_callback(): rzg2l_gp=
t_suspend [pwm_rzg2l_gpt] returns -110
[   48.081937] pwm-rzg2l-gpt 13010000.pwm: PM: failed to suspend: error -11=
0
[   48.082157] PM: Some devices failed to suspend, or early wake event dete=
cted
[   48.091749] dwmac4: Master AXI performs any burst length
[   48.091829] renesas-gbeth 15c30000.ethernet end0: No Safety Features sup=
port found
[   48.091924] renesas-gbeth 15c30000.ethernet end0: IEEE 1588-2008 Advance=
d Timestamp supported
[   48.092073] renesas-gbeth 15c30000.ethernet end0: configuring for phy/rg=
mii-id link mode
[   48.100718] dwmac4: Master AXI performs any burst length
[   48.100791] renesas-gbeth 15c40000.ethernet end1: No Safety Features sup=
port found
[   48.100875] renesas-gbeth 15c40000.ethernet end1: IEEE 1588-2008 Advance=
d Timestamp supported
[   48.101016] renesas-gbeth 15c40000.ethernet end1: configuring for phy/rg=
mii-id link mode
[   48.149094] usb usb1: root hub lost power or was reset
[   48.149136] usb usb2: root hub lost power or was reset
[   48.361219] OOM killer enabled.
[   48.364360] Restarting tasks: Starting
[   48.369495] Restarting tasks: Done
[   48.372943] random: crng reseeded on system resumption
 PM: suspend exit
[   51.084906] renesas-gbeth 15c30000.ethernet end0: Link is Up - 1Gbps/Ful=
l - flow control rx/tx


Cheers,
Biju



