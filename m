Return-Path: <linux-renesas-soc+bounces-29716-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CEyTOxRDumlSTgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29716-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 07:15:49 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2F92B63D0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 07:15:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E3932301B7AD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 06:15:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 012D73624AF;
	Wed, 18 Mar 2026 06:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="dkkM65HB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011070.outbound.protection.outlook.com [52.101.125.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0778434F462;
	Wed, 18 Mar 2026 06:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773814545; cv=fail; b=clbNDy6CMyvZytpsoLJhH1kCqgZQcamkSJ51DKn33AiFEMTtJvNwXuYgTLdYd2LQeZhFrUOsKUaTJc0l1aIFfj6v55Un1oN6Z2F1ztjRiJj2PFVDjF7ce2QedXdBiGkPitlBlzDUeTp09pVSg4YdLQES552/wfL7t1bKkpT0ytg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773814545; c=relaxed/simple;
	bh=lDk37z8BjtOkh7RHssIpQ/SyElNIP3lzbgiUJ3HvKTk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=f8PwEUIlLhJtApQTRG3THQccSuxmSRyDn7kip8/ZvAJgVFHoXZxyUe3ly1gMASpXA4ROFkbIxGXktj9bS6ACfV9XLeS2MhcdxB/GyMuMt65CSM9833cRTm30pqgMn+B3A0q/bWYAxvtEk5wwpJaphQ0MM3DaHCTy4s+ro9vx7UQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=dkkM65HB; arc=fail smtp.client-ip=52.101.125.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sWXrwvC5igsAzIzsD7lJc9CSj1t374DxNK1MBxkgjRKM1j93gYoEuSXuVgn141L/soMlayRmw+PA2TRHvtcmV2jJ3FIeWGa8wiPauYrR4/By2lJ1R2cV1wrRkQU8YmnY3yMuLGQwJlak/Tf2uN8dLNxmuX0/t/JwWCxcNuM1egRJYTckV5wDxJgKPUivMUj7qTHrGJfd8Bu0Yab8XheaUukyMnUpe6A2yAulD6Oz/v71zzQ8TFyb2HT3YHvMjWGz/cnfMbjiSuY4ZPsckeBK99eI5qW8AzELWj6IcNwv3JaxSCsn8qNxamaRN8HcXvA02l/fSBiXnKYdOa2fJzUGfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lDk37z8BjtOkh7RHssIpQ/SyElNIP3lzbgiUJ3HvKTk=;
 b=SAmPK7po7hazdn0JlSt0487ucQNhU9v95AKlJv2VHAHvJuG47+lsOoHWkrGnSADc49bcEd+5xW66+DpUXApz7uPEwEUwBP7ki99WafacwhqZwA2KldH/txcrNBDmYTdmlgDefc0yAEwQKSAWBCRzIu/ovslg9kteyEeW91PqOBP5GSUTRQZ1TY61cdtfxLPpiFE5uc0ckDElooi5btfMMAk84Bl+eJT74dthsWKgcgvLUA/6gYt4QvdX5Y2ZaSlwCYRtR9nVIewSH0IlqfQ1s4cTPFGAEWKKrXlA0rm2U1gbyEK53gWu1PG2jwPpWOSu5AjMXddkThvGgQ3u/Th+wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lDk37z8BjtOkh7RHssIpQ/SyElNIP3lzbgiUJ3HvKTk=;
 b=dkkM65HBPkRkZCIykh/O4GD/8hsK97hevnum1lNIgMoD5fm2OL4B1PJSPYiqHtuxwSbS3qAthyLL9HKJyzPhnaopxbMQP1oAvyL1S+kExP7Zx1KcOksxv51gHEbwwKf9XudXybB/82SaxGfjWGOYY+vVS5Wj1QjlqHBiNQyF5ys=
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com (2603:1096:405:20d::9)
 by TYCPR01MB11055.jpnprd01.prod.outlook.com (2603:1096:400:3a7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 06:15:41 +0000
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::655d:9c47:4499:eb3a]) by TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::655d:9c47:4499:eb3a%7]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 06:15:41 +0000
From: Michael Dege <michael.dege@renesas.com>
To: geert <geert@linux-m68k.org>
CC: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Andrew Lunn
	<andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH net-next 06/13] net: renesas: rswitch: add forwarding
 rules for gwca
Thread-Topic: [PATCH net-next 06/13] net: renesas: rswitch: add forwarding
 rules for gwca
Thread-Index: AQHctfJOvmwg4AslEUKf0OXHYUUNB7Wy5pQAgADpwYA=
Date: Wed, 18 Mar 2026 06:15:41 +0000
Message-ID:
 <TY4PR01MB14282FBD742E25EDEDC519A2B824EA@TY4PR01MB14282.jpnprd01.prod.outlook.com>
References: <20260317-rswitch_add_vlans-v1-0-3a57bfa0f2d1@renesas.com>
 <20260317-rswitch_add_vlans-v1-6-3a57bfa0f2d1@renesas.com>
 <CAMuHMdXKthoDYtNKimB6S8m+ukWQVMEOuLbZFkWrwqre4c1V5A@mail.gmail.com>
In-Reply-To:
 <CAMuHMdXKthoDYtNKimB6S8m+ukWQVMEOuLbZFkWrwqre4c1V5A@mail.gmail.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY4PR01MB14282:EE_|TYCPR01MB11055:EE_
x-ms-office365-filtering-correlation-id: daa25629-51f9-449e-9e9e-08de84b5c804
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 0CZ8BNPPrTIDyMybHDWofcDsmycl5RY7727N4yklKwDh3pGDtoikG4fvdJP7hNlR+9saooOIyUQmFrwlgMDJS36IJjaXw2L2bQDDE+09YDttfBZyk7JKv9lh32ajPLr8DW8/Iorx0g1CyzEwBq6yHSixAzZMIzQU2nRRkRFEt4Hu09eEfS7vTfC9hcFvMbCk9yYjCMh4VLqKU7eh7NWrH8YvTr0nODUhHwMHm3KM143TIND4HrNTmezKObFnfJt8QcqvoCE6vhYrrDpSS/rtviMvOG5NUQE/natLshBS9POplKl7Vtfe+0/Japehvg3wjJxFE2x7Qo9L0OU77OEAGQa4spIuoeVpCEk8JXE4c2voa+JmLCE3xqtQo9pi2ZvwJlZmM6+ABwyhaWof/mfIDwS+lIt2ybheox9o6S/+3+M1vPNwoRwt30GUzQ6KRv6nBwjILvrOtW4B/Yk7DUDdBo4eVM1HapSrO3EEpX3QFYQs/wsyY3u05w9gC37IMT0PsmptXaQkg5sKjLVXpWkp628JRqCjLQsqqeBcpkM7Km6VfRCjbyO5E2JzTM5ysANfUn5wHQqw9MPBuOCLAN8dji2NKGLtVe6irwX6bz+x3+uAOAJjCukN/uMiMF3H13a5X5NblMmdg7z7eIhmhkQ99eLMFtNNC/mv/HdU3b8UtO5H+j6qtXQ9OhJtms/ow61VbcvGyyER18Kz83T+z5z8/P/7aLnHxaGixU9guNYAw3KJ9ZkzsaT0oe35ELx/1gwzREszuAQkO5fRdjZoXG/Q6fRpWiz/GU8GczNsT8+x/a8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY4PR01MB14282.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?THNtTVIxUGZGUGFqWHliL1JRRmdPOEJJUmpNTDc1SFNXYXhGK0FoNFNqMUdM?=
 =?utf-8?B?Tnc0L3pKeWwrckhCZkhMc3o1WUVLMXdXTk9BZ3ZlVnlVbzFWam5CYng1MDVk?=
 =?utf-8?B?Zk9wT0FjQWVlUFY5N0Vha1FvMVVsc0F0VjZwZkdGYzBvdjhvYzBqTlVxSE5P?=
 =?utf-8?B?OHJJa2NsQVBSWDFQSlY4M28vRlB6SSt4Ykd3TkJCNWFkNTlJczl1YjB1MmtW?=
 =?utf-8?B?czA0RTkzdi92ajVmbGdhR0MwUkhmbWpaTGxxdVRiSUFNWjhVNE9uSlFReEo2?=
 =?utf-8?B?U0RzbG5VYzZBZG82T1BZdEdxL2phWFFiUEFXQmpyUU9ZQmxJODIxVlJqZVFE?=
 =?utf-8?B?cGJ0Z2VxelJralkraGhyMElsNkFQOXlSVys2VEpxYmE1cWI1TUdnRWdaYm54?=
 =?utf-8?B?VnloeEdOTzRLdFJ1K0FaOFpaaEN0THJHNmovZko0ZE5hYW9kTkZSV3pNVFBX?=
 =?utf-8?B?UVNMWG5uQ0FXVkNUM2Q2dUIxSmorSVdacWJvQXp1SVlPS3dNVkV3UjNpQjJU?=
 =?utf-8?B?eWFwNEhETFJ5Y0F0QkpDcDJ0b3A1V1V6SjNQM0RLbEJaZDVIQVJKU0VlSUdk?=
 =?utf-8?B?QW9mcDcvd1lyQlM1eEVwY2I0ZFBPUmhuTEFPSEdaR1RmdDZZOTFwYnRrUGQ0?=
 =?utf-8?B?MkRDN2JJeHNGVmZUTE5aR3FMZTJWN1NWRUU0SlVxYjM4VnozK2cwamRnQ2VD?=
 =?utf-8?B?QUxXN25BUloxYVFyRzhQRHg0OGVCUWk2UDk5TjB6dU9aYWNXcFBnbUhKL2ts?=
 =?utf-8?B?bUtkbit0Slk3VGxKdWVhUUxaSXROMGowN3VTSm9NNXZBQ25xaEtTcWFCRk1j?=
 =?utf-8?B?aVdhWDBVZUdmTTlSemdlVGphM1JsMG8rc0E0TVNrVE8yM3hZcHdlTERqbkhp?=
 =?utf-8?B?ZlpUT3RNZFpOcDBhN2ZOeHFqaTE0c2tTc3VYNVpLWGEwTlhYaGZ2Q25WWWVX?=
 =?utf-8?B?OFNYeTNycDQrY3M0YjJpSDlUYmlJRjUzTUhxOVl1OTdiR3ArM0RIMU96Yllj?=
 =?utf-8?B?QzZRSUw5cWg3R1VMVzBrMERVN0tBOXE2OFlkY0d3emdlclRxMjF3ckprM21i?=
 =?utf-8?B?cjBXeFhPVDdjcTEwVzZFZHNuU3R4N2FkQVZvMDRvNzl6SFNUWU81L0RvcGE5?=
 =?utf-8?B?ZHAwVmIxT21EYldYMmU1WW5KdmNSOE5jWFlPVHVRTmdvTFI3REFPREkrcmlC?=
 =?utf-8?B?Vkd0SjYzekprQ1NGdUEwZHpyOWRBa1I4cjIwMzA4TENqWERkZkRGZ0VSeDJO?=
 =?utf-8?B?RTdxeDlxdzlFcXZTaEYwNW5MVFpqc3hNSlBnbVdHZnFEVEhxeFhXa3E3L0FL?=
 =?utf-8?B?SXhyaWY1cjgzalM1eE1yS0VkVEcvZ3VWTGhpRXo0SnMvTnVQaEM0aVJsMngv?=
 =?utf-8?B?M2hYU0ZHN0lST3V6ZTB1YjdhVHJ3N1g0Q0ZpVHdJWWgzU0JIbURYRlFDSGlJ?=
 =?utf-8?B?QWpZbVBvZHdGb1JWdnVKb0VqeDlCeW5oTktTemY1QmZQWnNxMEwra0Z5eC9K?=
 =?utf-8?B?aVFmbzVjY0p0MGlMYmFDbWdYL0t2WmRqUFVUZ0wzK1dBZW1zaVQ4eG5tR1N2?=
 =?utf-8?B?SGZSa1c1RU5zYjVJZld5SEVTQkNRUis2N0VKMktBamU3b2p3ek1FNlFCdkNC?=
 =?utf-8?B?NWl2ZDJBZ0I3bFp2VEY4RTZFOEs1cWNLRE9Gc3daY0t0bXpERjdXZU5mdm5z?=
 =?utf-8?B?RjJibFczS3JMOXd1Rzg5ek5oTUJXaFJwVGtrYnBjQVpmUnA4YURZZnN2VlBj?=
 =?utf-8?B?eW1XZjdJUXRFZEhxN3hEa1VBUlgyVUtTdWIxeXpVK3pNbFdtb1pCTTJWQXBQ?=
 =?utf-8?B?enY0UGQ1TjNIK3BBOThCWEc3T1lmakVDbXNRWm9qWlQybldYYUNQVy9vWEpp?=
 =?utf-8?B?a3AzTlE1bDQ2djZ0d3lxeE5GZEdxNnBkVG5ORGVZM3RRQ2EzbXQ0RVkwRmZl?=
 =?utf-8?B?R2lBbEhUN0JKT1FVT3RkYXlxQWh3V3pWR25la2lkYTcvRUd6bGtRTzVVMDAr?=
 =?utf-8?B?YlRoOUpaa1JyVnJPQ3BrUzZCUFJpVFF3WjNCTHN5bndJcVF2OHhBN2Rndzd5?=
 =?utf-8?B?ekxnTmtZU0FlRjgwNTBDd1FmeHIvb25qU2pUd1JCcVpoTGZjM05FMjkzY3NU?=
 =?utf-8?B?cCswck1Nc2ZrdFZ0Q2VwNG1DbENkQnZvQldSTFE5OXlVRHM0clpqQVpFU2ZD?=
 =?utf-8?B?eG1WK2dhUktVSWxFSlRyMVJzKzg4WE5wcmhPV3lQVVJGSVVzdDJ5ZFc4QkRK?=
 =?utf-8?B?TlNXQjRTWlY4bTBsM3pnREVaY3ljWHFnaFN6czNZS3M4OUN1bmxTSVMwRDFR?=
 =?utf-8?B?Yy9Yd1d2bnoxL1V1OUM4M3VBbXF2WmhiZkFvSjgzVCt0RjVmMCswdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY4PR01MB14282.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: daa25629-51f9-449e-9e9e-08de84b5c804
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2026 06:15:41.2326
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6QSF6+VNrPhuSyiTLUSqgNtQRMMzWc6V9z0sEce61sXr80HvL1NLW3FC/RvtXC5OBOD9RI+G5hrhFyVaONOG52zqpI7CA1eQQ1xFDrp1y1c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11055
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-29716-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.dege@renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[renesas.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:dkim,renesas.com:email,davemloft.net:email,linux-m68k.org:email,TY4PR01MB14282.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Queue-Id: 8F2F92B63D0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGVsbG8gR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2Vl
cnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogVHVlc2RheSwg
TWFyY2ggMTcsIDIwMjYgNToxNSBQTQ0KPiBUbzogTWljaGFlbCBEZWdlIDxtaWNoYWVsLmRlZ2VA
cmVuZXNhcy5jb20+DQo+IENjOiBZb3NoaWhpcm8gU2hpbW9kYSA8eW9zaGloaXJvLnNoaW1vZGEu
dWhAcmVuZXNhcy5jb20+OyBBbmRyZXcgTHVubiA8YW5kcmV3K25ldGRldkBsdW5uLmNoPjsgRGF2
aWQNCj4gUy4gTWlsbGVyIDxkYXZlbUBkYXZlbWxvZnQubmV0PjsgRXJpYyBEdW1hemV0IDxlZHVt
YXpldEBnb29nbGUuY29tPjsgSmFrdWIgS2ljaW5za2kgPGt1YmFAa2VybmVsLm9yZz47DQo+IFBh
b2xvIEFiZW5pIDxwYWJlbmlAcmVkaGF0LmNvbT47IG5ldGRldkB2Z2VyLmtlcm5lbC5vcmc7IGxp
bnV4LXJlbmVzYXMtc29jQHZnZXIua2VybmVsLm9yZzsgbGludXgtDQo+IGtlcm5lbEB2Z2VyLmtl
cm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCBuZXQtbmV4dCAwNi8xM10gbmV0OiByZW5l
c2FzOiByc3dpdGNoOiBhZGQgZm9yd2FyZGluZyBydWxlcyBmb3IgZ3djYQ0KPiANCj4gSGkgTWlj
aGFlbCwNCj4gDQo+IE9uIFR1ZSwgMTcgTWFyIDIwMjYgYXQgMTA6NDUsIE1pY2hhZWwgRGVnZSA8
bWljaGFlbC5kZWdlQHJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiBBZGQgcnVsZXMgdG8gZm9yd2Fy
ZCBwYWNrZXRzIGZyb20gdGhlIEV0aGVybmV0IHBvcnRzIHRvIHRoZSBDUFUgcG9ydA0KPiA+IChH
V0NBKSB1c2luZyBMMiBmb3J3YXJkaW5nIGluc3RlYWQgb2YgcG9ydCBmb3J3YXJkaW5nLg0KPiA+
DQo+ID4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBEZWdlIDxtaWNoYWVsLmRlZ2VAcmVuZXNhcy5j
b20+DQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+IA0KPiA+IC0tLSBhL2RyaXZlcnMv
bmV0L2V0aGVybmV0L3JlbmVzYXMvcnN3aXRjaF9sMi5jDQo+ID4gKysrIGIvZHJpdmVycy9uZXQv
ZXRoZXJuZXQvcmVuZXNhcy9yc3dpdGNoX2wyLmMNCj4gPiBAQCAtOTMsMTAgKzkzLDM2IEBAIHN0
YXRpYyB2b2lkIHJzd2l0Y2hfdXBkYXRlX2wyX2h3X2ZvcndhcmRpbmcoc3RydWN0IHJzd2l0Y2hf
cHJpdmF0ZSAqcHJpdikNCj4gPiAgICAgICAgIH0NCj4gPiAgfQ0KPiA+DQo+ID4gK3N0YXRpYyB2
b2lkIHJzd2l0Y2hfdXBkYXRlX2wyX2h3X2ZvcndhcmRpbmdfZ3djYShzdHJ1Y3QNCj4gPiArcnN3
aXRjaF9wcml2YXRlICpwcml2KSB7DQo+ID4gKyAgICAgICBzdHJ1Y3QgcnN3aXRjaF9kZXZpY2Ug
KnJkZXY7DQo+ID4gKw0KPiA+ICsgICAgICAgaWYgKHByaXYtPm9mZmxvYWRfYnJkZXYpIHsNCj4g
PiArICAgICAgICAgICAgICAgcnN3aXRjaF9tb2RpZnkocHJpdi0+YWRkciwgRldQQzAoQUdFTlRf
SU5ERVhfR1dDQSksDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDAsIEZXUEMw
X01BQ1NTQSB8IEZXUEMwX01BQ0RTQSB8DQo+ID4gKyBGV1BDMF9NQUNSVURBKTsNCj4gPiArDQo+
ID4gKyAgICAgICAgICAgICAgIHJzd2l0Y2hfZm9yX2FsbF9wb3J0cyhwcml2LCByZGV2KSB7DQo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcnN3aXRjaF9tb2RpZnkocHJpdi0+YWRkciwgRldQ
QzIocmRldi0+ZXRoYS0+aW5kZXgpLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIEZJRUxEX1BSRVAoRldQQzJfTFRXRlcsIEJJVChBR0VOVF9JTkRFWF9HV0NBKSks
DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMCk7DQo+ID4gKyAg
ICAgICAgICAgICAgIH0NCj4gPiArICAgICAgIH0gZWxzZSB7DQo+ID4gKyAgICAgICAgICAgICAg
IHJzd2l0Y2hfbW9kaWZ5KHByaXYtPmFkZHIsIEZXUEMwKEFHRU5UX0lOREVYX0dXQ0EpLA0KPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBGV1BDMF9NQUNTU0EgfCBGV1BDMF9NQUNE
U0EgfCBGV1BDMF9NQUNSVURBLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAw
KTsNCj4gPiArICAgICAgICAgICAgICAgcnN3aXRjaF9mb3JfYWxsX3BvcnRzKHByaXYsIHJkZXYp
IHsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICByc3dpdGNoX21vZGlmeShwcml2LT5hZGRy
LCBGV1BDMihyZGV2LT5ldGhhLT5pbmRleCksDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgMCwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBGSUVMRF9QUkVQKEZXUEMyX0xUV0ZXLCBCSVQoQUdFTlRfSU5ERVhfR1dDQSkpKTsNCj4g
PiArICAgICAgICAgICAgICAgfQ0KPiA+ICsgICAgICAgfQ0KPiA+ICt9DQo+IA0KPiBUaGlzIGxv
b2tzIGEgYml0IGhhcmQgdG8gcmVhZDogYXJlIHRoZSBiaXRmaWVsZCB2YWx1ZXMgaW4gdGhlIHR3
byBicmFuY2hlcyB0aGUgc2FtZSBvciBub3Q/DQo+IA0KPiBJIGNhbWUgdXAgd2l0aCB0aGUgZm9s
bG93aW5nLCB3aGljaCBhdm9pZHMgZHVwbGljYXRpb24gb2YgdGhlIGZpZWxkIHZhbHVlcywgYW5k
IG9mIHRoZSBjb250cm9sIGxvZ2ljLA0KPiBidXQgSSBhbSBzdGlsbCBub3QgMTAwJSBoYXBweSB3
aXRoIGl0Og0KPiANCj4gICAgIHUzMiBmd3BjMF9jbHIsIGZ3cGMwX3NldCwgZndwYzJfY2xyLCBm
d3BjMl9zZXQ7DQo+IA0KPiAgICAgZndwYzBfY2xyID0gZndwYzBfc2V0ID0gRldQQzBfTUFDU1NB
IHwgRldQQzBfTUFDRFNBIHwgRldQQzBfTUFDUlVEQTsNCj4gICAgIGZ3cGMyX2NsciA9IGZ3cGMy
X3NldCA9IEZJRUxEX1BSRVAoRldQQzJfTFRXRlcsIEJJVChBR0VOVF9JTkRFWF9HV0NBKTsNCj4g
ICAgIGlmIChwcml2LT5vZmZsb2FkX2JyZGV2KSB7DQo+ICAgICAgICAgICAgIGZ3cGMwX2NsciA9
IGZ3cGMyX3NldCA9IDA7DQo+ICAgICB9IGVsc2Ugew0KPiAgICAgICAgICAgICBmd3BjMF9zZXQg
PSBmd3BjMl9jbHIgPSAwOw0KPiAgICAgfQ0KPiANCj4gICAgIHJzd2l0Y2hfbW9kaWZ5KHByaXYt
PmFkZHIsIEZXUEMwKEFHRU5UX0lOREVYX0dXQ0EpLCBmd3BjMF9jbHIsIGZ3cGMwX3NldCk7DQo+
IA0KPiAgICAgcnN3aXRjaF9mb3JfYWxsX3BvcnRzKHByaXYsIHJkZXYpIHsNCj4gICAgICAgICAg
ICAgcnN3aXRjaF9tb2RpZnkocHJpdi0+YWRkciwgRldQQzIocmRldi0+ZXRoYS0+aW5kZXgpLCBm
d3BjMl9jbHIsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZ3cGMyX3NldCk7DQo+ICAg
ICB9DQo+IA0KPiBDYW4gdGhpcyBiZSBpbXByb3ZlZD8NCg0KVGhhbmsgeW91IHZlcnkgbXVjaCBm
b3IgeW91ciBjb21tZW50LiBJIHdpbGwgcmV3b3JrIHRoZSBmdW5jdGlvbiBhbmQgcmUtc2VuZCBp
dC4NCg0KQmVzdCByZWdhcmRzLA0KDQpNaWNoYWVsDQoNCj4gVGhhbmtzIQ0KPiANCj4gR3J7b2V0
amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydA0KPiANCj4g
LS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQg
aWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZw0KPiANCj4gSW4gcGVyc29uYWwgY29udmVyc2F0
aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dCB3
aGVuIEknbSB0YWxraW5nIHRvDQo+IGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIi
IG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgLS0gTGludXMgVG9ydmFsZHMNCg0K

