Return-Path: <linux-renesas-soc+bounces-30270-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GGl4JLknxGmZwgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30270-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 19:21:45 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E61E232A7D3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 19:21:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6CE3B302415E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 18:13:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B453439F18B;
	Wed, 25 Mar 2026 18:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="CTJHgPhQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011050.outbound.protection.outlook.com [52.101.125.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89FF38C2C4;
	Wed, 25 Mar 2026 18:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774462380; cv=fail; b=eFnAZY9HudEHJxPF5+RYFk/4yUCiO5n90fUZWBPwptcesupNfgP7udhsjx9l5heUC2LkJ619+ati1XN0CGV8aFR7VBKR+pEClq89LOmHDXXm1VlfDGOaVyAFkmVi3RwLCElf9LIzTaheYJ9hpMbrJ36ySILBegpS01hAuJBMO0c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774462380; c=relaxed/simple;
	bh=Cb7MSZylA1wqoW9Z9Ew5X7RfgmNoLYbMtDvP4iKnuhM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RS8D26KQ5O//B7CWCcGH/xWokdDEAgtLOBxy0PoK7pcpoxwWHQRK0Kz9MexJEQazB+QYVaHVcfflx9kruJs8nRY/lrq+/W6dkUOvK3bQRiybyox+xslzRy8QvT03sMZGaSl4CRVQwdPm0KabejPwrf3S6SJo671FpBuhVjObC1s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=CTJHgPhQ; arc=fail smtp.client-ip=52.101.125.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=inf3jhRSL35dWh4IqsUh5k6PhYn/E8YJhCbONJHmUYZNTWu55CHrbqJuAeH4eU5gG9HdS/C79uOg6d+Y3VxpcR3zEZwDEfdhPuSpecu/BCGPOPmch7H6XDH/EtnRI2mfl4v84UoEyZDWIlZld7YPCnNAM/0Ujb916YoPNiJ3o/c8FOGn2brC3nP+bXugQnV30Twuzf24Bd/jGb2tGMcclvKNcfj0xYLcO4ENEX8oDLpU+OiPk/huIJEUOHiyZ1xbD9oqeR4SEd1A2WwKJWKNC/XRRttlh8DA++xeo+mednLYIRzQL3txnGLUDZr0LlW2nsuAlCNiOIVkCXWNKl/7MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=goWUZ5sgcgUYSUqsjX6VkVY01PS3NejJrJaQ5RQyhew=;
 b=xS0/b3njYAcErxcBo9NmDk+r8raFH3ClPhpDjom1U8lhxj5OLMSA60adMePZAjPnflFVTvn8JS9clnp2c/ZNKjypsY0Dpjp25KNb+nq6GrBzAr7rjJr6jSn5M026l0WqrBL2AatuKUER4o9VoSEtgwHqiZv5Uab8HuvCjiw6GOfCMBoOt12MCQ8medL5C9PW/P52CPCy9NQarY4wvej2RPwIlmhZ8oE1E0nrqOVmT5JzUtXWJ5B88eF9jLtZMihoCvimJrGUSZgqOJz2kp+qXhmfa/ypmp1Z2mb/3m8TRQ8xRZBtLP8eBBWrU1Nh99o/mHvTGSmDcQVC6m/f1s+9xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=goWUZ5sgcgUYSUqsjX6VkVY01PS3NejJrJaQ5RQyhew=;
 b=CTJHgPhQt4n2sDKyT1+VvZbzWRsjKQVDpsO9C/fYATv2a0Dkvrx89gS2XIECc9h9MinF1QMKd0ni7+/a5EgF67jQWpBpsRBXFD5br2a6otZ1U367NoGfi3MS4/BWlabiEcFG2Z4Vd3lAG8bS+iPMIfllRKP5QE+Y89xnhXQLHv4=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by TYYPR01MB13065.jpnprd01.prod.outlook.com (2603:1096:405:1c5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 18:12:53 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97%5]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 18:12:49 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: kernel test robot <lkp@intel.com>, biju.das.au <biju.das.au@gmail.com>,
	Thomas Gleixner <tglx@kernel.org>
CC: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v6 15/15] irqchip/renesas-rzg2l: Add shared interrupt
 support
Thread-Topic: [PATCH v6 15/15] irqchip/renesas-rzg2l: Add shared interrupt
 support
Thread-Index: AQHcufbWvLxNnJaYqEqQ+5P1a1g0vbW/jp6AgAADGEA=
Date: Wed, 25 Mar 2026 18:12:48 +0000
Message-ID:
 <TYCPR01MB11332C9EF3D01FD5FCEF2087A8649A@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20260322122421.132474-16-biju.das.jz@bp.renesas.com>
 <202603260117.5j4fMpip-lkp@intel.com>
In-Reply-To: <202603260117.5j4fMpip-lkp@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|TYYPR01MB13065:EE_
x-ms-office365-filtering-correlation-id: 64ee86c0-f2ed-431a-41a6-08de8a9a1f64
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 G2ycLfqQh51GDEFHQMr4PGiLqRfHDlFZapy6gAyMAJOsAqdwNnm02zlEouoz7O4l7TnP3+gDY6y2Xutq0ROogmPDl4jmqXYJn3Y9Iv7kKOcZoaQULMkCdRMRchj4To3JT+WR4wTz0XGyuTE+0BinFfrCOW/fmrJRETRYSzGPomzvFbKBQgC9NACEY1x3Ym60zTlgyLgl73Z6aPSBTw1qCwxbO8YZsZMMT6XAGCPOz3Qp4/QsJX5qf+ZgjMsGCtEM+F7WRVBeyUAHs4Yt3bFZiqW/v5ACNY1CgVq+dHgAacqu/MR/9bDO5MEgeQalD4Vql5RYJ21cHNpB8ZmbfoiiT1pxNrfKNLvRAWHZUxZ+Uzh/W3GsCj1un6GXJhOSo85grwOSY7L65bKM17hLtRWc8UZvoRRGevqpwi0XJl+cR1Lbr36yHRA8/v9R+QoahnWqwJOZOYFKRDVVBJ0o008NV7TpW7v+dEWEUd+ddUKqND3rTvLatgQKjmG7iRvD8dVphJPL0+EsSUJGSZnBf/M05LwlxXW19IXwQ7Sk5QMGIGQV6C3tyPEYyp7+2u1fOWb7qyUZwfamAQcf7cd51u2Q94KAH0i0//eDqKjIeK45qS0hEWvHuEkfMIkVMnNIivQ8nyEvzaGbDitnfx5ypMSO/eLbwVMuXzixU+IFw2Quw4KftIsnrpReUi8hh8y2IUFyPepPJLpuppyQQdgj2SRhEKHElFbNSqi5StUeLGhXZyxz1cO1dBNGjwoFpupsLOSK
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?WLi8/8nencx7DaNgDxni21CieI+vkj4R5sdgAgtQ8lQw1J8dW7OhXx/MPJF3?=
 =?us-ascii?Q?g3BW8JXwnZEGf4yoZlT+cSROE7SCxkRjeP3nGMGRZXELdTXoVXRrtCXk50XI?=
 =?us-ascii?Q?qUCNjgYztyOt2KjfinL5FiAtobrr9Ji4DJidQdJ6Vebh+tiFqnokaGbm3Ubx?=
 =?us-ascii?Q?A8ese2UBEra0dS3WCzVqBbPlI/H+aXCRdAxD7qilH43vAHsQ2CGvc2TVuTnv?=
 =?us-ascii?Q?PO2zwJMJWI/XQOxiMI/4Zr3zgs9pKGnnuRyAJb0NtD6uOXAAIbYGFC3iCnty?=
 =?us-ascii?Q?ojbElLWJ3a7jJHF23ZEpeXCoTg1rY2Jba4EIrZccQ7saHptm8N/sFfxDNWJi?=
 =?us-ascii?Q?NNEm1u56QbJL4KX9oxJsjMP3+jT3tfAd6kuI8Cn51Kgi8f9EjXdZ2rYER8cZ?=
 =?us-ascii?Q?xufjmG4mKoq5YHMQxnaJh9wzGjzCBS7fooqZSrwtxTO5lJq9VW2JJUfsgCWp?=
 =?us-ascii?Q?MJl3XX/aa5HzzpgG2/F3MMCc0Gy2Xjxuz26Y+UKXuYwRPiPXTrdTthQM6oby?=
 =?us-ascii?Q?PHTdsVY291hmRffRhQzkX9BQIw+HSpHg6Ej6nGaFMAOQwlGoKA7PitYzwCXw?=
 =?us-ascii?Q?yNgWLyr0zOVZl042AnS1CVz2LJIhEc5CDcr0yrb1j7lC0S6qJgVTiroWmFYW?=
 =?us-ascii?Q?AjR9PvnlR6XHECtpPXres1nWVhNKy3pc2dDW62SPDC5GDRssIPHX4/ElKJr+?=
 =?us-ascii?Q?2yJ2Jsrra+OvIjLLLvWvym7eypJAB3JW4JS8UgzRwYebTUawXE/FoAXeu1KP?=
 =?us-ascii?Q?+JP5CDqgWXxv3GY8HcAd6bwZlR+6XhDxW0Rlrd3cCAJOaiv/6GNj/6V38H4C?=
 =?us-ascii?Q?bwQavJvkAZWIgnTIC/abUqFAWgQR9zX5febZIQ7Kn5EtXuFylx3x9d3U8zbc?=
 =?us-ascii?Q?/U5hktA3swpmtawDz0UeCnvRvKj7ft2pBzd9PH+ZKBkJVPD3dO6KQyYAZdZG?=
 =?us-ascii?Q?ETK4y4KUobh9baO2Tg5G3syQGSp4u0jj1JfGyz4EcvO1cUNQtYVHz5fwRMnc?=
 =?us-ascii?Q?S/H7J16mHbfGWfXh0rbG2p1/IiLPiIuNHF0poUq40uZDZE4kPijWySvfF8u9?=
 =?us-ascii?Q?zp4CP5eLbNMJqie7Reg2MLbC93KYl20xKydYRw2dVH0+cUdWbpHpdE2sEZ7t?=
 =?us-ascii?Q?Gx/MwnQXirDuZHuubskbu+bC01j8TEcHSDKmNS0kTraD0rBXYSIVvLj1u9bq?=
 =?us-ascii?Q?x6WIlafpSlho6hbfvFmLLut5Ov0fQKrYXxZpoyzGwelYmwBLHaC4fyy1Hfio?=
 =?us-ascii?Q?ysD5xrM0nRcI7AcTKSBFvXL0TQogUet3rXDlZxVWFwH5/WdmWGKM7e59Lk7e?=
 =?us-ascii?Q?FX8PPjsLkd8jEYlMlNXSu30I78gX3DxbHHaj6Nf0Dh0a/PItnCSzoR5g2qsB?=
 =?us-ascii?Q?+H5+mLfN8lXyigoa7a9ncPPWVG90zzrLkgzlEx6W11IANUilzxwbuNBnHPMm?=
 =?us-ascii?Q?yTm0D3jfWKIG7GTL41JEiEG7LYtutlrq5PMlv6MapAM6M67VZg1mMRH/po/Q?=
 =?us-ascii?Q?A0Ne5Y8W5IY4nrg4uWi72/bfisLfSoLywL5pfIuypFiUI96/hMp9phbuFgvM?=
 =?us-ascii?Q?89tqAXuREIVUl/Rom/ZHVRzb46k8NKhOK067VkoHYahY+yj6zmAXsZTn/BnL?=
 =?us-ascii?Q?q1bUxu7fX0QNVWXoPyIYmNzyaYckPpECETktONEPs6vjUKKHvYmvYXoebOID?=
 =?us-ascii?Q?g0h9X6yHBwxim0AIHVN4KTFSn3ILhHlpj4rfzOjRd/ogmXYVSxIAp8Df9aGM?=
 =?us-ascii?Q?vwl6Vj/5Pw=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11332.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64ee86c0-f2ed-431a-41a6-08de8a9a1f64
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2026 18:12:48.8823
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t8bumcBrDZ6D+KEMUGc3IWB4OwUteB4xIBBFej+S205oVr137baC7o/+h0Ano2BoteGN0nNE8dt3x4HiXDsIQ1x74iyfRMS+QXmvgFpgA60=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB13065
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30270-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[intel.com,gmail.com,kernel.org];
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[git-scm.com:url,TYCPR01MB11332.jpnprd01.prod.outlook.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,01.org:url,bp.renesas.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: E61E232A7D3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

Thanks for the review.

> -----Original Message-----
> From: kernel test robot <lkp@intel.com>
> Sent: 25 March 2026 18:01
> Subject: Re: [PATCH v6 15/15] irqchip/renesas-rzg2l: Add shared interrupt=
 support
>=20
> Hi Biju,
>=20
> kernel test robot noticed the following build warnings:
>=20
> [auto build test WARNING on tip/irq/core] [also build test WARNING on lin=
us/master v7.0-rc5 next-
> 20260323] [If your patch is applied to the wrong git tree, kindly drop us=
 a note.
> And when submitting patch, we suggest to use '--base' as documented in ht=
tps://git-scm.com/docs/git-
> format-patch#_base_tree_information]
>=20
> url:    https://github.com/intel-lab-lkp/linux/commits/Biju/dt-bindings-i=
nterrupt-controller-renesas-
> rzg2l-irqc-Use-pattern-for-interrupt-names/20260323-002740
> base:   tip/irq/core
> patch link:    https://lore.kernel.org/r/20260322122421.132474-16-biju.da=
s.jz%40bp.renesas.com
> patch subject: [PATCH v6 15/15] irqchip/renesas-rzg2l: Add shared interru=
pt support
> config: arc-allyesconfig (https://download.01.org/0day-ci/archive/2026032=
6/202603260117.5j4fMpip-
> lkp@intel.com/config)
> compiler: arc-linux-gcc (GCC) 15.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-
> ci/archive/20260326/202603260117.5j4fMpip-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of the same
> patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes:
> | https://lore.kernel.org/oe-kbuild-all/202603260117.5j4fMpip-lkp@intel.
> | com/
>=20
> All warnings (new ones prefixed by >>):
>=20
> >> Warning: drivers/irqchip/irq-renesas-rzg2l.c:111 struct member 'used_i=
rqs' not described in
> 'rzg2l_irqc_priv'
> >> Warning: drivers/irqchip/irq-renesas-rzg2l.c:111 struct member 'used_i=
rqs' not described in
> 'rzg2l_irqc_priv'

I missed to add ':' in kernel doc. Will fix it.

Cheers,
Biju

