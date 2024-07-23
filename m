Return-Path: <linux-renesas-soc+bounces-7470-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD6193A39D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jul 2024 17:15:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 67EAEB231E0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jul 2024 15:15:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E69C1156C74;
	Tue, 23 Jul 2024 15:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="BHTEcfJY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010045.outbound.protection.outlook.com [52.101.228.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53BC153824;
	Tue, 23 Jul 2024 15:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721747739; cv=fail; b=nuRsHjRLmGjhDMWk1Q2qvwtkkNcUWF5bnGK+PBGBdsaIrmpPeGmKqyPN8toPwlk4JhkNNeaYbopSlqTe8LI+f2DGx0kwcCvvyoIJKO+bwM9dzVNHEIakALaMnZD2PnUjuI+BmYQujpDwKXiNBGMKO5gLr64GaagTl/aQ0lmg7aQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721747739; c=relaxed/simple;
	bh=dhHQVM9s3GAt9PUIO1GXJ1SZUx35BY/YPMJCLss9kNU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lNUUvrPMInG0zfUuv1UWq3c74/cyvuLny/6721iP98lXAGJ3iN4/j6/cnSwn/EnwT06TsiblNxauTga6xTtQ7T52pd2xm09ipLc2sssdlmkXGIWnyJI6iNSmw+YJ+z011Tn8/1I7Hhgup+M9fLmzMB6xCLNOY5DS3zIATDhdJrM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=BHTEcfJY; arc=fail smtp.client-ip=52.101.228.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I0468oraAU2t3Gg8kGv4CUKvMn4Sb7wU/VXimcmwP6GvGszi6Io+H+yVPYxI/PN8OXtMWN9HqnkPe+3IQ9ZsDlZbfrp/30TidhSGZlMFMTfGPOL26nzrqdcYjys95f9rpqWkdozI32enkW5FLpedotsRoBd8MNs7vsrbS1yJEIcEgPJsQqN4uKJcbRoKwvoOZEhuU91DxTPhPNhk1oMc/wYaPtb2GK3nh6eHAoZYxOG0ghDcuIreUwgPnHwpsmehyMzigCtPzok2SB5o6EWBY6FxoHdOcbbe2k2wwekop1Plcc6eSuNClchw8cyegekAmBHvBu7L4GHQ/FuMyiN1WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dhHQVM9s3GAt9PUIO1GXJ1SZUx35BY/YPMJCLss9kNU=;
 b=teJTCyJAVwsGCJWPbkPeKHFNnVpTnlHqzy7iqin6oaAN5v4HXJToEdbVyJ/+a102c9hf6+ayY7NhK/s5ffLxeYatrcuaOWhYVa3a73BcJummxrruD1s7GL5J7V3Ht7IFkge2SlHIY6mIe3+jQZUGOZ28Hzc/lHafMVNopqlp1SBoZzQdR0Iky0TUF+3qsQaNXpADXajKFsOX02uPy9LUAa4kJUNjDLzmJutDvYrL6tunhF6+GXTMSOIng9UjMbb9kACJpyEGyd28jrHEwnsXiNIPWbLVUGX12//jY7/3rCHSxttPYJoS+MRwomMr99XJlPBhiWBa+odvquPQTGLPJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dhHQVM9s3GAt9PUIO1GXJ1SZUx35BY/YPMJCLss9kNU=;
 b=BHTEcfJYXJUl/ahF6mkoys2Lgz6jXIcddpt/izyscSAuaUAE4gTR7O+q4f4VuoztXK/JY4rOXs6RdFqeFwMBVpT8wEYONbSX7lcOz6RJK6PQ8gpdqiUGEe+cmLBmGhadRyAdt/CNQFDM/qeLsrId7spinoTcHD8UIJPYb5/wtL4=
Received: from OS7PR01MB11537.jpnprd01.prod.outlook.com
 (2603:1096:604:245::11) by TYWPR01MB11185.jpnprd01.prod.outlook.com
 (2603:1096:400:3f7::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Tue, 23 Jul
 2024 15:15:33 +0000
Received: from OS7PR01MB11537.jpnprd01.prod.outlook.com
 ([fe80::b98b:2925:d3c7:b4ee]) by OS7PR01MB11537.jpnprd01.prod.outlook.com
 ([fe80::b98b:2925:d3c7:b4ee%4]) with mapi id 15.20.7784.017; Tue, 23 Jul 2024
 15:15:33 +0000
From: Oliver Rhodes <oliver.rhodes.aj@renesas.com>
To: Conor Dooley <conor@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH V1 resend 0/6] Document r8a774a3 SoC bindings
Thread-Topic: [PATCH V1 resend 0/6] Document r8a774a3 SoC bindings
Thread-Index: AQHa3PCMdWZrnw5O4Uy+aPw1yyrNy7IEWMcAgAAPBGA=
Date: Tue, 23 Jul 2024 15:15:33 +0000
Message-ID:
 <OS7PR01MB1153788AED21AEBE635C1312CCFA92@OS7PR01MB11537.jpnprd01.prod.outlook.com>
References: <20240723110733.10988-1-oliver.rhodes.aj@renesas.com>
 <20240723-resolute-pavement-ef769cb0f732@spud>
In-Reply-To: <20240723-resolute-pavement-ef769cb0f732@spud>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS7PR01MB11537:EE_|TYWPR01MB11185:EE_
x-ms-office365-filtering-correlation-id: 17782688-873d-45dc-74d1-08dcab2a4c39
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?aTD/lJk1VuAqu6VYdWPdsF2Zv05FX9cm3IEW1mjG5yTy+mCRgvp3Kfco17T7?=
 =?us-ascii?Q?FrnNONAugL4i9GasI5UUkIv1ZY8II7nplozPz3YC5/wMu6rVqJOEwi9hvOlg?=
 =?us-ascii?Q?QVuKQ072vmj19Gt19bFhUXo4ayc6Bu08KXf5UqMcRaOmnXR3sM9rwid3B2B8?=
 =?us-ascii?Q?TlIiZvEviWdMStzMCxU+lwrn6fvwd0tWpAGS1m4EI7W2Y4gEaJvhbUURTJYL?=
 =?us-ascii?Q?cu3E9ABZft2WjyUBpu6EnKXGv9K3USuS+8OB2q8in4Fq7uAhfHuOZValM+ER?=
 =?us-ascii?Q?NyyQEw8S9webJk4h5b2VTWCfwPzuCC+FIg+TlvavE3oj/mbVgaHsDOp52ZhM?=
 =?us-ascii?Q?23FuMDb3dU6mYGS6cc2Sk2xaJ0gLdEUepjru3eqGlYjDlUbLnwGAZmsJnJAx?=
 =?us-ascii?Q?IUEA0OdTybUOWlxRVuz/u8FhR5CU1Hd+rwEMeq+DximClSG+F+z/1T25S8ze?=
 =?us-ascii?Q?pVNUpZiuSE/4gP11d9iC5NiGxo6b2+MsbK1eTwjCSAO7mErAx1KwGZkgDx7n?=
 =?us-ascii?Q?Mzq9hrqHaRkaDt281+5sq1pCUZZt8z+o2b7GKrj6GbPZCi4UVxY8NMVU5PAk?=
 =?us-ascii?Q?5OGUw5hua+Ok7rDGAnyHX4w95XIMDDPiuhtgUAnPxU5Go+Ro+fR7hALjAEWG?=
 =?us-ascii?Q?KxVR0j6x+Y0QbfK0g6pTaHrUEZL/S9mqDQqlMXGumygIbO+STTr1xXvb3Alf?=
 =?us-ascii?Q?V/4MdNRhhs/n86g8gzAKGAuviEyhCe4fXVQ67OFpx2K2Yl9MBnTjm+ZEo0A3?=
 =?us-ascii?Q?UUcY04hXkVgEeYGXUq4LYtqim81519iSKlmT3NBHUFV2zvN4LB9L+BDiXYzk?=
 =?us-ascii?Q?nbS0pA26ZcmOrO0kRjWpCQHkaEydgmszGWeiTIE+nYdwjGgzgnPiqJKiubnF?=
 =?us-ascii?Q?l37B1hDg5kzsYnvhbvNR8jmnRz0dJ3nNbCQbPQzmbZahrXAIJ04ssTosOhMo?=
 =?us-ascii?Q?pGNqQGNUlL7GpGsK/0gm1eJwv9AFH3CmnfZY7dEraYCxIRcVfuiEUc/fVo+R?=
 =?us-ascii?Q?tFg9poj/l4zZpUY38HqVXbo/qSEAgFdy5knOUxWqJmRbIjOTfF16FsQMB3fF?=
 =?us-ascii?Q?jVTQvYGzajToJdM5AxFWZ/Sp7vvqXXr3gfzPP+8KSEPa4aRlM6TIsBn09DMx?=
 =?us-ascii?Q?d6I4xbFMN6knzB9IHorsOTbxkqzDS9clmWSEql88lpGSTN8VejnFfg8KwbCS?=
 =?us-ascii?Q?NocBkjwynLyF8NBgdqMOioM298HjrxZZp2jkTSp4helSLP7B+2KsKiACM9Kl?=
 =?us-ascii?Q?PpIz0mIe3/Cl/GwCOBJkBiuU3mHqVkXf7nlnJjSu26UeEdoT1QVo1fgbGoBw?=
 =?us-ascii?Q?5+hHOPwSFNTw8X/yuQrFyGRMM4oFyzsui+RJjC4DcCBaOjUDlYPdPbeLIa/f?=
 =?us-ascii?Q?8YKIs8SX/30Sfod6qbrN4lSf07YqrkqjT/EAALKrpNbzetnlFQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS7PR01MB11537.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?vvYyTP+HFn9H3wl29+qIHh2USyAsYzsU3JbcIRKNBeY5xYyoUv15Aj2wYhZS?=
 =?us-ascii?Q?oRIQJ6dOivNaFj+XrdDPQi6gtwMFRxSJ7X3Lj73ZklhQC6EeCycODWJgZpBo?=
 =?us-ascii?Q?S5+bLgO1DML/88E6dV96sjN0a1mNziPMn8vkCwT3i03S88x34fUPFQqgqodf?=
 =?us-ascii?Q?2tRWZPvaPsQFGvfVJCnLPG2yYAEPc0mw43N4Dta9utcqIBNRX2Oe+Ka5FLWp?=
 =?us-ascii?Q?w2cAYqN0XNBXwIwJvjjzljSnY0wLdxvlYRM4/Qwyjzr0stbuExqlt908TrtD?=
 =?us-ascii?Q?0YboSGQy1BLjVlRCIZvV83Feb59TIBqmXBixpJWZwXe39zocnCvbOZ9wltK1?=
 =?us-ascii?Q?TuvOJbMNEc3lNheGeQqr2M2K1RFX6S2JNdCyY2/0Vxrq3GSeWiJwLxf19pr/?=
 =?us-ascii?Q?2dHq3VDc3A9oQWB+dm6f55nTe+ns4nMgWpENyrIR0iZBQ8RIQ2i7fMU2RI4w?=
 =?us-ascii?Q?uUN+nW4WJS30GyTNL0dtpFQ9jsUDx4yJiF4eHEuShDqffRyAPd6ORlctnug3?=
 =?us-ascii?Q?hv/BxL1pwcFUpKDQczNxpiryGEO6YNRxBdLJT7VwB0Lbd0sPrD0pWUjbXORg?=
 =?us-ascii?Q?+LrlnFJTRy7I1TXo1+jCyCHve49MbgdXz4IFXjBICQ+KDRYOPgH6p9gGcc9A?=
 =?us-ascii?Q?kwlYiWhJdp0/+fqNO66lG0V1ZrTAPZgp+vb4Eda8aEvB4AO5gkL14rMwZ6im?=
 =?us-ascii?Q?UyUu2nuwznGM9lLSXBC6CIQ3dQVpTDYvZmP7i8rABfBR5T+uhQ3EupLdpLKQ?=
 =?us-ascii?Q?C4HyHfO6rnD7Ua9G+kK2i2uhouVE9m8DLlXTmiO4mL0j42PN3C4gpvuKNGcw?=
 =?us-ascii?Q?TqdL+REnTfI8Oo+r0umhPgQaxk0HW8XnY3wTWi2505uvUyBBDteg7fJcZfps?=
 =?us-ascii?Q?z1cCDZDRUxQ4g1SVAamDOS3tOhNIhdqtLMW0rrWv37fwrJQB6zJH86Y2trV8?=
 =?us-ascii?Q?u8vViy5Sc/xzllmsgUqapkxq4IvoOiVbI8B0Kc6d9hU2t0judOlMHSuYUUBR?=
 =?us-ascii?Q?z7DochiwrCGabJiQtgY7KWTfjdAKPlGfzl4LZXwBYtDbAmwwwhSMl+QGoyrr?=
 =?us-ascii?Q?m5ZBtRDwrEAd45+oZ59MANy/dK3BXC4OBlJ1FmWZ6GV0zq52zawc93P1cGOP?=
 =?us-ascii?Q?U+e92T6e2ZCv7VuosJFdXYM1LnC6xt+bQOdC2nz+Z3Ao/BxBJpzhnSc+lJIe?=
 =?us-ascii?Q?2OaS3pjXI3zJHIFvJ6RDw1eVz9u7CMBOnULB/atDLwBvUDH5kfpZS2boQIPw?=
 =?us-ascii?Q?FOBSkuUCdZeajBqKHBkBa8zOCB8da8NMMF5BMiYKAZDQwmAoMoPDwDpaLoCI?=
 =?us-ascii?Q?hqZqgsr/taYQ2noYZdE7PN1mW4U0VJNAG9z4Ssr2GQGWrFIZMuSA5F4WoQLz?=
 =?us-ascii?Q?0Bt+rnrOIa2FkjYxkcQLqPp6g9vPtVOwqr0poajg3oPWLvyxHcTz6H6/8Vcy?=
 =?us-ascii?Q?m3hCXqeFJRBB6nY0gaVGQQMyhRMoBmOnmyAhaQsqntDH0Pa2M8AQ8zxeJ9xG?=
 =?us-ascii?Q?WZIaWmkrZZ8y0wMNNspDAL4iZOvWdFkds9/dHY1JVNHlKpvN38ySpilzqPtt?=
 =?us-ascii?Q?SYG/2gb1b9xnrQKFTctfqazhaLRqBqsKXbfSgWA0KjqAMmfwJ5jFcMVQbHqD?=
 =?us-ascii?Q?sg=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: OS7PR01MB11537.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17782688-873d-45dc-74d1-08dcab2a4c39
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2024 15:15:33.5144
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S5P63sCNEd71iL8aDW1QNdRUtogiWJBBVdx1FWSV0LTSxt4PGSSh8gzeL8USX86SZP95SyvoFzYt5DAi5V7YAj+2Wd6HZkCU/ofoi0xHLr0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11185

Hi Conor,

Thank you for the comment.

> -----Original Message-----
> From: Conor Dooley <conor@kernel.org>
> Sent: Tuesday, July 23, 2024 3:05 PM
> To: Oliver Rhodes <oliver.rhodes.aj@renesas.com>
> Cc: Rob Herring <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.or=
g>; Conor Dooley
> <conor+dt@kernel.org>; Geert Uytterhoeven <geert+renesas@glider.be>; Magn=
us Damm
> <magnus.damm@gmail.com>; linux-renesas-soc@vger.kernel.org; devicetree@vg=
er.kernel.org
> Subject: Re: [PATCH V1 resend 0/6] Document r8a774a3 SoC bindings
>
> On Tue, Jul 23, 2024 at 12:07:27PM +0100, Oliver Rhodes wrote:
> > Hi all,
> >
> > This patch series updates the renesas DT bindings documentation for
> > core components (SoC, SYSC, reset, clk, pinctrl, scif) on the RZ/G2M v3=
.0 (R8A774A3) SoC.
> > This SoC is similar to R-CAR M3-W+ (R8A77961) SoC.
>
> Your commit messages for any binding without a fallback compatible need t=
o mention why this device is
> not compatible with the !v3.0 SoC.

For SoC identification, it is a different SoC altogether, so we need to use=
 a dedicated compatible.
For SYSC, it lacks the A2VC power area compared to the RZ/G2M v1.X so we ca=
nnot use family compatible.
Similarly for clock, it lacks some modules such as the FCPCI, so we need to=
 use a dedicated compatible.

R-CAR M3-W (r8a77960) is similar to RZ/G2M (r8a774a1) and R-CAR M3-W+ (r8a7=
7961) is similar to RZ/G2M v3.0(r8a774a3).
So, I referred R-CAR M3-W+ bindings and made similar changes for this SoC.

I will update the commit messages for SoC, SYSC and clk to reflect this.

Thank you,
Oliver
________________________________

Renesas Electronics Europe GmbH
Registered Office: Arcadiastrasse 10
DE-40472 Duesseldorf
Commercial Registry: Duesseldorf, HRB 3708
Managing Director: Carsten Jauch
VAT-No.: DE 14978647
Tax-ID-No: 105/5839/1793

Legal Disclaimer: This e-mail communication (and any attachment/s) is confi=
dential and contains proprietary information, some or all of which may be l=
egally privileged. It is intended solely for the use of the individual or e=
ntity to which it is addressed. Access to this email by anyone else is unau=
thorized. If you are not the intended recipient, any disclosure, copying, d=
istribution or any action taken or omitted to be taken in reliance on it, i=
s prohibited and may be unlawful.

