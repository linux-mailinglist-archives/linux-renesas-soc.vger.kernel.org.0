Return-Path: <linux-renesas-soc+bounces-31983-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ECQBNA9e+WmY8AIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31983-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 05:03:43 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBBD4C617B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 05:03:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B8758301C965
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 May 2026 03:03:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22AB5365A1A;
	Tue,  5 May 2026 03:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="IgkIE5bx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011024.outbound.protection.outlook.com [40.107.74.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA10120C00A;
	Tue,  5 May 2026 03:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777950219; cv=fail; b=KDCjuwwTMtcB7RDIMh6xRT+w8wm7ZYlG7zkFXD0k+5czQ5xCC/n66hg8Va6TX/k1wkQRgIebirjhBCTPomH6Kx97/PorfYv0KPNP7vBKr+MBK20et8+aze16PfOKFrsoJVC4Qd+ecIYPPsc5wRwqzN0xgL9lJ4BgBdj6vjrHfSU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777950219; c=relaxed/simple;
	bh=kuQ0tvSQpmmlAptPvpXzkEjnC+tHa1FCo+P2iKl8xH0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hd1s+9h9+wpXhl79zvgahb6+NV1AR+qt6oWzgrpg/c7viQ8SoffekGX9S7CmTW/3t0FNlHhSShyvgpEW99SZaD/zs1lT6Y4WIgGEWzFjugBYSogPO8OLuFMn3yK9PAIuWS/us16Xo9+OSb351DX3RBYlTyN2FEedhhfNdW8TT8M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=IgkIE5bx; arc=fail smtp.client-ip=40.107.74.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SKm+XWKvLRxODYGpElKQeFCIkWy16kIrkPcIKM7Qm9+z+SbtEKNbCTvaGKapdvPUu9BnCZL7hI5xmJ2tgV0s0gouq1Pqymzs/lt9jPl7EiRPWTltrm+Uo4dujJLpSzoucpNs+syPEsK9Cl+wxNa+J8hZ0VpyX2lwzKshv5uW8/wS9V2TuK4eP54xfig3dWq6XmY51foPUZ+8mDkWHfSHw/xiT63Uz7X5m5gqoW+DkPkOWxGsQ6x8MvYjUMhi8+OscKNdEFWUZh6XwGjYHB1q25GMoIA43ejcsaZMA1Dr1yJG9savkPwDRx1DlUP8MtIycyqhRbj0oNn1iqkERw2RzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kuQ0tvSQpmmlAptPvpXzkEjnC+tHa1FCo+P2iKl8xH0=;
 b=M+yr3Hm0Qvj4xzIf2Ohb0TtdKI6Ht6fcJ/MCZCOMSgNXAwMSHp4eHSbRFcpU7yjRfD6nRTcIMP6FXxNSX2hx3bZkN2aEbLensajBxvDxnXXHnjw3Sg/YwQq7/xJ6EzuLvz5apY3SualfEvevdMnWsJnvbdnYL4seGc6fHeV+/u9lLJMuT8d85t5zrs0sSuedt+K++Kc6gjtzqrEVVef8g3d1gkc5qP5J+sLiAgLX4c2+S9pyk5cEJBxLoSy7R+QrjbJvhPgtG7+UTalQ1Tvhwn/D/gjLZqiD43EFKtWqfo3Vl7jTrcQ8Lb/v37QTKCx5OoPO/lYS9SCy1JGy00wqBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kuQ0tvSQpmmlAptPvpXzkEjnC+tHa1FCo+P2iKl8xH0=;
 b=IgkIE5bx3UV9CKn6KIdRfgKYP7F4KWqrKkzU39+UO5WTMQgT4J1rWwp8EkzTOj15tsCfz/2gG/6Z0Cx0/NzbPYQeMgmiRj5mg9zG+T95yhRXTnhonQRQWW0v/YxjGeCN44agcpRUBQJarhh5PeBBpwaU4DR8m2CbLhq07zJqt+g=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by TYRPR01MB13880.jpnprd01.prod.outlook.com (2603:1096:405:216::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 03:03:32 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 03:03:28 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: geert <geert@linux-m68k.org>, John Madieu <john.madieu@gmail.com>
CC: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
	<broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, Geert Uytterhoeven <geert+renesas@glider.be>, magnus.damm
	<magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Claudiu.Beznea <claudiu.beznea@tuxon.dev>, Biju Das
	<biju.das.jz@bp.renesas.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v5 14/14] ASoC: rsnd: Add system suspend/resume support
Thread-Topic: [PATCH v5 14/14] ASoC: rsnd: Add system suspend/resume support
Thread-Index: AQHczNYWvJ6dflWznUukfBK1QfSn17X0WP+AgAAGOPA=
Date: Tue, 5 May 2026 03:03:28 +0000
Message-ID:
 <TY6PR01MB17377D007DA848590B1274F4DFF3E2@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20260415124731.3684773-1-john.madieu.xa@bp.renesas.com>
 <20260415124731.3684773-15-john.madieu.xa@bp.renesas.com>
 <CAMuHMdWnZhUeY+498Ot4wCjRKM3YEpq9C1vcqbyKe=_Rt4O3Aw@mail.gmail.com>
In-Reply-To:
 <CAMuHMdWnZhUeY+498Ot4wCjRKM3YEpq9C1vcqbyKe=_Rt4O3Aw@mail.gmail.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY6PR01MB17377:EE_|TYRPR01MB13880:EE_
x-ms-office365-filtering-correlation-id: a61c9360-64fd-47b5-abb7-08deaa52e1cc
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|18002099003|56012099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 upccggU5TvXEh0O9oaT6PSWwqdd1/vY6t5xqDtg8HsHsTAvRXm/ddya57dudOa2kDwMXB4IYKN1Ma0YnwqpmpuLbxl7r1WSU6pPwzvtULZtnUNtiJ+jZppUxsO69g+rBD/8Nto2oBg3XO4jABtkQHvUUzIctNs3MxKhPBoIh/l5sF/VjpF05MKVDCIQVkUMvop0CQ43oqVz7qVlJ9AAg1DOx9cTI3WBpTZONqpfqI9LpQAWVuircodbImtw/If+5SVxYGNVXs1I+uiVBrVJcstkiU+sBdB9id3rHbNzUt7XNeTn/FVsZIyJIIi+IOvNz6lGSjY18ULm8UR7J+x8X4GLv1X6/cxEFRb8lXHYbqeP32H7LuAZbzF8ezBGNwb8wncrEQBtl42cnZIvrFaTgjxDFlrDTodil840GyuFOi2GgIiAFkeNOtMb4+kxHhEUlKZiqda5rPiJT7W9YQgq7lQcSrYDaP7SE/gdSZ7TpEQ9rvBanB02QtrE0qAPgDTmNrWb9E5cX2DAMABe4s+aqCA6hcMpz+MBwNWnZoAfNf7jtU19bwa25TS+mx+7G+MaWWK4meK1qVYV5Sp+lUJZasGgzmPUcf6YNiOF0lMIvOJRh6PFG2SImG9I/bQMpTC0kNuK+GXhEuxHtLazlStaQgUJZGp68zfcd2rMBtdTYz8Hqy0LBGA+Jui/OORBIdUQAfHL9uf+XuYDc+MO9tOsy/DPivklne9Mh1frKyiEyhuWPSLdRLq11hsYRMTfZ+eDO
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(18002099003)(56012099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?anJWRnluYUhMN3lLeW1NUm5IdEVBNGVRbFpRVnZ4b0RpRXdGZUcveWU3Z2Jw?=
 =?utf-8?B?STNhUDJWTEVsdnlmcWN6M0hCa2pDL0N2RW9zWnVMR1lqdDhySW1WTlpGMGRq?=
 =?utf-8?B?NHY0cys1Mm4vUG92enRvU2ZMTURDR1A3dXlxQXJja29UWUNMc2lLTmM3Vjdt?=
 =?utf-8?B?RzF6OVN4V282NktLVk5qcmRkTU9uZzhPUFhMZHhIZWhJTGJsZGdGNHg3UFVC?=
 =?utf-8?B?U0FCL3dqV1BXUmRsVmpYdkN4MEhRa3B0ZzlORm0yNjZmaHIvUDlLNkY0YzJF?=
 =?utf-8?B?SDk2RVNOZHk1c1dxMHVGdFRsa3JOK2dZV0NtL21iNS9yTmg5UnRYZlMzRDla?=
 =?utf-8?B?elJId0FKY3F2eVJVVzFKRmVQYk9BQ080TGJUakdvYTlaK0xYeFRJRFRIenVV?=
 =?utf-8?B?S1V6bHEwMHRnanRsUVVGZ056YzRrUHErRUZRRERPaXhMWDJHS0xkbkdzYktP?=
 =?utf-8?B?ZDV2MGp4ZVpMRWYxanRyTndRR0diOU1BSk1Qb2x5UWhib1UrUlJoSENZcjEx?=
 =?utf-8?B?cERLVCtJOU1kYVdxS2dwQ0NJY0MzcXRhc2txc3FNd1JIeVAyYmRJd0Z4YjVO?=
 =?utf-8?B?cGlUR2wyNFlnV25OcXFXNzRGTG1tUlU2YktkdHRWOVhHa28rdVJqSHZUM1p4?=
 =?utf-8?B?WFgzdURRQXVsM3NDVnhsOW5qc3NsWnlWamUrYlhTaElzSiswUTVqM3Azd09C?=
 =?utf-8?B?NG9UTVBJV0M0YlJZSEhxRG9naDh0UitrTzJyQTE1cG5uOFo1T0dnVW83WExi?=
 =?utf-8?B?SDBUM2Q2bEpMaGY0US9xSEF3UDFJRE5UMGJsaHk3RUZPUnZNY0ZoSnRFTE5C?=
 =?utf-8?B?M3RVbWpMZ24welpVRXN6VVNrcHc4ZW1rNkduby8wSjlwc1JjNUhnSGk3SjBa?=
 =?utf-8?B?TllKK0xMbDhKbTZnRElKK29ReTVqSmdtbEZoUGdIdzhmZGtDbWcrZ0UzQlRT?=
 =?utf-8?B?SWRQbUlBTi9id20vTjM1R3dlWjFQSUZ6YUhSbStGRnhlNHZ5aERHcGF2OTRj?=
 =?utf-8?B?MVlOK0dFa1UxQXpRdHUxWmtqMHBiWVArYzF2Y0p4WDNCVnZTQUx6SXZ3cnRo?=
 =?utf-8?B?ZmNKazZwMmd4eFFSclVKMTkwa0l6KzdYVzc2ZHJaaDdxZ1V5SGp6Qmw1YmN0?=
 =?utf-8?B?Z1pFTmVtektrcmNTL2dUNmc4di8rNFJVSS85TU5Ra3dRUUJFUllndW5FL2N0?=
 =?utf-8?B?a09pOHYyV2RuQ0dBYi9udkJJRm9zelVzUytibGptMWVBblo1RzNKZk9pSUI3?=
 =?utf-8?B?QUppQk0walplMUhoU3MyWFJ2bmNFejAvbDNqaWVUQ3VkZjdSRW1sZEpqdkQw?=
 =?utf-8?B?cjJUK0dPS2g5YVBZSzI2K1BHMTc1OXgwWFBES2REYTZiRitRWnlRSnFHNklD?=
 =?utf-8?B?RlAwSFQyRDJoSUVXRUZlR1VkVzYvQlBjWEhHTXVrR0M0YmxvV0lJRk1tajBJ?=
 =?utf-8?B?N1N3YnVBb3pwQjRJaUs2dVZyNmxIcEtyMnI2NGJrbStHVnNmMVpKTTdnZG85?=
 =?utf-8?B?c080Qjhha3BLVUxOc0tIZUNUbFhCdjYxcFAxMjNrWGc2MHROR2MxbXlVS0Zw?=
 =?utf-8?B?OURVd09NWTJveW1yRWFGUHJUcHBaOHBRbVhOejRlQlIyekNON0paYTZJaU92?=
 =?utf-8?B?SUNtQmtSVnhoK0paVWZCY1lST1I2L3lFMlR2ZHVSVWtISEdCSUNRTHVyQTlq?=
 =?utf-8?B?SFhXU1RpSE9rL2dSUm52akdoTUE5RkIwSmZteERaV2kwNThTazllRXNPV1Q4?=
 =?utf-8?B?bjg0aTRmRmtqck9lUmlHZG8zTU1Pdlh5L2pTU2J0TDFyK1FkbXRucHNBN090?=
 =?utf-8?B?RVlrSFJrNng1Q3BFaXQxU3c3RWk1L293T2tKZUdjQ2ZzSUc3dGNhZnFvb2Z0?=
 =?utf-8?B?SmRZdGR2L2lubVpOczdIMWJiZFFrNHpYblNwK3BUSDk4U1VDTmE2eWRnTEUy?=
 =?utf-8?B?UXFkS1JpbE1JbnNFZlpTQngzY0NQSmZCaExTaTNsdnF3eU1GZTVoNW9nTktQ?=
 =?utf-8?B?d001M3hiNmdURW9KZ2VYb3Z5R2VHMUpwVzRnSDJrWFYzenZqdzF6aW5Hamhs?=
 =?utf-8?B?QzNmbEhwemxVbGVkWTVpWU5ZdUtqZUdBbDdpTkJLUm1MZjVvaDJtc3dDMS81?=
 =?utf-8?B?RmdpdXZKUXVrWUcxaUhMWjgyZWhzWmVvOStoZDlpelFwa254dE5FNWlkNE5H?=
 =?utf-8?B?NWR6NVd1cnJxOTI5MnV6UG0ycnpnaTJXRGRjQSs3aFhNblZ1ejdyY21TQXNS?=
 =?utf-8?B?bDFKeUxmSUxkYXdqZ29XQ3ZlL0tlWmxaY3NENzhpZ0VkWExyQlU1Mk5BaUFv?=
 =?utf-8?B?NElqaHpvVzRZY0dUeEw1WGNKeGgzeWdIT3RIYTBTUTA3WVBOUTQ1TGhsaGhF?=
 =?utf-8?Q?7S9aYJJvE0DWPBzQ=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a61c9360-64fd-47b5-abb7-08deaa52e1cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2026 03:03:28.4878
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DZQTT11FDK8W7mJTOgiMfXwO7K0M7Wvsgv0wUn1yoZzGzG007IrTR+sGTk7Nwgse3pLeVODARDWUK/A2kCYbyRLTLpv/QekqlECJCLhT27M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13880
X-Rspamd-Queue-Id: 0FBBD4C617B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31983-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[linux-m68k.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[renesas.com,kernel.org,gmail.com,perex.cz,suse.com,glider.be,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-0.994];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[]

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgeW91ciByZXZpZXcuDQoNCj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhr
Lm9yZz4NCj4gU2VudDogRGllbnN0YWcsIDI4LiBBcHJpbCAyMDI2IDEyOjI1DQo+IFRvOiBKb2hu
IE1hZGlldSA8am9obi5tYWRpZXVAZ21haWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY1
IDE0LzE0XSBBU29DOiByc25kOiBBZGQgc3lzdGVtIHN1c3BlbmQvcmVzdW1lDQo+IHN1cHBvcnQN
Cj4gDQo+IEhpIEpvaG4sDQo+IA0KPiBPbiBXZWQsIDE1IEFwciAyMDI2IGF0IDE0OjQ3LCBKb2hu
IE1hZGlldSA8am9obi5tYWRpZXVAZ21haWwuY29tPiB3cm90ZToNCj4gPiBBZGQgcGVyLW1vZHVs
ZSBzdXNwZW5kL3Jlc3VtZSBmdW5jdGlvbnMgZm9sbG93aW5nIHRoZSBleGlzdGluZyBkcml2ZXIN
Cj4gPiBhcmNoaXRlY3R1cmUgd2hlcmUgZWFjaCBtb2R1bGUgbWFuYWdlcyBpdHMgb3duIHJlc291
cmNlcyBpbiBpdHMgb3duDQo+ID4gZmlsZS4gY29yZS5jIHByb3ZpZGVzIGNvbW1vbiBjbG9jay9y
ZXNldCBoZWxwZXJzIGFuZCBvcmNoZXN0cmF0ZXMgdGhlDQo+ID4gY2FsbHMgaW4gdGhlIGNvcnJl
Y3Qgb3JkZXIgKHJldmVyc2UgcHJvYmUgZm9yIHN1c3BlbmQsIHByb2JlIG9yZGVyIGZvcg0KPiA+
IHJlc3VtZSkuDQo+ID4NCj4gPiBJbmZyYXN0cnVjdHVyZSBjbG9ja3MgKEFERywgYXVkbWFjcHAs
IFNDVSkgYXJlIG1hbmFnZWQgZ2xvYmFsbHkgdXNpbmcNCj4gPiBvcHRpb25hbCBBUElzIHRvIHJl
bWFpbiB0cmFuc3BhcmVudCB0byBwbGF0Zm9ybXMgdGhhdCBkb24ndCBzcGVjaWZ5DQo+ID4gdGhl
c2UgY2xvY2tzL3Jlc2V0cy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEpvaG4gTWFkaWV1IDxq
b2huLm1hZGlldS54YUBicC5yZW5lc2FzLmNvbT4NCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBwYXRj
aCENCj4gDQo+IFRoaXMgY2F1c2VzIGEgY3Jhc2ggb24gR3JheSBIYXdrIFNpbmdsZSAoUi1DYXIg
VjRNKSwgYnV0IG5vdCBvbiBTYWx2YXRvci0NCj4gWFMgKFItQ2FyIEgzIEVTMi4wKToNCj4gDQo+
ICAgICBVbmFibGUgdG8gaGFuZGxlIGtlcm5lbCBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2UgYXQg
dmlydHVhbCBhZGRyZXNzDQo+IDAwMDAwMDAwMDAwMDAwMDgNCj4gICAgIE1lbSBhYm9ydCBpbmZv
Og0KPiAgICAgICBFU1IgPSAweDAwMDAwMDAwOTYwMDAwMDQNCj4gICAgICAgRUMgPSAweDI1OiBE
QUJUIChjdXJyZW50IEVMKSwgSUwgPSAzMiBiaXRzDQo+ICAgICAgIFNFVCA9IDAsIEZuViA9IDAN
Cj4gICAgICAgRUEgPSAwLCBTMVBUVyA9IDANCj4gICAgICAgRlNDID0gMHgwNDogbGV2ZWwgMCB0
cmFuc2xhdGlvbiBmYXVsdA0KPiAgICAgRGF0YSBhYm9ydCBpbmZvOg0KPiAgICAgICBJU1YgPSAw
LCBJU1MgPSAweDAwMDAwMDA0LCBJU1MyID0gMHgwMDAwMDAwMA0KPiAgICAgICBDTSA9IDAsIFdu
UiA9IDAsIFRuRCA9IDAsIFRhZ0FjY2VzcyA9IDANCj4gICAgICAgR0NTID0gMCwgT3ZlcmxheSA9
IDAsIERpcnR5Qml0ID0gMCwgWHMgPSAwDQo+ICAgICB1c2VyIHBndGFibGU6IDRrIHBhZ2VzLCA0
OC1iaXQgVkFzLCBwZ2RwPTAwMDAwMDA0ODc5ZWQwMDANCj4gICAgIFswMDAwMDAwMDAwMDAwMDA4
XSBwZ2Q9MDAwMDAwMDAwMDAwMDAwMCwgcDRkPTAwMDAwMDAwMDAwMDAwMDANCj4gICAgIEludGVy
bmFsIGVycm9yOiBPb3BzOiAwMDAwMDAwMDk2MDAwMDA0IFsjMV0gIFNNUA0KPiAgICAgQ1BVOiAw
IFVJRDogMCBQSUQ6IDY3NSBDb21tOiBzMmlkbGUgTm90IHRhaW50ZWQNCj4gNy4xLjAtcmMxLWFy
bTY0LXJlbmVzYXMtMDM3NTYtZzRjZjQ3YmMxZTNkNyAjMzU3OSBQUkVFTVBUDQo+ICAgICBIYXJk
d2FyZSBuYW1lOiBSZW5lc2FzIEdyYXkgSGF3ayBTaW5nbGUgYm9hcmQgYmFzZWQgb24gcjhhNzc5
aDAgKERUKQ0KPiAgICAgcHN0YXRlOiA2MDQwMDAwNSAoblpDdiBkYWlmICtQQU4gLVVBTyAtVENP
IC1ESVQgLVNTQlMgQlRZUEU9LS0pDQo+ICAgICBwYyA6IHJzbmRfc3JjX3N1c3BlbmQrMHg2MC8w
eDk4DQo+ICAgICBsciA6IHJzbmRfc3VzcGVuZCsweDQ0LzB4NmMNCj4gICAgIHNwIDogZmZmZjgw
MDA4MmUwM2FiMA0KPiAgICAgeDI5OiBmZmZmODAwMDgyZTAzYWIwIHgyODogZmZmZjAwMDQ0NDAy
MmFjMCB4Mjc6IGZmZmY4MDAwODE3ZDkwNTANCj4gICAgIHgyNjogMDAwMDAwMDAwMDAwMDAwMiB4
MjU6IGZmZmY4MDAwODA3M2RkNjQgeDI0OiBmZmZmODAwMDgwYWIwYjIwDQo+ICAgICB4MjM6IDAw
MDAwMDAwMDAwMDAwMDAgeDIyOiBmZmZmMDAwNDQwOGE4NGEwIHgyMTogMDAwMDAwMDAwMDAwMDAw
Mg0KPiAgICAgeDIwOiBmZmZmMDAwNDQwMmQ2ZTgwIHgxOTogZmZmZjAwMDQ0MDJkNmU4MCB4MTg6
IDAwMDAwMDAwMDAwMDAwMDANCj4gICAgIHgxNzogMDAzZmZmZmZmZmZmZmZmZiB4MTY6IGZmZmY4
MDAwODJkOGJjMTggeDE1OiBmZmZmMDAwNWJlZjg2ZjAwDQo+ICAgICB4MTQ6IGZmZmYwMDA0NDQw
MjJiNDAgeDEzOiAwMDAwMDAwMDAwMDAwMTEyIHgxMjogMDcxYzcxYzcxYzcxYzcxYw0KPiAgICAg
eDExOiAwMDAwMDAwMDAwMDAwMGMwIHgxMDogMDAwMDAwMDAwMDAwMDlmMCB4OSA6IGZmZmY4MDAw
ODJlMDM4ODANCj4gICAgIHg4IDogZmZmZjAwMDQ0NDAyMmFjMCB4NyA6IGZmZmYwMDA1YmVmODZm
ODAgeDYgOiAwMDAwMDAwMDAwMDAwMDAwDQo+ICAgICB4NSA6IDAwMDAwMDAwMDAwMDAwODQgeDQg
OiBmZmZmMDAwNDQ0MDIyYWMwIHgzIDogMDAwMDAwMDAwMDAwMDAwMA0KPiAgICAgeDIgOiBmZmZm
MDAwNDQ0MDIyYWMwIHgxIDogMDAwMDAwMDAwMDAwMDAwMCB4MCA6IDAwMDAwMDAwMDAwMDAwMDAN
Cj4gICAgIENhbGwgdHJhY2U6DQo+ICAgICAgcnNuZF9zcmNfc3VzcGVuZCsweDYwLzB4OTggKFAp
DQo+ICAgICAgcnNuZF9zdXNwZW5kKzB4NDQvMHg2Yw0KPiAgICAgIGRldmljZV9zdXNwZW5kKzB4
MTM0LzB4M2Q4DQo+ICAgICAgZHBtX3N1c3BlbmQrMHgxNjQvMHgyNjgNCj4gICAgICBkcG1fc3Vz
cGVuZF9zdGFydCsweDRjLzB4NjQNCj4gICAgICBzdXNwZW5kX2RldmljZXNfYW5kX2VudGVyKzB4
MWM4LzB4NTQ0DQo+ICAgICAgcG1fc3VzcGVuZCsweDE5NC8weDFlMA0KPiAgICAgIHN0YXRlX3N0
b3JlKzB4N2MvMHgxMDANCj4gICAgICBrb2JqX2F0dHJfc3RvcmUrMHgxNC8weDI0DQo+ICAgICAg
c3lzZnNfa2Zfd3JpdGUrMHg3OC8weDhjDQo+ICAgICAga2VybmZzX2ZvcF93cml0ZV9pdGVyKzB4
MTI4LzB4MWQwDQo+ICAgICAgdmZzX3dyaXRlKzB4MjEwLzB4MzkwDQo+ICAgICAga3N5c193cml0
ZSsweDZjLzB4MTAwDQo+ICAgICAgX19hcm02NF9zeXNfd3JpdGUrMHgxOC8weDIwDQo+ICAgICAg
aW52b2tlX3N5c2NhbGwrMHg1MC8weDEwNA0KPiAgICAgIGVsMF9zdmNfY29tbW9uLmNvbnN0cHJv
cC4wKzB4M2MvMHhkNA0KPiAgICAgIGRvX2VsMF9zdmMrMHgxOC8weDIwDQo+ICAgICAgZWwwX3N2
YysweDI0LzB4ZDgNCj4gICAgICBlbDB0XzY0X3N5bmNfaGFuZGxlcisweDk4LzB4ZGMNCj4gICAg
ICBlbDB0XzY0X3N5bmMrMHgxNTQvMHgxNTgNCj4gICAgIENvZGU6IDZiMTMwMDFmIDU0ZmZmZjBj
IGY5NDAxM2Y1IGY5NDAyZTgwIChmOTQwMDQxMykNCj4gICAgIC0tLVsgZW5kIHRyYWNlIDAwMDAw
MDAwMDAwMDAwMDAgXS0tLQ0KPiANCj4gPiAtLS0gYS9zb3VuZC9zb2MvcmVuZXNhcy9yY2FyL3Ny
Yy5jDQo+ID4gKysrIGIvc291bmQvc29jL3JlbmVzYXMvcmNhci9zcmMuYw0KPiA+IEBAIC04NDgs
MyArODQ4LDI5IEBAIHZvaWQgcnNuZF9zcmNfcmVtb3ZlKHN0cnVjdCByc25kX3ByaXYgKnByaXYp
DQo+ID4gICAgICAgICAgICAgICAgIHJzbmRfbW9kX3F1aXQocnNuZF9tb2RfZ2V0KHNyYykpOw0K
PiA+ICAgICAgICAgfQ0KPiA+ICB9DQo+ID4gKw0KPiA+ICt2b2lkIHJzbmRfc3JjX3N1c3BlbmQo
c3RydWN0IHJzbmRfcHJpdiAqcHJpdikgew0KPiA+ICsgICAgICAgc3RydWN0IHJzbmRfc3JjICpz
cmM7DQo+ID4gKyAgICAgICBpbnQgaTsNCj4gPiArDQo+ID4gKyAgICAgICBmb3JfZWFjaF9yc25k
X3NyYyhzcmMsIHByaXYsIGkpDQo+ID4gKyAgICAgICAgICAgICAgIHJzbmRfc3VzcGVuZF9jbGtf
cmVzZXQocnNuZF9tb2RfZ2V0KHNyYyktPmNsaywNCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICByc25kX21vZF9nZXQoc3JjKS0+cnN0Yyk7DQo+ID4gKw0KPiA+ICsg
ICAgICAgY2xrX2Rpc2FibGVfdW5wcmVwYXJlKHJzbmRfcHJpdl90b19zcmNfY3RybChwcml2KS0+
c2N1X3gyKTsNCj4gDQo+IEFwcGFyZW50bHkgcnNuZF9wcml2X3RvX3NyY19jdHJsKHByaXYpIGlz
IE5VTEwuDQoNCkluZGVlZC4gVGhhbmtzIGZvciBwb2ludGluZyBpdC4gSW4gcnNuZF9zcmNfcHJv
YmUoKSwgd2UgaGF2ZToNCg0KCW5vZGUgPSByc25kX3NyY19vZl9ub2RlKHByaXYpOw0KCWlmICgh
bm9kZSkNCgkJcmV0dXJuIDA7DQoNCmVhcmx5IGluIHRoZSBmdW5jdGlvbiwgc28gcHJpdi0+c3Jj
X2N0cmwgc3RheXMgTlVMTCBvbiBwbGF0Zm9ybXMgd2l0aG91dCBTUkMuDQpUaGlzIHNob3VsZCBi
ZSBmaXhlZCBpbiB2NiB3aXRoIHByb3BlciBjaGVja3MgaW4gc3VzcGVuZC9yZXN1bWUuDQoNClJl
Z2FyZHMsDQpKb2huDQoNCg==

