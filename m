Return-Path: <linux-renesas-soc+bounces-31097-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJaYDs6t12kMRQgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31097-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Apr 2026 15:46:54 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 419B03CB814
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Apr 2026 15:46:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DF23630288A1
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Apr 2026 13:45:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDC723BED1A;
	Thu,  9 Apr 2026 13:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="f3O/oBj/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010041.outbound.protection.outlook.com [52.101.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E8E385513;
	Thu,  9 Apr 2026 13:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775742325; cv=fail; b=nMtLANCPGLfNqGxeXHh2ZCaAcZXjfxNySP7+vBQCxZMZ7esVa7qdmjOThi+pTuCNmLp8DqjXpCD1BE3roptlc/354f1Z79iDbXZRBWnnoBN5uFzpM7L8No7zJVPMSBkDhEoCBsuCILXJSVSO/PkaftaB+53PfpjpzzIh1syoCP0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775742325; c=relaxed/simple;
	bh=QAB+ZO6fqhqHxyuLa6h0q25+pWe4Y7ysnTDd6CF5tzk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UYccCyPm8qWu8hg9BBZjJctPdomkfE6pf2h5q1t/b7bdPIZiOCEx+8Khj0I0juFzWfOVAaiDEu0jFWlU4nY5Y1nQGdIOCAKVmMHH1q9K4iiZ0q5VH4X5ebIBkzJOOuL+6gszs+T+T9RJ3donymKWOL69bpHeJq2reSVOrvFUufw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=f3O/oBj/; arc=fail smtp.client-ip=52.101.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ECYIHA4Tr+E0wGvlaq4ZjMRHb/f8523/saPw0wInkuXIv4VBVbswZhfZicn40MeQshnhbPArhXUHBvTWlusP6utVOzCDaWjG+fNPKItL5zHMe2EXGFRn641ZuYIs1i/N9PvFG8VFpvfpWpG+cwsfCDWt90shrCMsEgUQc0WpDNKzI9K622E3hUKdpBXV7rm5R9AmxeIQ38Rkn9XQKv0Q2d+XgRyYgmaJF3OsBduP28cFzHPDdqH9tdBroTEHib30VO5AYRISt4aFk9fvYBLU42HXI/89JF8Ux1pQMVWkL31CLKYogykrIP9C9Wx0InYdxUp1q4yhx4j8Apew7r/uQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QAB+ZO6fqhqHxyuLa6h0q25+pWe4Y7ysnTDd6CF5tzk=;
 b=Czs+kgz1Ca+Ns5G9qgnyjZLWjx1s9m8u+hemsW/5mZ4earjJZvbqYqMlS8hpZjuhcPzehsiDz3yVUejW1FVkjxhO1LiBFzHbAcpt7hGcc8Q4wlptJTpdoHkiLg1l/yg9v3Mzx4MCmNonfi0xuT31suck7+afDcLaKFg2osOSGkg2j8QZg514QwtcSIIoUvr4/NNBAsBqgXHprW12tKqmptMy4QLgG+nNBRoorCpuiO1r/rAHPMMiQPT5OB+mZg0fUsuvyAyQ81Twq/4Kvtq5KU2YIVDd8FUtxWSy2a8WEUzwtvW56c6oUEZgHrt2CfiTky1celGT9TgV6rmMHOnb+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QAB+ZO6fqhqHxyuLa6h0q25+pWe4Y7ysnTDd6CF5tzk=;
 b=f3O/oBj/FJ+6G7qnFTkT5DkSqTV8UhWhjEmcxCJ5Gzos3T1qsF7TyMfd559cWpgn/mDK8LWvrpDy50Br1+HqgVoSmOGYLRyBhVZrRfnfaRz4kHrwiIlkzVpUrqvmw/74N7RCZsls9yx4Ns9JP0C/xMm7pWecJD2SdlW09AIRoDg=
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com (2603:1096:405:20d::9)
 by TY3PR01MB11840.jpnprd01.prod.outlook.com (2603:1096:400:407::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Thu, 9 Apr
 2026 13:45:22 +0000
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::655d:9c47:4499:eb3a]) by TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::655d:9c47:4499:eb3a%5]) with mapi id 15.20.9769.041; Thu, 9 Apr 2026
 13:45:21 +0000
From: Michael Dege <michael.dege@renesas.com>
To: Paolo Abeni <pabeni@redhat.com>, Yoshihiro Shimoda
	<yoshihiro.shimoda.uh@renesas.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, niklas.soderlund
	<niklas.soderlund@ragnatech.se>, Paul Barker <paul@pbarker.dev>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH net-next v3 04/13] net: renesas: rswitch: add register
 definitions for vlan support
Thread-Topic: [PATCH net-next v3 04/13] net: renesas: rswitch: add register
 definitions for vlan support
Thread-Index: AQHcwPXA55AXkHyJX0Gw0gJ8kHqA9LXLwBOAgAsL1fA=
Date: Thu, 9 Apr 2026 13:45:21 +0000
Message-ID:
 <TY4PR01MB14282E6B15C346D9A4562968882582@TY4PR01MB14282.jpnprd01.prod.outlook.com>
References: <20260331-rswitch_add_vlans-v3-0-c37f41b1c556@renesas.com>
 <20260331-rswitch_add_vlans-v3-4-c37f41b1c556@renesas.com>
 <9c101981-4a85-48c3-ad0c-c16a362929eb@redhat.com>
In-Reply-To: <9c101981-4a85-48c3-ad0c-c16a362929eb@redhat.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY4PR01MB14282:EE_|TY3PR01MB11840:EE_
x-ms-office365-filtering-correlation-id: feea34e2-5001-4433-8865-08de963e3e52
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|7416014|366016|22082099003|56012099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 Mq5OE6sJBzTRy8I88fgN/1lVGvS3xRbEJ5KXmad7gAEgl0IUl55U4EuY+8Rp2PrwnfozAUWw5RYmFBRpWPGfBCELN6jrKaGSct6hB4GUoNdOmiApl2JDFai45G/7Ucx+U4qDmVyy843bWg+1cshMUbaPJs39FGflbj4CKwrq8p5CcR5EkvDQ9Mw9Aw2mqirkrQk8Xwr7QbjrCr7b5lRBrNbhI2dheTX86pD03qe2nRvbuTVZLbu/l2L/xfcG62LKEtG7afFUH2wCpwXsGH4i5gaRKCPGFXq+AHZssB9C9FBpCpNh5z6Y2lybFFMCjOytKmT4c3E2v2o5oYneMbzYz0m1y7XAYcxrYWUJSIuJYxTi/Ll/Yc2YZvV4Uj8gH2wc09LKNQvnvZNbYME5k9ul+25ApBlpUEXTMUTV7oeR+0ljnQ7c9yFSLctHnTNGH0RTYId4mjJmC/tOhEDYDhFNydG4BIUrdRnyAmM2RTtemM6WMbTIEGZYbnRxLO4mD2aSd46I01NEsM7iOHDOREJbIyK+3nk0yKwn0mkfVmvx6umxEIJZyScZdzNYZdI5tTPll0y735D1faLG24OSz/88DTfEMutbC3khb5RP3c8pFqZcvI+qtiz2jc0ehV1Qwof3mEtFbIQZ9K8UwkjxpeJ7iY2fCaRfNoIjn0qqpht8W9tB5PjsFcLXXViXEKrqkYK2CPS0OPYS0zwWS2U25RCdUs0RO18TqzsEDKlRS9LqQYm7e8nHUVKx7K1f/7xzSVFBwNA3yqTrJ+e8wyRhKUKpMs0jaDNRx5FhLqW82nPvU04=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY4PR01MB14282.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(22082099003)(56012099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eThnckdiRG52c0FaeVNoQ3hLdWN5NTlnR0lVOE5hcEFwS2hJNkhhUmtMU3Ns?=
 =?utf-8?B?MFQ1OEhYNDN6ZlN3UlhHMEJhVmNiMURnVG5ZYVBZdGs3WDBHYWVFTkVKSWZZ?=
 =?utf-8?B?TEJiRm9nd0ExRG93cHJUczk5b09zRUFjTy96Wmk4TzlhVUkxRHVqaS9BSXIx?=
 =?utf-8?B?WjZqL0JkTlY1UmhLbzRDUVpmZzdnMWY1eXBKU0tqK3BvcjFoSU1KaEhKODMx?=
 =?utf-8?B?ZlowbjZkWGxkZVF6ZEcxZFVzWE8rTG8wcSt5djJVYi9ScHpVRnVRTlNHbkM2?=
 =?utf-8?B?c0VHaTVkb21KcTFWeWR0Q2dJa3V0ZFM2ZkNYUmFyVUFoYlBGQmgvNzJPaEZV?=
 =?utf-8?B?TEFZZ2xQL1dscjUrNkxDbGNiWWloY1FJRzA1TjhrZjNmam1xYlFiQXJwKzdC?=
 =?utf-8?B?bW92NEovUkVDUHBlaGtHVmNtQUxMZ204cERQcHN1TXl4aFdqZUE5V05oK1Q3?=
 =?utf-8?B?dVZqOGN3MWdTN2VXNDJOQ3loUVNzaFF3aEwzcU9janIrVHlpcnlqdVFiYTNy?=
 =?utf-8?B?OFZnRXRMVFlHV2VTQ1R0c0pnQzk5UVlmbk5IbTZyU3daSGFTUHFDMTkydlVm?=
 =?utf-8?B?bUpza0haakYyOGRPT3AzQTdoUStsbEMrMFBIL2JGY1hqVG1VTEV0QzkwZEdD?=
 =?utf-8?B?b3BWM05KYUFmbHo2SjNoMWM3VktwaXZ0UXBJSHZwMlo4OXUveldCcDd6U0h6?=
 =?utf-8?B?VVdlTHc5K0kwcXoyajQzNzZuVkw2SnNBem1kZzVTREo0K2QzZmFQWjJpUW9q?=
 =?utf-8?B?TVBocG9ORGtNdlY4VUlCYTFmcEpxUnpFako4Q0lBY2o0am1NYjNwUGRFSkVl?=
 =?utf-8?B?WUsvMGFKYkVoaEwzTE1uaks0RWtiTURoMGUxSk9ETnpKUXBCVkVIR0QrdHRZ?=
 =?utf-8?B?WG02cy91Uzc1SE53NnVwYjhmcHRrWE9sa05IcG5vb21SM3N6Wk1KWWJJRE5j?=
 =?utf-8?B?Y3RBUS9ObndLN2d0Rk1jNis5VE90L0tSRzlvQlhWWHV6dnljdkt2VVJ0bTRM?=
 =?utf-8?B?SXFJWExhR0xhUVZTbTdGRVlNaGdpZ2ZEQURaQzBveGh3SVJuRWsrU1Z4eDA5?=
 =?utf-8?B?VXMyMGtaakFKbUdmS0Y2TVFCdG5tK3hzanFaSUh1R0NVdGQ5alg3d0oyYWpz?=
 =?utf-8?B?bjVLM1BKVGkyWnp1cmFzRlBuZWtTcFNmcVhkZ1VDUVdsTk92VGhpZGRXKzBW?=
 =?utf-8?B?cVJDOVV6dHlJUDNPUDBIMG5VckpPS3BOb1NSSDYzOUM0MVB4R1Nsd0I3bkhs?=
 =?utf-8?B?d3lydXBSTWRmOWlhRjFnaFJPVG1nM2hLWHp3RjdNMHJRdG9BcFJieFRTZ25B?=
 =?utf-8?B?Z0F3TGJPU0VlSnRxUCtFSVpXYXViY2NZWG80WlBrSWtlSFk0Tnp3aVlMREVE?=
 =?utf-8?B?ZUdZaUdJc2hndGg4TFE0dUZQZjNmcTduNHBnbS9ZUjB4Uld6SFBrbEgwOHZl?=
 =?utf-8?B?U28xNE53by82OC9QWUwrMktNSWhNaCtyRlFZSnI0QndlV01URDdoRUlualFZ?=
 =?utf-8?B?SVJPWm1VNVBvaVgwZ3JCQzZ2WTErVk1KUjlIenFUTFlKN3NQVjR6WlZweE9l?=
 =?utf-8?B?YWw3bGlhajl6dm9CQkV0bUtiT1k4YmVLZWQ5RTlDQmthVTRrMGQ1b29TdEpm?=
 =?utf-8?B?TnZSRDlOdFE2U0U0U250QXpqT0h4cmxlMmh5M1V2eTlmYWRESUVlVFcxYURN?=
 =?utf-8?B?RlN1bGc5NzdER0N2OXlhZXlrOThyRG1BbTZHV0xGeGxJOGxub1F4UDg2R2I3?=
 =?utf-8?B?dmgwOHJGRDh6d0hNUm5jM0dNRENkajF4Z2dTZC9rSlY4aTBXL0ZWNFFHNU1V?=
 =?utf-8?B?VTltY2JvOFVvVU5RVXdGZERiRWdSRlY3WjEzS0w3MnRodWJ0Q2hoRUhrK2k3?=
 =?utf-8?B?RnhEVS9pellDeWFaRUJGblovREZFMUF3UTdYVzQ3VFU0QkhsWkxoMDNweWVR?=
 =?utf-8?B?VERPRnRTZG9ldGlFZFNTRDRqdWQwYUZXN3JwNzFvaVBlVHUrUC9aaCtOU2xv?=
 =?utf-8?B?TEN2ZWNRakhJNmIrd0htUFVDYytOR2JsMVFuU3VwbFN6d1hKWHNycXNxMndB?=
 =?utf-8?B?a1JhbTQrcEU3bFFob1hsT0puNC9yWXVZL0VwQXhqWXMzUkdoM2FZMkk1YWgv?=
 =?utf-8?B?TUVVSnlNU2wwaXc0SlFiZXFERGJid0hjVjFVeFk5aHQyUmhGWWF1RlRmdmdB?=
 =?utf-8?B?bG5yRkxPSTJWYnlPeG9OYUtsdWZnUWhON1E2Q2FLdExWUmpRL1oxK1AwMzBt?=
 =?utf-8?B?amNiTE50YWc2aVBWU3VYc3dxSWluMUxpVnRxbEMrNk9MdDVzSmNwVStBdGpO?=
 =?utf-8?B?d29iZTQ3OXNISnc3VFNOUWEvZ1NyRDlkMXNmMTMrQkpJSzQ5ekZlZz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: feea34e2-5001-4433-8865-08de963e3e52
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2026 13:45:21.0640
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0zwtLHtGlv8MonG8m7d3I/+oAUEcecGjonkWHzBJbMVCR8FYmsE8F4omnLmZadD5zh/5csvI3qTYXrygxtWhdOQV5uEdJOBh/cILiPzQjBA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11840
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-31097-lists,linux-renesas-soc=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,davemloft.net:email,renesas.com:dkim,renesas.com:email,lunn.ch:email,TY4PR01MB14282.jpnprd01.prod.outlook.com:mid,pbarker.dev:email,ragnatech.se:email]
X-Rspamd-Queue-Id: 419B03CB814
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGVsbG8gUGFvbG8sDQoNClRoYW5rIHlvdSBmb3IgeW91ciBjb21tZW50Lg0KDQo+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFBhb2xvIEFiZW5pIDxwYWJlbmlAcmVkaGF0LmNv
bT4NCj4gU2VudDogVGh1cnNkYXksIEFwcmlsIDIsIDIwMjYgMzowMyBQTQ0KPiBUbzogTWljaGFl
bCBEZWdlIDxtaWNoYWVsLmRlZ2VAcmVuZXNhcy5jb20+OyBZb3NoaWhpcm8gU2hpbW9kYSA8eW9z
aGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+Ow0KPiBBbmRyZXcgTHVubiA8YW5kcmV3K25l
dGRldkBsdW5uLmNoPjsgRGF2aWQgUy4gTWlsbGVyIDxkYXZlbUBkYXZlbWxvZnQubmV0PjsgRXJp
YyBEdW1hemV0DQo+IDxlZHVtYXpldEBnb29nbGUuY29tPjsgSmFrdWIgS2ljaW5za2kgPGt1YmFA
a2VybmVsLm9yZz47IG5pa2xhcy5zb2Rlcmx1bmQNCj4gPG5pa2xhcy5zb2Rlcmx1bmRAcmFnbmF0
ZWNoLnNlPjsgUGF1bCBCYXJrZXIgPHBhdWxAcGJhcmtlci5kZXY+DQo+IENjOiBuZXRkZXZAdmdl
ci5rZXJuZWwub3JnOyBsaW51eC1yZW5lc2FzLXNvY0B2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtl
cm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCBuZXQtbmV4dCB2MyAw
NC8xM10gbmV0OiByZW5lc2FzOiByc3dpdGNoOiBhZGQgcmVnaXN0ZXIgZGVmaW5pdGlvbnMgZm9y
IHZsYW4NCj4gc3VwcG9ydA0KPiANCj4gT24gMy8zMS8yNiAxMjowMyBQTSwgTWljaGFlbCBEZWdl
IHdyb3RlOg0KPiBAQCAtODQ3LDYgKzkwMyw5OCBAQCBlbnVtIHJzd2l0Y2hfZ3djYV9tb2RlIHsN
Cj4gPiAgI2RlZmluZSBGV01BQ0FHQ19NQUNBR09HCUJJVCgyOCkNCj4gPiAgI2RlZmluZSBGV01B
Q0FHQ19NQUNERVNPRwlCSVQoMjkpDQo+ID4NCj4gPiArLy9GV01BQ1RMMA0KPiANCj4gUGxlYXNl
IGFsd2F5cyB1c2UgLyogKi8gZm9yIGNvbW1lbnRzDQoNClVuZm9ydHVuYXRlbHkgLEkgbWlzc2Vk
IHRoaXMuIFdpbGwgYmUgZml4ZWQgaW4gdGhlIG5leHQgdmVyc2lvbi4NCg0KQmVzdCByZWdhcmRz
LA0KDQpNaWNoYWVsDQo+IA0KPiAvUA0KDQo=

