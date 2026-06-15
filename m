Return-Path: <linux-renesas-soc+bounces-34021-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iShrIt/zL2otJwUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34021-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 14:45:19 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7362C6865DA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 14:45:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=wE96aBzL;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34021-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34021-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4DCFD304F153
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 12:43:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41EE93F58F4;
	Mon, 15 Jun 2026 12:43:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010034.outbound.protection.outlook.com [52.101.228.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E2C3F58CC;
	Mon, 15 Jun 2026 12:43:03 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781527385; cv=fail; b=iOTwrUE5ZXz9BHUlDjht1pjf6G39MgHOIaZOL/kIHECTdraT9bRna+PgqNTrG6furOFall9WJr9LbpeXnTfYKfERdn4wdsPf7vRwRfRjUzTV9h9zL/O4t1M8F8FsvPsCNy1e8mI5QpAjHBF9WnfkNnehVRXIJt+3tuV9CJnQGi8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781527385; c=relaxed/simple;
	bh=UuXvBpUzQaGJo2Sb8zrGN5lSR5mYUUFesLAktRC+yuM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=C75k96osfDpK/9cCBKOrMnodj321lWxpNhGAm680WHUTDVA5kC5uX1BuBYE7vF1wp3XCRHdQLxwHiaYwqRlK+UwqseHv45gpWfO8tdDiC3OJVflYHeEoyhdaaC7t78StFPcMKKxqUbr5q83fTIFd8JgRwAjNRcjeG7gbC6n1EVs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=wE96aBzL; arc=fail smtp.client-ip=52.101.228.34
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uu9eGp9boINv5sKHpACUH5il6dNaJw3GDrZgoUs3tq04MOx3akBlABJWJEYEPG0ewXuA0EAQ1hobIYIe3WtzsH1FV6atzgUP1SjVD9V17JC91VhmBPPM7kkWM6Ic6MJqybUUYUiMghdpNPdiJFthlXIKOtgsOHMdz5OIosWF0EXIeljHC8JnjKHOrxzEgpm93OrlSzLnEsY77CpNUMwJwwhSbro0fvr+eCmKB5A2GuJzWodkEI3HRGQpM+eoKWjosFFquy4UupZ1QH8EfE74XnqOmgQmJ8s7IX5qF7FofZBYlB4hlsLN8DQJvRWz3Ot1H6+VD1F7r90Pv70DUXUbqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UuXvBpUzQaGJo2Sb8zrGN5lSR5mYUUFesLAktRC+yuM=;
 b=l+DC6fK7ARqa0Bh25jjcGbLMKxgwmi/DKP2/vBRjnjiKDE3eCqo13tPCl9F4uGdcMtEwmQTk0b6bqkIl+Cv21Y8d8ztpQnWNGX/Eu9MJ4JX8/Sor/GKOdL+wq1Rd62Ggl1dwX4f5SPFDroDEjpwz7Qs0o3sJf/g7pVg5yEgXZ5yPqmoBvvQ/8XQUzbBYVUUNRGcvOC5yc93jxP9WxsZickDv0UsBBYmGqyfvlVazKqlP2Ccc9WpJ3f5aWedZD4qtUueptZzbAer01epFoD/GS6gdF4fCqA+Mx+qNyUv+udIzrb0Dki60o6duupcqFkz4W1RhOdpuE0IsQKrPkopt4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UuXvBpUzQaGJo2Sb8zrGN5lSR5mYUUFesLAktRC+yuM=;
 b=wE96aBzLtFjEBtlXTLnN4VTQDX0srkn+IRKuCXo5D6EZqu0Bb2XriWMnJwxJYRlXuSaWUFXtGK0XUmxdLqjB8ou9IW9WwGJttX04cMZWGtP1WFRCtJ2/l6pemRrMKUqGpMfmVh7LMZ45MbGlvY140idbVfs+0xhlmohF4NKD/Hs=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYRPR01MB12774.jpnprd01.prod.outlook.com (2603:1096:405:1b3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 12:42:59 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 12:42:59 +0000
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
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, stable <stable@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: RE: [PATCH 09/11] phy: renesas: phy-rcar-gen3-usb2: Fix devm action
 registration for disabled VBUS regulator
Thread-Topic: [PATCH 09/11] phy: renesas: phy-rcar-gen3-usb2: Fix devm action
 registration for disabled VBUS regulator
Thread-Index: AQHc+ngaWA394/baeES91naIfR5habY/YB4AgAAxpsA=
Date: Mon, 15 Jun 2026 12:42:59 +0000
Message-ID:
 <TY3PR01MB113460C85EEF713331411FBEC86E62@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260612143048.317907-1-biju.das.jz@bp.renesas.com>
 <20260612143048.317907-10-biju.das.jz@bp.renesas.com>
 <2b794049-0c44-4390-a6cd-e5bde5c5f3ca@tuxon.dev>
In-Reply-To: <2b794049-0c44-4390-a6cd-e5bde5c5f3ca@tuxon.dev>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYRPR01MB12774:EE_
x-ms-office365-filtering-correlation-id: fbc1479f-d084-448b-44ac-08decadba194
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|23010399003|376014|366016|1800799024|56012099006|11063799006|4143699003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 akckm7PoPBEbvpNzfs0WyIDJcILay2g5E4aCwrcpFGREeCtUjfoZAJtrNYT90YgqOXwzR9s6IVD4NvdNqrnEzLse22QiKultH6L0lRIC4HlhqMCDrsLu9lcNu4wASGN4eL+QjjTN4PHZnV5OGujCm+K+Qy3ZDOYvRvKxUsqkPII6kLxLTCWJH7qdgbYK3qnhhcLC1sLRaNUbz0jdsDSoqlIKh1dCJhz/7UePMEMvLvXnYiA/nHe4Pe5Nnxu+OGhDhbFqOufZEZYjOvsWql5rhiXmjI8vwBE4i4YGQ4ETXQhNOXHVRzzes55z5IVPqPzYcuKlzRdP6ojBjEnoLz4Sbs3auJSIgvquROHdMoyWVofa5s20pl0EehyfzURckLgovmECPWXFt3iI4HBchSpFZLlDDhiSHs9L+o2vuFSLmdkDVDTNH2SR6LmAV1Vq9mYS7TI0xBPcuvrp/HVasjs8QPYuDNSB/NV1AVNK58iAd3mVZOsJEaSK+QkmP4GkEWQzVAOd7ojxJgDN8wwRDulTff+uvkZYoI9YkOLlrGHy9vF3sJG9r1+MB1vnJ/wgWPEumn4We6Z9dLzdw8oREMBJaaBMlV0O+rvPRvBmalbSFCRF5fIcI85OzGQUcso+nP/EUHDjPC2WBD++PgGK8PyinqBhLKQcs0QY/a/5pKJNOiAaOKuAXPmuPNC1WKUg0aGoiso9wjluQHIgJtVGqYAO20Gnqb/kA9SUgISUbxU2+5rIf7VjGFGteBb3PMt+pRfA
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(366016)(1800799024)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MmpFakRTVCtFbnJkT2pTR1BseDFOQWV1OVFjanB5czlKY3AydWVULys3cFh0?=
 =?utf-8?B?Z2NSemY4cjY2WkppVjBITmlIKzlMUURyelkxNVF1M0xJNFFJaHFDaG0yRUV2?=
 =?utf-8?B?akcwU1ZPeGxaSnZRRHVWOFJHd2VtR2l1YXJ0WDJJS3VaZE1KVkowUUNsNmR2?=
 =?utf-8?B?NkVZbHI0T3hpNWRkQ0hjVXRHSGJKa1BzY2lZMGJjb2REU2xFT1c5SjB3Sk9n?=
 =?utf-8?B?OU5WMnZxN3lFSUdRUjR1QVNUZ1M2aGl4N1NCZElnNjh2bWZyMWNRUEVWazdH?=
 =?utf-8?B?Lzg3RmpzYmU2SEt0Z1Z1NnRSell1cWdaRUQ0NTNTRG92Q2wraWRsK2lXSDha?=
 =?utf-8?B?a1NCT3YwQ05OeElzZDRtQ293anVOa09La0NFQ01sVHJZOXcxRUY2WWVQTFVr?=
 =?utf-8?B?aS85dE5hRnM1RVdjQ2svUlQrTG1MQ0hLKyt5TDF5THNDZko0MG9UOXRlVWxO?=
 =?utf-8?B?ZXM3RUdmbUQveTF0RjlUU0xWVytEeFJOOTVnWWwrUWt4dWs0a2k3ZnNvWlhx?=
 =?utf-8?B?WG9MNGJHSHFtSk9Qcm5ObkVlQ1MrWTc4S081QjJqVFI0SXlpdjRnWXhuT3pE?=
 =?utf-8?B?UWtLajNjSTRVRWl4bEE1U2NZditXek9jd3pRd3RQbURRRUk1NHBCZzB1YzBI?=
 =?utf-8?B?TjY4a1BQM1FWUWFBQ0tZZWtkQjVkR3lIQWUxZGt0blkzZGZPdmg5czE2b0RM?=
 =?utf-8?B?UWZVQlZFWjUwMmpzcHRLdWJXMUUxZHNndU9xMllpbEl0VU1lakpqVVIvaE1C?=
 =?utf-8?B?Qm1LRWxWUXNqN0xVMTNwNTlHcklFa1NsVmJ2U1FSR3VGVmZucll5dGRCQXcx?=
 =?utf-8?B?aWl3emo2K3pubTJ0OXJmYmgvMkZPeU9yNTVHUmR2OUg2YVZmQldNTkliTmw0?=
 =?utf-8?B?V2hZblhhSnAyaDRMblBjc2lhTXcreEZ5M3VKT2VYazl0ZXptRk5HcUtHUmdT?=
 =?utf-8?B?QkE3SlVMOXBDMHdsM213QW5qNVJzRDBYNGNEYmZwWU5NSUtYSzBPaDJWZFVJ?=
 =?utf-8?B?aExsMlBuRDlZMURudU0wL0E1ZmRJU3FoMHVTcllnLzZ2R0h5akRIVDlDSXU5?=
 =?utf-8?B?YkE3UnBCcWlscGRhdmhWYmZITkJGUytoOUVjR1ExMUxaZXZybzhWYXhCeHI1?=
 =?utf-8?B?VXBOeGIzRm54K3VxcVhSTG9MNWZGNXNTSzM4MWdHZzBrME0raTNNNFNRMUR0?=
 =?utf-8?B?V2hDMzlVb0U3cDBPWVFyT05GcHpzYmJzaTNybklUL1o1S1JiT2wxUHFYT1dp?=
 =?utf-8?B?LzkzRWd1MENJYis4N0Z2elhrR21wM09vQ3oraHNvRFNCdkJ4ZDZNYmZRRHNY?=
 =?utf-8?B?WlRnclVxb2xyU3gvSTUwenNWZ0QyaXhGKzdlald2d0pxMit6dndVTFo3bFcx?=
 =?utf-8?B?c2QvbDZSdFZQaVcwdXpROTB6VDNUcnR6Yk9Cbks2cmI4SlNzbFJTQVFmR1Ja?=
 =?utf-8?B?S3pHcTdTalRnc1FnM1MvRmc5cFlXd2ZtM0VkMFA5Nkd0WFB2ZGdiWlpqMFNw?=
 =?utf-8?B?a0U1Nnp2ZkU0S05GaE5OYmErWlFPSXlHK3hxbWg3d2Z2d09XSkluYXVvRFBT?=
 =?utf-8?B?Mm1CTSt4RVhyYlFHckdmcTFoaEJnL3hNNFpoSHQ2NTBOcFVpM1dZMHJTT0kv?=
 =?utf-8?B?emFoU0lxU2xvU1llbXhMM29HUDZiOWwzU0o3MTRwQmVQOHAvQzlEaXhxeDla?=
 =?utf-8?B?UjA1QktlLzBNSGhQUUI1ZUtOQ1dSNG9pckVpMlY0WjZxeGhUOEs3d0h6VFFE?=
 =?utf-8?B?Njg0RkV1ajNrUmovWUkxK0RGYTFYdlpVR3A4QXBUcHB3WnZrVkxiMzRCTlJJ?=
 =?utf-8?B?ZlJNelMwb09uVTJ3L09mNmc2R3BYK25kR29aTXZBL1A5QTlQSWk1TldHR0tR?=
 =?utf-8?B?NGlOeVNkUE1tdkt2cWR4M2wwN3pOcDgwcVVhSWxheDE3RmtHZisxL1E5RFcw?=
 =?utf-8?B?T0U5WGJ2aHFYd2dvZ0R1ck9LaVNpMGp3bnhON1RQck1INGxhRWxxemdXNzhV?=
 =?utf-8?B?ekZjclJsNTVyaER6ZE1ndzI4U1YwQS9WMWhaZjNDRmlNQk5Ba3FMMjFkcG9N?=
 =?utf-8?B?TWlnRmpsTHFENEx1YXJDNHFsNjNCSTZmSEpOS3F2RjU3SkwxNGIwdWlEL3Z2?=
 =?utf-8?B?cm52WXhFTDAvOWsxQXIzamZRR2x0S0owYzVHYUZMSUxCVzZId3dWaDZDWWwz?=
 =?utf-8?B?RkdxVEp4VUpYTm1IekdZKytpZEFrdGZiVnh3a3hySVJMS2ZzRXRJdlBsZVlI?=
 =?utf-8?B?WG9TMU9DakhUem5JZDAyQ212eU1RK3BGbDU5ME84ZlNsOHJyNDVvbSs3V2dI?=
 =?utf-8?B?cFZLZzQ0bFBWdW5hQzcrZnpmNWZ4VVlPZWUxeWVZTnRGdkV1Sm04UT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: fbc1479f-d084-448b-44ac-08decadba194
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2026 12:42:59.0266
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MZfL8Tpj9teqHHqV10nh87CtKKmuhPymG4umXzVmlpNzc+ACT+5hGpnQVS77if881XKLvUlIohMuqbwFPGXw2yvkaMmqOPqGVW+hidlgRv8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12774
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-34021-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:claudiu.beznea@tuxon.dev,m:biju.das.au@gmail.com,m:yoshihiro.shimoda.uh@renesas.com,m:vkoul@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:neil.armstrong@linaro.org,m:p.zabel@pengutronix.de,m:linux-renesas-soc@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:stable@kernel.org,m:gregkh@linuxfoundation.org,m:bijudasau@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,renesas.com:email,tuxon.dev:email,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7362C6865DA

SGkgQ2xhdWRpdSwNCg0KKyBzdGFibGUgPHN0YWJsZUBrZXJuZWwub3JnPg0KDQo+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IENsYXVkaXUgQmV6bmVhIDxjbGF1ZGl1LmJlem5l
YUB0dXhvbi5kZXY+DQo+IFNlbnQ6IDE1IEp1bmUgMjAyNiAxMDozNw0KPiBTdWJqZWN0OiBSZTog
W1BBVENIIDA5LzExXSBwaHk6IHJlbmVzYXM6IHBoeS1yY2FyLWdlbjMtdXNiMjogRml4IGRldm0g
YWN0aW9uIHJlZ2lzdHJhdGlvbiBmb3IgZGlzYWJsZWQNCj4gVkJVUyByZWd1bGF0b3INCj4gDQo+
IEhpLCBCaWp1LA0KPiANCj4gT24gNi8xMi8yNiAxNzozMCwgQmlqdSB3cm90ZToNCj4gPiBGcm9t
OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4NCj4gPiBkZXZtX3Jl
Z3VsYXRvcl9nZXRfZXhjbHVzaXZlKCkgaW5pdGlhbGlzZXMgdGhlIHJlZ3VsYXRvciB3aXRoDQo+
ID4gZW5hYmxlX2NvdW50ID0gMSwgcmVxdWlyaW5nIHRoZSBjb25zdW1lciB0byBkaXNhYmxlIGl0
IGJlZm9yZSByZWxlYXNlLg0KPiA+DQo+ID4gUHJldmlvdXNseSwgdGhlIGRldm0gZGlzYWJsZSBh
Y3Rpb24gd2FzIG9ubHkgcmVnaXN0ZXJlZCB3aGVuIHRoZQ0KPiA+IHJlZ3VsYXRvciB3YXMgZXhw
bGljaXRseSBlbmFibGVkLCBjYXVzaW5nIHRoZSBjbGVhbnVwIHBhdGggdG8gc2tpcA0KPiA+IGRl
Y3JlbWVudGluZyBlbmFibGVfY291bnQgb24gZGV2aWNlIHJlbW92YWwgd2hlbiB0aGUgcmVndWxh
dG9yIHdhcw0KPiA+IGxlZnQgZGlzYWJsZWQuDQo+ID4NCj4gPiBGaXggdGhpcyBieSBhbHdheXMg
cmVnaXN0ZXJpbmcgdGhlIGRldm0gZGlzYWJsZSBhY3Rpb24gd2hlbiB0aGUNCj4gPiByZWd1bGF0
b3IgaXMgZW5hYmxlZCAoY2hlY2tlZCB2aWEgcmVndWxhdG9yX2lzX2VuYWJsZWQoKSksIGNvdmVy
aW5nDQo+ID4gYm90aCB0aGUgZXhwbGljaXRseS1lbmFibGVkIGNhc2UgYW5kIHRoZSBpbml0aWFs
IHN0YXRlIHNldCBieQ0KPiA+IGRldm1fcmVndWxhdG9yX2dldF9leGNsdXNpdmUoKS4NCj4gPg0K
PiA+IFRoaXMgZml4ZXMgV0FSTl9PTiBlbmFibGUgY291bnQgZHVyaW5nIHJlZ3VsYXRvciByZWxl
YXNlLg0KPiA+DQo+ID4gRml4ZXM6IDI0ODQzNDA0ZWZlNCAoInBoeTogcmVuZXNhczogcGh5LXJj
YXItZ2VuMy11c2IyOiBDb250cm9sIFZCVVMNCj4gPiBmb3IgUlovRzJMIFNvQ3MiKQ0KPiA+IFNp
Z25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gDQo+
IFRoZSBhcHByb2FjaCBpbiB0aGlzIHBhdGNoIGRvbid0IHNvbHZlIHRoZSBwcm9ibGVtLCBhdCBs
ZWFzdCBvbiBSWi9HM1MuIFNlZSBbMV0gZm9yIGxvZ3MuDQo+IA0KPiBJIGFwcGxpZWQgdGhpcyBw
YXRjaCBvbiBuZXh0LTIwMjYwNjEwOg0KPiANCj4gZ2l0IGxvZyAtLW9uZWxpbmUgLTINCj4gYWZl
MDlmMTFkNTQ5IChIRUFEKSBwaHk6IHJlbmVzYXM6IHBoeS1yY2FyLWdlbjMtdXNiMjogRml4IGRl
dm0gYWN0aW9uIHJlZ2lzdHJhdGlvbiBmb3IgZGlzYWJsZWQgVkJVUw0KPiByZWd1bGF0b3INCj4g
YWJlNjUxODM3Y2IzICh0YWc6IG5leHQtMjAyNjA2MTAsIGxpbnV4LW5leHQvbWFzdGVyKSBBZGQg
bGludXgtbmV4dCBzcGVjaWZpYyBmaWxlcyBmb3IgMjAyNjA2MTANCj4gDQo+IFsxXQ0KPiBodHRw
czovL2dpdGh1Yi5jb20vY2xhdWRpdWJlem5lYS9sb2dzL2Jsb2IvMmYxYmFiMjA0MDdkZmU2MDMx
Mzg1ODE5ZmZlYWJmYzRlYWM3NzJiZC9sb2dzDQoNClRoaXMgaXNzdWUgaXMgaW50cm9kdWNlZCBi
eSB0aGUgY29tbWl0DQoNCmViOWFjNzc5ODMwYjIyMzU4NCAoInVzYjogcmVuZXNhc191c2Joczog
Rml4IHN5bmNocm9ub3VzIGV4dGVybmFsIGFib3J0IG9uIHVuYmluZCIpDQoNCldBUk5fT04oZW5h
YmxlX2NvdW50KSBpcyByZWxhdGVkIHRvIHJlZ3VsYXRvciBpbWJhbGFuY2UgZHVyaW5nIHVuYmlu
ZC9iaW5kIGN5Y2xlLg0KDQpUaGUgYWJvdmUgY29tbWl0IGNoYW5nZWQgdGhlIGNvZGUgZmxvdyBm
cm9tDQoNCnVzYmhzY19wb3dlcl9jdHJsKHByaXYsIDApOw0KdXNiaHNfcGxhdGZvcm1fY2FsbChw
cml2LCBoYXJkd2FyZV9leGl0LCBwZGV2KTsNCg0KdG8NCg0KdXNiaHNfcGxhdGZvcm1fY2FsbChw
cml2LCBoYXJkd2FyZV9leGl0LCBwZGV2KTsNCnVzYmhzY19wb3dlcl9jdHJsKHByaXYsIDApOw0K
DQoNClRoZSBmdW5jdGlvbiB1c2Joc18qX2hhcmR3YXJlX2V4aXQoc3RydWN0IHBsYXRmb3JtX2Rl
dmljZSAqcGRldikgc2V0cw0KcHJpdi0+cGh5IHRvICBOVUxMDQoNCmFuZA0KDQp1c2Joc18qX3Bv
d2VyX2N0cmwoKSBoYXMgdGhlIGJlbG93IGNvZGUgYW5kIFsxXSBpcyBhIGRlYWQgY29kZSBub3cg
YWZ0ZXIgdGhpcyBjb21taXQuDQoNCmlmICghcHJpdi0+cGh5KQ0KCQlyZXR1cm4gLUVOT0RFVjsN
Cg0KCWlmIChlbmFibGUpIHsNCgkJcmV0dmFsID0gcGh5X2luaXQocHJpdi0+cGh5KTsNCgkJdXNi
aHNfYnNldChwcml2LCBTVVNQTU9ERSwgU1VTUE0sIFNVU1BNKTsNCgkJdWRlbGF5KDEwMCk7CS8q
IFdhaXQgZm9yIFBMTCB0byBiZWNvbWUgc3RhYmxlICovDQoJCWlmICghcmV0dmFsKQ0KCQkJcmV0
dmFsID0gcGh5X3Bvd2VyX29uKHByaXYtPnBoeSk7DQoJfSBlbHNlIHsNClsxXQ0KCQl1c2Joc19i
c2V0KHByaXYsIFNVU1BNT0RFLCBTVVNQTSwgMCk7DQoJCXBoeV9wb3dlcl9vZmYocHJpdi0+cGh5
KTsNCgkJcGh5X2V4aXQocHJpdi0+cGh5KTsNCgl9DQoNCkNoZWVycywNCkJpanUNCiANCg0KDQoN
Cg0K

