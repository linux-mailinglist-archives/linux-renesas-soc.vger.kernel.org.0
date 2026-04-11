Return-Path: <linux-renesas-soc+bounces-31192-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mIBRNoZb2mnb0ggAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31192-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Apr 2026 16:32:38 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D56A23E058F
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Apr 2026 16:32:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B83AC300D4FB
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Apr 2026 14:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCB211F419A;
	Sat, 11 Apr 2026 14:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="vYGhQ4rL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010007.outbound.protection.outlook.com [52.101.228.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A9E48CFC;
	Sat, 11 Apr 2026 14:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775917943; cv=fail; b=b1w+4c3Ywz3bkbSR68Punqwnk6dbD4ROkHnDd6SFD7KVjwrUgQIoYt1OrA2cOZlWz+JpLQApjDgTBNucMgWvnrJjIDqtLwlfVsDNMpUstyqGtgZan83ItHSB5bu45wFC6loQ7831PtJfDyRc97SntjL+0n/eItWN+fw/Q+smU9Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775917943; c=relaxed/simple;
	bh=XoF6LkiUJR0AmNw+sCw0mSKU6bPMPCG/nS0VmkOXmPs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jfSlLtWLhY6bjQqKvYCft3eggHLzuV0Hn1X+WMgvVBKL+NO4ia//yXxnxSCmPIC37yJz9WZs/clj9WOBJWdzH0Rq0fGnFSdBF2m8jp2Uz01hc8TErqUDzRXrRidgtx3FTV6Q1p0zasSrmyI33pacKFZR3DBmpr+So9yS2w5JdXc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=vYGhQ4rL; arc=fail smtp.client-ip=52.101.228.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mZ8W/6yE5xle5PCuM6murYj6z6FgRRbyXezTvLZ56ipvrXhbNpypU+CzHuLNW4O/CDdy259PcPNeBTpl713iMQqRWRGm1IRbqKB097qFMHuNwjMd1LKvdh4ME81ChBCYNEoAr/mV6dqrwRCUJCKipND14q0NfkieDAoyjnXvt5Aro2y65GDr9Cie908yh94ytav7voiIBRYqc/z5YAZ5ckrHh3Ut0KwpvOWoi5PtCM2fnAsTjbeJBpsfSp+dz1YDWSBqm/UptQ4BC1EiXHKVUXl28bLtUIiX/oQeNTbHi546MY9JX24kGxqUeDgbjk9Z+ehddUFH/p/glIHZw2kkUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XoF6LkiUJR0AmNw+sCw0mSKU6bPMPCG/nS0VmkOXmPs=;
 b=jGGYCr4QkBGG69Wjm2vhm+mhOA44WVHj8H2o0qc14rcrOzOdfw15m1xfD5Y/C+IR4eLtnvv/kKyLJRyr/tl2WP9g5wah8qTzR4L+NYWmk6xcAxgi3cRWggQPGPJlEHdUes80HQCULjV+EDpPTM/Vfjq6TAHhnhXbLPL4x7Cdrjh1fhUGgCUOZH8iLkCbN9S3mKE5qMlgA2fX/QQIo3mdTuuCuyR90S+xuuHH4qek5S4JaVnzPgLG96090DHpl2QAeOHY8a3cQncTpEk6svNLtAOBnpTzCcsgW5z6dBDoFOqZpH7q/wtBwu/h3QVgLG7324znJ8WbRLw1j/AryH+57A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XoF6LkiUJR0AmNw+sCw0mSKU6bPMPCG/nS0VmkOXmPs=;
 b=vYGhQ4rLJErj5rDopvofEuIYSLR1Z0VJ1Uwnz/6vROK00Yd3rZM9dJafjZPNUadJ4BT9NvafM7xG2xSLe+ARs9FpxyQ6RTmPtGDa6xvizRoWqO3hD130HLiXCULV7x6X7IdRUFXOFllpbP3yzy0agHTfZvxOttetRGEm6OgekW8=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS7PR01MB11455.jpnprd01.prod.outlook.com (2603:1096:604:245::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.46; Sat, 11 Apr
 2026 14:32:17 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9769.044; Sat, 11 Apr 2026
 14:32:17 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Andrew Lunn <andrew@lunn.ch>, "Russell King (Oracle)"
	<linux@armlinux.org.uk>
CC: biju.das.au <biju.das.au@gmail.com>, Heiner Kallweit
	<hkallweit1@gmail.com>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Ovidiu Panait <ovidiu.panait.rb@renesas.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH net-next] net: phy: call phy_init_hw() in phy resume path
Thread-Topic: [PATCH net-next] net: phy: call phy_init_hw() in phy resume path
Thread-Index:
 AQHcyPZnBK/SG6spWkirTeqviN9wXLXYYQwAgAAGuICAAADOgIAAjsYAgADq+ICAAAs7EA==
Date: Sat, 11 Apr 2026 14:32:17 +0000
Message-ID:
 <TY3PR01MB11346A7CD81FD5AB7DEF8B6F586262@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260410142904.439666-1-biju.das.jz@bp.renesas.com>
 <adkOZl4gt5UoGv-0@shell.armlinux.org.uk>
 <839fec66-5ec0-4cc0-a0c4-ae2de6902188@lunn.ch>
 <TY3PR01MB11346B6680E5952BD7B7078CA86592@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <admMethCSjOQhu8g@shell.armlinux.org.uk>
 <dedab35c-39f4-469b-9227-cb8925d83b8e@lunn.ch>
In-Reply-To: <dedab35c-39f4-469b-9227-cb8925d83b8e@lunn.ch>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS7PR01MB11455:EE_
x-ms-office365-filtering-correlation-id: 495b1bd0-b578-43ce-6b6c-08de97d721b7
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info:
 qKnEH3tj7y5YiX5UBJj+8okJEDcVkE8DIZoNvAjmdnj7K6CNruZdfFE0diiWoYNXXS/rxbv8GbwarB8a5FAVzB0qolSALg1Rn7UiuXW3Yo0VH5VuRIhtSYERjhtq+gZ0o4s7QJ3hfWGba1qLdrREQ/5EithdACcC2fvhvCrIyQzVS3+t/aIYt4iRm8QfnuHnp5qQ1jnER451MK/GOEUS/SpUArXYw+fBTP8heT9S8daOy4kvc56/QxERJxGB3Awa9Ze54IgaYf90UXPA97xOldogTPkm11F+rA6v/iaJN+CI8rZtZJrHL634F1Y6JdjJC2Ahghs49FkyaQu+FgQDpZpC4ygErfMaw3fftG3g6A4aMmADTrBbOR7UUduj6a3hD6tZDjn5qAXS9Cd9Am3P+o02cbxzWIc1l8gc2cCA2dfMaI2Bdw4M93/JrHwQ/uRXnlEfW5uXl7Qc1f/W1Y6zXVOTLk+33o0pu+Zm7Z93aIbSQk2gRrDadoSc+n4UO2fRW4okXj6hMKbxu/j25bq0/2vlqhJHBWU3gfqzTR9L3kjDYOV1ojpt7ZTjCyuj5Ir8OsUIoAZOzP8b0VZS1GoV7i65kLM2rZ05lUcbgF2Wbyumb1jlyYUoSBsOK5RNlGThfRSHAIN8fvwoOTbJjVaHo7F0CQTylPRcj0K8sKTawsjY6w7vorpm8kjUEtZ8G4myFGfziCnwrZMIweni6nZFkeYi7vfgW/OhEXCoAxvI0H1qNafMcwo9VjyyDdh+seOccMAZdL4noeWnBYqUvyqrsh7l3ZQjv1nJjJq4q8hdpkI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?+85XJiNz3T9bjyD5fxBGU64LKSUhEkyqz2S0C+RlwcMlc99PZpwOg4+xWXIH?=
 =?us-ascii?Q?/iyA0r/W+dPiByEQ1KpSu1guUQ50HjJsmGw/onMPq3XNlCbindo1D6s4d5xa?=
 =?us-ascii?Q?8zqmk2omIntSHakXYXSslnmg+7FuKLjRc8Ovun5H2tQ99FgTFFXTq7yvus70?=
 =?us-ascii?Q?/KXfZFGmjSd6BkNOwtrdr8TxPnKIPiISWoDJnHJR57bceSazHqcC+exq7ZFq?=
 =?us-ascii?Q?4b71YBaD9/MP2T0yiC61lLVHuMGX781j3YPs6HOx6zDaODOzTRBXdjQj4o5z?=
 =?us-ascii?Q?9Z1d/Wf/asy8u8KEih1YyjGeoGJy9fN5Vg4LDuXKCmqHRNyF1M+oqluRzy4y?=
 =?us-ascii?Q?QYw8UHg+gXfVrazpJ44OXCvZzW9K2xKpKotl96jGv+ZDzs3jFQHAGf8Gei+U?=
 =?us-ascii?Q?bVMsdb4CsnEzKVtDA0q5orUhtZ4F4tiCLzk+prbFJF0LCgU/XHhsTRtXsiQZ?=
 =?us-ascii?Q?MgOgLNNy8pv443Y4KUv2mcXLg0dr63I8URcwha41fp7Dz78HiZc+j6xT02pz?=
 =?us-ascii?Q?U22z/oQwMe7+1c2USOm6XOObEYgtCtY9V8eIiW8TVL8qHeGOOx6rgBo71QvW?=
 =?us-ascii?Q?3Qc3+foD0RKhmpYX3szwyk/9X1kOUED9J/EoUdUagIJtCexS7tns58LJoewH?=
 =?us-ascii?Q?AaIm/MT1rEWBApiiYJoFseDUMHDef6U0LbE1KEvVkHTe1vI+kPEv8sIgMNE0?=
 =?us-ascii?Q?gR1OsJTy69aFJuZpcBlEtWwlKo3ZNRNjEfKbt8fYGj6NdRhhl5jxT3nFe/2w?=
 =?us-ascii?Q?Q0No8B6fqCPnZlGn2WzEZ60cvokRKk3P1Vsv/S/ZzEK55rLTAgZRNZnNIJia?=
 =?us-ascii?Q?xSVRZ7PLs/4W8tk6qKGXrJBG4WW91S9qO4b09IA2wshW9JF4OMR7kyBkNBfj?=
 =?us-ascii?Q?3wqpx2MNpR900xvI4TsG9Rzk5/VNZ/Yr7k4M6ET/9BQjMvADNWBgwfUFCsqL?=
 =?us-ascii?Q?X9FOrBM24VJEQ2xI9gtcDanuoX6uZwRWIrINyv8+m0CxjZcIYu2WYFCyoXW6?=
 =?us-ascii?Q?PXOjN2YZvQ5dDYTp54f8/lLpqOjHHbtZq/XX8eaYDtE/eaxwI/gnsqUOH1BY?=
 =?us-ascii?Q?oUhww1fcg8/q+WaVBdtDpcp1Ypaw56ExzDORTN5iFIq5KtWzv/IiMYpR96cq?=
 =?us-ascii?Q?hRisCjmbWl5pr2lVCagvffPCP09RpNxpsHzOB8Jm+DXAI0vICdfY6eEzT3sH?=
 =?us-ascii?Q?3aNJGiZni8msSrVYWx6NFmrqkZwB2d6OO9x+iDEtiaZwL5eyYXp+UbqIOgop?=
 =?us-ascii?Q?aBZYLUOYUWvznqjw23C1LJQJ+prR5+3sgVNlIDScIpVdlVKy05oc7kdcrFeW?=
 =?us-ascii?Q?hZuvPLPNurcSsyydq1plYAKiBEwS6FjkThauQMw3QPTNRU88pWBYwq23wb9o?=
 =?us-ascii?Q?4iYrmdaFxL0zem8wtJtVFCSUMbAmtNRE5iKfpD1Y/+Uns6RWAk0eu1ekVcFW?=
 =?us-ascii?Q?ot8aBRdxcWH0Ve4rJlkBACecMuZ0YyrpyK857RkUVQKBK4Fk6x+TZcNoTe/t?=
 =?us-ascii?Q?WifoyBnFSRuNGJ/A8EO8LOacszdeMy19wCYHqr8QrAFR2lOUCWNUsz4HNVn9?=
 =?us-ascii?Q?JPXoAMtgCF3yMFcpHTTInL9fatcAYbwi8R2EE1FIOLu1t/m74P1LUCkyvM/9?=
 =?us-ascii?Q?uMzJyTdqPq3FuhNUuejaqLzFndA80fWUX3NKSK8sprxL+1YOG7WwjSfHRJ+B?=
 =?us-ascii?Q?2KTOM3DNVAtcxRIkLiFtna7bmJlcZki5jk44yMI2q6rxTEd8i3U4tz8WtTcf?=
 =?us-ascii?Q?aIw1JOdvnQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 495b1bd0-b578-43ce-6b6c-08de97d721b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2026 14:32:17.2529
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aNDoLllX9E6SI0yZfHHnC6Q7RXPYRboAzkVKKp/Bxm/3LEZc9/UiUa13XXjUdEsFh/tfutYfEuYtDSWo8T4htj7P4wso/oA/OZ3r0CPhpfY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11455
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31192-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,davemloft.net,google.com,kernel.org,redhat.com,renesas.com,vger.kernel.org,glider.be,bp.renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,bp.renesas.com:dkim,lunn.ch:email,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Queue-Id: D56A23E058F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Andrew,

> -----Original Message-----
> From: Andrew Lunn <andrew@lunn.ch>
> Sent: 11 April 2026 14:50
> Subject: Re: [PATCH net-next] net: phy: call phy_init_hw() in phy resume =
path
>=20
> > So, I question whether any of the functions in this driver actually
> > have a valid reason to take phydev->lock - looks to me like a not very
> > well written driver.
> >
> > In cases like this, I don't think we should make things more difficult
> > in the core just because we have a lockdep splat when that can be
> > avoided by killing off unnecessary locking.
>=20
> Agreed. This patchset should cleanup these locks.

OK, I will send a patch for removing these locks.

Cheers,
Biju

