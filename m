Return-Path: <linux-renesas-soc+bounces-30114-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eEvPCOBhwWmaSgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30114-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 16:53:04 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F4F2F70D6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 16:53:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A860735544B1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 15:30:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E3BB3BB9ED;
	Mon, 23 Mar 2026 15:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="aaCi/Upx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011026.outbound.protection.outlook.com [52.101.125.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8CF3B3BE7;
	Mon, 23 Mar 2026 15:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774279187; cv=fail; b=e4x4nuZutJezsuy/mGJ8QhKu6cg4JKR+hS320sNDO64TrSEUDNjLQoH8xB5/EQCGLjmUBZeZYROH9gPKxQLHckMZl2SXT6Tmj9F3vBsLZpmFaVDmxUJDUqKPVRqIDGEs8oPeQg8fzbeaoVJIgxF8ShkKlyT37eX4KqxbP2qVkQc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774279187; c=relaxed/simple;
	bh=ZiOm7/b+Dox7oMXkvpCo2CZtrssrqTWFOa76i7vewAY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=In+5vg5UKRNZnq5jDHJTJKQYe3bagFvBRX93HVEnQ7i9T31s3pOi0pC/lG2vS2IUzQqZwppTkEZLkLFEhkTn/F9TgwmvJ8F1lkY24GxClg+NlB+ePfgqpni/t4N7StOpCPSx6lmjqT/yWRcmC+Jl5i62Zn7LU/cL2Ti+YX0pVRY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=aaCi/Upx; arc=fail smtp.client-ip=52.101.125.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tBEistly4OS/nVnv+VHGDLZKHl2w3vwVxBTrUukyAw8psLe/zsCNow9ZiQzlz2hjEXnw3e/hez2bpq3m0Qtd3Em6kwczJkPZG5DX4Pm3BrvFzAknePsE1o04FWmDGAD3lhyzI+E89ftaMLM+WvqlgwHNwdNpmWPa6M41cD8DKM01b/IQ2zxUAajmisc53Z+Mge25eoFUQAH4AptQmwF1BKUWQh+LG2gzcOTSdhZpMcymG26WNHsbH8u1OlmQGvaQ2lAjCK88ToYrD0/e7ixivIyqqh0FDHgmZ199VXm8fLclaqwuudt1t+U83hwJCZEdtYLZ7N1WZkClCsk/ulEtpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZiOm7/b+Dox7oMXkvpCo2CZtrssrqTWFOa76i7vewAY=;
 b=OKbkWcZ/mbYsZlOpHYnKHmWv8bWMWtcjufAC7upHggcakVKsOFqXwF1r/Aao8f7AqN3cU3Fmw/B/jzzet+9sUv1JmjInJ6CUu4XRFOa0cI4EOVz9h3dcRqhuJs7XhWitJPbQmLMHiuLdIM8amc4OTyS+AJWcmo1AxGWa3V4aLOCMYfkxCGzHC5pv0mhMiEHwgwp+MDetCCnVV8xCs7SDNrrPiMBZBlOdLjD3Tok45OAWPdqX7H8pH5mKPX/cEThJnuAHBxj3+JieqebQLVSMRF010WOHaFFX76LfSxGcXFdpo5qa3gRn8oCkSsvzRRQKYylMvZoolJSZzPd01dd7tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZiOm7/b+Dox7oMXkvpCo2CZtrssrqTWFOa76i7vewAY=;
 b=aaCi/UpxAawVvAOwaP6qW2A/6r6VpMiAx+j1zTlu2icT2Ix/VSBjlaEHnJvFbv7v8gM1hb9mhl4mk7WfMi4tPHtccQmIfqTLkSkr7k6OgeMbe8qZKUG1TIpPyddnizIihrVZOzDOiqeyUfbeKiOjYAZ0IusPArTknea27SJxzfI=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYRPR01MB15881.jpnprd01.prod.outlook.com (2603:1096:405:2d5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 15:19:25 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9723.030; Mon, 23 Mar 2026
 15:19:27 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Hugo Villeneuve <hugo@hugovil.com>, biju.das.au <biju.das.au@gmail.com>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Chris Brandt
	<Chris.Brandt@renesas.com>, Laurent Pinchart
	<laurent.pinchart+renesas@ideasonboard.com>, Sam Ravnborg <sam@ravnborg.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2 4/4] drm: renesas: rzg2l_mipi_dsi: Increase reset
 deassertion delay to 1 msec
Thread-Topic: [PATCH v2 4/4] drm: renesas: rzg2l_mipi_dsi: Increase reset
 deassertion delay to 1 msec
Thread-Index: AQHct8A+aOtg03CPv0GtnFeZnAcwLbW8MNWAgAAPJRA=
Date: Mon, 23 Mar 2026 15:19:27 +0000
Message-ID:
 <TY3PR01MB113460833AFD4BE4422E5E737864BA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260319164833.409126-1-biju.das.jz@bp.renesas.com>
	<20260319164833.409126-5-biju.das.jz@bp.renesas.com>
 <20260323102015.957b2f855b7d54aa5d33869d@hugovil.com>
In-Reply-To: <20260323102015.957b2f855b7d54aa5d33869d@hugovil.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYRPR01MB15881:EE_
x-ms-office365-filtering-correlation-id: 0f7fd8f8-1f6a-46bf-f8f5-08de88ef928c
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 0Tj3MGaogwO1c/3SufS0UkAOl8lXhR81MRsrHN7fnToOxr6HmNnwNon2dFgbsp24GONpO/lKIYsr9wFKweINeWi7LhrmAbmxFjL7pJRECMvLw7mu+2QwPLaZJb6MXA/MA58Orkq1fcFnDCfDKj0KFti8hw0wsM311Qh/GYFBnLBWw0U/RTQ0KctH1PjJWBrwq2rvdfNZcUjjJ8wTONILeuqOhUwUDAVLwgOwWwAg+/VxMwiYAjT7fnJDvD9vfF0fCK+N0n8lCkxcflMVJbjMKI934Ljrn8cxgPQa9wmW+bcTmaI0bCxSIJMfWVVLXjn5RudFJG0I+J0XHoWvSNRi825i6rZW9pLGOGciQXHPE2gckwXGvNDzhiy7qRiJ6npKcRZB+iAQVtqHIS9zBmm/dK/Y4kSLFWR3qhn9tQtSlcT23cVwwEGjzhn0X9ujeMttQPGIVMkd8Q5mTvw4KeFyPKTL9SMobc/JlYzD08vVXIDyBPnql0lIaWFYAl6FYvnHlQJ+bbYatffmlNF3WOTPqJTq+DJTgkxjbjj03d08khOmOqAH9iGvVYV4nbItMjkHjgVgS8RiWLYaocNqSZj9ftCoKYLADV6Nr1xyxIR1vHN04ukdDDXdy/UdMXfAKfBb0n7CKWcyWOzwD5W6PxPhzka3+7D46rKC96vezqI17mYyf9yr4bONy3/nDq7huUz4ZHWmLz/rOlzbi5S0s7UTDtwAN5APn8QLbmvBBVi/YpyueTICblNzaL0Wh4+x3YR5JMOzPGfA/Lk0P127F/9/otLKTZFvMxbgz1MjwkCxNVo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?LaSPO8B88SWbffBp5Ncu6gaPxL4vmZrfoAeiswpdd/13ldHtEqZDgpw3SXNg?=
 =?us-ascii?Q?NDA1IK8XkpXVputB4QmK/NaPQlNtDEdFSbfqjyKduKQsBtESKnf9GiB7RMBy?=
 =?us-ascii?Q?3SXOgNH7+n1Op9N4LJAW+nkDt69nMSN/kU8LDrfRyD2B/LFaiHW+LbN2CaTM?=
 =?us-ascii?Q?r55G+VQsl8dW5a988KPqays35ixREirSMLNJYlAPmOH5SpDesMSRG5vmzxAv?=
 =?us-ascii?Q?zxV0tLPj07QxTsOxte2AL7Zs5PzC+C7qd1NIH7I2YE4TVrQpxpAjsXtAV+Rm?=
 =?us-ascii?Q?LEExx5J8ctRnKPaR4tQfw6rA37B3tpTCVyakH+tATT5AEo+Gk1QEq++Mnvd/?=
 =?us-ascii?Q?jmOrTfRfgL103bSaKzy6DX5OHMeZJS9aDm8OF0hap+ccCK/T10KLrr1bbU1z?=
 =?us-ascii?Q?ZQyADnTHcMyWaqR/Z80fF0CIRt3/90K2vPPN5FdRhI43ugB4l5tQJ/fMf8Tt?=
 =?us-ascii?Q?sokovFy3EnMn2E3sxAiBb/Sel9Wa5XWiLBAhwEg3GmuF+3RlCGN3eCk8rQt7?=
 =?us-ascii?Q?GXdkVsXEQV1UfMlauK2qHujxW2Oz7zhpySq8PBbhVDQs8Omr16/cv73AUZmm?=
 =?us-ascii?Q?6ahBUW+C9AZm4MUtPQrkbVXWxbjiASykTo2sSTJZsT8Yc1YmW4DPRwCfUKpH?=
 =?us-ascii?Q?hxz67lWHIkVs+L7J7pWrcGr5WVrjmlvdi5Z83vmVqUCnXOaOA+orVy3+J0Ob?=
 =?us-ascii?Q?Q5sjPQpKRz6j2C9Kdw5KyeieGRBB/2W/HFE/yDiasBqSe6QBr7sRaUqpRvma?=
 =?us-ascii?Q?Vlejy2ii5/UlbYLJ9HOUq/keenpxvY3h1oscXZLv+fJ5gl4xxZKz5uczTVKJ?=
 =?us-ascii?Q?a9EQDmXng/MzpgvCN3zRgGKUn/vrzQpwi33uxIuT2aYJvMvjw+vhmu6kTgAP?=
 =?us-ascii?Q?J+7Tbg+DSlSwKDywk+A2lSyuSxI68nfIt815OHs4ki/uIqdpuGeMl7pcEb3z?=
 =?us-ascii?Q?L1lqlvqqwx6lcrvKUYt159KepEEd4iPgxpesT4onHIoBz8JMO45/+Qt70gX6?=
 =?us-ascii?Q?O6M9tOmYm03WTqAwcX2djPnpSbThqnakAtYU0GP8mSSYW1q2xwEWrhTQkGC7?=
 =?us-ascii?Q?XLJCY9OcpWscKPCw4TvVXZskUqkVwVVqve02BWbes3aqP9on0Tr4OWnt/luP?=
 =?us-ascii?Q?Wfy2aV3YkipMI4hZ1Jo3hZeJDDHdhEry0G31jxhS7l75ENiBsvGc4I64cdPf?=
 =?us-ascii?Q?yZ54HskXqO55e9Zo+DeqtjnrvvU4LXfKNApvfJOEe3jAaV65eZmEdh6MjqnX?=
 =?us-ascii?Q?n+qfF9UY9m2eBOV+xLXLFrQrdzC4lZ0mcXiGdH6KSFJVQYYsl98WlU4yLe/m?=
 =?us-ascii?Q?5L2FpxQLreTv+Za71zdl+wdkTyZCKqg/PBqblJ/k5DtXuk++IvjMz+v8YIAt?=
 =?us-ascii?Q?7goLeOb6TEeNDQfMelH6V8mSoz77VlCj7COws7hNF9V2NU/aICC12Kt7sUDY?=
 =?us-ascii?Q?BOSHu/pfVATHaRsAehB9pYA3T9C3f11L2qHjN+9aT9Dux9u4PzauZy2t0Uhi?=
 =?us-ascii?Q?QiZHXQYyjYLqTmi0Q5WY9Q/U4TXD7d1lJ2ARj34Il+TuodOtwNPbYsffC+YA?=
 =?us-ascii?Q?UPYfkJ4bk1BN06Zx7bYTGbDI2EbuM2fygPkebVJqK4M+Jm4l3ruZliAgvCDY?=
 =?us-ascii?Q?J0RnSS/rDRofpV/c92sx1VncW3digBy58tlW4n3lWS0xULZlf4/so3/7ed+a?=
 =?us-ascii?Q?QQrPccyNkA3pGwMLR55aGEFil+ebFVgTCm07UFwzxrKrADylaTc1FP3tiR6w?=
 =?us-ascii?Q?CRp0vaK4CA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f7fd8f8-1f6a-46bf-f8f5-08de88ef928c
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2026 15:19:27.0386
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lmVMtTbaEPG8NDZjPHvf4XR4UVk+soxrTy1+hYO5C7QU0H3VmcDOIpfTvU1T1iZZrC1OZrj3a4KS5x/J793faGbKy+eKh9dXzaV5RYbKm78=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15881
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30114-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[hugovil.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,renesas.com,ideasonboard.com,ravnborg.org,lists.freedesktop.org,vger.kernel.org,glider.be,bp.renesas.com];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:dkim,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: 74F4F2F70D6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Hugo,

> -----Original Message-----
> From: Hugo Villeneuve <hugo@hugovil.com>
> Sent: 23 March 2026 14:20
> Subject: Re: [PATCH v2 4/4] drm: renesas: rzg2l_mipi_dsi: Increase reset =
deassertion delay to 1 msec
>=20
> Hi Biju,
>=20
> On Thu, 19 Mar 2026 16:48:28 +0000
> Biju <biju.das.au@gmail.com> wrote:
>=20
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > The RZ/G2L hardware manual (Rev. 1.50, May 2025), Section 34.4.2.1,
> > requires waiting more than 1 msec after deasserting the CMN_RSTB
> > signal before the DSI-Tx module is ready. Increase the delay from 1
> > usec to
> > 1 msec by replacing udelay(1) with fsleep(1000).
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> In your first submission, I commented that "...this should be backported =
to stable branches (missing
> Fixes / Cc: stable tags)?" and you answered with "Agreed, will add fixes/=
stable tags".
>=20
> If you still agree, this patch should be #3 in your list, so that it is e=
asier/straightforward to
> backport to stable branches.

The patch order is changed. that is the reason I have not added any fixes/s=
table tags.

The if check in patch#3 makes it is not backportable to stable branches.

If I reorder this to patch#3 it is fixing just the delay mentioned in the h=
ardware manual.

Cheers,
Biju

