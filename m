Return-Path: <linux-renesas-soc+bounces-28950-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0I/cHUbRqmn3XQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28950-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 14:06:14 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C8508221576
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 14:06:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E6C723003320
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Mar 2026 13:00:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB1312DD5F6;
	Fri,  6 Mar 2026 13:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="n1He0NyY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011016.outbound.protection.outlook.com [40.107.74.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36E42DA757
	for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Mar 2026 13:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772802037; cv=fail; b=e0SvKkMkA6JwyQHS20E4DOMvJauWy4ob0VPpAptmsJyKdWpBBm0OKEaNBIlMKUKZxFY8oGgeYrLexCcrRuMC8FS9zDF93J3SAC63CyRyeYqUbNXcGKiSrk09aofcqzbjdCLz9OMgWTREM1Zi3g9ESbeBxfjobTRc1Sz+n+u/CuQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772802037; c=relaxed/simple;
	bh=5qJM39r39JLX8BDeUZeDx17UrEhVUTh2nsZpHz9UdNg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sNqnL0dTvy1uaCWrSuuD2jrq9kuaOSdHzPZr6NKFm4FxlvA/ntZVOrT0D2GqfXiKarCSw2rQoHsHVEhMvW+CHA3mwir12oypNPc7W3LrMocK2L4qwRVmFubf4m/TX/DGmrQuoyFrJaVILER6AtkSUNE5R/bs8fJamXFs8lnbMWk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=n1He0NyY; arc=fail smtp.client-ip=40.107.74.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PijfBQuSCU1Ef9um2FHKmn03A4LNcDE6+jIE2iEyzTyAnhfim1ZLw3Vckfuhsrv+LBFyZ4s6TGtbcszlrGXMtSYM61zWG4ObkPp5kxyfRFm7SjGch6/SwO91Glzky5jaPJjPKWlUoAdmKhKxO18ea6P/F6+KuNCp+YIhaLV38OKgtOttrzVqVEwkjvzh9FvBvk/AaGsOX5itC2vebxFyOKzZ3qDHDBVymeHSl6H/hCpi4FsO+WJTKq4g1irt9UMQ9X+Dtvl6SGZeih0Lo/6s4klUB/wwBUFgkGE6CZwLmPANQghG6k73/VXKsUS2bw7GUczkYOBCG5vMKq97mqaLIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EG/ZUwnVjZ1AmFMHPZOCEHkfhLQzjzDNo3VNS/oAUKA=;
 b=OUZTNSi+Chx0f2oVFipiTllTdv8sTR+BAWBAwEgFMffI1t7E0sjUTSI8/7EzEIEwvSFOwZyrNGlLu5YhQ1z2SDDi7fRM8Y5aszGZ3sfnvmonDsnR6HfaX/QgRHM2Gv3MM+iSTmtn9Ql0dMHEiy1MaQ7xZiL5q6MXhVw99uler9WXMry0wQEJAWrSji1eGUVADFjFjVaUORrw6ulyXh3CD6aOIYG0Pe1XCURONbcNQSXkf7hmt5Uz4FWHPLdWECZGOdyRlkc+l8rC9r2maSe6AFwaAd/hGJhelUtNGtlHH2V8Yck1OUgwEvaiSqqnbcX34x2plv+itEWpLizHjKD2Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EG/ZUwnVjZ1AmFMHPZOCEHkfhLQzjzDNo3VNS/oAUKA=;
 b=n1He0NyYmYdE3Jn+G0cDp/Cth3bvTm4/fXbOIwI/jC/BtPvZ6HS3lmWdHwL2tibgU31QbXt0ttWyKs3UrUUH3XUJAWncO+TSL1Kq1ZY/IQPdDQy1ZPUtiTHiG2Z+e2E69hD3gso9rLTYW09psc2tncVKM7F/e3mxnCRNCQaJhlo=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB10104.jpnprd01.prod.outlook.com (2603:1096:604:1e5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.19; Fri, 6 Mar
 2026 13:00:32 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 13:00:31 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] drm: renesas: rz-du: mipi_dsi: Convert to FIELD_MODIFY()
Thread-Topic: [PATCH] drm: renesas: rz-du: mipi_dsi: Convert to FIELD_MODIFY()
Thread-Index: AQHcrIizZEg6kWXm70WOPq6jFSwKM7WheOMw
Date: Fri, 6 Mar 2026 13:00:31 +0000
Message-ID:
 <TY3PR01MB11346954FB0F91C78E5473ACD867AA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References:
 <da7709d50894d422442401e6e3ff4c4715a33fa5.1772705564.git.geert+renesas@glider.be>
In-Reply-To:
 <da7709d50894d422442401e6e3ff4c4715a33fa5.1772705564.git.geert+renesas@glider.be>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB10104:EE_
x-ms-office365-filtering-correlation-id: 978bbd8d-04b9-438b-f266-08de7b80596b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 B9LqSitsS2rHzn5b0DR397bdlcspXy/TcxhV67PKghPUyHTb9R+6iNy2Z0MW3a8evDq92iqy6iZwKGaIbwHOr/FYgqYsKYV+Ic/qPhjk77h/D15RP8I9GPTyoPxL7Ir0Xmu3LPMltew3aXC/k4JSxx3sG4ViaeWzGP05lL0Y2ZnMREQRxezGPouVaQDMSKCG86FKA1WKcjaf6b/oFZ0rJJo7w8ZfVd7DcBXKSktEte/qBcW+NQPENKlpWuaQS2WlupwG6R3LpFZrEtSjkRSFWUxjpdk7vD6hQ8NDASch33NHSzPoU0A3Ld5vE6yUqtlKoV29fWFBCBxuaY0fmYv6RaH7fwZNB+fqpaj4e5Rr395NU9A1ljVKeEglgvngjBcrrAWAMnBTS5HBSGbliQtq0orlqWZeClyeJYD3q1MigZbI3vjNkGDv+348RymknsPy1IHKgtCmaw5n1Ah7PPMtuOpYLte1Sa+ytcQhqBWPA+2wpm9vEKZ7IZsPSmEErdYbSH9MH99MPJbguT+iBXuxT3XNjaXW7Q2e7ERimZV1Mm5I4RKQX30/xzJw4nGCjDp+EwtP+P2ozwI4dIMkRzP/3/j7nYE54B/rkEemZ3E3YttZthVX5gCzlVQsQI7YrNVIrk4cx2hQX1F+YCgT5KFbBECA4tEmOAAOCueiGaOJw83ohsyVZN1BoSBTK8UVdp5yTae0jCx+4TyY//TPPiqJQWy19VeV6Llh+W2pG2LxTntH9vWDog6kywn308wjLAKwT9e80YjCwtNIUfg6LTcdLL1p9++ClzQ/GwVhQ1c7JtQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?4hHNogKhsqauu/umIq4uSRxZNCIBRnD7a9NW9TdWzcVR+q8d0KDjau1eyAab?=
 =?us-ascii?Q?wZwxqpniFkuMxvltUSgGFZp5CmzbNvoE3I1/2wwjJzCKdUX+a+drYAdXr+Cw?=
 =?us-ascii?Q?YOxls909N7srBGeeHL2c8F0ueI7q+na//bh0TQlDyN836u7TZwkxNSU342mJ?=
 =?us-ascii?Q?gIBpwvX1InQMzPAicqwDAMp+66aQpix9uTvXyaGBQCqesqOUcbW9E+3sqjad?=
 =?us-ascii?Q?GHSfxj6A2laZhVhXeROVMlqHzRpe6H4OTDXcV/mxT9l+26e/HswVC5nXXy1v?=
 =?us-ascii?Q?FNmx37mLzX9q2ofkGHEMh22c4/6Q23hYUgFpp+f0GkSUPAzLC87c7eHzhbol?=
 =?us-ascii?Q?mQQpCpyE9k0jCUQndIIPqCX5eHT/YP0j3QbFMhCBKN0X9jX8qmSCr+QENZeT?=
 =?us-ascii?Q?0a8eeOnl1FOiwdM+krz9SlnpM75sAjy1E54tiwF4Buir359Jb9OK3XUoQiYh?=
 =?us-ascii?Q?RHW0K172h3iZYnPt5HRic7pIBRNmYmF9zE13t5dRGrLMFf0gg6ESd9bEiotI?=
 =?us-ascii?Q?Pj/SmmjnHdODBXxzyv2kbdA6BbwcANpvlfxcgCt3aLMNomi0Jn2dmvNpzbxc?=
 =?us-ascii?Q?wtoSfmRMZZda7GZZb3ugqaxN7DxaPmdRzVLnVdbXuNNWD+HGPb/z47T55vCo?=
 =?us-ascii?Q?fS3QmcRPWub+s25c//NC+mZ8p04NdkLinhmmcIvmDFFyI+LqxYV9481ZUNhn?=
 =?us-ascii?Q?qkFRRFrA30KsR7fwQ3nn2DKE92PSycheNJdwxDPunD3fFR5elnV03bTnZvjA?=
 =?us-ascii?Q?GeN975I9UQiqJcvhNpe7s4+nW6+9u88plE7nCi0ErG0+4dJYU/VdalC9ron5?=
 =?us-ascii?Q?LcZbcTVECmxJK/4w8AL6XMilC5SRycTUqCOJk7aRABnCjB/vc4fUyufDUdX7?=
 =?us-ascii?Q?aYJnFUOHvplBAgegDTQp2EcvrYt6qKa/nyoOyMEQMK4bodlPxdk38ykQDUIv?=
 =?us-ascii?Q?b50hY2mtYknA9KHaiqBzojB+K0wOSZyzJi7jf1SUST6Z1oUunoqla7exAVn3?=
 =?us-ascii?Q?E1ZmqvCSRZhyuM5vbNWU5NHRy8dT/NhQfUPhilnQaOimeYPz29TeK6ajZ8ym?=
 =?us-ascii?Q?n4ua5hnJRfkik2I37PtfBmCuwMYBptGNOrJuwHbpHRlL7mY7dSc0dy/KifGw?=
 =?us-ascii?Q?DOSLjh0Y5vkO2mOeyEGbBg9LMWLSmyaloO2F7pSrTt2/8sUh8YqRb4Oi+N1B?=
 =?us-ascii?Q?BOBHp31BLdGZeFoMH4iiuOr+XwgFHCreYv8GHmw9jpkJsWZD7Vmqo/kCQT/8?=
 =?us-ascii?Q?QbU3Gho/E4gR6iq8twYfMAqzry4goSlvgsVXNJzobS17PklKeUhX2iP06Qfc?=
 =?us-ascii?Q?RVmHh8jKP/tXqn4UHtWcJ411k6ypSaCC+SJXsr6ThiqzeLCPgd6K1grGbKYf?=
 =?us-ascii?Q?x4f8Bso4g94cdIBH+TtM94vYMOs+j6uGQS6nyNnmokPCp0pZftjQOUaW/MBy?=
 =?us-ascii?Q?v2EVMCKomyJ2Eha3Gin9mVxCjJ4m7YU0kVY5jXdZdDSI6FxYcCkTb8o4teG7?=
 =?us-ascii?Q?OnBdwxn0fA70S4VrAMOuRjeTW2dkrXn7DA9cSjy5SitzCEd/GdCcRgRJUnhR?=
 =?us-ascii?Q?3gElEo8Id46Hb3P+FC662opT72x7XW8RQWLnBRV/7QxRcT5MaWeUGePS6im6?=
 =?us-ascii?Q?3URR9/MAtP51CVxElZyCvBjIN8/FkN7I4P5ab1mteE7zikNBY1C0dyA35vp3?=
 =?us-ascii?Q?SPC6h6WDHnWA5UIlvxKGYY8+JcrAF9WYaAeP8sJ+tSeP8Rea6YhWZrRrCNYT?=
 =?us-ascii?Q?3qaEtZHbMQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 978bbd8d-04b9-438b-f266-08de7b80596b
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2026 13:00:31.8857
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b1A17KKYeQeNz8Tp18ss0PEt/CoHtjWzaOchB1Zols84w0I4T7IN4TI1B1BZcy7IJRIDwyP9/XpsESAsEVskK95ovP8FXOXbZPOB2ZeSW9I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10104
X-Rspamd-Queue-Id: C8508221576
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28950-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,bp.renesas.com:dkim,renesas.com:email,glider.be:email,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Action: no action

Hi Geert,

Thanks for the patch.

> -----Original Message-----
> From: Geert Uytterhoeven <geert+renesas@glider.be>
> Sent: 05 March 2026 10:13
> Subject: [PATCH] drm: renesas: rz-du: mipi_dsi: Convert to FIELD_MODIFY()
>=20
> Use the FIELD_MODIFY() helper instead of open-coding the same operation.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Cheers,
Biju

> ---
> No changes in generated code.
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu=
/drm/renesas/rz-
> du/rzg2l_mipi_dsi.c
> index 29f2b7d24fe59717..a87a301326c7aa43 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -808,8 +808,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_d=
si *dsi,
>  	 * commands payload not being saved to memory.
>  	 */
>  	dsisetr =3D rzg2l_mipi_dsi_link_read(dsi, DSISETR);
> -	dsisetr &=3D ~DSISETR_MRPSZ;
> -	dsisetr |=3D FIELD_PREP(DSISETR_MRPSZ, RZG2L_DCS_BUF_SIZE);
> +	FIELD_MODIFY(DSISETR_MRPSZ, &dsisetr, RZG2L_DCS_BUF_SIZE);
>  	rzg2l_mipi_dsi_link_write(dsi, DSISETR, dsisetr);
>=20
>  	return 0;
> --
> 2.43.0


