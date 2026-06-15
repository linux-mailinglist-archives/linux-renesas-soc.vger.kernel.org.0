Return-Path: <linux-renesas-soc+bounces-33990-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 613JEpCnL2qZEAUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33990-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 09:19:44 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9E3684203
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 09:19:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b="Tfc8nDB/";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33990-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33990-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 561723003837
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 07:19:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EA6A29BDBB;
	Mon, 15 Jun 2026 07:19:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011041.outbound.protection.outlook.com [52.101.125.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52A5285CB3;
	Mon, 15 Jun 2026 07:19:39 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781507981; cv=fail; b=TYEbl313Z3i4Z/xHf9mQxA5fgtqeRD/2Dw5W7sA4FIFq7j1cV24kbeOZvWgg5R5Ah7TklS62sVP5IAP22k69aja39u15zooe9PyQn2Pc8y/cjHZEHwkM/YkCuvSlCG5EBaWCqpg7VW+xpRQfb8b3cH8l09qRRhUPKkwZj0YZvBQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781507981; c=relaxed/simple;
	bh=LeatldYkwl06pRK4xeRbtnp4FQTwBK5WFXtLxLPKT70=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SLvEg3MOzffe373/u/sRc8QcNPaO88Vy5ay0FRlqlRpEjyFhO78YG0wPpknU4F7B8sDt/nZqtr1Ud8Lqzj2UDMyIIfPOPFrIJsDezTO5Zk7zZF9I8NgDlmdU7QuGYXBLdXBzWCvEhXAzKs5tbPdgZn5glP1MFN+zapyQpZLhjUc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Tfc8nDB/; arc=fail smtp.client-ip=52.101.125.41
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=etRUWLyLY/SSns30Wo8EgW+hLKPHBGy7iSR2X3ShCHrlz/TQuiIJpKOMYCdXRe6FotjlIZ4NpORqPr4o/RonNj4rdO6P01uAdUsBJh5fNE7nhF/of8Us6E2Z5pbvop6U1+fG9BbDahOIeg7kmCquc1Fws5PEbN0OQ7m49lnJjrehyr2qf6monBbaoidBypgmncJ/iZT33xYUgmivZircwpC97WDzeFcYU5u6klxxw0KalpDyWdR1CkIWvcqqQJUdlrhPrl04wAYHhHdZ/ROYNBuucSzoB0oyYmguL8A6EWhK3yHttLRP2Pfu4K2LZpFz2kR9tnWwLOfnHlFN1XZQ4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ziX7jGn9HFjEwpE1oXiXxeIawbsHbux+GYaUAldaHcA=;
 b=PoKzDsuWN1sJomd4uYDaoGwz+tueXnNS6bFNAdjzKQ/OPBWIckVc3lRZXGWg9lHniczO8UiKd4qarneMrRntLBYp3o6Koz6cv5QQKQJ9wccBbbg1hJuodf0NLHpqNOiQPZVsZQtJSCnzr8ZNRHG3ocxP0fVY1pSmAl59T5VC/C+3oHU9RjSNIP9dLpxzUIRvgXj0SawWM04G5l6wtQslGi0pnWpncIdjmt8OPSWOvPFkoP9wXrhcr8RCugE9hJrvCowjdryP85vXkQbrH3SoZ1STXMXvgtrKjObHk/Az6EDjyeLHZOhAozRfYfi/cWK57SgXtqPxIeggvrGmEk4OgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ziX7jGn9HFjEwpE1oXiXxeIawbsHbux+GYaUAldaHcA=;
 b=Tfc8nDB/BwKmvZt3SB5qy7z08fPfHSMbL4yLG5U7TV0bPhSwZUDblT2aI0uGFvHq+R7kYoSBQcDMXvYGIdPT84ZGQXVDogrmuJ7yY9tIyVytdci5lVXR8Q3QWhgKO1c8OLri8fvWUU4AEY4TuTaRt3DEPxVZF5xkqcVbdNgZlG0=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB16442.jpnprd01.prod.outlook.com (2603:1096:405:144::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.17; Mon, 15 Jun
 2026 07:19:37 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 07:19:37 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Mark Brown <broonie@kernel.org>, biju.das.au <biju.das.au@gmail.com>
CC: Liam Girdwood <lgirdwood@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 07/11] regulator: renesas-usb-vbus-regulator: Add RZ/G3L
 VBUS regulator support
Thread-Topic: [PATCH 07/11] regulator: renesas-usb-vbus-regulator: Add RZ/G3L
 VBUS regulator support
Thread-Index: AQHc+ngY2Jyruw+3XUiruVSJamlZsbY7H6iAgAQZwqA=
Date: Mon, 15 Jun 2026 07:19:36 +0000
Message-ID:
 <TY3PR01MB1134685BD225D1030B2D804EA86E62@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260612143048.317907-1-biju.das.jz@bp.renesas.com>
 <20260612143048.317907-8-biju.das.jz@bp.renesas.com>
 <aiw2sePsgDK2pDdN@sirena.co.uk>
In-Reply-To: <aiw2sePsgDK2pDdN@sirena.co.uk>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB16442:EE_
x-ms-office365-filtering-correlation-id: fd84afa8-8392-4d64-ce1c-08decaae7516
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|38070700021|18002099003|22082099003|11063799006|4143699003|56012099006;
x-microsoft-antispam-message-info:
 aFHYvQ9wb59cZb0uljcIl0su9KQhZkiSKHIYSyJ232CMoCr+zzfFXWB4qakTPjHEtYZ3+T/RFB144sOTp6XoWD2Qd/NLa/OBq49Y8mxy7hSjAtfJArzblJyogdFoRkMVi1of04sz9nM/2MeQuWrJ5+C97X04sj9DkyLzsMdQcV9Jq+2Bex3Eu2o3SHwoFHc6c7AZy7ZgwJTxkTik4lsQasr0/3mnCTsE+KOPcl7tOyiD3yFr/SBluHwRRtz36SxuMWYvzxZ5/SrsOgUO2dqRjyRFduBaM1aRrookBaEg0hwvaiIceUR/fJSFGqJgwUMoPtprUCNazot3IP4iB90BifVLMtSGbQB/UhYoWWDQdQFbbifhpY/97c7YwuCFj3LhwR9xBGMNmt9BUe5eypOrQe6GHgTlayqg4k+tNnydrPWCI1KOtjT8Sy9PrdqSCIi8Z2KlcnzSlWmrZUOYV9V/Aw+REIVti1s4aaLx37OZoiLRZ2SOXnQjg6AIT/5QY53neY8IgDWy+cOG2v5zUAcU1gK+Iizhq8QQdCfgDxqWYlaexJ0D7tmlC/Ql9fUW8kWavjjRPkklKmvV83ege2YpHNxu/Mt7ctHKlTumoz7SmQ0+KMkxrbaRuUu5nDrkSKy/hSmVosEFHwNQveRWiqSB7CMzfVW/U3qHKti+3pn/yK6jAmw0FVDgTKCn6naCdOBU7vCB65Nuxlgm6C0QxpkT0twGFFJtGhPz+Jwr2LT3aWQWG+Z0zaGFCHVwPsxSciq6
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(38070700021)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ehrVFgPaFJYegfUMWyjupmy9/zA/hqmGb2ATPR2x1lCs2E+LH2qD+yn8GObl?=
 =?us-ascii?Q?66EaGFP+yt0W/WqZGDI4eHpcepY44g0SpdpfW0CC7wjMLXWVLOHDsCnojjJE?=
 =?us-ascii?Q?MafAsbSpdfvF/+e0UTJLdbfpZIUeQUXyMs/VOr8Lf3JcVAsmGvXR4Zl4zdyB?=
 =?us-ascii?Q?aDkTqU+FXiGDAW5EBBeZrGAkcbS0+KIR/UUrBRe823jM94wNsYEE236SiKci?=
 =?us-ascii?Q?ln+kVU1+jkDnAacqzA3cUG3cpJz+T7KyFNHXWLYWeo7E4dK/duvB8vNC5APW?=
 =?us-ascii?Q?5s5KstaaKwYQljC43gD1NKcSgYnf372q8qEhR4ytF4iXgW0kRFQ9BprnFGUY?=
 =?us-ascii?Q?RH2gzai1bruKfpvZ9RUnzjp4pOu/nzfvq2c0x3sGywfbbPSssv0t3CvvtiMx?=
 =?us-ascii?Q?Yd/ecNpOv2XVGIlKKc0b9g2cTka53UObwY6tX1P6TYxVdIL6R2EW6KUi2gUN?=
 =?us-ascii?Q?/fC7NzMR1pVJvWrrv8sLVM7peOJnkuBaw3P9OC9GGobQrYRf3Cq0K0JyPN+W?=
 =?us-ascii?Q?X2vEg4DUhyHr5BW61XMZ8Gkne0HbSaYNNcK8D4SmfmnhwQP9fMaEYYw/3mFr?=
 =?us-ascii?Q?tpiUdy4qAabd7/1/I6684NTPyxbPzEfvdOwcuOSuxn8IpD2G3kUpz6rS/UtO?=
 =?us-ascii?Q?ShwboeaPqSQiXLijqqdn7BL69awbzgftSCLeSBTMAIjlHfpNGgkD6n4W835B?=
 =?us-ascii?Q?gDFd7a9VirPtK2NEaWEcN+p/HsnJ0CDNQMP7HubwSxBLsagwv0GoDM2Wnb5Z?=
 =?us-ascii?Q?GGTPEW1nrFr/GiLuI/DxLKP1fKdVJ7/DqvNMtCy6YHqMpXjqQXNAqtgn0iWd?=
 =?us-ascii?Q?XAXdlHkHOaL7vjWWlD8/NrG7rRXied9Mk2N2mJWCVD8fG0QWrBoOtAqYiDat?=
 =?us-ascii?Q?QofeEh2ZykUqvvNuoOxDmKMkriRNWFKscnsQN+H9iltQup0S3mFZ2E9+ep5b?=
 =?us-ascii?Q?VI0eAUrS2Zml4+FjAFeB2VqO4IE619EmZ9U2JcaoeMWwaq/5CMcDAxIZUdfL?=
 =?us-ascii?Q?UQMzK+P3xGA7lkB0qnUed6jMrcVRjF11NlX0r0xyYZn9jpLNWvKNMXafItlM?=
 =?us-ascii?Q?2ds0XWMpweLmgBwQUvZgyZppfBDnPpaXcLF/ypTNkXV9TIbB34PcP87U4m3U?=
 =?us-ascii?Q?PTC8y+JjwZRcWKvRWcRdRSRhn4TCFE52N1S6E8N6bIQTPOe1+hXYjJbml+7b?=
 =?us-ascii?Q?bSV/i0RxsgnAs2rFaxL7ccGmF5Ugs63M117YPRwwKI/mCYPIRth+NNta09hQ?=
 =?us-ascii?Q?VGG2BRYS/1EDb4G+86ylTNYlynp1bPV3Byt7p+WPnXLS6772UEOvDTKHpv+s?=
 =?us-ascii?Q?IY3FT09jul+FD7KrvtUL+P+iiA/wwAONsPfEO3/lsTFGIRoO6i6Qwh282NH5?=
 =?us-ascii?Q?L+HvXImrGXeGK2Zc3NocJlrcpb+xCfZQFN1iXbeQxlhMSCp7gxTuszcHGsOp?=
 =?us-ascii?Q?5pHBw/9O5NXu9nqwOkAFhZtxLeXRxLf3lVyqyV4dSiKQaHYwJinZELke2Agf?=
 =?us-ascii?Q?mb2RYqs204Z+1LNeJINTOBtV4lvK1GPBTgVzzEkLmPHvHgqo7gpdZLP0pB8c?=
 =?us-ascii?Q?3tJQS/WeC6++HY2ZqdoT9CVSuXagt78kzMnmvfHoRw5Is14EdvKmR/ddZEoP?=
 =?us-ascii?Q?yIUcva/TkmDt4/HZrGIzvSyfW7yqGi6ZJ7og5kGpEcNSfXLp4V6OTQbTBOVz?=
 =?us-ascii?Q?wLUEJMwP+dZMIvBjb1FskguA/PpdXCLmoSZGPX3bnexokgLkfQ5F2eya+K7v?=
 =?us-ascii?Q?Ys+iD0dsvA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: fd84afa8-8392-4d64-ce1c-08decaae7516
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2026 07:19:37.0681
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: arPhvvkmSHhyXNfFeKt6JXgiMX/o8e2Odxxnk5ME+zzC6lecBRXZ45wsJLG0DjWbXPtag1eNu9m+r1d4e2/WVUNjFrjdMIipcrLXj7/OGUI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB16442
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33990-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:biju.das.au@gmail.com,m:lgirdwood@gmail.com,m:linux-kernel@vger.kernel.org,m:geert+renesas@glider.be,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:linux-renesas-soc@vger.kernel.org,m:bijudasau@gmail.com,m:geert@glider.be,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,glider.be,bp.renesas.com];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DB9E3684203

Hi Mark,

Thanks for the feedback

> -----Original Message-----
> From: Mark Brown <broonie@kernel.org>
> Sent: 12 June 2026 17:41
> Subject: Re: [PATCH 07/11] regulator: renesas-usb-vbus-regulator: Add RZ/=
G3L VBUS regulator support
>=20
> On Fri, Jun 12, 2026 at 03:30:35PM +0100, Biju wrote:
>=20
> > -static int rzg2l_usb_vbus_regulator_probe(struct platform_device
> > *pdev)
> > +static int rzg2l_usb_vbus_regulator_common_probe(struct platform_devic=
e *pdev,
> > +						 bool multi_regulator)
>=20
> This multi_regulator thing feels not super scalable - it might be better =
to pass in a pointer to an array
> of regulators.

Agreed, will pass pointer to an array of regulators for scalability.

Cheers,
Biju

