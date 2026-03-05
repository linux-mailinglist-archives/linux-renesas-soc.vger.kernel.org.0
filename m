Return-Path: <linux-renesas-soc+bounces-28905-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHpqG7W2qWlEDAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28905-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 18:00:37 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD3A215CC3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 18:00:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 278BA3007A57
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Mar 2026 16:58:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 919823DA5B2;
	Thu,  5 Mar 2026 16:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="w4jeAvOI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011037.outbound.protection.outlook.com [52.101.125.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D203CF678;
	Thu,  5 Mar 2026 16:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772729884; cv=fail; b=qdq2APlBjtBhChiOVwQ0NkBrgL9SNxGLHysMPbG8TKe1bniJ4nohYNQm73jrKYCH8n6K1j61dnXl6bci5Tmc7AieFcZ2sF4n0pY33g+wkpT5NfLfcqqU3kAp02efcYaDKidAmuGBo4bi44QTEXNtidMxh4sRoTVsXRQfCcrqcUU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772729884; c=relaxed/simple;
	bh=Ooz1eZh7gMz+v+HzjPqg9vnLJWw44+/YVkITTo89lYg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qTM7lGTeotVngyMv15WAlBlYs8uoIrF2qkBSTKXFZx6gtwT1yPKiM0vdZ3dE1CWMZFblrTtdGiPiyEZjYe1DSjMyEdZZ0CikPpSHSPExJliGV2o8c/3+Pjue7eyXpPjilCTnlw7jHPf/rcKQnBJdnQp8sLOxB1zCUOSUv+632as=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=w4jeAvOI; arc=fail smtp.client-ip=52.101.125.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q4mfGa3/ZVagcpE2f4yjQg+H6y1hdtPmrtGTEFIEL/jvwlmg8nHCHtYnQ9S6Xc/WO1A4dfhJJKoIa/sTQ4Tz2jiK1g94FOTix37XHWXSKtZaPAyQyNmtwA9XcKPE4RHI+xU5DlbnQoBM/hKKcK0th+QD7kuFDQpmIh72C8wrIHy58bWqJFZO73z226wOvu4xV4MNwiC+uxefX6VyGvVZX+/m4ujTDslOJLy1cVBjJNxJcGUC6OZdcWXB6vG41O0qBDZR+eooW671HuQXUaKJAjENXHoDGLCdbAkekQT9Dorgf2CwOtilS6nqp4cimhhMpfe5F8iCAhG8CnNmoBHEfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ooz1eZh7gMz+v+HzjPqg9vnLJWw44+/YVkITTo89lYg=;
 b=A9uIU+tXZizIGZKMIFOkbPe+/aqnPEh7p24px23pBcxsQsblwXGaHDJdTuvbN+k4rotwlWsge9tXd0B7HQ4TiywddOQ55L1zlPkfzB7b490wXvuqQ1KYptYNZDf1MWaB98w8qjy7jNcwZ6G9GscQK6+vKxk7AOvory64MhC8EZS6QH9hg8ORq4bzNpf7deDlPSpvURBTn632YTc9lcQafhb7V6RlI1qH22x8LUNrD1lwdcNY3bXg6UV0tg0UzKMZecvJCUvcCs/872URFPrMQorjiIOcPAxSYsBklqRsvIzGRWEfx48bqK2TjE8TOj251o8wKqHsrvV6DmqviruQAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ooz1eZh7gMz+v+HzjPqg9vnLJWw44+/YVkITTo89lYg=;
 b=w4jeAvOI4Q587+nEMdrJRtkKRBGTygLbM2q8u03RIdJ+xUa0PS4vnGBbNlNSeL9HK1O1MCr2CeFaadChT31oWubD6YvPZTfoKalFBTUqsHX/QcKSEcdrKwr+WSX6rqbR+HSw3/cdyGPdR2+COoCpN15DAC+76ay+5S5YyF7jC9k=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS7PR01MB17336.jpnprd01.prod.outlook.com (2603:1096:604:43f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 16:57:58 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9678.017; Thu, 5 Mar 2026
 16:57:58 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, biju.das.au <biju.das.au@gmail.com>
CC: magnus.damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v3 07/10] arm64: dts: renesas: Add initial DTSI for RZ/G3L
 SoC
Thread-Topic: [PATCH v3 07/10] arm64: dts: renesas: Add initial DTSI for
 RZ/G3L SoC
Thread-Index: AQHclPgnKnK+tkYa1Ua6JHvG2H9MT7WgNeCAgAAhRMA=
Date: Thu, 5 Mar 2026 16:57:58 +0000
Message-ID:
 <TY3PR01MB11346EEC0D9D7391EEE7ED27C867DA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260203103031.247435-1-biju.das.jz@bp.renesas.com>
 <20260203103031.247435-8-biju.das.jz@bp.renesas.com>
 <CAMuHMdW20h=D9Tk5T=6rxNanEiON1ZL35CJ6cqzrX12UeDcdPg@mail.gmail.com>
In-Reply-To:
 <CAMuHMdW20h=D9Tk5T=6rxNanEiON1ZL35CJ6cqzrX12UeDcdPg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS7PR01MB17336:EE_
x-ms-office365-filtering-correlation-id: 9b4c27c0-f50e-45fe-fab4-08de7ad85a5c
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 VWHwXKHjt48+lk4z8v6il1LlZRjzM29138hKnzNpkr8BH1dV7B9xOekMN7PfyfddckWNf6y4yiAbGDcVcEdoJHccLl6gHDJf1SCQ0XzaMmJU80YLNo0HQRXGsvDq0Ww0pG1s2/crvLqgziudmqA4dcYA3w4v59E6DT5VtRtgvcCAPfyDUGkv5vtUL7UQPWgAW3AG0qj+20Bd+k+BMQxtsTgaJeVIWSqXvRg3ICb6TGn/LUa6BTDG1+NdGS42UW2gtAfQfg/gKVXPYkoKUa9bLa8wugxvD8nEsIL56//K5ucbAz5JFt0cWBBy8KD2au2f/76IjjWNNS6MuB8gY4hWntFKZRejSKbehwFYVRDHSWJ7Oj5+x0qg28Guf5AFtVS4aNICg0B1QIEGieywkbGYKvcYjDCJn2O4cj3t7FIGbX4pjwEctz4hmWCIzg06y6pgXVRylvbuaozbyfWHd3TgHnkJDVZCLAczwY6EF2wOncQCmUtPUAvJZp/gE40awPs5Tzk2eacKi6SHITCCVLOPPjsUcnFaoPFqfDILF7cZYPsDOJvXt13/XB82RpNnu3arNgCpXBFjagErtSSeyLj9f48RP33puT5CCQH0IF3QBFtnwmcPmctcEuI9rlgxEgnCKl0cf+ucgJHYuu08e6WOxeZ26voaaJOjMosbFbxm7JlxLV1jhY123al5WRhuAb/0VuH9IxOvghCYw7FVjOnmE3LAkiPVoX8r4WFeiLFSRz+mDwhvAlc00nGi5IgqyBHAN4uiqXb57HfOzMnBa/9i31q3ZEbCDCJXOjRgFsIXFEk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aE11V01HU2x3bC90MVdTbVhMNXE4R2NSU3hRWDFDTVpYU2xndnZCRmNhTTg3?=
 =?utf-8?B?N0RCcFIwbEIvOVlWZDByK0NvaWpPK3U4cUduQ3RlYUpHTWZKVEhqcHBZeFFN?=
 =?utf-8?B?L3Y5Tm5qejVYYUxObTkrTUp5T21tMHk5TElmQTBxajNVSnpHVm9QODZYNkpn?=
 =?utf-8?B?RkdMT0x5SWYrbHBzNFNId1NzaTM0NWdPUnM3N1ZUS2lJeWdIcm5mRTV6aEhz?=
 =?utf-8?B?SDN6dzBvTUozRG9yVXk5VFo4ekhxcTJyNGx3WkxOMjRMQ0pQRlk1RFRSOXA0?=
 =?utf-8?B?djEvTWFaaUZJa1I3cFRaelI4NnNRWWo2VFE2S1p6THE3TldaVWNPaFZPSklI?=
 =?utf-8?B?c2UxU1lxaXdSczFvd1M2eEFqSGtKTlNVbURheG9xY2x1Y21lbTJnUHoydTdZ?=
 =?utf-8?B?OS9wR3hocGRBMlhmdGhZeWtvdWVkR2ZQaXVhS2p2WTZOa3R5ODI1Y0hiNG1h?=
 =?utf-8?B?Z3ROblBOMUQ1Sll0eHBjVjNwc2NMMTJzR2YyQzZJUXlKOWlNTVB2VGxnVWc0?=
 =?utf-8?B?N2FVcDQyTjVyekV5K2JOeS9nVUM0azRHMjl3QzdFTWFWaG05RU1TaGZPUEpp?=
 =?utf-8?B?Wkl3WFhHNUxHTmtXcU9PS04vWkxNdEZKWHFGWG9QYzVHcDFpeFI4MkE1Q1Ba?=
 =?utf-8?B?bm44bGtNZUtWWVQ3MDJxODN1aEU2QW5aSU5sRGVFVmx4UFcwcXR2SWx0OUJL?=
 =?utf-8?B?NTVvbk5EQVhSNlVqb2pTOWpJRFRzREZsMGhteFVRcExPT3k2VFVaNTlYSzBB?=
 =?utf-8?B?YmNQOG9NSUNKNjdYTFE3MGtuMUNrTGQvNWdTc0VsMWdHQm1yaml3TlRQUXpl?=
 =?utf-8?B?UU50dnlGQnhJcEM0Z3A1QmVOSU5hekw0OG9yVVd4djM3ZFBzeFJiZ0MyZGZ2?=
 =?utf-8?B?dEhpeXlLM09iZDBQYUx2MVlvNHVMSGFqbDV4Q1drKy9ueGhBSStDMEJQcFht?=
 =?utf-8?B?ZFZCek1nWHl0ZHBiZk9mTlphbEJvZU5MS3F6MHZNN1g2cEtGWlJiTFJVMENn?=
 =?utf-8?B?VFpjZE42NGJTRk1vQzZJK1h2OG9yK2RjNUJDKzhiL0czdEk4aDJMVzg2QUNT?=
 =?utf-8?B?M0dqeEZxbHd0M0liY3YrTzJKWG9KOUhidmIyREhSV2xpVWV1bHVLSS9VZGxD?=
 =?utf-8?B?R1h5OXBaMmxmUzhVUTdHNVI3bU9yQ1BOYVBFdDJvYnVWSDY4Zml0VnBaRXVk?=
 =?utf-8?B?ZUNGZnlIVjZQclJhY0NwUjlYOElMdkVmRmQzN2pnWS9ha1N2ektFVnRsRTlG?=
 =?utf-8?B?ZXFNek1henNpdS9sOFduMXJRS3d1cXlrTmRxY1YvWk5vb0ZDMEdzano5V0JV?=
 =?utf-8?B?dGhWR3JTcG9wbncyQmdLY3NyUk1SYmtobDdSaVJ6dk4wNG51QzJRbTdjRDQw?=
 =?utf-8?B?V1JKWFN6Skc4ZzNNUzZ5ZFlMMjZLZCs0T2wyKzh0aEhsQTI3REk0Y2docHoy?=
 =?utf-8?B?anp2T3oxMVJKb25PaUd1WlZzN2NFUU9PanA2ME1ISFQ4VHZRUDVIOGhubVk1?=
 =?utf-8?B?Tmg3aE96TjBiUGlmRDdiRGwxMG1DN2NEMlNhUkJmeWE5QWtUYXB4cW9NZHd0?=
 =?utf-8?B?TnpQdEJycy9VTVdkTE9odUZwTDlBTng4WmQ3N2pNUklIMjZnUndXQTdyeXpT?=
 =?utf-8?B?alJFSE9VMHl3aElvMXR6OXlFcmJPQ1h3TVExeEFoOGpIYTdsK3I5Z0VVTlZW?=
 =?utf-8?B?a25QYnUwN1Q3UFpFWE12WXpEemE3NWxKbVhvVmNEZzcyU3luc2RvY01VKzFK?=
 =?utf-8?B?aU8zK1BWMHh6V2xJT2Z3WGd0ZzlqZkl6MGJQc1pGeEZCWms0RmQ5SE1OU0k3?=
 =?utf-8?B?SmZETk12VmJpWHlqL2NlVlF3emwraVZNU084bVhaZlFyai90NGx0Zi9MMm9i?=
 =?utf-8?B?N2l3cHpFOW94WnBvbVNKZzJDdUJGSUtjdFAvb245d3RwQSs3WXRSV04ybk5O?=
 =?utf-8?B?TjJ4SUNDeTE0NWNMdmxoWU9LMXdDL3FmR1QvcFg3dkpRKzZmT04wVk51UDl2?=
 =?utf-8?B?WXY2WW1SQnFabmxiYU5PbkhNNXZrRFljdXREZ0FHYzZSSW1xTHhyZldTakFu?=
 =?utf-8?B?MGJLZDBqTFpjUE9zS3ZCWHRzaVFtYWUwaEVtRE9FU1psMDNKVVNkdlFlbk1I?=
 =?utf-8?B?TEd3emxSdktIQUE5K2ttRXM5YVQ0a2xVWm9EcHE0K3VqSEVCSC9SeHl2YUlW?=
 =?utf-8?B?d3VidUR2WENMZW9vS1FJRjYzQ0dHamFHREc3NGpvc0dGTFFxTnN6d29rdHF3?=
 =?utf-8?B?aWlBTC9rRm9CeHhCb1l4K0RPWDJqUTNzaE9YU2RocEVROHJKZ3AzQllKOVNu?=
 =?utf-8?B?TzVzV2RoT3N4WGZBSmtzSEdPZHFLTTR1Z1JBVlJlWU5Bb2ZQeEFudz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b4c27c0-f50e-45fe-fab4-08de7ad85a5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2026 16:57:58.0537
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lhXYDibD6Zgf4wQ+dhcv08YHolzK20bsmmS+gxLCzs659HsGPe0cqberulf35OP0q13qJMZmwpQyjspbdKoR6T1Iq4ychuuaU3AJDwh8GoQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB17336
X-Rspamd-Queue-Id: BBD3A215CC3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-28905-lists,linux-renesas-soc=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[linux-m68k.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,bp.renesas.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_PROHIBIT(0.00)[0.168.77.240:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	RSPAMD_EMAILBL_FAIL(0.00)[biju.das.jz.bp.renesas.com:query timed out,pinctrl.0.168.77.240:query timed out];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,100ae000:email,0.180.91.224:email,bp.renesas.com:dkim,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Action: no action

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDA1IE1hcmNoIDIwMjYgMTQ6NTQNCj4gU3ViamVjdDogUmU6IFtQQVRD
SCB2MyAwNy8xMF0gYXJtNjQ6IGR0czogcmVuZXNhczogQWRkIGluaXRpYWwgRFRTSSBmb3IgUlov
RzNMIFNvQw0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIFR1ZSwgMyBGZWIgMjAyNiBhdCAxMToz
MCwgQmlqdSA8YmlqdS5kYXMuYXVAZ21haWwuY29tPiB3cm90ZToNCj4gPiBGcm9tOiBCaWp1IERh
cyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4NCj4gPiBBZGQgdGhlIGluaXRpYWwg
RFRTSSBmb3IgdGhlIFJaL0czTCBTb0MuDQo+ID4gVGhlIGZpbGVzIGluIHRoaXMgY29tbWl0IGhh
dmUgdGhlIGZvbGxvd2luZyBtZWFuaW5nOg0KPiA+ICAgLSByOWEwOGcwNDYuZHRzaTogICAgUlov
RzNMIGZhbWlseSBTb0MgY29tbW9uIHBhcnRzDQo+ID4gICAtIHI5YTA4ZzA0Nmw0OC5kdHNpOiBS
Wi9HM0wgUjBBMDhHMDQ2THs0Niw0OH0gU29DIHNwZWNpZmljIHBhcnRzDQo+ID4NCj4gPiBBZGRl
ZCBwbGFjZSBob2xkZXJzIHRvIHJldXNlIHRoZSBjb2RlIGZvciBSZW5lc2FzIFNNQVJDIElJIGNh
cnJpZXINCj4gPiBib2FyZC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1
LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4g
DQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNh
cy9yOWEwOGcwNDYuZHRzaQ0KPiA+IEBAIC0wLDAgKzEsMjUxIEBADQo+ID4gKy8vIFNQRFgtTGlj
ZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkNCj4gPiArLyoN
Cj4gPiArICogRGV2aWNlIFRyZWUgU291cmNlIGZvciB0aGUgUlovRzNMIFNvQw0KPiA+ICsgKg0K
PiA+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjYgUmVuZXNhcyBFbGVjdHJvbmljcyBDb3JwLg0KPiA+
ICsgKi8NCj4gPiArDQo+ID4gKyNpbmNsdWRlIDxkdC1iaW5kaW5ncy9jbG9jay9yOWEwOGcwNDYt
Y3BnLmg+DQo+ID4gKyNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9h
cm0tZ2ljLmg+DQo+ID4gKw0KPiA+ICsvIHsNCj4gPiArICAgICAgIGNvbXBhdGlibGUgPSAicmVu
ZXNhcyxyOWEwOGcwNDYiOw0KPiA+ICsgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8Mj47DQo+ID4g
KyAgICAgICAjc2l6ZS1jZWxscyA9IDwyPjsNCj4gPiArICAgICAgIGludGVycnVwdC1wYXJlbnQg
PSA8JmdpYz47DQo+ID4gKw0KPiA+ICsgICAgICAgYXVkaW9fY2xrMTogYXVkaW8tY2xrMSB7DQo+
ID4gKyAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiZml4ZWQtY2xvY2siOw0KPiA+ICsgICAg
ICAgICAgICAgICAjY2xvY2stY2VsbHMgPSA8MD47DQo+ID4gKyAgICAgICAgICAgICAgIC8qIFRo
aXMgdmFsdWUgbXVzdCBiZSBvdmVycmlkZGVuIGJ5IGJvYXJkcyB0aGF0IHByb3ZpZGUgaXQuICov
DQo+ID4gKyAgICAgICAgICAgICAgIGNsb2NrLWZyZXF1ZW5jeSA9IDwwPjsNCj4gPiArICAgICAg
IH07DQo+ID4gKw0KPiA+ICsgICAgICAgYXVkaW9fY2xrMjogYXVkaW8tY2xrMiB7DQo+ID4gKyAg
ICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiZml4ZWQtY2xvY2siOw0KPiA+ICsgICAgICAgICAg
ICAgICAjY2xvY2stY2VsbHMgPSA8MD47DQo+ID4gKyAgICAgICAgICAgICAgIC8qIFRoaXMgdmFs
dWUgbXVzdCBiZSBvdmVycmlkZGVuIGJ5IGJvYXJkcyB0aGF0IHByb3ZpZGUgaXQuICovDQo+ID4g
KyAgICAgICAgICAgICAgIGNsb2NrLWZyZXF1ZW5jeSA9IDwwPjsNCj4gPiArICAgICAgIH07DQo+
ID4gKw0KPiA+ICsgICAgICAgY2FuX2NsazogY2FuLWNsayB7DQo+ID4gKyAgICAgICAgICAgICAg
IGNvbXBhdGlibGUgPSAiZml4ZWQtY2xvY2siOw0KPiA+ICsgICAgICAgICAgICAgICAjY2xvY2st
Y2VsbHMgPSA8MD47DQo+ID4gKyAgICAgICAgICAgICAgIC8qIFRoaXMgdmFsdWUgbXVzdCBiZSBv
dmVycmlkZGVuIGJ5IGJvYXJkcyB0aGF0IHByb3ZpZGUgaXQuICovDQo+ID4gKyAgICAgICAgICAg
ICAgIGNsb2NrLWZyZXF1ZW5jeSA9IDwwPjsNCj4gPiArICAgICAgIH07DQo+IA0KPiBUaGVzZSB0
aHJlZSBhcmUgdW51c2VkLCBzbyBwbGVhc2UgZHJvcCB0aGVtLg0KDQpBZ3JlZWQuDQoNCj4gDQo+
IFsuLi5dDQo+IA0KPiA+ICsgICAgICAgZXRoMF90eGNfdHhfY2xrOiBldGgwLXR4Yy10eC1jbGsg
ew0KPiA+ICsgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImZpeGVkLWNsb2NrIjsNCj4gPiAr
ICAgICAgICAgICAgICAgI2Nsb2NrLWNlbGxzID0gPDA+Ow0KPiA+ICsgICAgICAgICAgICAgICAv
KiBUaGlzIHZhbHVlIG11c3QgYmUgb3ZlcnJpZGRlbiBieSB0aGUgYm9hcmQgKi8NCj4gPiArICAg
ICAgICAgICAgICAgY2xvY2stZnJlcXVlbmN5ID0gPDA+Ow0KPiA+ICsgICAgICAgfTsNCj4gPiAr
DQo+ID4gKyAgICAgICBldGgwX3J4Y19yeF9jbGs6IGV0aDAtcnhjLXJ4LWNsayB7DQo+ID4gKyAg
ICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiZml4ZWQtY2xvY2siOw0KPiA+ICsgICAgICAgICAg
ICAgICAjY2xvY2stY2VsbHMgPSA8MD47DQo+ID4gKyAgICAgICAgICAgICAgIC8qIFRoaXMgdmFs
dWUgbXVzdCBiZSBvdmVycmlkZGVuIGJ5IHRoZSBib2FyZCAqLw0KPiA+ICsgICAgICAgICAgICAg
ICBjbG9jay1mcmVxdWVuY3kgPSA8MD47DQo+ID4gKyAgICAgICB9Ow0KPiA+ICsNCj4gPiArICAg
ICAgIGV0aDFfdHhjX3R4X2NsazogZXRoMS10eGMtdHgtY2xrIHsNCj4gPiArICAgICAgICAgICAg
ICAgY29tcGF0aWJsZSA9ICJmaXhlZC1jbG9jayI7DQo+ID4gKyAgICAgICAgICAgICAgICNjbG9j
ay1jZWxscyA9IDwwPjsNCj4gPiArICAgICAgICAgICAgICAgLyogVGhpcyB2YWx1ZSBtdXN0IGJl
IG92ZXJyaWRkZW4gYnkgdGhlIGJvYXJkICovDQo+ID4gKyAgICAgICAgICAgICAgIGNsb2NrLWZy
ZXF1ZW5jeSA9IDwwPjsNCj4gPiArICAgICAgIH07DQo+ID4gKw0KPiA+ICsgICAgICAgZXRoMV9y
eGNfcnhfY2xrOiBldGgxLXJ4Yy1yeC1jbGsgew0KPiA+ICsgICAgICAgICAgICAgICBjb21wYXRp
YmxlID0gImZpeGVkLWNsb2NrIjsNCj4gPiArICAgICAgICAgICAgICAgI2Nsb2NrLWNlbGxzID0g
PDA+Ow0KPiA+ICsgICAgICAgICAgICAgICAvKiBUaGlzIHZhbHVlIG11c3QgYmUgb3ZlcnJpZGRl
biBieSB0aGUgYm9hcmQgKi8NCj4gPiArICAgICAgICAgICAgICAgY2xvY2stZnJlcXVlbmN5ID0g
PDA+Ow0KPiA+ICsgICAgICAgfTsNCj4gDQo+IFRCRC4uLg0KT0suDQoNCj4gDQo+ID4gKw0KPiA+
ICsgICAgICAgZXh0YWxfY2xrOiBleHRhbC1jbGsgew0KPiA+ICsgICAgICAgICAgICAgICBjb21w
YXRpYmxlID0gImZpeGVkLWNsb2NrIjsNCj4gPiArICAgICAgICAgICAgICAgI2Nsb2NrLWNlbGxz
ID0gPDA+Ow0KPiA+ICsgICAgICAgICAgICAgICAvKiBUaGlzIHZhbHVlIG11c3QgYmUgb3ZlcnJp
ZGRlbiBieSB0aGUgYm9hcmQuICovDQo+ID4gKyAgICAgICAgICAgICAgIGNsb2NrLWZyZXF1ZW5j
eSA9IDwwPjsNCj4gPiArICAgICAgIH07DQo+ID4gKw0KPiA+ICsgICAgICAgcHNjaSB7DQo+ID4g
KyAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiYXJtLHBzY2ktMS4wIiwgImFybSxwc2NpLTAu
MiI7DQo+ID4gKyAgICAgICAgICAgICAgIG1ldGhvZCA9ICJzbWMiOw0KPiA+ICsgICAgICAgfTsN
Cj4gPiArDQo+ID4gKyAgICAgICBzb2M6IHNvYyB7DQo+IA0KPiA+ICsgICAgICAgICAgICAgICBp
MmMwOiBpMmNAMTAwYWUwMDAgew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICNhZGRyZXNz
LWNlbGxzID0gPDE+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICNzaXplLWNlbGxzID0g
PDA+Ow0KPiANCj4gUGxlYXNlIG1vdmUgdGhlc2UgdHdvIGJlbG93ICJyZWciLg0KDQpPSy4NCg0K
PiANCj4gPiArICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MCAweDEwMEFFMDAwIDAgMHg0
MDA+Ow0KPiANCj4gUGxlYXNlIHVzZSBsb3dlci1jYXNlIGhleGFkZWNpbWFsLg0KDQpPSy4NCg0K
PiANCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAvKiBwbGFjZWhvbGRlciAqLw0KPiA+ICsg
ICAgICAgICAgICAgICB9Ow0KPiANCj4gPiArICAgICAgICAgICAgICAgcGluY3RybDogcGluY3Ry
bEAxMTAzMDAwMCB7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDAgMHgxMTAz
MDAwMCAwIDB4MTAwMDA+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGdwaW8tY29udHJv
bGxlcjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAjZ3Bpby1jZWxscyA9IDwyPjsNCj4g
DQo+IC8qIHBsYWNlaG9sZGVyICovDQoNCk9LLg0KDQo+IA0KPiA+ICsgICAgICAgICAgICAgICB9
Ow0KPiA+ICsNCj4gPiArICAgICAgICAgICAgICAgZG1hYzogZG1hLWNvbnRyb2xsZXJAMTE4MjAw
MDAgew0KPiANCj4gVW51c2VkLiBTdXJlbHkgeW91IGNhbiB3aXJlIHVwIHNjaWYwPw0KDQpZZXMs
IGJ1dCBJIGRvbid0IGdldCBsb2dpbiBwcm9tcHQsIGFzIFNDSUYwIGludGVycnVwdHMgaGF2ZSBk
ZXBlbmRlbmN5IG9uDQpETUEgcmVzZXQvY2xvY2tzIHRvIHJvdXRlIHRoZSBpbnRlcnJ1cHRzIHRv
IENQVS4NCg0KQ2hlZXJzLA0KQmlqdQ0K

