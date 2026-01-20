Return-Path: <linux-renesas-soc+bounces-27136-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iP6yAuXSb2mgMQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27136-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 20:09:25 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E544A0A9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 20:09:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 65AE0A42450
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 17:34:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43A9A426D18;
	Tue, 20 Jan 2026 17:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="LO4Z3sEg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011016.outbound.protection.outlook.com [40.107.74.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2AC4266B2;
	Tue, 20 Jan 2026 17:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768930488; cv=fail; b=goYTE70dSYR2YgFpTGq66klfEOCvZ1yMU5R0+vrF6D8Fx6C0T3GhEwFp+k3Y+0dhsDHWPswJM7uldEPrAcC5HpzdCMUD8DVkzR1pcr/z1iGwRILl107B5bTOdnJlRmYvqgzKXkg/ejmq3odV8jfbDdc9NPVmCuUcA9S2nYKIp34=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768930488; c=relaxed/simple;
	bh=4dNgcQz1xre+u1raDAz3fCIbe9sDrUJOIAJFtOfln8Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Dl+Y1Y3o1dYRML8X8e1sQLJRayLiFn3o2AM48kYBGogC9uSXhAzp6GdIh22E+WfSRXTIqJIl5e+NiuLvSKXVlTvRL4+hOz6bEhgwqdbheTPmdpWb/MbHXPR6hzzkDvrWW6RRLYu1gFaRapR2GCuL1ty+jlnizCgzcr5KVT8VREM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=LO4Z3sEg; arc=fail smtp.client-ip=40.107.74.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WVX0WEnkXw8cj/ouQA1Pr7oo20AKXH3gKmyX1oa/viTfO4POPLq9DbT4BCHOBFoc2yPBkag+yB/4LenMUSoMf3NpLrVrLH1t2Z+BrWhSVPIjyWXuoBJo21C/3cIOY52WHI6XVh9ha7tiHSxGwreSrOesKP0ajoQ7qm0L6xs42ft+gf/NCKbOeI3vRyuKcsvhQ3Ml4hDdho7nghDKGI8LTxbjA5ACA+KM1hWlOZwGN85OT7f1y3l6YFonQuN7dHvpey2lSmTX20Idjwkbb+CQPGHR6usXOCc8Rjw09ypKr3Whl/HqmkF2grg6gmA1rz8Q962LuzwHlK/08bXpB/gE/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QL4DuynvSYPHeAmj72J54zgYtsWFD72DB1OVFh1URoc=;
 b=VnKGcb90dZq6dZ95rHhgc4D2L9LHkw+TDFgjIC/sa7NUqp+glou4HzhSsli/vASZQXG7RvSasPEcpHdlD4EKy1ELZdH7osk9ELV7m+6WB3jDyKTk9/CG8jPdFILE1xSfRtAG2CJ7c+oD4DwMy7hmcmI0IeMVyWgPt08UbtFEWqA3RZNHA+kwC9JjmepT+zCCpWP3GSOLyP5zC+oX0T4VrSnrIQYUEBvI5R5qbeHM/C64pZl9BS68XuGXZMWVZ2dccRO/k/Ui/ESGFkMGC15mICpdGS8lZZgqcVS/Nm0Jed62kffCiHRP8vjOfFbgnO6IzsX3qha7DQS5IMRWicIeRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QL4DuynvSYPHeAmj72J54zgYtsWFD72DB1OVFh1URoc=;
 b=LO4Z3sEg3vErhPRpRXaJEYi17OPUjZkg9yftiVCiDUlcjWn3A2RrdvbWmSmliuPXHBdvK3Q4tTmMiI1rWBU5u+QssYVk1vamzGtOBj0Lxl8rs3BHdaeSrF4EK/F5vxe1pcZwUd2jtgGzVlbv0l3PP0SGEVqdZFC/HB3/I/1XsiQ=
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com (2603:1096:400:448::7)
 by TYRPR01MB15468.jpnprd01.prod.outlook.com (2603:1096:405:285::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 17:34:41 +0000
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430]) by TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 17:34:40 +0000
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: biju.das.au <biju.das.au@gmail.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	magnus.damm <magnus.damm@gmail.com>
CC: Biju Das <biju.das.jz@bp.renesas.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-serial@vger.kernel.org"
	<linux-serial@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH 01/12] dt-bindings: serial: renesas,scif: Document RZ/G3L
 SoC
Thread-Topic: [PATCH 01/12] dt-bindings: serial: renesas,scif: Document RZ/G3L
 SoC
Thread-Index: AQHcig143MCvKM4TQU+Q7wPyN9w4bLVbUfOw
Date: Tue, 20 Jan 2026 17:34:40 +0000
Message-ID:
 <TYCPR01MB120938959BF78DF930F42C793C289A@TYCPR01MB12093.jpnprd01.prod.outlook.com>
References: <20260120125232.349708-1-biju.das.jz@bp.renesas.com>
 <20260120125232.349708-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260120125232.349708-2-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB12093:EE_|TYRPR01MB15468:EE_
x-ms-office365-filtering-correlation-id: b970f0ac-e7a5-4a91-d0a6-08de584a3121
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|7416014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Hk8YVtYCHpR4CYWRSSitGJiaIhT1QnARdVtPcQXNTphuMmV6TR7ZoZIOAbCB?=
 =?us-ascii?Q?TEB5iCkWcFtJF+Jk0XezRYpLKPvno3uSwin533TLrPH1uXMGvsaQN58YjVPf?=
 =?us-ascii?Q?sunu9z4bCWGlKv6bbiDJfx2GnHt/rjmKZdh/hbxG9rUt9rJ9EBovacINqooJ?=
 =?us-ascii?Q?T48JOuFs3Sd7/SrXZF75vM/5/t1sEH+EY5+XG/Q1opmNsnbVcqD1PGzDG6DQ?=
 =?us-ascii?Q?iX5+3bSAbNMuNJuj2PiDPIhE7NWCsudIGMCqP15Hi2+bx4/SlpcC4l8+hSO1?=
 =?us-ascii?Q?kNY3XiOUffPDW4BttxyYoFlzjj47ALCI1BlDZ4SZbaepe5xfnHOtOD2gi/Ip?=
 =?us-ascii?Q?eF6v3NbUOAVuG8nReIOIAmiWcR/LAQRut6y+jHpnu1lvdrapP5WLqYeLmMF8?=
 =?us-ascii?Q?c+I2fy6Z5H1rIvG3Erfv8ZxvrgOza71NcEFXZtY6nbts+jMZpi/PDq7DHbll?=
 =?us-ascii?Q?9Ag94amP2jP6kV1O+/P5f4I2avEnnUDFipBxvfjjtllHeue8RdDPWDwphX2w?=
 =?us-ascii?Q?xJRtd8gozSJv2KbnHmtKWYd74ctChjRTVs2QShioczEGF/u51O59JrmWd0T/?=
 =?us-ascii?Q?+8pq9NEu5QZqT7lImAsCm/v3Glny/jlTv3+KfO9UCwf1+ANDPyAypTeJLpXT?=
 =?us-ascii?Q?IJBdrQFRW+gqCsRyQoT87Ey1hutAS9EWA5fxbgpFM2HcaZtkjDmjDMPncPub?=
 =?us-ascii?Q?E3tt+SUCxLNmxjB+s5P9bs1Ol/4f6/BHZ+kPgHMGyzv8rvYmlsa/DPgPkDjN?=
 =?us-ascii?Q?Ty5ubS+TxhW3FCrK5F1gj8GRWS8iRJyI8d1pZcNJjyPcnshfzFBdDHUooHnr?=
 =?us-ascii?Q?vnMNgX4TbAwwxkqazQX8XXGoncMzLH8jGVO0ZxQa5H1KcVSRFBka65Cm81xm?=
 =?us-ascii?Q?is0ykdd+SFIjH81MYb9Hz8ATeW6R0Hi7W73upx1T5u4hfF/siAXH1pin0RRZ?=
 =?us-ascii?Q?ERw/38lp8PPKNBA5W59QfKfailVvWmef32PKyA3UtjgjeZ1f2j5xkCkTxD0n?=
 =?us-ascii?Q?PVsyNHd6jo//2vEVectt8b7l7Q79eBLIIK5zMMF4l9kM9qQjZfWfoZEtjUCI?=
 =?us-ascii?Q?Sj7Qnmh9iAWggR8TpbVY2/GDBbx4p/gtHOtmMijk7Rnfgz5k5AoirtQEivLt?=
 =?us-ascii?Q?pP2nzipWpl+v2h4RgwfMk+1I7IWqSqlj6ZnKfDS0UmIQJSg1AhNRG0+RvsHK?=
 =?us-ascii?Q?ORTekLhdIUC3mw7yiGj9eYlbz91nDDs0vqWPJeifByoc2huiAHtHNgB4gvys?=
 =?us-ascii?Q?P05haio2/nn6A1EaQRdPqMnhrozL4tvmruDOmqryOGJFSWv9ZmFs4cHLxlc6?=
 =?us-ascii?Q?BKhlicK2uX+HUe4skYojUrEAInLzQy1q/Ip9aDQQlOhQrv6AexLg+U7iK6iE?=
 =?us-ascii?Q?huoIFQl6+8TVggk9CrnYMN8LNdif7sawi1KKkxEJUFYfcxYRKGzqGLrevYed?=
 =?us-ascii?Q?ZIgn/9NtI8tJxWJUBoD9cRWAJG79tCN5TGGbLqVMEyQ5CED4bXOCFMDm7/1k?=
 =?us-ascii?Q?CyvvpIL3sao+TwpMWtyXb7qt+jRbggDCZL9YiH6YqXLL2crWpdGoN5N4zEMy?=
 =?us-ascii?Q?qAbkGMdizrNNn+nPStDd8JEVGRa8YIaP5caRCCysvNBj4uHrcqnwk41dVbxg?=
 =?us-ascii?Q?1Yg7YzCEgA40KQ61Y9pQdO0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB12093.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Bu88F6lu1WmwpXa39RxdRRIueFn+5Z6TqnB89JjQePF8CgUhlt5x+amTZpSX?=
 =?us-ascii?Q?8Kyp0dk1xn0aX0JYZQ2lbGisZIg2/D6xq/MBrdYSbRLRJOUBkjYy4KIoqaZz?=
 =?us-ascii?Q?/O7bsM3NQc+FT0t0XXxfiXG9G0O02+c4SHlcHpFsEL72n5/jFRTGqJYSuAPO?=
 =?us-ascii?Q?eBHjZZaPvPOJXZrrM2HMvS1wq0MHZAA2xuDMnA4RWZUZC/KJNH2w8OK/sSxQ?=
 =?us-ascii?Q?8fCMr03/2u65gjoNbjnwUtZeSdTNWdcBIOP402Z8XYdTd/ZM1rdoHbSrBOzX?=
 =?us-ascii?Q?R66biVLMyXkHvk3U/ZOCbZFph0M+OYu+Dl17u5yzYn6YU9oVzHCupmbmAf1+?=
 =?us-ascii?Q?hmQwHH6IjhbYg1ee6pG5hPHq0Xj3sdlvP77bWVuF+YySqj5da370YTQkziMO?=
 =?us-ascii?Q?xtUPPfqOPKE/BdX9PnoTQcFEmPIBOAbutFVtaNXCA7XmVTC3VK10hiXWxvgy?=
 =?us-ascii?Q?zbW/N6mVoRR2qIUo/CQM491CTxPZcpcWvCtarh7qeIwCrcRAJcqOiz+fSAEI?=
 =?us-ascii?Q?QJAQ4uLwd2j5p48SwKILInqBnQvP3p/7PLr2h+2pO8OlUHvd5h1Rj+Kz9tg3?=
 =?us-ascii?Q?zZ26GdIuYDq7qNYKdWGiaqOKJuIMeiVhPkRJ7OkNXCAslevyUfaHlFUuXyKQ?=
 =?us-ascii?Q?haFO35xuUgtxM76h0o/BIBMrtG1l+rb61RxCdmjBTmr1Hvvdl6XhFiyhpbKs?=
 =?us-ascii?Q?5stsEBXX9ByODPBu1aATDFwoVs6rgZRusPCXWij/R1UfC1HASTkLKYcs8JNW?=
 =?us-ascii?Q?AM0wg6cy0AcAcmauy6rFoRuAvdpBL+GckATxGlDwBHnKkChMBFJMbhwxphLX?=
 =?us-ascii?Q?+mrFuKsfSQ/TdZDVxG/HpSsNCSS6vby7u7xPyxo2MgWrKHVTgffxxBigdXDP?=
 =?us-ascii?Q?zMjUnpmtdyJc8/tJVv9I9/Q/uveUYnXiArisCz5CkS+KP/V3fPnqSY/1ReuH?=
 =?us-ascii?Q?x0i0Daa6mwKaal4ofMtxAs66Iz6etP7vTwI2CDMCdPRWiA1+ZPQRK87yzC6y?=
 =?us-ascii?Q?/b1v4kE/6pFD0rcwAJ0uuvzacTygCmZke7doLkYuVLk4OBCuahw7F+obiqbg?=
 =?us-ascii?Q?bMpRhBw/nqfVNq0gmhoAr9kf9sCLktTXGX7jq9cUHwLmOrQaIJxpa/ikKxMX?=
 =?us-ascii?Q?enwjcvCj6kHuCBmR7Nz4X2X3pc6ZDk29Ugu1T2AAGDyMnmCMbwQkdpD3av1k?=
 =?us-ascii?Q?qHimy/OJf/M9C9A6PJ1jzPHpFcxLYc53gGJdO4ZfHk6Tnqh25v+hgWrUj0XX?=
 =?us-ascii?Q?AafB3LBFRvuQvHMz0uqgE3d4q7g/w5l2cNI4PwAOfe4X9Zqsu3s4N1MzIEeb?=
 =?us-ascii?Q?IYpgAst+McKUjzp/I2HItAwK/Z85DED92IKcde44k6QdAhwZavIQMXh+IgGM?=
 =?us-ascii?Q?BC1SQKTtM9JMe/c6YSTzJOmOOa8pDbf8ylOUUej7Fi0zjQ0x1/3CVxqfs7+J?=
 =?us-ascii?Q?62n19PFoN9NAZe3IzQHoKromffD5I4LLwcnTutCSyf+rvxG2/4f/FlYDQqMx?=
 =?us-ascii?Q?GQmNwpqMfk8EvA1KbfAs78UgEq0VqH3AFgO8js18eBAyZIx0d+7mre4UHHow?=
 =?us-ascii?Q?RsEGDoC4JNCP/xnvX8+MA8aDQjKyHlIk/fm1CedFlviQL3IlbU00Cw4y7RgQ?=
 =?us-ascii?Q?1dwRfRhTV3XzmieW9M7bhhY3b2QJ6ahUqEQOLBEMPxqNmoVdteBiT02F72Qe?=
 =?us-ascii?Q?uXCukPMUkJGk84pobDkxnJ9uImU6zTlUVPXZV8dY6yOmkkTHQwqtJY8Aj94y?=
 =?us-ascii?Q?VvY+Kua2U5MT4DkF1hXaUA1HzffYiV4=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b970f0ac-e7a5-4a91-d0a6-08de584a3121
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2026 17:34:40.8076
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y+YFPbke3Ct/IettJk4R0h5L7yKiZ4OmkrYsUq+dts3YmnhtQRfZYFgvwqmfNpY2tAxFWOK/9Hjbq7GbryfpY/I/K4EhCQUG/+C7Iw7ZLeA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15468
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27136-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linuxfoundation.org,kernel.org,glider.be];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[renesas.com,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fabrizio.castro.jz@renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[renesas.com:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	RCVD_COUNT_FIVE(0.00)[5];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[das.au:url,glider.be:email,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,renesas.com:email,renesas.com:dkim,linuxfoundation.org:email,TYCPR01MB12093.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Queue-Id: 61E544A0A9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> From: Biju <biju.das.au@gmail.com>
> Sent: 20 January 2026 12:52
> To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>; Jiri Slaby <jirislab=
y@kernel.org>; Rob Herring
> <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley=
 <conor+dt@kernel.org>; Geert
> Uytterhoeven <geert+renesas@glider.be>; magnus.damm <magnus.damm@gmail.co=
m>
> Cc: Biju Das <biju.das.jz@bp.renesas.com>; linux-kernel@vger.kernel.org; =
linux-serial@vger.kernel.org;
> devicetree@vger.kernel.org; linux-renesas-soc@vger.kernel.org; Prabhakar =
Mahadev Lad
> <prabhakar.mahadev-lad.rj@bp.renesas.com>; biju.das.au <biju.das.au@gmail=
.com>
> Subject: [PATCH 01/12] dt-bindings: serial: renesas,scif: Document RZ/G3L=
 SoC
>=20
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> Add SCIF binding documentation for Renesas RZ/G3L SoC. SCIF block on the
> RZ/G3L is identical to one found on the RZ/G3S SoC.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

> ---
>  Documentation/devicetree/bindings/serial/renesas,scif.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/serial/renesas,scif.yaml
> b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
> index a6ef02327be8..82f54446835e 100644
> --- a/Documentation/devicetree/bindings/serial/renesas,scif.yaml
> +++ b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
> @@ -82,6 +82,7 @@ properties:
>                - renesas,scif-r9a07g043      # RZ/G2UL and RZ/Five
>                - renesas,scif-r9a07g054      # RZ/V2L
>                - renesas,scif-r9a08g045      # RZ/G3S
> +              - renesas,scif-r9a08g046      # RZ/G3L
>            - const: renesas,scif-r9a07g044   # RZ/G2{L,LC} fallback
>=20
>        - items:
> --
> 2.43.0
>=20


