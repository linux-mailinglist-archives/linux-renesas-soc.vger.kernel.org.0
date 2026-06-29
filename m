Return-Path: <linux-renesas-soc+bounces-34524-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id I494JmqFQmoU9AkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34524-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2026 16:47:06 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E436DC3A4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2026 16:47:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=renesas.com header.s=selector1 header.b=Dx3ia4Sm;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34524-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34524-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7B50330038ED
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2026 14:33:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0EB4416D07;
	Mon, 29 Jun 2026 14:33:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010057.outbound.protection.outlook.com [52.101.229.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2193E169E;
	Mon, 29 Jun 2026 14:33:33 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782743615; cv=fail; b=a+sh2Yh1+1mLmpXc3Tgi/Xu4lnIsv00w5bXG+zB89ncbYMiqYRIeRctA9t1hIXOsMI9T2vXalQe/ohYMAyrrcGw08jjrDJzGHlBP6r52jzIHv4YZ5owODLj/ti+TXtLNboONh9vKER/aQ8tgcGjxb2cYHrUsFytj4LGtfJCRaz4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782743615; c=relaxed/simple;
	bh=uPNHyhAX8/4UvH3eC/ZZWHDo2NcrkMmjuJy2FLa0qH0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JCCH3uuY2r3D1hJ7Ki7d9RD4njC/pN4ufHUcRPAkyeOYViV/wvqp6bMJTuCYx3VEAv//aWFzBEykEueMCKrLfzsjft78rfxETH86XQC4yW1Thv811VAevIBBchnYPHLfHCwrPSjzmdXF/2Tp0JSb558NuWAeA3Z3W/ZEeTx6vI4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Dx3ia4Sm; arc=fail smtp.client-ip=52.101.229.57
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W/HGNEx44yeonh9Ob36sM/cnvWM8ODPBRZhx4Ry4CXNa1F8G+6DXd6yRjU/UVnN8O7fPaIdU+3KkXPOCqlyUyNnsAdbRlOJQsP9Y0iHi77gFDohTaTD67cpYhuRcq632Hats5t53n85eH5AYXVqcwrhhmAJQAVSaCVNVlVZjkNo1zPCdEwNE+tfuTTvSUWXN/b//2h2eYWdztptKPpjqWpSQQd1id+GRCqBfMe5wPX0HtPz2vsaQlzxKCRIFli4CgFpby9qn8u3qwju35p9l/WaSQrlmx51ZLkqBykblVNPl16lp+thpilzMXmLtWDR4cIvrQgja6+ZNX9pNGgxsew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uPNHyhAX8/4UvH3eC/ZZWHDo2NcrkMmjuJy2FLa0qH0=;
 b=iVQAQ7SsRaCODUJPpa9iYwTLwU1Q62aHKE+jHnvQnTnzuVUq7LB6VZJfKe3TXRs2BoLK4L9o4p9M5OOEZX+oMt+HFR3nY5dT53WF6fF3M8qdCbooC6MqTvpBmRco2d9APv0+dr7DV/AgRWq54auQQJOSARcbACUtnDDhhF7tU/VQzQzCaqEjme3G4tz8PTAcq2i5XZQwrgQbWcSgN4R3nniCjvXPo/0L1Bkh/ncy9H4A3uPw7EACQ6CLfTUvcCWeH3j0c9gXP4ji4BUyg2xtjjW2Cgkvd8WCaHqASAE0HA8++pzDXTDUo9ay5+YXkvbg9FkF3nk75PzN4m3xSYoRGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uPNHyhAX8/4UvH3eC/ZZWHDo2NcrkMmjuJy2FLa0qH0=;
 b=Dx3ia4Smb19D3r98pZIDOFMbpRLEZnKdIpW3UEbGQmn7f9B8kYlVWQnwXJ07E2E/HkVm10nQFk+GH0cnxNzYankquQFkN4v/hdoiemk3YYswcTEmpARh6NS8w3cg5RViuTKX/7T4fNwG9fc6MoiOq8qdFD2iqBXmzPXPbkwRIII=
Received: from TYRPR01MB15619.jpnprd01.prod.outlook.com
 (2603:1096:405:29b::10) by TY4PR01MB15002.jpnprd01.prod.outlook.com
 (2603:1096:405:262::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 14:33:29 +0000
Received: from TYRPR01MB15619.jpnprd01.prod.outlook.com
 ([fe80::a68f:5c9:9de8:4fa4]) by TYRPR01MB15619.jpnprd01.prod.outlook.com
 ([fe80::a68f:5c9:9de8:4fa4%3]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 14:33:29 +0000
From: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: wsa+renesas <wsa+renesas@sang-engineering.com>
CC: Felix Gu <ustc.gu@gmail.com>, Fabrizio Castro
	<fabrizio.castro.jz@renesas.com>, Mark Brown <broonie@kernel.org>,
	"linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] spi: rzv2h-rspi: Fix DMA transfer error handling for
 signal interruption
Thread-Topic: [PATCH] spi: rzv2h-rspi: Fix DMA transfer error handling for
 signal interruption
Thread-Index: AQHdBYU3gG2A3yWcU0itbSVs/oBZOrZRCqMAgAALB0CABESRgIAAPgVw
Date: Mon, 29 Jun 2026 14:33:29 +0000
Message-ID:
 <TYRPR01MB156195CB900B9054C94E4FB3785E82@TYRPR01MB15619.jpnprd01.prod.outlook.com>
References: <20260627-rspi-v1-1-170c93ee14da@gmail.com>
 <aj6sEE5y62SOVsRb@ninjato>
 <TYRPR01MB156197735CBABA1699843B9B085E82@TYRPR01MB15619.jpnprd01.prod.outlook.com>
 <akJJ09zjt_dXp1jS@ninjato>
In-Reply-To: <akJJ09zjt_dXp1jS@ninjato>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYRPR01MB15619:EE_|TY4PR01MB15002:EE_
x-ms-office365-filtering-correlation-id: 4c1d30e3-6a38-4914-e978-08ded5eb637c
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|38070700021|4143699003|56012099006|11063799006|18002099003|22082099003;
x-microsoft-antispam-message-info:
 az1Mrw21BrkYFUhyAeYpLfa33WB2yoHo0bsjuURi2ah8C/m6es3ri6fbe+jYuGR6QCJipw6maGkyhsXPmJG6/rwqDIwbQORjjrZ0E6bjr7Mt5XKiuTAEIzMgyjnRwBdy/QIWhw1Db+gvX8iHbk2T+ougb9FiuQudWO9MInf9bYWE4aJGBfHei1YG9As629pRw3WJdQ7XysV5jdsQm5xpAQOFAkWMj9LAKNN14sKVrszks3xK2s1mDMiL3zDav7ThS8SIJz5WBfc/F0mkjge6A717VK4iIwDWntkk1bJkBBRn1sr3w0TxIDhyZapz4My9RboCuZXai7BZ5I0B0PmervG730P6twAbzF/q+iclaiOu+kbWtP1AScX25jpc9WZzKuqs2vUCtdVMgarF6gDRnzMSJZnF5+POMP2OTggdpR7eWWYm1jo82SDMD3/QIA+tD8HnZxcNPSuZaLdIiewKNxRvG4DcxvezXXorMG94rG0K4+9z3B5i2IwDgijtr59nqTQ/cZpR+OIeuiVgX7UYM681aXGphbjO8N7v6wxzc6ZG0XssBO86qCpT1Iuy91hGkGC+mqctYWe6aNE/Q+zp+taSbcjy7cVFXrzyiUfZAtdTXZ6KnxNCdf7fCib+CLIwZnAUZn+bmSjA8mE0FgKyurQ29kW7Jv8yfQLBix8qohheN2DJs6B7nbkOKkYXNpRqERC8SGnqzAPPoIff0MI9lUHNMnqBkLSLTiuKN47H5Cg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB15619.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(38070700021)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?yF5auhOSM+3sj0u555Yroxp1nKhm7K8g8JRlcsnR5K3lD1mm5z13xzszCacl?=
 =?us-ascii?Q?eY6Lxj/TjoDN7Q0CfcZ0O6nBNFSNpJUrCT/eD23SPNFFzVINwFJXPH67kG57?=
 =?us-ascii?Q?DJNozjvgJyaZtXWG6yznedju/bcvpWFJJEh8lwFgLwUEi3h7mD22qfIPsgKR?=
 =?us-ascii?Q?OPxpIDj4hczZW/jAs81vlmnIaAubkThExzEtxUocKCG3s8+KcK10MN9lY+kp?=
 =?us-ascii?Q?JIh9WgThsYX4zSLC/cUNSnfH2F1wlTbcLY4XZduP0wla3IEXFAYlHdcmctGb?=
 =?us-ascii?Q?PpUbXDhBJ4nBFs30cRgJvXHItZ4a/d7mCrlBQEco112sNmnC1hoH6L4UYoA7?=
 =?us-ascii?Q?aUZpOkEIshvZMXBeshyTyHbxEBgkSmKFhlbImcIrlzY7NSmQqUGuI6uO/FWV?=
 =?us-ascii?Q?7coQ7X1ubtR3Ar0ValswCYMMb70EEeNPJMN88E5s36g4pBUjujO5wKhLsWcP?=
 =?us-ascii?Q?c5SKT1ED8vv6BfEVn9xbGUP566ySbsOYf19xyrvhYjSTGzMdvKsxy+0Mn5cO?=
 =?us-ascii?Q?RAGT0UVMGGIjJ4aIeNbvzfGoKvBcYDu7lcP+sqE45WWLiADUQ0hoEvYJIBDT?=
 =?us-ascii?Q?OCGvSULIpQ444PCG7xJg1cGSj5jicthiM6DS+zXlNZxIXo//YECVpLblteuB?=
 =?us-ascii?Q?e7MH2ofmS6TfFVpydlazjBacxvF8DZ3dl1D1CJopzSMaCVP1Cuz4WdTtFXAC?=
 =?us-ascii?Q?ug1H2yKBWjYYIZtNlVS46FSbKDHeta5OXd8tOQ+8axvfX1xlG3L8lQ3+7UBm?=
 =?us-ascii?Q?Mjrd4qrqhUBcBObzOafFFSSLSJhvTkU/azMgRNu4xYL+x0mtoev+/aUDo975?=
 =?us-ascii?Q?3Mu8wkXXOfmhsHxjN2vZolPvgwojSRHTvtXT/EYByZSPkmbJQYXETkIbn+Rk?=
 =?us-ascii?Q?WdhOi3gF+MNEvvUwe8SZL7YxNKVpuPcCZEU8Y7L9BgAgL0DxwVx8yCkQD31Q?=
 =?us-ascii?Q?PnmXDwZrPJCM1u6gCQZ28msf42REn7qkN0joJMeRTcVAXv3E6etfUWbzETnT?=
 =?us-ascii?Q?0+vChgmuuYOII5RdswzZ+W+Yp+PS97d2PMG49RHCcdcLjdTLfIfcfcy5P6Pr?=
 =?us-ascii?Q?TO6VicIfMCbc0wr9cGkZREM6O5GouW24Asx8g4m+QmXUJL7lAivx1yh5lqmN?=
 =?us-ascii?Q?cET2GpDJ47J+cd/2yo6Lh6jVqEUx/fFkQ7oPll2lfobLTjNLdbh3l7i5ywvF?=
 =?us-ascii?Q?8Yg4Mk0B1xwn9KUBUUIykPx82F8u0BJs+lk/uS1kmPjwub/eSyhWX8jhEn5L?=
 =?us-ascii?Q?zhdUwKaT/RHiSnwk/lSGTdpxJaAHygd/XC7Mj4Hc7TTqAVkj+MqpQlDcI4f1?=
 =?us-ascii?Q?y1AUlBqVxdEIiOrI1pDunRG6DvujeNRXN2o4uri3+5JMzZ6FiywMVjzX1FhL?=
 =?us-ascii?Q?lGdgpr18FhAA7UFViFkgn98W0e/tESYtrY7l5OLgzydKvb+MuPEmV/beYe/T?=
 =?us-ascii?Q?boz0nJhKGCCJliGHhO95AVYAxMNSl82EJzsBnBglOaYJQsEikHVHS3RpQh4p?=
 =?us-ascii?Q?5YOm6gSJiqxkDhC64C3nbu3EMPGQCa7wJLKY9cAuR8zn7lc47qj2CG1zaoN1?=
 =?us-ascii?Q?7c5+6/bORrBKISlKE6sfEWTVAB9kUMsmmgqIZTgj+mycM1cdXuVMqnoMrBTQ?=
 =?us-ascii?Q?A0ct2VX6ISamnBa3T587BB6GeNs7N73voTQKSmeozUldSpgTBHUOkGSqrakI?=
 =?us-ascii?Q?Bq5PZZ9jT0IUKfkEerGKM0Y3B/wCX0b54z6F1HFQSt89qXbnVBUsI7s6uIIf?=
 =?us-ascii?Q?B5GREqJS2PBPGZqaczb9ZW2WQ8b0vwY6KCnHBB4g+5m4xfyGE/GG?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB15619.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c1d30e3-6a38-4914-e978-08ded5eb637c
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2026 14:33:29.6179
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DG6TIk7QgVsBc3X7yUhD3mNoU+KoTYwmVf/gnnoNAe2XU/49jSLyHpiAzFzdaCi+/PbsWi9Gn/cbHhD2i6uqMZeFjcudw3z5s/Vy7IRa4I3S8kHT60BsUfIntGx/mxJ1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB15002
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-34524-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:ustc.gu@gmail.com,m:fabrizio.castro.jz@renesas.com,m:broonie@kernel.org,m:linux-spi@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:wsa@sang-engineering.com,m:ustcgu@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[cosmin-gabriel.tanislav.xa@renesas.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,renesas.com,kernel.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cosmin-gabriel.tanislav.xa@renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[renesas.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,renesas.com:dkim,renesas.com:email,renesas.com:from_mime,TYRPR01MB15619.jpnprd01.prod.outlook.com:mid,sang-engineering.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A0E436DC3A4

> From: wsa+renesas <wsa+renesas@sang-engineering.com>
> Sent: Monday, June 29, 2026 1:33 PM
>=20
>=20
> > I also think the patch is correct and should be accepted for now.
>=20
> To bring a broken state into a less but still broken state? I don't
> agree.

I tested what happens both in the timeout case and in the interrupt
case:

In the timeout case, the SPI controller and the DMA controller recover
fine.

In the interrupt case, the SPI controller recovers fine but the DMA
controller does not, because dmaengine_terminate_sync() is not called
and a large DMA transfer does not complete within the 100ms timeout
found inside rz_dmac_device_synchronize().

With this patch applied, interrupt case ends up in the same branch
as the timeout case, which correctly aborts the transfer.

By the way, the mechanism for recovering the SPI controller is handled
by the SPI core, as it calls the .unprepare_message() callback even in
the error case, and the next message re-setups everything correctly.

Please let me know if you still have doubts or if I should go more
in-depth with the explanations.

Reviewed-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Tested-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>


