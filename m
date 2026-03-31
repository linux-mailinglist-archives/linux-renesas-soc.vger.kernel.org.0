Return-Path: <linux-renesas-soc+bounces-30614-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KhAIA3hly2mAHQYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30614-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 08:11:04 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E35364628
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 08:11:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E57E730107DA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 06:11:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F3FB371D09;
	Tue, 31 Mar 2026 06:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="cNowh795"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010070.outbound.protection.outlook.com [52.101.229.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F081149C7B;
	Tue, 31 Mar 2026 06:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774937461; cv=fail; b=t6Y205XeGsUbbQc5XN8T2gUiRdGTfylXqwaRGQ2ZoAqE9LIXGZzIDeXN+qKooXxupf4Rz3A7WIq6gBxDae4UCTaGyza+7tulRiRNM87otKU10K4bIs6+WcxNt6bDR1mJaf249UW84mROt5ihfVbnpgkyi4qTkzeZMlF2Us/+KiI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774937461; c=relaxed/simple;
	bh=MzN3Esqf3kwTkykJZ9XvpG7kAsC7i8RzxV50Y1F9Xzk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sz+mC2bQfqLnWsOiWJaJlMq5NaXP5RLMrniOiFkZVtmz4KjifgGUbCbEFdvUdzF8AJZe2AfFvcEKA//yo7WSYbS9wr0W+RJw1p7PB4fv4KkcIBISc+cgZCWayLldO2/zRZyfYT673/j3spcOD7mOLT+4R2NCDVio8FzouL1HM58=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=cNowh795; arc=fail smtp.client-ip=52.101.229.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uLpnBn0C9WEJSWo7k53rQ2gkMpks22GqJVSa6rr9juOHAXiWdwkexYUBeImBK7g0VZILZuG3JMm143d/29SyxzKOEa55KPnlII0mn8+J2SuIxUNGYWYu5zOY0ydBm8qaFEDFd2ynaNgksJ/G3nMZFm2N3qjL31GSD4sbam05ZUNH6FiD3RJ7mAapLXfAKQswmyIbTFsULW6/KKMe7SGcrmjlS+92e+hfQbN8E+dG06aoOHzYlBkO0yWNA2Et5A6v8SMGJfEPC3Z6tVI1cpMBJ3psAiUf3aPTRLaJ/3K5pOGVbc0uxP5ETnVI40qgMpSwP1wMhzySGhPsnyL+NWYp5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nw8ochSASFCBH/e/r+4OLZ8elCCCtW7t6ffhD234AZA=;
 b=i56MgejvYUF5dqLpBsTxfeVPcS7Q6r0z2mUuO3neLC3426gXgiu47ltgsyhYTDOmk8xxTDlbMDUmTk9xiwF+avQ/zKOPHjfBkFpDzcP8pPlKYZka/v5MiMsXYi+8UZFGMlQJh6M2QkaeI93POpwGkp98CY3pi/6B+drPk+U5NCjw0njccyEvDp9fe2M/Jev0NR/Am7e+iWmKGvM99C89j49dfpk37W54OVG8WEr0B+S83e8LfHg7Hrwpm7vvoc3vplbigDFEvvNoT49IxikPw1yPXCoVuJvj/zf8i0sz4Th7bGHYkwAS16avv//Efj7L9Vy2/GvfIqFg/5rnJpjrXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nw8ochSASFCBH/e/r+4OLZ8elCCCtW7t6ffhD234AZA=;
 b=cNowh795aZoUfVCLaDjgp44H+rG7fB+XTOXWQwCAktWAwlndJ8Sr0UL3FGQdeR+Tw674KpuApg099EmdouxUfkyDgQi7B0UShYEsZP7246Xj/HdDMN/javmEt7AYgMDCyDUR8Eaol0t3Agw+KMuHKyufCq7MDhkCKe1iFjFhLDw=
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com (2603:1096:405:20d::9)
 by TYRPR01MB14194.jpnprd01.prod.outlook.com (2603:1096:405:21b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 06:10:50 +0000
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::655d:9c47:4499:eb3a]) by TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::655d:9c47:4499:eb3a%5]) with mapi id 15.20.9745.027; Tue, 31 Mar 2026
 06:10:50 +0000
From: Michael Dege <michael.dege@renesas.com>
To: kernel test robot <lkp@intel.com>, Yoshihiro Shimoda
	<yoshihiro.shimoda.uh@renesas.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
CC: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH net-next v2 13/13] net: renesas: rswitch: add vlan aware
 switching
Thread-Topic: [PATCH net-next v2 13/13] net: renesas: rswitch: add vlan aware
 switching
Thread-Index: AQHcvcOxXIAGYdaK3Uq+oriZ6kMYRbXF/AIAgAIxHfA=
Date: Tue, 31 Mar 2026 06:10:49 +0000
Message-ID:
 <TY4PR01MB142828994B921A75367AEC5368253A@TY4PR01MB14282.jpnprd01.prod.outlook.com>
References: <20260327-rswitch_add_vlans-v2-13-d7f4358ca57a@renesas.com>
 <202603300436.ryIgiB0z-lkp@intel.com>
In-Reply-To: <202603300436.ryIgiB0z-lkp@intel.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY4PR01MB14282:EE_|TYRPR01MB14194:EE_
x-ms-office365-filtering-correlation-id: 0bad9ac1-6cf4-481f-691e-08de8eec41c6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|376014|366016|13003099007|38070700021|18092099006|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info:
 7VpU5nTEw8WP0Gg6x5RGKMmjvU289HHx4PROwv2CZvjlNQ83xiWALXJZZgfcOCEjms7pUP7eID/mSIXLFh1WyjttliY7fqc9NW+ZeeMYIpSNu51HuR7OV8Nwi+0l7QAhe8WBFMKJ06/apPycYRnA+OkG7m4te9DwWANAl2Hzc7qCZtX2RQKgzeh6kUXbva82J+kE74K+n2PbwezoAHbvOgYiu4xY/HxTLBFiPmVeI4goZuXX6mkXYBwDFE5z2Hi+FlKFTI26qwj5CoORNQe0uWPwRIGLSUQB4/Z8lCIvqzC9qtpoRuFftdJt8QCQo36wf+qQuJZOJ8wKBYYGAdOaCkOPa8G1IfGTVft/Q0cPDNYvLfuBamrQMwxTIift4Fu4ZK722tBfNLJGv23j6a7ctnTbIfRUhEiaqm4Y35OgM4rNpL9btxWriHPXJG20wueG1DoCfhEcoNTm8RrDFsVJIbPaL5z4NCSM3jPQ3KEk0r9Rr+NzPa/HRq15QoU0kTe3HLEKelDhplSjKrVIfWJ1rFo0o8OjbkNyn34E1aYbq8C5CzNNyJtRNJx2nxCbA7K0wmVm/soA6Aecy19qVy73WtDX/YazTi31ImDhs7+50tZAqZxxjR+zz+CDB9nxO7FJuPC7D7B5YMkCMhi3yj0thunTxGnBiYfiylpcSeFu/R6UonP0VVL6N4VMk/fmT9N1/fvPnYmU/UOsRzV8SyVTyHc1g7YGIlGnIjWnRsjRG4N/IHKBTGLFpfvBY6UuTzVs
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY4PR01MB14282.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(13003099007)(38070700021)(18092099006)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?9fLWvwS2Y+QTRX0zsGFMOEN9fJzysjH3IYwbQhxV3bBh5/f5qnm2BLJ8sK0k?=
 =?us-ascii?Q?F1A5WATBTLheBCtWZf3gHzsK6ETT7k1OJJb2QtwW2LH7Phpmxe7AT9RfgDqq?=
 =?us-ascii?Q?/+x3ER5kEEOgRnS43vO6O0kJC8PZscAvRy+l3nbACyyBa2bnKuyeADSo4kL2?=
 =?us-ascii?Q?CzPX5fYbbRXZcsvLePoEzIcwW3/d7QcglEDzsjwVgEnOCA4tOR7v5Ju3fgh4?=
 =?us-ascii?Q?5iJqSjWkGFkqpNMe5HRN1t6dlmUIEzWAb/wxr2u+rPv0u/LdO8ezBufXN4WS?=
 =?us-ascii?Q?nZ581v9vo7VUGANyHeRTLe3IZWDNgE+ot/6hvIqz3zRjXGBYu6DeLy0MvTqF?=
 =?us-ascii?Q?putgidwjjBVApn/6SqiUHLT322WWdRkYvQ8pclyc/as+LTGLU38Ku09AysPg?=
 =?us-ascii?Q?7n1CTf58HsnxqPYCStnTYFNCiNFLaQBnuRgTO0YvruCOapmfbBKeZBw3qk4E?=
 =?us-ascii?Q?s89zGBqzhacVfAuvNd7/hC3Bji7gkY42UKn5GxfpByYa1l7s19sMJ3FNdwCT?=
 =?us-ascii?Q?ngTLngoIEJOguLVXeDBvuw7awmjPNz6JEz7vGr51FJj8q50IaF9TuDlJwusm?=
 =?us-ascii?Q?nAnb8PUBxSfznqL7dcDDAPCZe9EzlzUoG5Sb9RrC6l/jnQ6KkMe/mxSIw9Sa?=
 =?us-ascii?Q?ppacB56eHWNeJsIzGENapKXbubpN+pY0bap+Y6EwX7kl83d5yKhkszkBbKd+?=
 =?us-ascii?Q?MFNi31Hile0SQ5fcSPipsS9HeHTk/zrB9mQGZuT5eO1oSEbJv25jbaTZiQXM?=
 =?us-ascii?Q?2Yxv2ZVeR3BKsbJANO8U3jLzdu3l85akohYbCx/anJAdENuMcQ+oJsxLYp/u?=
 =?us-ascii?Q?/adJDUwpbkOyvahgU9RAHivR/n5BleVyK6P6upzq/UcrUjJMKNAzTRnVmYmG?=
 =?us-ascii?Q?pdamY/Sr0//9nzXlvaKjyefgXx9PBZjgNrfQQIS5alxZUAh29SC14nAUnnwN?=
 =?us-ascii?Q?/DGCG94jo55787+NDzE8/q9C73BfBvjegR2LIEQxMAQrSXOwgjpulUUpQCN7?=
 =?us-ascii?Q?RpzGCR4ncPWcopFs1fEJR1lnbDu8AeTrDVQYUMci2nYTJKta5utjkk1d1VOj?=
 =?us-ascii?Q?e2pehx9u6OX57puu+mQzDe17wL0uFrrUOhgF0PPWugCP+RA2NoUuT0hQP1es?=
 =?us-ascii?Q?lfmC484VJkLTIkiM6oOqHG8X+wsFdTk8tMOPu5P/OJ28ED1wjZpdfGNKuiil?=
 =?us-ascii?Q?Pw/wSKhj4byolWKonSyMszC0uHitNkiE6x0uVNmWIUsGKr1cNcOQGf/ci699?=
 =?us-ascii?Q?ATiPA9gsADzZiSJ89m0njsuLpVGfYJ2eujoSGe70+eKSkzwjr7qbS/FcCuYh?=
 =?us-ascii?Q?Z5DI2kBoDxVLzblFFW7maPZQOmX6o5sR89XwEVYnmNcPxslI8qRgvwDl/FX6?=
 =?us-ascii?Q?Arm9lQFDFnQZtIqb+98Yu9ioKUvXj6Eg0jrWsiIaQmbq1lxmaLI0xRHH4NMA?=
 =?us-ascii?Q?HoHPBF26hDT4RmgpxHCvXLhz0vgEfqVpnzZM96q2Fbhl4EqHjxbKanyAm4s6?=
 =?us-ascii?Q?mzQU3CjtyT7p68T2CrMG4N/RVMzRyJ7zcOru7oRg/9qembt38mbuLpKJ79hz?=
 =?us-ascii?Q?bIR+nZYWuCjhdWFuHQ57g4+zNjkITMVvl1Q3oLQvnE8rIVGhDNhBgYn4Ihg3?=
 =?us-ascii?Q?TBCfBCWjKS7buEg81ywEJKWyNPkIZESAGLmoeFHq2/2wbz9o2Ns3rtmTwzFD?=
 =?us-ascii?Q?xQXb78HNXu2NQuOumyAo7JdXk8Nz4lcziDI/LcDCy6baH8ncaAD6PTUiFZe7?=
 =?us-ascii?Q?dodSjCZswQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY4PR01MB14282.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bad9ac1-6cf4-481f-691e-08de8eec41c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2026 06:10:49.9493
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2mjzS1vjSJ9y4JjNdX8VV+iAwQhUbok/TNXmcj1VBOh+Uk3va+MMcqNd4fzbGkz4qrchISfylIGeOWfcYQiD1+0oBX4L+f8jSeC/BsN2soo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB14194
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30614-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[renesas.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.dege@renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,TY4PR01MB14282.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Queue-Id: 47E35364628
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

Who can kindly help me with this?

> -----Original Message-----
> From: kernel test robot <lkp@intel.com>
> Sent: Sunday, March 29, 2026 10:37 PM
> To: Michael Dege <michael.dege@renesas.com>; Yoshihiro Shimoda <yoshihiro=
.shimoda.uh@renesas.com>;
> Andrew Lunn <andrew+netdev@lunn.ch>; David S. Miller <davem@davemloft.net=
>; Eric Dumazet
> <edumazet@google.com>; Jakub Kicinski <kuba@kernel.org>; Paolo Abeni <pab=
eni@redhat.com>
> Cc: oe-kbuild-all@lists.linux.dev; netdev@vger.kernel.org; linux-renesas-=
soc@vger.kernel.org; linux-
> kernel@vger.kernel.org; Michael Dege <michael.dege@renesas.com>
> Subject: Re: [PATCH net-next v2 13/13] net: renesas: rswitch: add vlan aw=
are switching
>
> Hi Michael,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on 1f318b96cc84d7c2ab792fcc0bfd42a7ca890681]
>
> url:    https://github.com/intel-lab-
> lkp%2Flinux%2Fcommits%2FMichael-Dege%2Fnet-renesas-rswitch-improve-port-c=
hange-mode-
> functions%2F20260329-
> 154812&data=3D05%7C02%7Cmichael.dege%40renesas.com%7C27cab84d6f7640e15b4f=
08de8dd3108a%7C53d82571da1947e4
> 9cb4625a166a4a2a%7C0%7C0%7C639104134822998103%7CUnknown%7CTWFpbGZsb3d8eyJ=
FbXB0eU1hcGkiOnRydWUsIlYiOiIw
> LjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C=
&sdata=3DuP5U8NPFi2wo7VJDRGZ%2B
> ubwH50bZDvNuapBP0t76lL0%3D&reserved=3D0
> base:   1f318b96cc84d7c2ab792fcc0bfd42a7ca890681
> patch link:
> https://lore.kernel.org/r/20260327-
> rswitch_add_vlans-v2-13-
> d7f4358ca57a%2540renesas.com&data=3D05%7C02%7Cmichael.dege%40renesas.com%=
7C27cab84d6f7640e15b4f08de8dd31
> 08a%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C639104134823016624%7CUnk=
nown%7CTWFpbGZsb3d8eyJFbXB0eU
> 1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjo=
yfQ%3D%3D%7C0%7C%7C%7C&sdata=3D
> 2QTz%2BFk8tDeHuE2Ac5ddl8tJ2mFSrm9l9mGnnLDsdW4%3D&reserved=3D0
> patch subject: [PATCH net-next v2 13/13] net: renesas: rswitch: add vlan =
aware switching
> config: arm64-defconfig
> (https://download.01.org/0day-
> ci%2Farchive%2F20260330%2F202603300436.ryIgiB0z-
> lkp%40intel.com%2Fconfig&data=3D05%7C02%7Cmichael.dege%40renesas.com%7C27=
cab84d6f7640e15b4f08de8dd3108a%
> 7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C639104134823028947%7CUnknown=
%7CTWFpbGZsb3d8eyJFbXB0eU1hcG
> kiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%=
3D%3D%7C0%7C%7C%7C&sdata=3Dvhwu
> KaGAF4bhfSTb1VhDnII4SXsKbZ0zEPRt8ma49aM%3D&reserved=3D0)
> compiler: aarch64-linux-gcc (GCC) 15.2.0 reproduce (this is a W=3D1 build=
):
> (https://download.01.org/0day-
> ci%2Farchive%2F20260330%2F202603300436.ryIgiB0z-
> lkp%40intel.com%2Freproduce&data=3D05%7C02%7Cmichael.dege%40renesas.com%7=
C27cab84d6f7640e15b4f08de8dd310
> 8a%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C639104134823040554%7CUnkn=
own%7CTWFpbGZsb3d8eyJFbXB0eU1
> hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoy=
fQ%3D%3D%7C0%7C%7C%7C&sdata=3DY
> TddyGPjtxfccjUPlLwizqOqUHOuiRxPxMqoNaHWW%2Bk%3D&reserved=3D0)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of the same
> patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes:
> | https://lore/
> | .kernel.org%2Foe-kbuild-all%2F202603300436.ryIgiB0z-lkp%40intel.com%2F
> | &data=3D05%7C02%7Cmichael.dege%40renesas.com%7C27cab84d6f7640e15b4f08de=
8
> | dd3108a%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C63910413482305219
> | 2%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIs
> | IlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D4=
B
> | 1hVOdPuyjze1HZCUi2v3gamNPgyeYcmx5NNzrDFjw%3D&reserved=3D0
>
> All errors (new ones prefixed by >>):
>
>    aarch64-linux-ld: Unexpected GOT/PLT entries detected!
>    aarch64-linux-ld: Unexpected run-time procedure linkages detected!
>    aarch64-linux-ld: drivers/net/ethernet/renesas/rswitch_l2.o: in functi=
on
> `rswitch_port_obj_do_add_gwca':
> >> drivers/net/ethernet/renesas/rswitch_l2.c:443:(.text+0x11e0): undefine=
d reference to
> `br_vlan_enabled'
>    aarch64-linux-ld: drivers/net/ethernet/renesas/rswitch_l2.o: in functi=
on `rswitch_port_obj_do_add':
>    drivers/net/ethernet/renesas/rswitch_l2.c:412:(.text+0x135c): undefine=
d reference to
> `br_vlan_enabled'
> >> aarch64-linux-ld: drivers/net/ethernet/renesas/rswitch_l2.c:423:(.text=
+0x13bc): undefined reference
> to `br_vlan_enabled'
>
>
> vim +443 drivers/net/ethernet/renesas/rswitch_l2.c
>
>    402
>    403        static int rswitch_port_obj_do_add(struct net_device *ndev,
>    404                                           struct switchdev_obj_por=
t_vlan *p_vlan)
>    405        {
>    406                struct rswitch_device *rdev =3D netdev_priv(ndev);
>    407                struct rswitch_private *priv =3D rdev->priv;
>    408                struct rswitch_etha *etha =3D rdev->etha;
>    409                int err;
>    410
>    411                /* Set Rswitch VLAN mode */
>    412                iowrite32(br_vlan_enabled(rdev->brdev) ? FIELD_PREP=
(FWGC_SVM, C_TAG) : 0,
>    413                          priv->addr + FWGC);
>    414
>    415                err =3D rswitch_write_vlan_table(priv, p_vlan->vid,=
 etha->index);
>    416                if (err < 0)
>    417                        return err;
>    418
>    419                /* If the default vlan for this port has been set, =
don't overwrite it. */
>    420                if (ioread32(etha->addr + EAVCC))
>    421                        return NOTIFY_DONE;
>    422
>  > 423                if (br_vlan_enabled(rdev->brdev))
>    424                        rswitch_modify(priv->addr, FWPC0(etha->inde=
x), 0, FWPC0_VLANSA |
> FWPC0_VLANRU);
>    425
>    426                rswitch_modify(priv->addr, FWPC2(AGENT_INDEX_GWCA),
>    427                               FIELD_PREP(FWPC2_LTWFW, BIT(etha->in=
dex)),
>    428                               0);
>    429
>    430                return rswitch_port_set_vlan_tag(etha, p_vlan, fals=
e);
>    431        }
>    432
>    433        static int rswitch_port_obj_do_add_gwca(struct net_device *=
ndev,
>    434                                                struct rswitch_priv=
ate *priv,
>    435                                                struct switchdev_ob=
j_port_vlan *p_vlan)
>    436        {
>    437                int err;
>    438
>    439                if (!(p_vlan->flags & BRIDGE_VLAN_INFO_BRENTRY))
>    440                        return NOTIFY_DONE;
>    441
>    442                /* Set Rswitch VLAN mode */
>  > 443                iowrite32(br_vlan_enabled(ndev) ? FIELD_PREP(FWGC_S=
VM, C_TAG) : 0, priv->addr +
> FWGC);
>    444
>    445                err =3D rswitch_write_vlan_table(priv, p_vlan->vid,=
 AGENT_INDEX_GWCA);
>    446                if (err < 0)
>    447                        return err;
>    448
>    449                /* If the default vlan for this port has been set, =
don't overwrite it. */
>    450                if (ioread32(priv->addr + GWVCC))
>    451                        return NOTIFY_DONE;
>    452
>    453                return rswitch_gwca_set_vlan_tag(priv, p_vlan, fals=
e);
>    454        }
>    455
>

The function br_vlan_enabled() is exported from br_vlan.c and the header fi=
le is if_bridge.h. Can anyone
give me a hint what might be wrong?

Thank you and best regards,

Michael

> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-
> tests%2Fwiki&data=3D05%7C02%7Cmichael.dege%40renesas.com%7C27cab84d6f7640=
e15b4f08de8dd3108a%7C53d82571da
> 1947e49cb4625a166a4a2a%7C0%7C0%7C639104134823063970%7CUnknown%7CTWFpbGZsb=
3d8eyJFbXB0eU1hcGkiOnRydWUsIl
> YiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C=
%7C%7C&sdata=3DwG2VKo2Ln60Ld4KV
> 8wHTcxRyskg0hzu0dZSVMg4v73g%3D&reserved=3D0

