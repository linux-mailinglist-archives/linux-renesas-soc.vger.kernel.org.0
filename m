Return-Path: <linux-renesas-soc+bounces-29714-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GC1lFHE7umnsTAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29714-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 06:43:13 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB1B2B5F83
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 06:43:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8B308301C3E7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 05:43:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 203ED361DB3;
	Wed, 18 Mar 2026 05:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="FaZfXbGT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010026.outbound.protection.outlook.com [52.101.229.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA295231830;
	Wed, 18 Mar 2026 05:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773812588; cv=fail; b=dK7q2m7IQP6yxgi2Q94cALKHiZ+G1wBv3DEVv4QZrPREgy6cOjxvIHNo4z5vU9DryKHQDVebtmmGuYz/SFe+A/tj3m5o9wf0qAnvfBZ2MCgXsvH7r6u6Fu+Xq55LZ16EZtmdereMUe/39OEC4B2HKwBHWWm4drsad/4RzOBd+O0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773812588; c=relaxed/simple;
	bh=mEkJNYQW6Hqw9KUNIId+MetKW071gojl2JE3w/KvLTo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=prwSRzWZJkz8YptNq9xOZBwXP8jGV/uwrBsbJ01VxFBakCPtn11y480iF7cZaf7p0ijoZLoIvZsx8yJnlMzbblTE+7zsUa+jHpsUqfOp9o0Uwl7H3YGkIQyc2uVTZjKh0RIoWrLubPPEBM7gV9d/xfcG7YZFUd1htgHzv9UV5R4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=FaZfXbGT; arc=fail smtp.client-ip=52.101.229.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q29pkNGMMZzEaBoTI48HnGiCT3it7XplFcOVZsh3IBrnEzKqUwoZL7tpBfm2rJqFsJwnM0yqnPPb0Fy4RYwzWznWyRuqN8SdJahh6QcMTcMtvhrfAKhsD/+HIc97vamx4Dl4iGgIz4ytq2QFJdLAiOxenkdWXw9OhEgaSPXq9XuovbcPO142imo5ovjybbUM6QUO1+ryPSt3A0QUhZ1FH301TD4WhUawNVD6tW6chJ1w5Og2eiaaMSvQrZEd8fWl41EOmeJnUzLLjrQDjMAO3VA4w4xreh6tNZp+cgTmnhDye2kufPZSTjxPn+HSzP6tLefzsH4tBymoWPDp51k6gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sg7XhlVoj59njiqqNLvI43g1UPtkTTGma/XrCd53vOo=;
 b=CWX1owUPBX+TjJjfhEe2OK8jdlp4dWkpHkhmhXEV/xs3ysUEtfOWa3PnX6A1Txtu/6PJHTM2l5WxC9wlVAkokeN+DeNcFmuTjX+egTiF3LMQNSURS5yabtxUD8R2MHKxmiHMzss2V/lJJpHKkVajSxEwMXHnBaI96Pg3/bKX4HsAUG3ZZwrjoOtW7KMlS5Yt+2cEskIU27npKqxAsadbOsEZ5F89dc55psy/7KVXchFwfCOvCcdTrLRAn9PnMg2o0jwWMkA6ww/sY3YxQaCXCkzpUf/ekqb/OygR8avR+Ck1m/j6ak+f81X8cL9+lg7lmcTfFWY2w2h7/KhYes2BEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sg7XhlVoj59njiqqNLvI43g1UPtkTTGma/XrCd53vOo=;
 b=FaZfXbGTv0sgHrDm63Djz2ce7p2s0R3awagpFJviQGqKRd1IRz/vittO49sXO9/OmNLGaSAGU1TTgQRvBuu4UC62LSDjRZKVfFvEL/BM9ROIxGsrUbOXDvHw2JFdaVR7wGm8fIK/5qNZJv1IuYQgm4OKuDKyKgkA7vCAAcm+NXk=
Received: from TYWPR01MB11935.jpnprd01.prod.outlook.com (2603:1096:400:403::9)
 by TYWPR01MB10474.jpnprd01.prod.outlook.com (2603:1096:400:2fa::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 05:43:00 +0000
Received: from TYWPR01MB11935.jpnprd01.prod.outlook.com
 ([fe80::dc30:6b24:b7ba:d429]) by TYWPR01MB11935.jpnprd01.prod.outlook.com
 ([fe80::dc30:6b24:b7ba:d429%4]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 05:43:00 +0000
From: Dawei Liu <dawei.liu.jy@renesas.com>
To: "linux@roeck-us.net" <linux@roeck-us.net>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"corbet@lwn.net" <corbet@lwn.net>, "skhan@linuxfoundation.org"
	<skhan@linuxfoundation.org>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>, Grant Peltier
	<grant.peltier.jg@renesas.com>, Linda Xin <linda.xin.jg@renesas.com>,
	"tabreztalks@gmail.com" <tabreztalks@gmail.com>
Subject: RE: [PATCH v2 3/3] dt-bindings: hwmon: isl68137: Add compatible
 strings for RAA228942 and RAA228943
Thread-Topic: [PATCH v2 3/3] dt-bindings: hwmon: isl68137: Add compatible
 strings for RAA228942 and RAA228943
Thread-Index: AQHctn204ex+FeF5rEmz/2sFsNGYCbWzxvhg
Date: Wed, 18 Mar 2026 05:43:00 +0000
Message-ID:
 <TYWPR01MB11935C44C0ACE3F319FC2ABC8D54EA@TYWPR01MB11935.jpnprd01.prod.outlook.com>
References: <20260316053541.3903-1-dawei.liu.jy@renesas.com>
 <20260318021921.75-1-dawei.liu.jy@renesas.com>
 <20260318021921.75-4-dawei.liu.jy@renesas.com>
In-Reply-To: <20260318021921.75-4-dawei.liu.jy@renesas.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYWPR01MB11935:EE_|TYWPR01MB10474:EE_
x-ms-office365-filtering-correlation-id: 3ed6fa28-0537-4a39-2f8c-08de84b13765
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700021|18002099003|7053199007|22082099003|56012099003;
x-microsoft-antispam-message-info:
 Aiolj0qVVygcTz+qWlxwGcCZrqQ1DpMjOiEf3Ti1J7mtkmK1VitbneDnfA/S7Yxf0ksnEnwD8Fx6MphIlflq2Hr0XOBPrxAM3LgzfxuGzsjnix9rSP9ChlNyu86yOWcmP1TSrg/ju/5DsKoAOuqNuO6ONdZCfSjPKAv+cwhtvjzSl2tZ2/war0c13C5MJKWd68bqBbM7z09KnNsZkL0Or9sgokO5SEZUMs5H5I6Uxhpk4GSOjS3WNs8HeRPGawEe5S5V2AQZgU1EicXqplkt4DZ9/GQu5sp6+8vy2RFaEVaismIM9PxLvZn8DPS8w+/daWchl2SW/5q4KbjQ/p0iqDJxANDf+2GaoxY7id4LAr90y6/XlyVvt9wptgt6trXp01/JjKmH2zG0bfD4+hxNo+UX6DZZ/koUsptmfMKV4c5o/mGVkVaDS7qctB2OCM1ppgeZnBcWaFZZoZt6S8zZF47U+URm4m0lgRJBG8QYOFNrO5M4E/bSd6g1gFtqBugKvdsIs3YwLyGADYZai+YfV3m3TPTY3O+/y+GIR9Yuca2T1zR51YWTQVC2Z00w36N3asKaQwuJABmgwDwD9VBa0yhsTXhYVPyl9YhZzVcYXIMawOS8KbeyAKLx1jKGHAAPNnT7MbmiG9R6lv0FdD1VLzAMt5Lx74a4EmaSx7QPW/bG1VxtRMIDI4ZQgcvXAMJc0PKyBmK/QkGyX3oomeT9TJnvYSZQsYf25g2tmLXE0Ra9qzxLjzJFN3OesVeF+EsXYQLTMz4Gd5P/a7kFwv5qfV2PyB7WbU4S9mQkObJco0w=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB11935.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021)(18002099003)(7053199007)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Zhouu+B79nTjhsUy5cXT9+FZvaTYFMFiQgGaAgVykwnahzBWaIQNUKibUVp+?=
 =?us-ascii?Q?0myJLzDGb5LHdH8xkKD8GZ2Rg4CDmus08j/DgeWWDQHn4QVBNZd0blCyb4kg?=
 =?us-ascii?Q?kpgQD5ZC9inRY6gvw1M+28CJgyMdCetSbJPrdy4RaflkaGBR3UV24rr6x1uO?=
 =?us-ascii?Q?HjxW9rFggc9hOeLqunUCQNZT3Pgn32kiavoNREQKncAritsVv4T+MUa1RYMF?=
 =?us-ascii?Q?wHqIK5+6ImnYxfBiS3spna4KQH1FYmU+MVaBdBoCe+eus9pClhkaKRlpg1RA?=
 =?us-ascii?Q?1nKqzOgFfjuoLIfWxmZayd7ghiUsIvUg61NDbHevEbq94bCISaCq6y/wqmNN?=
 =?us-ascii?Q?TCaubc41D4Rr78mDu4tPA1gyIbWgdudew0s+bR1GiO0br6nRmvFV/kajMmr4?=
 =?us-ascii?Q?6gQJ9k68Bx6x2EbaRRI3Na3W8PGsacP19yccru+qV7coanNB+zNTYiP57Fat?=
 =?us-ascii?Q?h3oT1iIlBYL+Q71fgnRsVfMBxoSNEaXo9z0cy2ToJX8z+WDJ4njMcDXU6UEh?=
 =?us-ascii?Q?zc0Q/QIlE6yVG28frCcrPnpbzH10QeEGddlttZvaWs4+YyQW6psKjJA/l9/e?=
 =?us-ascii?Q?EMqElIxRCTDBoUqq0juXtFz04B5/hNwJU2CtkSublb76aV3EoRZvKgAmhGcc?=
 =?us-ascii?Q?8B0suRnAJCTVmov7MSblydeqASUdQOqPBUSJogpvk7BhOf3WkrvZZ7VbSf6I?=
 =?us-ascii?Q?Sx78jJh+JsPMSgwj+3pm3A3hOsUd2n5ve5FVackuuZ41Nk/No7z84HeCHMAg?=
 =?us-ascii?Q?Xv5AktRWKzeONGD5izza9PzIcaFjLPxmHhjSGKEMJamK0hZp0X7JJ4iFVn0V?=
 =?us-ascii?Q?UJjsYhlPJfVYzJt9EfqPLZDPeGhV62PYH8RwAb9h+FuscK03tbp0LQ4u2AxQ?=
 =?us-ascii?Q?EZtGBQTj5MfWsxhuymUev7AvRvTM5rul7Qr79UoNazUvlcU5lhSTbQ2QWHFh?=
 =?us-ascii?Q?+QkgEKS3bJjrL6OO/DbHFCbuU0TBVeCsziKh2e3iCDz51tcea8PVpd18h7+J?=
 =?us-ascii?Q?DtbM967CwPZpiQ7pKH3RdmJhFeEyYDLVMHm5OuKuBDUsEtc262t2nfM4waVI?=
 =?us-ascii?Q?Oe6/dctPF/YPtTULUx05aEs2cYidOVnkgQICxRomaluEeoVn+FbR89cTsk6R?=
 =?us-ascii?Q?UuUGYT9e45XhYF5LOY8buWB5ahdtqg/1WV9V907GEfcKNsd8Kj9WUIP6xGON?=
 =?us-ascii?Q?9kpeSfpkX1nN0NwRlSzs56E8f/Cjna5B+1LYMqxn3BLBDPU5IN2rap8GL5ex?=
 =?us-ascii?Q?8FDFf46+zxbPqtqSKZ6Zvh07k7pLcR9daq72LQZGkwFg2Gq1iJKFhXcILOah?=
 =?us-ascii?Q?Mr7ED/FFNeVK4gs22zzuBr9PI5QetWh5wc3n1+YqWWV9HnxojQZhxF6kAGP3?=
 =?us-ascii?Q?h9AqHICxTwl6Y5WUfPPgTg7+qr6s7H03qns4065SMf3tp3HkqOOVkZ7orPOq?=
 =?us-ascii?Q?7Kjces0UxeVmScSaIP7R+mxoeQ4KkN4DztyI9ogyIDDmfIwIyTYzsJAk7Lsj?=
 =?us-ascii?Q?YqJZOVQg3OM73fzP16O/vwIBCissQ8LCXJ0qsdkLqiBcBJyaPdLXdJnyeeLn?=
 =?us-ascii?Q?jV+1okwhQrrMFLIG7v9gqBnQx+zjhyG0Z0RFt9r04tcFRX2i4yyd5UlV5TzP?=
 =?us-ascii?Q?oODYaX0oPoaw8feGIp/t2g02hrkhNNuDUJrUUMZi7ty9mVlQ3llSqkQg8WTX?=
 =?us-ascii?Q?QShjPvYrtqN8w5qZSIm374is+32GY5F0qv/K+eHDhhgEr7jCpjYWLMq48Hre?=
 =?us-ascii?Q?TVG2ShKDVA=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB11935.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ed6fa28-0537-4a39-2f8c-08de84b13765
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2026 05:43:00.6404
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2kA3ZlMwdTUDVRl9wx4pgIsIHR92y/3F8DUjNJ3DETOYn3d/LIcrTidIOGDjX9F4Dn9aqS60/kgTd0zCWdGZ95xe+KoJ0G2ld4N8hznTVCo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10474
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29714-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,lwn.net,linuxfoundation.org,glider.be,gmail.com,renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dawei.liu.jy@renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxfoundation.org:email,roeck-us.net:email]
X-Rspamd-Queue-Id: EBB1B2B5F83
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Krzysztof,

I've updated the commit message in v2 to clarify the compatibility,
as you suggested in your v1 review. The commit message now reads:

  "Both RAA228942 and RAA228943 are PMBus command compatible with the
   RAA228228/RAA228244/RAA228246 family and use the same 2-rail non-TC
   driver configuration."

Could you please review this v2 dt-bindings patch and provide your
Acked-by if it looks good to you?

Best Regards
Dawei Liu

-----Original Message-----
From: Dawei Liu=20
Sent: Wednesday, March 18, 2026 10:20 AM
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org; linux-kernel@vger.kernel.org; linux-doc@vg=
er.kernel.org; devicetree@vger.kernel.org; linux-renesas-soc@vger.kernel.or=
g; robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org; corbet@lwn.net=
; skhan@linuxfoundation.org; geert+renesas@glider.be; magnus.damm <magnus.d=
amm@gmail.com>; Grant Peltier <grant.peltier.jg@renesas.com>; Linda Xin <li=
nda.xin.jg@renesas.com>; tabreztalks@gmail.com; Dawei Liu <dawei.liu.jy@ren=
esas.com>
Subject: [PATCH v2 3/3] dt-bindings: hwmon: isl68137: Add compatible string=
s for RAA228942 and RAA228943

RAA228942 and RAA228943 are Renesas digital dual-output 16-Phase (X+Y <=3D =
16) PWM controllers. They are PMBus command compatible with the RAA228228/R=
AA228244/RAA228246 family and use the same 2-rail non-TC driver configurati=
on.

Signed-off-by: Dawei Liu <dawei.liu.jy@renesas.com>
---
 .../devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.ya=
ml b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
index ae23a0537..53d07c0ce 100644
--- a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
@@ -56,6 +56,8 @@ properties:
       - renesas,raa228228
       - renesas,raa228244
       - renesas,raa228246
+      - renesas,raa228942
+      - renesas,raa228943
       - renesas,raa229001
       - renesas,raa229004
       - renesas,raa229621
--
2.34.1


