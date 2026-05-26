Return-Path: <linux-renesas-soc+bounces-33133-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMyXLfdGFWqLUAcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33133-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2026 09:08:39 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E3C5D1826
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2026 09:08:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 98A7C30254F1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2026 07:08:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A73A3B7B91;
	Tue, 26 May 2026 07:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="eTA0jU+H"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011051.outbound.protection.outlook.com [40.107.74.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C063C6A5F;
	Tue, 26 May 2026 07:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779779310; cv=fail; b=Z0huWvTZskpBKHpqmb3P09I4V4FSW8By9W+4nn39AV4mlB530SUFHLZ2bIHM9LhH6AEkN0VMs3aZwwnRGMx8aDZQ7yjtdaEK50IdSKYlq1V/0Yg1NmKd7QHko3N3D2mCT+lG/zTFEr18KApaPa9W4TMy7gIpueMy2f+WGhN15VY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779779310; c=relaxed/simple;
	bh=iw1xhVqZWUtZ849eXVN9yEkIT/Oskymtsrpj1AQTvc8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Os3XNyV5Lam5NvfVoN0cBXF8pnU5Et4Y/DJmVMkmP7LWRiaSQotBMgbyfSMenqNTSGvkU4VX1wS9oboIYYrBb5NZ9WynQApCbpNN3K8+U6qNw/uQ63rIkdsG6aoApzdVMmr1CRlSzcSpWHRXs8gtIPN4zrt4ZNLHfRXrksX7B9s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=eTA0jU+H; arc=fail smtp.client-ip=40.107.74.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=boI+q6vyWyYSjvPy6JEv8k9ZUSAVs9TgtckaMOwDmFKQcEnL4tnyy83hF3+SBCiNwJkkKzglH61BJUFR0CLU0zj028kFHVavxjEUkj5EUqhM/8bgGJvHBz1tELSRT5hxuP4Xgs5R9zczOJfiRA+u32Oq8I6tj0UW7u71cg54OZOcIHaSKJC0UwcN3ogIBJVMN4K8wbrMlcV2JnuvzKY2gSxo1WA58c1loqfgOY/NwRGBRKVlU/v/hAF13YbP+RuxyiX/hkenqHzONdBcrE9XZSuxZUje3xsTw4wTyeEFVE07iQteAkWGmlta5wHFA0x1awk4XO3TPx1wd0I1T8+ZOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P92tzhN6wxjlSazJa2XIh8ny/kkm8PCxX9FOSVs5h9A=;
 b=bFu2RzifARs9pHsqNV47IQd2ySqbkvT67BKM7Gl4n4hcs+43HAhAeSzMqnmErbN29VgnlFOqSo7h1+CoHhm6cCObvaPcwFyB697byomq1Ik/sX1nVT83v9bH0+i94XMHVFg9bfnEvhYOS4mcMFYZ+o+foYuFzjaIQscVI1nEXBlA58lx0bpbdvZz+vp8hs3PH0eaSc2h6pKcDawFt+qa+m3L0CUOeDJMSrgWt1oPMza0SpQkgAv9Q+IcEuGYwiXCMCelWZWR88ZMhW6wNkcRHJPMwKUHx/tm/LLphSqNqpo6roRJE8SHH3QzeFEWPZnXTgtYuoYvrE/FE2H009t2mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P92tzhN6wxjlSazJa2XIh8ny/kkm8PCxX9FOSVs5h9A=;
 b=eTA0jU+HVmem/OxCJOoo0aPXbuZ+tXT7fzM0jTDQcD55nVfnmDQGlGUdnIJVMp5XalV+RRAWzsNZEeeYVquEObfyuuVbCzFbwHGcqaJqknQm4bYKwCWeJFr0Kwp9qSJcyw/fMvvQrcw0pEvDqewZ0N8vawE5KJL415D2u7WRcMI=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSZPR01MB7796.jpnprd01.prod.outlook.com (2603:1096:604:1b5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 07:08:19 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 07:08:16 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Philipp Zabel
	<p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>,
	magnus.damm <magnus.damm@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2 2/2] drm: renesas: rz-du: Add support for RZ/G3L LVDS
 encoder
Thread-Topic: [PATCH v2 2/2] drm: renesas: rz-du: Add support for RZ/G3L LVDS
 encoder
Thread-Index: AQHc67XT8FJbm0nVtE6iwQBiKlnRKLYf5EuAgAAAvaA=
Date: Tue, 26 May 2026 07:08:15 +0000
Message-ID:
 <TY3PR01MB11346C9C387813BDED53B1CC1860B2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260524194457.479681-1-biju.das.jz@bp.renesas.com>
 <20260524194457.479681-3-biju.das.jz@bp.renesas.com>
 <ahVF7V3s1kF3VeDn@tom-desktop>
In-Reply-To: <ahVF7V3s1kF3VeDn@tom-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSZPR01MB7796:EE_
x-ms-office365-filtering-correlation-id: 5b653352-5777-401b-3af9-08debaf58ee2
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700021|11063799006|3023799007|4143699003|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 jYugxvBr/I1nBVwhVBtEUEKUL95W0UJdth043ZQmoSa1d6TLRBSKGlT5vqhcPPtCgsUsc+18kQbBjo38vUzNM0FSyy0HyX0U+3YPx+QG+R5Ep9QmpZG/wbQ2SYJf9jdEeruJl906efsy3PbpjqP8bGgIQ0X61Iv9Ieq0hyhzSeNsuKPGgYSqecEzJ4Eus40qKz5QOIHVGtBTvQBDyT0COGetVY7W+1rO/BZDtbhH9jkldnApz7TpSvniqdcqGDyi2YqNYzKOVO6Tmglazq9S6KTpwd15uBIzbl7S8o5u4odfUfbCwJP9Bv+F6w8KicBYcnCsLPh51S0KP5u8xNIOGDpmYsNcu2itexq/W8txlpYK7b4gLRI0OSHxausK2tDpUnrQIAK6EQc8XF59NjE1bWor0iEOaLmaPYPW/XHQ/CTWAPrgZNO6er+ET+fPHwRt6RgF/cGQvRSXoe3CS0tB/gXKZw5UJfaY43XA30RafC4XBXim+wgNyzxyHHpBhOSnu7R3TICCDyBMye+pxD4kK4vEASQY6WAo90xeoRl4RarvjEgesRPuYnKFBsOZZvI801KugnYak0VaMbf3YY+Cg+5vjcqNXgowLS6jtf/fsvw5AZYrrTF0dFJpW+vyJ6BSNdBMaIShvo4vrev70A+gjC7Ww8cC3ZsHTXIefqt3ywpOAgOds0ANeEQtDPQb/kr36Xo6gsCWgKu7CgdXiUT3kHQVrbe9Ig6OTpBlvmUZdafALVoW1QBb2M9fpjbjJSdc
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021)(11063799006)(3023799007)(4143699003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?wxW/gJgpSztQiDrHG5BY5TgZxOdPyAGZ1l1C6+5rANNy3dVGcVDbiExTSi/c?=
 =?us-ascii?Q?axqF8rAXr5cP0+YfbkFUZofHITJQFcC1P5wku1bI7ktbQpqMxyqKpPIBFN7O?=
 =?us-ascii?Q?zbpsFfukj4pQQuXobhBdzOwT8RvxnTyfU6SAYS7NW9EIY7qujZ6I0fI/zetr?=
 =?us-ascii?Q?seLBrqXyTHz5Xp2VpJPzMDEdB1vwaE5hK6+TlzsCyyEoAbhSLzz3Sp57f2t3?=
 =?us-ascii?Q?XZ1Zh+MUPoDz29CD5ha2Ygf66qf6MHH437n3bDIxWCC4a7M89zRpWPpupmk9?=
 =?us-ascii?Q?aWcjvLp3ZXDxDj1dNegWBalSDBhtySyITWqSJzxWlGre4HSUPBUcCIIPmZTd?=
 =?us-ascii?Q?UaEM9orgvkVJBxc1QxVTLPrvCNiNNrbAmEAsl1od8NFLhP68QYXWPZNt2Pcz?=
 =?us-ascii?Q?x5bBy5nyeq7FDWLrdY4iygBZzq+zw3id+ct73eR+I3cg1cEN02PQGVPkEyy5?=
 =?us-ascii?Q?1dDiZRyHVMOZVNbc7wHOaVN+IxZ3k+ywRjcCwO7+o+ZQVpsN3fVmNj2wyGbx?=
 =?us-ascii?Q?Lu8uBQzFklvK+kHVQ34AcJiPgt2Jx+1BGHGCfA+F5lArT2A65EuJkT/RQyPb?=
 =?us-ascii?Q?ZAb979Xu20BUCSDGAhLLb4JJCbzKjwVtVfBKOuLgvh6l2pIOCxtkAVmuiAHy?=
 =?us-ascii?Q?1LWPsVG7OfitlSksZ9QTmjTbrSVOa53HkBGlxq5GcxmJtaHiyaBecWeTCzbf?=
 =?us-ascii?Q?URn4rrjh+L6gJF8DKBTByCWOzVIrwiDuMPXU0J7bQuvUI3jRbZaXcGdCyoju?=
 =?us-ascii?Q?yiL8dRDj3zcoIAn1lMcim4o0T00Rh7dbd0NRV22lXLwkwdoyRJj1SfUR0t22?=
 =?us-ascii?Q?BIUfZy7ifXnFKX2FZ8mKUg43XGKEYIeJKlA9KzMfIWav96JIJHSpvhuZrP6K?=
 =?us-ascii?Q?yn5egXWPtmVs9R7HWoUyPJGzl8QMawY7PFfYpzp2/TXjUVKnQRKtt440bQX9?=
 =?us-ascii?Q?Lf5yqpbPulqx2XY3S3p4RYxh3BkZedXD8xRLJPnf6Tjk8E6ZreJJpymHrslo?=
 =?us-ascii?Q?79DdBGpFJXrWxNTfKdlpaI6566MZiTkwHUtXZ7UA/4rbEGY1Na9avmA6cRgf?=
 =?us-ascii?Q?5YQ+BkdI2JR3QnqeVkFTE2KB+B+sGya2yoTm9oOSteYHSZdkhR9p75RhW5fR?=
 =?us-ascii?Q?FlbP1defauS/hIb1aXw6WHnu1MD6/l9EYP86uIOEeSOOknWXh5VL9htZLM7Z?=
 =?us-ascii?Q?we5/61tPawAyi179PQEEJEmLjATqsovVHg0mfXpkh1o9VN4++fMz9xfOkn2H?=
 =?us-ascii?Q?8FKNEkSXGH93u7jBAftt04NqU52EWKa8cmEoYSShCCdLKbEBlYGKCFVvJjQ+?=
 =?us-ascii?Q?3rNh0eJSptFATYLPRPR8BS2kfmCTS8hpOMT8nUv6mXYJV21amDcHvzHBa8gh?=
 =?us-ascii?Q?KFPM8RLlC6scLaFPU77UtxRK7s87aaG9I0rXNVj/DpHJqCp4Hbowfl6o0SBR?=
 =?us-ascii?Q?Wj3SpguHrS2JdmcXVcv6IbtrcWKcImO9B4atNaUiez/du2XF4/1uxQ6Ct0E4?=
 =?us-ascii?Q?yVFuM+0b3Ea+nCb6Jkrog3q8X9MzGyWhbxpbYJkJG10ZKSe6ISj0CPX+849Y?=
 =?us-ascii?Q?yhR/7gXQ8kZ1okdZz5UxurAtMG9Jgk5Z7djs6A7hyPLx+Xh/xg+jbt5XBDrK?=
 =?us-ascii?Q?8KM6zD0fv6f8lqkdAe1nPhoHA9GAhU+/Lvp+dpfC8EvesHix5mEhuhj+ptO0?=
 =?us-ascii?Q?jz2HcrUzsyv/xPN1Tbg+BVdyzU+ZHm6KzVL888+0j2kCprB2ej1qNs3B3CB0?=
 =?us-ascii?Q?6v4n5MmLbw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b653352-5777-401b-3af9-08debaf58ee2
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2026 07:08:15.9187
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Feqwi9BAnOoHt/JiBa0Tmkfgq5iWRgnRdZasBzdf+MiH0PcnO9PDiNIBaDDyl292XEkOwleZGzUrLQb991zZc+I8bdIxmCK4gkeOp7jE2FU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7796
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33133-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[bp.renesas.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,pengutronix.de,glider.be,vger.kernel.org,lists.freedesktop.org,bp.renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-0.998];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,renesas.com:email,bp.renesas.com:dkim]
X-Rspamd-Queue-Id: 32E3C5D1826
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Tommaso,

Thanks for the feedback.

> -----Original Message-----
> From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> Sent: 26 May 2026 08:04
> Subject: Re: [PATCH v2 2/2] drm: renesas: rz-du: Add support for RZ/G3L L=
VDS encoder
>=20
> Hi Biju,
> Thanks for your patch.
>=20
> On Sun, May 24, 2026 at 08:44:51PM +0100, Biju wrote:
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Add support for the RZ/G3L LVDS encoder driver. It operates in
> > single-link mode with 4 lanes (Data) + 1 lane (Clock) and supports
> > pixel clock rates from 25 to 87 MHz. The LVDS module cannot be used at
> > the same time as MIPI-DSI. However, LVDS and the DSI interface share a
> > peripheral clock and the MIPI_DSI_PRESET_N reset signal. Also, the
> > MIPI_DSI_CMN_RSTB and MIPI_DSI_ARESET_N reset signals must be asserted
> > before using the LVDS module.
> >
>=20
> I thinks this should be v3 instead of v2.

Oops, you are correct.

I will send this series as v3.

Cheers,
Biju

> Apart from that patch LGTM.
>=20
> Tested on RZ/G3E LVDS ch0.
>=20
> Tested-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
>=20
> Kind Regards,
> Tommaso
>=20
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > v2->v3:
> >  * Replace drm_atomic_state with drm_atomic_commit in
> >    rzg3l_lvds_atomic_{en,dis}able().
> >  * Drop local variable ret and dev_err() messages in
> >    rzg3l_lvds_atomic_enable(); use WARN_ON() instead to
> >    capture unexpected failures since atomic_enable should not fail.
> >  * Drop local variable next_bridge from rzg3l_lvds_probe().
> > v1->v2:
> >  * Dropped unused function rzg3l_lvds_is_connected() and removed the
> >    corresponding header file rzg3l_lvds.h
> >  * Dropped next_bridge from struct rzg3l_lvds instead using bridge's
> >    next_bridge.
> >  * Replaced pm_runtime_resume_and_get()->pm_runtime_get_sync() as
> >    atomic_enable doesn't fail and for each enable there always will be =
an
> >    atomic_disable() call.
> >  * Started using DEFINE_RUNTIME_DEV_PM_OPS for PM callback.
> >  * Replaced rzg3l_lvds_parse_dt() with devm_drm_of_get_bridge() in
> > probe()
> >  * Started using reset_control_bulk_*() in rzg3l_lvds_pm_runtime_{suspe=
nd,
> >    resume}()
> > ---
> >  drivers/gpu/drm/renesas/rz-du/Kconfig         |  13 +
> >  drivers/gpu/drm/renesas/rz-du/Makefile        |   1 +
> >  drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c    | 277 ++++++++++++++++++
> >  .../gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h   |  26 ++
> >  4 files changed, 317 insertions(+)
> >  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c
> >  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h
> >
> > diff --git a/drivers/gpu/drm/renesas/rz-du/Kconfig
> > b/drivers/gpu/drm/renesas/rz-du/Kconfig
> > index 7f2ef7137ae5..cbfc7b6bccb8 100644
> > --- a/drivers/gpu/drm/renesas/rz-du/Kconfig
> > +++ b/drivers/gpu/drm/renesas/rz-du/Kconfig
> > @@ -26,3 +26,16 @@ config DRM_RZG2L_MIPI_DSI
> >  	def_tristate DRM_RZG2L_DU
> >  	depends on DRM_RZG2L_USE_MIPI_DSI
> >  	select DRM_MIPI_DSI
> > +
> > +config DRM_RZG3L_USE_LVDS
> > +	bool "RZ/G3L DU LVDS Encoder Support"
> > +	depends on DRM_BRIDGE && OF
> > +	default DRM_RZG2L_DU
> > +	help
> > +	  Enable support for the RZ/G3L Display Unit embedded LVDS encoders.
> > +
> > +config DRM_RZG3L_LVDS
> > +	def_tristate DRM_RZG2L_DU
> > +	depends on DRM_RZG3L_USE_LVDS
> > +	select DRM_KMS_HELPER
> > +	select DRM_PANEL
> > diff --git a/drivers/gpu/drm/renesas/rz-du/Makefile
> > b/drivers/gpu/drm/renesas/rz-du/Makefile
> > index 2987900ea6b6..46decb7ac4f1 100644
> > --- a/drivers/gpu/drm/renesas/rz-du/Makefile
> > +++ b/drivers/gpu/drm/renesas/rz-du/Makefile
> > @@ -8,3 +8,4 @@ rzg2l-du-drm-$(CONFIG_VIDEO_RENESAS_VSP1)	+=3D rzg2l_du=
_vsp.o
> >  obj-$(CONFIG_DRM_RZG2L_DU)		+=3D rzg2l-du-drm.o
> >
> >  obj-$(CONFIG_DRM_RZG2L_MIPI_DSI)	+=3D rzg2l_mipi_dsi.o
> > +obj-$(CONFIG_DRM_RZG3L_LVDS)		+=3D rzg3l_lvds.o
> > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c
> > b/drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c
> > new file mode 100644
> > index 000000000000..a51c3e5a2efe
> > --- /dev/null
> > +++ b/drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c
> > @@ -0,0 +1,277 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * RZ/G3L LVDS Encoder Driver
> > + *
> > + * Copyright (C) 2026 Renesas Electronics Corporation  */
> > +
> > +#include <linux/bitfield.h>
> > +#include <linux/clk.h>
> > +#include <linux/delay.h>
> > +#include <linux/io.h>
> > +#include <linux/media-bus-format.h>
> > +#include <linux/mfd/syscon.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/of_device.h>
> > +#include <linux/of_graph.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/pm_runtime.h>
> > +#include <linux/regmap.h>
> > +#include <linux/reset.h>
> > +
> > +#include <drm/drm_atomic.h>
> > +#include <drm/drm_atomic_helper.h>
> > +#include <drm/drm_bridge.h>
> > +#include <drm/drm_of.h>
> > +#include <drm/drm_panel.h>
> > +#include <drm/drm_probe_helper.h>
> > +
> > +#include "rzg3l_lvds_regs.h"
> > +
> > +enum rzg3l_lvds_mode {
> > +	RZG3L_LVDS_MODE_JEIDA =3D 0,
> > +	RZG3L_LVDS_MODE_JEIDA_MIRROR =3D 1,
> > +	RZG3L_LVDS_MODE_MODE2 =3D 2,
> > +	RZG3L_LVDS_MODE_MODE2_MIRROR =3D 3,
> > +	RZG3L_LVDS_MODE_VESA =3D 4,
> > +	RZG3L_LVDS_MODE_VESA_MIRROR =3D 5,
> > +	RZG3L_LVDS_MODE_MODE6 =3D 6,
> > +	RZG3L_LVDS_MODE_MODE6_MIRROR =3D 7,
> > +};
> > +
> > +struct rzg3l_lvds {
> > +	struct device *dev;
> > +	struct reset_control *prstc;
> > +	struct reset_control *lvd_rstc;
> > +	struct regmap *regmap;
> > +	struct drm_bridge bridge;
> > +};
> > +
> > +#define bridge_to_rzg3l_lvds(b) \
> > +	container_of(b, struct rzg3l_lvds, bridge)
> > +
> > +/*
> > +---------------------------------------------------------------------
> > +--------
> > + * Bridge
> > + */
> > +
> > +static void rzg3l_lvds_atomic_enable(struct drm_bridge *bridge,
> > +				     struct drm_atomic_commit *state) {
> > +	struct rzg3l_lvds *lvds =3D bridge_to_rzg3l_lvds(bridge);
> > +	const struct drm_bridge_state *bridge_state;
> > +	u32 fmt;
> > +
> > +	/* Get the LVDS format from the bridge state. */
> > +	bridge_state =3D drm_atomic_get_new_bridge_state(state, bridge);
> > +	if (WARN_ON(!bridge_state))
> > +		return;
> > +
> > +	switch (bridge_state->output_bus_cfg.format) {
> > +	case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:
> > +		fmt =3D RZG3L_LVDS_MODE_JEIDA;
> > +		break;
> > +	case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
> > +		fmt =3D RZG3L_LVDS_MODE_VESA;
> > +		break;
> > +	default:
> > +		fmt =3D RZG3L_LVDS_MODE_VESA;
> > +		dev_warn(lvds->dev, "Unsupported bus fmt 0x%04x\n",
> > +			 bridge_state->output_bus_cfg.format);
> > +		break;
> > +	}
> > +
> > +	if (WARN_ON(pm_runtime_get_sync(lvds->dev) < 0))
> > +		return;
> > +
> > +	regmap_update_bits(lvds->regmap, LVDS_0_PHY_OFFSET,
> > +			   LVDS_0_PHY_CH_EN_BGR, LVDS_0_PHY_CH_EN_BGR);
> > +	fsleep(20);
> > +
> > +	regmap_update_bits(lvds->regmap, LVDS_0_PHY_OFFSET,
> > +			   LVDS_0_PHY_CH_EN_LDO, LVDS_0_PHY_CH_EN_LDO);
> > +	fsleep(10);
> > +
> > +	regmap_write(lvds->regmap, LVDS_CMN, LVDS_CMN_RST_PHY0_SEL);
> > +	regmap_update_bits(lvds->regmap, LVDS_0_CTL_OFFSET,
> > +			   LVDS_0_CTL_FMT_SEL_MSK,
> > +			   FIELD_PREP(LVDS_0_CTL_FMT_SEL_MSK, fmt));
> > +	regmap_update_bits(lvds->regmap, LVDS_0_PHY_OFFSET,
> > +			   LVDS_0_PHY_CH_IO_EN_MSK, LVDS_0_PHY_CH_IO_EN);
> > +	regmap_write(lvds->regmap, LVDS_CMN,
> > +		     LVDS_CMN_RST_PHY0_SEL | LVDS_CMN_PHY_RESET);
> > +	fsleep(100);
> > +}
> > +
> > +static void rzg3l_lvds_atomic_disable(struct drm_bridge *bridge,
> > +				      struct drm_atomic_commit *state) {
> > +	struct rzg3l_lvds *lvds =3D bridge_to_rzg3l_lvds(bridge);
> > +
> > +	regmap_update_bits(lvds->regmap, LVDS_CMN, LVDS_CMN_PHY_RESET, 0);
> > +	regmap_update_bits(lvds->regmap, LVDS_0_PHY_OFFSET,
> > +			   LVDS_0_PHY_CH_IO_EN_MSK, 0);
> > +	regmap_update_bits(lvds->regmap, LVDS_0_PHY_OFFSET,
> > +			   LVDS_0_PHY_CH_EN_LDO, 0);
> > +	regmap_update_bits(lvds->regmap, LVDS_0_PHY_OFFSET,
> > +			   LVDS_0_PHY_CH_EN_BGR, 0);
> > +
> > +	pm_runtime_put(lvds->dev);
> > +}
> > +
> > +static int rzg3l_lvds_attach(struct drm_bridge *bridge,
> > +			     struct drm_encoder *encoder,
> > +			     enum drm_bridge_attach_flags flags) {
> > +	struct rzg3l_lvds *lvds =3D bridge_to_rzg3l_lvds(bridge);
> > +
> > +	if (!lvds->bridge.next_bridge)
> > +		return 0;
> > +
> > +	return drm_bridge_attach(encoder, lvds->bridge.next_bridge, bridge,
> > +flags); }
> > +
> > +static enum drm_mode_status
> > +rzg3l_lvds_bridge_mode_valid(struct drm_bridge *bridge,
> > +			     const struct drm_display_info *info,
> > +			     const struct drm_display_mode *mode) {
> > +	if (mode->clock > 87000)
> > +		return MODE_CLOCK_HIGH;
> > +
> > +	if (mode->clock < 25000)
> > +		return MODE_CLOCK_LOW;
> > +
> > +	return MODE_OK;
> > +}
> > +
> > +static const struct drm_bridge_funcs rzg3l_lvds_bridge_ops =3D {
> > +	.attach =3D rzg3l_lvds_attach,
> > +	.atomic_duplicate_state =3D drm_atomic_helper_bridge_duplicate_state,
> > +	.atomic_destroy_state =3D drm_atomic_helper_bridge_destroy_state,
> > +	.atomic_reset =3D drm_atomic_helper_bridge_reset,
> > +	.atomic_enable =3D rzg3l_lvds_atomic_enable,
> > +	.atomic_disable =3D rzg3l_lvds_atomic_disable,
> > +	.mode_valid =3D rzg3l_lvds_bridge_mode_valid, };
> > +
> > +/*
> > +---------------------------------------------------------------------
> > +--------
> > + * Power Management
> > + */
> > +
> > +static int rzg3l_lvds_pm_runtime_suspend(struct device *dev) {
> > +	struct rzg3l_lvds *lvds =3D dev_get_drvdata(dev);
> > +	struct reset_control_bulk_data resets[] =3D {
> > +		{ .rstc =3D lvds->lvd_rstc },
> > +		{ .rstc =3D lvds->prstc },
> > +	};
> > +
> > +	return reset_control_bulk_assert(ARRAY_SIZE(resets), resets); }
> > +
> > +static int rzg3l_lvds_pm_runtime_resume(struct device *dev) {
> > +	struct rzg3l_lvds *lvds =3D dev_get_drvdata(dev);
> > +	struct reset_control_bulk_data resets[] =3D {
> > +		{ .rstc =3D lvds->lvd_rstc },
> > +		{ .rstc =3D lvds->prstc },
> > +	};
> > +
> > +	return reset_control_bulk_deassert(ARRAY_SIZE(resets), resets); }
> > +
> > +static DEFINE_RUNTIME_DEV_PM_OPS(rzg3l_lvds_pm_ops,
> > +				 rzg3l_lvds_pm_runtime_suspend,
> > +				 rzg3l_lvds_pm_runtime_resume, NULL);
> > +
> > +/*
> > +---------------------------------------------------------------------
> > +--------
> > + * Probe & Remove
> > + */
> > +
> > +static int rzg3l_lvds_probe(struct platform_device *pdev) {
> > +	struct reset_control *rstc, *arstc;
> > +	struct device *dev =3D &pdev->dev;
> > +	struct rzg3l_lvds *lvds;
> > +	int ret;
> > +
> > +	lvds =3D devm_drm_bridge_alloc(dev, struct rzg3l_lvds, bridge,
> > +				     &rzg3l_lvds_bridge_ops);
> > +	if (IS_ERR(lvds))
> > +		return PTR_ERR(lvds);
> > +
> > +	lvds->dev =3D dev;
> > +	lvds->bridge.of_node =3D pdev->dev.of_node;
> > +
> > +	lvds->regmap =3D syscon_node_to_regmap(dev->of_node->parent);
> > +	if (IS_ERR(lvds->regmap))
> > +		return PTR_ERR(lvds->regmap);
> > +
> > +	rstc =3D devm_reset_control_get_optional_exclusive(dev, "rst");
> > +	if (IS_ERR(rstc))
> > +		return dev_err_probe(dev, PTR_ERR(rstc), "failed to get rst\n");
> > +
> > +	arstc =3D devm_reset_control_get_optional_exclusive(dev, "arst");
> > +	if (IS_ERR(arstc))
> > +		return dev_err_probe(dev, PTR_ERR(arstc),
> > +				     "failed to get arst\n");
> > +
> > +	lvds->prstc =3D devm_reset_control_get_shared(dev, "prst");
> > +	if (IS_ERR(lvds->prstc))
> > +		return dev_err_probe(dev, PTR_ERR(lvds->prstc),
> > +				     "failed to get prst\n");
> > +
> > +	lvds->lvd_rstc =3D devm_reset_control_get_shared(dev, "lvdrst");
> > +	if (IS_ERR(lvds->lvd_rstc))
> > +		return dev_err_probe(dev, PTR_ERR(lvds->lvd_rstc),
> > +				     "failed to get core reset\n");
> > +
> > +	platform_set_drvdata(pdev, lvds);
> > +	ret =3D devm_pm_runtime_enable(dev);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "Failed to enable Runtime PM\n");
> > +
> > +	lvds->bridge.next_bridge =3D devm_drm_of_get_bridge(dev, dev->of_node=
, 1, 0);
> > +	if (IS_ERR(lvds->bridge.next_bridge))
> > +		return dev_err_probe(dev, PTR_ERR(lvds->bridge.next_bridge),
> > +				     "failed to get next bridge\n");
> > +
> > +	ret =3D reset_control_assert(rstc);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	ret =3D reset_control_assert(arstc);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	ret =3D devm_drm_bridge_add(dev, &lvds->bridge);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret,
> > +				     "Failed to register drm bridge\n");
> > +
> > +	return ret;
> > +}
> > +
> > +static const struct of_device_id rzg3l_lvds_of_table[] =3D {
> > +	{ .compatible =3D "renesas,r9a08g046-lvds" },
> > +	{ /* sentinel */ }
> > +};
> > +
> > +MODULE_DEVICE_TABLE(of, rzg3l_lvds_of_table);
> > +
> > +static struct platform_driver rzg3l_lvds_platform_driver =3D {
> > +	.probe		=3D rzg3l_lvds_probe,
> > +	.driver		=3D {
> > +		.name	=3D "rzg3l-lvds",
> > +		.pm	=3D pm_ptr(&rzg3l_lvds_pm_ops),
> > +		.of_match_table =3D rzg3l_lvds_of_table,
> > +	},
> > +};
> > +
> > +module_platform_driver(rzg3l_lvds_platform_driver);
> > +
> > +MODULE_AUTHOR("Biju Das <biju.das.jz@bp.renesas.com>");
> > +MODULE_AUTHOR("Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>");
> > +MODULE_DESCRIPTION("Renesas RZ/G3L LVDS Encoder Driver");
> > +MODULE_LICENSE("GPL");
> > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h
> > b/drivers/gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h
> > new file mode 100644
> > index 000000000000..281b7648f168
> > --- /dev/null
> > +++ b/drivers/gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h
> > @@ -0,0 +1,26 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * RZ/G3L LVDS Interface Registers Definitions
> > + *
> > + * Copyright (C) 2026 Renesas Electronics Corporation
> > + *
> > + */
> > +
> > +#ifndef __RZG3L_LVDS_REGS_H__
> > +#define __RZG3L_LVDS_REGS_H__
> > +
> > +#define LVDS_CMN			0x00
> > +#define LVDS_CMN_RST_PHY0_SEL		(1 << 24)
> > +#define LVDS_CMN_RST_PHY0_SEL_CH0	(1 << 24)
> > +#define LVDS_CMN_PHY_RESET		(1 << 0)
> > +
> > +#define LVDS_0_PHY_OFFSET		0x10
> > +#define LVDS_0_PHY_CH_IO_EN_MSK		(0x1f)
> > +#define LVDS_0_PHY_CH_IO_EN		(LVDS_0_PHY_CH_IO_EN_MSK << 0)
> > +#define LVDS_0_PHY_CH_EN_BGR		BIT(8)
> > +#define LVDS_0_PHY_CH_EN_LDO		BIT(9)
> > +
> > +#define LVDS_0_CTL_OFFSET		0x14
> > +#define LVDS_0_CTL_FMT_SEL_MSK		GENMASK(23, 20)
> > +
> > +#endif /* __RZG3L_LVDS_REGS_H__ */
> > --
> > 2.43.0
> >

