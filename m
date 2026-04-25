Return-Path: <linux-renesas-soc+bounces-31653-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBgbGrGb7GniaQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31653-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Apr 2026 12:47:13 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A8105465FB3
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Apr 2026 12:47:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 007F8300A756
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Apr 2026 10:47:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE855243956;
	Sat, 25 Apr 2026 10:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="rA546hPF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011034.outbound.protection.outlook.com [52.101.125.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B917B1DFFD;
	Sat, 25 Apr 2026 10:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777114029; cv=fail; b=AczuqA2LjmyRnEeM6nfGlQGUxU07Cr/nUiVzCA0UIf6MNfFqlmkWNj54tjBadwmRgNR+PULiXG+xyPNVxPm3KJ47tA7Cw3VrLuxcNLbc/GBZonQ/3c9DSTT5Kgj1Z6BdjwQtq0N/JaAx74QqzQEAk+23QIb4VEYESBW8eeCcfRQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777114029; c=relaxed/simple;
	bh=5aAwBLeCKyyf7x/MxZyRdtiX8uSMIhc/qcgVilAGFZQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=aKhc4bmC7VuxNK6MIwH17MFLkKBoOHWfz79Bu/xzW3cVzJzT85DOUMBZie29RiFtbCUK0WYvqrHPuxSGy5zKjHgyOzsrJ4qOTg25hx7TMk3mslUkL0rf2hikSJ+lCJJGLwHDKDuH8kXbqaNmvI58LO3LXFm4KMmz3hIaPrq8WsU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=rA546hPF; arc=fail smtp.client-ip=52.101.125.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=phBUWAGvamb1LXKxPzyn30bfvUQ848+gNE6wng/sqZ8J63IsZD09ENu/FBk/6KU7LINXpJN+ZHibPL11L3IQIXm3AQUAeOfvbs+wIFeSJMGUxkv5bO64IxqpS0UzVNA43KWa/RdrDCgkwU6SqZLR6wuI1LCqFZnexom6EfoZ6VZixQA1e5V+q9TfLf89T2SaBPkbHfe4Kk/3EbvugwXsOnlONbivHG98XhHh/i4tR9LPe5a+m8Mt2emdcw8ABuX31XijKGZua8ni5hT4miTyDCHhqfw6mC50zV6BtrwCODRvSr5J0nODn9R976ZrM4kjB94SGXu6qYeFrT5VeaQXIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aqMndWHHFm8AG+eKFQdACfxBsDK38139AFTz+Bhoszk=;
 b=XG/KQyOQbuW+k0GWHSAN8xKD0LShxvXoDon/kCQ0QbjVZZvwtqjkbtbwIa749jK0nuxV0pw0H+GBARtYXPyDUsmCJn4LzSKo/klNSAYEwe1kuzTyLdJye3/IRLd+7P/nXLNq4UsaeNf0Qjch9sFVC5UlFoeUL63VNX6Klp3Fn24jcAlRj7SiZ+XJvMP+aaggstnGayqh6VxJF1LxNeK8v4gRBm55cjMtr12Cf9oNt2xjMdr143M3hmDQ2YF4a4yULyc+9rTzrQhQan38H4X6ltDr5kkb1xLUzT4/YvCbbyrOaHCrCscOWxmOgRSE3pk7dkRzMxRy9xjIAiBayCqqdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aqMndWHHFm8AG+eKFQdACfxBsDK38139AFTz+Bhoszk=;
 b=rA546hPFEsMx5aEi+KCjQf/plFdeuIUbkKOdOmChaVupu+Tl4kixbkCxEWW8laEDvLbtBkjNr/3q8C7g/lJFtOCQsCOQ4UoAdzi9sbIVfqt1x/NFimdr9mC3TY2XSCA06sSBjfL/lojhBMaenuDYrSw+nrupY1EU4CFTMr4dXyc=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by TY7PR01MB13578.jpnprd01.prod.outlook.com (2603:1096:405:1ed::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.18; Sat, 25 Apr
 2026 10:47:03 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.20.9846.023; Sat, 25 Apr 2026
 10:47:03 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, "maarten.lankhorst@linux.intel.com"
	<maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
	<mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
	"airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"john.madieu@gmail.com" <john.madieu@gmail.com>
Subject: RE: [PATCH] drm: renesas: rz-du: mipi-dsi: drop duplicate
 platform_set_drvdata() call
Thread-Topic: [PATCH] drm: renesas: rz-du: mipi-dsi: drop duplicate
 platform_set_drvdata() call
Thread-Index: AQHc1Ftf+hrmg5sRKkifEMI48yS0sLXvU+CAgABExqA=
Date: Sat, 25 Apr 2026 10:47:03 +0000
Message-ID:
 <TY6PR01MB17377373D975C10B6A841AD70FF282@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20260425022857.2382603-1-john.madieu.xa@bp.renesas.com>
 <TY3PR01MB11346EADBA4CCD3950E93A41686282@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TY3PR01MB11346EADBA4CCD3950E93A41686282@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY6PR01MB17377:EE_|TY7PR01MB13578:EE_
x-ms-office365-filtering-correlation-id: f80cfa94-247e-4343-67e1-08dea2b7fccd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 nZe3nwwbqhHGZtqfMXVTreMb9lWetOZM3C49WkaNItMrM5neiYrmvj5v7WIi1pAHpM6fvCqVTIXL6Owr+5K6FnhM3NJacxy/G8rm65U/SVZlXl3iexRaBpS7GlO5E9mRKSRpJYMIZPXRiwL80id7TlhBah4KG3/onkyZyVI+mwZAMDh369aysQGNM2aHJRAuicmlTVxIzBU4x0oABpvOxgh8HW594iX7pdfvEFP6HOKr3C77hK/khELLiA1Oe2DmAJM2tmmbYUIIdS9HQy8b1TwmKgsrmuQyzS+kMtdmf0lPiboDUShiFViRb2/NH/yNqZAruCobtDKu6wwlZa+hgT/LOnQFeuUTZN09998BSNO3+tNErAbTuIGp20f6XTJecxPu/PXR8OwnfdOAaAG6s7i1A08jxai5nUIJqm5FIH+JjVtt1Uazq+5wFjarEEWMCrhS/T7e+MT8pE3TYYxhUWBtdE2xJx2pUKqUkrewHOBW3pmDcZZOMxZ9E876Wh2yxdEd6LcGhOSHk1n0SFPrcGU0A4U9JiuTz6inkbQMAgMzCzuxv9Mkf5TloPgNctdxdQcR+7BlVYV8Bgg9z+gd45EB3Wv8MZi+0KmsIhoA/DpI9AE6sH+KUn+o7AZzM7opkE3ZASAnkAsjYiyfo/7FYG6Pc+8X/vi0TnNTZVb+XKdfILUDK6smDxWC6n8sgC5MfX6H9Q5lMoyMUESpO82ddj4NFBP310yhPcsCj4azDIi+UnbRNwJNJua3+wMsxZLg1Hp7rw0W638YE8iUxERA5HFJfM1Pqwo0lQvfi8wX8L4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?qgv8YCffduv8mL4SC9gQiTX+OYHWyYUTeC5IVpBS0M1KWOkJvZiiEH+JIROU?=
 =?us-ascii?Q?NQ75JEHOCVY/Sb0sLj+8vxEnU6jOLhIZ70u+Nr5XUzslHADtLTfrG5ieprGt?=
 =?us-ascii?Q?AhwhcR5i/OSm6LlcBKeZ0o+Zfl6SgZ4KQqcbHdh1fFyDra5qK6RVPlSzjGIs?=
 =?us-ascii?Q?SQLhOytrtO7A4BNB0nMM9ujhD894OFY60xGaBaJDrlneqB+cCOSd/WAQDMnp?=
 =?us-ascii?Q?G1pj7B1w1914aTBuTEULa972h6JkF2E0vm3pBGtfYMKspW5J5QnqA8m5DgkQ?=
 =?us-ascii?Q?h34/nDonUSji7F3gljJtxPyXk08I9RvG97XCSNYveh9hlNyPfQBnwOto/kH2?=
 =?us-ascii?Q?amgqRvXTO7u0+B38p1ojPeASH179Jo7SM5N5jnt9cBr581JW6OSjLisOtLU6?=
 =?us-ascii?Q?MkDPdi4dKvS9l/M4o2u6IPtw/MLMbxEwYAKrLwzN7VGHmAz5xAg1hwL6ym8S?=
 =?us-ascii?Q?8LQpx8LzWQTnYfpdwC1q4W+qpp6v2fA8P6W/Dok6zE6LXARIPAQp1e/ltmSL?=
 =?us-ascii?Q?TJ8BKmO0zMV1k8fBuKhb9P2MB9Ws5aUdkWYrFXdsIQdM5erfq+U+MI2Gj2Q4?=
 =?us-ascii?Q?LaJ3V6ecLvQrvZgZ5L3B+Q26OfGVaMxiWUU5ZnxZyRXHKdZd/bbwuMlYLcqJ?=
 =?us-ascii?Q?+3sBg49tZGFBCqQmBYeUddXatp/+WWUf4jBOufUce7Y6CFnY2Y9OpE45NTHD?=
 =?us-ascii?Q?jB0gXvZsbBbRoW9Q17UaALL2Dcpj0JLv/UP7OzY/mp/LWuoUoLhqWTyOA8xg?=
 =?us-ascii?Q?JYrL9hrvqGtR/Q25BkgbVZ8+IKMynPGROVqtdHWCrvEIlHwZAiEeI4ohwSkq?=
 =?us-ascii?Q?FPMMgGSpodWtWCg5nW2vwslWBa9T87CkwSpYT4jFT4qCsRSZ40qvOT5NAmKB?=
 =?us-ascii?Q?nKd0MWgTgyFn3B/vpYyAcscc8lvTFy5nBycN4bjUQm0ifbCTq9iT+dBKhauZ?=
 =?us-ascii?Q?2eFzTejuE/t09sLVOJbo2rnoEzvw/pz6E1LzMYCsU1OMKQBFli19ufQrq0AM?=
 =?us-ascii?Q?iY0LDeYZRjBI1ugZlIENT32GhDBk8CTfGWSbjTyxISqVpgwl5cSRqHbdj1kW?=
 =?us-ascii?Q?lFqoHsLlMNvqA5BLCXjRh0shmsfZyc4QagPKPiqXFNhv+Ibp2AgVagEoeas2?=
 =?us-ascii?Q?PvP63rJsyhktfnLKdMMnqaJelGas1xVD6iheu3QoinP+7zE1qfI2OhLymH23?=
 =?us-ascii?Q?LKplCJGLZDLBA7/0pJqjrJwWFfiBi0BZ46LVHHjXzNfbyUFD456JxhNJWjX2?=
 =?us-ascii?Q?RYG5VL6GuM+3MtP29PiVqTa4+hvlBPtWb+3d8eW7tdb3dQalZNCIfIAg0RHi?=
 =?us-ascii?Q?iN/R/uc8aOTyQkXcmbxvbrd6ZT6nD5Wlsx4FpyaNmojdqQbJSORmJ8z38/zb?=
 =?us-ascii?Q?zIvEAFEdqdF1K45aNviVfIaXjTol728XOTbSVxmz0IbJM2z5TJn1cVw40d3e?=
 =?us-ascii?Q?iIRuJws7ySU9y+T96gYlrw7jRI+EuSUuU+HzYkBAD/v1+Qwt6gLQyz92G0Sx?=
 =?us-ascii?Q?HAhVSrzjQ/PfbSL78/Nu5yhEMsj202+NzIKJ0D2WWXgW/MfXKSjHw8QCVDqj?=
 =?us-ascii?Q?XnA44unVGODCCP05VDTt6ZPzRYfyaI3CV5JOGAl6HD/kCrV/fTyzQjUvZpLX?=
 =?us-ascii?Q?eSUDA9QfKeE5I6XfA7BoNzb1BP0GJeMOLj1XKgl9Bd0fJWoiAUQB57IJN8OC?=
 =?us-ascii?Q?iolmu52tjiQretlrAuFXnb9o+XbTDuvxo08HS8L9qmf96AeaF/41GYYxbhA/?=
 =?us-ascii?Q?50rMM+A2oC4Dcega49RbglSVjSlDBV8=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f80cfa94-247e-4343-67e1-08dea2b7fccd
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2026 10:47:03.7199
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h6Xpy5QCEwNq0+ENm0FNJuFF7OuefcQ0Vvrm32GoZq/7ufzsjKJX13FjhhqKNQQRg5eZaYkbuFMYRcKUYPS1sP9bjRtpG7fH2/dndDUbG04=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB13578
X-Rspamd-Queue-Id: A8105465FB3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31653-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,renesas.com:email,suse.de:email,ffwll.ch:email,TY6PR01MB17377.jpnprd01.prod.outlook.com:mid]

Hi Biju,

Thank you for your review.

> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: Samstag, 25. April 2026 08:40
> To: John Madieu <john.madieu.xa@bp.renesas.com>;
> maarten.lankhorst@linux.intel.com; mripard@kernel.org;
> tzimmermann@suse.de; airlied@gmail.com; simona@ffwll.ch
> Subject: RE: [PATCH] drm: renesas: rz-du: mipi-dsi: drop duplicate
> platform_set_drvdata() call
>=20
> Hi John,
>=20
> Thanks for the patch.
>=20
> > -----Original Message-----
> > From: John Madieu <john.madieu.xa@bp.renesas.com>
> > Sent: 25 April 2026 03:29
> > Subject: [PATCH] drm: renesas: rz-du: mipi-dsi: drop duplicate
> > platform_set_drvdata() call
> >
> > rzg2l_mipi_dsi_probe() calls platform_set_drvdata() twice with the
> > same
> > arguments: once right after devm_drm_bridge_alloc() succeeds and again
> > after the reset controllers have been acquired. The second call is
> redundant; remove it.
> >
> > No functional change.
> >
> > Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> > ---
> >  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > b/drivers/gpu/drm/renesas/rz- du/rzg2l_mipi_dsi.c index
> > 0b4861824319..b8527661a409 100644
> > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > @@ -1441,8 +1441,6 @@ static int rzg2l_mipi_dsi_probe(struct
> platform_device *pdev)
> >  		return dev_err_probe(dsi->dev, PTR_ERR(dsi->prstc),
> >  				     "failed to get prst\n");
> >
> > -	platform_set_drvdata(pdev, dsi);
> > -
>=20
> Keep this one here and drop the earlier one as pm_runtime_resume is the
> first user of drvdata.
>=20

Got it. I'll post a v2 with the appropriate change.

Regards,
John


