Return-Path: <linux-renesas-soc+bounces-33246-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFnsA3TyF2q5WAgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33246-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2026 09:44:52 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FF75EDE02
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2026 09:44:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1338D30E66F6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2026 07:41:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1279348C64;
	Thu, 28 May 2026 07:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="SkOH6tRN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010064.outbound.protection.outlook.com [52.101.228.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2AF3195FD;
	Thu, 28 May 2026 07:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779954080; cv=fail; b=r4bsg5HPu3YPnY+9hQhXnmYaIcGonOpxMbA31RBo2sYz2hHN/LK52XswGgNpfPod2h4ay1ZDyVzviiAWtNX3q1MfosAXVa/M4YT4DaRXOl84BT+/8Vj9N9bjPlbqO2UfbT3AzHwaAJaYarqRYWB+wSL0PROiqNVA097EQZ+BRuY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779954080; c=relaxed/simple;
	bh=wPgKQ/MNaLx85HvNMhUqxD0a/YSXqB81Gviuab6WteI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lfxVC/uo5AOkX7gheQVvFhQ1FVkKDcASZtfd3+raN4rpI+jdZYJ0qvLrIeSJjeHcvtj1QWYekRanJAJReffBrhaqgLegzZXoAzhYUP2Fz5/ZV6mlGVDr5H8vtbMmwALghyAyJ6CrfZuu1IAvpGvtkmA/L/JOsQNOyYM6Uj7iQZ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=SkOH6tRN; arc=fail smtp.client-ip=52.101.228.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v8fS+xEQsUCJoV9x0zb6vrKNCtad7gw33KbU1h6nwfOdYy7YYTUqcJbkXC58esDACfQpbMaJIfzZ9PJgfzdSCod+DBGLNEvES+G74lEfWIoN9In3qrpgfNfzHqR6fjsbkczg1akREys+4fy5lkAmND71zSK6QmO75wZLir3sfEoSnRWLpdnOAkv5Yga/DUaMPAPWoPFqkw+Zhn3qOULwoSldkUhYDHV1sgK6oG4hJSXhXIgFtGycpg70YgZhWgs4prHnimEWno6/7R5sXHxVYf07WgHjqu1vVipfMuZqHG5WCkoXElek03bt2pCLK4UveMM0wCpcwbHzgO7r+l0XcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uiaosWTnJEQtNqPcn+LS7bO2NNZHNeqWcT8ejhNQCiA=;
 b=rp6J1IezG9TDnFtSJNYaUqzyGj48SoskuDe2JwBZmgzHiNq2nAkeNJI0sGvXjmLreJ4AhrHJ5ab1/O7sN8US/QWJJEClLbBNN+z2S/sXn65REEuMo8ir5oFZ9WOXvRZZmET/hjxClmArnz+MBm7xSUxCTkYR+uOaoY8iVigiYf+Nk6SQPQog8gVS1XjaW/ACH9jlB+JjzHSxKiigCVYwfayJ2AFanWSXgsRHmlVbRlPqHa4/JwIUzg2lFCSmgjSxVftjo7ImRmXeSa6TI2erV7Uih8hi+0sMeJGPxB8reLtEvEdTFUiHuP0UXgLJqFwaJY7l6wAERlrZ0J/ld6i0Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uiaosWTnJEQtNqPcn+LS7bO2NNZHNeqWcT8ejhNQCiA=;
 b=SkOH6tRNIN1O9z4rUPTvDSHy8aBdBizLUwvcby59SSi5PcX2yNSgR8AlXcWdiXK1OlDP8TUvu9/D9bdZkH1ENQXdDMs717ouIzTyvkvonIC/d9dF3Z1hZG6rhMBl6U3f9VUiu0t7VuZeeJ94eyTgVcQZy88ap2rLsW81jBGrvK4=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB7016.jpnprd01.prod.outlook.com (2603:1096:604:121::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Thu, 28 May
 2026 07:41:15 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 07:41:11 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>, Vinod Koul
	<vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>
CC: "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Subject: RE: [PATCH v2] phy: renesas: phy-rzg3e-usb3: Use SYSTEM_SLEEP_PM_OPS
 instead of NOIRQ
Thread-Topic: [PATCH v2] phy: renesas: phy-rzg3e-usb3: Use SYSTEM_SLEEP_PM_OPS
 instead of NOIRQ
Thread-Index: AQHc7bHECYKZGBehrkWMNew/iSDDzLYjDxfA
Date: Thu, 28 May 2026 07:41:11 +0000
Message-ID:
 <TY3PR01MB113467A9F79D9DE9BAE0951F486092@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260527082052.117289-1-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20260527082052.117289-1-ovidiu.panait.rb@renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB7016:EE_
x-ms-office365-filtering-correlation-id: 775545e8-e4dd-4324-2866-08debc8c7cf3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|11063799006|56012099006|18002099003|22082099003;
x-microsoft-antispam-message-info:
 U56Bjv0S/rdZ4vzf+g/l6Ci817C1BMTmvxP+4Xkeecp38fqt7rFP239dT0RB4bBJ6tVSp/cotTN9pIXd3MR8SFMeAGIjSCGl7KNFvmQP3h2K6eCHLPQKyFPRBDHff5GV2NI4D6QymmcGrKY0qyoM3BTRhIXsfCLcRN31gM64bpy4ofmn2Tbga4N6MonrPJ117ZPer8I9kwg8+T79Gbdcohcja1JHzcOsABMW1qhh7L3p0yVm+on+K8+9VR1JaNJtZXM1lR/wkmXjGPMyhW1xkYSW/6ojWrJ42UilN9MzmjI4l/ezDL64UMHga2N2Hde6WRqF0AtXpt8RkvTZcTlmp14+2vT+0aqUwGBCnEltD4Rfoy3z8W/kGaTpPwaRKfGcpW5T2u2PzuUCYVtQdEXcLZJx29jQPCA+2dtq2ZEL9ArdZauYFAbKTCkD2qfAvZaIMqtXwRuK9Ri9gWbMhGnPJinpJ4dIo1htWJeLYwrlvPHxDTn0/rX9BOB7Y4hpccd/Rh9D1NEiKWGvriuEIfEOkYV+132BN6VPQtQEoQiUHWVQcOZRSufjFVXcCz89ZMdoS0P95b3wc6AtABmkTM2Jq0BGIrYiFHJffTMqtE/9ULSRJfLKrJXqkGxcHT7uaAcQL59jIz9z78c7kc+meB/9ZiEE86T2H1rxxmSi6VCzUOeZ9hMW9PhUR9PARAITVILg+LHLu7oevorQVcNXQznxAwQ4m1BbzIXs0AHbixF0m6J3c+zTN2831DwLf7dxgTHi
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?sae7ZntnRoexx+0ncb5hxZuYuHcDID/OUR2E3hZiZD9X2oaDUhiFTA6MJS5U?=
 =?us-ascii?Q?DQTgro6fMXiQMe2ycCXJ4PeD7QWOvflBK2G6aI/yS3PSNSvsvA4jJrGXVUv0?=
 =?us-ascii?Q?19IEOwqKYilK9MqiRwGkIn7tgmmVfKbxPEkb5knb5uEOt1acMCumGcZloQr8?=
 =?us-ascii?Q?AdeHdTarZ0u4LwUg1+Kt6ryOheHTmzTtAHn63wLsnX3BfwU57cwSLWU1mkbZ?=
 =?us-ascii?Q?225m/A5+LR0lNn0Nxc6sMH1MUE5ndUZNzCrJ7RAXxVVCcM7oSDimagQdti26?=
 =?us-ascii?Q?4RHX4A83gr4iEpznieoTU1xbhTRrDvgjR80Z8/pgdSTEOI7vsaSxlgzd0KyG?=
 =?us-ascii?Q?Mf3rEMpcYCARDorca9IeO62Vop9SjVnZXNSgAHS75zhr3t0HNK5SUstdUb32?=
 =?us-ascii?Q?WwwYxL03rNmhYdQUkiV5J4BeQaLJTLsFI32BcEdekwu1lICtTfFN7B9WrlHX?=
 =?us-ascii?Q?vmfNbR5htTODVzFIiIahQ+wavfmP793ChHNjeMlzNX/ixWLBJPxyEC0pJjuO?=
 =?us-ascii?Q?GRDeWyOHUDdC58YBZ3+MD0jC5zrnvPo1FBQhv0U2vwpse4fXO/x16Yf7dtLi?=
 =?us-ascii?Q?JxdWILg9j3YGx4iJkGdN+deguO2GQFlIweyYbn8IrcytvQ0pptoHtg1fF688?=
 =?us-ascii?Q?sofxFiM3Ve/IWH02D+KOYrU3YjvOkqQyE2Ey+hnScO+84KI3TGVZM2hhZAxx?=
 =?us-ascii?Q?j48EYkrKjtLRacstK/DZpDfaacgsxWvPDkGxJ5PCbHbZ51mIMXp54kX9psAI?=
 =?us-ascii?Q?VchJv4vqgkAFKDM5USjUqMSx7NS/200kKQLXVsERkie6yE28MKVi647Jd5/3?=
 =?us-ascii?Q?iBCwDiZK1P17b812awKvaYV58N3aZCFMTQ1LuF7AvjxHpjV1Mmu4XwhTOwHN?=
 =?us-ascii?Q?YT+YJQBkaX8DmT2b80T8qYLffRgajUQVPwenl61NrweUnVHaUwWr5+R3PB/A?=
 =?us-ascii?Q?g2Vt/ZmZ4WOMG1ctwtnlHGzSGQemd8NJzdWMwx2QDNxcShBHPGXzUmk1jRCA?=
 =?us-ascii?Q?Dq4GSiLJVdWxOqYWti8hsXvw37wA4WNdm7rndejpH4IA6MtbB7hbI9iCTzQM?=
 =?us-ascii?Q?B+JbqdILHjAIRRzzit1p1p5dPTHYjAWIpqJvF0uocXm7hbQhXxqhWTOtSm/Z?=
 =?us-ascii?Q?duID3K3kuFd0EVadosX/zuQ+3XosiP8n4tFQFKO8em4GOSWZjCUxmVufwHwf?=
 =?us-ascii?Q?5z/hXEg3tpUS8nyjLpP99l0Zp+psSimMUaGQ27bEy1J2RMD0JOusd1EmSW4Q?=
 =?us-ascii?Q?btRxLlSSaI2MpLEFQbFFewA4AC1R5Ny0lz6FG79OzHeyKcjsusl8+Ep9A6Yh?=
 =?us-ascii?Q?hSS+D/84GWkBTsTLRMwA7t7VQ8U0AmWfQUpbYVPlQwHsyvs3B/tqq0cz5Rfs?=
 =?us-ascii?Q?a+mdwHFjcw1a+KrXiyI6EboFYYX1l6Se79DWNRcSzbngUfpFnJRhaovMacP8?=
 =?us-ascii?Q?zA7UiBaW5skM5bqP+VaXQAV8edyETG3uW2lMZjMXr22slBSmtizLpJSdbsuh?=
 =?us-ascii?Q?Iahlm106Dhgkw5eLcQV2oGd2vgaclbCWdQBdk3GanR2UP9TtNTx5SKByqJoU?=
 =?us-ascii?Q?njyAqKKDyK2u6WZjeCbP2r6qFFTlvIVzvt8/l7oqW66r5rMsgzYvL9bUGV9D?=
 =?us-ascii?Q?f2fNH2EhEB/7QWgUv3yxdU9tTnqHcab+VTyGMrDwN4R78szS1rDL3eNW1FB1?=
 =?us-ascii?Q?vKO3JI1TeAKT1HF8olQYktWXkAQStuQe3jBvz7DEe+x8eSsqOtdjyKO+qyei?=
 =?us-ascii?Q?pVip9k2A4Q=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 775545e8-e4dd-4324-2866-08debc8c7cf3
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2026 07:41:11.0412
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F2iHxNyVL3z6qWFtNfyxDXgTIslEfNt+GOiJ+e78qeVevXNLiG3OWjpcV/JvlJoUkX0y+KINIB+BJ7ZkN1uXhoo6LwLxlmZuqBmq1BOXBO4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7016
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33246-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,bp.renesas.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 69FF75EDE02
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Ovidiu,

Thanks for the patch.

> -----Original Message-----
> From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> Sent: 27 May 2026 09:21
> Subject: [PATCH v2] phy: renesas: phy-rzg3e-usb3: Use SYSTEM_SLEEP_PM_OPS=
 instead of NOIRQ
>=20
> On the Renesas RZ/V2H platform, if the xhci driver is unbound and the sys=
tem is suspended afterwards,
> a PM underflow error will occur:
>=20
>  # echo 15850000.usb > /sys/bus/platform/drivers/xhci-renesas-hcd/unbind
>  # systemctl suspend
>  15870000.usb-phy: PM: dpm_run_callback(): genpd_resume_noirq returns -13
>  15870000.usb-phy: PM: failed to resume noirq: error -13
>  15870000.usb-phy: Runtime PM usage count underflow!
>=20
> When the xhci driver is unbound, the runtime PM usage count of the PHY dr=
ops to 0. Since the
> suspend/resume callbacks are in the noirq phase, the pm_runtime_resume_an=
d_get() on resume errors out
> with -EACCES and the usage count stays at 0. The subsequent put in device=
_complete() then underflows
> the counter.
>=20
> To fix this, move the suspend/resume callbacks out of the noirq phase by =
switching from
> NOIRQ_SYSTEM_SLEEP_PM_OPS to SYSTEM_SLEEP_PM_OPS.
>=20
> Fixes: ee5f1a3f90a4 ("phy: renesas: Add Renesas RZ/G3E USB3.0 PHY driver"=
)
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Cheers,
Biju

> ---
> v2:
> - Dropped the runtime PM rework part from the previous version, as it
>   was not needed to fix the original issue.
>=20
> v1: https://lore.kernel.org/all/20260427194741.161533-1-ovidiu.panait.rb@=
renesas.com/
>=20
>  drivers/phy/renesas/phy-rzg3e-usb3.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/phy/renesas/phy-rzg3e-usb3.c b/drivers/phy/renesas/p=
hy-rzg3e-usb3.c
> index 060309547ea5..4d2b0f5f5b09 100644
> --- a/drivers/phy/renesas/phy-rzg3e-usb3.c
> +++ b/drivers/phy/renesas/phy-rzg3e-usb3.c
> @@ -233,7 +233,7 @@ static int rzg3e_phy_usb3_resume(struct device *dev) =
 }
>=20
>  static const struct dev_pm_ops rzg3e_phy_usb3_pm =3D {
> -	NOIRQ_SYSTEM_SLEEP_PM_OPS(rzg3e_phy_usb3_suspend, rzg3e_phy_usb3_resume=
)
> +	SYSTEM_SLEEP_PM_OPS(rzg3e_phy_usb3_suspend, rzg3e_phy_usb3_resume)
>  };
>=20
>  static const struct of_device_id rzg3e_phy_usb3_match_table[] =3D {
> --
> 2.34.1


