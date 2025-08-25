Return-Path: <linux-renesas-soc+bounces-20932-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F069B33515
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Aug 2025 06:33:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 18623189C815
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Aug 2025 04:33:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 286F223B63C;
	Mon, 25 Aug 2025 04:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="b2Au0AW/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010053.outbound.protection.outlook.com [52.101.229.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BFA72101AE;
	Mon, 25 Aug 2025 04:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756096396; cv=fail; b=tIcuXJtsJJNLCu4fe1RkhJAvhFHf4s726XvWbvjgAwb89jfbheOAykSsC0ESWjVC2woTstPBmkd00zxeO7537kQqHnC6GebacvbsSh1+MHJMv6QcDK/L1UAAIpLFTp7XqU3OnrYqq6B6r/UKVoh8En9VrhQyKG21+dcot3YR0Wc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756096396; c=relaxed/simple;
	bh=l4Evo45bNm7vKq3yVekYDQp++EF6VkMbwD90gZJ0Tu4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sZ+6fbFAZu3TUEJ68Oy9Pq+bjU7avWxDLkqyEpSAEGJsThyNrwa2O/RCMlFlIu56pYrquxDBN4u2+fHxANFBagWG9M02lvD5iPylYYpk6bmn3ZQADmbVu7xPEmZhsn7mVzYVhvc0E9akzY2SWDwUZ4EARgsOfsGuLNXmerqQAqI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=b2Au0AW/; arc=fail smtp.client-ip=52.101.229.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SofYVdDL9jGIfbHT2VHCaduErnVlmEzOIFcQyWX9igi1aq2n6/IrVROBsWzXBxCES14uQ2sWk4xPkEZ3T0fpPhl8/Lo1DVEFQKcGNjNGqOkviCdYZwMwL5ngjmNHP2K1XTvy+wRi7O4ByRAk7NMQhOg3ot4oEHja4a9ItEU8c6mYEpEYetiLbFan7OA5ZNqdoN4yCXOh70TgW8Qwo+mQZaTv5anTMMRkXizsahev9pyXmwdlBANn/zApHOO6uVZTd8SdOlzyyR4yQlTaxc4ocPVqOmhU6OpOvzR4xk7IIASEsA4HX0ArqQbWQrmfIYxmRGFb86Wy9Jt9N4QvgKQw1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cljJ1IWU0gWRam4Yjyfja+Hjsc3suPZkW/9P9p/6A7Q=;
 b=d/ddMLo+2Oxp9C5rWTX2sjanIsKtBKpyKE+qU0uj2ZBTXW7T+0gEJ2PnwGNB1CgG4SzEDcA8kXAM2OqGgsx6xlkQ8ohNkK1NtMkqbyzY5HFX3iDFYu+QDR9sNqA/gNlbszVSJoWqCkN3VxjK8fEvrj8jFqMkzCrRgnt6nUbwdGYiSyY16ji4aWOBT3s2zMEmBTnLtpZh+bqXPepASmx+ZaVhYitd7EpaxMIspthWxxUb+IvPRZNT6aYu+z/TvvH073ATQ7WTIvHpeloeXFOluyl3uNuJBtnmVQhTm1/Z7yZibnHUwV/9vm72JvF0J+zDhw3g/twpEeKxOX7q5mNjDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cljJ1IWU0gWRam4Yjyfja+Hjsc3suPZkW/9P9p/6A7Q=;
 b=b2Au0AW/kMkVmPPM2+j6jEKzVmv9jcL+Hg+2EFMES/HC42/rRnPjLSyQ1Q3gQAT1l4GnlhnQkgWtgwY/I4Ns6+RByhyoZNRiUl8pAy19ZPRjLQotk86L7nxOdoAPjt02Gpd4Mu7/N8QOlBVS8Sk/PbhTTo8aeby3i2y6Zf/WtKM=
Received: from OS7PR01MB13703.jpnprd01.prod.outlook.com (2603:1096:604:35c::7)
 by TYWPR01MB9923.jpnprd01.prod.outlook.com (2603:1096:400:237::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Mon, 25 Aug
 2025 04:33:10 +0000
Received: from OS7PR01MB13703.jpnprd01.prod.outlook.com
 ([fe80::fde:76ef:aab6:f60a]) by OS7PR01MB13703.jpnprd01.prod.outlook.com
 ([fe80::fde:76ef:aab6:f60a%4]) with mapi id 15.20.9052.019; Mon, 25 Aug 2025
 04:33:10 +0000
From: Anh Nguyen <anh.nguyen.pv@renesas.com>
To: "geert+renesas@glider.be" <geert+renesas@glider.be>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org"
	<sboyd@kernel.org>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kuninori
 Morimoto <kuninori.morimoto.gx@renesas.com>, Duy Dang
	<duy.dang.yw@renesas.com>, Duy Nguyen <duy.nguyen.rh@renesas.com>
Subject: [PATCH v1] clk: renesas: r8a779g0: Add ZG clocks
Thread-Topic: [PATCH v1] clk: renesas: r8a779g0: Add ZG clocks
Thread-Index: AQHcFXlcffJdQ3ksF06N4ZMFEcGxfw==
Date: Mon, 25 Aug 2025 04:33:10 +0000
Message-ID:
 <OS7PR01MB1370314F7F5D7548A573D8B25A73EA@OS7PR01MB13703.jpnprd01.prod.outlook.com>
References:
 <OS7PR01MB137037775991BBBDB29E54105A77BA@OS7PR01MB13703.jpnprd01.prod.outlook.com>
	<87zfdw2wlt.wl-kuninori.morimoto.gx@renesas.com>
	<OS7PR01MB13703B662D2AE6ECB77F59584A77BA@OS7PR01MB13703.jpnprd01.prod.outlook.com>
	<877c0z2vz3.wl-kuninori.morimoto.gx@renesas.com>
	<OS7PR01MB13703654640293E4F1F95B694A730A@OS7PR01MB13703.jpnprd01.prod.outlook.com>
	<877byyzjcm.wl-kuninori.morimoto.gx@renesas.com>
	<OS7PR01MB137031EFD84919AA36666E1FAA732A@OS7PR01MB13703.jpnprd01.prod.outlook.com>
	<87bjo971ns.wl-kuninori.morimoto.gx@renesas.com>
	<OS7PR01MB13703647C4AABD03C6345F221A732A@OS7PR01MB13703.jpnprd01.prod.outlook.com>
 <87cy8k2uf1.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87cy8k2uf1.wl-kuninori.morimoto.gx@renesas.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS7PR01MB13703:EE_|TYWPR01MB9923:EE_
x-ms-office365-filtering-correlation-id: 74ce3210-b949-4d77-8bfd-08dde3907ef3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?VgoR/OYoO09DmihHw+RDNMiflp6wR38nbyiukkaxmeLGaizupqTtP9Hpthum?=
 =?us-ascii?Q?PfU4YDYLqDU3dRliEQE3T6JhwkYjup6oqCL9xRznZXA2ie9inMV+MT/T0txT?=
 =?us-ascii?Q?XzJojZlWDDeUy1hRFKxkisJ9HmcR0erYXXAz8QciTnR8tWkRaE1DBE+LImoK?=
 =?us-ascii?Q?Qmyw+zinV+bh02LYGWlanYpDMIA1e0eeutm0dfEJHAMlIy7rnB/7xc/LRC8e?=
 =?us-ascii?Q?0VLV2Ac5EFYv1cuO9z0SED+GNRxuFPRtCSe5QvOYgvy988lJig6A6Y49UFyI?=
 =?us-ascii?Q?aZ+6KH1VvwYTJD9vninWLdC8xeewdHOnL6mnHtWZFxHG73wUoMBMAmlDt/Ks?=
 =?us-ascii?Q?t27IFexAX8w72MiXKP5w2PPTsAY/WMSLDVhxDxVPqVJg7Aprs2cvDCRdA8Wz?=
 =?us-ascii?Q?KMJtWL2byfsFSpWpSgz4fJABHycylwPlhvQc7GPefYFTDHqcEYDYbziIjw1r?=
 =?us-ascii?Q?ITxzyBSes02369q6fZvfp2A/dcKgNtCtzD34Nln+6so/m6YCgrbb+U3p3qfE?=
 =?us-ascii?Q?ih5hlCPTaf1wdycXBkBdNlY5xlLLAh31qEDAlAWUeWs3RQeFhFR8m7sCoq9S?=
 =?us-ascii?Q?z+My95zMQtt7fql4qebeqT8s05cji50Hy9o4c1ez5TCWyAd+iNsakESm+LEX?=
 =?us-ascii?Q?VPfnAz2c64eGQuUzX0zKgyw+STDdx9CVMd8RWiTQTa0VUkQ4n4LWcYE0kKIc?=
 =?us-ascii?Q?JdRQLXfaoYHbiJKYZPF2GOV36sSqggsHfS8R9kRdsKUGEDTqTaGeCP1z/nlC?=
 =?us-ascii?Q?+z7roKtfxd4yEcJB+zLJQu8M4b2c0AyiytXtW59ziAjcv18nezcM2w+TYJ+4?=
 =?us-ascii?Q?4omcei3S8Zkf0oQL5RfcVLDn3qV/cJeS+ANBf52t1MXgfDnju+Vpbo2kMkao?=
 =?us-ascii?Q?dTGxT+ZtE3CRBTuuvq9f/Vi8cJh37tbh+LFYMkElbjYURJc5FJU/Hv3ScLZy?=
 =?us-ascii?Q?BUAyfVpJ6URvsYWl0M3NqUpJgXZkFsNpPIPdjCJI76RX0gRMKxOJ98Pi8+ve?=
 =?us-ascii?Q?iyXxQo5Ac0xD/Wz900dgTowuG4gH3kYcE+KdYknK40bkUw5kMeA6DDg2S4p3?=
 =?us-ascii?Q?/C6FKPBE8a5XVLJjJ+V52rBe8Kkx6VC4ovIhCYn21ZwPdl6cr/JTCbQRVwbe?=
 =?us-ascii?Q?1fMeM4+PwcOTV41OzgK16DEDkFH/7Qe2ev1W2sxbXmBaPQ5dO0Ge+qvdaD70?=
 =?us-ascii?Q?T6OyHn3ZxAIPARxygh1E9lOV0wOG/+l/U06UjKv+ch9pqQWoDMKN/lGeHz/n?=
 =?us-ascii?Q?CAHHc8o0MM1LQthc5ARAF+w0KPtNh4XCoA3df8PkFk9it09Ssc4TG3DzJw02?=
 =?us-ascii?Q?J25n4SB+tec0ItUD9E/Y3c4Au8dPN6E+/o2mAjCAwPqLSguBQC8TDQ6qIjbu?=
 =?us-ascii?Q?2Rh+/Hf4vQVqQV5Ozxc8q5igDChfMzukO6xFIJAJo1fYQlheoN31dTIvlKtw?=
 =?us-ascii?Q?jIB6at9TsBe8rTvWQ9b5zZnyidW+wnVK5KzJHj0bLEdxZNhBfqbm2ygwIRtu?=
 =?us-ascii?Q?jiIY5QVKPp/YaFs=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS7PR01MB13703.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?dPt5iK844k+mTtFm2ZfSQzkSkTx+E54BpDcTWXbWWhRlNKp7YAwcs00LRnt1?=
 =?us-ascii?Q?5yhI3iic1VwCmYguVkjdjPClBCnTl+srLTUszJuMQBD7+bkQHJIyy8asDH4N?=
 =?us-ascii?Q?RcU59qiRq4cRa+B+AYSA6W4Wa+9ujFrkyeYomk0z0ZsxQBdUGRB2MpXjqVFj?=
 =?us-ascii?Q?720m9CBBviyOpbjeCsh0KWSpy1tbO1IHSfeBulA3b+hMjteYL+qugEuyXx6K?=
 =?us-ascii?Q?ukCyOftMxgMlHc3l89B45aIawWMZfFItB1mLdJZ+w9zJyw9HnPJrdHmedpEf?=
 =?us-ascii?Q?hyjCRFBvaIZdec6NE6C3yrNfKsBuwQ91YyzfDhx66RlWLwmeJwaWF+M9TGXt?=
 =?us-ascii?Q?8JRtm0PekZkfG1RiH1caqHC6pUyk/sWOcuIdviLKabxfztPEXvZzKdaAQAWQ?=
 =?us-ascii?Q?X3U96wfoA24GYrNmrAVnXpbeXjRFCeDq89Pc85nn4Fh6Ro4KASL3kf3L8ens?=
 =?us-ascii?Q?hshs2rolml2LEUr9u0UzI8R+sUDn/SecNZsAsXI0z0AtM+d2DCnvGQPwt2FU?=
 =?us-ascii?Q?1cYx9hbm22yP41hTTChQ0S+ILgb3OZFAKrMldTH1naELd+/8IhjqlfFk70TH?=
 =?us-ascii?Q?0+h19ZTC4spE8tVzLrJy9Pe4wdKB5AoQBW/DVY4eXquDjfa8rHjVckpgTkhi?=
 =?us-ascii?Q?Qm8hQ/ISyIk0P/Mhjw5HX64a7f4bB/PYrgMJy77K6tP+i5xUf8p9MLtiQEUG?=
 =?us-ascii?Q?FKnJgMU/Sl7ZoflTDUvOHdQxUQ/9O/I5GkBAPzYVSUi7FtKNiM4ukjmhkx46?=
 =?us-ascii?Q?6yfnBSnSr0NO6s7YGValgMAYmxL1RbLUvrG62Zoh+qCsXeTmTm62soZP87td?=
 =?us-ascii?Q?BsYzLU6jngochJkMUWjpWxm//+gj1pURZ4Q7l2L4wv6xISGFeGPamcgAKgsf?=
 =?us-ascii?Q?+V8mzuMGe89REKGqN88cV+hqXYJFrGd55j/iFXz7Rw4CC4+bZ+oILKOmArWQ?=
 =?us-ascii?Q?6JnbQ2eUK3NfbGDkVhKXhZggAZ98EYJZBH9PAwGvUWzJBsPKY9lkzN+AoRbk?=
 =?us-ascii?Q?KHhuyaNNID7LYALzW2ctZxyQpkja1bkDGqwcEBtvSMo8DnOWirafvPFaTbKD?=
 =?us-ascii?Q?r7oLuUdd6I9GY6SDKiOv/k5Z1bBkxvjbgxRlnqjF9Svbp5cvzpB3uqiuOWgj?=
 =?us-ascii?Q?lWkJyZST3j+QbButtl9y9CJ+cfEpPSbkOJbNew4gEwsIkngxHHM2kJF1vxSo?=
 =?us-ascii?Q?WlsJoX64BYiyO93D4eNStHW8lZc2JKLyLRuZmSJImxC4ZxAJ1ac5+k+bO3Pn?=
 =?us-ascii?Q?QWjv4NuAOe1mCaZ3yusJ8PBD7E08qtJl4C7KyJDmyD598WMgKmbNRTOVxcfg?=
 =?us-ascii?Q?HYHmUPmrY15mOGCdirADALsrfpJBQ35CRh+QuX3A+xzDR+WCarPJTGXYPX65?=
 =?us-ascii?Q?tiGiYLz9gKkiso42Y23qNQ8FqJFw7CBZmGlB2VSgMQHWVclZuHbuX19Z+c8t?=
 =?us-ascii?Q?Y5uswuIEsjKRVEgLIsa//WUAUwz6yA0tMQKWRr1sg6ssTkH5tGFMgXoIGvoQ?=
 =?us-ascii?Q?NLFPtVPs44/cU7Hopc3LwH8rBeo55eG0HFDUl0oe0taziCcnP0bXY+Zicosx?=
 =?us-ascii?Q?sk2jgeaTPcd/8PuUe8MqDvyqGqO4Qjb2QzGwSJ6eLyWPUaAbdQtQ9Fs0q1N3?=
 =?us-ascii?Q?9g=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: OS7PR01MB13703.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74ce3210-b949-4d77-8bfd-08dde3907ef3
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2025 04:33:10.1005
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l/5g2OIYelsWKOmLqiNNg88AuUadn+eUux84ExeEwXiRN52nePEKSfcUq0qfGB6ITfwHu5v5m+izdqWiKFvajkMGWRG4RgFCl21PY3NKa8E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9923

From decde7c45060327ecb24df8218cd58b9ffd3c45d Mon Sep 17 00:00:00 2001
From: Anh Nguyen <anh.nguyen.pv@renesas.com>
Date: Thu, 21 Aug 2025 09:54:00 +0700
Subject: [PATCH 1/2] clk: renesas: r8a779g0: Add ZG clocks

Add ZG related clocks for GSX

Signed-off-by: Anh Nguyen <anh.nguyen.pv@renesas.com>
Reviewed-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/clk/renesas/r8a779g0-cpg-mssr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/renesas/r8a779g0-cpg-mssr.c b/drivers/clk/renesas/=
r8a779g0-cpg-mssr.c
index dc376b683d22..afb86973e771 100644
--- a/drivers/clk/renesas/r8a779g0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
@@ -151,6 +151,7 @@ static const struct cpg_core_clk r8a779g0_core_clks[] _=
_initconst =3D {
 	DEF_FIXED("dsiref",	R8A779G0_CLK_DSIREF,	CLK_PLL5_DIV4,	48, 1),
 	DEF_DIV6P1("dsiext",	R8A779G0_CLK_DSIEXT,	CLK_PLL5_DIV4,	CPG_DSIEXTCKCR),
=20
+	DEF_FIXED("zg",		R8A779G0_CLK_ZG,	CLK_PLL4_DIV2,	2, 1),
 	DEF_GEN4_SDH("sd0h",	R8A779G0_CLK_SD0H,	CLK_SDSRC,	   CPG_SD0CKCR),
 	DEF_GEN4_SD("sd0",	R8A779G0_CLK_SD0,	R8A779G0_CLK_SD0H, CPG_SD0CKCR),
 	DEF_DIV6P1("mso",	R8A779G0_CLK_MSO,	CLK_PLL5_DIV4,	CPG_MSOCKCR),
@@ -163,6 +164,7 @@ static const struct cpg_core_clk r8a779g0_core_clks[] _=
_initconst =3D {
 };
=20
 static const struct mssr_mod_clk r8a779g0_mod_clks[] __initconst =3D {
+	DEF_MOD("rgx",		  0,	R8A779G0_CLK_ZG),
 	DEF_MOD("isp0",		 16,	R8A779G0_CLK_S0D2_VIO),
 	DEF_MOD("isp1",		 17,	R8A779G0_CLK_S0D2_VIO),
 	DEF_MOD("avb0",		211,	R8A779G0_CLK_S0D4_HSC),
--=20
2.34.1


