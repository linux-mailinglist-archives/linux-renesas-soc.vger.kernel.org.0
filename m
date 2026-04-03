Return-Path: <linux-renesas-soc+bounces-30866-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uESSL9ztz2lF1wYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30866-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 18:42:04 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C35033968AB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 18:42:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 95AF03053278
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Apr 2026 16:29:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED7F9382F1C;
	Fri,  3 Apr 2026 16:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="FBTZCT+3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010028.outbound.protection.outlook.com [52.101.229.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3023C3CBE98;
	Fri,  3 Apr 2026 16:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775233730; cv=fail; b=oUVyp4awdAmiOrPJgj5qnueglw1qC1/h8ftBtzDfgCUQGupd7QT55R1FXcuoMhEE3aav3Synw8/SJn2eZY8OmdkLKak7Xp21eEl2WAKksR2Y0qlhk+8dbEoPbtmRcwROkwyi5Fq5Bjh9mThGO0G8xgzUHaCNym/jl274/AklpWM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775233730; c=relaxed/simple;
	bh=+lPi1OP08qgswFv/or9/TI9Ly30TRs5B6y5gdmCwhdc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Bq+v4eb/MSmoq9TJWBlVmKcmUCIEe0eomGNBRFnz4n36kuPDNEICUso6xQtbnW8LU+sWM7Oj7Dhqp96dJNy+dA5QHTnUrDjTW3LEItMnUjJ/BpbfakNd7bWB/xdIIfBCQbKnydJtJKXtBI8kDsRYLW1u+PVPOJlsbJrGiJQGjVM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=FBTZCT+3; arc=fail smtp.client-ip=52.101.229.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wc1UGltLzRGhUjQr6FkHyYb4c2fIkYBJkQqBWhDwZS3hidFmV+3MAaNqCmoDOP6jRZphzCnfCDdAjpm6B2zyksHRK5mc/Wohy2WVESsiSwafdqAYKyVY2kRkrjbUK+ulvn36ozv9JuUJ0W8TwNgZWGe86+Md7tBNsuGy3AAST8xOwkP0c9iiBxUJZax7TKnVKiQJWyR9nWGkbgLXu3QPGRFBYZLFjbMeApe+z2+1UfujJd4iALY5xMCUTJRZapwmwSCXYwGYZ84cds1BLJeIKkya72Ifuhncbam9rxpWsYWH8gSHsMUtHFo5v4ru6p1an/n+/jUOshZpMpC/aQ0D2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xe98fRLgv59g0Z3d1giWedtvcZSjZ5WvHPXcEWt1vRw=;
 b=JtUwtqj5YsdpS9jZHhujlVNai85x5DorKYM0h1xRj6H5fye59VXmyBFjdccTPQ0217FoLcSx7X75rsUGG+Lno32HzuLqxYEh3RHiYu6V/DH63OS1xkJV8Xeg+oqo9wuSBFd+mwAsVg1pT0YO6Kc3wcQfJd6HP0HjbQpG4ciqnkA1y4QioqoQVtmxF0sP2UYf3h591fLZrrtE4/8kzx3DirGN37SgxKMwv+rlhcgH12kinkEAnJRSNPQKVTfBZs3oR3OEn3ErhF586ECpijD24NkNgGc9xCcsSCDVcjf9SrrHaswp4VHMNnY8F1CSUs6z452DX3lls56y2wOmEf3lzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xe98fRLgv59g0Z3d1giWedtvcZSjZ5WvHPXcEWt1vRw=;
 b=FBTZCT+3yD3T8ZliA7xCPRzfS+krUJx3M5pYRAsyU3ajHUgRxS6owXfeOUKCo8TeBQfaTNkedTDulyieVg/0i9zWHwYG+ikUFJw2DWLX7l+tKCsU7Drrh667buCG0/lFw9Sia1wP57Ktw8driTkbpvf75x3ds6jaYupg+/1jC90=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by OS7PR01MB15384.jpnprd01.prod.outlook.com (2603:1096:604:389::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Fri, 3 Apr
 2026 16:28:43 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97%5]) with mapi id 15.20.9769.020; Fri, 3 Apr 2026
 16:28:43 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Ovidiu Panait
	<ovidiu.panait.rb@renesas.com>, "andrew@lunn.ch" <andrew@lunn.ch>,
	"hkallweit1@gmail.com" <hkallweit1@gmail.com>, "linux@armlinux.org.uk"
	<linux@armlinux.org.uk>, "davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>, "kuba@kernel.org"
	<kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>, Russell King
	<linux@armlinux.org.uk>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH net] net: phy: micrel: Fix MMD register access during SPD
 in ksz9131_resume()
Thread-Topic: [PATCH net] net: phy: micrel: Fix MMD register access during SPD
 in ksz9131_resume()
Thread-Index:
 AQHcw1uOXzjJ5f4us0+uUd80lAj1i7XNRYKggAANrwCAAAEosIAABp6AgAAfibCAAAtSMA==
Date: Fri, 3 Apr 2026 16:28:43 +0000
Message-ID:
 <TYCPR01MB11332125932E37C2E2A124CF5865EA@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20260403111738.37749-1-ovidiu.panait.rb@renesas.com>
 <TYCPR01MB11332623A3F7FF4601FE8C35C865EA@TYCPR01MB11332.jpnprd01.prod.outlook.com>
 <TY7P301MB198462DF309670467625AD40D35EA@TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM>
 <TYCPR01MB113320392754A3B42F78A9FC5865EA@TYCPR01MB11332.jpnprd01.prod.outlook.com>
 <TY7P301MB198479332A7A0C00451120EDD35EA@TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM>
 <TYCPR01MB1133228575528380F6F8D1CFF865EA@TYCPR01MB11332.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TYCPR01MB1133228575528380F6F8D1CFF865EA@TYCPR01MB11332.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|OS7PR01MB15384:EE_
x-ms-office365-filtering-correlation-id: 5fd4b132-dc6f-459e-996e-08de919e12b5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|1800799024|376014|921020|18002099003|56012099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 iZe+xwIgBgCYmVC7WVhgWi33PQc7rVKGJvu34c6Qg3YLmzaLS7jwWntdLmwN9kqwDtgll+2UOQB/kGVwDILr/LGzwjVwAsLyUyAsrWSZ/pjkct1zvgbPqcvvKaTWMEPezomIW9w/XjrRnB6CRNa6+SF5UnTB2gpgQ98+igOr2dRgCvjFoOfBjvV5xhmIqNEhV6hIKU6j7KebezXzugg9hR3GbgjQkqm3Di6YOzXWX4uf8KffNY9iyol3wnpZaK3l1yTmTenXoWnobh2fogNnrskPTOKivOC6fWJ0O7GzMayRU0Pv5aCxX9MUWmj+7z3u5VKOWWRe2LiWlArW0XVQAoO9JRTm7LelCLQwFO1UB+zINtSdSBjT7zaqk79Dx9DUwLsZpXsvgCMbWlatmdTZbEK16TC46T02Y5QT1EeTR2rlS6X8yfZwyB43K+04zKBxBd/DBMAqoSfsD1pM0yJjRIqsn2ECg4HODbuh54XR7sjX5hjfnWNqyFMsudHcqMFCqR3vxYbCS2lc94KeBEf4WWIwLR8q42dhEn5I1DQNcyxJUME0ibQwKYTWwRk9cbL1eXsHqaUsnFXGYMOzHlRq32DOo0hsAkk9ezh8u6IC02Xx6IgsfOL16ktrUUnq0CsW2HnVQMEjbs6Jo7spBBLQL7/KLOh7IJ92fSUtZ05k0MvMI3NXxr32Hkq1/afundi7muWjVbqZoraMnMqicQQ/u+HJPyOrjoIFexHW/MdeUuRmK4D2j7bxjYb+yJhbDGn045j7NsGLOMyoW9F9ub/IK48hdp+BuWm+EeBkHwsNkLjkXBq+i/Fip+0fRmQthP9z
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(921020)(18002099003)(56012099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?HRndckd0p9KwG01R/8RVdkhJfRyVZSI0YXOtgweEsOl4QmXafgprRENyhM7K?=
 =?us-ascii?Q?jYp/wn6vUH80ZyjINteYE//TIcJ5PaHejcMoXKw/9qmqf0nYWqLqsntpZEIk?=
 =?us-ascii?Q?8q0c7ppld6JnL2inP48OJp5oOfgoiuRC1D5uuqzJNapb3ln6Lcldmh+BfQDU?=
 =?us-ascii?Q?AVKI+vlqJcPobaF35+mxII2htOrvMWeEtMaH6mm3RBVajdPakoP/UvP+mGcj?=
 =?us-ascii?Q?aQa/eL7urqpRPJFYJaLqaeAhPfdUB/fdgNHFVVaJEQ0YrRNlMCBFWkxfnGgt?=
 =?us-ascii?Q?ypEWiSBF6ouXTTszzb4Y/F6ESg69Z2IkipGZhnu6LMYxueG9hFrkO3J9jlXI?=
 =?us-ascii?Q?eQs4yS62ZJUoJTVcqfErj8ofjGUZpMx5F5AeYJvAdbFTwnQNo3voYLOj1zcV?=
 =?us-ascii?Q?rsPQo2qFuoeZh9XarejeJYo/+HFvGJnoUsp+a+zjEkP7V8K73KI9ghl38XZ5?=
 =?us-ascii?Q?VVkc7hSCOWmbtWdYk8cZWGPrlpfgl09Y397ATbx4MJM/t7k3XFLcpoyeWRNi?=
 =?us-ascii?Q?31UqgItqI9k5jwbTnWtOsFx3d/a/gIcauxoOwxWRSyUkUiQduU15ucvo5HXe?=
 =?us-ascii?Q?Z5TvYmGQUGRH1nOEdZfFLNpCM2Z0jKmUoxFek9q+kfDQhwe82WXwyDADvVVh?=
 =?us-ascii?Q?2iXAqck7z05JnGawqxXMP7nfWIPi5nR5rS29uEJONbCkGqHgirRYLo4WbN3X?=
 =?us-ascii?Q?2Vk92bp0auJy58HJ1vI/2hy0xckcnNs5UqqEAJKj1sLT2F5pwRSRM6ehnpOM?=
 =?us-ascii?Q?L2t6DpicfHqppndNMovuhz0qElfJrfYEaED+I6PvbS8XPDZOIer7GoNTBrhw?=
 =?us-ascii?Q?CLCmarUPgmXIvGcSTIVxHKZE45Gi83FCuMjrup8ypvT7rUexp55q6p6wWhFz?=
 =?us-ascii?Q?hrh4BOS1sba+7LtIsy33kkXP1bj3tntR0OUb1DD5G/QPQmphJsasmlP9JyDL?=
 =?us-ascii?Q?ataVcd+QoWzuwtDumyY3BgMPTL2QmE0R6+688bjupLuGFSod3/dP/u0ZXDQm?=
 =?us-ascii?Q?FWGeOT3CN0Hz+PfrRvNtqG4WaAW8HhIF9zXrvL0k7tQgXYeTP2PV+jzWDjc8?=
 =?us-ascii?Q?Qhap3frfAdXafY8syjOkkilEMuq5n3DPSwilmI1XHqiobvfMlPjU/rkywMZV?=
 =?us-ascii?Q?qAb8BXx4spkkTb+ZZ2yPKsoCYkjLZUeUl5TUpQFRCst5RyeXfm7on1jSPJoV?=
 =?us-ascii?Q?neeQ4SUmhg9aAa3lfTXAQjC7YAsCNFbbls0VXAqigYHAPNZn2M1hozRcstV6?=
 =?us-ascii?Q?xMiUK50ae1TvQfZ/yo8pzOQjXvNlSisjf2OP1krgQdERLXqGT1/RLgLuTFAG?=
 =?us-ascii?Q?givOApUR5DHbU0WUTcGYBN+U0wNrgHZBbRkZiBcTKr8aP7jr9poqflpKLiXN?=
 =?us-ascii?Q?SoyKuzlm/q95kOZbH+1rURtSHogio+ffalRQn0xU/4peDPL5v/bfvpAT+uHP?=
 =?us-ascii?Q?2LBan6f4g+IgyGLe5JQf8LaKDWHod4FCwR+6mxtCUAYb5Huci+J2VMVCo+C/?=
 =?us-ascii?Q?HO3c2FnB+HgRD+lYguE7VVOYhjWQ2Uf9jzq1wPRluOh2pNsF6XMwc/cYIFxk?=
 =?us-ascii?Q?sQYfpBwFvrzpGz2Hxgl+dETzi/xqIrzUCVpxYJDcPKyAGcpWVhkH2IXldCKO?=
 =?us-ascii?Q?hdgvosOUUfLVORpWXoVE35FcLTP04K+A0opMgPkGSFWC20tYQVs+uSBZM2mf?=
 =?us-ascii?Q?nwzmIgMOgPUJe4HQcrwzOjbQoUZKromk10Q/lPGAM7rnfsp9a9YQO+3RMJT6?=
 =?us-ascii?Q?DvHduRBClQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fd4b132-dc6f-459e-996e-08de919e12b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2026 16:28:43.7564
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A2Ym9caWM/8iRw6MZ4WRGMa3IQ4HYqcveqmcSiID8FKEcOMPdOyD0s8S1Sf9IU8hAvHTx0f787BVRpPyoJD1kGjgDuEKL+hz0FJoO+EmCHQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB15384
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30866-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[bp.renesas.com,renesas.com,lunn.ch,gmail.com,armlinux.org.uk,davemloft.net,google.com,kernel.org,redhat.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	NEURAL_HAM(-0.00)[-0.997];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:url,renesas.com:email,TYCPR01MB11332.jpnprd01.prod.outlook.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C35033968AB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Ovidiu Panait,

> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> > Subject: RE: [PATCH net] net: phy: micrel: Fix MMD register access
> > during SPD in ksz9131_resume()
> >
> >
> > > >
> > > > Hi,
> > > >
> > > > >
> > > > > Hi Ovidiu Panait,
> > > > >
> > > > > Thanks for the patch.
> > > > >
> > > > > > -----Original Message-----
> > > > > > From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> > > > > > Sent: 03 April 2026 12:18
> > > > > > Subject: [PATCH net] net: phy: micrel: Fix MMD register access
> > > > > > during
> > > > > SPD in ksz9131_resume()
> > > > > >
> > > > > > During system suspend, phy_suspend() puts the PHY into
> > > > > > Software
> > > > > > Power-
> > > > > Down
> > > > > > (SPD) by setting the BMCR_PDOWN bit in MII_BMCR. According to
> > > > > > the
> > > > > KSZ9131 datasheet, MMD register
> > > > > > access is restricted during SPD:
> > > > > >
> > > > > >   - Only access to the standard registers (0 through 31) is
> > > supported.
> > > > > >   - Access to MMD address spaces other than MMD address space 1=
 is
> > > > > >     possible if the spd_clock_gate_override bit is set.
> > > > > >   - Access to MMD address space 1 is not possible.
> > > > > >
> > > > > > However, ksz9131_resume() calls ksz9131_config_rgmii_delay()
> > > > > > before
> > > > > > kszphy_resume() clears BMCR_PDOWN. This means MMD registers
> > > > > > are accessed
> > > > > while the PHY is still in SPD,
> > > > > > contrary to the datasheet.
> > > > >
> > > > > SPD mode: This mode is used to power down the device when it is
> > > > > not in use after power-up.
> > > > >           Previous register settings are maintained during and
> > > > > following the removal of SPD.
> > > > >
> > > > > Suspend to Idle case, it is in SPD mode and the MMD register
> > > > > values are retained.
> > > > >
> > > >
> > > > On resume from s2idle, ksz9131_resume() calls
> > > ksz9131_config_rgmii_delay() which does MMD accesses,
> > > > while the PHY is in SPD. According to the datasheet, it shouldn't
> > > happen. See commit e398822c4751
> > > > ("net: phy: micrel: populate .soft_reset for KSZ9131") which fixes
> > > > the
> > > same issue.
> > >
> > > On my board, while s2idle in SPD mode, it does not hang. The
> > > datasheet does not explain the behaviour when it is SPD mode. But it
> > > states that it retains all previous register values when it is out of=
 SPD mode.
> > >
> >
> > According to the KSZ9131 datasheet ([1]):
> >
> > 4.17.3 SOFTWARE POWER-DOWN MODE (SPD)
> > ...
> > The following remain operational during SPD:
> > MII Management Interface
> > - Only access to the standard registers (0 through 31) is supported.
> > - Access to MMD address spaces other than MMD address space 1 is
> >   possible if the spd_clock_gate_override bit is set.
> > - Access to MMD address space 1 is not possible.
> >
> >
> > The spd_clock_gate_override bit is not used in the KSZ9131 driver.
> >
> > While the datasheet does not specify exactly what happens if registers
> > from an unsupported address space are accessed while the PHY is in
> > SPD, I think it is correct for the driver to not do it in the first pla=
ce.
> >
> > [1]
> > https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/Product
> > Documents/DataSheets/00002841D.pd
> > f
>=20
> For s2idlecase: ie, PHY is in software power down state you don't need to=
 restore MMD register, as
> exiting software power down will restore those registers.
>=20
> You need only restore MMD registers, when PHY loses power ie, suspend to =
RAM case.


I believe, You really don't need to call phy_init_hw() at all

SuspendtoRAM case: ###### ksz9131_resume 1140, software power down state is=
 0 (Normal mode)
SuspendtoIdle case: ###### ksz9131_resume 1940, software power down state  =
is 1 (SPD mode)

If (phydev->suspended && Normal mode)
  	Restore PHY specific MMD registers.

Cheers,
Biju



