Return-Path: <linux-renesas-soc+bounces-31859-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLw8FfVh9Gn1AwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31859-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 01 May 2026 10:19:01 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FCC4AB10C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 01 May 2026 10:19:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6C65630300D1
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 May 2026 08:18:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6832336EF8;
	Fri,  1 May 2026 08:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ZiiEpBTt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011061.outbound.protection.outlook.com [52.101.125.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514EE285CAD;
	Fri,  1 May 2026 08:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777623519; cv=fail; b=TeKNEYeH7p4NRiNta4/tESz9xPJQumQNv7PRQAwCNLagXPbKSoCsmFK2Pt4ZYIiUNpG34Ln/2FU8EYKpMl7vUlVgk97cHxxfwPMgTT/yUV2+iK08rRJCWEDDtKXTOlWbRCSj/W9KtiJ7VXFzvy1/Kjj5XdsgCiPUw5SG9QiHLEs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777623519; c=relaxed/simple;
	bh=J7UY4lTNRwuOPpMjnTwQff/AFeWvqJmO3+/S9lDWWvk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TS1dWr9top/9B8DNs2ONaKRTWf2LBfpR/meLmv/taVRbHifw36gua1Qr7Nt30FrW5grNUvPXbexr5HR/pXx66ugyl5hkwAP3T9pJ0gGCLA8xqMjevTFSDJmaEwP6w69mh58ehdfA836iQnhM7k/7BT/AHKj3t8Dxuw0E8wbz/lQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ZiiEpBTt; arc=fail smtp.client-ip=52.101.125.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aI9nMDV7XHhdA56KuNZ7YGO4i+XYPnYv5q3rdKsLQJbpIMa3ARQbM8BtWFjk7Yx7W4nI4XJJrHncFzZ3sl+K6ris0mE/nDkgEuEwnIWCZ7qMrAZFgaezjqg1tpBnOaAARBlIIvlYUDYJLbcvyWLmdHWj5p3VAXynHqytte6R32q2YhPWjdyANztotPTZLGpf0P73YAsBW4peC31ghIa3HYizWhPGKE/TrgB21vUB7IO4HbGh6fiJkFX/ueKjFwlpFmhhl9wSsrTzohmRmdWbAumng39aZBWoMhjX+ozBOPRUEwOGV0RCxCfTgU9e6C/oR4f6JfEeqbI/D5r0SzDUGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cVRXqVbo1aGLxHMXgVhsXCDtyXf7Taj5CYz75W7dz8g=;
 b=Pcydmkt1olW2whFOTikGPXpZm4eAVIl6iHP7lUnutkofsK6QoqwLe/thi3IxOQqCAo/c1qdWb1cjwEkkc6Dxv2EUr5Y/t6xRB/M9vcWhoqUnW59/8x9SoVC/nHH7ONTGGJlW4xQ04tPrOv5qbQXSXxGKx8jZJvNyAenx5j4vZW/gTArx0no+HZLgRRYj94JqG6NrF9dlsSgCSF0Koe2wpbr3hwVKbJsm560ycpu4Vy8oL8jy4CcOC3FcwixYN4PROP4yuq/504VI4jINEaggs6CWK4Gv9agXp4XYRvO4LgJF5zawod2YM7+GdY+2g0lUtkQZGfG9kHOBf+QJbXGy/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cVRXqVbo1aGLxHMXgVhsXCDtyXf7Taj5CYz75W7dz8g=;
 b=ZiiEpBTt0kjydnWea1+s6g0l2X6XdDFxrjmTxkU43P0jQjisyi8N/qoiD3WrBtg3V4Nfn+7Y1SCKns/VCqDFwTMgoTUJuzez4HgF/qyvImDaJN/Fqjolw/AWM+5Ek31HxsQdx8/8ziSYJ+QlblEMMey2qc0M9M0K33OruSZUmfQ=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSAPR01MB7280.jpnprd01.prod.outlook.com (2603:1096:604:142::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.22; Fri, 1 May
 2026 08:18:34 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9870.020; Fri, 1 May 2026
 08:18:28 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: John Madieu <john.madieu.xa@bp.renesas.com>,
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
	"mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
	<tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>,
	"simona@ffwll.ch" <simona@ffwll.ch>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"john.madieu@gmail.com" <john.madieu@gmail.com>
Subject: RE: [PATCH v2] drm: renesas: rz-du: mipi-dsi: drop duplicate
 platform_set_drvdata() call
Thread-Topic: [PATCH v2] drm: renesas: rz-du: mipi-dsi: drop duplicate
 platform_set_drvdata() call
Thread-Index: AQHc2UHTT4rKO22OgkibFPxMx+vKPLX40kXA
Date: Fri, 1 May 2026 08:18:27 +0000
Message-ID:
 <TY3PR01MB11346EF532EB7974EFAE4BD1186322@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260501080818.955914-1-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260501080818.955914-1-john.madieu.xa@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSAPR01MB7280:EE_
x-ms-office365-filtering-correlation-id: c31373c7-38a1-44f9-051a-08dea75a391c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 Xc/IOP/HxUDa7bZTBwH/EDy85dU9KQhwPgAOROuoNPuEJC0u9tZeYc3g2rU7GjjZ01u7bvdgf5HjfYf4+Y2GUnqHy0dicYy6LKqONDi5NzNjpUn+um5NrPakypGwlKB8+IzC20q0rPf7RYQfP9SZyFYe476VKMAcnUmJI2QqfoY3BKbgAbjI9ufaYrOAUEryzpJQQ541NvLSb30TMz3a59N66VytDxcBjSS8QwTVB5GStmHwlenafcUk2a/X+4XbDh3mz9gv0TDO1aesoRjj1qW4brAQJ96YjVF35tOy31dbcnU6KzMhwO34Uj1BlIdVRMKJ+6aS3jTnZnbo+A0zce5bx9ZdxRdOfHSFkELAaoeQjYXU7zuVFgs1fkpyv2E4K5mKHf+LavSBwVzlf6iyL3yvYt5A7ADJJttAPoP3bYOYz6ifzkXXVPOXOkqQv/SiduXPZzR3OvskHmXA5Fk6JDYPxaJHqVG0qUOi8VaG02ZCExVtBbwWQ+p39e9HvhdVACm/7mx3meCJTSQMorCF8p4lGVoqbEbFUHNWf5d6NubGI+OdnZnHqL5zqinJZeAHpcUK2sHDaIDm9ORcA0QszFTwxqFDiSHz2aY5mX2+Fq6iaWWQ8euxywy5x1w5TVSIJfjU6E92WAfXlFzgJOSqDxE0Qj75X3q/cVUrBUUE8NRrd3GjKkPx5yBb57Nhi0GP0umzXVxaQJl8Uf8eCYO7G0AV4YXj3bE2BWKLg597j2hLqPk/TH9LHEt7nqi99NTw
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?4m50ILo9IcjP+WMrvKhSvKEfb46j4CrYEbhRaO4qDabuTXmGqtwWfH+Uli/P?=
 =?us-ascii?Q?AmH5rim0zHxmCh7L4LGOIT6hCW0e5srK724UkojNmEk0Cs3hLIMIOLyBypfx?=
 =?us-ascii?Q?5/wTVEgrsDIJZJYYl38GS51G1izCghuUH23bexviGO9nWwXbcxodCj9ybi2W?=
 =?us-ascii?Q?uQ+RpbM9smNQXuIs4swQ4hPePtcBh27Egh+QcsQeXNAx1QAPtLDoJsoSJsdQ?=
 =?us-ascii?Q?+RPkWqh5x56pJ2a/tw3LdDL8CvIYY+7keqIwCxcefKz5cS8ZHkwHnWPz5rBb?=
 =?us-ascii?Q?AClmgXfvEQYDSOxPpEuEG79pYukrdUhnn+cJMgCZxUdv96OuICDjvpRbmQVu?=
 =?us-ascii?Q?Pu6Hr7Lghx76SrFXGA35IiTxgN+7fAeGyDQDxWSyn9KDO+RJqRJwh8fqaDSu?=
 =?us-ascii?Q?PPU7ZFmJ+EDFevTcSjdrXlR0RxstCC4sP9YCE+0l8KfIp5eoB+f7Lnq+BVE+?=
 =?us-ascii?Q?5tqMRipiEzwV/wXi+CsSYVp7kRrWcEZPRhiyI9ajsx+GnndDeGWVj7wSTJVD?=
 =?us-ascii?Q?txeW7B0QP/5YXktPeqITLhWT9y8gJgXcra2WmvozXG0grcjTCWlS7qlt6vu4?=
 =?us-ascii?Q?eVWYi7ED3pkRIZrJniAvigmwO2XlkDrVN1qyqRimbk5mAvVdHksvBDmNOuTg?=
 =?us-ascii?Q?SpXUOMgcB2eO3ZE14aS8P+MNEQSTK3mJeQ5tSrdl3empqZhfrnXus74zrQ/0?=
 =?us-ascii?Q?v+AFBdbP/4Oqv2SAkXVamRNAeh5ONM16Wj8EKcYVEkDsNNrL/7jAvQBR4hyn?=
 =?us-ascii?Q?zxQY4BCZyX36x941YewGx6tfC7+hqf9u067jyTxR/USZKUT51R6NkOUwxSYG?=
 =?us-ascii?Q?Eu9QHnlmpnebmubQaQm1o3KHcVpGj7c85hkagwfxc9+BTx+KAqG8LX1XKUC8?=
 =?us-ascii?Q?LJ+fFUpK4xr4VFvpQpIU6N5xQQUN9+mXlc/67vw7s+dMvVgKHdofDqddHUdd?=
 =?us-ascii?Q?LkjzH1IAzO5srDpeXQcFoyhzX7+wPPre5ZDXYxnfgKFlVMuxym7ZRbkFVwQs?=
 =?us-ascii?Q?pPp71DI1jNMbjKRJ0TUis79FT3uqggc5ojvAqGSJUptjtYIJ6RAyYTHDqn+M?=
 =?us-ascii?Q?93fTDZnn3kbG61Wlp8SkGKgdFbHtyPBFLxvT1TkKxesPF/K2M1WNSnzV/ZxO?=
 =?us-ascii?Q?2xImj/djDfeq6RjjSZ34UP56ki/vM5GBJa8KKwaiFS/bUyVaS+/sg5zjM6P6?=
 =?us-ascii?Q?Ky3A3Gr0/PG5Wio2cGelRfblbhSQINHrW194Tu3J0rMZiJuQMw/Oc3t2XAD5?=
 =?us-ascii?Q?mP4mGrI0hgZyHxV/o3+2kN36tLMW4kwdK9uTWNdnUUO59FN0YWqLsWY00pLY?=
 =?us-ascii?Q?WN3VeRywU3K8Witg/KX226hXpw4dzabfOaPzvREvrUuvudYw2KmLrvR+27tQ?=
 =?us-ascii?Q?vWF5QsgYvNadHVU/kp165fldgJV2Px8UjVeWrDmNG5E2Xrb0rdxryqpFMZSx?=
 =?us-ascii?Q?qPE9rqOgdkzr+ZIlEBEA7hx2tkQBu30Xr9TEcqqwITh32S9tOdZNhEPql2c0?=
 =?us-ascii?Q?5IlkxnaTG8zItNtl5O9sxfh2WeIjgzIBnCZKI31w7XUieGCTCisVLBSGk3T/?=
 =?us-ascii?Q?tlh0DsL3wskyBHebjK+amGqoCta6UVfoIlvyDLer4IyEpw6/cXmzHmALNNiq?=
 =?us-ascii?Q?izIurMdN3ZiTRBR8Swh+VltE+JTfo6t9mlIrQJKdks8mmW1mjBjczzfIXX4+?=
 =?us-ascii?Q?Os3WWWjt/hasrIFnoBRcG+inLETdu3dEoIG9N1blhOv0GVpduGxQxTXkol+5?=
 =?us-ascii?Q?v3ZHMY0qUA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c31373c7-38a1-44f9-051a-08dea75a391c
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 May 2026 08:18:28.0160
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 51DQfxpI1xEBOgox44eYT0FWqB24r8Lxwtbpe+sG4oCUDu3djtjZgvyNDEh1zgeNwg//Tf6kIcvs5Ahu9qQrM4qNfBuLlKy3JNWTk26VvtA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB7280
X-Rspamd-Queue-Id: F3FCC4AB10C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31859-lists,linux-renesas-soc=lfdr.de];
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
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:dkim,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email]

Hi John,

Thanks for the patch.

> -----Original Message-----
> From: John Madieu <john.madieu.xa@bp.renesas.com>
> Sent: 01 May 2026 09:08
> Subject: [PATCH v2] drm: renesas: rz-du: mipi-dsi: drop duplicate platfor=
m_set_drvdata() call
>=20
> rzg2l_mipi_dsi_probe() calls platform_set_drvdata() twice with the same
> arguments: once right after devm_drm_bridge_alloc() succeeds and again af=
ter the reset controllers have
> been acquired. The second call is redundant; remove it.

May be "Drop the first call and keep the second one, as it is close to wher=
e the platform data would really be used."

With that fixed,

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Cheers,
Biju

>=20
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
>=20
> Change:
>=20
> v2: rather drop first occurence, leaving the appropriate call
>     close to where the platform data would really be used
>=20
>  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu=
/drm/renesas/rz-
> du/rzg2l_mipi_dsi.c
> index 715872130780..32616e5bc591 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -1406,7 +1406,6 @@ static int rzg2l_mipi_dsi_probe(struct platform_dev=
ice *pdev)
>  	if (IS_ERR(dsi))
>  		return PTR_ERR(dsi);
>=20
> -	platform_set_drvdata(pdev, dsi);
>  	dsi->dev =3D &pdev->dev;
>=20
>  	dsi->info =3D of_device_get_match_data(&pdev->dev);
> --
> 2.25.1


