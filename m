Return-Path: <linux-renesas-soc+bounces-32110-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFfWLrbl+mnZTwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32110-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 08:54:46 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC104D6DBE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 08:54:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 73EC63054BB1
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 May 2026 06:53:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E310C30B50C;
	Wed,  6 May 2026 06:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="bA2sUXxp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011059.outbound.protection.outlook.com [52.101.125.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E678B35A395
	for <linux-renesas-soc@vger.kernel.org>; Wed,  6 May 2026 06:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778050382; cv=fail; b=nBUnx7CxJEDBczgLfy5xpFQ+5Xu2wsihcD8oVzr+TUpevtnZ++yMN783Srv21dB7yFWVKWES2GcBSFbQBlt95TWKcrM8UAfSff2YkYchRlHRTTNvOyLTeyEwAu7Bh08h7T0OhOf0tPepChpfSUrjwa/fEqrNcJLg1Yt+pMrW6Fc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778050382; c=relaxed/simple;
	bh=z1j1FX6jzUymXb5PC2NZoqvuRUVilJyu46kyUvTVtxU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZXwPT6WO/V5f0cijH0QfSfR+CtkNssu0E963IJoFu8E356lDgU//bMx8/nJG7PElLhYRc79PGZ8wT6P2oDxUhODGYQyczMauz72pX9g7IXMWxuwpvuVAlRsuoEwtrFV64ym+p3K4Ih3iyAC6Xn2SPk4rXlFkJ71Ce/7OgT7FJlc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=bA2sUXxp; arc=fail smtp.client-ip=52.101.125.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I/KYw0xS5UuihKZX1x+3kRriTHQv0K2u58aQM55ifz+jz/TtO0ZqTgXHPzLQKpC2DaqlGiptOaYACOz2er03etTzfk2fT47N4AXKGM9zS828RQv0jL3n3ovhE2cbt7NaY45zyOhk2C9l6kPAWgP01OMIUI2HTyUo68H0lwCmKxgBlxzwecBWu6+HbKKlpRdV8jAq54cdoBq5sMko4B8KOgzvnqM8zuf2GCxuypNklpuD3jY481N4BsYfaAGwHFiMhnXaK2iaWUWoxMyLdnkTwk+JEjqw7YzeHYFQCtYs5kp5LTN9N0pajb0PS9tmqNN3yh3J2bcH/ZzGHrkpIZDvbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=srP8wa0gUPWjP0Hq91XhtktD3e5ZbtgRnligA7OGfCE=;
 b=vlmhfYSgTbJv/wo8hnn28w63EoJ5FGlf1cLCDr+mxaTOozx+1ZB18ZuMKolU4yjj8uctbhgZhcasD8OcyvBOEdOaU1HIkDUaNb/BMTFO8onBDEv+xOKECdUelFyFuMAjkIew3HQOPXn5Jmo24WszbT2El6ONS9nyyBvvxsmIwUYrq3y1Dhm/ExICJJJbfhrFfHb6wnGJ//LSKr9pD+i/sh02X7jGjTrwX5dH/Aoc4hIKBSDB6yychYs/ABGUm+agv27b/UeZXvXGTXOTSJmblLsiurVB98KtpHcCCAIyhxX+T7zIb+3dGolZaX/7LIxVx7RZbqIW9u/T+tg6qOaRmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=srP8wa0gUPWjP0Hq91XhtktD3e5ZbtgRnligA7OGfCE=;
 b=bA2sUXxpEef9gcHmf9j36hBRnycuBa7PvV2Nt0+s9T3HCanZbgO677yO6UVZa+aXeqQUUpJrJ/1tr4q+BzImz6LVLJWE9fpAEaRFvCBm3x7H4VO7NjN5Fb++77qEsNZVFfPbxp1V3rjapGuscPz54gJ5Vu5BcrpFswMKwk8Q1i4=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY1PR01MB10770.jpnprd01.prod.outlook.com (2603:1096:400:322::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 06:52:57 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 06:52:57 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Chris Brandt <Chris.Brandt@renesas.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Pavel Machek <pavel@nabladev.com>, Hugo
 Villeneuve <hugo@hugovil.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Chris
 Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH v3] drm: renesas: rz-du: mipi_dsi: Fix return path on
 error
Thread-Topic: [PATCH v3] drm: renesas: rz-du: mipi_dsi: Fix return path on
 error
Thread-Index: AQHc2W2TTIrWeR4yPUGR9MdE6jr/hbYAlk0w
Date: Wed, 6 May 2026 06:52:57 +0000
Message-ID:
 <TY3PR01MB11346E60A2A2C2233ECF49F93863F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260501132135.196701-1-chris.brandt@renesas.com>
In-Reply-To: <20260501132135.196701-1-chris.brandt@renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY1PR01MB10770:EE_
x-ms-office365-filtering-correlation-id: 24bc14fa-e4b9-4b90-2ee8-08deab3c1af2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003|38070700021;
x-microsoft-antispam-message-info:
 BVBJkUcpSEs2HqcZ7rpKazwZnYIOvGf0ob5O+2cnwUmOzsrm0EZjRJJfadFJLd6DyLekOJStsW3EwMcEuiZWk9w+HdFspFOWbiw+Tn3FOcq1PTJChlGnNx2nn0moE3Z9larw1LFwt7qFtERuIr2pVniPaeGi5d1/IWjUq+nYjxyLwm7qS4sFw5Rb0j+03L6bNvbua6IxIINZkxbuRg6+yoMkYKq7FkXP4yw7fXeB8PWfjTlVdBugG1rdQKnUpIxMG0E+uxdjwSBQ3GEw21UM9mJvMODWoVNFcRf47fr/GrDNglueyCF6RppXI26PJ5PTaEOR/l4uRUVtHys4wdv6gkAeZZVd36yKNj1qtfGKlK8ofgldLapbFaj8xogW1Xp6FYZ0kbSgXZyKhp4SJtIa5OepCRkY8NPW6Mr7b87Ot15u7g6rdvsLYO77M+hvReiZiY9lHEJoyoI8cpYG4kAI9HW54uvoDToJi9lBafuTyTvZ806XQzlyHWcFpsNjnGO12m/z6vqR5AGkl1xuI58HsEvPeteM0Flj5oLyAGrw5joI/Itraa564JNvA0CTIisc3oibiUCYmmS1XMto24SsMF4ayJv5T1Ze27bECWyAI36TdrVwfZiAHiqtP0T16ubmM7e1ph/zs9IhJTM6X7JPOf/8qeFBc1votL9nHjkIDeoqsiDTeqb+D8qX2V8rKUQNqLEtWMIYrhGGuCcKWYlMbBtxQiJcu7iOKS61o05YNLfdNwzqap0AoO+LjrJw5Y6X
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?6vBkJBHlvArKkcfz0d6i/olRvMoawHI49AxAM9t1ZX1JB+2Dl2293qeCAsAT?=
 =?us-ascii?Q?0fDVZDGNinb8vSeFkN8vBeRtbwWj6UJhQHIMYGaSFOrgSybRoIPyWD+K17zh?=
 =?us-ascii?Q?Yc7M6g6GZRE00HlHDRKkjL6hL+Hqq7TrGceOMboTTXv7iKT2svSR/qCCI2PA?=
 =?us-ascii?Q?8G995bxGd1kTZN6vmInUKxXrh/0FMAxda1G1M5m2IQtb8SEBRVUIuHih27Nt?=
 =?us-ascii?Q?h3cnYLA9+nxlbgn2u+VoXkrLS9G0hKJ0NSUn9OjHVQkekXvrRxTNPlnuayQJ?=
 =?us-ascii?Q?XbZiz4Y0UKjb8IBz1VxWKs8f/VL7m+HZdvSod4roU7C+MMkbhQ6GXX+nO8gG?=
 =?us-ascii?Q?JvJ6DFy4DPVGXcZ6UC+R6NAkX5323w3kQ+NDolTelnYoDzjD+btOqQE84M+l?=
 =?us-ascii?Q?HPX2lqk88N5vB3EdzN3+fNlDRgDhIcAGEnTNZfYMOzl586A5jxqaUujTtImJ?=
 =?us-ascii?Q?oqCvvY5jAwjeXR86I6thRHDfigiipzIYLesbRxCkGQmLYQJs7qMkVkzHwHoZ?=
 =?us-ascii?Q?NoIx6fOh7EeSnwpp+R2fk/mtv+sUubJqlo9CyWwFyTIe7BFV8Z3ey1JosGOv?=
 =?us-ascii?Q?6wr+6FVDtwHdRCDVIxXAvlh3yCROZ+mA6zFFppoGWmxCbrDqjBzrKldkuPUO?=
 =?us-ascii?Q?As/wvbIxzrm67d4PxDsdz98rge8uvSRo1mkkYG8H9skPNwqxcTFi1xqVFbFZ?=
 =?us-ascii?Q?vlGWgqEWX2NKQ3NPVoJWqCRcV2+PUOKBiYnAUaCGaET7qvA++1Wd2miK2O9w?=
 =?us-ascii?Q?UPxW8VW2jTZa5psJ/TNsb+/Sw/snWgoAfZz1tNhsns+sqRCzUs2g9GAAosJ2?=
 =?us-ascii?Q?UjhEVRBc6zC4OaCtgb3nlxhe+l+vqDUPBLlYJSyaqQxtFlpiNlJIK8bd6uSX?=
 =?us-ascii?Q?JsWJK+elFssjzpKz4rPIe5LcQZOhkJdEHsJul9exTS1RbBW/h8Ymgqy685gQ?=
 =?us-ascii?Q?YODSJ09Zm6dJe1le9ySEwzXXx6pAGlzZEpj4x10P2bcaeOzkqDz3nzbkZQjT?=
 =?us-ascii?Q?AYE4Uqfkf913Fw6ex6QY84iOY1/cDqrAFLlK5xEoDP1spno83ZRxqTY1uDN+?=
 =?us-ascii?Q?JvQMQ1QPVtfe5PmZa7+vh6JW56Mf+yq4n+3ZhGsMIIkAw+fyAf68aNnOBjEB?=
 =?us-ascii?Q?s9ws21NWyvLOYIeFkVmMNczdJ4udjKvBBK2EfOVzGfmXQQdLTdNajIfNYbz1?=
 =?us-ascii?Q?MARrawMCB++kxCD6GDTbxEJiR89UuJsWCh1eLjw0ekU5ckUTUezUfTKFj363?=
 =?us-ascii?Q?STH5e9cjQKLz0Vq6sb1jzt1lHC/HE/joy8hgZ5pGncXF/1We0/TqL2cTPR8G?=
 =?us-ascii?Q?ZRzM059kY5XtMXK5nw+EGrhazHMPaGB1CPsAQHEbtO3WplMfLLCou0nfCJXE?=
 =?us-ascii?Q?2G3wlyiWxsK71o1GZpv3acy3EMMtE9j09Wmb1VOLyEduYQKzOB27ZBxxoyLk?=
 =?us-ascii?Q?EuUiqvBRLyvcYct2jrnbGDwQzLQrPoA2U9q8+4O2A4XeZCgdSthuCm7cVqCl?=
 =?us-ascii?Q?njVo0AHbQpGzptoC61e2ie8oQL5nLaB1+K0eW7uLrOZ1i2uhkXCqBrbExLY8?=
 =?us-ascii?Q?6mEWvBJLDM8IHOCeVUT23q1TPnqDP9h6wSJ/PCDWJUi7kHghUD6yw7B0Xunw?=
 =?us-ascii?Q?IpQS2X94WUysIck7jEQGDf1opMh+IasaI6fx49FlzSDVuJczzNlPpvGCogRt?=
 =?us-ascii?Q?1WSblJmUaIubBPvLqAP9FAOsPQ3S7hSD+NSI7mwL1wNScagamJqV8nc09Hc/?=
 =?us-ascii?Q?y1YohSXDIg=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 24bc14fa-e4b9-4b90-2ee8-08deab3c1af2
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2026 06:52:57.1474
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9hZLz7J0T0dPRtxBkznr9KUmYDrzXRk74HEmCWKl3Ou4jg/KDXWYpdr+Df+bV5Mauc1s/Q38V1TMvKMH5zWK3LtMFURCQmIT2WqHYhvq2ZA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB10770
X-Rspamd-Queue-Id: 2EC104D6DBE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-32110-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,nabladev.com,hugovil.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:dkim,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid]


> From: Chris Brandt <chris.brandt@renesas.com>
> Sent: 01 May 2026 14:22
> Subject: [PATCH v3] drm: renesas: rz-du: mipi_dsi: Fix return path on err=
or
>=20
> In case of error, we should unwind correctly.
> Switching to using dmam_ instead of dma_ and moving the code earlier fixe=
s the issue.
>=20
> Fixes: 6f392f371650 ("drm: renesas: rz-du: Implement MIPI DSI host transf=
ers")
> Suggested-by: Pavel Machek <pavel@nabladev.com>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>


Applied to drm-misc-next.=20

Thanks,
Biju


>=20
> ---
> V2->V3:
>  - Removed Acked-by because it was for V1 (Hugo)
>  - Added Reviewed-by (Biju)
>=20
> V1->V2:
>  - Need to take into account mipi_dsi_host_register was already called (G=
eert)
>  - Switch to using dmam_alloc_coherent to automate unwinding (Chris)
>  - Added Acked-by (hugo)
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu=
/drm/renesas/rz-
> du/rzg2l_mipi_dsi.c
> index 29f2b7d24fe5..b908e702b607 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -1442,6 +1442,11 @@ static int rzg2l_mipi_dsi_probe(struct platform_de=
vice *pdev)
>  		return dev_err_probe(dsi->dev, PTR_ERR(dsi->prstc),
>  				     "failed to get prst\n");
>=20
> +	dsi->dcs_buf_virt =3D dmam_alloc_coherent(dsi->dev, RZG2L_DCS_BUF_SIZE,
> +						&dsi->dcs_buf_phys, GFP_KERNEL);
> +	if (!dsi->dcs_buf_virt)
> +		return -ENOMEM;
> +
>  	platform_set_drvdata(pdev, dsi);
>=20
>  	pm_runtime_enable(dsi->dev);
> @@ -1474,11 +1479,6 @@ static int rzg2l_mipi_dsi_probe(struct platform_de=
vice *pdev)
>  	if (ret < 0)
>  		goto err_pm_disable;
>=20
> -	dsi->dcs_buf_virt =3D dma_alloc_coherent(dsi->host.dev, RZG2L_DCS_BUF_S=
IZE,
> -					       &dsi->dcs_buf_phys, GFP_KERNEL);
> -	if (!dsi->dcs_buf_virt)
> -		return -ENOMEM;
> -
>  	return 0;
>=20
>  err_phy:
> @@ -1493,8 +1493,6 @@ static void rzg2l_mipi_dsi_remove(struct platform_d=
evice *pdev)  {
>  	struct rzg2l_mipi_dsi *dsi =3D platform_get_drvdata(pdev);
>=20
> -	dma_free_coherent(dsi->host.dev, RZG2L_DCS_BUF_SIZE, dsi->dcs_buf_virt,
> -			  dsi->dcs_buf_phys);
>  	mipi_dsi_host_unregister(&dsi->host);
>  	pm_runtime_disable(&pdev->dev);
>  }
> --
> 2.52.0


