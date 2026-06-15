Return-Path: <linux-renesas-soc+bounces-34011-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id A6ZoB1PnL2oqIwUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34011-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 13:51:47 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D19685D5A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 13:51:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=S8SUyK1m;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34011-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34011-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D16D3301184F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 11:50:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6576F37DE90;
	Mon, 15 Jun 2026 11:50:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011058.outbound.protection.outlook.com [52.101.125.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADAEF33065D;
	Mon, 15 Jun 2026 11:50:39 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781524241; cv=fail; b=C1VYjDvEqduAznpNDyLWZI7R9K6TMUkuE6SI1NYNlX46nq6hXJkbxOkLaLYpGPMps9qwSl4rlu4K0xVKxOZuLogIJUmkmHU7CCaAMkbvWVPyjS9sLPIbBzjLaq3DNFMC1grKdOzb1G5oQWN42fh7GMzNFELYLiUDSbbUDkajctk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781524241; c=relaxed/simple;
	bh=YvghyFoIzdvDW4juRlzXtSMpyZTNZ7kKzhmqq0QQBuw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pOzEoNiAq+/HUdjKs3SD1v5vi0fHLLO+YnPG7mcVTh4ykrBTwyqH4Uaz7v231hYFol+NuYvbdLIzPw7Dj+fLzc5W6lFxOeluaTJd4K9ovyFfCrsQq1LiNgU5Cd7gZWWLIKj/D+e4vD0Hul0dJy0I+hO8sWEs3sDQ2aA1jGVMpXo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=S8SUyK1m; arc=fail smtp.client-ip=52.101.125.58
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t8tiYlzDdI5GDDyro1lgHWbjCC3O0y0CPtltKzJrXhd2B55gxTJNAVRX5pUKYNMadfNirQkcCnFf3Q5XPEqhparqfHa6M22G0Vb3MhaQbJxMGjdPJQGC8h4S1DKbpRnlkWHvO6WVcukEcRXD8o6eYkxkWDFlN8zjt2E55gSpdz3WE7zx5Eu5Mlt0XP8c0t1L8r2xfUGyGcO/EH0Gre7pqIUv4XniMsWENi/l1Y7VzLgU9tKR+5NuNfu440Y7ea6SOgwTP5OpOAMOxSs07fGrxEhtyE2XRj+414xoRtqWy/lvhSOPVQZBf7i/BljmC3QQXCWQyXqbVT394jjYAJZCKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YvghyFoIzdvDW4juRlzXtSMpyZTNZ7kKzhmqq0QQBuw=;
 b=mgZ97D08mYhcf6hMdjp/dXbIAKo3GHLdkpsRuBFG+y4slck3y9P7b6qc56p/SBjBS6oiRMXlDI+Pyt/qStC+ho0zI9GKsLdCr2LH7mszT9flRoeVk+XdQjoKRLuCrfvtBoSECMJb3rN8hbal5haSv+/lX+ehpUAjj605Q6ljVn9NkF8OXpWMvwubcCGjf/SIRasNDg1hBvkY7nfU8AOrVVYVYOBlZfPzCjSWvEugt5IXk59nvjDwk5/LY+2q+JID6LV9CXT7Ev5CcD9vlfahxqCVctmUU4oSuqsp7KAkE0FCMuoKro24swKVPU6PXdxYrYcxi6HaDS/Qpi8Jmeh3Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YvghyFoIzdvDW4juRlzXtSMpyZTNZ7kKzhmqq0QQBuw=;
 b=S8SUyK1mzXoohY0EyL7RNhUR5Em4dDCIlM/LrxL4XFTR/EJYNHQK1pT/e3ehtNxdIj2w/4GFnEGYQFCdm2qgXt7tMRRxIcroHAzP+yg4kifmIjB3AUcbb5+FzmIxk45tAPKhQoD5X5VvnJNj2udSquk3brUvdn6xhC3FvRVba5c=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY6PR01MB17860.jpnprd01.prod.outlook.com (2603:1096:405:346::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 11:50:37 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 11:50:37 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Claudiu.Beznea <claudiu.beznea@tuxon.dev>, biju.das.au
	<biju.das.au@gmail.com>, Yoshihiro Shimoda
	<yoshihiro.shimoda.uh@renesas.com>, Vinod Koul <vkoul@kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>
CC: Neil Armstrong <neil.armstrong@linaro.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-phy@lists.infradead.org"
	<linux-phy@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 09/11] phy: renesas: phy-rcar-gen3-usb2: Fix devm action
 registration for disabled VBUS regulator
Thread-Topic: [PATCH 09/11] phy: renesas: phy-rcar-gen3-usb2: Fix devm action
 registration for disabled VBUS regulator
Thread-Index: AQHc+ngaWA394/baeES91naIfR5habY/YB4AgAAHtfCAABvPgIAAAQag
Date: Mon, 15 Jun 2026 11:50:37 +0000
Message-ID:
 <TY3PR01MB1134684AA984BDC881C8A640A86E62@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260612143048.317907-1-biju.das.jz@bp.renesas.com>
 <20260612143048.317907-10-biju.das.jz@bp.renesas.com>
 <2b794049-0c44-4390-a6cd-e5bde5c5f3ca@tuxon.dev>
 <TY3PR01MB113466284D6307E1967286AC486E62@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <75976eb6-5837-4229-9faa-c77e058d1cba@tuxon.dev>
In-Reply-To: <75976eb6-5837-4229-9faa-c77e058d1cba@tuxon.dev>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY6PR01MB17860:EE_
x-ms-office365-filtering-correlation-id: dc47cc15-ed2b-49d4-663d-08decad45110
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|23010399003|376014|366016|1800799024|56012099006|11063799006|6133799003|5023799004|4143699003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 6cKlwoQzyiIRTo9ruCAjuXubbFVetHtXwDHMbtU0f4hLR8CQpmpKIb23IZs5AHZUIP8/Gg8RZE58cx+noJzOaiqh7nORiAEa3HyrFzpIBE+sKtyb62cdvDY5yA/5XY4UIY8W96c2hAPrjMQlHaJ0WBiVsYrUDIteM8BOwro1Fx8NolkSkZdHB4SdAOCWINIAf2Lxm1dryG579k7wn6lIBhGyI9twkYwztWrv79EhCxhCOWp5fq8MU+bHfJvm61PYCesBjZwhTN5Sf6FW63qNopigtmAifPSvVZhpW0+DUoJoV0uNYXIxGF0HwG+VEzkWUprcU3hiGTTvtD8QwZlOrFWjy/m59bwTqBiiNXLMsKGQ6e2QfUrp8OWwF3ohTWx+NG4dYyabM9560C9i1/ZOA5wVdxEJtaw7mKXAqXU6ClbFavKcFQkO8G6oHvhwmNoYDJDAJYMputGeWdhK1ZMh0KkwimqTh+frVfbV6wmiCvXZdAO0iNiPJAlEyWCAQWfHxNB/tk2aV7/Zaob2XLnVmJK9qDH4jfw9+wKCokTDe3AN2RU0hfBY5kJjemMQNEHpYqCqaUWyhVl+XhFxcnJ+8lbLx/aTVSveJg2i9GDEb76Is5Esq34SR1Zpl3HQQgk/PoYi9CaUu6p9eMuMUsQH6yeOPULVJpnKHbdggvMwi6sLSwQZTMUSsv2JKUC3sY8iMXyzqsJjUH5xoyqGczwh1nyCJsUaH5gjVZqaKj9CIQ98SUoat81ZN+WlnAJcM8PA
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(366016)(1800799024)(56012099006)(11063799006)(6133799003)(5023799004)(4143699003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SEQwcTNVV1RCMWJIMUpMVXptd3ppN0EvTlZrK1lLcG1IYXB3N3pGQ0lpQ0lw?=
 =?utf-8?B?SDVrVEFhOGcxSEtHV1VpWFFyais1Zk44emwzL2RZeWxvTmZPQStZMVNsTFJD?=
 =?utf-8?B?MCsxc3F1bmxkWUI5c3JWdG5maDgvc2hreEEyMFNwOWdrRnVPNTJnSDNiaG5S?=
 =?utf-8?B?U29jRVJESjJiT0E5Mm1mdXBqTzQ0aTd1VmQvdmdxbkFqeGxMYlBVUjgrT0NW?=
 =?utf-8?B?NzBURGlCaSt3NndOQm1VU1lYOUtCWFBycTdsT2NNa3hBaTU0NmpjS3g1eFd2?=
 =?utf-8?B?dzZqZmNTV1FXVy9hR0Q3TkhsR1BOdThIVXcxQmdvazQ4TkY4MXc5d0VHdVpF?=
 =?utf-8?B?SStjWjB3bjQ2VmlmTmVRY3pXb3l2K3lYbEJnQzlYRHdwSjl3Skl0V3R6akkr?=
 =?utf-8?B?N281TzVwdVQreWZrV0tKbHVaZTdkRCtuTWh4TFBrVGQyUW1tUmhBdlNPa3hq?=
 =?utf-8?B?RkpRclpSc0luWXNxSDRsR3RWNEUzWW1qcjhIOEZNcFVQOXhRanduTytYNkpU?=
 =?utf-8?B?VzZnN29ZMUFaTXhKR2x5dXRkSG1xc1Y5ck1GRXJHUEpsUlIwMHBxV2dpaXVn?=
 =?utf-8?B?V3BYamdWZnZHNU1Cd3FYTWpILzVQWUw1cUQ3a0NrRUpPcFRHVWRrY0FWR2VP?=
 =?utf-8?B?anVhcjlQSFVtWG43bzRNcW8vZkVzRWwxQ0VmZ1J4ZUI5Z1VTRERUTHMrNWll?=
 =?utf-8?B?N2RZbWN0dzZTam0wakxCOG5YUURHd01BWi9hS0NHUEV6czhadkYwY1UvKzZk?=
 =?utf-8?B?RSt1UkQ3ZU1UVkZVOWVPeVpRekdHRER6WlF6VkxQc21JWXo3VlVoUFRzNlpK?=
 =?utf-8?B?UmNaamtFdUJ3bUIrRE5tSWN2Q1IrbGNrY2xYR0lhVE1EcDFYWlc1QnhzQXVt?=
 =?utf-8?B?NVFhRDZLWHdBcCtGNmRzRzZMVjRJK1M0Zmt5Y0NyMHBISHFCUFgvSlFiU3pk?=
 =?utf-8?B?K3V4MTZyUEQzVU1JTmEyOTc2VXQxMHYrbHQ1QUROU1g1MURnMHJmYnJjRlFy?=
 =?utf-8?B?RWUvU0wzVlU5L25lZFU2MzExeWFDVnRlYzcwTFFka1B1akFlWFVHYzk2Ung4?=
 =?utf-8?B?aVcrSm1SNG1hV2t1ZDlhc1N6OGRKTzFDNHAweGxyd0tMaWVMT3U0MkRBN21x?=
 =?utf-8?B?N0ZhK29CRnJsUDlEUWdKeVNRdWVOMDRma2VOQm9vekNrWlhkOUQzS01kRm9W?=
 =?utf-8?B?bnkxK0xZL096MHF5SkZ5Z1BkeHZCUWtkOVFNbUVjeGVQYkdpejZwNDFPN1NY?=
 =?utf-8?B?MVdxNlRocG5BMjBJNHpVTC9jZFhFVWNzdlJBMENQMWlhaVJoaEtwMEpDQ2ZI?=
 =?utf-8?B?ckNKZjI2TEtSejNuTDFrK29rdXY4MVFZL2twQm9La3JqandUS0dENUJ3RHl2?=
 =?utf-8?B?N1FzVmh0cjlweGpiajZubGpDaTZ1NWF1YmNIVkNuZ003dDVhY04vMkZJV1hW?=
 =?utf-8?B?STB1ck1TOFNRMGNwcVJ4QnR2d01rUnRLbFhGbzlMTUNHbzlLdUt6Y2E4S1h4?=
 =?utf-8?B?NXlEYnY2VjNPN3QvbWpIdHdEOEJlK0J6ZDR2MVBVd21kWTNPSUVHMWtIakNv?=
 =?utf-8?B?dGdIdjJiWHF0U2wyNjZkeG1VWjlJejd3ZEl0VEk4aDUvU2JkaGhycm1DOFpi?=
 =?utf-8?B?alhLSXR5czVpTGI1bEw1blJMejllVjhTRTZrUUlOa2h0NjZlK0s5a1lVWG0r?=
 =?utf-8?B?WHRzN0REdlpYa0pPNk0wbjR5Wk1mOHJ5aFBkQjZ0ZUpZcVVvOVBLNGFCSkUw?=
 =?utf-8?B?NGQvWG1raWp5Z3l5bXBjbGl0QVl6ZU9CMGFwR1Y5NS9EQjl4WkN1bnBueThi?=
 =?utf-8?B?NHBJbWhtc3BaZXZFRE5TREZ6bVQ2N1hyMW00V0dRM1FzL29SUVIwbUd1RjBX?=
 =?utf-8?B?Q0NBUEZ1Mm45R2NkYm9sMjJtY2Z2VStjRGRmS0dRZEgyQkVIRXBWVnA1d3c4?=
 =?utf-8?B?TkgxSXlRWC9PYklER1A4T2xWRVVoYytIMGdFeVBaWkJMTGtCV0tVaFA5dW1H?=
 =?utf-8?B?K0pmR1ByYXBaRWlod3lQZkhraWhUNGVhNEdYUGZTVUpFV08vdlZIU09NVkJq?=
 =?utf-8?B?a29Zd2MwNlhlRGxSV3VBOTc4U00yN1BrNGhhUk1DbW9tV1kwQXFYb2E2b2R4?=
 =?utf-8?B?UXRiVzF1U3JocFhPejNDV0w1b01OTzZqcUlxSEJDemU5NmlXNnExQmttZGhI?=
 =?utf-8?B?T0tZUEIxc2lTTmdXSHdpbWxveWg2eTYzZzRhVElReFp4cUJDWEgwcVVHRG1m?=
 =?utf-8?B?KzNsU3h6M2lMMi9ROXVJejU2Zi81alpLZ1RRVE5ZY2RtNGxuVHpBdEhsMSsy?=
 =?utf-8?B?SUhYUEZyT3ZpUkx3UHVGb1grb0VoZ0VHTWZGdEtTbVAvVjJOcnI2Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc47cc15-ed2b-49d4-663d-08decad45110
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2026 11:50:37.4471
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LJATlAhnSoyH7LhKZ37lC78lblsapPBd9WpToHu30BK/T4mQprWCs2n+SXHmwJNRp4/QJmMlN1Sk8VB2FBlVuHy82mi+EJEROqCBybZtB/c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY6PR01MB17860
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-34011-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:claudiu.beznea@tuxon.dev,m:biju.das.au@gmail.com,m:yoshihiro.shimoda.uh@renesas.com,m:vkoul@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:neil.armstrong@linaro.org,m:p.zabel@pengutronix.de,m:linux-renesas-soc@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:bijudasau@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_TO(0.00)[tuxon.dev,gmail.com,renesas.com,kernel.org,glider.be];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:dkim,bp.renesas.com:from_mime,tuxon.dev:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 68D19685D5A

SGkgQ2xhdWRpdSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBDbGF1
ZGl1IEJlem5lYSA8Y2xhdWRpdS5iZXpuZWFAdHV4b24uZGV2Pg0KPiBTZW50OiAxNSBKdW5lIDIw
MjYgMTI6NDQNCj4gU3ViamVjdDogUmU6IFtQQVRDSCAwOS8xMV0gcGh5OiByZW5lc2FzOiBwaHkt
cmNhci1nZW4zLXVzYjI6IEZpeCBkZXZtIGFjdGlvbiByZWdpc3RyYXRpb24gZm9yIGRpc2FibGVk
DQo+IFZCVVMgcmVndWxhdG9yDQo+IA0KPiANCj4gDQo+IE9uIDYvMTUvMjYgMTM6MjIsIEJpanUg
RGFzIHdyb3RlOg0KPiA+IEhpIENsYXVkaXUsDQo+ID4NCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCj4gPj4gRnJvbTogQ2xhdWRpdSBCZXpuZWEgPGNsYXVkaXUuYmV6bmVhQHR1eG9u
LmRldj4NCj4gPj4gU2VudDogMTUgSnVuZSAyMDI2IDEwOjM3DQo+ID4+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggMDkvMTFdIHBoeTogcmVuZXNhczogcGh5LXJjYXItZ2VuMy11c2IyOiBGaXggZGV2bQ0K
PiA+PiBhY3Rpb24gcmVnaXN0cmF0aW9uIGZvciBkaXNhYmxlZCBWQlVTIHJlZ3VsYXRvcg0KPiA+
Pg0KPiA+PiBIaSwgQmlqdSwNCj4gPj4NCj4gPj4gT24gNi8xMi8yNiAxNzozMCwgQmlqdSB3cm90
ZToNCj4gPj4+IEZyb206IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4g
Pj4+DQo+ID4+PiBkZXZtX3JlZ3VsYXRvcl9nZXRfZXhjbHVzaXZlKCkgaW5pdGlhbGlzZXMgdGhl
IHJlZ3VsYXRvciB3aXRoDQo+ID4+PiBlbmFibGVfY291bnQgPSAxLCByZXF1aXJpbmcgdGhlIGNv
bnN1bWVyIHRvIGRpc2FibGUgaXQgYmVmb3JlIHJlbGVhc2UuDQo+ID4+Pg0KPiA+Pj4gUHJldmlv
dXNseSwgdGhlIGRldm0gZGlzYWJsZSBhY3Rpb24gd2FzIG9ubHkgcmVnaXN0ZXJlZCB3aGVuIHRo
ZQ0KPiA+Pj4gcmVndWxhdG9yIHdhcyBleHBsaWNpdGx5IGVuYWJsZWQsIGNhdXNpbmcgdGhlIGNs
ZWFudXAgcGF0aCB0byBza2lwDQo+ID4+PiBkZWNyZW1lbnRpbmcgZW5hYmxlX2NvdW50IG9uIGRl
dmljZSByZW1vdmFsIHdoZW4gdGhlIHJlZ3VsYXRvciB3YXMNCj4gPj4+IGxlZnQgZGlzYWJsZWQu
DQo+ID4+Pg0KPiA+Pj4gRml4IHRoaXMgYnkgYWx3YXlzIHJlZ2lzdGVyaW5nIHRoZSBkZXZtIGRp
c2FibGUgYWN0aW9uIHdoZW4gdGhlDQo+ID4+PiByZWd1bGF0b3IgaXMgZW5hYmxlZCAoY2hlY2tl
ZCB2aWEgcmVndWxhdG9yX2lzX2VuYWJsZWQoKSksIGNvdmVyaW5nDQo+ID4+PiBib3RoIHRoZSBl
eHBsaWNpdGx5LWVuYWJsZWQgY2FzZSBhbmQgdGhlIGluaXRpYWwgc3RhdGUgc2V0IGJ5DQo+ID4+
PiBkZXZtX3JlZ3VsYXRvcl9nZXRfZXhjbHVzaXZlKCkuDQo+ID4+Pg0KPiA+Pj4gVGhpcyBmaXhl
cyBXQVJOX09OIGVuYWJsZSBjb3VudCBkdXJpbmcgcmVndWxhdG9yIHJlbGVhc2UuDQo+ID4+Pg0K
PiA+Pj4gRml4ZXM6IDI0ODQzNDA0ZWZlNCAoInBoeTogcmVuZXNhczogcGh5LXJjYXItZ2VuMy11
c2IyOiBDb250cm9sIFZCVVMNCj4gPj4+IGZvciBSWi9HMkwgU29DcyIpDQo+ID4+PiBTaWduZWQt
b2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4+DQo+ID4+
IFRoZSBhcHByb2FjaCBpbiB0aGlzIHBhdGNoIGRvbid0IHNvbHZlIHRoZSBwcm9ibGVtLCBhdCBs
ZWFzdCBvbiBSWi9HM1MuIFNlZSBbMV0gZm9yIGxvZ3MuDQo+ID4+DQo+ID4+IEkgYXBwbGllZCB0
aGlzIHBhdGNoIG9uIG5leHQtMjAyNjA2MTA6DQo+ID4+DQo+ID4+IGdpdCBsb2cgLS1vbmVsaW5l
IC0yDQo+ID4+IGFmZTA5ZjExZDU0OSAoSEVBRCkgcGh5OiByZW5lc2FzOiBwaHktcmNhci1nZW4z
LXVzYjI6IEZpeCBkZXZtIGFjdGlvbg0KPiA+PiByZWdpc3RyYXRpb24gZm9yIGRpc2FibGVkIFZC
VVMgcmVndWxhdG9yDQo+ID4+IGFiZTY1MTgzN2NiMyAodGFnOiBuZXh0LTIwMjYwNjEwLCBsaW51
eC1uZXh0L21hc3RlcikgQWRkIGxpbnV4LW5leHQNCj4gPj4gc3BlY2lmaWMgZmlsZXMgZm9yIDIw
MjYwNjEwDQo+ID4+DQo+ID4+IFsxXQ0KPiA+PiBodHRwczovL2dpdGh1Yi5jb20vY2xhdWRpdWJl
em5lYS9sb2dzL2Jsb2IvMmYxYmFiMjA0MDdkZmU2MDMxMzg1ODE5ZmYNCj4gPj4gZWFiZmM0ZWFj
NzcyYmQvbG9ncw0KPiA+DQo+ID4gSSBoYXZlIHRlc3RlZCBvbmx5IHdpdGggUlovRzNMIGhvc3Qg
YW5kIEkgZG9uJ3Qgc2VlIHRoZSBpc3N1ZS4NCj4gPiBIb3cgY2FuIHRoZSBpc3N1ZSBiZSByZXBy
b2R1Y2VkPyBJdCBjb3VsZCBiZSByZWxhdGVkIHRvIFJaL0czUy4NCj4gDQo+IEl0J3MgcmVwcm9k
dWNpYmxlIHdpdGggdGhpcyBwYXRjaCBvbiBHMkwgYXMgd2VsbCwgcGxlYXNlIHNlZQ0KPiBodHRw
czovL2dpdGh1Yi5jb20vY2xhdWRpdWJlem5lYS9sb2dzL2Jsb2IvMDYwMTA0NDkwM2I1YWU3MTQ1
OTJkYjk3NzBiYzRlZDMxZmQ4YmY4NC9sb2dzLg0KPiANCj4gPiBJIGhhdmUgZXhlY3V0ZWQgdGhl
IGZvbGxvd2luZyB0ZXN0cyBhbmQgZG9uJ3Qgc2VlIGFueSBpc3N1ZS4NCj4gPiBDYW4geW91IHBs
ZWFzZSB0cnkgdGhlIHNhbWUgdGVzdHMgb24gUlovRzNTPw0KPiANCj4gVHJ5IHN0cmVzc2luZyBp
dCBhIGJpdCwgZS5nLiB0aGUgZm9sbG93aW5nIGNvbW1hbmQgdHJpZ2dlciBpdCBvbiBib3RoIEcz
UyBhbmQgRzJMOg0KDQpJdCBpcyBub3RoaW5nIHJlbGF0ZWQgdG8gc3RyZXNzLCBpdCBpcyBqdXN0
IGVuYWJsZV9jb3VudCBpc3N1ZS4NClVzYiBmdW5jdGlvbiBpbmNyZW1lbnRzIHRoZSBlbmFibGUg
Y291bnQgb2YgcmVndWxhdG9yLCB3aGljaCBpdCBuZXZlciBkZWNyZW1lbnQNCkxlYWRpbmcgdG8g
V0FSTl9PTihlbmFibGVfY291bnQpIGR1cmluZyB1bmJpbmQuDQoNCj4gDQo+IGNudD0zMDA7IHdo
aWxlIFsgJGNudCAtZ2UgMCBdOyBkbyBlY2hvIDExYzQwMDAwLnVzYnBoeS1jdHJsID4gdW5iaW5k
IDsgZWNobyAxMWM0MDAwMC51c2JwaHktY3RybCA+IGJpbmQgOw0KPiBjbnQ9JCgoY250LTEpKTsg
ZG9uZQ0KPiANCj4gU2FtZSBjb21tYW5kIGNvdWxkIGJlIGV4ZWN1dGVkIGZvciBvdGhlciBVU0Ig
ZHJpdmVycy4NCj4gDQo+ID4gSXMgdW5iaW5kL2JpbmQgZXZlciB3b3JrZWQgb24gUlo/RzNTIHBy
ZXZpb3VzbHk/DQo+IA0KPiBJbiB0aGUgc2FtZSB3YXkgaXQgd29ya3Mgb24gRzJMOiBmdW5jdGlv
bmFsaXR5IGlzIE9LLCB0aGVzZSBzdGFjayB0cmFjZXMgYXJlIGRpc3BsYXllZCBhcyBvbiBhbnkg
b3RoZXINCj4gUlovRzJMIGJhc2VkIFNvQ3MuDQoNCkkgaGF2ZSBpZGVudGlmaWVkIHRoZSBpc3N1
ZSwgaXQgaXMgVVNCIGZ1bmN0aW9uIHJlbGF0ZWQuDQoNCkkgYW0gaW52ZXN0aWdhdGluZyB0aGUg
Zml4LCB3aGljaCB3aWxsIGZpeCBmb3IgYWxsIHBsYXRmb3Jtcy4NCg0KQ2dlZXJzLA0KQmlqdQ0K

