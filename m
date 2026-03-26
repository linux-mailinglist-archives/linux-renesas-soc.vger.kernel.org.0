Return-Path: <linux-renesas-soc+bounces-30389-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJYlA/h+xWnw+QQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30389-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 19:46:16 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D303E33A569
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 19:46:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A2B2731424B7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 18:28:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4451339EF30;
	Thu, 26 Mar 2026 18:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="t1qTgVqn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011053.outbound.protection.outlook.com [52.101.125.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F66D125A0;
	Thu, 26 Mar 2026 18:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774549630; cv=fail; b=Sz43PEAXun/kg4qFF2el84dpHMHRwCWmb9cneDc+oZsPMADXBGDbd1euC+73K4/RoG9JnnVjt1+dQmZG0aeNdNCweRJU18G0OMZbc4tNHpbHInlXpdpvruUfuuPfAf+bQN66V5/sIF+OufRILkibSDpClcp3jbmhfVnwM63dOFI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774549630; c=relaxed/simple;
	bh=d+9WVvKGxdMUBoXCYKpWALVmA99DTwDPcOeF9GQVcmw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RT6BUA/p8Yz6P/+SQm3TyGC2Ixsn1t1XHwDJNtPBmI4kEokDVb60opAFOMgUiM5vY4TWEOuKg4XtWgMkZu8JGyiAbPANwWHpOSwFE5zedCAJ+THGVQ6GLTRCmd2fBvl+EW43tRfW+1TtKTISYHUo4haWgEdyf6dw3ByYYkVqJNE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=t1qTgVqn; arc=fail smtp.client-ip=52.101.125.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PjZGxITABjWxgLl/UVxj7a7hlbBDnnxb4FDHt8UCrTZ4ph9FvEJlvYMYy7pD2sFScGifnDsa1q0nUsWsYAVlbtSykAGZM3RUumAokn0m0xDooB0ubGObHnEMz74wjRPfbMIbH4pQyiVVFMMfv3izFDmKa4uf+BB+ovwhW9y93iJgmqx4KMQblXI3c+kLm0F89bIYilIFuTj27Ys5pMEsyjj7S0lDZKeoVaAhLeMh8TKIRpqbjGAQNjjuMJulP5l2eyQ9u4XitdOiLbkveMOX/JDosEfm8J4qrlvkpiMlwPYOXcIMQ2LrLzZRVnbeYGLM+IGKx+pLtw9sc3W3wf827g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d+9WVvKGxdMUBoXCYKpWALVmA99DTwDPcOeF9GQVcmw=;
 b=F2eqoLSQhyJVjM6GnDo8aktATzkFcMK/cubgyoqjlxoLwRx+qVMrPHWNaPFjbGYA4+8bJX8MROOZX43A1e/EaLUH5yh8UXxUEjBIEVj/xWp7qKMF12/wCmXp7LFXR+CjfNEfeBpDSp23MIV57k3+OGWcGHs7DHZMEbwMLRv754eCP3lJBpjBGSjkhb0qhmt9BAOYQCiy6ZX9gkg5N+HtfwRhmLf2z05MXoXwT4CYw7WQVK42gDueZs8VWrl3QZ2PSEpd4W9WpJJw+UNmCPOWRLtsCv4CvHOt1WoXfJkKoVec/fP72+DFQty4IdJ4rRdAZ4eacptIbth3n/EZNJQTyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d+9WVvKGxdMUBoXCYKpWALVmA99DTwDPcOeF9GQVcmw=;
 b=t1qTgVqnXls7IMmjfTNu/hahvRLuAFiaoUaAyeNgMauDte0Lojn+xr4wAkYqO2JWPCsu5/sAI8NASeXfiYMLXNY9Bv4ODXWYRHoUv1/p3gEigQvQrUSM5mNHMnkpK36lFAK5micHOZD3wtruCDGl/g/Uqkvg4P5BcMZqGAUu5Ks=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY7PR01MB17746.jpnprd01.prod.outlook.com (2603:1096:405:38b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.21; Thu, 26 Mar
 2026 18:27:04 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9745.023; Thu, 26 Mar 2026
 18:27:04 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, biju.das.au <biju.das.au@gmail.com>
CC: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, magnus.damm
	<magnus.damm@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, Conor Dooley
	<conor.dooley@microchip.com>
Subject: RE: [PATCH v8 01/11] dt-bindings: clock: Document RZ/G3L SoC
Thread-Topic: [PATCH v8 01/11] dt-bindings: clock: Document RZ/G3L SoC
Thread-Index: AQHcu4N2sJyqccvHpkGKNBsuHuKXobXBJGiAgAAAhWA=
Date: Thu, 26 Mar 2026 18:27:04 +0000
Message-ID:
 <TY3PR01MB11346AC0D4CC9669FBC02E4D88656A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260324114329.268249-1-biju.das.jz@bp.renesas.com>
 <20260324114329.268249-2-biju.das.jz@bp.renesas.com>
 <CAMuHMdVjLuAWrADbKY9QqD4MY54G5P_jaU4=4aHTeiZXaoR67w@mail.gmail.com>
In-Reply-To:
 <CAMuHMdVjLuAWrADbKY9QqD4MY54G5P_jaU4=4aHTeiZXaoR67w@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY7PR01MB17746:EE_
x-ms-office365-filtering-correlation-id: 5e4aed86-6a3d-410d-dddc-08de8b6547db
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 Z3AaDO0RQvjuS09g5LhQIsnh725CPST46v5mbYSsusZUSdU5d2gE9F0Ip0s2NP/euDi2cd6pT0/V/cT09ZYEM40PKeJhmW4g61SxDmyeCxA1KbNzilXMCB0Hjt91onwoCVED5NOTIeeBQwl163oOJ90uLA9q+q1fZC+3WC798LSwnNg8pKniu+cWMg+ZTjDU9V/yBvNFRDiCsDvS7lo5uVBSKiDPscqm4Ma563yv2EdBh92ycVEgq8nsYZiu1vNvLo0+MIsgXD29Ykow6OtzyC8sIUl0CG/jcoGXGOEN3BYfmMnSturEkp+yf9kfrc1lYlGrbAlVjEx9Yn3K7CWVf3ty3agoJq7OThbxYaySMHa72dJtBG4CO7Qo//UTTXQLsiySh8uK+r+KezV+BvnzyQ+tJGPJsW8bN+1vZU+9YZwbha0N0kp52gFeHZbX3hYM6hIQq6S6b7KdAtLKYnQTUS7cZaaCX9gQJZ4OKA1K05EmpZfh9cwwvwGU5awDUYAkMaw7++lHRqA+ICRW3JrPiTAFaP+jtT152JwrEgq3wzgGpYqGpDkNHirI+Y0NY2RgUuOZ1+uGZ7SAO7Tx4T9vuInhcCoTB338pEqDg4BU1xtQ9+y3XFkJ65seduFj0OMvL/xcdB2KQ43IU3hnvJaz6LCSR1P/XQMtIPiSCgaMFXLDuFM5bmthnkZe0PeGNDFDsGJ2TsS55y7uCHMDjn4R7VvLoanEjeormS7lt+N0wCXxHN6eAGM1fShVRt92t5CT+fMpOB+TrrYRK2ksra4GiqDgz3tXv1c0X+bxCAd4Ag8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QWJxVlQ2QXlURWhIVmdHdzJUdmFoTlJ5MUFaYjdmdUMvOFVEMG5IUUV0dEZZ?=
 =?utf-8?B?NlhJanhpaTNIdEpMZ1U0TW1WQ0JGQzBCellNeWhocXMrcDluWGE5QWZueHBZ?=
 =?utf-8?B?YWtYNVh3N0QrT1BLWEo5dnYybk9uby9ENDVQamo4SjFmajlPZ3hyb1pXb1J5?=
 =?utf-8?B?Qm1vb0F3ZVhLbzBzc3k3dU5hUU9UMmNrMmlIdW9sd1k0elZhcjM1VkFKUzc3?=
 =?utf-8?B?UTZ6UEk3L2szbm1lam93ZTdpNWNQckZnWlEyVVZkaUtZV1lHbDBGY1htOWUy?=
 =?utf-8?B?V0NxQ2lybDFQZVdJM0kxSURNYzhXR0lReHN6dDNJWjVEYVVNaitBK1RFTkdx?=
 =?utf-8?B?QWN5YUdRV2k2eEx6SzFUMVZyQ3ovS2ZQVnB2NjJBdTBqa3cxY1hhemYzZjNF?=
 =?utf-8?B?TWRQZG5kSy9meldOTFFPNytjMWk0UnB3TEtsU3VGOEIwUjJIRGcxRXQ5eW0w?=
 =?utf-8?B?SDQ1ZVFEeTlKOVZFWG1jK0xONWxJbE9zS1NRa3A1ODBGVUd3ajBoNVlsN1Nl?=
 =?utf-8?B?Tjk1RmhSZXV1TmZTZjZ4SnNIbm11S0Q3TklhM3MwTUNjOUU4YzdGNDZzdERv?=
 =?utf-8?B?L3Q4YnV2UE9tRW9qeDBHN0tQcG1mMlZKZy9hQzA5TkFNQWI1cnBSSlR5Z1l5?=
 =?utf-8?B?TmNGbURvMzI5Sjd1dytNTjExSWJEYS9mRGNTZnZVUm8ranFFSnYyNFczL25u?=
 =?utf-8?B?TEp1QVJVaVpLN3grWGsrSnpBT2Y4VTlreGhDLzVmOGE5RlloOWIzWWphVFJC?=
 =?utf-8?B?TXdyNko2cy83UzNpbE84a1dlKzd4YkRINFJYUWxJeWk3RW9mMVJwUmYrNitu?=
 =?utf-8?B?MFlYUzhpZUhnNktHNzYxRHFDVTU2WHF6dHJuU3NTYlgrRmpEY3lXckZwMzBo?=
 =?utf-8?B?aW5FdUZpZnJyT3pHYTlnNzM0aGNVMDJhZ3dzQ0o1aEhhOHdUUjJaaFY3YTMr?=
 =?utf-8?B?SWN1VUpWV0k2bXFiLzM2aXh6KzNheXk5VWZUSzJzVHF1VE1nSlZyZVVJc3VJ?=
 =?utf-8?B?YzY4TkdhZjFwUDBlekU5Z2lJYkxDWEh0M0VTWXZCOFFwaFhvbjhtNzBJZEdr?=
 =?utf-8?B?RklCVjlDRjVHNWtqbFQrMFF2Umt0MTFWZGJ2MTBBclVqV0pVR2JOOHdIRFpT?=
 =?utf-8?B?aFlLWTEzRndrRjVoQkNqLzZRUWdCK29LNTViOE9xYnRhYlJNWDVXL1h1M1pO?=
 =?utf-8?B?ZFl4dXNTMDlzbGZaOVJ2Y2VaWjZscXJHQktPSzliYmFTV1VLTUUycnlHUG9x?=
 =?utf-8?B?ZHFXdEVYNjRqdlhwcEZGL1JkbXE1c1IrRmhvWHRsT1k4MysxYTh5cmY5cVNL?=
 =?utf-8?B?bkg2TE9tK0szOWxGOVc5a3VGaEpTU3g4MDV0d0JhRld4eklva2M2emlWWlMr?=
 =?utf-8?B?MEVBU1ZDemtCcXF3YlV3aUwwQTAwcjRobVl2Mmh5L01nZ01hTWJadzJzYnJU?=
 =?utf-8?B?Q3QrZGgreE13Nm5iYSt3dnY5OVNZSStGM2plTE54U3dpTEhta1JDMEdaZFNh?=
 =?utf-8?B?VjFwcjVKZHBvT1hwbWFBaUhNWjNRZGRBMVBGZVpBaDdiWFlKMzl1MHhwY2h2?=
 =?utf-8?B?VUcvTURiNEtSWlZEM0dTbEdZeVBuUEcvaFhvWU5LNitoSytYRnRDVDQvdmp4?=
 =?utf-8?B?Z2xFTTljTWsxTnVYZkdqOXZ4dlp6dHhvWTVmSExUZjlGZnl0T0JXdW84REVW?=
 =?utf-8?B?SFdkRkgyOXR0eDYyODNzTXVmclVkTVMrOFJFK0Q3WCs2YWFrRjNCakdmOVdT?=
 =?utf-8?B?czZkVWxBWmR2ZEE0RjJ5NlNWdCtpSDNXSXp0ckFPKyt6bXJRcTJ1QWNjQ2E3?=
 =?utf-8?B?em4xZDVzdXYwV1dGbkxWa2xlOG1TdGNlbG9paWYvcTA4cU5xUDVYMWl0aW43?=
 =?utf-8?B?MkRsTjR0dnFQMXZLK0RZdnRvYUE4czR5dGFGS3RTcEtuL3ZMdG85Z2hLeURt?=
 =?utf-8?B?eE53aHBUWlM2YUd5bjMzTmdJQmRzK214bW95eXZvbS93UTN0RGgza2NFVGx0?=
 =?utf-8?B?S1VvbW5iTGZmSzEzUEtROCs0eHRKYzFodjJTaU1sYXBBWmVsV3M4bXRqSEkv?=
 =?utf-8?B?ZkI2L2RWd1RKTm1oL3ZmNXF4NXBGTUM2d25KdkgzMUpwSU13aE91blhLOGhw?=
 =?utf-8?B?ZXdOL3kzaUlWc054WEpRRnp1WTRydS91dkxUMDZkaXB2c1lIelBpd2VTU1hn?=
 =?utf-8?B?d3FWNFk1RnZQd0c1MHdNZ2ZGcmFjSzVSRmphZlJoT3hKeGFBQ0c5QnJzQmp3?=
 =?utf-8?B?V2Q2S3RWYnJqZ1Z0ZzhvRzVHR2kva2pQRXo3N0ZZZFRPUU4zbFIwd3RKL3Fj?=
 =?utf-8?B?UkdLbjBMMXNjYmoxWnVPY29HaDVLS2R6YmJzQis4UXR2Smw4Q0Z5QT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e4aed86-6a3d-410d-dddc-08de8b6547db
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2026 18:27:04.6613
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bw3Xd7+II7UCmth+wTpBC8v3S1/K0kJ2dEe8PusT3PP7qQd8KRSRJSbmJclR+Cr+2FhaH+OE+T9OtfHf3xlCf5ae1tWFZNd21kpZBhJdgls=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB17746
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30389-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[linux-m68k.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,gmail.com,vger.kernel.org,bp.renesas.com,microchip.com];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: D303E33A569
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMjYgTWFyY2ggMjAy
NiAxODoyNA0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY4IDAxLzExXSBkdC1iaW5kaW5nczogY2xv
Y2s6IERvY3VtZW50IFJaL0czTCBTb0MNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBUdWUsIDI0
IE1hciAyMDI2IGF0IDEyOjQzLCBCaWp1IDxiaWp1LmRhcy5hdUBnbWFpbC5jb20+IHdyb3RlOg0K
PiA+IEZyb206IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPg0KPiA+
IERvY3VtZW50IHRoZSBkZXZpY2UgdHJlZSBiaW5kaW5ncyBmb3IgdGhlIFJlbmVzYXMgUlovRzNM
IFNvQyBDbG9jaw0KPiA+IFB1bHNlIEdlbmVyYXRvciAoQ1BHKS4gUlovRzNMIENQRyBpcyBzaW1p
bGFyIHRvIFJaL0cyTCBDUEcgYnV0IGhhcyA1DQo+ID4gY2xvY2tzIGNvbXBhcmVkIHRvIDEgY2xv
Y2sgb24gb3RoZXIgU29Dcy4NCj4gPg0KPiA+IEFsc28gZGVmaW5lIFJaL0czTCAoUjlBMDhHMDQ2
KSBDbG9jayBQdWxzZSBHZW5lcmF0b3IgQ29yZSBDbG9ja3MsIGFzDQo+ID4gbGlzdGVkIGluIHNl
Y3Rpb24gNC40LjQuMSAoIkJsb2NrIERpYWdyYW0gb2YgdGhlIENsb2NrIFN5c3RlbSIpLA0KPiA+
IG1vZHVsZSBjbG9jayBvdXRwdXRzLCBhcyBsaXN0ZWQgaW4gc2VjdGlvbiA0LjQuMiAoIkNsb2Nr
IExpc3QgcjEuMDAiKQ0KPiA+IGFuZCBhZGQgUmVzZXQgZGVmaW5pdGlvbnMgcmVmZXJyaW5nIHRv
IHJlZ2lzdGVycyBDUEdfUlNUXyogaW4gU2VjdGlvbg0KPiA+IDQuNC4zDQo+ID4gKCJSZWdpc3Rl
ciIpIG9mIHRoZSBSWi9HM0wgSGFyZHdhcmUgVXNlcidzIE1hbnVhbCAoUmV2LjEuMDAgT2N0LCAy
MDI1KS4NCj4gPg0KPiA+IEFja2VkLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNy
b2NoaXAuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5y
ZW5lc2FzLmNvbT4NCj4gDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL2luY2x1ZGUvZHQt
YmluZGluZ3MvY2xvY2svcjlhMDhnMDQ2LWNwZy5oDQo+IA0KPiBNaXNzaW5nICJyZW5lc2FzLCIg
cHJlZml4Lg0KDQpPb3BzLCBtaXNzZWQgaXQuDQoNCj4gDQo+ID4gQEAgLTAsMCArMSwzNDIgQEAN
Cj4gPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTIt
Q2xhdXNlKQ0KPiA+ICsgKg0KPiA+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjYgUmVuZXNhcyBFbGVj
dHJvbmljcyBDb3JwLg0KPiA+ICsgKi8NCj4gPiArI2lmbmRlZiBfX0RUX0JJTkRJTkdTX0NMT0NL
X1I5QTA4RzA0Nl9DUEdfSF9fDQo+ID4gKyNkZWZpbmUgX19EVF9CSU5ESU5HU19DTE9DS19SOUEw
OEcwNDZfQ1BHX0hfXw0KPiANCj4gTWlzc2luZyBSRU5FU0FTXyBpbmZpeC4NCj4gDQo+IFdpbGwg
Zml4IGFjY29yZGluZ2x5IHdoaWxlIGFwcGx5aW5nLg0KDQpUaGFuayB5b3UgZm9yIHRha2luZyBj
YXJlLg0KDQpDaGVlcnMsDQpCaWp1DQoNCg0K

