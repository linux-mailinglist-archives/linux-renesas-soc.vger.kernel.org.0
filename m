Return-Path: <linux-renesas-soc+bounces-33392-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Jm4F1dkHWpHaAkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33392-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 01 Jun 2026 12:52:07 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CD47D61DE5F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 01 Jun 2026 12:52:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9C0E430021D0
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Jun 2026 10:44:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82E5D39B4A6;
	Mon,  1 Jun 2026 10:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="f+3hVN9w"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010044.outbound.protection.outlook.com [52.101.229.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BE03955CF;
	Mon,  1 Jun 2026 10:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780310664; cv=fail; b=EVLeYbqvaIkWqJuDPH2QRohpUjWzRP19ohBvmCGJRL4n5D+FlxPGzCO8DdJIOXnMtZfbM0odSps+pGU+/Q7+NZn1IJq8GCXrWlQkOZC59Ni91U3a8NxhR7xuZchqRTvSwxQQfpOPSBX51azuAA24U9IhNDdrsfcnYGv2Xc9vcck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780310664; c=relaxed/simple;
	bh=Qv/bJKqmrb1Owv6YOCYMlqRIsordURTXPtcr2aGUazg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=C584xJJsh1YrrINrhv7gTFoSPuge8cj7bz+gyrf5tNFQtCFaaKh0eaXdaeS4XsdK01R0LttpbUfaJZyE9aMdcxAzPkUyV5cYhl/t5bQQhgVsnRGDE7PX/Z/WvHJrs6OxabZLwgzOBDsSS4GbPhLWyLN5VRQcMxGSd3VPd2BG4gA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=f+3hVN9w; arc=fail smtp.client-ip=52.101.229.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ODWoisJwImkO9p568tDgJTtzLNM7+vDp+hKn2HkHBztQZgJfTFj5r0MwYgu3Z2fOqNYlKPgGY6rHeaJoxfsbeFTUKqNTaGQIeQLYiV1mLcGsz3PTUSQcYerWHj4jIGK36DEokHkBInTCpqalq1Erz2aeSxZkszGWYwFLnGfYRmkFhX7KM/PGPuzjhYpfIeJoYp54cRI2uJx1N8K56jhWxbMRcfXVYmAyFtDQ/E1+fWuxq4eS4yqhrXUDFcnv2IiOriTXFWS3J1+mUwxJgJ9SmEqjrErWK8kzUmwqj2ytu7/V3ZYzCt1t2fXbt0M2OGXU9EtRVXnY1XsJ1clV8lucjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qv/bJKqmrb1Owv6YOCYMlqRIsordURTXPtcr2aGUazg=;
 b=jxKqc5ziEZjsADYVtAXP+bDBOfsjAYVHRPxfbXNgpks79Pn6bHTCxHIg9OWML/JKCJuqfVfq6iyx1eqNLbCRDy2cyui70cOErz5XCDsFwIKupBHxUVudUa8BFdd9UP4v1t0bWzAThYtUGw7vJ3R0UyohPOS1+eM9lUgPtYPT4UbmFMd/ghC6mbsArvqj1GSIErJGfvb3fHQlyfwED47WgvJ+iaspk6hQ3rXG4zeT1ciNrmEq6IG5NZgUrlvX1+QCq/4d3IVWS3uj753tuOGUNMVvezeIFr93YTmEnexdS8C2YDo3E1UN0nasm9dP+5f9hdDPRpwJPgvL6OipjY3ajQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qv/bJKqmrb1Owv6YOCYMlqRIsordURTXPtcr2aGUazg=;
 b=f+3hVN9wdhLslVqaGzCu+/IrsxaEjtv0vPI7xszmVgTaRUkUpjONold9OtbThhYoB8OQk/ThY2JWuVtDj/lGX1lTnXURvsJ9DxmA/3sqzv3W+rZ8jxshhHV2jVKDczRzHSdmpnWK+WjNMTow36IvDaN1SIrQj7r9aZEuq6IAYBk=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY7PR01MB14641.jpnprd01.prod.outlook.com (2603:1096:405:243::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Mon, 1 Jun 2026
 10:44:16 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0071.011; Mon, 1 Jun 2026
 10:44:15 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Rob Herring <robh@kernel.org>,
	biju.das.au <biju.das.au@gmail.com>
CC: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, wsa+renesas <wsa+renesas@sang-engineering.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Lee
 Jones <lee@kernel.org>
Subject: RE: [PATCH v2 1/2] dt-bindings: display: bridge: Document Renesas
 RZ/G3L LVDS encoder
Thread-Topic: [PATCH v2 1/2] dt-bindings: display: bridge: Document Renesas
 RZ/G3L LVDS encoder
Thread-Index: AQHc67XSOXReT+gxn06RqQ9MqkvErbYeXYragAqnGYCAAILzgIAACACA
Date: Mon, 1 Jun 2026 10:44:15 +0000
Message-ID:
 <TY3PR01MB113460B3A579E7C018F53783886152@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260524194457.479681-2-biju.das.jz@bp.renesas.com>
 <20260524195829.960401F000E9@smtp.kernel.org>
 <CADT+UeAYhrwpmApCWaJ9w0gK3zF4eR4LVptTTwegGucvF6mmiA@mail.gmail.com>
 <20260601022619.GA3961324-robh@kernel.org>
 <TY3PR01MB1134611A3BA64F10AAC5375B686152@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TY3PR01MB1134611A3BA64F10AAC5375B686152@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY7PR01MB14641:EE_
x-ms-office365-filtering-correlation-id: ed537599-089c-4655-cbfa-08debfcaba0e
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|3023799007|11063799006|4143699003|18002099003|22082099003|56012099006;
x-microsoft-antispam-message-info:
 Cw2PSSK4MxuzM/wZ+90w2ICf306mKtU6TvX/z+H1DjfBgbKwLQH6f9NKqxfNgq9Mrbsdiw8reM68WS+C9d3YEIm94i74zfUlYd6JX5SkJriZZWtP/Jz95UAl91PRXRhiHywScOpF3IAVUC/evaql4X6mSj9GpBD2NguP/U3Lv028WwhY73wO9JnUmkLZDIF6sYVLxCSn/hucoEjYY2BPVxmK0bxcsIZ4EGb6jR9jANADXghJBy0mSmvqMnPYY5FY4yMM1HgD+7qESFnmsAEwm+b6SKNeIVwEhVocMqoS0Gedteh99X7B1KQ88FND42cw72iolfyXYjTmQ2ngzML/2orL5yq4Yh2padnt/IC8zESl4KpuuI822roVvU0dJdZbFFzLiD/kvRWyo9AvpxTnmcShCeEnXedQtY5LHrinlu5t1v0URZ//46Zl8stp7WeuEC2xnU6e7UrMEhQmgQ+NNTwilkKwU0vJwvVPnuDy160jhFPYM7OhK/ErlAFxagC1gFWvmjjmkICLN7hICZLDYIMbNAZzgR+QLevx0WLXnuTBOeB/yW0ymYLEKxr5Of/77FcZv9vPkVtQ/t6M1ze3n1tY56IC4hNgGucotOI7mrLLhgi/FBH/c85ChmxNT2KRP9jQpRzHt/axjt1eak1irAlx7VxRcmHqKwGcWtM6uIkAfpyE6JmjPM7b4rL7ZXwzNVJ4C+NT35WpcaiyVUU+cWRS2ZH/fPB/WW3J/ISKTm04641CXU1ZskgiU35kBh/k
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(3023799007)(11063799006)(4143699003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TjBjVUt1K2JMbUVqN2ZOK3JVUTRsNzh5Q0ZUcG9zZ2hXSktqTllIYUJNdzB5?=
 =?utf-8?B?T2dQUlhhczhuWlRFRnFpb3p6L3gySHA3QlFhcGhnNWhBQmc4bHo5WnRUcndI?=
 =?utf-8?B?aEdNbHFHK2U3UGxXZnM5emR6Q0ttaVZnMkIxN2dpdktzSkRsSW5zUWM0ZUs5?=
 =?utf-8?B?c1lUNHV4YXliSGpMTlZzL3BEZE9EdG9DUkgzQi81UXY2WXIzNUFYMHhMeWg4?=
 =?utf-8?B?RTMxSEF5Y1NjQUpHVHFEeWJ4cWhGUDE0UFZkMjhxTGZ3K0ozL2p4akE0a3dZ?=
 =?utf-8?B?TitxY1BORmoxV3ErYW5qTktMK3lSK2hCYXVETTRQKzcwODhob24vMldLN3ZR?=
 =?utf-8?B?bzQvQ0tqd1RRRDhDaFhJTkMvQXFzcURVRFZib3lqdnRySHRpWFlkQmhGVFlO?=
 =?utf-8?B?WU5Xa1A1OGVxU1hEUnBNZEVCSXlQR25KZmUyNTEwZVA2NTlNM1d4b0swYXRG?=
 =?utf-8?B?UHl6aG9LQ09BazYzMHJlZE5tN2lZdW5mZjZ6SFhGOGo4K01hT3JxUTBqdjV1?=
 =?utf-8?B?N0pJcWIvQ3FaTmZHZGZoTXVUVkVjaTVBVE9odHRmK0hsUmFMc3VjODJkQUF1?=
 =?utf-8?B?TW9paG9pYnpUWWJ6TmFEZGd1SFJIWllSU1VFUXdUNUMxbFdDaWtQZ1hSbjJV?=
 =?utf-8?B?ZlZBWkxmNEtHaCt3Vy92Y081c0dyM2ppT2Y1OVBZMXFNZlEyWlJLY09QUzYw?=
 =?utf-8?B?Vy9FNHdYRUpzN3dRK2ZCdGFscGNmYTEzRUhhM0J4bklMeWo3d0xzR3pnVTFR?=
 =?utf-8?B?cUVRNTlXTFZkWTg3elZ5RVFlVXQvYkxNb204T0VDOG1Ba3duV3Fld3RDdjFt?=
 =?utf-8?B?S0ZUY3VuS3U0a2VCUVdydGNTK1BuY00zUU9rZ0RXZTgwZ3craVpnT08wbnht?=
 =?utf-8?B?NU80Sk1FN2M2NHRLVE5ydnBDYUpMb09mNXFLcWRIeDJmbkJEQTM2VFpqS2Rn?=
 =?utf-8?B?dU9zaEdNNWs4czNnVGV6RG1vUHNEY2JsaDJUeGtkajlyaHg5dFF3WjJpWHBy?=
 =?utf-8?B?Z2hCc2JtTVE3Y2VwQm5ZdEJiQkJRN3pUYlhTTHJsQ24xSTNWdXUxWEhuOUdv?=
 =?utf-8?B?YmtPZTByOEEvREJJN25yVUtIODN6dlp0ZTBaZ2NhdFY4S21TVmFkaEhEQUxr?=
 =?utf-8?B?SHNOZGhWdlVLMU00U0s2TG1IWmNiZ2RLMHJ3eE15cFVVWU5la2dqMW81VFJu?=
 =?utf-8?B?RnBnRHhhK0dwT3NISWZPVzBEakNRQnhWSnJ5cnFpTXdQaTh3T0FQYmZnZUE4?=
 =?utf-8?B?QWpNOUhKQktTVVdWTVJ1OVdYWjBxRjJHYVF6OEVCSHE3THJMU1ZaSzUvVklt?=
 =?utf-8?B?ZC9vMEFYVnNJTDIvMk8zTnpybG9laG1VSXdGVVVCTmRxdjVEVXY3ZGlFVERm?=
 =?utf-8?B?SU5zWlM3bk5RYTZsbmFGRXFNdFMrSnR5TzJUVDMvYWthS0piM0ZJR1FFTXBq?=
 =?utf-8?B?a1l5V0Z6a0FBbmNKOVBqMjZQMmRibVJRd0RmVnJrbkErZkR1cVNuT0pJNEpY?=
 =?utf-8?B?akNOQncrbHdCQy9zVzIyQXJLNVFRRUUwc1dkUGZyUlhsWkFRbGhVc1hlUUY4?=
 =?utf-8?B?Nk5td0szc1Ezc3ZUWGVqVlc0MzJsakxlcHMxbEs5NFNFbFdvS0tXL1dWOU9E?=
 =?utf-8?B?Q2N6enlZK2xNRkFoUlVPZldFMHgyZnFySlFRNGN4V244TzNjU2dYcE1RSC82?=
 =?utf-8?B?Um9XL0tuQVJ2MG9QeWEvN1FHL2ZRazFXd3F1M3RCak41c2tVaWVGY0NiVmRO?=
 =?utf-8?B?S3pFODgzODZiTW5mZUlnR25kYXRmR0pqYnZqQVppUHRuajZCbFd2TEV0R1FF?=
 =?utf-8?B?Qmd2L1N4NlRKTmxKT0ZpRlA5NWdDQXdpUnpBTGNKQUJ4SkRJRHk0VEdxWWF6?=
 =?utf-8?B?dmxRSEFXTUg3akpldHBISkc4bTdXT1MwNUgzeklIY1JBYlc3OUE4M2l5a1ow?=
 =?utf-8?B?cWorR0V0MmVmTnVUZFYzZktPbTFwKzdRdmZNSGpCVkYycE1mdDFtQUdrNVJx?=
 =?utf-8?B?ekhTSmlzdFNtbmJOUjIrczNtQkQxbEpKUkVTQ2VTTTY4aGpaS1NNcmFVZkY1?=
 =?utf-8?B?T1BlR1pqWTJ1S1l0QnppM21KKzJ2c3dPalBPWS8vdlBUMFVRWk9YWjEwR1NL?=
 =?utf-8?B?NzVzSjRIZndvUGxBTEVXK01kdDQ5VW1mQ0ZUZmZENnozRjMyYnVQU3BFZ0Ex?=
 =?utf-8?B?S1d5RWhVM0EvRkRqU044Ukl2aEFWTm5BWWM5QW91RjdxMlk1dkZLeTVCVWJ2?=
 =?utf-8?B?akVvQTdzTmcvSzZRRHp2QU1mNFBYd1lwaFA1M0R3S0J5ZDJhVVFxbEZmdVNF?=
 =?utf-8?B?L3VNd0lzVTFURndIV2tvK3FVakdPRi90WDRTQjBtVkNwa1VTem5MUT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ed537599-089c-4655-cbfa-08debfcaba0e
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2026 10:44:15.8970
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hksTE7dvLjPNa1rURD8VWjDJ+mjjjSf2WryFq0fPkwwkf2RMCAOybkh2ZC7cDuhMEc9u7zjGHldP/lXlhbPyRml65DFeZbNgpEITaCV0St4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB14641
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33392-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[bp.renesas.com,kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,bp.renesas.com:dkim,renesas.com:email,108a0000:email]
X-Rspamd-Queue-Id: CD47D61DE5F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

KyBMZWUgSm9uZXMNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCaWp1
IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IFNlbnQ6IDAxIEp1bmUgMjAyNiAx
MToyMQ0KPiBTdWJqZWN0OiBSRTogW1BBVENIIHYyIDEvMl0gZHQtYmluZGluZ3M6IGRpc3BsYXk6
IGJyaWRnZTogRG9jdW1lbnQgUmVuZXNhcyBSWi9HM0wgTFZEUyBlbmNvZGVyDQo+IA0KPiBIaSBS
b2IsDQo+IA0KPiBUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4NCj4gDQo+ID4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPg0K
PiA+IFNlbnQ6IDAxIEp1bmUgMjAyNiAwMzoyNg0KPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIg
MS8yXSBkdC1iaW5kaW5nczogZGlzcGxheTogYnJpZGdlOiBEb2N1bWVudA0KPiA+IFJlbmVzYXMg
UlovRzNMIExWRFMgZW5jb2Rlcg0KPiA+DQo+ID4gT24gTW9uLCBNYXkgMjUsIDIwMjYgYXQgMDg6
NDU6MDBBTSArMDEwMCwgQmlqdSBEYXMgd3JvdGU6DQo+ID4gPiBIaSBCb3QsDQo+ID4gPg0KPiA+
ID4gT24gU3VuLCBNYXkgMjQsIDIwMjYgYXQgODo1OOKAr1BNIDxzYXNoaWtvLWJvdEBrZXJuZWwu
b3JnPiB3cm90ZToNCj4gPiA+ID4NCj4gPiA+ID4gVGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1
dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQgMiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29u
c2lkZXI6DQo+ID4gPiA+IC0gW0xvd10gVGhlIGNvbXBhdGlibGUgc3RyaW5nICdyZW5lc2FzLHI5
YTA4ZzA0Ni1sdmRzLWNtbicgaXMgdXNlZA0KPiA+ID4gPiBpbiB0aGUgZHQtYmluZGluZyBleGFt
cGxlIGJ1dA0KPiA+IGlzIG5vdCBkb2N1bWVudGVkLg0KPiA+ID4gPiAtIFtMb3ddIFRoZSBwYXJl
bnQgbm9kZSAnbHZkcy1jbW4nIGluIHRoZSBleGFtcGxlIGxhY2tzIGEgJ3JhbmdlcycNCj4gPiA+
ID4gcHJvcGVydHksIGJyZWFraW5nIGFkZHJlc3MNCj4gPiB0cmFuc2xhdGlvbiBmb3IgaXRzIGNo
aWxkIG5vZGVzLg0KPiA+ID4gPiAtLQ0KPiA+ID4gPg0KPiA+ID4gPiBjb21taXQgYmU1OTVjMGRi
MmQ4NWQ5ZWExMzk2ZjBmMzBhYzdhZDc1ZjQxMDFmZQ0KPiA+ID4gPiBBdXRob3I6IEJpanUgRGFz
IDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiA+ID4NCj4gPiA+ID4gZHQtYmluZGlu
Z3M6IGRpc3BsYXk6IGJyaWRnZTogRG9jdW1lbnQgUmVuZXNhcyBSWi9HM0wgTFZEUyBlbmNvZGVy
DQo+ID4gPiA+DQo+ID4gPiA+IERvY3VtZW50cyB0aGUgTFZEUyBlbmNvZGVyIElQIGZvdW5kIG9u
IHRoZSBSWi9HM0wgU29DLiBJdCBzdXBwb3J0cw0KPiA+ID4gPiBzaW5nbGUtbGluayBtb2RlIGFu
ZCBzaGFyZXMgYSBwZXJpcGhlcmFsIGNsb2NrIGFuZCByZXNldCBzaWduYWwNCj4gPiA+ID4gd2l0
aCB0aGUgTUlQSS1EU0kgaW50ZXJmYWNlLg0KPiA+ID4gPg0KPiA+ID4gPiA+IGRpZmYgLS1naXQN
Cj4gPiA+ID4gPiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2Jy
aWRnZS9yZW5lc2FzLHI5YTA4DQo+ID4gPiA+ID4gZzANCj4gPiA+ID4gPiA0Ni1sdmRzLnlhbWwN
Cj4gPiA+ID4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2Jy
aWRnZS9yZW5lc2FzLHI5YTA4DQo+ID4gPiA+ID4gZzANCj4gPiA+ID4gPiA0Ni1sdmRzLnlhbWwN
Cj4gPiA+ID4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+ID4gPiA+IGluZGV4IDAwMDAwMDAw
MDAwMDAuLmIxZjZkMDIwYWU3YjENCj4gPiA+ID4gPiAtLS0gL2Rldi9udWxsDQo+ID4gPiA+ID4g
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3Jl
bmVzYXMscg0KPiA+ID4gPiA+ICsrKyA5YQ0KPiA+ID4gPiA+ICsrKyAwOGcwNDYtbHZkcy55YW1s
DQo+ID4gPiA+DQo+ID4gPiA+IFsgLi4uIF0NCj4gPiA+ID4NCj4gPiA+ID4gPiArZXhhbXBsZXM6
DQo+ID4gPiA+ID4gKyAgLSB8DQo+ID4gPiA+ID4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3Mv
Y2xvY2svcmVuZXNhcyxyOWEwOGcwNDYtY3BnLmg+DQo+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ICsg
ICAgbHZkcy1jbW5AMTA4YTAwMDAgew0KPiA+ID4gPiA+ICsgICAgICAgIGNvbXBhdGlibGUgPSAi
cmVuZXNhcyxyOWEwOGcwNDYtbHZkcy1jbW4iLA0KPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAic2ltcGxlLW1mZCIsICJzeXNjb24iOw0KPiA+ID4gPg0KPiA+ID4gPiBbU2V2ZXJpdHk6
IExvd10NCj4gPiA+ID4gSXMgdGhpcyBjb21wYXRpYmxlIHN0cmluZyBkb2N1bWVudGVkIHNvbWV3
aGVyZSBlbHNlPyBJdCBsb29rcyBsaWtlDQo+ID4gPiA+IHJlbmVzYXMscjlhMDhnMDQ2LWx2ZHMt
Y21uIGlzbid0IHByZXNlbnQgaW4gdGhlIHRyZWUsIHdoaWNoIG1pZ2h0DQo+ID4gPiA+IGNhdXNl
IGR0X2JpbmRpbmdfY2hlY2sgdG8gZmFpbCB3aGVuIGl0IHZhbGlkYXRlcyB0aGUgZXhhbXBsZS4N
Cj4gPiA+DQo+ID4gPiBUaGlzIGNvbXBhdGlibGUgaXMgZG9jdW1lbnRlZCBhbmQgaXMgaW4gbmV4
dCBbMV0uDQo+ID4gPg0KPiA+ID4gUTEpIENhbiB5b3UgcGxlYXNlIHJldW4gdGhlIEFJIHJldmll
dyB3aXRoIFsxXSA/DQo+ID4gPg0KPiA+ID4gWzFdDQo+ID4gPiBodHRwczovL2dpdC5rZXJuZWwu
b3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9uZXh0L2xpbnV4LW5leHQuZ2l0Lw0KPiA+ID4g
Y28NCj4gPiA+IG1taXQvP2g9bmV4dC0yMDI2MDUyMiZpZD01MTI4NGQ4YjFkYmNkN2ZhMDIyMGM0
OWVlYWIyOWIxNDYxN2UwZDg4DQo+ID4gPg0KPiA+ID4gPg0KPiA+ID4gPiA+ICsgICAgICAgIHJl
ZyA9IDwweDEwOGEwMDAwIDB4MTAwMDA+Ow0KPiA+ID4gPiA+ICsgICAgICAgICNhZGRyZXNzLWNl
bGxzID0gPDE+Ow0KPiA+ID4gPiA+ICsgICAgICAgICNzaXplLWNlbGxzID0gPDE+Ow0KPiA+ID4g
Pg0KPiA+ID4gPiBbU2V2ZXJpdHk6IExvd10NCj4gPiA+ID4gRG9lcyB0aGlzIHBhcmVudCBub2Rl
IG5lZWQgYSByYW5nZXMgcHJvcGVydHk/IFdpdGhvdXQgaXQsIGFkZHJlc3MNCj4gPiA+ID4gdHJh
bnNsYXRpb24gZm9yIHRoZSBjaGlsZCBub2RlJ3MgcmVnID0gPDB4MTAgMHg4PiBtaWdodCBmYWls
LCBhbmQNCj4gPiA+ID4gZHRjIG9mdGVuIHdhcm5zIGFib3V0IG1pc3NpbmcgcmFuZ2VzIGluIHNp
bXBsZS1tZmQgbm9kZXMgd2l0aCBjaGlsZHJlbi4NCj4gPiA+DQo+ID4gPiBJIGRvbid0IGdldCBh
bnkgZXJyb3Igb3IgZHRjIHdhcm5pbmdzLiBIYXZlIHlvdSByYW4gZHQtYmluZGluZyBjaGVjaw0K
PiA+ID4gYmVmb3JlIHByb3ZpZGluZyBzdWNoIGNvbW1lbnQ/DQo+ID4NCj4gPiBUaGVyZSBwcm9i
YWJseSBpc24ndCBhbnkgd2FybmluZywgYnV0IHNhc2hpa28gaXMgY29ycmVjdCB0aGF0ICdyYW5n
ZXMnDQo+ID4gc2hvdWxkIGJlIHByZXNlbnQuIFRoZSBzY2hlbWEgZm9yIHRoZSBwYXJlbnQgc2hv
dWxkIHJlcXVpcmUgJ3JhbmdlcycuDQo+ID4gVGhlICdzaW1wbGUtbWZkJyBiaW5kaW5nIGRvZXMg
bm90IGFzIG5vdCBhbGwgc2ltcGxlLW1mZCdzIGhhdmUgTU1JTyBhZGRyZXNlc3MgaW4gdGhlIGNo
aWxkIG5vZGVzLg0KPiANCj4gT0ssIEkgd2lsbCBzZW5kIGEgcGF0Y2ggZm9yIFJaL0czTCB3aXRo
IGJlbG93IGNoYW5nZXMgYXMgaXQgaGFzIE1NSU8gYWRkcmVzcy4NCj4gDQo+ICsgIC0gaWY6DQo+
ICsgICAgICBwcm9wZXJ0aWVzOg0KPiArICAgICAgICBjb21wYXRpYmxlOg0KPiArICAgICAgICAg
IGNvbnRhaW5zOg0KPiArICAgICAgICAgICAgY29uc3Q6IHJlbmVzYXMscjlhMDhnMDQ2LWx2ZHMt
Y21uDQo+ICsgICAgdGhlbjoNCj4gKyAgICAgIHByb3BlcnRpZXM6DQo+ICsgICAgICAgIHJhbmdl
czogdHJ1ZQ0KPiArDQo+ICsgICAgICByZXF1aXJlZDoNCj4gKyAgICAgICAgLSByYW5nZXMNCj4g
DQo+IA0KPiBDaGVlcnMsDQo+IEJpanUNCg==

