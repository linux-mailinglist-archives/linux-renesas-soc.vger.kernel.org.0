Return-Path: <linux-renesas-soc+bounces-30863-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ONqTIj/hz2kS1gYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30863-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 17:48:15 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 832B8395F17
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 17:48:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4A69E3003720
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Apr 2026 15:48:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD0B23C455E;
	Fri,  3 Apr 2026 15:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="aG3qoq1E"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011041.outbound.protection.outlook.com [52.101.125.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2A43A75A9;
	Fri,  3 Apr 2026 15:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775231289; cv=fail; b=M9ZqmMpd1mFS7Feo+o+ZvxZq1T1fIH9q6etfrZso9ldpeuk/76V8qBkjjyc2XCY+XA/EVJmtOvJBntaAC2jZi6roA4bHHZi/tDUmChU+M+pdWKlSki5t6fYj/6LeIRkiE+mldDni4oeWoM+SjA2bul54ykYkyqGtB+V9YPJ1/EE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775231289; c=relaxed/simple;
	bh=xwO550dF5wfioPWoMXyIUBR6T+bbf7X5ANkmBJRZTpE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SQ77rDUhixK1VD1bR5CG6v4CwTGl5C441vC5xuHKmy+UV0auwZxFVguq8ZL3lZgrhqtDVI9ERy/f/sAMDTpARU42d3GodQz+eTgm7Dgo1WF8x7d0b5PiDKLzr7sTsIanov6ypk+uq8ZT+3D6VuRefb4mKoglinYY5Nqr69atvVE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=aG3qoq1E; arc=fail smtp.client-ip=52.101.125.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a3JP/QF1YuRkzoKKH+RFiFvZvkGyPqDD5dRLNWdST4Js0IzL083mmnmCha7FczTRGRc2geEXXAMMHn2xRyeExpkz6SXkysLCARFWp0DgF3NPOzcEfrRATlZUo81pocD13atDw41FXryo0pBQ5o/HZWgrZETAjsYBV9yUvv//s/XknRMEU/a2SDC+oh/A77OhfJ0dJLMtM2jRap28EoQ16p9gQRAXmNw59+IjHaeF6JNL2xhCHrdgmeRD1WYvxB5gQUIgJDTpt1z5G7/l+cVX4vmwXAZdY/C5riCrDZo9aon9eZaUVvfKgzxPHGI1xPIdZN3hOHcyHfDaOfXTji/spQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vh3SW1pimxVMzMAChXVyaxaJfX2zHXYlArdV8wc+y/U=;
 b=tvF2wAk5grVKqgRn/FfgV+bW9RlowicAF2gXZV5maNKi626/RdJmeSzitKdkSyrcCzhr526z77fY8tDKSUAxRvK9IHhrSuFb2hvJBhSxjnN3RHw3r11yiyKckV3UcdnkHqiR8eUiczCmd30ROaVqGCyg5NbrVd6cU+vhX6lxAMZoH5dWlBj7JuZehxd8t0wCuK4yLgrlyU5b2Etltwo18PbC40HFsAV0QiOfAPcyCmei1BAWRDqVW+3NVjcalzvzDbMrYBOs0FZHvGcU9lGSH3taflCu90eCAzLQ5k3heYxA60RUcNdbTU0Az1yBZy959CVDzLGCpGSUdV8r8hHhFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vh3SW1pimxVMzMAChXVyaxaJfX2zHXYlArdV8wc+y/U=;
 b=aG3qoq1E9bppuwO0ifk8gAaPtwtVaWDt8OGFEjqdnVpKoEgipbrH1ordosn9xubXxAx2z7PfO09xSWEf9mhwsfPs4GT5lN26m9E2fVM6wDN8UMveFsDgOzsv45ALeG4nok0Pdvg8rszWAZO+1IsOb9JUKr7I88Cv6rQZm7FPGO8=
Received: from TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM (2603:1096:405:38d::6)
 by TY1P301MB0297.JPNP301.PROD.OUTLOOK.COM (2603:1096:400:2e2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Fri, 3 Apr
 2026 15:48:02 +0000
Received: from TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM
 ([fe80::5b4b:dd0c:b302:7911]) by TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM
 ([fe80::5b4b:dd0c:b302:7911%5]) with mapi id 15.20.9769.015; Fri, 3 Apr 2026
 15:48:02 +0000
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: Russell King <linux@armlinux.org.uk>
CC: "andrew@lunn.ch" <andrew@lunn.ch>, "hkallweit1@gmail.com"
	<hkallweit1@gmail.com>, "davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>, "kuba@kernel.org"
	<kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>, Biju Das
	<biju.das.jz@bp.renesas.com>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH net] net: phy: micrel: Fix MMD register access during SPD
 in ksz9131_resume()
Thread-Topic: [PATCH net] net: phy: micrel: Fix MMD register access during SPD
 in ksz9131_resume()
Thread-Index: AQHcw1uO2X7KYPO6jU26NrM/2Ym+OrXNbJwAgAAIciA=
Date: Fri, 3 Apr 2026 15:48:02 +0000
Message-ID:
 <TY7P301MB1984FB759690AB12AD509CD8D35EA@TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM>
References: <20260403111738.37749-1-ovidiu.panait.rb@renesas.com>
 <ac_Udvtrj0Bl-6wl@shell.armlinux.org.uk>
In-Reply-To: <ac_Udvtrj0Bl-6wl@shell.armlinux.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY7P301MB1984:EE_|TY1P301MB0297:EE_
x-ms-office365-filtering-correlation-id: f837efd5-5c40-4be4-24c3-08de91986392
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|56012099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 lEKs9sGD4pS9NP8aVQgZLSxQeyNqeVcFLomWnIFhnM59GlmUSbCOSv0ybiUE7YvcQapYgLCz9it1cDBzeHRwo4bfTmVZ4Kp42WEHKeq+2qKaN5m4pm804aoiFV3kGB9+CG9D81EPj4/04UN7aEqXBGbEY3ESdu8vh7lh2kCHhtH43X4qFJ3iqpxDHgA0KFccG+6F/ylPSCIi6FJx8S3zYA5j5QPx3UtQdSaXAVo3V3XaNLpaLysJR4z1axhMMk3+z0hGZA98gtRxgCzT8YwEm4w0vqsEXDJcvZ9oj+PuA/eq9N8K3KIkrEgXeLJV6eBq2sApB3ABW7/MYUpLtFdH6hwAxhKzv/AB9Rx89J+3d27gyBc8W19IZXSSLiQI3erzU0FL93SvDR3HKqC9Syvv6lWlBFUmJ3008/a91tepv/qRWJnFzb7FYF1BTE6hsyZwU+aGXlIv4KgSVxG0DLARI+i7Y7Lkv7H56ZAwhMjKaTm4LaGWiPOUlJW7SXnKWUPYUL6ATZV9FsGfi7qJkPW9O17O8pQLdvbPUM45CsD17xBcsBp649IMTQYi/0zpiwoiWO0mpJBsj8ele06paMzVl2tl2KlVH8V+Nt09TLL0XC0IPwaqSsUQzM6z6sAedYrexYnG8kdJWFxN9g1pVwoOPFOEuQ8rjtX9vplGJr8yG3VeNWSUyc+zxK3eO51r1EWKmJ8YFT1BOIqKA7z3s9Dz/gPNGxQweVzxJ5cAs31yszE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(56012099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?4ZxFLn/08FzmGzAUUh3HxWkkDZFpWnlIfh70qF4zA93M1CNeP8rEixN+UEHh?=
 =?us-ascii?Q?cAhlpUIDM5upkKe9B+05Il66sK5FpZeAiy4OSEUgQg1k0crCur3bDEyHZJC2?=
 =?us-ascii?Q?uOIs2k52etzAYEILlmu3SHEwuj77DmRoAIDAHGEUodpJ0CRNuutVHthyVXqd?=
 =?us-ascii?Q?rxyXeYIg5YRtmbZRBrS+0BT7I7EY2bgkXnDI3i1eouLcqNhXmNEjpsCn+Pir?=
 =?us-ascii?Q?/cPWDTzDuqMbj5NTFU5TrZeRWcn3aLvB3HMtKsylb504RYG7xnIi9bpRrFMJ?=
 =?us-ascii?Q?2DljG0CpWkAPvr91oHIXM7gG9SGh/LJcd3jhA0zNLaPI3bi5JhSQBgX2HdXe?=
 =?us-ascii?Q?T6RmBWoZ6QIZbPleWFQ+iVkBsRA0WzIvO1DsY7yqbV/jQrdNbmI57ak52Y4c?=
 =?us-ascii?Q?mDtZQr4v2MraVWO8krKdWMn7pnO3l7sM+ucFfSY564WTP0eHJLJwj6Oy82XQ?=
 =?us-ascii?Q?uN/gX38PuXrP3DHrTXZkpDNj5rXDU4Hi9tcRN6BRXte9V1R7xvr/KK7xNCp+?=
 =?us-ascii?Q?4zBBZZBpfBwFU7JtgqtMuOo+zpwk2tACx5/oEvXn465dpUl6R0W7XaXB+QFI?=
 =?us-ascii?Q?t2TseGRps0rYpfi7aDVOb/TnEeT84WIEKw2krFo7aJp068oWvokmuq5UAO9T?=
 =?us-ascii?Q?7NuQ/V7Mman+I4RIad1svd8+mDPEeO3DHx2i4U7Z7wUKdnGbkPR7u/i9Sbkj?=
 =?us-ascii?Q?0q2wDz9NFfP6n4Hr6fOOa9wGrTfjJwuufErT0FHo91ZzRbitm0ZgpQz2KK7c?=
 =?us-ascii?Q?of1VUAEjy+/hIcltk0GmUbH2B68tzctuCaiqz8m3fatLE/RfGLi8cN0zAyFf?=
 =?us-ascii?Q?+1/mtv7ZfQyk3D0luAD2UdsaBhOF+4PaLGyhjCmdZrB1ywb7mWbG5wPKOPLK?=
 =?us-ascii?Q?KULTgREbx6HJfOQ+8D0Rru0/qFnoZUr5qbuWekR4fzOtACXfKNXL6jE7oiLg?=
 =?us-ascii?Q?sGfqcPBvHyo+qO9A5l/9EjC8E5SYGjHXTnjbab8o5HXzSLX0udWu7y1wfoRV?=
 =?us-ascii?Q?+SzUqiiSCMGBu91+hfQ19ysBxQynG/0Pt++WqGRIH8F8DTa1i0pPJwsEoSb6?=
 =?us-ascii?Q?i3UXWOH5vE1yTnUTpFcL7JfMiABibFYy0BnOxwRKvVWJGcH/V+qouqSg/qUW?=
 =?us-ascii?Q?YuvZEe0EVQ0IIAL2qLUa2Y4Wr6ISbHx6+iYCWwAxB7NXvoI/brjSktHNmw+n?=
 =?us-ascii?Q?G293PkCeEJX16fLBHeNQa8ryFOvtFpzul8uqySUsLM/vmpXhaLrm1wDgckdE?=
 =?us-ascii?Q?HtD196TIc9wzupbLosf1kvuMHJRfkTmzP+kdTrQcZpCTp+TzY011ziRq+JV0?=
 =?us-ascii?Q?D0xsu76f19EtlKAIESBAkQ3HrfL0Aod97LJAsgR1YDD3ZvjzXvRhobDqk6RT?=
 =?us-ascii?Q?49b8zd6ppZ4oIwiHhQyR24ukrbjG22qp/0DUwzHi4+k8IkxlPZ6/RVnQt2+H?=
 =?us-ascii?Q?HyU2fp2wLGYWR1Vu5VEDK3LU7bIInAP4giYAs4THa1R1O8vzl3X02SXO2A0K?=
 =?us-ascii?Q?LMFCPOHSCltkeThve17wZ1WEFWE+w+fq60O/ngOpYbAI8osRWI7qnVbqvIBx?=
 =?us-ascii?Q?2hOn4rYGsoMSdBtwis7ieeL6dOo1TuK1+DNukAl4+bq1shRnUTmn30nsJ5+3?=
 =?us-ascii?Q?mvydLPaC/omvtgAv1sM+YO+YXk6KhOjSWiWj9WDYdqxkHFet67cCUTsR5QEo?=
 =?us-ascii?Q?RhmvOWXrE+CI+PF6Y2tXfeqCU1p+lPF8nZY2RLjbT/wuv43gEXNbAahiqhWR?=
 =?us-ascii?Q?ToCl30aCjClw7Jk1P35akWocu0OeBLc=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f837efd5-5c40-4be4-24c3-08de91986392
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2026 15:48:02.4458
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J4xKxsUopJdhZQpRhkKxdQC669mlNdR64MBIBbNhXRJhLWw+QBLUFVyilSVq0b9q15biqjKpQ49npbdjnf6R8s9fLrYF1NovRdR85hmIyFc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1P301MB0297
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lunn.ch,gmail.com,davemloft.net,google.com,kernel.org,redhat.com,bp.renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-30863-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[renesas.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ovidiu.panait.rb@renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,renesas.com:dkim,renesas.com:email]
X-Rspamd-Queue-Id: 832B8395F17
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

>=20
> On Fri, Apr 03, 2026 at 11:17:38AM +0000, Ovidiu Panait wrote:
> > During system suspend, phy_suspend() puts the PHY into Software Power-
> Down
> > (SPD) by setting the BMCR_PDOWN bit in MII_BMCR. According to the
> KSZ9131
> > datasheet, MMD register access is restricted during SPD:
> >
> >   - Only access to the standard registers (0 through 31) is supported.
> >   - Access to MMD address spaces other than MMD address space 1 is
> >     possible if the spd_clock_gate_override bit is set.
> >   - Access to MMD address space 1 is not possible.
> >
> > However, ksz9131_resume() calls ksz9131_config_rgmii_delay() before
> > kszphy_resume() clears BMCR_PDOWN. This means MMD registers are accesse=
d
> > while the PHY is still in SPD, contrary to the datasheet.
> >
> > Additionally, on platforms where the PHY loses power during suspend
> > (e.g. RZ/G3E), all settings from ksz9131_config_init(), not just the
> > RGMII delays, are lost and need to be restored. When the MAC driver
> > sets mac_managed_pm (e.g. stmmac), mdio_bus_phy_resume() is skipped,
> > so phy_init_hw() (which calls config_init to restore all PHY settings)
> > is never invoked during resume.
> >
> > Fix this by replacing the RGMII delay restoration with a call to
> > phy_init_hw(), which takes the PHY out of SPD and performs full
> > reinitialization.
> >
> > Fixes: f25a7eaa897f ("net: phy: micrel: Add ksz9131_resume()")
> > Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> > ---
> >  drivers/net/phy/micrel.c | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/net/phy/micrel.c b/drivers/net/phy/micrel.c
> > index 2aa1dedd21b8..4236dbf4ad6b 100644
> > --- a/drivers/net/phy/micrel.c
> > +++ b/drivers/net/phy/micrel.c
> > @@ -6016,8 +6016,13 @@ static int lan8841_suspend(struct phy_device
> *phydev)
> >
> >  static int ksz9131_resume(struct phy_device *phydev)
> >  {
> > -	if (phydev->suspended && phy_interface_is_rgmii(phydev))
> > -		ksz9131_config_rgmii_delay(phydev);
> > +	int ret;
> > +
> > +	if (phydev->suspended) {
> > +		ret =3D phy_init_hw(phydev);
> > +		if (ret)
> > +			return ret;
> > +	}
> >
> >  	return kszphy_resume(phydev);
> >  }
>=20
> mdio_bus_phy_resume():
>=20
>         ret =3D phy_init_hw(phydev);
>         if (ret < 0)
>                 return ret;
>=20
>         ret =3D phy_resume(phydev);
>         if (ret < 0)
>                 return ret;
>=20
> where phy_resume() calls your resume function.
>=20
> If a MAC driver is handling suspend/resume by setting
> phydev->mac_managed_pm then maybe the MAC driver should also be
> issuing phy_init_hw() before calling phy_resume() ?
>=20
> Which MAC driver are you seeing a problem with?
>=20

On my board the KSZ9131RNX PHY is paired to stmmac.

I could add phy_init_hw() before the phylink_prepare_resume() call, which
does the phy_resume() and remove the ksz9131_config_rgmii_delay() call from
ksz9131_resume(), as it is not correct/complete.

Ovidiu


> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

