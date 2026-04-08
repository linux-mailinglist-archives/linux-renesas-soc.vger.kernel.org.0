Return-Path: <linux-renesas-soc+bounces-31044-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CP/BHdmP1mmiGQgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31044-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 19:26:49 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 77BDD3BF83D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 19:26:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E0F2C3013C54
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Apr 2026 17:25:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFED23D6CC1;
	Wed,  8 Apr 2026 17:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="AcILUtDm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010003.outbound.protection.outlook.com [52.101.229.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275A53D6462;
	Wed,  8 Apr 2026 17:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775669123; cv=fail; b=H4uf+U2U/sdoEr+Wd7zwd6SORUN3Qa/Qhp4VqBeC9wYFWkTUj9WFcTO7RuT/SKe0dgm3Hlo0Xijm8ohp3ZnZEXNKGhucq/zwAaJ4QvvVma2NyIegc9/GUXHc2eXbJ6ZqGZvAsEMApwp2wJJwlHo26hs+Hzw6MUE2dSyhHYihKAM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775669123; c=relaxed/simple;
	bh=kY/hk9/7aCcsBeQLolgde1AQydzTjmh7Gbt53gx+mWM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZTbAiL2pgzlEdmFiVLaH7vjcE61b842dI0oJLJgIVIIKLFvBEmz+zeGtKsttPxwiPK/Fqqef8FliREhMny4k7qlNDN5KSdQzyFLZ/JtXgBZzpLsPC6M+QofmH9+DlaCp7ljApijc/3QHVUM83Z/1yDg266AIWYiSTgAqzXmHk3M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=AcILUtDm; arc=fail smtp.client-ip=52.101.229.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s2CgA77Q/bfvyKwIwJQpIf/n85I5Al0+NvKjiHifR7b+yg0s2PpWpovsvubWgnA1zIvNOlIm1MM0Jx0WmLIUe7Dj5XzinFQMtfA9uoCCqBvhAE4FFtZ47i/L84bg3FFaPXwtFiwQ9ssmYPgmPgyUK3qjG0H8C2VjAP6L0VPKI6z+FXHTVgXAiswo+4pQSgVBJ7ZIxO6nywqWzqQ/guU7V/O8Gxn4CtFQZheM356OTTQVPpJuSkHnYHq5yhe1z/avhGFb1rd8jncZ/y15D4rd41sZwAgY3zY5Mbx5r5KchIcnxcdVzeVGWSYPOGZyKboGzjTBlYPQLLfalw7fGuA01w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kY/hk9/7aCcsBeQLolgde1AQydzTjmh7Gbt53gx+mWM=;
 b=cpEGkT8Z4v2yEO6EoqGHswDZQFS9/5CKnUDRBrjKCNJFbPzA3IQaRxxkKvkZ6rdxU0keYMWwqrHUV+GNuP1iA6CL0Kdv4sSbG4/M75YQbwTmz8H/BEPAk6SUaNrlvmgKdQg8kPx8EOozpKxLGqSF7hN/A1EetTXT8jhOyD/OiB2ppO6JJ/J3q7wAT/DHSUmf0Tu0V/itsQCwtFF/61uvLfxuesWH4gzpq7cseNo16FgWPufvymfTDo99wafOf7CiKYp3i0WK1lnxY65nw/kBQx4jtvEBXY0NuI5DefAiTxefGF0pH5ceZ3UpVU3t3ruWKtEOpOxXYRKkcVhr4CKapw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kY/hk9/7aCcsBeQLolgde1AQydzTjmh7Gbt53gx+mWM=;
 b=AcILUtDmuXdxMIK9ukxE8y2Xgx26Ht9vHj/+zXnuiej9XKj9oKrvHO6FjMyTx5wZeG4qOx/G0EnWqia7iMLG3FSdVUM61v0GiFHNOJyH79z6GwqUF1Tsoni914Wx2dGFN13wOlDoF32pFxKhfMXYCXCbgRhOS3qR3IbB8B1whds=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by TYYPR01MB12695.jpnprd01.prod.outlook.com (2603:1096:405:158::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Wed, 8 Apr
 2026 17:25:19 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97%5]) with mapi id 15.20.9769.020; Wed, 8 Apr 2026
 17:25:19 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Hugo Villeneuve <hugo@hugovil.com>
CC: biju.das.au <biju.das.au@gmail.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Thierry Bultel
	<thierry.bultel.yh@bp.renesas.com>, wsa+renesas
	<wsa+renesas@sang-engineering.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-serial@vger.kernel.org"
	<linux-serial@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 1/2] serial: sh-sci: Avoid divide-by-zero fault
Thread-Topic: [PATCH v2 1/2] serial: sh-sci: Avoid divide-by-zero fault
Thread-Index: AQHcx2L1WxU/Wbm0ZkuvgJVMedankLXVW0yAgAAAwXCAAAUgAIAAAHbQ
Date: Wed, 8 Apr 2026 17:25:19 +0000
Message-ID:
 <TYCPR01MB11332859E901171C91C543061865B2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20260408142105.310210-1-biju.das.jz@bp.renesas.com>
	<20260408142105.310210-2-biju.das.jz@bp.renesas.com>
	<20260408123039.922a75327fd7672df3bd61da@hugovil.com>
	<TYCPR01MB11332B594964DDF0763499184865B2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
 <20260408125142.24cd94f094ba3ca512e7f346@hugovil.com>
In-Reply-To: <20260408125142.24cd94f094ba3ca512e7f346@hugovil.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|TYYPR01MB12695:EE_
x-ms-office365-filtering-correlation-id: b4ae4585-910f-4d93-f0c4-08de9593ce8b
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 AalHVnFTjyZMHIRfdCxq2AKwt0cego7xJ/3efbzcVyZpl1gXiPuRrKkz7IXNsK9TfLoEZIhiM1ZGCG7RuYCJ6GsTwBchUcoQxQwK2dDLRHLX9BMHApJ9l1o+09WcB72kuNez7NmtMB1pxji95+3tmFVpYBCHjdtAXwa135WLOpTuyJ6w6JT41pLl9DgKaWhimJ7vnTTT7rszLjqVTZFqlM+yBFqJcaQDwpFzuLYne75fpXpoDguQY36KYY+4hnhNBMTXGnxpyv5uqVhgg20NbQkiFCy7f9ZRLztRbrsUdQf0Xy1bTVBVlC0G+17elDpsIsFIrM7PCDrz40BVF4p870lWpp3E9KP38XDUd2loRIyTS+yjqu5n2bOnBoBKUNfZ4MQvPk6fr+sB0pXMpDy/Pj9xZgvkAXkLbwWaGrwKtVav1o0og0JPgneagKPbIQrygTeB4LZYMYqTXMbWabgFjSfrtm8sBI9I+kyFn14yfbPUUQmJ6a75WUGqwvkCSRs4t15Z9ltNetAQB5upzlRtI7EbsAFIlMmpqK25fofl6D2oSxoUkKpNaQyWWqrC1YRgKgzTORTST4vAxmGOSoaczwo3Qq4oZ5gFZnD9kDgl5Y03YbMphSs2lRfOc0nJkfx6kKDfC+tAzdyFY/G09+NMGiYCwlBQ9B1quamdKuE5YU0fdPhq0Z1uCqc963FpHcL6KTHkHKTeRdk/ZLhhM1BM2T6jN+aJSJeycqeRKcL5t6F3q7USLGwqiAHSZvOX/6nK
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MG5sWFp2cmhUa0tUZm8wQzh2RDFlT09MaE1sWVNrTmgyYmdBZ25RV0liazBu?=
 =?utf-8?B?U2RVMG5UMmp5RkVMUkpsdkRHZDA0Zy93Y1M3aUVUMTh5QTI1a2FvVFJ6VnY3?=
 =?utf-8?B?RVhTUDRScTNSVGdjKy9xM01SVW80b0RoakhZMzV1VFd5MTc2dlpHZDJ2QVJx?=
 =?utf-8?B?RlMva3drdTE5Wk9mdlEzbUhOTEd6VjJoUXUvQXNFQWxlWGNjQTRMZlpwQWVQ?=
 =?utf-8?B?Z2t5UVVWTmw1ZnRIaStuNFlQYTlQSkpFa0s3MXV5Y1RDem12elBZRzBKd0VR?=
 =?utf-8?B?WUFKZWlEY29hQU4yUmRKZmhGU2JpdXBTVkt3MXF0NllBQmtoSllOVFZXbzZs?=
 =?utf-8?B?d05wTTRmU3ZTYTJvcUY0VjBHZkhYOTBMQlVSbnVpU3RjamQ1THBzcU9JVlli?=
 =?utf-8?B?RS9ob254aVpLWC9PdkZ4SThPckpsMXE1TWRSRzRrVnEwN1BSTzgxdUE2ajYy?=
 =?utf-8?B?clpqM2pZY05tam1NYy9MT1lsbGlFemR1L1p3bUgrL2EybU9VWXFCRFlIdEt2?=
 =?utf-8?B?dUMzeERRSHU1dHVoWFl4bnQ5bmRqMk5NaDl6dkQwUmtyRjZKeGFPeVA3TklH?=
 =?utf-8?B?bHM2cXdnYks4YzlzdkxYMGdORVNLSkdJOVRtTW9WdjJnWFUwQldIZ1JSa3Z0?=
 =?utf-8?B?OFVFdHVqMkY4RWxrSXp4Lys2VDVaRUN3MGgyNGZWR3pyYklpdkN5WEJsQnFq?=
 =?utf-8?B?MmpPRTE5dDk0Q21kQ0l6bkU1SWl1Wi9iT3MrUE80L2FvNTdnRzRKVURXMUJZ?=
 =?utf-8?B?S0FQYkhSQzk3Rk1vWUFCTW8yRVhQZFhmWHg2V3FtMmtJemFCMnMyU0JXVkUr?=
 =?utf-8?B?VXoyQU10VTl1UUdGRmhOY2h3VVpKSVYyL1VNeG5FbS9JYzMxdlFlZzdSR1Q1?=
 =?utf-8?B?U1Rkay8xMUdLclJoMGxmanB6SjE4eFU5bnlxQlZoUUN5R0ZOWjF1R1VnMXY4?=
 =?utf-8?B?bi8waGZLOVdlTmpzeXRsbzNMa1dUcFVvdkkrWjlkdThLSVVudUlkVVJ5RWht?=
 =?utf-8?B?MUhkTnV1RmZBQlM5aENRT1FIbTRYUTU5NzJKZkp4U0k2eEY0NmVQc291SWwy?=
 =?utf-8?B?dk5NSThHVkhCVzFmK1NhT1o3STJqOGRxeXVQZzlyVmdaZEc5MlRGV0RYWllJ?=
 =?utf-8?B?QlduR1NES3lyZXhqc0FXbXdUV1FNRkZSWk9jeDREem5JdU5uNGZXd0NlalQ5?=
 =?utf-8?B?T051Q1BmMU5WMDlYNFNKNytRc084WW9Vdk9lTmJodDhTZXg5RmxzNVFRM0xG?=
 =?utf-8?B?YVR4RUVuM3oxaHFCVmxBRWExUHhSNU5tT3VsZGJzWkhjVWpCVEFwM2dCcit2?=
 =?utf-8?B?Y2s0QTFNekhPQ01nTkNOTG1SU2RkY1ZLRmVUL25ZZVhyQXZld0JBRE0wQjB5?=
 =?utf-8?B?TFdJMStWUVlmckJQYjZCeXlLdDVDNVRVTlMyV0FGVG52OXlVY0xBL2dYNTFB?=
 =?utf-8?B?bmtvZzBSQXlPWGxrVFFXVGxnKzZwczhlVGEwLzFOQ1pCdmc1WUg2WGt0UjRu?=
 =?utf-8?B?VzdzaUIzbm5wK2VBVlhQNGk1OGVSQzM1WHRxa3ZRRTN3cjdNNjBPNFdiNkpp?=
 =?utf-8?B?eGk0SjFJWE1BbmhFdUZGcC9Mb0FWOStTT0drakZvTmgrSDZXbnJEMVlTMVl0?=
 =?utf-8?B?bzBxQSs0WkdTL2dIUVptUzV4WXQvR3dYU2M4VXlWVTdWNVN6VU9ZTDRjVTIv?=
 =?utf-8?B?U2lrcHVGdTE0Y1EvaW9yejVNcGJzME9DL1h2NStINGNORjRjSUR6OGFhdFRU?=
 =?utf-8?B?VUtNbHZhdkRVMFl1bmNKZGY4QUtPS3pKeGVJcUc1dXM5eS9KY0VZcUk5N1dn?=
 =?utf-8?B?dUVRcytvUWxYdll1RlVtcExDZ0REMEo2enVlTUoxbjdYeWo0ZDVDMG1zdEhB?=
 =?utf-8?B?NFBuQ1BkL1owT3ZBbmJmN0JKU3RtT1RndmpmcG5HdElyNVBnRm83MXRJR2ZO?=
 =?utf-8?B?QUhmZlJRRHpZQWFJdlE2R2NNZytqdmtIUjFYdmtSTmxOVnRTL2xWSFFhUnhY?=
 =?utf-8?B?ODBtbUZZbElZVjN0VDhRdkRHTnREVFp6R1A2bml0R0hWZktPdFNwWEhJNER1?=
 =?utf-8?B?Y0gzUFQ3ZTJEUU1GV0VyM3ZyT0VNek9JTUVYZDA0OGRFTUNoUE5DcEo2V01q?=
 =?utf-8?B?KzJzeVhBV3I1V3JSSStrTng4Qm0wZTV2alRObnE0a0RLVFpuay9PNGk4RWdt?=
 =?utf-8?B?NFc2VThHS3BGaUNYdXlJRzNPSm5JVkRJRVF6dzVDVVQxdmNPdVljK0lmUFVu?=
 =?utf-8?B?aVBuc1hLRWlxOXNBdHJoNThKYXRRRy9YcXFGQXBCOWVjaVNwT2RBYjFJWHJh?=
 =?utf-8?B?YlZZWW9XVVV1WjgveHEvQlhXQ1JCR3A1YkFGbFVsRWtCdERyM3E3UT09?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11332.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4ae4585-910f-4d93-f0c4-08de9593ce8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2026 17:25:19.1095
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LCA5EHK+0ndmy9i04Ml54x5kOYsCvkyrOk9/R+ZNOg8gMv4+X4UCFECj3VHHzy2sMzRbvYGicIsqWWlW8ZPsjQn68uHXaS2crvzkmYjjOAM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12695
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linuxfoundation.org,kernel.org,glider.be,bp.renesas.com,sang-engineering.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-31044-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[11];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url,hugovil.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 77BDD3BF83D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgSHVnbywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBIdWdvIFZp
bGxlbmV1dmUgPGh1Z29AaHVnb3ZpbC5jb20+DQo+IFNlbnQ6IDA4IEFwcmlsIDIwMjYgMTc6NTIN
Cj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAxLzJdIHNlcmlhbDogc2gtc2NpOiBBdm9pZCBkaXZp
ZGUtYnktemVybyBmYXVsdA0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIFdlZCwgOCBBcHIgMjAy
NiAxNjozNTo0NCArMDAwMA0KPiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+
IHdyb3RlOg0KPiANCj4gPiBIaSBIdWdvLA0KPiA+DQo+ID4gVGhhbmtzIGZvciB0aGUgZmVlZGJh
Y2suDQo+ID4NCj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiBGcm9tOiBI
dWdvIFZpbGxlbmV1dmUgPGh1Z29AaHVnb3ZpbC5jb20+DQo+ID4gPiBTZW50OiAwOCBBcHJpbCAy
MDI2IDE3OjMxDQo+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDEvMl0gc2VyaWFsOiBzaC1z
Y2k6IEF2b2lkIGRpdmlkZS1ieS16ZXJvDQo+ID4gPiBmYXVsdA0KPiA+ID4NCj4gPiA+IEhpIEJp
anUsDQo+ID4gPg0KPiA+ID4gT24gV2VkLCAgOCBBcHIgMjAyNiAxNToyMDo1OCArMDEwMA0KPiA+
ID4gQmlqdSA8YmlqdS5kYXMuYXVAZ21haWwuY29tPiB3cm90ZToNCj4gPiA+DQo+ID4gPiA+IEZy
b206IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiA+ID4NCj4gPiA+
ID4gdWFydF91cGRhdGVfdGltZW91dCgpIGNvbXB1dGVzIGEgdGltZW91dCB2YWx1ZSBieSBkaXZp
ZGluZyBieSB0aGUNCj4gPiA+ID4gYmF1ZCByYXRlLiBJZiBiYXVkIGlzIHplcm8g4oCUIHdoaWNo
IGNhbiBvY2N1ciB3aGVuIHRoZSBoYXJkd2FyZQ0KPiA+ID4gPiByZXR1cm5zIGFuIHVuc3VwcG9y
dGVkIG9yIGludmFsaWQgcmF0ZSDigJQgdGhpcyByZXN1bHRzIGluIGEgZGl2aWRlLWJ5LXplcm8g
ZmF1bHQuDQo+ID4gPg0KPiA+ID4gYmF1ZCBpcyByZXR1cm5lZCBieSB1YXJ0X2dldF9iYXVkX3Jh
dGUoKSwgc28gdGhpcyBpcyBub3QgcmV0dXJuZWQgYnkgdGhlIGhhcmR3YXJlPw0KPiA+DQo+ID4g
WW91IGFyZSB0aWdodCwgV2lsbCB1cGRhdGUgY29tbWl0IGRlc2NyaXB0aW9uLg0KPiANCj4gSG93
IGNhbiB1YXJ0X2dldF9iYXVkX3JhdGUoKSByZXR1cm4gYSB6ZXJvIHZhbHVlPyBJZiBJIGFtIG5v
dCBtaXN0YWtlbiBldmVuIGZvciB0aGUgQjAgY2FzZSwgaXQgd2lsbA0KPiByZXR1cm4gOTYwMD8N
Cg0KQXMgcGVyIHRoZSBjb21tZW50IGFuZCBjb2RlLCB0aGlzIEFQSSBjYW4gcmV0dXJuIDAuDQoN
CiogSWYgdGhlIG5ldyBiYXVkIHJhdGUgaXMgaW52YWxpZCwgdHJ5IHRoZSBAb2xkIHRlcm1pb3Mg
c2V0dGluZy4gSWYgaXQncyBzdGlsbA0KKiBpbnZhbGlkLCB3ZSB0cnkgOTYwMCBiYXVkLiBJZiB0
aGF0IGlzIGFsc28gaW52YWxpZCAwIGlzIHJldHVybmVkLg0KDQpJbiBkcml2ZXMvdHR5IGN1cnJl
bnRseSBvbmx5IDEgZHJpdmVyIGlzIGNoZWNraW5nIHRoZSByZXR1cm4gdmFsdWUNCmFuZCBpdCBj
YWxscyBwYW5pYw0KDQpodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ny4wLXJjNy9z
b3VyY2UvZHJpdmVycy90dHkvc2VyaWFsL2FwYnVhcnQuYyNMMjE0DQoNCg0KSSBiZWxpZXZlIHdl
IHNob3VsZCBjYWxsIHBhbmljLCBpZiBiYXVkID0wLCBpbnN0ZWFkIG9mIHByb2NlZWRpbmcuDQoN
CkdlZXJ0LCBhbnkgdGhvdWdodHM/Pw0KDQpDaGVlcnMsDQpCaWp1DQo=

