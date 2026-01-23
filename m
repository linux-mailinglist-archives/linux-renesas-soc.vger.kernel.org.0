Return-Path: <linux-renesas-soc+bounces-27365-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHvSCfSnc2lnxwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27365-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 17:55:16 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 508C678ABB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 17:55:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 863C7301C12A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 16:55:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82FE52FE59A;
	Fri, 23 Jan 2026 16:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="a9BJJtqw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010020.outbound.protection.outlook.com [52.101.229.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9B61E89C;
	Fri, 23 Jan 2026 16:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769187307; cv=fail; b=kgkZMwbz48u+Z++EypW7QynRJRycdaUbxjPKwXbck2GJuGlxpQu7ik+qu695ZFNFq/g7e8MCWatU2R0jhw/n2iLc09eLyVOSqGJ6dWib4JjzBue9Iyi2SpVDZmpoMZA4MNXHEN1X5glp5ygvf/1L3D0FMXanDUxEDN7ePjswbls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769187307; c=relaxed/simple;
	bh=Wjt/9i1vtTLQx6o/Qg87jJlXrySMFA0eQkz+tP7J/iM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eqaESP1hH++Myq0ss1YRYX93GcuM5z9El0sl9pSo7FKv6C55+w3E5Lg1FmSAkJo0CAOXAVzVlHRh3YVZfI8J/Hhdz5jebPeZsFJ3L9Oomkl7MUBLghYKliOu15jtfG36adaFRfAWfvjaA/nUbP6+6iscFafwTu0z+pPUu0+BA44=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=a9BJJtqw; arc=fail smtp.client-ip=52.101.229.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QF0ZKYCFAWcI2oStVYx0P8D41CIVYueM0SEdbgXNJhrx3nI+ipk5woYFpjfKYXj3ph+saNSixG9LTulpQEdFarszEHOPqQbxT3Lh3ro5+51TxdasY5M74WsfUVKOtckA/5dwqaeunZ5fOipJriHKKL+izOlnuBSA4ypeOi3SCRh0ewOLrWFOTef12cd/Qup3uJJJf82Z7iN+VRuFzN450AMoY8PEUMrD6tLdNhPm9t7dykRZAMXAgmzSpC4T55jZI+ECcVKJfu91etIN6r8uoz6LUp70XeK5pIVM2i8XJ0dmskVL/BwvvzfPKZM3rUyzjDc54+xM+qH2maYqhfVr4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l75IyrSuEcQtwTyBsXzZ8UtoU4cGFCNFtzDCDfEiNtM=;
 b=g6gsZyWjcSsZsUpHRsGl4pSelcvbM2ywFObk/5XKKoGxziBX2pq9BSDlF5YcBKN8GB7wk/7usrH8h/yuBtL3EV6TaMO22y14pVEke81TEPkbwW9hN3GrA0TAptChDAGk/Mlw3vxKz8uL4Sk2+zv3tvdyYXdeO/ppaZl/BfPmQwMrGQRQZLO4FT9bAAFhpFA5m8Da8lcoYC83OEIxY/6FExIbgx87s5EPCdnIqaFuIw3sI+P/RvVbP99PtjlzGX9Cnsm04ypzu8pbQ1Nu2Ji50rdYL1Sbdhb5R/MK1vB4LXHBKQIMQy6Li6akkxqw3Y+tBDAchXyVXLSNrnKrz0qSdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l75IyrSuEcQtwTyBsXzZ8UtoU4cGFCNFtzDCDfEiNtM=;
 b=a9BJJtqw/dHJkn3B6B37B5C58n9i6C1SI8t4vi4Uhob4OTS4eyc/K4vG67ELy91vwTVQmYpU/8ycy9mJQmb7Q9qqiwndFrY2Vxl4A1zYij2OhVQnJ2Wk7UHyXm7Ab0/pyGxROo8+ZedKA9sk4LTAN+eVmqrtKbltYl0ier3flxM=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by OS3PR01MB8320.jpnprd01.prod.outlook.com (2603:1096:604:1a3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 16:54:55 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::aa7e:1460:f303:3fd8]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::aa7e:1460:f303:3fd8%6]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 16:54:55 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"mani@kernel.org" <mani@kernel.org>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>, "bhelgaas@google.com"
	<bhelgaas@google.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	magnus.damm <magnus.damm@gmail.com>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "john.madieu@gmail.com" <john.madieu@gmail.com>
Subject: RE: [PATCH v2 15/15] arm64: dts: renesas: r9a09g047e57-smarc: Enable
 PCIe
Thread-Topic: [PATCH v2 15/15] arm64: dts: renesas: r9a09g047e57-smarc: Enable
 PCIe
Thread-Index: AQHcjHDzuvre3/WXhEeLYSA0A2HDA7VfzgOAgAAqsyA=
Date: Fri, 23 Jan 2026 16:54:55 +0000
Message-ID:
 <TY6PR01MB17377B4702113638C127F2015FF94A@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20260123140031.94752-1-john.madieu.xa@bp.renesas.com>
 <20260123140031.94752-16-john.madieu.xa@bp.renesas.com>
 <TY3PR01MB11346C8FD2A15580D4FAF501D8694A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TY3PR01MB11346C8FD2A15580D4FAF501D8694A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY6PR01MB17377:EE_|OS3PR01MB8320:EE_
x-ms-office365-filtering-correlation-id: 6d42f3c5-160d-4b6a-30f0-08de5aa022bf
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|366016|376014|1800799024|38070700021|7053199007;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?EmDvVG7YEhq34WJXToHjzX4f+zfmFq3pnQiQHimAuWIinYYa96VSM3d+MLS4?=
 =?us-ascii?Q?770xFc93oBSeHyKw4p8+7xfW42irhskKIfiqPR3ibI783Np2QQ8C7M+GKQh/?=
 =?us-ascii?Q?ZOp16eJzy14VD74Buf9fD+EEfv0MO2GbV++wSO9YKit8r0Hjxj02ebkVke7X?=
 =?us-ascii?Q?mTCT7/K/ff3rBUDosJOr56xEp43LpjjBQI1dxa2q2mKiOtT8cvyvf5YDfizY?=
 =?us-ascii?Q?RoRgTnjxP0nS+Nv8Kh/0YZTF5ei3wcz0VvDosKshJKxeiyggYU2kLTGB6PnR?=
 =?us-ascii?Q?1liW6F86bW+cYQzh6Zfr6FictZ5QJUl5tkPw0sde6zydOL1b4aUODNHZi+xs?=
 =?us-ascii?Q?oUADWALnD8RptJitSPk9IVDb1EW+dR6jpuC7dyUdAjr4Un3JCfBdmadAR8WN?=
 =?us-ascii?Q?C5bPTHpKoNCfwSmOUOqH+aNDdROkCO0nbdXatu6YeryvY95lY9G49iR26rk2?=
 =?us-ascii?Q?0MFTsqTPDahhPHkb+EAychTWO22xTmMaDPBrOmy4MdXRY3HxG7IGmiK7O5sy?=
 =?us-ascii?Q?HqLbAGcKBRz9IoVd2bNkZOBgAgLlynPHbVXAQW+IL4wIeJFqss5HFPb/Nrhp?=
 =?us-ascii?Q?Pjc87YwwoF+x9W23YEiP6gZjEnlhDJsudnlQKcqQ/4KNKib15OVXhZQ4bzVs?=
 =?us-ascii?Q?fIJ2v7089X4zpet/murSyvB6pFsj53/Nd/Y21FPqJSK4kuibwch2zSicIAuU?=
 =?us-ascii?Q?3CsokvIFS8wubvpZd2vg4+Wy1j9309ll4eU+2fsdTzjILXpyXWen1Qy/CBzC?=
 =?us-ascii?Q?kGM/xEF+dyAILD9WmS0krd+ntapfEpFOxdiDDyKEo7S/ExjLG/C2+u6ePTaH?=
 =?us-ascii?Q?c0EVsyV4ld20q9BtSyz/tc4ePpCPBkw4YLCV+FxC/GlLrU/pRpO2CnjD9j3F?=
 =?us-ascii?Q?iEK0Qj7Lbu8qNAkHQpUg0qpKxIAjk/4/k5hdNBdrp/uugE6AUIUPnXWu3p2g?=
 =?us-ascii?Q?6W/uHra1WLB+R80vFZRezlJhKnkQGj+eJ2ccuqs0cDHMC5b1IxoScNIsUmIh?=
 =?us-ascii?Q?q7yQ4lMD9jql8EL5CwTqXHWOg8wdd1DOTZXLTzS6L4BBWfY4Yrn2b73V8nJK?=
 =?us-ascii?Q?ToPdz8mnIEkXR5JypKOeK5i5pSDKqgBpbcPECBeu/Oq6VCF14a5wNQNL50dO?=
 =?us-ascii?Q?WAazRUongf7cIi49SU0batxtUkK9Pcg74bojwsaP0RlAqmhOEP6F9i3gnjG1?=
 =?us-ascii?Q?uobvfZa+qusdvqmXleSk8mLJXUnXVIYNO1C9wryvuyGc/9fkpKryCprJMhsz?=
 =?us-ascii?Q?F+hh1rLK/p/hd5y/3J5ETtDVA+NCDSV6QyD8ObtsJ5ah77UOL1qHnSq7dPHv?=
 =?us-ascii?Q?0CRYjeSXp0r3Ygtat7tu6PeG1qr+9dQzNZe19UBCn31+yHqpJxMIPMYPiBX2?=
 =?us-ascii?Q?UlcdIbEsV+/VzOEbfib2KmRrS2cRXRTJ6PlTMenZPaYTfKyDf7/joxsQPie3?=
 =?us-ascii?Q?9F44T2WRXT8p89a/wIAO+lHY+RzSMj2dNmk0xNx19TpaxxwbqYNZQs6qO8Je?=
 =?us-ascii?Q?YSfrl9iN216YqF+6NYvGKp4l4jGuLIO10Q7nR8e+nEOk9O0/yWaKwe+lt1jF?=
 =?us-ascii?Q?85mM1wiV99BxCtiobPdMry8D7nqiynGWWQYDhJVSJflI0HyCj+nl+8PIGb18?=
 =?us-ascii?Q?t2b7ELUIfGCqS1HnfHH8SyM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Uojpu54ZT+2s3Um8f4GxHTKW57PJAISugYVwQ6rmqTZxGuuRXObiwNlgcqeH?=
 =?us-ascii?Q?cWv5IoEVenYWE1ZezjnsMNBqVKVFjodncfHlpKiyD596LYgiwSl1DeiVxecK?=
 =?us-ascii?Q?VP3s7feq+wLsk2DKb00v/Pd8/LchkPbpnMSLeC9/tZ/BbmmkFVi3qnFpjtDJ?=
 =?us-ascii?Q?Vg5CQl8l8ZfJ8/VwvGRROArRrobo4eG29en6hk/yZF27Srtc7Cu7cGMI9US4?=
 =?us-ascii?Q?67yeT7rK6ST+Q+i3qoNwtwy+tSPoN/pu4zjNSoXpA5XFtn03+4bVObKvryqP?=
 =?us-ascii?Q?CyPaQcaX6Eo2N2togwg0Z5sz39wpw3wSV76nVKp/5OaVKTg55AKGiawzl47D?=
 =?us-ascii?Q?esN+wNkAqSgKWnQPYrUD5L6vc8nxwR6UqJJv+8gcydckigPwV13TKVVTLUF6?=
 =?us-ascii?Q?C/C8yXeqQQ+RtKtBkSCye8Q0wYVSm4EYzdN5jLBokj71XeND9wOsRR+UqR9z?=
 =?us-ascii?Q?+YmVmj0BPsdovK0G+UHus5l6+iTNlDCsuxJvXl5IXZ5UX7m/n0HN+/lo/i6f?=
 =?us-ascii?Q?Xy5ouS/KutIkFCGn1p3nUUMkQL7i+Tu+6McosDTxILRV41p7OkZMJsDCHn79?=
 =?us-ascii?Q?vMeGVw388tVbfHwnVPupR78j4abpo0I+jKiNFuFnNa2wYKMRzpA8NRDpOfjU?=
 =?us-ascii?Q?OBlZmwg6zd+E94GIGLnzJjgJ/M5T4j+UXFgp3UQK57jm4QAGmDBPfpUs06EH?=
 =?us-ascii?Q?WVQR3bZD5cyOpwQGrpzA8AHojuxLtSZWMIA2T7qBv3QGKsMiMeVVKv1+wmZf?=
 =?us-ascii?Q?Ob628iBcVykxqsNVqfRtUKcVLwOR6kB2MzWJSaEJRlUhGmMtTamw+LfDsuMX?=
 =?us-ascii?Q?oiJlgdRPelWu/Mo72fyGm28x/5hh8Hk0Cvtt+Wkc1nG2XPfUMdFfFAEEnxYB?=
 =?us-ascii?Q?p5gd6fIV+ieoiSgd6xtgIfaYe7P8tldUWFeDYtsQ2Bn+NdDP570RW/osYzh0?=
 =?us-ascii?Q?L/T2SZRJ9ahbQ1yAawZxZWXoOSY4Lioi4eBwd0AwTIpeQ17ht7GPRjEFuarO?=
 =?us-ascii?Q?CXYVuF8e00qdqda2biJASpzjRc3eGNbjjDd5zHjliLE2c5ccpUq+sm6ona07?=
 =?us-ascii?Q?ghIF4qEPsEAVsXLh/JSDfTEg1/y7XRdtPctzobTiZy7A9FaUjYsueQxSQSxi?=
 =?us-ascii?Q?IiA/8GZLSfcGTQ3LujIQRfp6euWaJ/qO6U6hJ1gd8d4J3jVWQXNMF+/8iSYG?=
 =?us-ascii?Q?OeeP36yOxcHHtayjg4rmBbyfR0rsMZa/fQAiKQIgX0kH/u4ycxhsKmrd3QoZ?=
 =?us-ascii?Q?HMk/L/1CftZL6e98FSeWf6DSOhwlfBoE7eNaEkq+4q6vwf7EgM5g5vLLdkuK?=
 =?us-ascii?Q?3hO9duIvSXspzphPc1wr7Z2yuB+bEjZSx65bk2MMPOt4C5HXyzi1haPmhk/I?=
 =?us-ascii?Q?If5hUUPhSCZIcTbFoOTeoNgTzuPHD1A+8vPbJ4LnqC8qtjIjywMWcBPilhX8?=
 =?us-ascii?Q?x90C+z0YqmXZ/xJBQzWu+bX45PlDPBDzPrrQnC9qTF23CI7Rw5x/u+l7+aq5?=
 =?us-ascii?Q?Tsa/6QQWQ0IDLwHZLBeuYe9ap9oWLcqJdeDxy/Yp56lW75BAcH3Z1ds+P47u?=
 =?us-ascii?Q?26dRye4FJZQ/Ovq1Tk9UCGbrYx2dIpVpol1MV+8n5cSMWx1zSuYFCAp5tUeG?=
 =?us-ascii?Q?SfT9OZaxeQ9T+2n08QiWtiWz7a8x4zaQWJo+gn+pJDjpmSz0bV5Rq/nOhlmq?=
 =?us-ascii?Q?BrMQ3CYjOm5D1D4I0hWrHEdKkxaO8QcrurtVTvbbKp9TGnhctoYddlJt/VqP?=
 =?us-ascii?Q?a4tWwsVpB7K3HlaC6KugFeL7vd4Z0Y0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d42f3c5-160d-4b6a-30f0-08de5aa022bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2026 16:54:55.6949
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: borowX2y0nGe2gJAdYI3+SRHBFiQERSIjSMBZHgsK4ZjtcbnTeCf3UALlVlT3OhnbSxNGZbik5dUawGm8e8Zt9kZeAGjDMXF0CGn5z8GqrA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8320
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27365-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-0.980];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,glider.be:email]
X-Rspamd-Queue-Id: 508C678ABB
X-Rspamd-Action: no action

Hi Biju,

Thanks for your review.

> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: Friday, January 23, 2026 3:21 PM
> To: John Madieu <john.madieu.xa@bp.renesas.com>; Claudiu Beznea
> <claudiu.beznea.uj@bp.renesas.com>; lpieralisi@kernel.org;
> kwilczynski@kernel.org; mani@kernel.org; geert+renesas@glider.be;
> krzk+dt@kernel.org
> Subject: RE: [PATCH v2 15/15] arm64: dts: renesas: r9a09g047e57-smarc:
> Enable PCIe
>=20
>=20
> Hi John,
>=20
> Thanks for the patch.
>=20
> > -----Original Message-----
> > From: John Madieu <john.madieu.xa@bp.renesas.com>
> > Sent: 23 January 2026 14:01
> > Subject: [PATCH v2 15/15] arm64: dts: renesas: r9a09g047e57-smarc:
> Enable PCIe
> >
> > The RZ Smarc Crarrier-II board has PCIe slots mounted on it.
> > Enable PCIe support.
> >
> > Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> > ---
> >
> > Changes:
> >
> > v2:
> >  - Removed board-specific dma-ranges.
> >  - Merged enablement and pinmux assignment in same file
> >
> >  .../boot/dts/renesas/r9a09g047e57-smarc.dts     | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> > b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> > index 696903dc7a63..6ec34e7565bc 100644
> > --- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> > +++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> > @@ -122,6 +122,12 @@ key-sleep {
> >  #endif
> >  };
> >
> > +&pcie {
> > +	pinctrl-0 =3D <&pcie_pins>;
> > +	pinctrl-names =3D "default";
> > +	status =3D "okay";
> > +};
>=20
> PCIe slot present on SMARC2 carrier board and the entry is missing in
> renesas-smarc2.dtsi
>=20
Can you please elaborate a bot more on this ?

Regards,
John

> Cheers,
> Biju
>=20
> > +
> >  &pinctrl {
> >  	canfd_pins: canfd {
> >  		can1_pins: can1 {
> > @@ -167,6 +173,17 @@ rsci9_pins: rsci9 {
> >  		bias-pull-up;
> >  	};
> >
> > +	pcie-clkreq-n {
> > +		gpio-hog;
> > +		gpios =3D <RZG3E_GPIO(4, 5) GPIO_ACTIVE_HIGH>;
> > +		output-low;
> > +		line-name =3D "pcie_clkreq_n";
> > +	};
> > +
> > +	pcie_pins: pcie {
> > +		pinmux =3D <RZG3E_PORT_PINMUX(G, 7, 1)>; /* PCIE_RST_OUT# */
> > +	};
> > +
> >  	scif_pins: scif {
> >  		pins =3D "SCIF_TXD", "SCIF_RXD";
> >  		renesas,output-impedance =3D <1>;
> > --
> > 2.25.1


