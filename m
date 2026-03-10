Return-Path: <linux-renesas-soc+bounces-29117-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBm3JwnZr2kLdAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29117-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 09:40:41 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D97C24770E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 09:40:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B6D6A301DB96
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 08:40:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B22B442B729;
	Tue, 10 Mar 2026 08:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="eQ2iiqRd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011047.outbound.protection.outlook.com [40.107.74.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5F942EEA4
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Mar 2026 08:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773132038; cv=fail; b=cm1cHJHkoTIDJ7PaRaLW8ArYnohaXWBNpk1xUoCsbPK9z6T+AYt4BANABxXFa7KWrcg4xhXJKkznry7zpf57JHHIG0Ona51+JAPFHUOAMjMyhE+8IHZGpdnKLIDrPMjzbaG8aUxiEq7godIRu+gJ4lmJPXsdVjJ2ypvnjpp1dnM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773132038; c=relaxed/simple;
	bh=o3yjZal8CRHK6MzK2Zyej1MKH8fpfEBFUFauj9ZpLL4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DX1J+DkS7x0PQrlhehh0vFYG4ergO/4wz5UKvbQKfJ1Vzdo8hrPb/KFgyEN2/3f8RECs1h8neGgcCuMbBEKi1nVVLrnqRyJhD/gCMG/D04jYaOgxHHld92C7FMY7kzlex/WdmAbSDGuIKqLzoZ4OV8EGR9/HG0+8nwaALVxOkpo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=eQ2iiqRd; arc=fail smtp.client-ip=40.107.74.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PtONFQNkmCiKpEtWc4orBd2UsxdQ3lVMsL9/xn39pLQgEeHkLZjjvR9e+mmZF572r6ED7Iv1r4AcJ3IsawjsmyQJV+/e8TDw+IVFVwZ2d3BLghpO0/mCWB7uK58zqBobQM00b7EeWvb5oeOJdAlYU5yC7h74mKtJwjI/xK1PYN3YTgq9kUYmgksrmFR/RXYkGL44WCBY6rsCf5czBk/9nRCu+dzlSAaOvnIFKhiurVAQi3jCAVRlO/iWhNolG3tf2mFHcfBJWwHnFRuTHjzWC1I+UTtFF+/ZSymW7HgMlWWTyXSXppnK1D3MF21bYQ0jDW+XvsGyp4/h/ghV9nWHUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qm7NZckmxbrCZpcYiQ2Qd/8WgEQrw7G0GIgeJsn2RNo=;
 b=EJKSYJlxbVQwJF/YgM80x/MsHtiTVha8iWWoH9H+peV+y+0T9QYjTyuRXH/eig52lJ8yDa0oHValsbUcbPwZjve29hXFov+4Mivti/KbXplZ8lcaFUfaEFQS/knQw6ibhg47vKadt4ydHanGQcZdmdgSrQ1y72qaZFpWxbJF2zj5qaCNa94iiCebZnfhvN8J4pPhGnzSmvYDv7z1caULJzp/Iwyal9lINXbZuaYsDX/lRnOEWpusLVdN6sKIBIVmpOse7OcSMsbnqnNmjU/c+IBYLVPcBVG4+7Z/rqwoifqFSAcViWJ4sTaWkFnwnW9Y6HtUBp2eLyelqs4ey/34fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qm7NZckmxbrCZpcYiQ2Qd/8WgEQrw7G0GIgeJsn2RNo=;
 b=eQ2iiqRdCAhqRJvXD1lc4voIHKg9hEG5CSlOjbJ98TElpytxRj/Q4eorCuv00edA9TgL6nKTxSci2hftIiJ1NaFHvTTf99NtFhk8udaz5ie5VHsWze/NRGIfPVCBGcVDCTEuPQOmz66XhkWd0sWGHIQjGwFKILSnw7c/bVDwvhk=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB9899.jpnprd01.prod.outlook.com (2603:1096:604:1ef::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Tue, 10 Mar
 2026 08:40:24 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9678.024; Tue, 10 Mar 2026
 08:40:24 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Chris
 Brandt <Chris.Brandt@renesas.com>, Chris Brandt <Chris.Brandt@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Hien Huynh
	<hien.huynh.px@renesas.com>, Hugo Villeneuve <hugo@hugovil.com>
Subject: RE: [PATCH v7] drm: renesas: rz-du: mipi_dsi: Set DSI divider
Thread-Topic: [PATCH v7] drm: renesas: rz-du: mipi_dsi: Set DSI divider
Thread-Index: AQHcp4u/eZzblQs3SEG9Nd1aSbBwPLWbGdAQgAxo2AA=
Date: Tue, 10 Mar 2026 08:40:24 +0000
Message-ID:
 <TY3PR01MB11346DFF8DB3E27FDA9467E1B8646A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260227015216.2721504-1-chris.brandt@renesas.com>
 <TY3PR01MB11346E1B951F1EEB5474E2005867EA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TY3PR01MB11346E1B951F1EEB5474E2005867EA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB9899:EE_
x-ms-office365-filtering-correlation-id: 39314290-eef7-4e9e-d130-08de7e80ac1e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 VKzvevA8E8ggib8gWYrHPPuXhKr9aM6xT9YfX/+p425LmCumcC8eY+hxJENXn9CEGpLwjA1NcWyg7tgDgqpy5VuanrXXYY5SgsgS1or7sQVtME5hnuZNgrRjWvrBCpqmtBi6uloZuwjyEcYAk/RZ1ADytQ6SH8JrFpk7TRYyNQrsZbz8PYVFnZw/emc/kzZjcNlrKXINiZWPJcHwfZJfUGkyT2hwqIGLwMjlyN6ishn4lk6UDmi3X7lgNfivsqnekpGr4bwZcNRb3oY8j9DK83dlgG/rHkxnnyhmWcupFgoMlDljHFFM+UBix9RT2I4BteZ6yTfhgstsOkOBqM70pVaoiwsqxq8en0SQ1aXeMJgfT4mdrPQhZfP8n80dckC/tx2b1h84h78HGXwnBxgaF1tzmin8KrL09lxKMdM69fFcEy+EZPhUcY9YNnpAnusduapv7rujm9T5JTCX6WKe2g4alUlh7ZHIh64fy2gI+ADmhIjvoV/ldbVrPaHZZEqyb1Xnc7HW6+G6KBK/9vsJ4nGYjeLlnaB2FYc+w0Nr/Gkotq63PQhME4fzZUxvVe8vjM/npCfBZG3oX3c77ZIPDKZVpr+AgFBrfolh3wTZxqF/Qred6Rfdgkb33O+wlVGgEtPkzHxzg5yWH1RE9i1uTTrR62MMMkUNPp2yISc1Thi16tft3V7xycfOykP3blMiwFP95yrnBvrcwmLLUKKSZWjynXjEasXKYpYoJXCC/g0SXUBKu4ChvhxOEqP9K4t8poJ39pin0B7jtw7Drg8xlCAuFmXfNNfuazFRDgpxlJM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?GA4S2o6/k8CQuZfqJDo8ow7YAq8iKbYe0fsyyob/41j6iOpsVBw/DqNpcKi6?=
 =?us-ascii?Q?Naa46JijFOOPMmaaXPa6qgLcy6mymGGfkX/r2vowfiPZFsC2SVcXtTVziMOR?=
 =?us-ascii?Q?bya+SUajBUknvYOjm2SrQSaV/ohua6vQqrsxhKSoq6UJmzlXQqXwicv72Iy9?=
 =?us-ascii?Q?qGvnTJTxqZ45KzHZvWpBfLfUuI376gvkC1sWUnYosjYfjKoIMbXpvzJTZbQy?=
 =?us-ascii?Q?2YJo5hhpQzC0MzFBNugiS9J1trLbBYCsVq4F6OYLjkQ9hSrdJsljHDTc9UbA?=
 =?us-ascii?Q?jQWjDfI4d0EehbmsTUiYpr4RpOsn/M0J6kRnCc9uzLihhjxuu7rkvFrBaJRn?=
 =?us-ascii?Q?1DhZOkyXL3Hs0mhFiFw3/HMb557kvuEupzoEIpoyL0vpnxyD7BzOPegmfhoa?=
 =?us-ascii?Q?lYjoGeebaxIFVEgwZ++CJNiPpw3xLvSfXHMNB8lTd5z3nyq62zBGNaQqrB3k?=
 =?us-ascii?Q?iOr9I8b0/WqunkEiYKs5KUKxJxOaNIbyQWVf+4y6tfm9mY5Cq2R6B9UXzeW+?=
 =?us-ascii?Q?Ua4fbfJUMLiOhtSqWFRgz+yjL8fzfOU/9r6+ZwDnHzk/wSeoEPTf5wPAzdjD?=
 =?us-ascii?Q?oqMGfKvfOtsmWgBdGP8GpOX1HzRdHYGwkq68tRxK2mF7cYfx+jSrjULUMhOO?=
 =?us-ascii?Q?cqKEJxRzHyJFythQ8eKvQfSDa3gUW1ctk0Cd39NU2PgZKSnyPMJA01HJvxLA?=
 =?us-ascii?Q?E6qtPvXELXPO2T3+H9aiUyrrdCGIqXO7S0x9+xSOm2GkuRrYho9vSHXRv0fm?=
 =?us-ascii?Q?I/URlWjnkNmNMiW1Upl91FARu7S3T0IgvgXDpIAqkrPMRqeIeJuIhesXfx5A?=
 =?us-ascii?Q?+J6uXRmz14Ryl+lurlb/QoSbUA0vAqx0SWacF7XDunyCUTCIit/9WTIZzMCH?=
 =?us-ascii?Q?h+i9KsRUmg37gaBO/dzgXb3relKR3EaltpGX18rwX2C5+dxn071oijxPXJGM?=
 =?us-ascii?Q?qP7iG0IokSWYQWP7z7v3EF3q/tHGFRdaQQshE0FahFJQ/6jk+MFxSXfKUKDk?=
 =?us-ascii?Q?iXOJQ8bII2cwDCErw6GIQSlY+X+QISaLugJHhiwIwDbIMBDJ5NPG24HYuTv5?=
 =?us-ascii?Q?t/YT3jd4wzh16Ed/1rG/HKbR3T2sl/kdHOhelxEozN0/wXGG9qKYPnN9TyCW?=
 =?us-ascii?Q?Ymy2ZqgKcAR5BsUKUhdAOZtBJaWtlIrQ25mhHEaGZPO/xn93RlVLO35NeBQy?=
 =?us-ascii?Q?OEt/aq0jRCV6ZRv+4ol0hOUZtAkzTAHs26FiDp58cuuGN1n39HMoLiy74wWd?=
 =?us-ascii?Q?HHqp+ABlqzKp8ZXffPu4M9pvNYJgjtG0Z6vefsQpsMdnS6a0aeRnwzjuJDQ3?=
 =?us-ascii?Q?mJlukFulf03y6vbQdBB/KpYm+yD6SkhDABgRQjV01aTl53inbCX2Yx3sPU5n?=
 =?us-ascii?Q?Z2VYaBhJwaF3G+gUE+n7yJil9dO/9QvUANNDbH4063cUJ0l5p09K9pQaVTZg?=
 =?us-ascii?Q?iGrUPVOA05EIHV7PHTVbwCvrlpVWH9qiy8GKvPW6sUxenXBlSPnEBRGcAe+t?=
 =?us-ascii?Q?hpZGXanYQFw3u2p8bBhTvwUEm9dO2I/lxyHkfPcfB35aBlEJeWhpIrQ8tB9M?=
 =?us-ascii?Q?NLgfnLvaZtTfiQb9UIG9/ATeh4pPSkWkMw09Fwi9risLBZkqomT8Y8BIG1B5?=
 =?us-ascii?Q?48JrBJMw5kl4pWGlUsawSxhrywj6Fxz/7GnZgQVXGnVBpg0221C41GlEuZRS?=
 =?us-ascii?Q?fmWwDPLe8YSxVj/x7wo7UdZCBlVTAc4D9l0I1/HXkDUnmxwMdbp0JmM0Ydae?=
 =?us-ascii?Q?MHjUKtJWDA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 39314290-eef7-4e9e-d130-08de7e80ac1e
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2026 08:40:24.1333
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1Ltf/MClfwqTqS7nH7YpBf7cdun0mql5IqA0XIo05BUfMuxsPAL0fjgcjzWqNMkrY31qjI9j97dBHzXA/iMY45vh0jMjEDLcG1ajEkBYkNw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9899
X-Rspamd-Queue-Id: 4D97C24770E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29117-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hi All,

This patch is now present in drm-fixes, linux-next and linux 7.0-rc3. But i=
t is not present in drm-misc-next.
I see it is tagged as drm-misc-fixes-2026-03-05.

I am not sure about the process for merging a patch in drm-fixes to drm-mis=
c-next?

Please let me know.


Cheers,
Biju



> -----Original Message-----
> From: Biju Das
> Sent: 02 March 2026 11:07
> Subject: RE: [PATCH v7] drm: renesas: rz-du: mipi_dsi: Set DSI divider
>=20
> Hi,
>=20
> > -----Original Message-----
> > From: Chris Brandt <chris.brandt@renesas.com>
> > Sent: 27 February 2026 01:52
> > Subject: [PATCH v7] drm: renesas: rz-du: mipi_dsi: Set DSI divider
> >
> > Before the MIPI DSI clock source can be configured, the target divide r=
atio needs to be set.
> >
> > Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Tested-by: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> Thanks, applied to drm-misc-fixes after adding fixes tag.
>=20
> Cheers,
> Biju
> >
> > ---
> > v1->v2:
> > - Add spaces around '/' in comments
> > - Add target argument in new API
> >
> > v2->v3:
> > - Add missing period in comment (Hugo)
> > - Changed '1' to 'PLL5_TARGET_DSI' (Hugo)
> > - Added Reviewed-by and Tested-by (Biju)
> >
> > v3->v4:
> > - Fixed up the comments
> > - Fixed the match for the divider to set (was missing a * 2)
> >
> > v4->v5:
> > - Rename patch title (Hugo)
> > - Add bpp varable for easy reuse (Hugo)
> >
> > v5->v6:
> > - Remove clock diagram that was wrong (Chris)
> >
> > v6->v7:
> > - Rebase to v7.0-rc1
> > ---
> >  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 16 +++++++++++++++-
> >  1 file changed, 15 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > b/drivers/gpu/drm/renesas/rz- du/rzg2l_mipi_dsi.c index
> > f74a0aa85ba8..29f2b7d24fe5 100644
> > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > @@ -1122,6 +1122,7 @@ static int rzg2l_mipi_dsi_host_attach(struct mipi=
_dsi_host *host,
> >  				      struct mipi_dsi_device *device)  {
> >  	struct rzg2l_mipi_dsi *dsi =3D host_to_rzg2l_mipi_dsi(host);
> > +	int bpp;
> >  	int ret;
> >
> >  	if (device->lanes > dsi->num_data_lanes) { @@ -1131,7 +1132,8 @@
> > static int rzg2l_mipi_dsi_host_attach(struct mipi_dsi_host *host,
> >  		return -EINVAL;
> >  	}
> >
> > -	switch (mipi_dsi_pixel_format_to_bpp(device->format)) {
> > +	bpp =3D mipi_dsi_pixel_format_to_bpp(device->format);
> > +	switch (bpp) {
> >  	case 24:
> >  		break;
> >  	case 18:
> > @@ -1162,6 +1164,18 @@ static int rzg2l_mipi_dsi_host_attach(struct
> > mipi_dsi_host *host,
> >
> >  	drm_bridge_add(&dsi->bridge);
> >
> > +	/*
> > +	 * Report the required division ratio setting for the MIPI clock divi=
ders.
> > +	 *
> > +	 * vclk * bpp =3D hsclk * 8 * num_lanes
> > +	 *
> > +	 * vclk * DSI_AB_divider =3D hsclk * 16
> > +	 *
> > +	 *   which simplifies to...
> > +	 * DSI_AB_divider =3D bpp * 2 / num_lanes
> > +	 */
> > +	rzg2l_cpg_dsi_div_set_divider(bpp * 2 / dsi->lanes,
> > +PLL5_TARGET_DSI);
> > +
> >  	return 0;
> >  }
> >
> > --
> > 2.52.0


