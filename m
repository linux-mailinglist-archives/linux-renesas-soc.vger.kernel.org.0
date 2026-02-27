Return-Path: <linux-renesas-soc+bounces-28521-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4JCUMUp7oWmdtgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28521-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 12:08:58 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 206F71B65D5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 12:08:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C427D301AF7D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 11:08:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EE793ED127;
	Fri, 27 Feb 2026 11:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="gQ5FZBrD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011029.outbound.protection.outlook.com [52.101.125.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E451885A5;
	Fri, 27 Feb 2026 11:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772190536; cv=fail; b=dZN3YLvBeX6QP+oZU0jMIup/0OSlSCW0zpZohqR0PWpt4L3hPj9H8f6RwfmaClvnUgHqecrwNgpH5l80Q1AshNyzgA+VmXk1+vt67JaRFQVPZK92+CQ2FlvfbD1dfpeLOpmU14eJWPkJ/JUbjcmB9aScAlhw0Kpk5b1J7sxg5pw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772190536; c=relaxed/simple;
	bh=bpv36uN0OxDj7Y1oPoFyKeQIb1PKBzOGRYrQBqjsD9Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bFT3N+OeP4Ewl4822ySj6FFmNtgZDNhcSunTNwt/df+t8ZXd+O/rj0LlKxf58qAGMylRI6+gWmpMTXtzo9nUOzhg5Q1dp57JB/YvBExrRonsthQVJnz8BPnUUigh2cX4SBmOehX3aZVnjgSIREgGuXuq8IGjHs/OuzO48keYGE0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=gQ5FZBrD; arc=fail smtp.client-ip=52.101.125.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y3Krn9D+z7Q5aR52NZ+sicQiqft2Rh7tvnyd0CsB0cwC1QXNtumKeNsJaTT2R/qdPK6197IeLeG2fOPYJrwWf+6cxM2/8WAxf+NpbyKgckm/D1CSiRSsFV6sv0UdxR7DoLN2dAFV84WjtA5/6srZk0JewK5+MmM7/avx84i33BpkRH9KrmNefGFFfNZ1zbZiykVoQg7LOMfGQ+bqWcaEfvWo/DX1yAIk4JqtqwoYv6dA617yc6VgNQ4J6P5Rw2pi0SoLjQpA9XA2BmFyj5Yb7528icIknSK2N2DxEbMnAVOQ+W8Xk8NyBKsTQTpyq5VmSgHPpIu7Ox/+hq043D1wlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bpv36uN0OxDj7Y1oPoFyKeQIb1PKBzOGRYrQBqjsD9Y=;
 b=nTeNYQLbDy81DRhuEKKe/wS5PZjD4Zh0pJcC0I+0z/0cIng/PxzXkdOuLJVoCx6EaGOCmXYA2790KD/hk8gTf8UOIAWNYbX5tyRjzm6rP0LpEY1iETcRZF8j8LUrPkfTQAQcLXIV8i7ErCOqmPHR3uch85PhYcEB0h1SGAYbXN6hORePbzKaxqfQHZAzt5Va0dhUdtmxbWrhfBN2ezHHvWljiVXFVcxj/RZh1jWBUmbZU/Fz+LKYMLTHtcjyoHRK8X5AKC8lBdIPX8QNjXtx4Xu/TJ+bQKnoluwXMscl+Ca+gV9cDFv+Gh2Stgjxv9mWPbY4eb4QkUH5aafIumGcaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bpv36uN0OxDj7Y1oPoFyKeQIb1PKBzOGRYrQBqjsD9Y=;
 b=gQ5FZBrD7Ny8f4kM7H4/6HmJUyihQoPCFIbk7MJU1THD2Qdq8L/7InV9W91KEoVhh8dRtrACLKdOLsDEyAK42Q2F7B9g3xiF9syRjYO5ztyHQD0ustwLSw8/RDIZ8dj9eIaATNgnPMwhhHqc5BaAGl233/QuIVQ160sgVW+AenI=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by OS9PR01MB17829.jpnprd01.prod.outlook.com (2603:1096:604:448::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Fri, 27 Feb
 2026 11:08:52 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%4]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 11:08:52 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Claudiu.Beznea <claudiu.beznea@tuxon.dev>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"mani@kernel.org" <mani@kernel.org>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>, "bhelgaas@google.com"
	<bhelgaas@google.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	magnus.damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"john.madieu@gmail.com" <john.madieu@gmail.com>
Subject: RE: [PATCH v6 12/16] PCI: rzg3s-host: Add PCIe Gen3 (8.0 GT/s) link
 speed support
Thread-Topic: [PATCH v6 12/16] PCI: rzg3s-host: Add PCIe Gen3 (8.0 GT/s) link
 speed support
Thread-Index: AQHcofBLqqTsGMBNZEeDk9SFn4BG9bWU4RyAgAGNzCA=
Date: Fri, 27 Feb 2026 11:08:52 +0000
Message-ID:
 <TY6PR01MB17377BD6AB0D8D3E60E605275FF73A@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20260219223542.6364-1-john.madieu.xa@bp.renesas.com>
 <20260219223542.6364-13-john.madieu.xa@bp.renesas.com>
 <c6230f66-3d0e-4cdd-b870-cbcdb93037fa@tuxon.dev>
In-Reply-To: <c6230f66-3d0e-4cdd-b870-cbcdb93037fa@tuxon.dev>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY6PR01MB17377:EE_|OS9PR01MB17829:EE_
x-ms-office365-filtering-correlation-id: 4a0752bc-82d4-4355-116b-08de75f09763
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700021;
x-microsoft-antispam-message-info:
 OuTmWBSDNG2fahT02IMbHokwDZdMX7u9BjNu24FWy06SFbhWafSrz3uEFZGuOpqyqu06GUSWAJrZlvaOIP401wKdSDl04hgKQ1ww0Q1hIMe1giCxBS1SntCoGRkxC4+joMaB1gKHsnI6BoSIa3GJ6oJb3gqtVPiQdFZMmPYvK/3su763TNSp10m6baNy3z1K0WroD95Sod18mIFTGAjVi2/7SsXuQnx7nPigyfH7oJxOd2Yf708RiLDlmhAR200ZTNkB0Z+LoNoMfWCN8r4QpIDDzdlmMi4ugAe4rKC3M2PWWjGg7UQJFrGGzQ7w/NIp4d8alPnfxgHwqinGhj2K0zjF3R6b9Kesr9/YvwnoZF4pI+KVm6RHpitC/cnVcSiJPPg/rftJlUKJQYn9y8L6qD64HcOSZ7lweEvVVHJuVrXVpW2ipI32zsfIh/kgzGelf/u2ac+iw0OTjgdrrxH801O3If5g9cYLPmpDLDV3blN/Awpsz8KHUuIPW6THoOG8/uN0kGqxyd0VtLSUXk929ZGpDK5WRpZxdAi99MH/21H/MPaonrqAhF/tPc7YtAlFWLRAxQZQUMQO1zrWbSZ6pyVYRAAkMTE/y+EnGtJJ5UDmnBVEgIA6KKDzg0c2dXSNOt2uefIUhmCiSDxvwtB5jI0lgdk1IQ41Xrj+8l5G7SkVJHDuYu1TcaY0fn64mSR+aVP0BjPBoYiSGLcnnBlxJLpFN9K+fAdtxsNpj04G5r+xQnf7D+tPu3B3OPQvRe5mNaFT2x3ISmW56QDYHUACNIFZ85XCR2DtR8kk+l5pY4o=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZEhacEw5ZkZZVFdnMlNtaVJNcmwwZkthdjM1MjM3YlpPQk5tenRmeFZNMXVI?=
 =?utf-8?B?NUVDSzNMczRFeDlCUWZHZ08xaXNJc29BdU5CYTFNN1pSZHJMUm5kZnFlOVdF?=
 =?utf-8?B?cGZYcFpCMlV4NVlQYkpOOEVEejdEU0VGZmMzamFwK2FRWGlkV2xaRkxSMmtE?=
 =?utf-8?B?VUROaUpoblNBS0tEbElnYXQ4YzF5L0toQWpkL21HeEVDNnJhZll3aHhUMDZF?=
 =?utf-8?B?bjFydFRFVEUramtvSXp4d3ZLS1YzMEJBOWZzTGRQMmJ4VHdiS2hqTnpNWEky?=
 =?utf-8?B?SWVFNG91dVduSXJYNy9Vb0Q1cXpheUQwcFNRRldpa1o0MlduOUxIQjV5Uys3?=
 =?utf-8?B?YWdsSy9scG1ibm1mRHE5MlBDYXRTbHFjeHRacFRwSTBFQlRnQU40c2pEaW9C?=
 =?utf-8?B?RkgzL1pXcXJEOHY5SVgwd3NFUlZUZTV5bkJ1aUpaM2JHVHlSQ3BEdDREWmxp?=
 =?utf-8?B?cXkxY1pjdmdwTDlKQ1JMZWZrcTRpVndoZmMwa2JHck51YWwwTHhLRGNYa1Qy?=
 =?utf-8?B?dGsvbWRGVGNTZ21UNkYxY2tQa2pvaEExeGxNaW1VTWFMUkdybFdFREM0TXhL?=
 =?utf-8?B?aldQMndPbU90d3h0UVd3VENVTGQ1L0d3NGsrdUYxZkNlUVhCbUhGcHhLa0o0?=
 =?utf-8?B?MlNndDNOd0daTWdhQnpVZm8rdDc2SzhiZHl0YklDZFVab2YrQjlSTzdSdzhB?=
 =?utf-8?B?dnF3Zld6V1ZKaGYwUFJDSHZwV1duaUIrOVZieDcvMmlYQXByRW45bjg2Rlg5?=
 =?utf-8?B?TWRmOXhwOWxYaG15WVppNFJkL1YyQnZHUlVoNWJGRzl5c2hzTm9NdTFiTzVa?=
 =?utf-8?B?NzVzOXUzQlJJRldsWHBZNUtSY0NYN0FxTTM4cFVMeTlSdU1CU3RzRWpPLzdo?=
 =?utf-8?B?NWdPcGNGVzJaVGlHSEc4SExIandRV2F2TmZXNVRNQ093TXlEYUpJYm5hSjda?=
 =?utf-8?B?VXFZUUZrZmtoWFRsQlZYT2VVV2NjRTFjb21aS0xmclErcHdiSkdmUnF1SEVt?=
 =?utf-8?B?ZDhGcU12bUh2T01NblNTMXNHSWl6ZE1nQ1l0ZjJsQW5PMUdDWXhxVElTTE9i?=
 =?utf-8?B?QjNPQjVBQ1VRejJmNlZtdDZBdWgrWDlkczIraEN0VHZUTWlxbGp1SU9WUWF5?=
 =?utf-8?B?MzBTNjhJMUNKQjI1WnExTlVTUEtOMFRqMHFzS1FEaW83UmEyZXpTdVZVVFVo?=
 =?utf-8?B?dUhmYWNCc1k1NmZReWg4L2hTK041SVp0bHNUS0Rxa2FHZzNrY1kycXpNYUM4?=
 =?utf-8?B?NzVkRzFHRks1UlZvRWo2TTRmRGF3ZDlVbUFNWHMvc0JURVl6STN2cDZEZW9q?=
 =?utf-8?B?MGVGaXo3VzVwSlYwZU4zeUNGU21KWGt0bXlSNDhBL0JzRENWZVd1VGFISGVp?=
 =?utf-8?B?YVFDYU1rcmVrWVQxaS9MU3ZnekMydVdma2lqRVN6dGhIZi9oeUFya0RyVmdJ?=
 =?utf-8?B?aEpFZzZ6VXZiOVRYbGRaMmZ3amNqcm9nZTZ0V2VKTjdIWlVWOGtkcUpwbzBi?=
 =?utf-8?B?R1V2b2FXK0d4VnNlcVg3Q1BnaEkyNEtFSFYyQUZYWE1lS0M4OUVMNFMzNTR5?=
 =?utf-8?B?WUUwaEJ0OFdMYjFGUmlKRzh5QVoxb1RxUCtLUFRDRi9ra0tjVlhWR00wOFFl?=
 =?utf-8?B?UFZsRE4yQXV4SDl5cm1VT0dONGkxQmt0UU5IMDdET2FhZWFrZ0xuUnJ0T25P?=
 =?utf-8?B?aC9pSjE5MW5MOEU3TDlMVG5VWVd1Z0FsZ0pGNFdFQVR6K3lRTlRHd09DMGkr?=
 =?utf-8?B?MXJ3Skg0TVZ2UG15VVEyZml2NlFCQjl3TDFwSmNscGRIbTMrdURWVjBTbVg0?=
 =?utf-8?B?UmNubTZRR3plRnNkU2RpQUNZUDZ0akFrTnFsQlB1VVlYaXpDTFVKazVEdVlW?=
 =?utf-8?B?bVpPYlJCUnU0ekIvVElYRWtxMEk1dVovd093ZE1xZGpMV0FwTWVacG1IRml0?=
 =?utf-8?B?dGd4K3AyNWdSMEh2bEd1RUNWR2ZiRlRVa01BOWNoYkZhbzFMSzh3Q3hjVi9j?=
 =?utf-8?B?VHB4Y0JwcllDTnk0ZXdjem9SMS9jMUd3ZVlWT3VZV3FPaUNFTml1bWhtUW1j?=
 =?utf-8?B?Tno3eExVbDh4R3dzaVhXaUxTU3VrMjRaQXZJczRBVGx3MFhaN09BMDJlU0Vr?=
 =?utf-8?B?enZYTmp0OUxUMExydFprOEdac0VuUjEyTktuUGlUTGowWldJczJrem9pSVly?=
 =?utf-8?B?TVNtSjBHUXM0ZmNNVTVuUEpwM0YyVDdTdktWeTJXM2dzV21TTmFDYWZDa0lV?=
 =?utf-8?B?N0piRklrUkw5RVgyUkc5Z3ZxaithNFE1T0VVSVVzRy96SHRvOUNnR1VwNkhu?=
 =?utf-8?B?RUtiZmd3K0N3YlUzYzVMK2Ezcy9rSnprZzR4Yy9hUzY4K1JuRmVheTZLamM4?=
 =?utf-8?Q?Zom9sWAxjiYOjR6U=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a0752bc-82d4-4355-116b-08de75f09763
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2026 11:08:52.5503
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Nmgw2+sH5TGI80a4cym5I0+mMSRiisxSCV4bevA95xA90hKI5X1e78dmm7p3TvSwc0EGqQfCawkphw3y8URmDyyG4fWNDBFB1rD7oOOwwRY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB17829
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28521-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,bp.renesas.com,vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-0.995];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 206F71B65D5
X-Rspamd-Action: no action

SGkgQ2xhdWRpdSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBDbGF1
ZGl1IEJlem5lYSA8Y2xhdWRpdS5iZXpuZWFAdHV4b24uZGV2Pg0KPiBTZW50OiBUaHVyc2RheSwg
RmVicnVhcnkgMjYsIDIwMjYgMTI6MjUgUE0NCj4gVG86IEpvaG4gTWFkaWV1IDxqb2huLm1hZGll
dS54YUBicC5yZW5lc2FzLmNvbT47IENsYXVkaXUgQmV6bmVhDQo+IDxjbGF1ZGl1LmJlem5lYS51
akBicC5yZW5lc2FzLmNvbT47IGxwaWVyYWxpc2lAa2VybmVsLm9yZzsNCj4ga3dpbGN6eW5za2lA
a2VybmVsLm9yZzsgbWFuaUBrZXJuZWwub3JnOyBnZWVydCtyZW5lc2FzQGdsaWRlci5iZTsNCj4g
a3J6aytkdEBrZXJuZWwub3JnDQo+IENjOiByb2JoQGtlcm5lbC5vcmc7IGJoZWxnYWFzQGdvb2ds
ZS5jb207IGNvbm9yK2R0QGtlcm5lbC5vcmc7DQo+IG1hZ251cy5kYW1tIDxtYWdudXMuZGFtbUBn
bWFpbC5jb20+OyBCaWp1IERhcw0KPiA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+OyBsaW51
eC1wY2lAdmdlci5rZXJuZWwub3JnOyBsaW51eC1yZW5lc2FzLQ0KPiBzb2NAdmdlci5rZXJuZWwu
b3JnOyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgbGludXgtDQo+IGNsa0B2Z2VyLmtlcm5l
bC5vcmc7IGpvaG4ubWFkaWV1QGdtYWlsLmNvbQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY2IDEy
LzE2XSBQQ0k6IHJ6ZzNzLWhvc3Q6IEFkZCBQQ0llIEdlbjMgKDguMCBHVC9zKQ0KPiBsaW5rIHNw
ZWVkIHN1cHBvcnQNCj4gDQo+IEhpLCBKb2huLA0KPiANCj4gT24gMi8yMC8yNiAwMDozNSwgSm9o
biBNYWRpZXUgd3JvdGU6DQo+ID4gRXh0ZW5kIHRoZSBsaW5rIHNwZWVkIGNvbmZpZ3VyYXRpb24g
dG8gc3VwcG9ydCBHZW4zICg4LjAgR1QvcykgaW4NCj4gPiBhZGRpdGlvbiB0byBHZW4yICg1LjAg
R1QvcykuIFRoaXMgaXMgcmVxdWlyZWQgZm9yIFJaL0czRSBQQ0llIGhvc3QNCj4gPiBzdXBwb3J0
LCB3aGljaCBpcw0KPiA+IEdlbjMgY2FwYWJsZS4NCj4gPg0KPiA+IEluc3RlYWQgb2YgcmVseWlu
ZyBvbiBEVCBtYXgtbGluay1zcGVlZCBmb3IgY29uZmlndXJhdGlvbiwgcmVhZCB0aGUNCj4gPiBo
YXJkd2FyZQ0KPiANCj4gY2hlY2twYXRjaCB3YXJuaW5nIG9uIHRoaXMgbGluZToNCj4gDQo+IFdB
Uk5JTkc6IFByZWZlciBhIG1heGltdW0gNzUgY2hhcnMgcGVyIGxpbmUgKHBvc3NpYmxlIHVud3Jh
cHBlZCBjb21taXQNCj4gZGVzY3JpcHRpb24/KQ0KPiAjMTA6DQo+IEluc3RlYWQgb2YgcmVseWlu
ZyBvbiBEVCBtYXgtbGluay1zcGVlZCBmb3IgY29uZmlndXJhdGlvbiwgcmVhZCB0aGUNCj4gaGFy
ZHdhcmUNCj4gDQo+IENvdWxkIHlvdSBwbGVhc2UgYWRqdXN0IGl0Pw0KPiANCg0KV2lsbCBiZSBk
b25lIGluIHY3Lg0KDQpSZWdhcmRzLA0KSm9obg0KDQo+IFRoYW5rIHlvdSwNCj4gQ2xhdWRpdQ0K

