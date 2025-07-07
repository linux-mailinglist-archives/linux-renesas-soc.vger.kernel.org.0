Return-Path: <linux-renesas-soc+bounces-19306-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 180F2AFB08A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 11:58:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 54A7A3A9273
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 09:58:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D76E7289358;
	Mon,  7 Jul 2025 09:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="je5KjS8Y"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010054.outbound.protection.outlook.com [52.101.228.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244542D78A;
	Mon,  7 Jul 2025 09:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751882325; cv=fail; b=LauHQ0sy3y5WiQxr/wnmHWXh+w7Z1HGa4/QMIG9QiOs+qbEo1ZS/cPbrorBtkyDkAn0tfyoRpMdDSCFNmi3tI5I8PZvLpzFQ6qFXqS9WWkPGzP2NS+qzn21Jt2ZDowt9avkPF6L34EYtmS6qjHC3TvEy96FpQqacLhDCEgJjQj0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751882325; c=relaxed/simple;
	bh=Dz+ySJsR6rbUYGtXoZbXkFAHHsOF8WtolJTsYoMTcOo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uN6KouOMO+65FxzyVFnIlvsQkZHiz9vRavtg443GBt8jy+6uyPy9/oFcN39T9ubSLo1RRuXP+yuGsEHdFEGWG1IJxv6ZjIadjSYppmUeIXCQ4y9AsCqLpINPFHXo40JKOBM9OrHm7ROjh4mH9X9j6XTVi5N/i2ZG95NBxgBS5P8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=je5KjS8Y; arc=fail smtp.client-ip=52.101.228.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S9PlTPcNgAe40z7Fy6t+9hMOfpPfNbcdS3wiIElBxDukmr9TjMfG/EaRVNkDmvIx+tn5ZeAFreNaQ4TMldHgixgGtixFkvQGZI1NafEGR/PkTiKQ65uHDyUCPndVvZjJ3U3A6Ad6seOWaJCsEtlLajP6+wn6y2a0mYcfogPqYz+TQ3ISWiDepe9xkjbGkYdETx775CG/ov3dNlrC7ZMou4NtI7B9jGlvPcGKumxgKJr/xLfSO8FWHuZQZf9C74EQbtShad5hGMSNXweJXIoNAldMdSlFN1iL98ZoVS2bUmmILjoYfxG8ptGAF0Eovw7wVB68wyKK2lxsNviMamEagw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dz+ySJsR6rbUYGtXoZbXkFAHHsOF8WtolJTsYoMTcOo=;
 b=iKz0/sKTHaRlbeALK2aAkjr9e3EQyP42ox990PxVd4I5Kqm2P1Omd9yxktvWeoLsf3dTyCJ/TEaQxbvVFd5zruuS4NFmmh0Ph+VmKwl4RS+U4h4eS8aycDQ4wHlfMCo/Me5g+heHg5qARlo4c+wWbM6S4IWkdeWDyAxk/FFFyhTkzDkY1GhRR9eu5MmDfdGDAKGQUbSYTb+c/knaCbub1/EV597vmd1glo+7m9fWtXD57bCTe7mFF6qHCBDaHgjmvA8DSqfuAR0hRf9oa2RooAWsFCoMiz7leI7c4pUgySdbno9jGv2/1OADKV8ax7r7V5sVYxqtUMO8HWbz1h+C/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dz+ySJsR6rbUYGtXoZbXkFAHHsOF8WtolJTsYoMTcOo=;
 b=je5KjS8Y0NUzvL+NIUmUGnWv3nLYpLsU3gG5HMeUn3Ow/uxX1/IsAK3Kk7wadlX6ynzQrrD9VYsp1zFPDCtIoBtR65Pah0P6Z8oYlkG1muFKwz/D1C91bHukJyi9WUuzKPsiOPuxwI3T2nzgqlbM2Vc6SqOXaY+9NB7C1PNWJWE=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB13154.jpnprd01.prod.outlook.com (2603:1096:405:167::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Mon, 7 Jul
 2025 09:58:40 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%3]) with mapi id 15.20.8901.024; Mon, 7 Jul 2025
 09:58:40 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: John Madieu <john.madieu.xa@bp.renesas.com>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH] arm64: dts: renesas: rzg3e-smarc-som: Fix I2C bus for
 PMIC control
Thread-Topic: [PATCH] arm64: dts: renesas: rzg3e-smarc-som: Fix I2C bus for
 PMIC control
Thread-Index: AQHb7alaQlfKRuvMPEWd87dpigjmPLQmbh1w
Date: Mon, 7 Jul 2025 09:58:40 +0000
Message-ID:
 <TY3PR01MB1134678C03CE2F4F00D8E8C09864FA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250705123548.44624-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250705123548.44624-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB13154:EE_
x-ms-office365-filtering-correlation-id: 5f856f31-5614-4ee1-f786-08ddbd3cd9a0
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?S9vcjyTIuqFw3XKgIyTrG2I4+t9CQw/A1Omuk774oEFwAZSJdmqtfrSWIJrs?=
 =?us-ascii?Q?eRtbTRhjm2/BQz+vJcu8bdtlfR4U9f4pnAfOPDNkBjjhf8HiggOIpFdXPVFn?=
 =?us-ascii?Q?Axvnk2LdjZCLWFTdZibkc7/2QxpKomQrkwq2Ul9CF6UfQol67X5ApA3dZIFS?=
 =?us-ascii?Q?98Ww9xyVCItdXnady3XU9eFmvwRrp/N18aFA7DCbrRHAMtWB+1nVlIhktJer?=
 =?us-ascii?Q?gZJ+50xRLP9VYKdogWfeOaSO+coM5RhAGf9bEieDgOF/Vz4GkgI6Fx8aLIOc?=
 =?us-ascii?Q?deTrRqXVhKx1gOx7vnfJBUx637MdOH78ys42cjj2qqulQZLVn/mFw1ynOwdK?=
 =?us-ascii?Q?opA8Hu0pZdoa6oO+wie+t6tmRxpKKvZ8/fSwnjNUJ+foBwH6hXiljzUuCQ/e?=
 =?us-ascii?Q?DOFTfY1ezdeOr37KIKjgoqnFFSdY3dgeKvLm6wUIKI24Sdnp7X71ecs8dx3d?=
 =?us-ascii?Q?ogSELSMWsiOB9tOQqyUZ6c1r9FDn2Xw/3BZBHerrMz14TLqlaiC/SkUfl3JC?=
 =?us-ascii?Q?JwKIlPInHva3XLWF1SA60SDR4GlogpSKchIaC+Trf8wIZ/0P/CmMuAsvC5Mh?=
 =?us-ascii?Q?84tMfj/v3vv6gtQqtJ1AEzRY/fJp3Ek36R4c2HOZPsjL+dS6EWM4xNRfvE3K?=
 =?us-ascii?Q?ihlQI1Cee4DA9W0BVO3Lf89ZA0O7dbTVcqym9Z8+yWNcqN8syGoXsZiivtcv?=
 =?us-ascii?Q?F6o9QZAgK2LfoVF9KabMj1Pla1xtqe/vlp2uXgQpXiRLu7pW3JwXQkUYK1FX?=
 =?us-ascii?Q?HPeiXh82GV3oLTuKapW65MKRqUUR0cPkSn5K5vLBk7Aw+0/REwjhapxaAaui?=
 =?us-ascii?Q?Lc/K/CBELnk4Bm7jQMIMVsY/Y1nUTVHCmW4DUgQZNPGvMWOVQ7NfvQ83a7PT?=
 =?us-ascii?Q?ki8Aj7XlL9c4O+0eTTDLYB8B68KZClTlegqL8I3c5ENqSZg5t0sLme3aJvw1?=
 =?us-ascii?Q?xjuuLZcdF/Uo3QVVLDqPMdAf21WX7olA4nxT8jzQecq/x1MJzihPgdOgpLs6?=
 =?us-ascii?Q?DrlPvMHRNkNDs/P33rHr8jkv8CbmlJB2VSiaLOH/bDPN+wjNSNQTP85PXtXQ?=
 =?us-ascii?Q?B5j/miMVaFR0nxcFvjvzsyWFBbnfBWJvBoVYuj7W797nvMav47cqtlrU7GUL?=
 =?us-ascii?Q?03BqSygbkn0Flk/qqpJkL9NntySCEhzPXYMO91XROwX/h2VlFts36xL86nFL?=
 =?us-ascii?Q?NRB3l+NRXWssjYWz09iqFkuudf1leeGkceijt+icKgdSbfAqHy9Jdo0GnVYc?=
 =?us-ascii?Q?NdCynPyfGXsXXWTTCQ/XGfcYPeuwuvOuDtmGAGQMoOftDS8dmL097hCbfpZd?=
 =?us-ascii?Q?A+lxRl7jnIbfqVbz2Uq2Eq0qrjJfhDZfzCeBZOi5gNMfJMJU0xzDph7keykf?=
 =?us-ascii?Q?J5l0rwq9DNgkfRRzKu6+bmgQL0k5nyqKaRDxl+nPjV5ZFlMbrDdc0O37QU9e?=
 =?us-ascii?Q?cAF+ZidvEbGyHU5cZNO5pv5Q6i7s5COIfwspugvPzU6ue7Z7a/GToRYPiFkg?=
 =?us-ascii?Q?9Ycm7SORhERaq4k=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?M7jWELD2/DR/BMFtnvrSAxHOSd+DNXjcJBnLdVGCNbHRAnBxdI4xOaYgFU0p?=
 =?us-ascii?Q?iHGZcsQNgSXTaLxIS/czRmU28fSF+JOw/+vTqLtFy+7hXYmnBMvRIcCmLs0Z?=
 =?us-ascii?Q?d233UeFTV2tB04aAEhdvhk9lw3PLEnwS8oReTeqI4ygVYqfbuL6U0ODSupOX?=
 =?us-ascii?Q?atZjvxHZlZK57j2+OIduzU9biTS9+U598uQTZzH74kvUCYzCiE1KqDNuhFm4?=
 =?us-ascii?Q?IGwVFJyj+Hw5yoMF9BvDkGLUNO46GQa/wdh287MOpJCTNqGwOvJLkUi+3AAc?=
 =?us-ascii?Q?xBOD3YAcbSuXYYKHuUIuk9bObuz2m7BnuTCI1JjMHhOovFUyqI2XYrY+2J6q?=
 =?us-ascii?Q?zmqUB736y2hfrLB2g0IXqiIQ15kEohVO3TG4CvfIogHRHjsnV5w+mzi7L2+T?=
 =?us-ascii?Q?cQHCt45I0+qmsyelDW0lBZ/WtNdmmmqx+mk7ld6jYX7WC0TuWJ0eOVPUPiHB?=
 =?us-ascii?Q?DDoIBfeyDeJSMCwSe4D/2fbycWevM3MF7eCP5RrfSXQYtyE0tSl3shnu3X/8?=
 =?us-ascii?Q?BOFzFhUZtApV152ZlkYQSh6DCJkwDMvCSraHoHOYMXxNU5bNNcOq0K8elQ/v?=
 =?us-ascii?Q?mjlJZrLE+eYdshcc6tSvzq1zXxtgmcjnx1/CrqMzR6AaI2u8g6cgIG5PHYLL?=
 =?us-ascii?Q?MdEez0IfUcwjJfhVqFSXyVQmxLGfDVs+dfeyJVhK2/6TGSZ9RZZ8RqlwOlx2?=
 =?us-ascii?Q?awI4J9PtIc9GB4mzv5xmVNDDNdxITDvqQFrMfUtRyxs5bmIPBJq8UMIL5M2X?=
 =?us-ascii?Q?2RBv1wDdc5BVLefAr/T/cLrLD/NYebr1nsekeiBHJLml3jI98le+bBO0QztE?=
 =?us-ascii?Q?BGDuK3bavF+D3eABWDcDOU96cjOsUbrODzWfcdgHnADzKcdxdnBVy0nWQ+J3?=
 =?us-ascii?Q?9N7BNzNFA2DJykrjOiCOalIfVR8JKptQDlRceD+ald8N0SXyDluXIyexjvO5?=
 =?us-ascii?Q?pWO5vwzfYZCuOE10/Tgdj3pP3YihdI6k4u8Y5VGm2aw1FaPVuCGNuO39kdgn?=
 =?us-ascii?Q?SWlp41wsrU2XkuFKTgyeJ6hlKiyd2ci+pAXYa5RM5Zh0TSo0jxxax9sdwsma?=
 =?us-ascii?Q?HJ4vMY0P6nAqh0j810q/EHto45km1XTNhLll8r5eA/mSSAr/yzHD1rpcgShD?=
 =?us-ascii?Q?wkbOGGwUagme3BmI+3nRBfQAMOzMLJCNWd5T5d1iXCnKptFt5OEGeHzRsjTH?=
 =?us-ascii?Q?fkAO3kQTnkQORQZz2gJ0UvxreQxc/Mfiyuvp+3fFWBx30I0KZ4Tn4Rmf7CMj?=
 =?us-ascii?Q?eUMruIejTCfMvq+vjQdFUHBmdpRudK3QwVJBzdqqqeDVw5y5uh12dSRw7ozs?=
 =?us-ascii?Q?7c1oEgBJ4IdqweywgsxkVZJjTLt9ii5RjdB0kOZMi/Xr0iH14Zv+/ZgW8Im4?=
 =?us-ascii?Q?R+yO4zrcmfSZdJeX01d+S2OfMI9ImPeUuJUVGxBkDIzz1enEL4LO80uoiBXZ?=
 =?us-ascii?Q?+D5pGtfObdoSjft+JNvb0K8RdPnkxKv21wrJjGdeaVZWqGkKAvLcdrwt1N4u?=
 =?us-ascii?Q?0l5lMO5bdPOYOkPBOs2aaG+nkBRgypWxnExxf9vx754Q6v8EVM+fhfs0F3Vx?=
 =?us-ascii?Q?vmz0CySetzH1FBC8LypxJnPlJNt1E3vphHJZzRchRSbZ3YCBt8DlVIr0lX+7?=
 =?us-ascii?Q?iw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f856f31-5614-4ee1-f786-08ddbd3cd9a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2025 09:58:40.3044
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6xJh5ikzlzfgIWmWV8dYR8DYLT/ZfE3qaumsNQHxTZZfItDsSWv8EdjE8sieUZL2FS65cPk93uaTLfoQbVkbJAwD4Sc9rJhIO437cUtCW9A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB13154

Hi Geert,

> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: 05 July 2025 13:36
> Subject: [PATCH] arm64: dts: renesas: rzg3e-smarc-som: Fix I2C bus for PM=
IC control
>=20
> As per the hardware manual, RIIC8 is located in PD_AWO domain and we must=
 use that bus for PMIC
> control. Currently wrong i2c bus (i2c2) is used for the PMIC control and =
the system is not entering
> into suspend mode because of this.
>=20
> Fixes: f7a98e256ee30 ("arm64: dts: renesas: rzg3e-smarc-som: Add I2C2 dev=
ice pincontrol")
> Fixes: 5ecd5a8261d00 ("arm64: dts: renesas: rzg3e-smarc-som: Add RAA21530=
0 pmic support")
> Fixes: f62bb41740462 ("arm64: dts: renesas: rzg3e-smarc-som: Reduce I2C2 =
clock frequency")

I would like to remove the fixes tag as there is a TF_A bug. The TF_A uses =
i2c8 pins for
PMIC control and Kernel uses I2C2 for PMIC control.

TF-A not reconfiguring i2c8 pins during suspend state once the kernel overr=
ides the i2c2 pin.

Also, I will send v2 update the commit message to use i2c8 bus for controll=
ing PMIC across
bootloader and Kernel.

Cheers,
Biju

