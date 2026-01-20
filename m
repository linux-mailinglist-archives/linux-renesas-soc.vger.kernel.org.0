Return-Path: <linux-renesas-soc+bounces-27135-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJTpIcHfb2n8RwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27135-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 21:04:17 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6584AF96
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 21:04:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id EF0F4865E54
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 17:25:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12E9B41B36C;
	Tue, 20 Jan 2026 17:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Wi16tpc+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010023.outbound.protection.outlook.com [52.101.228.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930823E9F83;
	Tue, 20 Jan 2026 17:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768929871; cv=fail; b=m+UG8S2rtbqZUkkB7l9Us3BS+GFiSJCfOfpswvCAhVEE6Z+idBGS0GHyKrCoODFwNVFfHOsMUM3KDh+mi3hysP1xuFBdVSUYCabIUBfNPGLuCKPGohS+/UlQWa68nw73sXI4I7L1HCmwO3UothaWHgYxKMItExjZhenlX31rWH4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768929871; c=relaxed/simple;
	bh=N9vaDJc3y7ixd2LZFb06mjySXbN0IcBIetFbxlr21V8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ufM5o9eqXB8GEX6OJonyBsLIuzOcy2ZD9LStam4kelzLlNO2V4QMBGEQMej7J8LS7iMz9JM/H5IPxbt7UvKdoj1ayGLvfxQFQ9NzJhnfIuivJ95VKsBHdDGrcMHvdBmleqke5qKP03IjGDl+gJ+ZE8Ila1Jf1qQrlNcb0pTyNGo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Wi16tpc+; arc=fail smtp.client-ip=52.101.228.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ew0jzs15Y+jy2rYEh6hMZjYBa/5XEwJ4cDxB2yDhe0xLKgMjgyqMIG04eHNSNQuBxveZ2QwDacLPCQQVOYh4DBl6/gIXepKgrMHD/FgJm2km3S/ivZTAO2lXuESKB+kJlRF8m7uqoT8nIE6/yT2QYGEKf/Loph9c7j3CzOJnwx3Q8X5a7jc+DQJfosTNvgceAprqJ6utspWmjh7ob8JauR26ha3jYNdMcHWudxHdbwD8SmcSDBp96pZWYcBeCVng5NsEkGt7gp1N7WY4sW0IEgQGkohjQe8Kpzutyji6JszOxI0cOnPGFVOzGRHk91T7IyI8LPbg+9VCVveCIZL9Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kdSFnQvEx8DF8kyObaavjiZ3bEM5Q9BSMCy42Jiqo6Q=;
 b=uM25dtbjbMDruxq7Mn325Lcp0T34z+zyO85+fB+MOlzchOW/0ZkBZ6w4shyvKT/PKPXoDWuhQZkEFYQp8MN1YLeJ6AdeQjeYWsDCpdMjEaZGkolaLjFEwq+TJhUAK/m4+gVzkLo1y/3pFNaXfQRzHwj2HyC/SjB04VDNT8dwnR7mPjlWyn0y0uK7Nde/pIZtIGt3dyZjYr061regokvOpceTMFirKfHdiN3tcUG+QnizPrRQnpMPbtuvr1QvQzlBTK+1h/CcHxDVoeqnLRVJPOjXP4VC08yRdq1iXgJjiKxXRZhk6WAuSzWtBVvBPYJmeedttXkBMWhr3PbVnYz3Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kdSFnQvEx8DF8kyObaavjiZ3bEM5Q9BSMCy42Jiqo6Q=;
 b=Wi16tpc+E7/T+8fqb6j/MmvFRbqX9zq3pFB3E42VVh2CkBZtar+GAXOk5MgS8w2rdI3Yh8tYY2eLDdDPZz8lcz4n7TY4qENNKYuzckfiUTz1exSXgGO3POS6YSG20H50osjSnfLMC0JJq/GhS76O7ECFAWcNMO6tW9SfqqXKUsc=
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com (2603:1096:400:448::7)
 by TYRPR01MB12140.jpnprd01.prod.outlook.com (2603:1096:405:104::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 17:24:25 +0000
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430]) by TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 17:24:25 +0000
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org"
	<sboyd@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: RE: [PATCH v2 5/5] arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Add
 versa3 clock generator node
Thread-Topic: [PATCH v2 5/5] arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Add
 versa3 clock generator node
Thread-Index: AQHcih5gQGuNj0Bu1kOetDiJQJpyALVbTvKQ
Date: Tue, 20 Jan 2026 17:24:25 +0000
Message-ID:
 <TYCPR01MB120937BFAFD2695FE6ACA0B62C289A@TYCPR01MB12093.jpnprd01.prod.outlook.com>
References: <20260120150606.7356-1-ovidiu.panait.rb@renesas.com>
 <20260120150606.7356-6-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20260120150606.7356-6-ovidiu.panait.rb@renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB12093:EE_|TYRPR01MB12140:EE_
x-ms-office365-filtering-correlation-id: e23f5dc2-86cb-4091-aae6-08de5848c21e
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|7053199007|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?qf+gcEf5HNJr2b+MJhC3o2PvyNzXNT8um3+4uatzdmwP+cHDrjgQetkaiKzP?=
 =?us-ascii?Q?9MZszp3MisEnzahuwAFYnzscCg+gW1Ifop/Q7G0aJDYBEuqBDi96enCrlj9h?=
 =?us-ascii?Q?vkJS62h2eqBwZm7lQ4vhS7MycM13yRHaywYS7R/YH9EVZdxUhA497xZVwM6Q?=
 =?us-ascii?Q?kTXNxU8UvTUNfqiYyWxJ8acpGVMd1wJpVxmJQrnhpCsc6nlp4kYRAEINvVqa?=
 =?us-ascii?Q?TkfdgiLFmwB6J1ROqHsZOc+dHv+xk7mmXxi+PuqJWClw+sa0Vb5JrFZD4PL0?=
 =?us-ascii?Q?ivKlb4Ecl2E8RLNNJdHyBFI7ids2j09/MAhZoaRsZfgeXlDAOkjk6DPZNpcD?=
 =?us-ascii?Q?spV0Odu/4neZpd82MMz/4yyz5IQ+YwN5/aVGVdyBz6nKZYvShD08EOjM6aKf?=
 =?us-ascii?Q?k5iGqTFzeRRdQnzKIfngrtHi9BV2b68hN+sk/wpoft7D7Gnr6u+qo2xob/OR?=
 =?us-ascii?Q?+a52cy+gNImMEbLzP8rP6piqJ93mAv/hprS5fBu4NKGjvoxtBGC+8iO5wd8a?=
 =?us-ascii?Q?ZN97Anw0uWaFVjq9Oo4D3InFJwEd6a76PkwFqnLQ3F84Osk/yDGnbvhSL2z8?=
 =?us-ascii?Q?gB/XFa6G1rBw17INBiOvz+cx0FwscPFk5G8ILNT1TqV8ikcZwpjwbdUEEykX?=
 =?us-ascii?Q?UVGoknIy61Q1wiG7khShkZDbW7KeWqt/dz/9Pix1G+IBnU/07WQbO7XKHikB?=
 =?us-ascii?Q?93a1q8g9gbIRwZKg/mlPxIKNl4eBo7hjPKtNJgwtqQtSuSLQ0USdyccqf2XP?=
 =?us-ascii?Q?qn5IHujyxd3H0UKPWhWoOxrkETHO0maarUZAoPyI3A5o8l75am9UzulgOi8O?=
 =?us-ascii?Q?cAmqYxcmAMDir3B0SihXqVvhxr8cOhbR9uKWdW1nSAHAaTryW2bsHFsiH8OW?=
 =?us-ascii?Q?kolxsL8rWIQahH6vw+zhAGZVh9EyzqcPU7yo2zyPakLI3FBxn97aNuwk/40O?=
 =?us-ascii?Q?gfrcADhQQ+WbIhXftRiUQS+R4baBb6SosBzzfuoFrU7CD789wqanMpVSUcBS?=
 =?us-ascii?Q?1FH0z4q4galZaaCBJ0uIMwaKt6bpdV1wyuqo7/yqNr/EGENgByORY4mBLiyq?=
 =?us-ascii?Q?79VFrYXnkHsppXcOY0beGR0MRu7xTRd5HFkEXXw6cqU1aBWYO3uTUyTyglN2?=
 =?us-ascii?Q?SYt6UqUaZox6U9IdpUFkwpGnT4ghDbIWTr9+bs3i6ZEJ/DMq5UHtJNn/qtxY?=
 =?us-ascii?Q?xnSgg+iuEQGjcfbCvltPPjLDPDny3a6phRtzInQNKhKaNJ7pJ05Bgl3qgw/x?=
 =?us-ascii?Q?q6u1dLgoixB1ERdeQMj4qCnMpQSbMTsilR9Sm7N/vT7+AUvB4aha/DAQBDDl?=
 =?us-ascii?Q?gktybNuQZ/uqexC2B0+RnACFu7E2RKgnmed80MISk3DslwQlC5Dz9HHwRLFb?=
 =?us-ascii?Q?yY8vSqoWd00IWtN0Ob1EIFsi0zovdDR45E/vUKljm/YL8qGAvyenMI1bdu4b?=
 =?us-ascii?Q?518iYQQ5+h5B4H5TnMTxqqvIDXpNQsQLf2K7uOA3NuZ3ZNpDBTuYvVX3TaJw?=
 =?us-ascii?Q?U1a9lx6fH+e8HM71mOSMszCDc6nTV3FXyR76+ZZg9yxCPimZcuLDQ5FeNkfk?=
 =?us-ascii?Q?EYebWA/4kz6DXRviw2Ip5hfZISsgcSEAsqEwSkqAkKBGx2ELS6NnztlhPL4+?=
 =?us-ascii?Q?4jNl3ZbCHNtj6cqS7Rgdp8s=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB12093.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?UX8oRn5jcoT6NBsjX2DN9maki8KP0asWg3euAFb5jyMolquTXvC7UOkWxrS1?=
 =?us-ascii?Q?CxEnLP6GMdilu/Mwmg4209vFEAtThxAjr7qU+7RtZ0z4QJaor2gDluA68ALP?=
 =?us-ascii?Q?9YAgDTzsLK4qHVPf+ysFVuh1Een1A86/UVotCPiFBx4gmkqckl4uLCPimGSM?=
 =?us-ascii?Q?zvFYBtpTu2GK3Z/YRLaD0dwBF7RSGVlksQGNHu8l9pgQmhIJLyUsHjN1qapZ?=
 =?us-ascii?Q?mKKk9jqmBI/4cFn8TtZ6mnLutguVUrt6OxPJiN/WBIFmfVn4cglut9MixQwE?=
 =?us-ascii?Q?58VOeklmn7zqq0wBp/x1lm9bSXmqGK1qfQpshXUKBckp/C9OUB6/TclzIril?=
 =?us-ascii?Q?2UkTLM3mL9y8SObrN4lrA16LjMrcZZvM3Hs/bXAuWGetct8iajXzPmLWZ3nf?=
 =?us-ascii?Q?4Rzg6elWia44bf2nNDls/Xih1MHieDNDJplcbanZ+XNkiC9SpqGqEPhe2VC9?=
 =?us-ascii?Q?T1D43nv87RFPWm1Ooe+MgH1yGKfDaVpGkcygwjPr6y1ocFok5HVY7nZq8QIG?=
 =?us-ascii?Q?gKFHYeZGJbzZxvsYP7t+2nxXe482cL96dBMcbDGs3G2xtFP66l/L+X+WK5hi?=
 =?us-ascii?Q?MWiUsKnvJq6KdtTcgI2E8MFF0fgqx9lZUXWLrg6BQKtltwztJM9eLCiK5lye?=
 =?us-ascii?Q?EtolXAaVnDSYgCaonyCSrNjTi7emmIKPNoVbrQbFuviN3FpcAg9RcvKRCpGr?=
 =?us-ascii?Q?Kmy2GK/Bnw6pT0Gh1h/2yTeHyhbbcOza4/JQ4QHfKcgUHHeAQi5m8KqLlir5?=
 =?us-ascii?Q?piI6rueMXFaQ+1vHAoreFXOrWGORKwVkssKleymvotMQM+uHHZzWCFv/ykQL?=
 =?us-ascii?Q?9LPT5nR8zuko9MoeZFtTSmJ+d2NAPQkgYjIMR2XA5Bm4oZM/YAuxWUB2IE4q?=
 =?us-ascii?Q?YzPDk9PKy95L8UrGfQZw2TgVXk3GFBykT6/2ana1dZ/PgywDd0p9Z7cVTCiN?=
 =?us-ascii?Q?y8fpVHO89ELEj57SHxhSnQTWdPjjto9CmaVgqoEJ0IgsIKC3Ve+xVW7Zgjmq?=
 =?us-ascii?Q?EjwL9c2tDAXn1KiVTiB1vtOUbHn8NNpY9g6g4HNBAVDCKajVvG4MGPOHCHrD?=
 =?us-ascii?Q?UDiNxjGDwo+dVmiFaScEWm+MyuMmJEZQKOV9PErHOMp+7DiUgYDHwfOw/CrA?=
 =?us-ascii?Q?qbaGmupRk4NfuqPxLXQdkcMUdPpPxiBgeCQYBDPvUVzxDLICQgKPVtKalWSQ?=
 =?us-ascii?Q?QUQoxlqouRcR7AflWKZYPERed5LQg5ZoQGWKhFy9Q1e319VrSp3MfTJw02VK?=
 =?us-ascii?Q?FtECAL6G5Vl1aT1+Asr+vPcbNFr62e8HkqRuev4vWUee6ntSjxe/AxehWDHm?=
 =?us-ascii?Q?ZwGjbMuO0PKpZdVQe/BakRMNopX6kSP+kwbQlUMQlgmnTfZ6d38rb79UTbFp?=
 =?us-ascii?Q?6PWEkaRerRlOlc+RizkGHc3ZyEx+3GmeImBPHCO61PJrjmJ3oixmESjpD0de?=
 =?us-ascii?Q?0v0NM3vJs60PSQaPsD5O2Umoxm/X/r/brYtShCTfZTnfyzOiv4UiB7UGdibu?=
 =?us-ascii?Q?Zg5fIlgrHI+xdSDlBAxSKHpK5ekaeyRp3fh11iUauNnrXetMw/Gr8McZkx1E?=
 =?us-ascii?Q?bZ6wpGjrCXV4nIURMqDZixtjfje+qYfT1c0VKH0lNNcNII9e/YHkm+rLwuta?=
 =?us-ascii?Q?rFSti+94FWL8ni9sC0anZBKljtqO88ubtwLQr4yYU7aWEjLTJNxS/PHvcK2f?=
 =?us-ascii?Q?V4fzNeYRNOEugiz5kW6lfDTkmhbFWhu2xlS/GOcVIci1whxGbnBAzN2JL9jF?=
 =?us-ascii?Q?LdwCoLFSFFz8As7Ls+DMi35Y/5EvhGo=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB12093.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e23f5dc2-86cb-4091-aae6-08de5848c21e
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2026 17:24:25.0780
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 58VPME9DOjfnc+liZdbWlrSLXBuL21tQAn3hBYwqJUe8HXpZG2tA/TlyrbAk309wRovnpyiGpNNGGukkMWkWURLpKaK/tnJ/Z651lW50t+w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12140
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27135-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[renesas.com,glider.be,gmail.com,kernel.org,baylibre.com,bp.renesas.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[renesas.com,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fabrizio.castro.jz@renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[renesas.com:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	RCVD_COUNT_FIVE(0.00)[5];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 2B6584AF96
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> Sent: 20 January 2026 15:06
> To: geert+renesas@glider.be; magnus.damm <magnus.damm@gmail.com>; robh@ke=
rnel.org; krzk+dt@kernel.org;
> conor+dt@kernel.org; mturquette@baylibre.com; sboyd@kernel.org; Biju Das =
<biju.das.jz@bp.renesas.com>;
> Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Cc: linux-renesas-soc@vger.kernel.org; devicetree@vger.kernel.org; linux-=
kernel@vger.kernel.org; linux-
> clk@vger.kernel.org
> Subject: [PATCH v2 5/5] arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Add =
versa3 clock generator node
>=20
> Add versa3 clock generator node. It provides clocks for the RTC, PCIe
> and audio devices.
>=20
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

> ---
> v2 changes: New patch.
>=20
>  .../dts/renesas/r9a09g056n48-rzv2n-evk.dts    | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
> b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
> index 9af50198d2f1..8399f4f705c4 100644
> --- a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
> @@ -100,6 +100,12 @@ vqmmc_sdhi1: regulator-vqmmc-sdhi1 {
>  		states =3D <3300000 0>, <1800000 1>;
>  	};
>=20
> +	x1: x1-clock {
> +		compatible =3D "fixed-clock";
> +		#clock-cells =3D <0>;
> +		clock-frequency =3D <24000000>;
> +	};
> +
>  	/* 32.768kHz crystal */
>  	x6: x6-clock {
>  		compatible =3D "fixed-clock";
> @@ -256,6 +262,25 @@ raa215300: pmic@12 {
>  		clocks =3D <&x6>;
>  		clock-names =3D "xin";
>  	};
> +
> +	versa3: clock-generator@69 {
> +		compatible =3D "renesas,5l35023";
> +		reg =3D <0x69>;
> +		clocks =3D <&x1>;
> +		#clock-cells =3D <1>;
> +		assigned-clocks =3D <&versa3 0>,
> +				  <&versa3 1>,
> +				  <&versa3 2>,
> +				  <&versa3 3>,
> +				  <&versa3 4>,
> +				  <&versa3 5>;
> +		assigned-clock-rates =3D <24000000>,
> +				       <24576000>,
> +				       <32768>,
> +				       <22579200>,
> +				       <100000000>,
> +				       <100000000>;
> +	};
>  };
>=20
>  &mdio0 {
> --
> 2.51.0


