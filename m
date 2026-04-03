Return-Path: <linux-renesas-soc+bounces-30883-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QNAgFfIl0Gko4AYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30883-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 22:41:22 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A5288398347
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 22:41:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4E99A305F673
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Apr 2026 20:40:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0899E3D811F;
	Fri,  3 Apr 2026 20:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="RNuMNdRS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011051.outbound.protection.outlook.com [52.101.125.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F17636D9EA;
	Fri,  3 Apr 2026 20:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775248832; cv=fail; b=OxZFmngjewzePlNgVyZez5qhiwkw4FKcrcPAuCK33U1Q30FAUekO4VLlXb7QXayDoT2fJXRh1XkjMUicDQL9YM/Fy8jLXtBrEsschIKtPcfouTTBogd1Oz3wzBzZfegKszPh2Ww7eDHbEIDNp/uXJQhZ2fzNM0gvphpwy//ugck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775248832; c=relaxed/simple;
	bh=l5gg+RiNuB6Ks1G7427LkSKIoF1g8vwvF/LGmdm214c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qvRnkMc6KCi7ZKWrLHK7/todJKlQjLNSoG22AJGoCWkoJvfLXT8sfOIhh55LDHiyh9UtT/r6B9k5zFBvxStFUKWSB9mejO73f56lPKrfzbx0EC0pTZA+VgjY63dqH+XbkmfRHz62N9TLh6QLAG7LMYU1RkwaSdwCEGS0avj1ULM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=RNuMNdRS; arc=fail smtp.client-ip=52.101.125.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iUcXMMM3LfcIF3RbAOYlhwedhAfaIT3rRw4mxS6wt649T1+prL3nie28AcZg991byb/LyXt4G/Zxo5X8QqQBs/plZ/ptIuhS9coR1HTA+I5MqPvtA4kBOq20oEhJNmLipeU67jAzV8I7s35LxKKwyPXr1pl/PsPhlihpxGp0KE3MxSsC1rXfMqvfpJlXd4sR28tz5jDgfGVcxVxoC4D356vmCkLISfHVOvlNZVh12Qh+78k97lsblqK7u8V0QiyB+iEvGNDzCBfWH8bkAEnAx+V6P+ko9TQdVXap2yItKWWWUh3IjqMJje8FWUxhJE3ng1eHQRMaoqfdWb/uOtgtxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l5gg+RiNuB6Ks1G7427LkSKIoF1g8vwvF/LGmdm214c=;
 b=lVmvC0dnxGSWvLcb+2jF4uHZ+uY0H/gB4OMGYRmUhh86g7L1ctiipFwn4hPxiErzhsL6yoVGAAf71krI/P0btm0/Vq3FUEb8psFCbevIQUVULvQb8UeNc+abX0d3Z13xi97uRJGFN87BosxscBaxpGUV0epTD0rMeUkQOTspJHIt7nJdx1PvqoBy9uFAtrxxkf5RQOGAnk5w0DXOvE1SGShgDG/OuSXfyDMH8EA73xuFF8Oy9I3KfvQXOAEVVi7UAjoRnPSBxz6v0xBBKgyQ5uy4C8XvogfDryD7LDHJ4WtiOv26XbgNyxhTJ2kCpQmAfuaPNSYZFWyDNGrBQnyV5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l5gg+RiNuB6Ks1G7427LkSKIoF1g8vwvF/LGmdm214c=;
 b=RNuMNdRSkEhPBMRJYNIE4ci0eUzGFf/qEojsstKihJ2TKg+m+ba7pVDSMItBfXH42Kqrsf1BR5FjVUt4R22g2Z7kYxjCJqSLZbWpThM+cepr3KIOis0GjyaludsAywPZdXncIU40X3DEm7faWKgxiXvIHPnQgoBV4dWxRh89NXg=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by TYYPR01MB12354.jpnprd01.prod.outlook.com (2603:1096:405:fc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Fri, 3 Apr
 2026 20:40:27 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%4]) with mapi id 15.20.9769.016; Fri, 3 Apr 2026
 20:40:27 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, magnus.damm
	<magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Claudiu.Beznea <claudiu.beznea@tuxon.dev>, Biju Das
	<biju.das.jz@bp.renesas.com>, "john.madieu@gmail.com"
	<john.madieu@gmail.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCh v3 14/14] ASoC: rsnd: Add system suspend/resume support
Thread-Topic: [PATCh v3 14/14] ASoC: rsnd: Add system suspend/resume support
Thread-Index: AQHcwr13I5amW7ZYPkaq5Ye8ITdZ9bXMk8CAgAE6k+A=
Date: Fri, 3 Apr 2026 20:40:27 +0000
Message-ID:
 <TY6PR01MB173775A3CDB4A2C6863608C2BFF5EA@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20260402162436.12059-1-john.madieu.xa@bp.renesas.com>
	<20260402162436.12059-15-john.madieu.xa@bp.renesas.com>
 <87eckwg67x.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87eckwg67x.wl-kuninori.morimoto.gx@renesas.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY6PR01MB17377:EE_|TYYPR01MB12354:EE_
x-ms-office365-filtering-correlation-id: fcf41356-e54c-41b6-04d1-08de91c13d3d
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 xlhdRLjS718eGX1SNvboIdTOWsUtbYyirujq7kMICD9hNIta1glCsEq8plrbT9tyfs0ee1FkhfA3Dpcz+jZsYCGzWrM69DtiMNC6a3Zk7xZTr5hFhQpSNGoIJgnOWufXjWErFw/28/5kKSVAWsSfHhEPu1bimIr7aci8O9IzuDQmta4DZ6oxXUeBlqNYts5evp0ypKpGBdbHkn25hWmAnNDpvjsrAz6FnqLW3u1xrXwM3nqMyYIVdFMhXsvKX7M/6omuZ9N1/tmsur5KNz8jRORkEaf5o5TRaISn9zMTBhamke5aXkXwttA8UBdK1hVEaKLoqZHb7UEom4DP5SV+tFgADYd3poUaHt9Qd5dblQFMQBV+R+1x/0ZpYKevU60dOp34Yef8DdZs7zwesKDpW42g/bYBWE3meGVNibsS5Dx70ImbIRqM88RQpDvZF2o6+0cT153C7frVAnzF3QGaoSNvKT2zHV+qG87m2Nl2qdcmc6cRxh5b1+RHnogwShvWs8w0kOqQ4efBk/3FMlFZvy+mXtkTO2IqTAw4Un2h04Bik93NvPYCeSfbRftRuhCMYocrCQq5GxK6aZBksFhDZz0xh0oqXZo2OOjyIIShyfBjOS8U+rARh73rwNmqArv3o0M6AH3vTF71jowmKsSZNnfbpG10DV4F5vks9kBqE4begOnj6uGtolH/F+ZeuQkDbPtvJ3YSCfTIx4/8UEAcLNTRBTB3qgt/ULUhKnK5r1JrNuBIBRljCXREZ6i0hOicQ9S21larJ6jvVH0R474GQO+g7ktnZih790ulLBLr+8s=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?IaTHvsDPmswIi+GGKBjwjZo4dN+kBfe/vDgQEg53JIegIcC8REjfW3Tqyfil?=
 =?us-ascii?Q?mph49H4v2XlVhqZT+LwVxyuBoNNSZIC7cDJZ7fqnTCPSdlugE4oQO7qUG9aO?=
 =?us-ascii?Q?MFCkwJsattURxFenEg94Cij5P0FnrbmX+vK2fhiGFr1wvX0yiuV+TE8Gc2HE?=
 =?us-ascii?Q?bG2gwlQzRLi6t6Jrvy3/s1TlF1j6C0xLM/0m2rqscB3MorE7fURU9ll9vL5v?=
 =?us-ascii?Q?jVPxuEVUFaXtBEIJU/TAwpMUvEKTl6QhWeiNwRLIpAdJX37RXosyG/nm/xjV?=
 =?us-ascii?Q?c6YumlRoWkri5K+SyYbgw6yeSpgMYlLwdmvnNXsCKI5mSlH7VKre/SvEaukZ?=
 =?us-ascii?Q?djyBM0FXHT1ed9Qo0v+crfVTR6AQFpfCD35G68OAuyMUcrk9bQGqRVqCsYuO?=
 =?us-ascii?Q?9TTLDxo4d3Y3AF5tZgFWpGHmf8Z0ZN384bK2Q7eVYd/0Sd3SYPs6tWJPnZdr?=
 =?us-ascii?Q?kfQrgYwCngj/Y+OAYiyJkRuVAHWtBdfSVMaotIcv4n8E+7GpqRw1v8yLF+Ht?=
 =?us-ascii?Q?dRH7ZYooGOMFRziZUjZYi0Wk77M6odOvUK4zfZUX2T2W1EJ1QJE/qhMpOjNo?=
 =?us-ascii?Q?mbmKUK+nUljJoz9F9+7Wc0Scqu6fgXcjc+BT6s2Qr3hCHn2Fb+w9BQGry+Mm?=
 =?us-ascii?Q?SBmkZrXo3cZJb8JkenYKU6Ya8QHtBb09q5UBnPSd5tJAe2aP4ocS2cTTVznK?=
 =?us-ascii?Q?KFp0+P6I7rUPuCBC/Q7GvMsW+U/nvvPAVgvL4s1fr/s2viXFhg67+m+Lea6k?=
 =?us-ascii?Q?LT789ZPNHdAdrTbo2N42v5bAcRBe23uvH8TrWL+cY0Tm6Qo1jpYYX+dwdTNS?=
 =?us-ascii?Q?JxBC2Ws4nRzbgf/WlNcPQ6MDSXzbTTC3NcdJoy/00aYu6CjTX4f/rdzpRF9U?=
 =?us-ascii?Q?obF/36VK9AmUp+YOIoOkDbyOAp9ajzAAan4Vq4StcN+4FPJNVYESZ2uYED9z?=
 =?us-ascii?Q?h9nc5n9XsJuLDdCvPPomFiHqY5DK27Oo6QlnWls78tZ4uJr8cF3C2S3Nv9OP?=
 =?us-ascii?Q?P0+cBT6V+tVPQyYtPXUKQBK0sn+GaESaz36bCAAOgznEsCVkNGyFrz3GQKtU?=
 =?us-ascii?Q?yDSiBD91B1QTz32jdNN4E6fvOTFnu0UTQzesuaYq11OEebYlKaTCsa5jtNrM?=
 =?us-ascii?Q?JCUIo6CpUc6oP7TTGd1JrxrsCH/UszavCSjdLBbPo9k9ClhSMEF1eA2hSYlz?=
 =?us-ascii?Q?USSLfTRnCLpKxqNR5LV2uTEed1SQPAHPpTworb4IBYtke97se9B9PGttwb6s?=
 =?us-ascii?Q?/6E4aN1RftIhOmfsXb7+e6l5TVtl+beQPdcl4N7Sx+Tlf8MT5MdLXOLSA94C?=
 =?us-ascii?Q?jjxqcovdjkHI9HsJvO9rUVZqQW+4UvxGCsqy5VLUp9CTpXGp14EqvfypCgSN?=
 =?us-ascii?Q?apwIqEsHWOWzGhIe2uKCuCb6eAZqqRPPJi0jZDKHOO8GTTUijXAdoe7IxPzT?=
 =?us-ascii?Q?z6an77mFHUgqFGoLgabxq1mHHt8PIpkXZImYEyU19YY2hEh+hdXfh96ONvlR?=
 =?us-ascii?Q?7ix8vf6p7UpZz0QFkBapQDgGOpj0eyK9+AKTDCFaAOaWA9f98+4tzk++xk02?=
 =?us-ascii?Q?chKPDpNIprbWsSv3ry2Ep//H35Z6Iz6ehpOIiHFWBdbBhHZGXBHlUKc0n7AY?=
 =?us-ascii?Q?iHn2hjpoT7JeRS3+X/Ca7n5qWAjlCxj0Q7DgW00lHF8QKxIVaZ5HS08V/kvD?=
 =?us-ascii?Q?tCh3ZGOdFU3DzauyEv5AvJks5N04123ixuDhQsYiGHLnAMBL/nonrfN8kQ7u?=
 =?us-ascii?Q?HteSwtm0E9bzhvdluzhncYn1FAXOWUA=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: fcf41356-e54c-41b6-04d1-08de91c13d3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2026 20:40:27.5101
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 78vD23KgwLy+U2UH5FfwvhFiyccK6PY7CmafwSBjbFezt7Kj11c4vRzD7QvJ08cjlabBF6PWyN3WGB/MBhh+oIuxuYKqxn59JLH8pvpiylA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12354
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30883-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,glider.be,perex.cz,suse.com,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,TY6PR01MB17377.jpnprd01.prod.outlook.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A5288398347
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Kuninori,

Thanks for your review.

> -----Original Message-----
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Sent: Friday, April 3, 2026 3:53 AM
> To: John Madieu <john.madieu.xa@bp.renesas.com>
> Subject: Re: [PATCh v3 14/14] ASoC: rsnd: Add system suspend/resume
> support
>=20
>=20
> Hi John
>=20
> > Add per-module suspend/resume functions following the existing driver
> > architecture where each module manages its own resources in its own
> > file. core.c provides common clock/reset helpers and orchestrates the
> > calls in the correct order (reverse probe for suspend, probe order for
> > resume).
> >
> > Infrastructure clocks (ADG, audmacpp, SCU) are managed globally using
> > optional APIs to remain transparent to platforms that don't specify
> > these clocks/resets.
> >
> > Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> > ---
> (snip)
> > +/* Per-module suspend/resume */
> > +void rsnd_ssi_suspend(struct rsnd_priv *priv); void
> > +rsnd_ssi_resume(struct rsnd_priv *priv); void
> > +rsnd_ssiu_suspend(struct rsnd_priv *priv); void
> > +rsnd_ssiu_resume(struct rsnd_priv *priv); void
> > +rsnd_src_suspend(struct rsnd_priv *priv); void rsnd_src_resume(struct
> > +rsnd_priv *priv); void rsnd_ctu_suspend(struct rsnd_priv *priv); void
> > +rsnd_ctu_resume(struct rsnd_priv *priv); void rsnd_mix_suspend(struct
> > +rsnd_priv *priv); void rsnd_mix_resume(struct rsnd_priv *priv); void
> > +rsnd_dvc_suspend(struct rsnd_priv *priv); void rsnd_dvc_resume(struct
> > +rsnd_priv *priv); void rsnd_adg_suspend(struct rsnd_priv *priv); void
> > +rsnd_adg_resume(struct rsnd_priv *priv); void rsnd_dma_suspend(struct
> > +rsnd_priv *priv); void rsnd_dma_resume(struct rsnd_priv *priv);
>=20
> rsnd.h is categorizing definition for each IPs.
> Please merge above into existing area.

Agreed. I'll distribute each suspend/resume declaration into its respective
section following the probe/remove pattern.

Regards,
John

>=20
> Thank you for your help !!
>=20
> Best regards
> ---
> Kuninori Morimoto

