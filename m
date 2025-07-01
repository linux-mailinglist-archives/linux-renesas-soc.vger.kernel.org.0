Return-Path: <linux-renesas-soc+bounces-18943-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F939AEED6E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jul 2025 07:08:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8AE57189E225
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jul 2025 05:08:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7457D1DFDB9;
	Tue,  1 Jul 2025 05:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="vIwSmbuG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010019.outbound.protection.outlook.com [52.101.229.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165701DFD96
	for <linux-renesas-soc@vger.kernel.org>; Tue,  1 Jul 2025 05:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751346515; cv=fail; b=dkw25RMTAGucf3kQPnb19I5DCXcpvs4ky/GbNpJH5t30dpQDsVmzJykPIMubVbrH8MIbi5ckDiUr5LL3fF8T/MlTo38EqZfrvN8elTyhRolk5QqCMl/GzfIbjrSohPsdvCOV5YjRPO0S6gbJEYfjFbyQpg/xIzSYtlfibEd2ue8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751346515; c=relaxed/simple;
	bh=GEKkeMuH84dyZkTzA3GpXd0h96kQLoOXxK5LyGIUc38=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Yz9EU01eYiMWGKZN+1FbvOnKdiP/pZTazXxTsuLwtZ4yFKBS7oOnWQYDRrvJV4lqUbYhTYnrz0E7t+pP+aFGl8+0ZnVUixJ5vU6P1Sb4ZOxmVrMvr0SsI65L82Ei8npcFrEkFPgXG0uK/Diml3plvrvDOd5AEguX4suFGfrNflM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=vIwSmbuG; arc=fail smtp.client-ip=52.101.229.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AvQd5lPVID+qOca3PhXDJXPmpfW5WffWsCrYTBkp6Y5QyGG2A1yP5qvl6UUAFBPe6CIr4VgHDh2bsZYtOLt427VLEZteYp7hTLkLMjRgJ7B7+dJapRKTOLr15C/6J1BGxG8IkgNDXKFKP5g8z+bbAx7HMCEGD44rBISEPIr7J4fqE9jnpxpz4SuA5wKWa6ARDOjN76oTWFyKwLe4yXj5dSpxtEm1a94P5FXYktfHRMwrM9YbnPeXSXPX/nB/27+b/geKoHzyquRUHQ6WamC/27r3SIjzQEWG4IXB9eA78qdXUYkh3qcI7NqbG4MuZVwkr4a5UpA7F8/h1i9Wd1IDtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lNCnI3urxcG6ULIzroGIxDfW2WQ84yaUIK9B7IazE60=;
 b=aipjD0Z2NpYG63Kg2ul9YCGgbECsJ+IeZD3liwH5bVCkA3HobH0iq9VVTxNCaCjI0nDUFg1tDIpkROaDM0b5D8bEGchYnzgxSoZTFDX95Ba0Eoe8pthrnJiS4PPJ1WWrpgpBCADl6HFHK8nIHRvVKrHqsnP/cwySl1mQrLaMDUosHKAXRGKTJKTrv2gowYl+qSMlJh4XsKJlmcuZKEVTrKLpjj73xXc1LLE+DQ6J21ALxVI++PiLNANtPYI6hpAPKxEStDCNrz5yiepawTVP4HmOtQwSBrDeyOt2Rn8LpaFMjUSEFf7mp2A2NJtWfuTQ3GM6PIL8LpFI9ae1/0drfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lNCnI3urxcG6ULIzroGIxDfW2WQ84yaUIK9B7IazE60=;
 b=vIwSmbuGISjhBEB3tYbGDs2GuaaJxsUH1yaZgTthdEet57X0ODdq7jn9zANNg3P1K1+Lruq3CUjj0WF5qgdDtYHvVgJUfK/yWya4gcXtP9W8+zFsIKoMrjQUUddqpp2ePuYaf2C2w09MvBHK4rPlhuj/5zGBSM89jKCbBrcHpnM=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB9882.jpnprd01.prod.outlook.com (2603:1096:604:1f1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.31; Tue, 1 Jul
 2025 05:08:29 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%7]) with mapi id 15.20.8880.029; Tue, 1 Jul 2025
 05:08:24 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: kernel test robot <lkp@intel.com>
CC: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: RE: [PATCH RFC/RFT 1/2] mmc: tmio: Add 64-bit read/write support for
 SD_BUF0 in polling mode
Thread-Topic: [PATCH RFC/RFT 1/2] mmc: tmio: Add 64-bit read/write support for
 SD_BUF0 in polling mode
Thread-Index: AQHb6ZbcTwodwylbck63zUQYC+u2R7QcGawAgACc3sA=
Date: Tue, 1 Jul 2025 05:08:24 +0000
Message-ID:
 <TY3PR01MB1134662BDC486D781E5B263878641A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250630081315.33288-2-biju.das.jz@bp.renesas.com>
 <202507010308.KUbUR1fM-lkp@intel.com>
In-Reply-To: <202507010308.KUbUR1fM-lkp@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB9882:EE_
x-ms-office365-filtering-correlation-id: a3336481-15ee-4735-8182-08ddb85d4e6a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|13003099007|38070700018|7053199007;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?wx2CAbKvT/QiBUSuNC17dAsYs5D6zcioZYLhUJcV6tJAkT9xLxCx6NAeDXpJ?=
 =?us-ascii?Q?pQqlvlBNWarQfxlAH3i3+Qy5reqNodhQHETqrWggdU3x+1GXQIWmARw0IaUH?=
 =?us-ascii?Q?fce9dno9STdX0pWYOEehyg1w3Bc39nm/H6AktU7ugYIDu9X/YkxM+sRXXHsV?=
 =?us-ascii?Q?7r68v+jeJlqYF8qaQCG2zIFLZ17qI1ANhIZ0XMdVfqOA1aNCHDQlR9ERtoOS?=
 =?us-ascii?Q?in04KKv9u3flmMzAfmojB9GTncmzHAI1eZNO+/x6zYf5ET40iWPcaCipl3pc?=
 =?us-ascii?Q?EvGR+Ksm/jpIrsvyjxF4UIw3hadmihbtARjPAFQZRf68hv1P8LJpZ4ux2rjF?=
 =?us-ascii?Q?VR/kT7MFuc6PyzuD5H5d+1iy+Exh2/KqFBcBRkbmys84bUCHZrbpAr16zA4t?=
 =?us-ascii?Q?5uv5+DbWVFKmlrpcAf/BZ9pG3iYcwLPp3/MSCLeilgkKvmCPZlJwJZ3KMUU2?=
 =?us-ascii?Q?lQ+mkcuf06JhAm8BN7ZFsbjcDf/B+t3W3V0oyUG2YuM2dL39PaHXfPxmQ6n9?=
 =?us-ascii?Q?rCDGT00BG9Wo1FQ1j4PMEac1KLEOWy1fOLcY0fa2wE9g5t7To2UQE8w/hdlg?=
 =?us-ascii?Q?bDjPC0YGSAql9VMbsgOevyy0KHXIGN8RzY5uT9Ttf6ZnzlubgX0vWv7zg0Hb?=
 =?us-ascii?Q?VQjvFVCIcXMkebHh65SNAkvKH8180xMI8aQJFfl5MPTQLA9VVKAz6S8FFFe7?=
 =?us-ascii?Q?Dm1VKibwT3pVwTRQt9S595VLMaw1LOpKTS6EzzJ1lOWNHGTijBP37RnX0bl4?=
 =?us-ascii?Q?FFqGePZAqTN0VWQ6Y6TfGuohhtEAmTrnq0IcY32ZPuhUMAY7+H1MTy7EkP9S?=
 =?us-ascii?Q?Tje60oKtgfPnGBMQT/Wn+0xSs4ZsZ/3NLSMbxfZJP/Rlzkq8L2SdUXI5vtXP?=
 =?us-ascii?Q?or0mL/c+bmoCQ+W1k8cqxkKF+SZRLmOi63w1+QxF0icvu3JUSnYS2dotJS2T?=
 =?us-ascii?Q?O1qJERTQ94m8a8hLOkgyD7D1r9LqBnBmVaS1lN0dxVSKOWBxhrE4AkVhEB/E?=
 =?us-ascii?Q?zhBHPWCleg5s2OZwnHFfI8fFqBzJlaHlkab4YN9NdU5GazR1Y8GhGThhPcDS?=
 =?us-ascii?Q?RA9Urqh+2XoC5cMjaOw8UjIC/nIonPp2eEdZLLD/URDH0NJwV8hJS1VFzAD0?=
 =?us-ascii?Q?DQnxTEj9XpaK3IrTp8TLHUJVLPeism3QyDzQ1UIAZU317Sz5mT8neQzgRrvf?=
 =?us-ascii?Q?eNySM8kvE4VxtG5rh97PxundDQIWDBDxqX1HAth4w3VcxPXFcsb2JsyTmTkE?=
 =?us-ascii?Q?se8nCGhKThibyvTaAI01N3uh5S7D4xUv1gjzMrSRay6MCUVwXQms13t8+Ke1?=
 =?us-ascii?Q?nZzZB7sIbL2F0a6c+f03gk89rlPkkwktXMXM8wUL80C41dSK/uCP4h98TmN2?=
 =?us-ascii?Q?FA+lzMMlK//lHZSSIivnqdwfAZzaNo7pUP/lQjoi7WYVwXAb7vgP/AqHyb11?=
 =?us-ascii?Q?sbks1orJPLHv/Q5muS4i+69WiCPdsmUj?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?tjyg8iQCJUnFJseN5W7dwfYxq1jPb0MRKCEWZaTtdnq5ysJ3m2XK3psporKR?=
 =?us-ascii?Q?iqH/KQWS9Uaq8HskCAIkT27YlsspE2AUEp9t5+6g/wkpMosA+VH4Ua8blczm?=
 =?us-ascii?Q?csmWeqC5fqibuJFWcS0U0SWDlIXobgQTMUXr1Cyvd3aQJj3Uh3ZDtFHNpby9?=
 =?us-ascii?Q?1q6U89zHQeatg4WAboUE9hNdcTC/Y46O577ehk6otNmnj3mpQ81KXv0KEAlF?=
 =?us-ascii?Q?uVyEKUAzEbN67g49siUdPOyV9F08558oII5Vq2/446tx62wgX5mpXlJ+bjLr?=
 =?us-ascii?Q?Jipx5NUJSPqbB2qFLBbNTpW1meSSv9i9AfS6ifHjF1+U8OpvOZ04nJOR5c6/?=
 =?us-ascii?Q?Nb+ioi/34QWzy11TM1nFUG4tYFbY2MUTqqDVHyQERsGlSFZXBeWIywa0lbyj?=
 =?us-ascii?Q?njvS2KW/0JRzAAoKQGV4utyvdGq0Pn3arqFgj8X08k1ucWhbCIevD06grnn5?=
 =?us-ascii?Q?koSBck/lfUR1owXVbt0ePmP8DH0VJzTePRo1MQ55jtkKvxo37ws3bQFX0bx1?=
 =?us-ascii?Q?Ju9XL1idyaJCH75DCFvmE2khcrutbxFmYwbIT+6p1Tr66+cwXCMZ8MGzD5eJ?=
 =?us-ascii?Q?TLFK1+figymZYP1rt/2ba4ege1olTO+JvG7AdGO/4+Bs8OpIctfm63/eDrXo?=
 =?us-ascii?Q?fAwNtRFf05yYoBjZuFBOIIa4kBS7uPb9L7lRuYn4V1yKVA2Pq3Lik6fWGiK5?=
 =?us-ascii?Q?PiS0eWmCoU+BnlJnN4/hu7DqWBpsk2VtujvNgqk6sMA+hjxGqXE6oEzQrbQJ?=
 =?us-ascii?Q?OmZk+qIIa8vMr7WF/t+Izfc4wuHS3ShstKJcIZ9OW8sQvyM+uUtpV05yD+oK?=
 =?us-ascii?Q?1PBr1TPsvQnnZPVl9qrcbzugKTWdTZqOKjiWGmYEkKVbAdY4Yu+3SWVASNw1?=
 =?us-ascii?Q?uNPWfCUCUZvETk3aFNlAzMlVkCMWaE8tS+lcuFaCuBlZtXdlH20MjVMMLsQp?=
 =?us-ascii?Q?+H1pnZb243QrSSBtdaj1mxom8c9IcnDK8n+mbfvCq3vDk0+zwylXQFU4UsKY?=
 =?us-ascii?Q?4p7Q4zE+oRqRNclRjEi4f8MGyBeBxRnZNhFTPRNVqK/BgwAy77H2cXzZCJrg?=
 =?us-ascii?Q?eNbreVGCHEYAilWWSnjm/wkdszO4v3pApjEiJzAc2UUBgwqb/1ZXFqaTwQOp?=
 =?us-ascii?Q?+HzC5HtcUfiB67s5/LbN7Ij2DdLj+2EzRs5wh2fmRXNjjbD4OP+XOQgRxsNS?=
 =?us-ascii?Q?fLUsWgpQt59HVaTq4RXiVqyEHtagMd+g+ONscScExOLPKiy3c0mdOBuTZa1y?=
 =?us-ascii?Q?62GxXPN1Bh7ZAb7bnng7Ah7e2Lr5GPBWfmKS/73G4u6X/34FiEcC8AMEI2f1?=
 =?us-ascii?Q?JxxgRSCikpbLFRPnkzGLKwQLq+mdwpji2/ZDDqXHxaQT95wkS5i5ZPSneCoH?=
 =?us-ascii?Q?Lh6c5ij7lR7tm2E4VPEdUwhPu/HPNYnzhdNBUeUkUe0B3crEsfLKL8DHc8pV?=
 =?us-ascii?Q?zKXQJPMa3cRYypSQNCrhOCot2rOT9ORnbvMmGDB442fmPM7qkd9kH0ZBhKhI?=
 =?us-ascii?Q?Y2AXNFKbkc7tTVbFtX5NzE2/q/jtQ+BnRWlESs3zVShDpDAGcEnWjVQC2ouT?=
 =?us-ascii?Q?Xw2J4LG6xYcr8tJKUiGUh/Tzpwnb4A3Zh9nvBncGd9iHEMszDsvtROf3FNGm?=
 =?us-ascii?Q?kw=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3336481-15ee-4735-8182-08ddb85d4e6a
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2025 05:08:24.3386
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XFYrMqoXjlisLeqZzPDs0+0um3Evj+9M2k8cQVDaMnZrznP9YWzZ8XmngxgBaw31hfMu33kYbSneoesxBteZ5kXnkRrBaf+2hgyDHcP1a9U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9882

Hi,

> -----Original Message-----
> From: kernel test robot <lkp@intel.com>
> Subject: Re: [PATCH RFC/RFT 1/2] mmc: tmio: Add 64-bit read/write support=
 for SD_BUF0 in polling mode
>=20
> Hi Biju,
>=20
> [This is a private test report for your RFC patch.] kernel test robot not=
iced the following build
> errors:
>=20
> [auto build test ERROR on linus/master]
> [also build test ERROR on ulf-hansson-mmc-mirror/next v6.16-rc4 next-2025=
0630] [If your patch is
> applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in ht=
tps://git-scm.com/docs/git-
> format-patch#_base_tree_information]
>=20
> url:    https://github.com/intel-lab-lkp/linux/commits/Biju-Das/mmc-tmio-=
Add-64-bit-read-write-
> support-for-SD_BUF0-in-polling-mode/20250630-161511
> base:   linus/master
> patch link:    https://lore.kernel.org/r/20250630081315.33288-2-biju.das.=
jz%40bp.renesas.com
> patch subject: [PATCH RFC/RFT 1/2] mmc: tmio: Add 64-bit read/write suppo=
rt for SD_BUF0 in polling
> mode
> config: sh-randconfig-001-20250630 (https://download.01.org/0day-
> ci/archive/20250701/202507010308.KUbUR1fM-lkp@intel.com/config)
> compiler: sh4-linux-gcc (GCC) 15.1.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-
> ci/archive/20250701/202507010308.KUbUR1fM-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of the same
> patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes:
> | https://lore.kernel.org/oe-kbuild-all/202507010308.KUbUR1fM-lkp@intel.
> | com/
>=20
> All errors (new ones prefixed by >>):
>=20
>    In file included from drivers/mmc/host/renesas_sdhi.h:15,
>                     from drivers/mmc/host/renesas_sdhi_sys_dmac.c:25:
>    drivers/mmc/host/tmio_mmc.h: In function 'sd_ctrl_read64_rep':
> >> drivers/mmc/host/tmio_mmc.h:248:9: error: implicit declaration of
> >> function 'ioread64_rep'; did you mean 'ioread32_rep'?
> >> [-Wimplicit-function-declaration]
>      248 |         ioread64_rep(host->ctl + (addr << host->bus_shift), bu=
f, count);
>          |         ^~~~~~~~~~~~
>          |         ioread32_rep
>    drivers/mmc/host/tmio_mmc.h: In function 'sd_ctrl_write64_rep':
> >> drivers/mmc/host/tmio_mmc.h:254:9: error: implicit declaration of
> >> function 'iowrite64_rep'; did you mean 'iowrite32_rep'?
> >> [-Wimplicit-function-declaration]
>      254 |         iowrite64_rep(host->ctl + (addr << host->bus_shift), b=
uf, count);
>          |         ^~~~~~~~~~~~~
>          |         iowrite32_rep
>=20
>=20
> vim +248 drivers/mmc/host/tmio_mmc.h
>=20

>    244
>    245	static inline void sd_ctrl_read64_rep(struct tmio_mmc_host *host, =
int addr,
>    246					      u64 *buf, int count)
>    247	{
>  > 248		ioread64_rep(host->ctl + (addr << host->bus_shift), buf, count);
>    249	}
>    250
>    251	static inline void sd_ctrl_write64_rep(struct tmio_mmc_host *host,=
 int addr,
>    252					       const u64 *buf, int count)
>    253	{
>  > 254		iowrite64_rep(host->ctl + (addr << host->bus_shift), buf, count);
>    255	}
>    256

Maybe I can guard these functions/caller using CONFIG_ARM64 as it is applic=
able only to GEN3
Platforms. Similar issue seen on [1]??

[1] https://lkml.iu.edu/hypermail/linux/kernel/2209.2/04657.html


Cheers,
Biju

>=20
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

