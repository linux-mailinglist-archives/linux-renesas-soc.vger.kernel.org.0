Return-Path: <linux-renesas-soc+bounces-21661-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 15199B5005E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 16:57:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A90263BC284
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 14:56:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55E0E2DA75F;
	Tue,  9 Sep 2025 14:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="EfDT2f3t"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010047.outbound.protection.outlook.com [52.101.229.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF13338F32;
	Tue,  9 Sep 2025 14:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757429818; cv=fail; b=lmTqDknDAf/Df8VlhLmgrWMGt7JlRbwXloPgbIAYFRWD5WHaMjXO0Fe0LLRfdioOK4PPl6JVUaaM9WFVSa1YvfgeGEyyAk6vGHOyAE2OU+jnvlLlK0XLIF91h+dNFsH2YFon5Rktgw6IgK5E307OyBUXw2pXZzR5ydGRw36FRqI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757429818; c=relaxed/simple;
	bh=ziqGvB3cqKxEIQrBom4o90lL0NZBEOBZqtQX5Bf+3Dg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pEBKjXIVGW0U94zhU9M+ct/H8HT6ttRs7kC8ECGwsGZ2DZvkCjNLUVBWCPQYO9Fn3N1rPxlnMkavJB1UO2reaN7nbYcAeiT+PEhIqk45B3HSo0MpNZPMkLMqCWiLlKDl+z3NNsCVnRYxUDYIw6zG1hmllohYFgHnlt3pijexC1s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=EfDT2f3t; arc=fail smtp.client-ip=52.101.229.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s53dzDngFMHj5TD8Vq4CMgyru4kxEJEx8Vpq3HoBwaUR1ByO3DTIodN62LutGGdMnYkx2mAmqSIBfqboRTHGnqU8zS7TU1CxKl0RZOcPRld8JGW8KRDVgfRdg+iOdwl8paXDboiY6PuDT6ivRiMjW7Z4v2HQvTWT465QftY8kcs/OV5C8ORTDsJZkILEiAXj5i7xSov2K98WxYbCe739TgDLB03nT5suPadvG5Q/TBbEn/V4SlJ0b4AfGUbo0QjMhN62pRO/mMVTKj/ex+KpOKjSFGMSE3xBO2b7hfb8QE846YEgwTD54nqU04U5/k3mnCUqskNCmyP84ir8BQ8o3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9xD/fnPIqCGKTifniqeP2xiRxvVg1nSSaW6ITu2R0Yc=;
 b=xqfdwauJu9hyZuMsytHgdPFjLowFzpuzLQohErJfjDqlUtOplsQiUN4nZBxrhDGY2EfDXgQ2tDmAM4zAY1ihBiPghj+7LODQ1Oov01Lr8Vj+dUxTHjEkfeiD7zEp5blfL8EvxMfiG7gIWNU3tNXItqQ6MhoclDWj1tZp4tgrn/W3neBpcoFjs8Hhe7rAd11rroDM2ZbuJThgAzkLPcqgSWyB2JMZciUCEYkszwIxo501iwy6qRFhgCZVq+FSJRX7qZhMGKxEjvRwFCFoDlp98tqq+ItQVWWijactyClsZiJCs63QLFBKBNkTvjCf4rbDYlrzrNSMyw/deWCARGoo9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9xD/fnPIqCGKTifniqeP2xiRxvVg1nSSaW6ITu2R0Yc=;
 b=EfDT2f3th6UoNTAFp28WR06ArMtE/afQrLQ0KmF3xNbAcVUCMtQw/LI8lDjQoVfhmr8c1d4KnWF7s3+wfZJ0sZkk6qav9vZj79KogNdsHMaX0fCCEKlZdw1ommOsoHTtnMYTXsDZLRivW1kRyrVGVeLOpK1g4uZWjtlr4ONmTzY=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB12778.jpnprd01.prod.outlook.com (2603:1096:405:160::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 14:56:51 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%3]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 14:56:51 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh@kernel.org>, biju.das.au <biju.das.au@gmail.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 06/11] dt-bindings: usb: Document Renesas RZ/G3E USB3HOST
Thread-Topic: [PATCH 06/11] dt-bindings: usb: Document Renesas RZ/G3E USB3HOST
Thread-Index: AQHcEfZvZDRnta0l60q2xS4yxsPDG7Ru3X2AgBwyLeA=
Date: Tue, 9 Sep 2025 14:56:51 +0000
Message-ID:
 <TY3PR01MB11346FF949FAC9635F8374BE3860FA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250820171812.402519-1-biju.das.jz@bp.renesas.com>
 <20250820171812.402519-7-biju.das.jz@bp.renesas.com>
 <20250822162043.GA3920949-robh@kernel.org>
In-Reply-To: <20250822162043.GA3920949-robh@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB12778:EE_
x-ms-office365-filtering-correlation-id: 86641415-12e7-40d3-47e0-08ddefb11bd1
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?jFjzxBBl0zo77s/IkNcYcy50gaKsIg/8C+1qWXUjfkonCIHuSJDKdf7Nll6k?=
 =?us-ascii?Q?jrvc5njUOLfcU8cgHPUUL9b1++G2zsHzBwBOIBE9BZ3Zk4P3s0fF6EndMalY?=
 =?us-ascii?Q?nbXT+cZDRi25ULphTw6/8Sk0woINRRbKEsjfVUge8y3BiwSzRPzR51DxjNeh?=
 =?us-ascii?Q?WZkj6aMujMOoqfzW+sGNtELlAV8mZB8C16WSxhscNavixuQ8+RtXwSFNBFrs?=
 =?us-ascii?Q?N/ecltWZnTEuHBadnRdlMLGyRCOQm8sKw8EcBgfW9jDjz7bdvC5FvGt6ByVN?=
 =?us-ascii?Q?8jStchg6F7GbUJQlDsZ1dEAisS93J4milAtIo7V+auhKSF/eI07VaNXAy+ME?=
 =?us-ascii?Q?cz+xSc1HU8qrkl6lwCtLSUe786MKEK/rhBuK4nVzCQOAzUSu3y9vHXmlsPsx?=
 =?us-ascii?Q?pwPm50fjVd0peP2nEDlSF/hmUh/vUHih+mBYsGJuru2y/1T2268iqSwhP1vd?=
 =?us-ascii?Q?btnuOVO4PRYE4dCnAjG+GUaEwpyCbIcYcZBsV9tRIx1ABa6Q5LEQrkE3hYHO?=
 =?us-ascii?Q?xAwf6Fa7ofBQsFhqxrUfqsVTiPwPRuriP71Cu1Suok2n5UBOj6nNSG01IGuB?=
 =?us-ascii?Q?bi0TOhMRP5EsZluX313iq1jFkQf2KbCm04YfXCl5JuqoLdzVosnM00C+LIP8?=
 =?us-ascii?Q?59WG0nCbEwx4qtk9++Tm2HFu9pc17AsrNaLnQvYacvZisDCDbxxDxUwGRbzn?=
 =?us-ascii?Q?IyoXdS8Q3kGUABhzuXNRSvxAuURQOrAsckDi/ED6TrRYnHm3GB/xTfgsA+yR?=
 =?us-ascii?Q?xjaK6LGetPJ7QblPY+cjxkO3DLhCuk9qwdcdPvY9DP0n+BP8bW5O8bXlWO2N?=
 =?us-ascii?Q?fyYjyHOJdGlmWWhDRDo0PkEw0gLgTFDW3IEp4nppDAvjbv4swmwctKhvZ4zo?=
 =?us-ascii?Q?oddLVcqLOykKd8MwApu2zygCbCD+oHZFvN6jAzOo/cEuoTmwxcBVBIK3EDvA?=
 =?us-ascii?Q?MovHTcOb4XWcjVzV59O51YVBgAv4ncN44eDrydATl3miX250f+i5Tiwh+c+u?=
 =?us-ascii?Q?u1hVp5nYDBssMxYeHsza7njRxzo7kjvT4XToDC0mLrwIOT4blSJqZN0rDdWA?=
 =?us-ascii?Q?j8RLAgWK57vTuwguUbwgXeEZ7dN/76c6abw6AMZceiFhuGoJbdWLA3XOt7QQ?=
 =?us-ascii?Q?QHzHo9RePzu+nRJdGI5g0Wp0y+SeS1o9hySOdtgmR94FBToDd5HCT3/V1c3h?=
 =?us-ascii?Q?BBfQo9PDjWnc2QErmvx7yxoGAoKrSY4n5UJ+ZrEsGaAwFZnaVuken1PAsGqi?=
 =?us-ascii?Q?LDbxJOWqpV/HNacJ437zE1JNGE0rJS5JH4X6g7b734orBjFTGU5ozORmx1aL?=
 =?us-ascii?Q?Qn8L4mWNnbOSog/X1EVrNDDlsVTELinvgtOwXyagGkGP87VofuPXqcp1fQpY?=
 =?us-ascii?Q?m3OdMcHCW9J5sAteTo5V2yNER3yoY579Go7Qu0QR2UaHGlXWmQa1jpMVNWcY?=
 =?us-ascii?Q?UyvbQ7j5KQ8=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?A8iFc6LGxoOqUShjBQsfUCwT83e9dyk1O+eErtIDG4zBuSgDzHjO6UMq4OFf?=
 =?us-ascii?Q?TOw32c8sd0gQOvFpvmp36a2iFlWw9y2y4HVcxI3SwZcDAY8rsvrgyx7EBbwY?=
 =?us-ascii?Q?YMGZe2UDJH9+Cm/17Nj18Z+d1Q8Y++VTYlO58Z79IdLgwLSF7+TJAerPRaGp?=
 =?us-ascii?Q?6/wpuc0/LHV/llI4Gt0c6aph15vsSwJYsoVBNk7sKl455os6WYXovpM2zvsB?=
 =?us-ascii?Q?ctC2IAn4WKqk4ygYNUj5JXaNjN+il0ZInaE6oAznLy7OLJwrQxClC5nfiOwz?=
 =?us-ascii?Q?pNytDwWbBKUzohg0UTg8dI4xHY6q4hhrN7e/VBH7UOxv8GxrzvP7QZ4bslTW?=
 =?us-ascii?Q?zFv6R/AErUq5wsyJUyhT7QS0y1snzFMtIwWkbPd8Z0zPGS3nwG21AjX9N4bW?=
 =?us-ascii?Q?LYhIB7dnb7ZNEwokrZk/lK1995NS4dNYzwFkUIt2jdYSB2IR6pEg6841WWIY?=
 =?us-ascii?Q?JtcByEnjEgjjrgch3bvBR5AUAVSjNi6oRDurQjrjURvtX52E+deVeARp+s1q?=
 =?us-ascii?Q?5RP59wfj9BpxBOkK6UTWMFtvOHfgnCm7Z6TqjC5hLOTSwatardW7104cWz4P?=
 =?us-ascii?Q?5AIOcpm2R2qKx9qV821moOD4mX9KqMl+yjjE3G3jShvxrSfBmG1TiT/h8QSD?=
 =?us-ascii?Q?1H/I4hSoGr+UbwfFO0ShB8BKBt+hGa+sTls9+HIzD3Mm8UWN/WPJPH3a3lJb?=
 =?us-ascii?Q?m2crTXQlRB8dseYG+33z1VTNtbiORGAQVcuffSI2Xcwex+mJcoPuJejgZAIX?=
 =?us-ascii?Q?STmJgpPoZkk1liD2eq0RrCllwThczSs5EwHAPLAV/bKfbZxwctxKxGOaOWQZ?=
 =?us-ascii?Q?i+5Z4ynoU+VDx5WfS9OIs7ZcNxUUjF+YnLreJQAcY/8AJ46LtjxvkftE5JJG?=
 =?us-ascii?Q?sTjFa0QEr/jjb2N3VqNp5mLlk43kImYFyqOBdh9z7RMVbp46bbOScBB04w/5?=
 =?us-ascii?Q?zj/mK95/xw0b5D+3ZjQj5Bmo0HmbRo24JFxOEprqiW3wR0nGJ8encT8ViqIq?=
 =?us-ascii?Q?4ZiuY5TAFeInwYxWVuvOHNc/4r++IhjcRWoHXUufvVk5DXPgt+oxP5YJ8us7?=
 =?us-ascii?Q?ocExrIbsiGm/PzJ8jWV3NwkuoNhW+5eh76x0VUIyswZE6aogdtDUp3bhE4VT?=
 =?us-ascii?Q?024HmQUw/cywY+GnGBmUHvkaekLyGNeJQQq+tF5NLt1wEUHZOS+T5Ufn40iU?=
 =?us-ascii?Q?2o4xz8+LjXxXa5Wmxo2REtrcNhinlm62EI7HWPEXVuuwnhmo53iLJVMWQJVt?=
 =?us-ascii?Q?+V8bvXvF8JGs3hs043/Vf+JxlyTESn5cze/nW6Max0ES+J4DCeBGzjPYVue/?=
 =?us-ascii?Q?+HhIM6SqWKF8X1LvaO6IDxZST5QLvvZ6Anq0PBWwchZ5SjmzCwOEaS0L42ef?=
 =?us-ascii?Q?iqbC3bgC4HZHY/T5z9u6jc7sxU+jwjihLGyhW0Q1y84+CyFdMYzk/Zs+6Cpu?=
 =?us-ascii?Q?mApUsXbLMFKgkve3kHrjlaAEiLgkpdYKBcZFz8lcfhNLeaDIrjV6wTB7XTCw?=
 =?us-ascii?Q?u6YOItgJHx20OyDd8BFZlUWalPV9agPYmviGXsFVdr3S+5Pvy9/Aa34eaqtD?=
 =?us-ascii?Q?OrUWUXGhrAKn0yAaFqrOY/62fXohsN1ANk5SvJqoakcZAzY/6wkJV37rG1Zu?=
 =?us-ascii?Q?RA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 86641415-12e7-40d3-47e0-08ddefb11bd1
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2025 14:56:51.1069
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qcBVgE/12rQA1nS+p8OOUxp8c5l7K1X1FRxdWxnUmjhtElkjxX7Ag7HjPB10OuvEoLKiObCM8rkPu/H8iiI9jNYi6zO4sJVAFnzi3t4Vt/g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12778

Hi Rob,

Thanks for the feedback.

> -----Original Message-----
> From: Rob Herring <robh@kernel.org>
> Sent: 22 August 2025 17:21
> Subject: Re: [PATCH 06/11] dt-bindings: usb: Document Renesas RZ/G3E USB3=
HOST
>=20
> On Wed, Aug 20, 2025 at 06:17:53PM +0100, Biju wrote:
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Document the Renesas RZ/G3E USB3.2 Gen2 Host Controller (a.k.a USB3HOST=
).
> > The USB3HOST is compliant with the Universal Serial Bus 3.2
> > Specification Revision 1.0.
> >  - Supports 1 downstream USB receptacles
> >      - Number of SSP Gen2 or SS ports: 1
> >      - Number of HS or FS or LS ports: 1
> >  - Supports Super Speed Plus Gen2x1 (10 Gbps), Super Speed (5 Gbps),
> >    High Speed (480 Mbps), Full Speed (12Mbps), and Low Speed (1.5 Mbps)=
.
> >  - Supports all transfer-types: Control, Bulk, Interrupt, Isochronous, =
and
> >    these split-transactions.
> >  - Supports Power Control and Over Current Detection.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  .../bindings/usb/renesas,rzg3e-xhci.yaml      | 84 +++++++++++++++++++
> >  1 file changed, 84 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/usb/renesas,rzg3e-xhci.yaml
> >
> > diff --git
> > a/Documentation/devicetree/bindings/usb/renesas,rzg3e-xhci.yaml
> > b/Documentation/devicetree/bindings/usb/renesas,rzg3e-xhci.yaml
> > new file mode 100644
> > index 000000000000..2f73ea2e1e78
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/renesas,rzg3e-xhci.yaml
> > @@ -0,0 +1,84 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/usb/renesas,rzg3e-xhci.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Renesas RZ/G3E USB 3.2 Gen2 Host controller
> > +
> > +maintainers:
> > +  - Biju Das <biju.das.jz@bp.renesas.com>
> > +
>=20
> Common USB and XHCI properties don't apply?

OK, will add

allOf:
  - $ref: usb-xhci.yaml

Cheers,
Biju

