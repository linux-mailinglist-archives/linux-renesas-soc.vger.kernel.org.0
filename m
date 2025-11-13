Return-Path: <linux-renesas-soc+bounces-24575-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 09ACFC587D3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 16:49:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8358D4F79B3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 15:34:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3298133CEB4;
	Thu, 13 Nov 2025 15:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="T1cuwEoS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011014.outbound.protection.outlook.com [52.101.125.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E352EBB8F;
	Thu, 13 Nov 2025 15:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763047589; cv=fail; b=EZzEsi/qyH/miflQ7w+NaHYUsWPSar4RA7AfTAq9UV+ZWljobfcsCApUgosh5hLiB3fZh7EHbO7XYnk3kXqj3yVCzP+kdRIQ5STXQVJGMZE2vdM11gpbSH9ocbWs5XN9o6HFi1M1iTq5tKb8imjjlWG2J4CfUUaz89ICAIaJ/Cs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763047589; c=relaxed/simple;
	bh=Vzsm3Hog7P4uxG2SAKoQxkDrjj8bUeRZUMgyT9if1Jo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HAPdrd9JuwjOKG9vHlb+ga2hvvTznc4VOfjvi8lPnjaUFum7VwqzPLquV6FNbJ6CW1FJAO+UKosacjFnaiLT5KKdjfPB0r2hkYkYeOPLLNR72CUXb3DQkxZ7F90wKbeNXpp+XOkN425e9w3eGFM0G6R8bwEUtZeEeZMvCPy2dpk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=T1cuwEoS; arc=fail smtp.client-ip=52.101.125.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EFyNc1L+DEZJyJs9PapNFmK9c3rqjDJRJS1AaXTTG6HsGauqjmjCGPjsVMHp3OBo6gcKt9Z/xYCJOEwDyq0RAjxPHiyLMofCcTHqpwYy1fQjBs34HfvvE4KXynLmvwGTMmuZw7zXEEcvbj5g13Rf53GssufvPvs0eKMO/kb8pri8pDMAna8OWWNwnaJZHTSeBD0nm4dSKdeFZdgTlfB/e7DOGQ/Y92Uu/E/NM5nCPiuMbtwh7dYEKm8b+853GbbfUdlrS5Q62srcBpYViHgspiY9DZ87ET3bZTgs24ItkWd+1ndakqeqZynE/VKFyVUbXGyG2Py3EcYqEnEzhAKwqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XlBllpVpeH7bKboM5Ns+DJfLJJzsQ/+Z1S4QoezymYc=;
 b=CYjM8G1ZPMx+zrdrq97cJwQzV3xT8HCU9JT2OgN+gcLnkI+pgQGmQbVQpo1FEG0HY5qW4B10iCop1xuv4Fp5K80j5Yd75rV/A7g0TUEBmRR6zCFtUZABWuggRDz3J79ZIn/gkWkryZLgnE3Kbfv65h9lt1s459lV8gngcAEX59L/t90BRX1cyeTnENb3m225PvHn3LHcakzWlICRD8efdwae/K96fl9DfpNeTqTzgSjBJUt1qpdMCgyh8WrK3Xgw/BlF3qMbgSlnfo6Ulsiye8P4j9ujDlwZ6gZytv1AKqEl6ZXLSHiFAr6U3YGRs4FfhsMzeR4XIwnz50GsXEgzNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XlBllpVpeH7bKboM5Ns+DJfLJJzsQ/+Z1S4QoezymYc=;
 b=T1cuwEoS+neuIjMCxRIn/m36MYwnURXmb0d4XeXVY+nP74nD0D7UAWqzQgW/YweG4+mfzcIbyqXt2N5S3foCmq1fzQrd8ejB0rbAymPrTqCFrSKkXZ3KnrT7CJ9gmdkm7WlxftXjYCr4dXsr+I3tBDDTkmLEL0GwJp+lv9rUL8I=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYRPR01MB13342.jpnprd01.prod.outlook.com (2603:1096:405:1ca::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 15:26:21 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 15:26:21 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh@kernel.org>, biju.das.au <biju.das.au@gmail.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
	<jirislaby@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	magnus.damm <magnus.damm@gmail.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-serial@vger.kernel.org"
	<linux-serial@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 01/13] dt-bindings: serial: renesas,rsci: Document
 RZ/G3E support
Thread-Topic: [PATCH v2 01/13] dt-bindings: serial: renesas,rsci: Document
 RZ/G3E support
Thread-Index: AQHcSflYBx6I8PLvt0KOQ6ltTcZY6bTwzuUA
Date: Thu, 13 Nov 2025 15:26:21 +0000
Message-ID:
 <TY3PR01MB11346154514428068EF562DAE86CDA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251030175526.607006-1-biju.das.jz@bp.renesas.com>
 <20251030175526.607006-2-biju.das.jz@bp.renesas.com>
 <20251031000012.GA466250-robh@kernel.org>
In-Reply-To: <20251031000012.GA466250-robh@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYRPR01MB13342:EE_
x-ms-office365-filtering-correlation-id: aad1e74e-aee5-4296-f0c2-08de22c8ffdc
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?XrJUPFfRfngdrD1w2mVuQUs/7FHisekoGB7PLywHlXisKeNFTNxVIKlLMZm9?=
 =?us-ascii?Q?+19DtRGDzPQY02q1nn8CnYgvRoikQpBP+iupExJDeoNR4RJAtODIB764YvJ1?=
 =?us-ascii?Q?vXUx+8TwWtxmuUQyYBJ774m3BPoU01gHq/LKS/+ZUVnlSWkncY+eZtXEAFqO?=
 =?us-ascii?Q?wnzFk58jCkRsUlWVAb8DgRudPCeFPT0g7FuwM3L+92N1CC1H4Zq+nD0w+evi?=
 =?us-ascii?Q?bPdOIIuOBR+Mz7TlImgznKG1J3NJsOhxoIIATKaoESYgkf9J7tZDdSKV05Xr?=
 =?us-ascii?Q?SjWXJStuHOL80WbgjdymUxd9S0bxH6upgGnEcxLoEBj9T9D1QJcoy0qh0xGz?=
 =?us-ascii?Q?XkDNII5zK/NLjSNkF3UfGAxrAvFIVCUwDkt/9izDZ94NpqM7zCbvLI1Grc4n?=
 =?us-ascii?Q?pdCXfC/NjAVy+d1qlrK1SNIa/Ut9gejJdkM/Mtv93AGG/HsX3KdaIurKwaUV?=
 =?us-ascii?Q?JFdb1hLyV9LNcPJFZtOtCfq7vdk8pj73YzJX7gzCSS2bsSrzJaMEWMSzhuSE?=
 =?us-ascii?Q?+z3NOzTa/dqHBeWTe4/EBmdxLj+421/Mit25BcsUABxqzs5BuDCYGeWE/3k/?=
 =?us-ascii?Q?Qc+sTewfuU6lmMKNd2U9fY8ZgGd4nH/s+aDsyd/SY8scZwZIjJzLyqk4pv4+?=
 =?us-ascii?Q?IrPR79g+uoAfIcMqs+ByASIxCImYg6YossXUXdbp3NB7q4h5kG9nam3CyPP6?=
 =?us-ascii?Q?IJNyKwd7ly5gBtDt1eyX4w81sybQ36mE4CcjtWX6SopEkGoXrS3+kq4obHwt?=
 =?us-ascii?Q?jqz0xNKSsp9Oq/dtNtZIoaKnMGyBzKdoMHL77ukAblVshE0Gq++zN7QhMgGs?=
 =?us-ascii?Q?tS062gE+CShxmY+CV56o1B2fcc64bk0V8CYxkKfKVxgJYATKAJH0trWweNYC?=
 =?us-ascii?Q?6D2oBLJhlSnsPzHAvrXZhAH9nsgp7f5LIp1GO+SNncWjX84z76ISqBZs8RJU?=
 =?us-ascii?Q?Vj+AqIA3F2MFklns1X3D3MUiWe2AqavIrnwxEDoDSvRMg7qrvZRRNROo4TUr?=
 =?us-ascii?Q?b5HAXiCb/ooppti77Iv0J1bu8hjGUQMbIPEHygNxwz7Z+XvhGeZQRoGmVsA4?=
 =?us-ascii?Q?Z6rL3Y0G1Jw6tWfPc/jux5KROLGx1WEwssKDXcBlEmPkmvx/glAq/NiBmzKo?=
 =?us-ascii?Q?LTifH6UUqMbDxphKRH8Uhaq1XtbqbbYePLPGuF1Z6xe8dMNZZOPYygZ+E+BL?=
 =?us-ascii?Q?ebWdTzhB6pU3ssbcaDkHx2plLbBsnrM9O9OL9ZMohvGKBe12aVU0ztg7QeZQ?=
 =?us-ascii?Q?LssLq1APkk2NNVs5C09dbChjQAi6WZBvaT+u3dYsQMURvHUUzV49MVfYgKEL?=
 =?us-ascii?Q?oL9e1Gajx8NLJmVGL360swdKwT+I3QeCSDTxOpR7OxbOMC+85VeNe9thW/nx?=
 =?us-ascii?Q?PCZSjmL6T5SaDfKv/BIep55lr44CJr7n+lu6D1b6S5ew8b8TI89PS6fNYt3a?=
 =?us-ascii?Q?s8nK4kpNHrAClspwdgKwkVzztqi9VnbkPGroO6cNWHnJuWFcv6frmFL8jxbI?=
 =?us-ascii?Q?WX+LtKxqd9tMYhVtKYYhYTQqB3sR5+jgq4Uk?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?N0Ha5pmLPHmb/k9OVNBbNsC+9Jq7PmTTwLgTgnc1Y04+fn5SoOSFm72A+9Uc?=
 =?us-ascii?Q?0AalSikuQS1+1EygN7CAi0rxgzfzaX1oPS+82VxZ9uKl+6UMty503YN3U5e1?=
 =?us-ascii?Q?ReEGijfTMi50wGyiAADUkCFpj4cP0bXbiaoQP+sjUmTegAJUmoKC33tP4i62?=
 =?us-ascii?Q?2kuO/bSe8x3yYwLUXT0mkiv7gZqPddfQrnw0ZVEiA8VqgzODQ5vXMaxdOteT?=
 =?us-ascii?Q?9L61C+clVmNdWTeo5Hdc8YO1lphtjaomnaSmwT54VKigWP3HIRNv5PNJ5uI/?=
 =?us-ascii?Q?xGfqfwEbdS33O9gIlbLxwE3PvMZqftaFG9VZh+zQhnDqXSIhIe7Br6Gy95rQ?=
 =?us-ascii?Q?gHr+CZYWCsfhdUHkf+l+05iRnPcqdaKeHGo3HoyEHSxN+tBxxc2+q5Vdm2hr?=
 =?us-ascii?Q?XLFlvQr2acyOhLN0DJ6aC5VfiB/Eza7rUoe8M8t/Z+z+avkkLnzHvQsRBK/7?=
 =?us-ascii?Q?9pWp8HevNX1DksBvrvRFPsJT9S+b9ZLrG+LMmbUbl3nz5misSHF7ro8jues7?=
 =?us-ascii?Q?FowYaWUfpC5ykqjXQlQ1pThFpTI7ucXzAPc3c9Hg5d5d+tBvVZQCOnUVCUCr?=
 =?us-ascii?Q?f6zvfaLAsTJlj/l+UuEQ9xHR73/RiAv/3WZw5UpINwbYdXAwn7KATlLWNH0A?=
 =?us-ascii?Q?DcCoCHSSrZvJ2NdxuUWc8QN+5Uiy+rhLP5mUb00I6IM7r9GosD6n5pxlQFxZ?=
 =?us-ascii?Q?J8Cadl4UTx5CI10XWgH63uJ3ZTNm7WfQOY3copZ9+4WKnVAH+0XoE1boaqi8?=
 =?us-ascii?Q?82w8U03mft7ZQn+4Y5JLVzV+kKmhvXHAmNRqK2m/JeyIMFg9kIW0Txh9ZNOd?=
 =?us-ascii?Q?T1kxt1pflTD8eqkki1i+S9SuIvdJxpSJbFELecrc8Zgpl5WHsM4VrHg1nqOm?=
 =?us-ascii?Q?n0b8iBRAzqqDfWeDhz76aGhBL23GqyqCtckRVBbmmupv75Ppy0rGZStX9xRc?=
 =?us-ascii?Q?iPFK9QUvM1L9hCuNbf1ZOFoRdDJnP6TKkZtHlt/IdovjtI2PSTB7EM+scxuk?=
 =?us-ascii?Q?HfvtnC5eMW1A9LO/g7kdzpkqtUeGl0Pp8h8X/+I4ELlmuoLqbcP5yMe1BX35?=
 =?us-ascii?Q?pK/1AkHG15Ke5YFiclJye95mLkTlkyE98OaulSwvWN0s3A9rYovS03LD5H3Q?=
 =?us-ascii?Q?b741+UfDes9JoSk6U7CzH1ZsQ11kaJlVU2/ts5wlKtUMiA37SwHhP7W19j9D?=
 =?us-ascii?Q?PpK18KFpYOz0U/9cTP2NCd/IKj8PF+XS9G7nqlY19ai6PuzmCT+TysT3+Wvp?=
 =?us-ascii?Q?14xhhNVVQfffDh6ZQ2eGC7cedJRjRx9qcQkZvvvayrjooEWGKTB4naIoACCj?=
 =?us-ascii?Q?XiWtqTYbOnSpyg8b9U0QDMB/XIzVtjG60335e+Gac/fr62YTqwxQAhHnzy+l?=
 =?us-ascii?Q?KnbV1VPdUcBd8bSq9iY9OhibbDsiFOchj2umf5TTc1HTkswHPoIOSFVuxVf5?=
 =?us-ascii?Q?lCD3HEyovy3G2oH5Nl5TCR+YaZpbrVLAU1JFpsDNg9shR+8Pi5QC/VpOis+v?=
 =?us-ascii?Q?JlkJFub875uNWAz/REnnWwLj/wldh7Eu20dPkrOEDz16ODR5rME9Zobnyg86?=
 =?us-ascii?Q?cv5vTdxzoEx4hFNr6LWfplJ8QFa4IkRPI5pdgozao/KunApKVBKulVOw51kO?=
 =?us-ascii?Q?CQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: aad1e74e-aee5-4296-f0c2-08de22c8ffdc
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2025 15:26:21.4306
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sS5vLVGdfPT86U+V4Pj6fRVJkLFZWVLYlI80j6uF8ArYIKgeLI4Xa0qKCi1RxTdjj2PtAYsoycbOStPgWyztpHoXMpHjL+KlA0kbUkl8+AI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13342

Hi Rob,

Thanks for the feedback.

> -----Original Message-----
> From: Rob Herring <robh@kernel.org>
> Sent: 31 October 2025 00:00
> Subject: Re: [PATCH v2 01/13] dt-bindings: serial: renesas,rsci: Document=
 RZ/G3E support
>=20
> On Thu, Oct 30, 2025 at 05:55:05PM +0000, Biju wrote:
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Add documentation for the serial communication interface (RSCI) found
> > on the Renesas RZ/G3E (R9A09G047) SoC. The RSCI IP on this SoC is
> > identical to that on the RZ/T2H (R9A09G077) SoC, but it has a 32-stage
> > FIFO compared to 16 on RZ/T2H. It supports both FIFO and non-FIFO mode
> > operation. RZ/G3E has 6 clocks(5 module clocks + 1 external clock)
> > compared to 3 clocks
> > (2 module clocks + 1 external clock) on RZ/T2H, and it has multiple res=
ets.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > v1->v2:
> >  * Updated commit message
> >  * Added resets:false for non RZ/G3E SoCs.
> > ---
> >  .../bindings/serial/renesas,rsci.yaml         | 85 ++++++++++++++++---
> >  1 file changed, 74 insertions(+), 11 deletions(-)
> >
> > diff --git
> > a/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
> > b/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
> > index 6b1f827a335b..1c2ed4cd58fd 100644
> > --- a/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
> > +++ b/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
> > @@ -10,17 +10,16 @@ maintainers:
> >    - Geert Uytterhoeven <geert+renesas@glider.be>
> >    - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > -allOf:
> > -  - $ref: serial.yaml#
> > -
> >  properties:
> >    compatible:
> >      oneOf:
> > -      - items:
> > -          - const: renesas,r9a09g087-rsci # RZ/N2H
> > -          - const: renesas,r9a09g077-rsci # RZ/T2H
> > +      - enum:
> > +          - renesas,r9a09g047-rsci # RZ/G3E non FIFO mode
> > +          - renesas,r9a09g047-rscif # RZ/G3E FIFO mode
> > +          - renesas,r9a09g077-rsci # RZ/T2H
> >
> >        - items:
> > +          - const: renesas,r9a09g087-rsci # RZ/N2H
> >            - const: renesas,r9a09g077-rsci # RZ/T2H
> >
> >    reg:
> > @@ -42,14 +41,40 @@ properties:
> >
> >    clocks:
> >      minItems: 2
> > -    maxItems: 3
> > +    maxItems: 6
> >
> >    clock-names:
> > -    minItems: 2
> > +    oneOf:
> > +      - items:
> > +          - const: operation
> > +          - const: bus
> > +      - items:
> > +          - const: operation
> > +          - const: bus
> > +          - const: sck # optional external clock input
>=20
>            minItems: 2
>=20
> And drop the 1st items list.

OK.

>=20
> > +      - items:
> > +          - const: bus
> > +          - const: tclk
> > +          - const: tclk_div64
> > +          - const: tclk_div16
> > +          - const: tclk_div4
> > +      - items:
> > +          - const: bus
> > +          - const: tclk
> > +          - const: tclk_div64
> > +          - const: tclk_div16
> > +          - const: tclk_div4
> > +          - const: sck # optional external clock input
>=20
>            minItems: 5
>=20
> and drop the 3rd items list.

OK.

>=20
> > +
> > +  resets:
> > +    items:
> > +      - description: Input for resetting the APB clock
> > +      - description: Input for resetting TCLK
> > +
> > +  reset-names:
> >      items:
> > -      - const: operation
> > -      - const: bus
> > -      - const: sck # optional external clock input
> > +      - const: presetn
> > +      - const: tresetn
> >
> >    power-domains:
> >      maxItems: 1
> > @@ -62,6 +87,44 @@ required:
> >    - clock-names
> >    - power-domains
> >
> > +allOf:
> > +  - $ref: serial.yaml#
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: renesas,r9a09g077-rsci
> > +    then:
> > +      properties:
> > +        clocks:
> > +          maxItems: 3
> > +
> > +        clock-names:
> > +          maxItems: 3
>=20
> You need minItems and maxItems here as the range is 2-6 clocks.

Ok.

> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - renesas,r9a09g047-rsci
> > +              - renesas,r9a09g047-rscif
> > +    then:
> > +      properties:
> > +        clocks:
> > +          minItems: 5
> > +
> > +        clock-names:
> > +          minItems: 5
>=20
> And maxItems here in addition.

OK. Will fix this in next version.

Cheers,
Biju

