Return-Path: <linux-renesas-soc+bounces-29804-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNZBHdLaumn0cgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29804-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 18:03:14 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C80212BFDA8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 18:03:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 236023008D67
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 17:02:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8C2232E6BD;
	Wed, 18 Mar 2026 17:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="NAJ2VdoZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010067.outbound.protection.outlook.com [52.101.228.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7588231F9B8;
	Wed, 18 Mar 2026 17:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773853337; cv=fail; b=ZNT27zNqKBp7nUAeNYHpuBW43EGBDrIPtR+mPln4Muw88XUhA+Q/k/Nzer/Tlsrr/baWS11b1mCKM2bbSfwQB9yikpxq59zlT9j9CU4J3/P++ktC7fUIGbxIU+1j27lDDFFCSbJem2SpGQSnTEACmdTPIKUTwoSAD/2+ZUj1R3M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773853337; c=relaxed/simple;
	bh=4y5cHPX6ASDs6/HOUKdzPPA7i6+bukoUMC3ijDKjLZE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qD6IHEet4cVVcj4QCrS1ijSlM5jBTmwB7MmntZQyKMYa0KpLSWVY6kCv3WaU6FTmgKYRatqdakTIT3YpwjdO4sXxhEtX32M4r04X2bhT8QQYdzoCv6zmF+SrZlrmGa1lr16EMUYY4yid4caBXjtF7VkHbt4f726pDJsFa6n6wCo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=NAJ2VdoZ; arc=fail smtp.client-ip=52.101.228.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gu+VoJtmk8jj0he+wDrOi3I5xEwogyNasszif9ooHD9089ecDG9FsV1DbiBaJmOx7ILfWnghu8gvlVtFKux/B6a7GOsFVjX5ryWo3LB1zvL6jCjbcElpOVNSlXzYGaPnZfwQgCIze/JZvDfkEsz8RhIJj6LJ4QQ9r7ZXBnKp18MqXZdMJwJQJC2g5iA6mCXgFYQLVd6jCJn63L+i9xHsW11VIWCBHCyO+UybLRjMuwKpAOU4RVEVqn/wi0EbuVCmz5aj7a4Iwh9wGZYyQWx7JdqRXmLCgPavS+QHcMNO1Ez/Q6uwgPUVVflqW8Eh/jvtKMDRagAJG6aXaOFukTjAmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4y5cHPX6ASDs6/HOUKdzPPA7i6+bukoUMC3ijDKjLZE=;
 b=ZSQBez1MbrlReqFT6avGP6wTA62ul8TUvZBL0620NWg6KZMv3+WSqrbY6CZbnIowPgnWKiROfEX4nipPu3wF7e6mm1Vr4vB3G276/w12R2b3XIzGgLt0XZ6hNFyWA468bKaDAQHXB+ZOCx8H5Wx6CSZCnjJgWZ1JZcN7TpmlgX93xNLlTnGcpfU8rG1DTB/ReFQ6Dv95pHZaZWOEPSf0IwWnlPn0+jbgqntWY0TbdNIzb/mdItd+fXOP4VANDGwxWfMXn1GQSQSydDm2ylZDmi/qGUEiWxy4dp/CjNwMNm0P7922o2ZEwKoAgIdqEAik6ZgO6SDVyfGgiqYBx6FrJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4y5cHPX6ASDs6/HOUKdzPPA7i6+bukoUMC3ijDKjLZE=;
 b=NAJ2VdoZX1fSAk/c4aApgE8zYZwenP+BcIL4QRwsKhd+rhC2NHa4/BURO2dtLemWhbaZJ1lBRWzhwLwTiiZ6sXRo8SFUdUjKzNjNivL28H3ERTdHs46Zu710ypiKeGzKARMgqzKZ+GpedWEJP+fWxJG5iQC6giRbxD0YGRtcD0s=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB9600.jpnprd01.prod.outlook.com (2603:1096:400:190::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 17:02:07 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 17:02:07 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, biju.das.au <biju.das.au@gmail.com>
CC: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v5 2/9] clk: renesas: rzg2l-cpg: Add support for critical
 resets
Thread-Topic: [PATCH v5 2/9] clk: renesas: rzg2l-cpg: Add support for critical
 resets
Thread-Index: AQHctrMYYtem44RBbkeIrnCr4AvZl7W0YeWAgAAiX8A=
Date: Wed, 18 Mar 2026 17:02:07 +0000
Message-ID:
 <TY3PR01MB1134611999B1B8BD5E9B46002864EA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260318084151.122674-1-biju.das.jz@bp.renesas.com>
 <20260318084151.122674-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdX0yCX_mFt1B0jU9wM71BDaO27exmhbsKkMmRXJQthnUw@mail.gmail.com>
In-Reply-To:
 <CAMuHMdX0yCX_mFt1B0jU9wM71BDaO27exmhbsKkMmRXJQthnUw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB9600:EE_
x-ms-office365-filtering-correlation-id: 8d27530f-ceb7-457d-3f40-08de85101681
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 q+q0DUUsFCk9HzjE7027IsrgjPEkEh5hl9tNPkwlnkjRd20/Smai0id/7joJYcqUOhtrJ1RuD+Rxxjo4I8/+8Fz1m9wU0zGfwYdrpPctO++u31pCK8zuiTthIeWFZdQttlfxTQ3uDPKiEnJb4LVzLk4pVscfR48PqpLjViRrBeAdfcfC8nYBj8gyTTkmHecCFYgi6iAKMYgZ6BgIlOZpHq+V1JnGXlYsMUuzqNf8FDcsRiP4BcwEJbDUZMz9L8VOm01Se/fP7r26Hsya5nrX0XLzc56MZqBeqD6JVN88ouFEesLS/0pvqsJIbDsRGS1PKA+7DlGdghJtWi6jLA2131y0hrCSLi43clelGNs8aIuEx8VzxNyMTC98voi5Dv614yEyL+AsczEnxBUbjlOL8s7sbItVLLbvo6s7rI8ZRe+QLD9QWgQ/d4jvFwDrt9nybS1fgHvEXNeojFSssmfEc5xuB9Kzjfh81q8cMYBsqNXAecOwgq+JC7jc16++R2uLVSoNCaeaZOy/Ktqili05x6OS83cn1CTLKiqwj2c9j5uVTKRe0kUbxtcz2Sdi10/PcpPZAQ9sp6K8hKQFE7iyRXEAQjaahAPgSjjM70VoTigH9+oTClVSe0pSZuxVDswtBdJMQQ7GjRNGSgiB9PxEpU5tYU9yRzQfbdFnEPkETo1pTqyIDGdX7ijkBf1PIf4HA+1lICZmbGywxMizF+SfbmPQqOAc3y8vp3OSzxYURLa/OD+VPOrxKgKqjHzM1t0bI5zmk7mBIcG2fl2Q0Kq28b+qMgcxiUPi57uWLNRr/eY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OGpZZ3pvTEVXOHFnMW1qbUZRdVdpR2pjSE5TOU9lb0xrYlpWNVFEN0w5TFhD?=
 =?utf-8?B?TUUzTDhVWldqazBrZG1aM1l5aHVEaGZML2VqNEFwaTMwUThoMlF5cXdNYWlk?=
 =?utf-8?B?ZFZkdU5VWXo0RlRmbm1PVG8yZHdNNGx5b0xwK3NWL28zS1pieG9iblYxMk9O?=
 =?utf-8?B?aXBISk5wZ3g4NFNPLzBacnZOMFlIWHZka2FFV25aSTZVV296cU1Zc0g3K2U4?=
 =?utf-8?B?Qi9GOEJsRzJpVjV5VE1XUWl1WmREc05XaU1GYy9pZlpTUDlmQmNXcUEzclN3?=
 =?utf-8?B?WnR2REwyZyt2THIyU2JVdkNLNTZOUXRUU21JWlhSZzY2RDlaaWIyWkpOQlpT?=
 =?utf-8?B?cGRncytWNWtoOWhHMzN2clUyQ0RsQ2FiVmhJV2RiazdJcjFzck9kTXovcURB?=
 =?utf-8?B?T2NlMTRFbUROWWV2UElyNElOaXBROTlON0dpbksvamYwU0ZEU0lyejc2UXFR?=
 =?utf-8?B?aHQva3ZXMTlPSjM0NnNZdG50MWU2RVRIYkN3cVZDbDk2WWRKS2QyS0pMQW1Q?=
 =?utf-8?B?TWpKdmNUbHhtb1hxZjIrb211TFN0S0VTbk1JZm5OZVo4QU53dkhmV0pEZnBl?=
 =?utf-8?B?MDJjWWpTZGxHeWtwL1d0TSs2Z1dJcm1ab3VqQmpDRHBRUUMwNnBpWURaSWl1?=
 =?utf-8?B?NU5SVUI0VWhncWdQb0RjU0RkSkY0MWlNR2M3VWRyRkQ0QkQzNzdtWURxZTFC?=
 =?utf-8?B?d3Q5WWRmaVZsWUg0aDRkUnordWVObjN3Vi8vejhSMTlOVE5LZlRjOThHc2V0?=
 =?utf-8?B?U01USDZuY3UydUF4OFJ6aE02RkpxWHlOSVpNZzUrcmpTN0RibjdGK0hsSWxI?=
 =?utf-8?B?NExteUJQWm5yV1NEOHJDeHloU1hjbWxndlg0K0R1b1VsNXIyZUdxUzQwa293?=
 =?utf-8?B?UXhCYiswWGM4bnEwbWo1SWJDQ1B5ZXIrNSsycW5kcDdVVVpTMDR2TFQzVC9a?=
 =?utf-8?B?aWkxRy9URys5UmErQmRkS0ZnUXJORUp0ZDE1aitFUWM2dVFCbDNEM3o4Umxl?=
 =?utf-8?B?N2RqeTNMRFU3eE5CVHVjY2t5b0NRN1BMSEQ4dlZNTUxhMlBDTDUrMUtFdHpq?=
 =?utf-8?B?aG03eFlUaXlNUGtoMEZURTRFbjJHRGxsZyt4ejVtK3AvQ1ZjOTJic09jMVl0?=
 =?utf-8?B?VXMwSGk1eDZmc3hVLzNURnovVFFENVE2UXZRYmpRY2twQmkzd3FEVjRucy9i?=
 =?utf-8?B?eGljTXVweEpta2l5NEpHWW10c0g5cW4rZm95a2pacEI4eE95a1ZXUzF4VzNo?=
 =?utf-8?B?OHBPTXQvRUJ3SHZJamp3MHdHM1JoRXh6SVViNW90OWYrRGRvcUtWZzRNY3FY?=
 =?utf-8?B?bVVSbG9KNmhwdC94dHpKbGtkSGVGRGtnajFoMnJqdzNTMysxVzdKQXJTK2xS?=
 =?utf-8?B?VDlvMVJ5cVcySkRpV3gvRzE0RVdjaVNmSXU1R0Z0VkFnSkJGSzRadkR0Y2s5?=
 =?utf-8?B?SGh4NXd6cFdWenE4TU1jcTV6QnZ1cmlHSHZYTzJUVTNNbk1aK3JGZi9sM0Rs?=
 =?utf-8?B?SWVNdlRKU05qU2ZtVFpYeGpUTDdzSDljVWt1RXYxa1IzVHlKUDBVdERGM1JX?=
 =?utf-8?B?M1E2aHNNaEQ1S1R4bEdidVZIRzBLZG9ERWVGbWVHSW1taXJNc3pWdTVNU0Qz?=
 =?utf-8?B?MEtMQW9RS3prY21nOHZFbmUyYjZ6NVVidnBWNFovT2FxNGdSeTJPZThQVlFt?=
 =?utf-8?B?NmdXd3NZM3VvMGdqcGNBQ1dKTWs2THRUK3pOWWRJbnhXK3ZCeE1mTkY1MTE4?=
 =?utf-8?B?ZEdVd1c2YUtVdk5mSFNNOVpHVkhVdXpsNUVtNzRxVDB4MlFzN2IrNWZLdk9J?=
 =?utf-8?B?czd5NGxGK1E2VzFWRU1YamtCcENlR21ndnZPKzY1MmtOS0duQjM1Uzd6SDQ0?=
 =?utf-8?B?eng3ZjdFRTBFZ1Awd0pZWFFkdlJoU2JudkpacDMxSEF6SHF1RWVrblhHTWlp?=
 =?utf-8?B?Y041ekY3MnZRVTM2a0xPbmw5bmNDMUsrMVRhQ2dmNnRZZStxSGlkdzFPOWJx?=
 =?utf-8?B?MUF5MGdBbXJWdWQ3RlUzU3VUbk40K0d6dmtJWUVGTFVtckxYOVdPTGlsWmVz?=
 =?utf-8?B?cUtiQVlqbTFtdk9qT2dNTk1kdFhMeUwwUG82SjFTcGhsWm9SV2djY0xkQ2tw?=
 =?utf-8?B?Tmt0TnZKYzVRdktqMXdpbjVxeXkycnFsMldyMkxBMERIdFFtZWRNTlZ0QTlN?=
 =?utf-8?B?bDRYQVdXU3prZldNTnVQcEVXRkdoWEpVOExFS0lOYzdHdGUwNitJTUFMQldj?=
 =?utf-8?B?ZHE3RUlFcWZLYUU3NTNHbHV4UWZNYUJsckhjUTlLVDlvN3VVWEJVY3JtVnBr?=
 =?utf-8?B?N0JvanhLemxnWCtLMy9xQ2szM3lseDV3NElWNGpsU2xSdS9rY0Z4Zz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d27530f-ceb7-457d-3f40-08de85101681
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2026 17:02:07.6285
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hHs5ZunvwczLZ2tlH7JTlrpo6WCoW8GDm7rL3QraDFIlSzJ+0DwofNHbuFpbbRp2amt3JVKxLva4VuabO6vXTRY7aJdLB3eOlbTu5SHNxuk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9600
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-29804-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linux-m68k.org,gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.978];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linux-m68k.org:email,bp.renesas.com:dkim,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Queue-Id: C80212BFDA8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDE4IE1hcmNoIDIwMjYgMTQ6NTgNCj4gU3ViamVjdDogUmU6IFtQQVRD
SCB2NSAyLzldIGNsazogcmVuZXNhczogcnpnMmwtY3BnOiBBZGQgc3VwcG9ydCBmb3IgY3JpdGlj
YWwgcmVzZXRzDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gV2VkLCAxOCBNYXIgMjAyNiBhdCAw
OTo0MSwgQmlqdSA8YmlqdS5kYXMuYXVAZ21haWwuY29tPiB3cm90ZToNCj4gPiBGcm9tOiBCaWp1
IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4NCj4gPiBTb21lIHJlc2V0IGxp
bmVzIG11c3QgcmVtYWluIGRlYXNzZXJ0ZWQgYXQgYWxsIHRpbWVzIGFmdGVyIGJvb3QsIGFzDQo+
ID4gYXNzZXJ0aW5nIHRoZW0gd291bGQgZGlzYWJsZSBjcml0aWNhbCBzeXN0ZW0gZnVuY3Rpb25h
bGl0eSB3aXRoIG5vDQo+ID4gb3duaW5nIGRyaXZlciB0byByZXN0b3JlIHRoZW0uIFRoaXMgbWly
cm9ycyB0aGUgZXhpc3RpbmcgY3JpdF9tb2RfY2xrcw0KPiA+IG1lY2hhbmlzbSB3aGljaCBwcm90
ZWN0cyBjcml0aWNhbCBtb2R1bGUgY2xvY2tzIGZyb20gYmVpbmcgZGlzYWJsZWQuDQo+ID4NCj4g
PiBPbiBSWi9HMkwgZmFtaWx5IFNvQ3MsIHRoZSBETUEgcmVzZXQgbXVzdCBiZSByZW1haW4gZGVh
c3NlcnRlZCBmb3INCj4gPiByb3V0aW5nIHNvbWUgcGVyaXBoZXJhbCBpbnRlcnJ1cHRzIHRvIENQ
VS4NCj4gPg0KPiA+IEFkZCBjcml0X3Jlc2V0cyBhbmQgbnVtX2NyaXRfcmVzZXRzIGZpZWxkcyB0
byBzdHJ1Y3QgcnpnMmxfY3BnX2luZm8gdG8NCj4gPiBhbGxvdyBTb0Mtc3BlY2lmaWMgZGF0YSB0
YWJsZXMgdG8gZGVjbGFyZSByZXNldCBJRHMgdGhhdCBtdXN0IG5ldmVyIGJlDQo+ID4gYXNzZXJ0
ZWQuDQo+ID4NCj4gPiBJbnRyb2R1Y2UgcnpnMmxfY3BnX2RlYXNzZXJ0X2NyaXRfcmVzZXRzKCkg
dG8gaXRlcmF0ZSBvdmVyIGFsbA0KPiA+IGNyaXRpY2FsIHJlc2V0cyBhbmQgZGVhc3NlcnQgdGhl
bS4gQ2FsbCBpdCBib3RoIGF0IHByb2JlIHRpbWUgYW5kDQo+ID4gZHVyaW5nIHJlc3VtZSB0byBl
bnN1cmUgY3JpdGljYWwgcGVyaXBoZXJhbHMgYXJlIGhlbGQgb3V0IG9mIHJlc2V0DQo+ID4gYWZ0
ZXIgcG93ZXItb24gYW5kIHN1c3BlbmQvcmVzdW1lIGN5Y2xlcy4NCj4gPg0KPiA+IFNpZ25lZC1v
ZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gDQo+IFRoYW5r
cyBmb3IgeW91ciBwYXRjaCENCj4gDQo+ID4gLS0tIGEvZHJpdmVycy9jbGsvcmVuZXNhcy9yemcy
bC1jcGcuYw0KPiA+ICsrKyBiL2RyaXZlcnMvY2xrL3JlbmVzYXMvcnpnMmwtY3BnLmMNCj4gPiBA
QCAtMTc2NSw2ICsxNzY1LDE1IEBAIHN0YXRpYyBpbnQgX19yemcybF9jcGdfYXNzZXJ0KHN0cnVj
dCByZXNldF9jb250cm9sbGVyX2RldiAqcmNkZXYsDQo+ID4gICAgICAgICBkZXZfZGJnKHJjZGV2
LT5kZXYsICIlcyBpZDolbGQgb2Zmc2V0OjB4JXhcbiIsDQo+ID4gICAgICAgICAgICAgICAgIGFz
c2VydCA/ICJhc3NlcnQiIDogImRlYXNzZXJ0IiwgaWQsIENMS19SU1RfUihyZWcpKTsNCj4gPg0K
PiA+ICsgICAgICAgaWYgKGFzc2VydCkgew0KPiA+ICsgICAgICAgICAgICAgICB1bnNpZ25lZCBp
bnQgaTsNCj4gPiArDQo+ID4gKyAgICAgICAgICAgICAgIGZvciAoaSA9IDA7IGkgPCBwcml2LT5p
bmZvLT5udW1fY3JpdF9yZXNldHM7IGkrKykgew0KPiANCj4gZm9yICh1bnNpZ25lZCBpbnQgaSA9
IDA7IC4uLikNCk9LLg0KDQo+IA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGlmIChpZCA9
PSBwcml2LT5pbmZvLT5jcml0X3Jlc2V0c1tpXSkNCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHJldHVybiAwOw0KPiA+ICsgICAgICAgICAgICAgICB9DQo+ID4gKyAgICAgICB9
DQo+ID4gKw0KPiA+ICAgICAgICAgaWYgKCFhc3NlcnQpDQo+ID4gICAgICAgICAgICAgICAgIHZh
bHVlIHw9IG1hc2s7DQo+ID4gICAgICAgICB3cml0ZWwodmFsdWUsIHByaXYtPmJhc2UgKyBDTEtf
UlNUX1IocmVnKSk7IEBAIC0xODAyLDYNCj4gPiArMTgxMSwyMSBAQCBzdGF0aWMgaW50IHJ6ZzJs
X2NwZ19kZWFzc2VydChzdHJ1Y3QgcmVzZXRfY29udHJvbGxlcl9kZXYgKnJjZGV2LA0KPiA+ICAg
ICAgICAgcmV0dXJuIF9fcnpnMmxfY3BnX2Fzc2VydChyY2RldiwgaWQsIGZhbHNlKTsgIH0NCj4g
Pg0KPiA+ICtzdGF0aWMgaW50IHJ6ZzJsX2NwZ19kZWFzc2VydF9jcml0X3Jlc2V0cyhzdHJ1Y3Qg
cmVzZXRfY29udHJvbGxlcl9kZXYgKnJjZGV2LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCByemcybF9jcGdfaW5mbw0KPiA+ICsqaW5m
bykgew0KPiA+ICsgICAgICAgdW5zaWduZWQgaW50IGk7DQo+ID4gKyAgICAgICBpbnQgcmV0Ow0K
PiA+ICsNCj4gPiArICAgICAgIGZvciAoaSA9IDA7IGkgPCBpbmZvLT5udW1fY3JpdF9yZXNldHM7
IGkrKykgew0KPiANCj4gZm9yICh1bnNpZ25lZCBpbnQgaSA9IDA7IC4uLikNCg0KT0sgd2lsbCBm
aXggdGhpcyBpbiBuZXh0IHZlcnNpb24uDQoNCkNoZWVycywNCkJpanUNCg==

