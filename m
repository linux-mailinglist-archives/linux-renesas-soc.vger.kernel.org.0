Return-Path: <linux-renesas-soc+bounces-30051-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AAcrCoyLvmmqSgMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30051-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 21 Mar 2026 13:14:04 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 304642E53CE
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 21 Mar 2026 13:14:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C693A300A12E
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 21 Mar 2026 12:14:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C15322D3EF2;
	Sat, 21 Mar 2026 12:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="nFvFzZ30"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011045.outbound.protection.outlook.com [52.101.125.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C566629D26E;
	Sat, 21 Mar 2026 12:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774095238; cv=fail; b=VeBeM1i26gOQlUzD1u3RPXzUHThZJamchKee0+C7Y9WkxrPzYKzaERKIhmgHWPI/fKuGeddoWCzUm+eu+lcxupJyar2rLEYxMFEbV7Zg055M5qEbC8QyeikBSs776TG3BNI1O6fqoZp9pRsoWb9oVDZGt+nvcLfU4AoJQUA+kkU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774095238; c=relaxed/simple;
	bh=oE2O42PbZ6revHbnTAiPSM3h2ylHWEuVpnTs2SCqhBs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GY0xFsAJSssw3HARvnpoxJ1PYoMuMfpU12crtiUrUymBp5eUFmnXBzZHQqIboeSym2UCP2Nqn0z3D3pjWV5+hhyMB31RIEbntXCHkOoMRfG5+HQYDOcvhCi48dELInYmFYfAhsyMjP/I84uVzJp+48Lvk8KhF4J0S4Z6ZgA1vnA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=nFvFzZ30; arc=fail smtp.client-ip=52.101.125.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FsoRLdrc0DK/ekpyNVKOrdptPpALlXq9bUQjU95T8KLLR/4vQ+ge+hVE321vwfXdUc60caqN2nLenI4XhWwl3hHoE2N4H731+Lx8oJjCWbppzarcteKLgF/9SLNOUAn6MG6ZgdCQ8ERhdLflWg9drICLM3Jl8ln7j9PZeLQ38b6iUX1zVQmM5p+Io5LAhlJusGRXHgVEYuNIMhxtv4glDaayp4V81HZkNH9CwzzeqBTker+r42Sp5yUHfgzW7HCIxSVKMKN4SMoIsV8nDZvkH5GtgOBVSZgLQXEuF2vEdRUNSlbuthxR8AbpPiKpsUuVymo0nGz+/ImSjhfW3/AX0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zJQenFVyfWRZvXVn8djEyaAoTS4OdL9qPOkNl0ZA8YM=;
 b=nPV7mbz/+AmRmbX1KsSRgPE5/UybCNy0HtP7HEnoYdRTNly9UIcoZGg5MFAsJ5eskwZk+J9bP2UPHV1uHb5O/6xFmuenwSPLYpSVyeJNHCv5NPyL5FX4Pl8Mq23+MJ+7f+P/90FfbDBA1ilWXhkZqk6SEyV+XPWZ6tE5kAJPvC7axG/uzBC0j97Dw52KfO1DVloZjBYumK68R8diB2HCchB4KXN9oP7SKMhvKtr5w6wGYw3yybyoNrj67Le+hqsAuIh02Ymqwcq3VhxBn4e7lc5JBJgoOQArMUkfTAOdyE3heldBSI0LnPSx8+uvplXakU89v9hucOL3QGrU8xDZeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zJQenFVyfWRZvXVn8djEyaAoTS4OdL9qPOkNl0ZA8YM=;
 b=nFvFzZ30/kpQGILYrdsEB4Ksw48l5+LTs9oj8sKtquM1h2HkG+z8+Cw5CX4N4eeOQ86yi2PPnHR4WCnsBXoMth1DpQfVI/fDy8uwplX8dYJXPD6/LhYhJlNFtHPlZP6Su9sjJWE3GIyUQzUAgh0QpyxXHE2Qj2ViHRm6jhfOYYs=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY3PR01MB10207.jpnprd01.prod.outlook.com (2603:1096:400:1d8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Sat, 21 Mar
 2026 12:13:48 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9723.022; Sat, 21 Mar 2026
 12:13:37 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>, biju.das.au <biju.das.au@gmail.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v5 15/15] irqchip/renesas-rzg2l: Add shared interrupt
 support
Thread-Topic: [PATCH v5 15/15] irqchip/renesas-rzg2l: Add shared interrupt
 support
Thread-Index: AQHcsYzME8LKYUM6yU+Y20SUC//E7LW3LOcAgAB2I3CAAU8fAA==
Date: Sat, 21 Mar 2026 12:13:37 +0000
Message-ID:
 <TY3PR01MB11346946A5C72A6FAA6F9E63E864DA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260311192459.609064-1-biju.das.jz@bp.renesas.com>
 <20260311192459.609064-16-biju.das.jz@bp.renesas.com> <87fr5ulvtd.ffs@tglx>
 <TY3PR01MB1134697576973F8C0E064106D864CA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TY3PR01MB1134697576973F8C0E064106D864CA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY3PR01MB10207:EE_
x-ms-office365-filtering-correlation-id: 4e9ad3ac-d2cd-485a-f75a-08de874347f6
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|22082099003|56012099003|38070700021;
x-microsoft-antispam-message-info:
 Ln+OL+hA+If/Xzj3dJ6TVOEdH8Ivjlnzj1NDT0Kl8B4Itc8vaDBvhEizJVQOrF8ODx3CgP1IfZ1SGZ3LPoqtgiu9ie4+kpumjuJXulgPMI4cic0u3EUSwpyQeMfjSF6zhYFMcNlmru4Byc1x65utI3rHTTjGSESIfYrDY7ZOg9r6dzpE3Gp5XeuSstpmivAPzaShHczLC79qbDklrW9zTlQ4B5fNITGQ0FItH5UgmFONNKHX6w4K92LvUhQLrTYfXPCvMLFx5a+xq0tD3JtMzqC389zZPXF6uxxGllNxwDWmuMm3W8Uy3cb59nDSIJxu7PxfowqnJUzxdCDRolyPv7egbdp+1yCUE4Gs/twJbwXHMwGfbz506lnSVTphCqeFSE0rpFbRahTwHuxtyDsfgOP4DdBz1yv4zmt4c3Y/OaIJUsS7gkwd4M8rYTj21toFvlXczM8FrxZPB++BatY1zBfT0tRmX1IOJ3sXnEDkUdUhDA7+dJuJup034wNh9BRfUJzNhxc3H3sp+CcfTAKPjRzb0Jm3wG+UzoL9S/5nUSdGJmlvldIgj27cLJG4GHIfPaHUm8nZDKAuY/99iJowjK5fG4GW/nJa3alMUf+wCm/myG5EtxYNrRPwMkKPE4FH+psJORR0s7qFpnTvRJinac4yW0Le23foJEoJK2XsD8FrSxtrWWxHHopWP/hgVCJGS7crwogeT3bYxMRTvMKPzgUeYg1LvYAwmyEgqlS2kCH8seKuA165H//zmLUwYLV9NU2u9Cq+euI/b4bYNUkE/nue/NOwmpCzmoKyBfWE/D4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(22082099003)(56012099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-2022-jp?B?d2lLUEZhVnZvb05jd2k5aElVb015dUV3WjVtZitkcHV4am12ZTFZTUVU?=
 =?iso-2022-jp?B?d04vS2pCZHIzaWp2SVUvMFdmaW5NRVlpZ2JsYmY5NkxVQkNabVVuNjhr?=
 =?iso-2022-jp?B?cUF3RnVJb292a0JtaGEwV2NWYm5TM2syZVhkSlVYemZpWnNUV2E4OGtN?=
 =?iso-2022-jp?B?ZGlJcnh3M01BZmQ0Q2xESXBZL2d1TUQxMFdILzNqNkZlOGxkTUpORGVH?=
 =?iso-2022-jp?B?OUxsY3oySHN1ek1SZVZsYUQvdkJjaHFZazArN2lISkdkVC9DcS9NZFdh?=
 =?iso-2022-jp?B?MWRCenI2bEdIWG45ekI2S0hhVkE2cXI1aytpUkdDRFgyVjFqK0l1VUZq?=
 =?iso-2022-jp?B?amJ4Sks1ZXRUOU5rSTFaMnZFeHFFdXFKMTRyZWJzTjBOYk12eVk3aW90?=
 =?iso-2022-jp?B?U2dMMVlQbkVKMkdrM0Jydkp1UlQ0SXdoWHlVeVhYRVJ3Vjh4S3phZWRT?=
 =?iso-2022-jp?B?Q0dvaVFJVVdGUERHTjdjaEp0SjMvY2lwcjY0WGFqcnNtU1NmRFNNSklv?=
 =?iso-2022-jp?B?b2RqMXF2VHo1bmdmbnhISjgrTjFHYzNzcTdkaWh2b1YrRGlld0xTcFJJ?=
 =?iso-2022-jp?B?K09la25uVUpVV2I0b1NOdng2MDRya0ZlVUFWYzV3QnowUm96QWlOeEFY?=
 =?iso-2022-jp?B?d0Y3UElkWW5SRjBMRk1lSlgrTURtWDBJNTRGVkJxOEtGYzY4WUUzeDFB?=
 =?iso-2022-jp?B?YzFHcHB5Si80clRBN3NmbUNmamNWcEVEOXpQRjk0MS9ZZzF0cXh3TkF2?=
 =?iso-2022-jp?B?YlRHOWVsSGNQT2dZZEhWVk9Oc053T3p2L0FwT0VoWGk1YllieS9pNmJi?=
 =?iso-2022-jp?B?SElIUVVRN3Y3V2pkVmk5T0dvdWhzakF6blMxSlRuZk1pQmhqSVNHbDBZ?=
 =?iso-2022-jp?B?WWxtODByZUxtZkdIWTBxRENjQ1Fza0plNXpySFJnOW1FOWt5ZmdSeWFB?=
 =?iso-2022-jp?B?Nk8xNGlHY2h5UTVhMkNzNk9aN3B6aTdCODIrRGxaZndMTW9PTWlvYmYx?=
 =?iso-2022-jp?B?Q1NodllZbEh0QXg1Y0JMNTl2MXFPbHpVTW85cW5EYmRKbHNRajNEY3V6?=
 =?iso-2022-jp?B?WWJSTGhCRlgrOTJnQXB4aEpHWHVqL1UyREFGanMwQlVLL2I0SHJ6UDU1?=
 =?iso-2022-jp?B?aE5OS2llMXJFQzVPVjNPVUhPTkxZcXQxYlYyQkptb1IzdzNEclFJSVI4?=
 =?iso-2022-jp?B?bmkraW1kSk9xOHdsM083by9KK205YjRMLzFTclVaM1VObkxNUWFuZms3?=
 =?iso-2022-jp?B?dEM1ajB6Zy9FTko2eUFnS0drWXpERFVJWDI3R0pGL0xTNVFBVFcrRWVo?=
 =?iso-2022-jp?B?ZFhDYVFJSllRWERVR3FxYkkwdDlGVCt5TVAvbExseHdtUEsyYkswaXRN?=
 =?iso-2022-jp?B?SmhKUWVRQkxhQmNRNE5JRjJLKzdUWUxhYkk0MGlhUzBqQUs4ODZYdWIz?=
 =?iso-2022-jp?B?S1VYZ2oxRXY0UXB3U3ZKd0VYL25BWmZLTkZ6bDRldXdLSFl0WGF2NXh2?=
 =?iso-2022-jp?B?MzYxSVVEZzBaREJpN09OeXBKSFRVR1BBMyszMmRrS1ZNcFIyTk40SFZO?=
 =?iso-2022-jp?B?TklycDdhUUVSOU9DUG0xeWsrcHVSa0hkYUoydkVKN3BMWHB5T080SEU1?=
 =?iso-2022-jp?B?L1lnZHZBNTJtVW9uVklNaVFnaVB5RWJvU09jdmIwZVYzSlJGNy9vVFRw?=
 =?iso-2022-jp?B?b0VTcnhWTzFpTnFKdWdSeHhTSFQrOVZFellFRGl3OXRqUDNzMzZWZE1n?=
 =?iso-2022-jp?B?ZkNzdS94TEJkN1YxMHBsQmNlSm96alJnVVJLbFgvTFFFQkFnWGJ0aXdH?=
 =?iso-2022-jp?B?NFU4SUlLRGFiR09ZcnZGaC9HOFFWY2g4RnkyWk5sL3hwK1NWNUZRUHVi?=
 =?iso-2022-jp?B?blkzc0NOYVlBVW1FdHgyVUZVT1dzbW9sMjBUUWZlOHQyem1hZTN2eVFM?=
 =?iso-2022-jp?B?M2tiOXhaWWRwMGVNN2l6eW10SkQ0clllUDhVT2IzSlhWSEtMbXo0ZU03?=
 =?iso-2022-jp?B?aG54TnR1UUpka0lobGtsZ1I1ZU9PK24zaGpzMmpRN2pUTjczMENBeWdB?=
 =?iso-2022-jp?B?cGc4SFBsczJqdE9QTHZXeVN6TEduRjNtZGR3dURCSHcrMzh2clppTng0?=
 =?iso-2022-jp?B?Q0FuNUllcG5IUThyeDNGZEJsb1lhZkRxWE5hQzEzckxuR0RMV3FZN3pm?=
 =?iso-2022-jp?B?Z3JXN0VWYnFZNTlabE9GVHZPYm5LUTRZYWVLQS9BOVpzSGNjcDh2a3Vh?=
 =?iso-2022-jp?B?b21FNEpEeWM2RThhcDRGQmI1Q1ZnOVhVZVFYbldkNW5xSnduYVVqOS9n?=
 =?iso-2022-jp?B?RkJCV3VkRTNITXppVFZWTmVmN2VRSTdZTldJcmpieTNZY0RaeTRKVjFT?=
 =?iso-2022-jp?B?MmNNV1B3MVpjNkRBak1BeHg1eDZCbnFweTBSck5yWWFLNDQvTmx1RDdo?=
 =?iso-2022-jp?B?SjNlSmMyeWkvb2Jqa3ZwWTAyMmwwS01nOXpNYmV3cGVZTzk2UmE4ZThm?=
 =?iso-2022-jp?B?V0tTL250Z1BnVXREa0RNMndqV2NlM3FHcVF6dz09?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e9ad3ac-d2cd-485a-f75a-08de874347f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2026 12:13:37.2543
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ha2Z730oMfQ9Uv57IJaE2QuVNol+WFzwczwVCYQbj6TYiFJr4gxNBir2k2Ts+txH31uT14CU4oyA5oRT+8bo0YNV3zzKIrkHUDSdlbUoa0Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10207
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30051-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,glider.be,bp.renesas.com,gmail.com];
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
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[7];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:dkim]
X-Rspamd-Queue-Id: 304642E53CE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Thomas,

> -----Original Message-----
> From: Biju Das
> Sent: 20 March 2026 16:07
> Subject: RE: [PATCH v5 15/15] irqchip/renesas-rzg2l: Add shared interrupt=
 support
>=20
> Hi Thomas,
>=20
> Thanks for the feedback.
>=20
> > -----Original Message-----
> > From: Thomas Gleixner <tglx@kernel.org>
> > Sent: 20 March 2026 09:01
> > Subject: Re: [PATCH v5 15/15] irqchip/renesas-rzg2l: Add shared
> > interrupt support
> >
> > On Wed, Mar 11 2026 at 19:24, Biju wrote:
> > > +static int rzg2l_irqc_irq_request_resources(struct irq_data *d) {
> > > +	unsigned int hw_irq =3D irqd_to_hwirq(d);
> > > +	struct rzg2l_irqc_priv *priv =3D irq_data_to_priv(d);

We cannot use the irq_chip::irq_{request,release}_resources callbacks to ma=
ke
shared interrupts mutually exclusive between External interrupts
and GPIO interrupts.

It is possible to achieve mutual exclusion between External interrupts and
GPIO interrupts by using the irq_domain_ops::{alloc,free} callbacks.

I am seeing an IRQ storm if I use the irq_chip::irq_{request,release}_resou=
rces
callbacks.

	IRQ8..IRQ15 =1B$B"*=1B(B External interrupts
	TINT24..TINT31 =1B$B"*=1B(B GPIO interrupts

Selection of the shared interrupt line between external interrupt and
GPIO interrupt is based on the INTTSEL register.

Consider the case for the shared interrupt line where
IRQ15 (consumer: ethernet PHY driver) and=20
TINT31 (consumer: pinctrl driver) are both enabled in the device tree.

During driver probe, IRQ mappings are created for both domains.

In the IRQ storm case:

	IRQ15 is probed first, but __setup_irq() has not been called yet.
	TINT31 is probed second =1B$B"*=1B(B __setup_irq() is called, and generati=
ng an interrupt causes
	an IRQ storm because it is picking the EOI for IRQ15.

Therefore, I will switch to using irq_domain_ops::{alloc,free} for mutual e=
xclusion between
External interrupts and GPIO interrupts.

Cheers,
Biju

