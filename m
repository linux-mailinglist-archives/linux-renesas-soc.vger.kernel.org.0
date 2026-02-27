Return-Path: <linux-renesas-soc+bounces-28581-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wA0FMhfCoWkVwQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28581-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 17:11:03 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B501BA962
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 17:11:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 240B2306C44A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 16:05:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B66C44B663;
	Fri, 27 Feb 2026 16:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="c0/w5BUj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011036.outbound.protection.outlook.com [40.107.74.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913923803D6;
	Fri, 27 Feb 2026 16:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772208300; cv=fail; b=c/JhboscehjmalCM2U1T4BHNitdmln6tX0PBFYLb1k3zq+/yjdFdpPSkzcfK1K5PcB1gqUCdKpWJZCq2zmvu52aWuDMA2Dr63VlYqTXJ+dfjJKE6Kf18YUDEHD/f9+dz3V6uHD6bKNZ7dA8LB5GJ4CAIULSIfF8dZg2icIuGDis=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772208300; c=relaxed/simple;
	bh=2uZP0q1g1TeJWi4yNGXYYSpa355LeeuSCh4e5T4MUVU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=X8/HITm2M4bPQVvRX6G8ty0b5x9Ky7kZq6bTkHfXQiHn/HehrVi4vSBEM5G45FdSxFkYzy7dcFF88xaR8fiYBNvRdqIs9qc04+nf9xVb3qkhIOxgQ1guP8G8A3eGtD9Y/LAdliOc5U2loW/P6AP7Z/VCTkdfnrTSEFF1oBhMUSI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=c0/w5BUj; arc=fail smtp.client-ip=40.107.74.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ry5UQ5jhqi5FaF9qg3DM/SvpP38egxN2OZjxlQCs4i76GW2VMyffXVMn72ZSOE3LIXYIfHFmXdt7ZuFn0BlABht5NMzXChdolD9iINvObB8CSlW07hhV7F84aLeXWEGZtTqLhD6A3Y3ybXLm5j9cwq51xMqRv5f4yN3IL3QY9gkLeY1kqiEXS1pJxhJJdUtgTyOEd/9OjSrT5aBseoPi5P9Vy7avCI5woFC+HwNfzc9u68n6cIVWqQg3diNIDNXCT8+zUCOSHS8V6Ps6k0qCNL2X3b5US6zsMtcOY5hkxB4tPvr3O0uTrvrnZKkVaSpkhlg+mH06JYRrwagDCfjbCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2uZP0q1g1TeJWi4yNGXYYSpa355LeeuSCh4e5T4MUVU=;
 b=Pd3hkdgTOPseJmF86neN+tXxBGe5tYfpmWlf0cowxL6mkdoVOrzC891ALxR+zIFpjUduIKAyGtrzw3+2+R9y7Nw1gAphPhs4YZ3E9Il2sSPh9WTdnYZsKh/ppysg2pqSWqtG99qNG/T4JFNnITGcrcBaUftuTQHTYK09yNv+SqaaYpOSOdn1I0cPrhVkbOz3lJ3+YUJQE0J+8IjNkarq0bj62PBsT3dDt3PFj90Z0VT+qkCdrTJp5RUfAPT6Fh/k+s/FAzxgzrTEpZgzSldAEJ+v9aXMF/NdpITeI5kszaDRAFU4aQfTaYPvL/Zt5Nr7Y4udHyQeyKf3chh9ynNrEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2uZP0q1g1TeJWi4yNGXYYSpa355LeeuSCh4e5T4MUVU=;
 b=c0/w5BUjBioR0MqHOS7qcypeIdt7JJdU+ypWXyXvU+838kqilV0FIMH/XrgjJJoFtsxk6WGPsgDoKL8ZfcpU92+pCGYP9oqGyO5Ea3o95rwqFFrYNroPeqaJYQCQkAnTDJUOVDP5FGs2J6pB651zxDMasT0kaoDDg4OIfYrdyEs=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by TYWPR01MB10328.jpnprd01.prod.outlook.com (2603:1096:400:248::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Fri, 27 Feb
 2026 16:04:55 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97%5]) with mapi id 15.20.9654.015; Fri, 27 Feb 2026
 16:04:55 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>
CC: Brian Masney <bmasney@redhat.com>, Chris Brandt
	<Chris.Brandt@renesas.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 11/13] clk: renesas: rzg2l-cpg: drop determine_rate op and
 use CLK_ROUNDING_FW_MANAGED flag
Thread-Topic: [PATCH 11/13] clk: renesas: rzg2l-cpg: drop determine_rate op
 and use CLK_ROUNDING_FW_MANAGED flag
Thread-Index:
 AQHcp07a2hBuHvp1QU+n+sL4i/3plLWWNSeAgABwAgCAAAJagIAAAFuAgAAKfICAAACi0IAAAwsAgAAAX7A=
Date: Fri, 27 Feb 2026 16:04:54 +0000
Message-ID:
 <TYCPR01MB113325811800F548C99EEE7C78673A@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
 <20260226-clk-det-rate-fw-managed-v1-11-4421dd2f6dc6@redhat.com>
 <CAMuHMdWPiy2OYEntYNEMjkxYPrQBED2segMfND+4VtzdeQE6+g@mail.gmail.com>
 <aaGxrm0SqwaJWCph@redhat.com>
 <CAMuHMdXR1T-VUnk87qpCmdkrYZr=UbjRJNznLw3YV98JAoN=hw@mail.gmail.com>
 <TY3PR01MB113460B83239C8251DD2FA39F8673A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <aaG8v-y9UqsgOZxy@redhat.com>
 <TY3PR01MB1134626136D6AE06C9A699F798673A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdVfyfoETQ1dHPv7_N2Z-LJjw8DnE5T4YuOUNGpjqpsWZw@mail.gmail.com>
In-Reply-To:
 <CAMuHMdVfyfoETQ1dHPv7_N2Z-LJjw8DnE5T4YuOUNGpjqpsWZw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|TYWPR01MB10328:EE_
x-ms-office365-filtering-correlation-id: 37dfebd0-adc7-4b4f-585f-08de7619f2ac
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 MrP5B/J2D/zFQ/Hgu8Ej+ZDZkQRwQmUPHIbceoiZVR+D8HbdN9DBOIeG3ELz8ZdX9USM+z31Ig1QWadweACsrSRdb/Z0GN7f4Hmg72fuc2m1dDFuA11+lRgnKZjA7Ohsmv5qiKB3SsMZJhWcOQIvypKWuL4koJPNEFEzB4ZgX3xbre4WlV0BoATaKbHL+/nC+bFcpkKbap/9wu1TpJPTjeUfgucvEx0FBh8nG9uGU6sxe/bmScPJN3mrZ4xhEK91ye4RTJYjpL+vdZda+bg2SV3abbOwDzhctrqiwNow+g3XWTUklwc2RBGDKiRqYm0g6SXNZJjMfetNN4Wb4wEmDwJPQ3teTVREDkr7HLIvseRdK/2q2fLVnpKBDO4vOZZNduGYmP1eWmUmJEYK9iT6H1bXxgEiRNTEOy7lfnTGMHQMEQY804PeJ28i46/Bd8tzDyLJ22LLCP9s0ZmafP8lgmUleY1yMuVz0jGIH1gu6ZrvtwgZhUMoWfpK+a++Z13vrPiGnYslfL8FKLQxRaZCh8HW2TDfAtETEIF1TpCkjUBRlNi3VgonDCQlIcdPA1lBhMWEhKcD4hnXvbl7SO8773tgnFT4pGQVJmYppYUZ7me2VEHQF7JuD2xd+wD0AnfxtErsS/CRl8HTMXqry/a/a4/GLKupYwj2OfcievwJZ+luwDGT4Fx/z/aEKcjkotsNK3Mw69HgaYmhDNpRWu2m2B7ioBJlCbCJcHCbftdKuKU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OEFGYXZRTHRLSXQ5V0k2czIwSkxDRmdqMVlwRFBvZlVyLzNYVmVxTStmVTk2?=
 =?utf-8?B?Q0JuZmNGaVFpZEhZa3hzTk1qM0p2ekdZb2o0S0NtandSa2lzTmRvRmMvMm9n?=
 =?utf-8?B?Q3B1ampPSDRrdzh5ODN6NlNxOWNTcjNVZE1DK1J5NitodEt3eTBQUzFQQWw3?=
 =?utf-8?B?d1pCWGFrbjJiOFFsM1hxVlR3UmlCcDJRWUF2NkZMQjJpNWp2dHdyYXlNRG93?=
 =?utf-8?B?RDdKU01lR1ZibWFxd2c2U3BKTlprVE5LQ0s3dHNuRGpJTTNLNkRsWmUvenpV?=
 =?utf-8?B?U2x0ditUUHVMbWpMWXQ2dW5jeXo5TTdja2t0N08zNHVDVkNWTit5OXdnTkdr?=
 =?utf-8?B?K3c4OUQrOFpHZGptQ1c4L0trUXdpaG5WZkNsT0JxZDlyaERMS2ZMTER0NHQr?=
 =?utf-8?B?U0dqQWdLcTVNeDBES2QyR1ZIY01UVVlHWGRFejEycGxPamVLNWxrYWp3R1ZN?=
 =?utf-8?B?VGZmbTlSbU5jV0xsWHdCSkFXVWp0bmxCbWdkMFB4cDc1d1RvRHpHTFFHcS9V?=
 =?utf-8?B?OXdMekZ2ZFVNR3hzb3VWVGVaZnl0YzBUV1lrbzF5Nk1panI0UVBIdnUxTFYv?=
 =?utf-8?B?QWhyUEdzMTJ3andUSFlEZm8xaHBqVi9EdUxUM2ZITWlaNWQ2OXpXR0dkS2h0?=
 =?utf-8?B?a3JOa2xTRXp4SGl6VUhERFgzUjFsbDR3R3hRenkzYlhySDFVS2oxZkFadUxT?=
 =?utf-8?B?NTdsY291ZTA0UHArVWtjK3lOcno0YmFKRldsczVlVEhCNzlXdEtCZG1DcmIx?=
 =?utf-8?B?MUh6L2gzRVhRTUhVdXhYcFpYWm1iclBGUk5NUG9GVS8ya2NYSkNvOElRUzVv?=
 =?utf-8?B?Q0R1SXBzMm1EYTNFN1EyL1hXNFhONnUzM2s2NThjdmkzWHlYWTlaSGphY25F?=
 =?utf-8?B?QWpNcU9kbEFQMUN5OTA3Qm1QcTY5eGhNTnJUVUhNWlkvNVl0TzZwM09iZURZ?=
 =?utf-8?B?d3I4WG9OUFJ2TlprRnVySno2N1QxRlBhUldRY25jR3NqY2RjUE1lZ3dHdjZo?=
 =?utf-8?B?eENDS0lKMGEwR0hhc0I0K3J0QjhnNE5Qd0dBaE9PcDc2S2JDV0dkaG5GRndk?=
 =?utf-8?B?RzNvanhIVmpOMGRRRzJObTNtaFlBZm5tdjZ6dHVLZVlIMnRSSDFJdkZFQjRU?=
 =?utf-8?B?V0xSRkNwcVJsYjUrNndFTUtkOXhENmNUR2JHdjJWUVFud3ZtTExkT3hDK1hV?=
 =?utf-8?B?VUNYVjFOT1FLZFpvMDF5aWFYcXNoSFpSOEprRUsxaXQvVVlTY0U5cFZNM2to?=
 =?utf-8?B?L2dyNnJTYkZiMWFJRzlObTJSeFlVZ2lsNld4NENxYVUwc2pRc0dYZUdua0Iv?=
 =?utf-8?B?eTJGZ1IyajNxa0dJUVZSbTBqWlRhQmF4OWNVaDdMVWwvT2MwZXByVjVOMGlS?=
 =?utf-8?B?ZEtsZHUxakNKYnpxWGtNakxHR2hGd29RdmNQSndxN0lSd3Z1MlZBaFA1bUdp?=
 =?utf-8?B?bWhaa09iVjRuOUJyejArNWYrTFcxVXVSN3NDSEtLS3JNR01ZNDBvMkRNVTFm?=
 =?utf-8?B?RjNHUWRWanJlUUUrV2JoYmdRS0p0MkNZdWxPdUR1S3RPTGNJcm41c2JzRXpZ?=
 =?utf-8?B?d0p5ZEhUcktJYngzZWgxaUdGV1Z3UFRIdDhqVk9mTFQ3a0N2RXlQUmViZUJV?=
 =?utf-8?B?S2V4NWxmM2lNbDhLL3MzeENKdit0Z24xYmxmZFZTV2FMdy9zME4xTjhCS2x0?=
 =?utf-8?B?clVSdzBaRHdHUWtTbmQ5ZlNQNWxlTUtqaU42cVpmV3BlbUhkdjBidTZYZzFn?=
 =?utf-8?B?VVF4TUxCR21VNjhEUXZmdXRmeVBINXBPRXdyL3NtMjlyNFh2NVM0NTZjcGNZ?=
 =?utf-8?B?TkdpZ2NHYzZRSkt3UEtaWlZla2tVWXVhYldPUmxhMEp6ZFpMQXJUbXJnUDhZ?=
 =?utf-8?B?MEhyQkJnMW04a1pJVWlkZG9xbWVkNFRLQzdPejJqTytidzZwTDFDS1grSGlP?=
 =?utf-8?B?WEtXZlAvd2lYeHNkTVQwNGVOSENXNHJ1amdEWk1SVmE5dGEzVzlLMXVxSGJ2?=
 =?utf-8?B?SUFhSHlkdW1PVjVEUGlkSWx5RzBwalNBaXRvakN4WnhRMjNjYUk1QVNORTkx?=
 =?utf-8?B?Y0pHVjlpaitaMHJwY3JmTHBkbWROZ0prY1BkM0JCdE8zT09zR3ZDZ2VSM2o3?=
 =?utf-8?B?RDhyTVFEcVlOdXh4VFdGMVBjYUk1SmJsN2wrVjFaWHdER2szUFNTQkZ2Szlh?=
 =?utf-8?B?Z0hXN05yYjE2VGxSdjkvaXlXaU8yRlRvMENzUHlpODVtYnNORkpWRng1blBr?=
 =?utf-8?B?dExnZ1pGcXh0MGVqR3R0bm4zNk1Wc2V3dHdjWFZIZUh5SldyeUEvY0swUEJp?=
 =?utf-8?B?V1p0WExNcUk0N010dmNVMlR6WGk2TTNwWTgwUHNTVlFJTVN1U0xzdz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 37dfebd0-adc7-4b4f-585f-08de7619f2ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2026 16:04:55.0723
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SjE14bsT2A9c2af0M/YhpbLPUUlABjw5bMOPPBvivlQlIbvrdQeycdDV6osX/yv9zlN9pE/2N8MIDTGyxWRoxulOyfIUZ5dAlznL7BySfX0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10328
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.94 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28581-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[init.name:url,linux-m68k.org:email,renesas.com:email,bp.renesas.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,TYCPR01MB11332.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Queue-Id: A8B501BA962
X-Rspamd-Action: no action

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMjcgRmVicnVhcnkg
MjAyNiAxNjowMQ0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIEZyaSwgMjcgRmViIDIwMjYgYXQg
MTY6NTcsIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4g
PiBGcm9tOiBCcmlhbiBNYXNuZXkgPGJtYXNuZXlAcmVkaGF0LmNvbT4gT24gRnJpLCBGZWIgMjcs
IDIwMjYgYXQNCj4gPiA+IDAzOjIzOjE5UE0gKzAwMDAsIEJpanUgRGFzIHdyb3RlOg0KPiA+ID4g
PiA+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+IE9uIEZy
aSwgMjcgRmViDQo+ID4gPiA+ID4gMjAyNiBhdCAxNjowMSwgQnJpYW4gTWFzbmV5IDxibWFzbmV5
QHJlZGhhdC5jb20+IHdyb3RlOg0KPiA+ID4gPiA+ID4gT24gRnJpLCBGZWIgMjcsIDIwMjYgYXQg
MDk6MjA6MDlBTSArMDEwMCwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOg0KPiA+ID4gPiA+ID4g
PiBPbiBUaHUsIDI2IEZlYiAyMDI2IGF0IDE5OjE4LCBCcmlhbiBNYXNuZXkgPGJtYXNuZXlAcmVk
aGF0LmNvbT4gd3JvdGU6DQo+ID4gPiA+ID4gPiA+ID4gVGhpcyBjbGsgZHJpdmVyIGhhcyBhIG5v
b3AgZGV0ZXJtaW5lX3JhdGUgY2xrIG9wLiBEcm9wDQo+ID4gPiA+ID4gPiA+ID4gdGhpcyBlbXB0
eSBmdW5jdGlvbiwgYW5kIGVuYWJsZSB0aGUgQ0xLX1JPVU5ESU5HX0ZXX01BTkFHRUQgZmxhZy4N
Cj4gPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEJyaWFuIE1h
c25leSA8Ym1hc25leUByZWRoYXQuY29tPg0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiBU
aGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gLS0t
IGEvZHJpdmVycy9jbGsvcmVuZXNhcy9yemcybC1jcGcuYw0KPiA+ID4gPiA+ID4gPiA+ICsrKyBi
L2RyaXZlcnMvY2xrL3JlbmVzYXMvcnpnMmwtY3BnLmMNCj4gPiA+ID4gPg0KPiA+ID4gPiA+ID4g
PiA+IEBAIC0xMDQxLDcgKzEwMzQsNyBAQCByemcybF9jcGdfc2lwbGw1X3JlZ2lzdGVyKGNvbnN0
IHN0cnVjdCBjcGdfY29yZV9jbGsgKmNvcmUsDQo+ID4gPiA+ID4gPiA+ID4gICAgICAgICBpbml0
Lm5hbWUgPSBjb3JlLT5uYW1lOw0KPiA+ID4gPiA+ID4gPiA+ICAgICAgICAgcGFyZW50X25hbWUg
PSBfX2Nsa19nZXRfbmFtZShwYXJlbnQpOw0KPiA+ID4gPiA+ID4gPiA+ICAgICAgICAgaW5pdC5v
cHMgPSAmcnpnMmxfY3BnX3NpcGxsNV9vcHM7DQo+ID4gPiA+ID4gPiA+ID4gLSAgICAgICBpbml0
LmZsYWdzID0gMDsNCj4gPiA+ID4gPiA+ID4gPiArICAgICAgIGluaXQuZmxhZ3MgPSBDTEtfUk9V
TkRJTkdfRldfTUFOQUdFRDsNCj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gSWZmIHRoaXMg
aXMgdGhlIFJpZ2h0IFRoaW5nIFRvIERvIChUTSksIGl0IG5lZWRzIGEgY29tbWVudCwNCj4gPiA+
ID4gPiA+ID4gYXMgdGhpcyBjbG9jayBpcyBub3QgbWFuYWdlZCBieSBmaXJtd2FyZS4NCj4gPiA+
ID4gPiA+DQo+ID4gPiA+ID4gPiBCZWZvcmUgSSBzdGFydCBhIGxhcmdlciBkaXNjdXNzaW9uIG9u
IHBhdGNoIDEgd2l0aCBtb3JlIHBlb3BsZQ0KPiA+ID4gPiA+ID4gYWJvdXQgYSBuYW1lIGZvciB0
aGlzIGZsYWcsIGhlbHAgbWUgdW5kZXJzdGFuZCB3aHkgdGhpcw0KPiA+ID4gPiA+ID4gcHJvdmlk
ZXIgaGFzIGEgbm9vcCBkZXRlcm1pbmUgcmF0ZS4gSXMgdGhlIGhhcmR3YXJlIGV2ZW50dWFsbHkN
Cj4gPiA+ID4gPiA+IHByb2dyYW1tZWQgd2l0aCBhIHJhdGUgdGhhdCdzIGNsb3NlIGVub3VnaCB0
byB3aGF0IHdhcyBwYXNzZWQNCj4gPiA+ID4gPiA+IGluPyBPciBpdCBkb2Vzbid0IHJlYWxseSBt
YXR0ZXIgd2hhdCB0aGUgY2xvY2sgcmF0ZSBpcywganVzdA0KPiA+ID4gPiA+ID4gYXMgbG9uZyBh
cyBpdCBpcyBydW5uaW5nPyBPciBzaG91bGQgdGhlIGRldGVybWluZV9yYXRlIGZ1bmN0aW9uIGJl
IGZpbGxlZCBvdXQgaW4gdGhpcw0KPiBwYXJ0aWN1bGFyIGNhc2U/DQo+ID4gPiA+ID4NCj4gPiA+
ID4gPiBJJ2QgbGlrZSB0byBkZWZlciB0byBCaWp1LCB3aG8gYWRkZWQgdGhlIGVtcHR5IHJvdW5k
XldkZXRlcm1pbmUgcmF0ZSBmdW5jdGlvbi4NCj4gPiA+ID4NCj4gPiA+ID4gUExMIGlzIGNhcGFi
bGUgb2YgZ2VuZXJhdGluZyBhbnkgZnJlcXVlbmN5LiB0aGF0IGlzIHRoZSByZWFzb24uDQo+ID4g
PiA+DQo+ID4gPiA+IEJ1dCB3ZSBjb3VsZCwgY2FsbCByemcybF9jcGdfZ2V0X2ZvdXRwb3N0ZGl2
X3JhdGUoKSBmcm9tDQo+ID4gPiA+IGRldGVybWluZV9yYXRlKCkgYXMgbW9kaWZpZWQgcnpnMmxf
Y3BnX2dldF9mb3V0cG9zdGRpdl9yYXRlKClbMV0NCj4gPiA+ID4gY2FuIHJldHVybiBlcnJvcnMN
Cj4gPiA+ID4NCj4gPiA+ID4gWzFdDQo+ID4gPiA+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHVi
L3NjbS9saW51eC9rZXJuZWwvZ2l0L25leHQvbGludXgtbmV4dC5naQ0KPiA+ID4gPiB0L3RyDQo+
ID4gPiA+IGVlL2RyaXZlcnMvY2xrL3JlbmVzYXMvcnpnMmwtY3BnLmM/aD1uZXh0LTIwMjYwMjI3
I241OTANCj4gPiA+DQo+ID4gPiBPSy4gU28gaG93IGRvIHlvdSBhbGwgd2FudCB0byBwcm9jZWVk
IGhlcmU/DQo+ID4gPg0KPiA+ID4gRG8geW91IHdhbnQgdG8gZmlsbCBvdXQgdGhlIGRldGVybWlu
ZSByYXRlIGluIHRoaXMgZHJpdmVyPyBJZiBzbywgd2UNCj4gPiA+IGNhbiBqdXN0IGRyb3AgdGhp
cyBwYXJ0aWN1bGFyIHBhdGNoIGZyb20gdGhpcyBzZXJpZXMuDQo+ID4NCj4gPiBXZSBwbGFuIHRv
IGZpbGwgb3V0IHRoZSBkZXRlcm1pbmUgcmF0ZSBsYXRlciwgYXMgaXQgY2FuIHJldHVybiBlcnJv
ci4NCj4gPg0KPiA+ID4NCj4gPiA+IFNpbmNlIHRoZSBQTEwgaXMgY2FwYWJsZSBvZiBhbnkgZnJl
cXVlbmN5LCBkbyB5b3Ugd2FudCB0byBrZWVwIHRoZSBlbXB0eSBkZXRlcm1pbmUgcmF0ZQ0KPiBm
dW5jdGlvbmFsaXR5Pw0KPiA+ID4gSWYgc28sIHdlIGNvdWxkIHVzZSBhIGRpZmZlcmVudCBuYW1l
IGZvciB0aGlzIGZsYWcuIE1heWJlIENMS19ST1VORElOR19OT09QPw0KPiA+DQo+ID4gSSBndWVz
cywgbWF5YmUgd2UgY291bGQgdXNlIENMS19ST1VORElOR19OT09QLCB0aWxsIHdlIGhhdmUgcHJv
cGVyIC5kZXRlcm1pbmVfcmF0ZSgpIGZvciB0aGlzDQo+IGRyaXZlcj8/Pw0KPiANCj4gSnVzdCBr
ZWVwaW5nIHRoZSBlbXB0eSBmdW5jdGlvbiBzaG91bGQgd29yaywgdG9vLCByaWdodD8NCg0KWWVz
LCBpdCB3aWxsIHdvcmsuDQoNCkNoZWVycywNCkJpanUNCg==

