Return-Path: <linux-renesas-soc+bounces-11151-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 223689EB12A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 13:47:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A294188CA1E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 12:47:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31E7F1A08AF;
	Tue, 10 Dec 2024 12:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="aM5O4C8F"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010061.outbound.protection.outlook.com [52.101.229.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B23078F44;
	Tue, 10 Dec 2024 12:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733834832; cv=fail; b=RPGbBgeEumv0ZHwD5IppFJacfyUPBTwEfKrGFhgUDFsio6q2RYKct+6bu9CNOSVaQAxJnTyohbHtOrs4QjXmOZOez5ylBYTftvlw2j4MvilaKZRhFm6Bp08umohtA65Gq/ooJ4teBbXDV2Q/yGf6kk/22wA/rVTUVLWH7W+9pGk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733834832; c=relaxed/simple;
	bh=liCRCbg3iCGeG64mAcUBYCB8aOI4ZlNdSvxuabifqZk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Rz8RFw2uXunrgnhDCRXj8vxjfk4jvBcd69SHOk2hOLQkuqgussa6uISK69r/nSr7mxCxjTgY7q7sPxlRKXQY0xUE62hYI6YsVZUn6BRWKCVEepodPGTmsYBZ/N8zTuJDa+E8nV+ji+y9wS9U3QqaLnnKHqt4s21Z37deDDTkgYA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=aM5O4C8F; arc=fail smtp.client-ip=52.101.229.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OE2KP03evpXzHOocoz+XPZkCbVrdKDWkBQcnhMVrAytSfPzzv75MNr2JbMTYa2q9nQTHbQSys6Ntp79msG5cx4iq43eAY1oExmH3UfxBUcC9Fjc1/AMj4LRcB84Q64oYs4a7ndKWg5Fx1z3xCG7j9nLbkq63EdoHofhhiGsMS3BNdGSXvkOwEAapvgMBbx/MscrdQlewp8zUa5g7MJzUPeEigxw37qZaHL6+/2DchgpJQKltQjUGk5ydEyvhHOwTnrKW5Co227vF9i+OJb9qxbBRXY7dUz/v4FjXyzO41G4JFOEVPxPQOBe+wX/T18wEMx60/fxrriDgtimyPdGuuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YZ1K12ov+2ok2EFMob8ZiaIEMCUStLoEtJaqS4fwm7E=;
 b=aXAHEBTORtA8iJ2DR8RRxhOkhPctVbWuSdFJkpOOrmW7I6bYsHkkR1l98gkw3Gfui/oVyGQrf+ItPde6RKRsugEL4xmiSC+g9F/PbSKRoXdm8dQ0LUyIliNjJ24jO71uJrytpw9GL/VVqXY4uYxrzwm4Ti5fpiOqwp7VFpEG5QkPMI/UhKiSFzLzO0Yl+YZgBCZFNP3RmZ8NvG/2hcohm+cdzLGzfhUnwl+CRz92jwt7jDTeYkLJlk8ULYPIo9lVYHRchPUTeduWgqLCL6N0ph49U7Jth6vF7N1PwIZMC+FeKchNjS0ae99bNSEHXpUBx1ip44uuLsAntiGOtZjE+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YZ1K12ov+2ok2EFMob8ZiaIEMCUStLoEtJaqS4fwm7E=;
 b=aM5O4C8F/Rw3fN1Nnubin4fXMDTn4ZXN+2YsyoNvgbM1UYFVTU0RosYB5tL/nMDbK4gzQ/J4IAgJFGbG4+/9Euu2WjSlOdFQ2i5mFihu7GYcvsaOB59BQHHDJ0PcjFavnq5M3OlDFq/L6BubIwbu8wMm1MAEMXemg9kT28T7L2Q=
Received: from TYCPR01MB11040.jpnprd01.prod.outlook.com (2603:1096:400:3a7::6)
 by TYRPR01MB12875.jpnprd01.prod.outlook.com (2603:1096:405:1b7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.10; Tue, 10 Dec
 2024 12:47:06 +0000
Received: from TYCPR01MB11040.jpnprd01.prod.outlook.com
 ([fe80::b183:a30f:c95f:a155]) by TYCPR01MB11040.jpnprd01.prod.outlook.com
 ([fe80::b183:a30f:c95f:a155%4]) with mapi id 15.20.8230.016; Tue, 10 Dec 2024
 12:47:05 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: nikita.yoush <nikita.yoush@cogentembedded.com>, Andrew Lunn
	<andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Geert Uytterhoeven <geert+renesas@glider.be>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Michael Dege
	<michael.dege@renesas.com>, Christian Mardmoeller
	<christian.mardmoeller@renesas.com>, Dennis Ostermann
	<dennis.ostermann@renesas.com>, nikita.yoush
	<nikita.yoush@cogentembedded.com>
Subject: RE: [PATCH net-next] net: renesas: rswitch: enable only used MFWD
 features
Thread-Topic: [PATCH net-next] net: renesas: rswitch: enable only used MFWD
 features
Thread-Index: AQHbSgL9vxeSsecwVEis6w9c+SthMrLfbulw
Date: Tue, 10 Dec 2024 12:47:05 +0000
Message-ID:
 <TYCPR01MB11040ACA8D4956BB6DA52F6DAD83D2@TYCPR01MB11040.jpnprd01.prod.outlook.com>
References: <20241209062411.152927-1-nikita.yoush@cogentembedded.com>
In-Reply-To: <20241209062411.152927-1-nikita.yoush@cogentembedded.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11040:EE_|TYRPR01MB12875:EE_
x-ms-office365-filtering-correlation-id: 69f7988a-34b9-4a84-bd23-08dd1918c0b3
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?YdvuxqWaa97G4mirUbZ20DmN/EmwePl/aJebgYhbaxmB06kuoG3TGulez78f?=
 =?us-ascii?Q?sF/bsLdQjmLbS3UVfTSv+BekDYI8VvQvdcwHxDsKE4MB5sijKfZVHnjxQ4TS?=
 =?us-ascii?Q?LcNGEU4sxwjP9U0hspQxtHTOWQETQccOoldG7kqmEPrYmUCdgZ3wJbtPtA+H?=
 =?us-ascii?Q?+0HYj34kZoZEjZdTGBHuSdNrAVTm5KdNnLJgYhIFNfbXrqz0RGw6vwT0wvsT?=
 =?us-ascii?Q?cmnojhW6ylKPDyIi53S0O0mgTMQQZLDmG7WB6IZGGnh91K/E6lQ60sdRSX/k?=
 =?us-ascii?Q?SX1cOERJoaUyQcz2tym/AteSf5bFFrdg7n2fCCVaE3G/CpT9CAoAipKtnyxN?=
 =?us-ascii?Q?uMBlBnjwLe6OtOXuH5A2PxodVrf7miim0qqYRhVjHl1Sq5rrmYrX84deYAK2?=
 =?us-ascii?Q?4yilVV29Fr7DKuTHKq2KaH/dZyds7gkgW4fM86jkUYPos40GFlMwTbIsvWcW?=
 =?us-ascii?Q?Sd4Y5a+ty/5lxDiAXFu4HfCa4mN4sP8g5sllsbVqCcZAkMSJcT3x0DXi1M2U?=
 =?us-ascii?Q?4VzyLKiMg+exfrYs/GArPFDo31IhErBYfxRry6fzL7nQjHo4qn4Y5cZiB8D7?=
 =?us-ascii?Q?uMgVI7kboEXQfbNa9R475trjSPkwL/s7thK5gIdG47HCjQQjMSFx5oMIRxaa?=
 =?us-ascii?Q?srWJckgo3h9ok9GF7eQSnHFxZDvFkD1yh+E82ElvLjDiN2vBlSWefdFt9Ibm?=
 =?us-ascii?Q?AQut/i5QrTAcqssQF4g7ddYBj9FgZ5f2RKtJ1qGCPxnbXDKUf3583b8zYegx?=
 =?us-ascii?Q?Edmjqou5tqIXS6hxtfxc/mt3DoLmzPsCcK4HBAehCLSH0rmBcMrlDB3jmuSo?=
 =?us-ascii?Q?EJiHLUov791r+F5xiOerPmjayxD12KOMV+IjMAVLkpsdceKpQZZuo5f3NEKj?=
 =?us-ascii?Q?4EfmVrpnrR5tJP5w/rf7GDuiVWNguhLY7RMKcdXua/2vBMVyDKg1HLSVfhGU?=
 =?us-ascii?Q?0mD+saC+3JE4rlbWgPeSdCR6UV25tZb71IlQqEF3hwtW50Oz/TzfTRgTUBKY?=
 =?us-ascii?Q?3jk5OlKL2pc9plqZCXv95AMQigcj1tszH9pEb5BdE1dHf4JjJQD3+c4556lz?=
 =?us-ascii?Q?blxbRG9Me7FuFbl3xa0Rlf1bLIISsNXDkVg8Yt2GA5LhrjxYvA3Lg6aj6Hvy?=
 =?us-ascii?Q?Lq2pP9YXzRbpJBjIwcdGcMAk81pAG1hM/EFSNqr7ueeOgW+yBd3KFo7Moag8?=
 =?us-ascii?Q?7VicyPh8qz1Vz+2IFI2OdYQ0TyLaWYmHxzkgy1vPIFhX50ZWcuNL399Dr5FR?=
 =?us-ascii?Q?uHhow50g0Th/azDpcrb6GklggrHxCKn8LfNdyqwMzucrUP8CcLHaEvrkwSuU?=
 =?us-ascii?Q?kUAgrm1HCcItLe9QqcG/eXARtKARuFgK8J9sDvWtSuMM6BpKbk051vRYVVcR?=
 =?us-ascii?Q?aLDf9l9tEOcMHeopk1IBHfLm84zHoia/Nyjx0irTZlSA+xs8Aw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11040.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?r2VgZvNcEvBWoghFwfEMVEQNiYVt6DGxQixEga8gPOEYtcPk7ryZUr3vl+xx?=
 =?us-ascii?Q?ziSc6FtxXM0TIdwNw+eJa6RYnnF7AROlWt5iqdl5TQB1375flNZJnRH8owqw?=
 =?us-ascii?Q?Gmth8F2uVE84HDq3JstKAVdRK22a4s6tOr/Y55qKIM7f0QPKORhwb5ZaCIJU?=
 =?us-ascii?Q?IDbU2+1aD1rMc+OloNAYettwAgwjL5VHUCG08cai9lkEJJ5ljbNsLTM7w4nk?=
 =?us-ascii?Q?MR1+FtifPn3NxT05kD1ZxgTXSTzfuCI1ZY80/WW5RLaWkL1ejWziRDOBlJ6V?=
 =?us-ascii?Q?vCcvgSiZmTTarXlSz5HidCtr6uw0bk/RiuSpUqivJBWqDjj8ZN+C0cnApTgL?=
 =?us-ascii?Q?VqMxQn5C+tU3Gs0eFliexFfl1J7YCWpRSfHt8PVNvq1PR0uYGFerut/z6n8P?=
 =?us-ascii?Q?pInWEv052N7FA0jJBSF4dzkazTcbdTeNjyzK8X/m6Gxnuf5Lx51N+BE39waP?=
 =?us-ascii?Q?R+AIbtpZjpqeOwJ57UvZaSSN+t8EVcnDppkAY0htmY4SwtZ9FZzfMfZHGSqj?=
 =?us-ascii?Q?CC237X+iReKNcZEyOcrFRcBmdbpHSCGWO4v4F+Wivjs4I0qeVY6fmjQ5TIb3?=
 =?us-ascii?Q?Yi89KtiO/LtbejKNCg29iPQhOQWwdXsjinTqpsw7KktRqmwYcncsoM6hvxOL?=
 =?us-ascii?Q?/cjFCRb6YNbRKoNCv3/x9UK7wnDvWwY/r35J3nhi8H7KVnrnUwZMP/v0jtrb?=
 =?us-ascii?Q?XmW9mTPbSGPOrL8+Ra2FdlIF8QXdOYjKblxEm1XDFEDkZbOsvUiM63Tm2YCJ?=
 =?us-ascii?Q?J9YnbNmWmgGl9NYxHx0pAjkndUzFpEn5P6gJDuW0rc4r68hUNMPWMTmsWY5c?=
 =?us-ascii?Q?ADuY7khZyG8ir3Q+0IxSexH9Xqx2SNF5RzM4FoDMSocMoQb92ww0TExdkr77?=
 =?us-ascii?Q?7zoagrrp1JIVQcthSx6XTyHpS0V9RCseDBXOf2lIPeSh7KCSEZm0QeLZQYhj?=
 =?us-ascii?Q?zCYcW0zVyNXE/3QHWvhu1EhVEvcqi6Dpb7WwuXYkR4MjkIF+2eRX57J+o4L6?=
 =?us-ascii?Q?WZcehGszPl2LlWT6JyzmwUf/ZCWYHzXrkNQCZj46neU0cMUxFIHk7nzqCwmC?=
 =?us-ascii?Q?uH9EJBQ+ab37U6eg4xT4qGPKQ6oF68Xi/mGLHOz9xjWS666UQLzwjsbmC2Cl?=
 =?us-ascii?Q?BcBZ/MfYSyqRDmjTsOq1JRDgryB7X7pcLkwqdCmYXiGclbqP3BvNfBA7VBFy?=
 =?us-ascii?Q?OPxxra00JIhCHtj4cHED7Sbn/UifZDF8oFNQqBwNWeoNQkgz1T4yWwDo1kFZ?=
 =?us-ascii?Q?PGKiJMuQAjD7k2kyuOmsabGPOakEWNFx7ulSu2e46l6rrSppvnAVJDegdhDl?=
 =?us-ascii?Q?mA8+0GCGCaYOFd3t8yHvkrNRpKhwThwi16Bih3puFr7Dq7AbXbvRok8jxkXZ?=
 =?us-ascii?Q?ZsUN/RAsB282pH4hoKdrV/Eo27WKsdrJlmCZp3B/XFKvhLVNcIAjlGNSe1CA?=
 =?us-ascii?Q?emoNRAIMv+zqq14YUEn4yjlxy0EYO4O4WgjrTugeAgNniFFIG7Bubcesescy?=
 =?us-ascii?Q?a9zdoiaLoSxcYiN6j9Dn0FYjJDwJOjQzRmMxR54eDckn7OkXZ3uxF6E4sigg?=
 =?us-ascii?Q?5hJZf+zBaX5buAsAW/7hs9fv9U0vlq+NwMNVhAE0cDCX6rjpb+rLPWFv05qB?=
 =?us-ascii?Q?aQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11040.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69f7988a-34b9-4a84-bd23-08dd1918c0b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2024 12:47:05.9315
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8gUPzTOcM9/GY4matMCBCxxZEMRpns57iCBAEWLVCFJyfhNCli0RoqiMESBT0EWDNjwMbCEfKHaFaTWitAklaD8a3EPVOgdxF1Pk/nfrkfnrxAhDey+4epQCQyRpJInK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12875

Hello Nikita-san,

> From: Nikita Yushchenko, Sent: Monday, December 9, 2024 3:24 PM
>=20
> Currently, rswitch driver does not utilize most of MFWD forwarding
> and processing features. It only uses port-based forwarding for ETHA
> ports, and direct descriptor forwarding for GWCA port.
>=20
> Update rswitch_fwd_init() to enable exactly that, and keep everything
> else disabled.
>=20
> Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>

Thank you for the patch. It looks good to me. So,

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

And, I tested the patch on my environment (R-Car S4 Spider), and
it worked without any regression. So,

Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

> ---
>  drivers/net/ethernet/renesas/rswitch.c | 30 +++++++++++++++++---------
>  drivers/net/ethernet/renesas/rswitch.h | 14 ++++++------
>  2 files changed, 28 insertions(+), 16 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/etherne=
t/renesas/rswitch.c
> index 16b1888270eb..7f17b9656cc3 100644
> --- a/drivers/net/ethernet/renesas/rswitch.c
> +++ b/drivers/net/ethernet/renesas/rswitch.c
> @@ -111,25 +111,35 @@ static void rswitch_top_init(struct rswitch_private=
 *priv)
>  /* Forwarding engine block (MFWD) */
>  static void rswitch_fwd_init(struct rswitch_private *priv)
>  {
> +	u32 all_ports_mask =3D GENMASK(RSWITCH_NUM_AGENTS - 1, 0);
>  	unsigned int i;
>=20
> -	/* For ETHA */
> -	for (i =3D 0; i < RSWITCH_NUM_PORTS; i++) {
> -		iowrite32(FWPC0_DEFAULT, priv->addr + FWPC0(i));
> +	/* Start with empty configuration */
> +	for (i =3D 0; i < RSWITCH_NUM_AGENTS; i++) {
> +		/* Disable all port features */
> +		iowrite32(0, priv->addr + FWPC0(i));
> +		/* Disallow L3 forwarding and direct descriptor forwarding */
> +		iowrite32(FIELD_PREP(FWCP1_LTHFW, all_ports_mask),
> +			  priv->addr + FWPC1(i));
> +		/* Disallow L2 forwarding */
> +		iowrite32(FIELD_PREP(FWCP2_LTWFW, all_ports_mask),
> +			  priv->addr + FWPC2(i));
> +		/* Disallow port based forwarding */
>  		iowrite32(0, priv->addr + FWPBFC(i));
>  	}
>=20
> -	for (i =3D 0; i < RSWITCH_NUM_PORTS; i++) {
> +	/* For enabled ETHA ports, setup port based forwarding */
> +	rswitch_for_each_enabled_port(priv, i) {
> +		/* Port based forwarding from port i to GWCA port */
> +		rswitch_modify(priv->addr, FWPBFC(i), FWPBFC_PBDV,
> +			       FIELD_PREP(FWPBFC_PBDV, BIT(priv->gwca.index)));
> +		/* Within GWCA port, forward to Rx queue for port i */
>  		iowrite32(priv->rdev[i]->rx_queue->index,
>  			  priv->addr + FWPBFCSDC(GWCA_INDEX, i));
> -		iowrite32(BIT(priv->gwca.index), priv->addr + FWPBFC(i));
>  	}
>=20
> -	/* For GWCA */
> -	iowrite32(FWPC0_DEFAULT, priv->addr + FWPC0(priv->gwca.index));
> -	iowrite32(FWPC1_DDE, priv->addr + FWPC1(priv->gwca.index));
> -	iowrite32(0, priv->addr + FWPBFC(priv->gwca.index));
> -	iowrite32(GENMASK(RSWITCH_NUM_PORTS - 1, 0), priv->addr + FWPBFC(priv->=
gwca.index));
> +	/* For GWCA port, allow direct descriptor forwarding */
> +	rswitch_modify(priv->addr, FWPC1(priv->gwca.index), FWPC1_DDE, FWPC1_DD=
E);
>  }
>=20
>  /* Gateway CPU agent block (GWCA) */
> diff --git a/drivers/net/ethernet/renesas/rswitch.h b/drivers/net/etherne=
t/renesas/rswitch.h
> index 9ac55b4f5b14..741b089c8523 100644
> --- a/drivers/net/ethernet/renesas/rswitch.h
> +++ b/drivers/net/ethernet/renesas/rswitch.h
> @@ -12,6 +12,7 @@
>=20
>  #define RSWITCH_MAX_NUM_QUEUES	128
>=20
> +#define RSWITCH_NUM_AGENTS	5
>  #define RSWITCH_NUM_PORTS	3
>  #define rswitch_for_each_enabled_port(priv, i)		\
>  	for (i =3D 0; i < RSWITCH_NUM_PORTS; i++)		\
> @@ -811,6 +812,7 @@ enum rswitch_gwca_mode {
>  #define CABPPFLC_INIT_VALUE	0x00800080
>=20
>  /* MFWD */
> +#define FWPC0(i)		(FWPC00 + (i) * 0x10)
>  #define FWPC0_LTHTA		BIT(0)
>  #define FWPC0_IP4UE		BIT(3)
>  #define FWPC0_IP4TE		BIT(4)
> @@ -824,15 +826,15 @@ enum rswitch_gwca_mode {
>  #define FWPC0_MACHMA		BIT(27)
>  #define FWPC0_VLANSA		BIT(28)
>=20
> -#define FWPC0(i)		(FWPC00 + (i) * 0x10)
> -#define FWPC0_DEFAULT		(FWPC0_LTHTA | FWPC0_IP4UE | FWPC0_IP4TE | \
> -				 FWPC0_IP4OE | FWPC0_L2SE | FWPC0_IP4EA | \
> -				 FWPC0_IPDSA | FWPC0_IPHLA | FWPC0_MACSDA | \
> -				 FWPC0_MACHLA |	FWPC0_MACHMA | FWPC0_VLANSA)
>  #define FWPC1(i)		(FWPC10 + (i) * 0x10)
> +#define FWCP1_LTHFW		GENMASK(16 + (RSWITCH_NUM_AGENTS - 1), 16)
>  #define FWPC1_DDE		BIT(0)
>=20
> -#define	FWPBFC(i)		(FWPBFC0 + (i) * 0x10)
> +#define FWPC2(i)		(FWPC20 + (i) * 0x10)
> +#define FWCP2_LTWFW		GENMASK(16 + (RSWITCH_NUM_AGENTS - 1), 16)
> +
> +#define FWPBFC(i)		(FWPBFC0 + (i) * 0x10)
> +#define FWPBFC_PBDV		GENMASK(RSWITCH_NUM_AGENTS - 1, 0)
>=20
>  #define FWPBFCSDC(j, i)         (FWPBFCSDC00 + (i) * 0x10 + (j) * 0x04)
>=20
> --
> 2.39.5


