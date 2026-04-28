Return-Path: <linux-renesas-soc+bounces-31692-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIYqKrZ98GlSUAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31692-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 11:28:22 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4762D481671
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 11:28:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4B9AC305463F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 09:21:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 725C533064A;
	Tue, 28 Apr 2026 09:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="JSMPGZje"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011035.outbound.protection.outlook.com [40.107.74.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D102EDD7D;
	Tue, 28 Apr 2026 09:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777368093; cv=fail; b=SFGjaqMBb/tIVk3Nof4v/PZnjLv+HQgGWkMZ3EpAqoVgqdVE9cEkwdv7wOG5lnNmYzc8jYAOVxr9pPzNQDEVcj2iRC4lDa8IVwB898L4Y0Hz8u6fZHIXX0II27kpyxBRbjlR9meqosb2oKUVFiuSgpOr+EEVcCPfK+tn8Qbv6Nk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777368093; c=relaxed/simple;
	bh=lzfAzMFWBqkkE7UAtWglyjw39jyvTkHGsn+05J9xJII=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LmHy1qoJCishmvJMm3/zhVUTBJR0jCcGP0fNYOxVd6QTNGgjkb2QiIZgg6CAon/Bn6lCj0o0FR/2MNloLQbsGKx87yLCrPb2Oqt5G9+FaTO44HELjdAw3UBka0AJjKRPMLvBE3SK7w5W6NurHnG43+1PbuuID5HmKeiy9FZ30qE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=JSMPGZje; arc=fail smtp.client-ip=40.107.74.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oj+mmMjXAtW4wuKfQAyVbGS5qdfKJhMrxiBYJoWgkmiZgkaGw9W5ZtrhNi/X2e3Ntyh4UTttgmQXgYUZlpbZycucZKbnF0aGG9feq/0wZnWP3XXyP1FKxjLUSXA+bdJIhd8lmSdDFEt+OZxD8Pq7MkNPZ11wB2eTqHeXLJn7+W/oeqcu/OvjhEyHwtvK6gFbVGcbGxBQCLi6ItX0P3xWrFst2A9kmQwRElFDH6/CKIRFG2kWsOZ72oHtNfx71WgSpQ8jny6cGsH4rnmHOzm1Fx3Jt1TF7Jg5rbf7A+SZ0VcKtK7Kkedv4bdZhoG8Fy5OJArZ2ElCNV3cTtxsOIZdBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ehtynv91nTINaZS4dyUZAgebJI3mdmWw2lnKjnxOsc8=;
 b=Kfn5DZsj358bKpYnM/phmKPpyLyGgW1xxuciFDOzkCh8zzX3+9xQ8sgtVBrOdL1P3XiFusXjwOk2Bi4VpArUi9W80u2Rw6PvskUDFT1la5ijKh94buVOvW1TCTI42VXXbO8igcnKF6Sogc0vn5mGodpiBBpbxNU7FV3r6frtNoAn3ddCxlWGbw/oAkpIa9qy4a6mBMbfI7wBnVjej1Jo6UZqGyXVVUfMzyeZx2r4GbxknbcMwv1uU6D2V6LKFaEfvJ5TOXbvY1NZXSr/lFAsssUjDAXwN9KyVlFqN466vDvvI6Ep/H35beh+V+t853vjUgpUTmAsGsucAgXwHY69YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ehtynv91nTINaZS4dyUZAgebJI3mdmWw2lnKjnxOsc8=;
 b=JSMPGZje2sluhx6yjcY6FwllZY3fJQzL2kwkRkArQ5CkGHdS/Am+YOUVcdRL63SKC4CM+r44kAiHgayv32UczobOwpYwVIKhOfLHnpNho0KEOcipoP0v3khLWxpT1tmXtLiqOSn0xSGdMM+cCSPwq7mopWyM5kM2a4losqsylnI=
Received: from TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM (2603:1096:405:38d::6)
 by TYCP301MB0222.JPNP301.PROD.OUTLOOK.COM (2603:1096:400:2c4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 09:21:24 +0000
Received: from TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM
 ([fe80::5b4b:dd0c:b302:7911]) by TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM
 ([fe80::5b4b:dd0c:b302:7911%5]) with mapi id 15.20.9846.025; Tue, 28 Apr 2026
 09:21:21 +0000
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, "vkoul@kernel.org"
	<vkoul@kernel.org>, "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>
CC: "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] phy: renesas: phy-rzg3e-usb3: Fix runtime PM underflow
 during suspend
Thread-Topic: [PATCH] phy: renesas: phy-rzg3e-usb3: Fix runtime PM underflow
 during suspend
Thread-Index: AQHc1n7ANECNPwe9y0+ScapReaOqMbX0AEoAgAAlYxA=
Date: Tue, 28 Apr 2026 09:21:21 +0000
Message-ID:
 <TY7P301MB198432F1681EFA444D16F824D3372@TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM>
References: <20260427194741.161533-1-ovidiu.panait.rb@renesas.com>
 <TY3PR01MB11346819FE6253E90C7B4F88486372@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TY3PR01MB11346819FE6253E90C7B4F88486372@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY7P301MB1984:EE_|TYCP301MB0222:EE_
x-ms-office365-filtering-correlation-id: 475d4f1a-dabe-41ef-2466-08dea5078323
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 BxwkxkQ/Ww8gD8cX8iImJo4EAJgjLUddpCFccd2mT+YpB0A8Y8NNjj8HDqEjHlMppQLn5Hw1lC6pqCyFQTeINJ3+7nIW4xZDiK7Gg7wUY4PGNU4gzB+1/ksb2u311z2NV8G9fgeCS2TvJOd3oBg2KliepuaMhQOu6y36+SUJRbQv9CbuCLRWrJD9CCZXQKpqEL1impoma8sqiBjV6HBe1FS7EB4TpDcRTHHXyZuYtZxihfgaC0fSsqSslfEZCy2CYmYvlWeSe8FSGi8YpNsYWaYHUg1mlTjKA86W8tm2T4PiclqBAnfh5+6xV92LO487LkxW2CBDUJYK7C6OMM9l+onNklBAlGz1eT5Gq5TG+bIHkjqzC+fGQxX33O18+1lKFiN7TpSIxgSV4gw0sVBqucUavEioBzEe7Bgki2TU1wCCrZRY8EOlFu5vm+iIqvd4zLZBvE1jg4re6T8GuCCkL4Rd5DPCyzBs220JicvcZzZWSH2VyZlkITcekFyzQ4sDrplOStcsGx564PpRXcO95H2f69Lqz8yygPL25Va4HPG6NwvIrxNYu3eWo1hEIZLVbm4pMt9Dw0+4PF+OspLLCai5QabV6QMmrgPHVEy7fs7Vf70HJP0Ef/sA6GBLAK/yqnHm2spDIGAG5AZo5+vbON5Fomy1gNGvbPPNNHMxpnfjMAyfF6qo8i+B+aG0lDkMbxS5TWbp7pSciYLLVyMk/zMLNT2v9rsyUhBhniZDqMHJDHHzfLZsp6oL2VwdT4dE
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?H9kWLkQyVrHOIFmqLbsWwk9NuZs79odI/KC+IOt0KyEm4D/U1eUcSrIAlP7X?=
 =?us-ascii?Q?gdBb7xYu+o+eu/pAdE7niIg9N+LroMe3J5LfUEuV8YFyspsmg6nePXCbI6f1?=
 =?us-ascii?Q?QTb3XbTPvFffOyp71y2K37JQiaZgfcMac7MJ/PcfB+Jj9+OYMcDLokIKEwHf?=
 =?us-ascii?Q?AFUU+b3ymtJhdEWQmOVe5zNWVee3ZY6hZHjD2g1z/OXWZG+N7Tt+kYZRPVzl?=
 =?us-ascii?Q?NgLiQXicwZLIPl3X9JSFuu7Ulc5x15RQoPqkzAG0DsqjbE+wg4TyKBxObMja?=
 =?us-ascii?Q?aTkrIisHtCccuputXWsEBqykHQUvKh5EEQyp0s94FV73sOUMgOuzjw1YpOaT?=
 =?us-ascii?Q?lDUAeHHkI1Gr4+Eg3CLYJQCNRgph6CUQkbaIh2eR2W9wSXT23Q+zHUwc7A6G?=
 =?us-ascii?Q?zkOzyP2F///JbKTbvTEkw8EpD0sMvy7nLk/5wsC2C0sowWTZI3nP16UGWEEp?=
 =?us-ascii?Q?oX49TDd06nDFmXiA/heRimIkJ4xnhlNrMZreyxKlPjN5THhEk73peOK6r69f?=
 =?us-ascii?Q?xaUyVgR31S6nIalsDGYiIAMDl7FwucxEMDAkryz83n0izXe69gfIoT7JVZ0k?=
 =?us-ascii?Q?fVe29srqLW8V/ZckRuELQRnEdhblELXykHpoILjsge3IgyuW9GESlwxTIRZ2?=
 =?us-ascii?Q?lUfIy0yaoKa6BYa9MOwmPczcIhuX5JTrtq3epX796+rdZtaw7Lkm4fiFnWS5?=
 =?us-ascii?Q?CeVetqB5/DYsyLdEjFTnMF91z4qSr2XTb364JK85jjX0XcrtsQb5KMpy/9+1?=
 =?us-ascii?Q?YI1doUR9FlE20dIVvVR4DcyV5HDJ4olvYzJJhKIKHaGAxpPK+YpVSW14XfKl?=
 =?us-ascii?Q?ncz1rLS8new5DvW2LbZZI73Bxa6jt315o3ALh+N0Wq1AT0CKa5cM9mLTnIuG?=
 =?us-ascii?Q?sSnsu6VrCLac5FVf/zGREJaqqEoOGanxSminv/nzOBEqdSXJBO3dfOMsiuPk?=
 =?us-ascii?Q?q7yoAOy+BnPBOypl42qDRyE7QADtL2gy6Q32xiVHAgESoglZNPaFBhHIRDiw?=
 =?us-ascii?Q?wovjmfHpQnf8Qm4Tq8rkEJrsCxX7xCb4Ok07g03NDfrHP1NzBCcjX6dCUdVc?=
 =?us-ascii?Q?m/haNItwpqvAYf1WbsZdEWpBA4huidgzovRBRua1pGbxdy3oYqwDnX0sdOKr?=
 =?us-ascii?Q?bdDV5IkcblwPWNNOBPT8hmnpcBUzji/HOR+Fq56SJFDlK5Ke7+hB+YsS43bc?=
 =?us-ascii?Q?19pmEo1HuXi4r85HtGy6sWDIExCLXZlovlvLtWMt70w4X+YDjvgrOsQjwvWz?=
 =?us-ascii?Q?7wMw84lsOIQo6CBtVuT0Z1fWDfiYoVVa/Lx03TS9xKtFvONGEQMsIW8vFLF4?=
 =?us-ascii?Q?Jzaoh4xjOUuZVU36Y2tPNOkOeOlriOxxGm8fEOHy5jspVfpKerW0bBDlaG6V?=
 =?us-ascii?Q?oby5i5O6q16+YtrBvHzS8VcIaH8w0HiwMbGFaKu1jQM9hnVAyqn99s9x+0mP?=
 =?us-ascii?Q?ufu0mKg9b5TiUNYSPUtTh8nNg+DF4pYZ3pQQGGmCgevM2gUEFwz6GdVRDwlS?=
 =?us-ascii?Q?t2IJJshat0uKd927zb5N+w084IrJFV4AjslDNlG7rKIB9rcOgzrXDGJ1QA+h?=
 =?us-ascii?Q?SUHkxWI7bb2GPxLoLdQMsPCBiER5Z71TNUQ0r1OX6bM7n41dMGrMpCevJbGr?=
 =?us-ascii?Q?tQrfQ+r9FQjTKt7Vno1uMBN0oZYiZAPjsmQ0KbCE+cN4s+UZZ7O2ANegmuwX?=
 =?us-ascii?Q?loGEDmS9kQn7Dv4Gqgz/I4I6zQZ9aIHflC+LI/65EQCIlmTNlm0ctRaawX2O?=
 =?us-ascii?Q?mA97Fb2r4+8g/VkN6gLoIPzA4xaeo/o=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 475d4f1a-dabe-41ef-2466-08dea5078323
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2026 09:21:21.6188
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gjYtP8QtZgzSxpvdnLpWMiYTs2mV2Jenm9QY6J/SdbuIwbsNc0tdsFZ5Fs5eq2o/grXT9JizSfl7mKtHBXUXRIvvdvY92Q6zgiJ0MU8WeoQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP301MB0222
X-Rspamd-Queue-Id: 4762D481671
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31692-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ovidiu.panait.rb@renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[renesas.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url,renesas.com:dkim,renesas.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

Hi Biju,

>=20
> Hi Ovidiu,
>=20
> Thanks for the patch
>=20
> > -----Original Message-----
> > From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> > Sent: 27 April 2026 20:48
> > Subject: [PATCH] phy: renesas: phy-rzg3e-usb3: Fix runtime PM underflow
> during suspend
> >
> > On the Renesas RZ/V2H platform, if the xhcd driver is unbound and the
> system is suspended afterwards, a
> > PM underflow error will occur:
> >
> >  # echo 15850000.usb > /sys/bus/platform/drivers/xhci-renesas-hcd/unbin=
d
> >  # systemctl suspend
> >  15870000.usb-phy: PM: dpm_run_callback(): genpd_resume_noirq returns -
> 13
> >  15870000.usb-phy: PM: failed to resume noirq: error -13
> >  15870000.usb-phy: Runtime PM usage count underflow!
> >
> > Since the PHY framework is managing the runtime PM of the PHY via
> phy_power_on()/phy_power_off(), there
> > is no need for the PHY driver to manipulate the runtime PM state during
> suspend.
> >
> > To fix this, remove the runtime PM calls from the suspend/resume paths
> and add a get/put pair inside
> > rzg3e_phy_usb3_init_helper() to make sure the clock is enabled during
> init, even when there is no
> > consumer for the PHY.
> >
> > Also, change the suspend ops from NOIRQ_SYSTEM_SLEEP_PM_OPS to
> SYSTEM_SLEEP_PM_OPS because runtime PM
> > is disabled during the noirq phase and pm_runtime_resume_and_get() woul=
d
> not actually enable the device
> > clock.
> >
> > Fixes: ee5f1a3f90a4 ("phy: renesas: Add Renesas RZ/G3E USB3.0 PHY
> driver")
> > Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> > ---
> >  drivers/phy/renesas/phy-rzg3e-usb3.c | 31 ++++++++++++++++------------
> >  1 file changed, 18 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/phy/renesas/phy-rzg3e-usb3.c
> b/drivers/phy/renesas/phy-rzg3e-usb3.c
> > index 6b3453ea0004..055775e1a0f7 100644
> > --- a/drivers/phy/renesas/phy-rzg3e-usb3.c
> > +++ b/drivers/phy/renesas/phy-rzg3e-usb3.c
> > @@ -64,6 +64,7 @@
> >  #define USB3_TEST_LANECONFIG0_DEFAULT		(0xd)
> >
> >  struct rz_usb3 {
> > +	struct device *dev;
>=20
> Do you need dev as struct phy has dev member [1]?
>=20
> [1]
> https://elixir.bootlin.com/linux/v6.0-
> rc4/source/include/linux/phy/phy.h#L153
>=20
> >  	void __iomem *base;
> >  	struct reset_control *rstc;
> >  	bool skip_reinit;
> > @@ -130,11 +131,21 @@ static int rzg3e_phy_usb3test_phy_init(void
> __iomem *base)
> >  	return 0;
> >  }
> >
> > -static int rzg3e_phy_usb3_init_helper(void __iomem *base)
>=20
> you can add one more function parameter dev here.
>=20
> static int rzg3e_phy_usb3_init_helper(struct device *dev, void __iomem
> *base)
>=20
> > +static int rzg3e_phy_usb3_init_helper(struct rz_usb3 *r)
> >  {
> > -	rzg3e_phy_usb2test_phy_init(base);
> > +	int ret;
> > +
> > +	ret =3D pm_runtime_resume_and_get(r->dev);
> > +	if (ret)
> > +		return ret;
> > +
> > +	rzg3e_phy_usb2test_phy_init(r->base);
> >
> > -	return rzg3e_phy_usb3test_phy_init(base);
> > +	ret =3D rzg3e_phy_usb3test_phy_init(r->base);
> > +
> > +	pm_runtime_put_sync(r->dev);
> > +
> > +	return ret;
> >  }
> >
> >  static int rzg3e_phy_usb3_init(struct phy *p) @@ -143,7 +154,7 @@
> static int
> > rzg3e_phy_usb3_init(struct phy *p)
> >  	int ret =3D 0;
> >
> >  	if (!r->skip_reinit)
> > -		ret =3D rzg3e_phy_usb3_init_helper(r->base);
> > +		ret =3D rzg3e_phy_usb3_init_helper(r);
>=20
> ret =3D rzg3e_phy_usb3_init_helper(&p->dev, r->base);
>=20
> >
> >  	return ret;
> >  }
> > @@ -187,6 +198,7 @@ static int rzg3e_phy_usb3_probe(struct
> platform_device *pdev)
> >
> >  	platform_set_drvdata(pdev, r);
>=20
> >  	phy_set_drvdata(phy, r);
> > +	r->dev =3D dev;
>=20
> Drop this.
>=20
> >
> >  	provider =3D devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> >  	if (IS_ERR(provider))
> > @@ -199,7 +211,6 @@ static int rzg3e_phy_usb3_suspend(struct device
> *dev)  {
> >  	struct rz_usb3 *r =3D dev_get_drvdata(dev);
> >
> > -	pm_runtime_put(dev);
> >  	reset_control_assert(r->rstc);
> >  	r->skip_reinit =3D false;
> >
> > @@ -215,27 +226,21 @@ static int rzg3e_phy_usb3_resume(struct device
> *dev)
> >  	if (ret)
> >  		return ret;
> >
> > -	ret =3D pm_runtime_resume_and_get(dev);
> > +	ret =3D rzg3e_phy_usb3_init_helper(r);
>=20
> 	ret =3D rzg3e_phy_usb3_init_helper(dev, r->base);

"dev" is the platform device, which is different from phy->dev. Phy->dev
is a child of the platform device.

We could be referencing the platform device from phy->dev with &phy->dev.pa=
rent,
but I don't think that will make the code cleaner.

Considering this, I think the current implementation is fine.

Ovidiu


>=20
> With the above addressed,
>=20
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> Cheers,
> Biju
>=20
> >  	if (ret)
> >  		goto reset_assert;
> >
> > -	ret =3D rzg3e_phy_usb3_init_helper(r->base);
> > -	if (ret)
> > -		goto pm_put;
> > -
> >  	r->skip_reinit =3D true;
> >
> >  	return 0;
> >
> > -pm_put:
> > -	pm_runtime_put(dev);
> >  reset_assert:
> >  	reset_control_assert(r->rstc);
> >  	return ret;
> >  }
> >
> >  static const struct dev_pm_ops rzg3e_phy_usb3_pm =3D {
> > -	NOIRQ_SYSTEM_SLEEP_PM_OPS(rzg3e_phy_usb3_suspend,
> rzg3e_phy_usb3_resume)
> > +	SYSTEM_SLEEP_PM_OPS(rzg3e_phy_usb3_suspend, rzg3e_phy_usb3_resume)
> >  };
> >
> >  static const struct of_device_id rzg3e_phy_usb3_match_table[] =3D {
> > --
> > 2.34.1


