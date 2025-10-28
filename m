Return-Path: <linux-renesas-soc+bounces-23806-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BB2C16C41
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 21:26:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D7764035A9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 20:26:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 178852D480E;
	Tue, 28 Oct 2025 20:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="WJrzZAmJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010033.outbound.protection.outlook.com [52.101.228.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5232BE650;
	Tue, 28 Oct 2025 20:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761683177; cv=fail; b=DLMELS7fRGk4hpsBKIoIJBIjc0lOzNh6XpW9s0fvP78m7876phXPpEHFQprekHc3ap6JVviQfYkG4BzHotLj9e/qxCHVW45cn7tfB4Jg945xW4IR9kiYDx2Q78EFnTfGLaNygChAgSlaaNxMThPIg7Gz0rT6C0Pn5nvF+txg3xs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761683177; c=relaxed/simple;
	bh=pXZsXJbqfIasuCuu4gRVbbmoNHT4cQj92Puvgi3l+HI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Jk++nRYrwomDKBg1nwu2bSxKVQ2g6/TmEsU7mw6/uZXovFDpPPe5nbh47MKnOY46ZWzVwADFVWj4o1X0AUgv4m6Srj8/Ref+Z/ZTqDhb8R15ufYRSvwJeb2/vhKQ+oI/9j3quj3sGX2uUaHiJxLSEzy1OV4Sak1+vfEzxbh/TRA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=WJrzZAmJ; arc=fail smtp.client-ip=52.101.228.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hYzP3wD+oJpmIodWLrdcNK7Ym03CJOIYbvwwSlKMx4im39iNEgZQbkwOoGQacURdHwP8hMl6YFdOdddiAYRT5n1WILkNQTUw5OJn/UBpnUS4nmN3paGb5IMXqU/xFHzOCc6e71B/2OIzb1ldEM+VodWp+f3f0fVCUWKmcNiAEcg0D14HCKrx62iIsB4v5zZ3ckIxvkOBC14IfMVvnGpAXf+0CEdK0Uu7vZ/64cqn1aHETWyfAuyb957MnoN0yyMjwXStIayUcGRe1VuL8ghaE6MaUg35RQMJqW2buUdkf0tI7TOiAOr63Z8wfGgLnoCZhkoU3OuiYNc+cgV9eTyENQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QD62gCDhd+ezvQlbMfn+TfgtccVbCJFD5aHwwyskiCo=;
 b=pKOmUpl6PA20tF7afUjtj/VMCxU+8fMhkGyDq6B/mU8Zp2de5thayh9EvdkqRLGhDFU/Zh61ooGPqz3a7OkmDdWToZEVpB65qukxtXMJFUQa4Y5OXdFPNVNCdc/CV5cbT4olek1j2R2Ue8bXVlJnfrHDH7x8yEFKiID2qF9zLXDlY9petbdYvyyrQ1VR5mKEi/qN27z57xHNiLUIHN00LM/3Qk6uY5b5979Cw1HsmS/Jrd6hmYa19kdoizjf3+B3X5hj6BqRUIWfVfeaUpxgdd0AjEeK6PaPn3IClIMVwXx6u2oH73KarbsskgTlbdiPSUORM07Zd5+MWsrHiMyWQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QD62gCDhd+ezvQlbMfn+TfgtccVbCJFD5aHwwyskiCo=;
 b=WJrzZAmJBcciPcCg3/Mo8LHs1zK+X5HScX7wrvOJN+G9jzGzA2lPb9t6IwDkNN/ENtmrnfBxE1DILNwf3Qzs0D8IdnwZ2Tqa/cy0duQ94Zqa/teqOkgHiymdnQYPTqpKAmilYHGwNaVh1U4zSbxs74lgHftQrBmkVSBocijCU0I=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYRPR01MB15956.jpnprd01.prod.outlook.com (2603:1096:405:2e5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Tue, 28 Oct
 2025 20:26:09 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.9275.013; Tue, 28 Oct 2025
 20:26:08 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Conor Dooley <conor@kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
	<jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	biju.das.au <biju.das.au@gmail.com>
Subject: RE: [PATCH 03/19] dt-bindings: serial: renesas,rsci: Document RZ/G3E
 support
Thread-Topic: [PATCH 03/19] dt-bindings: serial: renesas,rsci: Document RZ/G3E
 support
Thread-Index: AQHcR1jilRQDAuP9rUOvjTY54KaBVrTX9BSAgAACcpCAAANggIAACApQ
Date: Tue, 28 Oct 2025 20:26:08 +0000
Message-ID:
 <TY3PR01MB11346239D8EB6EF5D120ABA0086FDA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251027154615.115759-1-biju.das.jz@bp.renesas.com>
 <20251027154615.115759-4-biju.das.jz@bp.renesas.com>
 <20251028-mower-mundane-316cdd6b48b6@spud>
 <TY3PR01MB11346372AB6D191D30B4F058B86FDA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <20251028-veteran-smell-963bb76ab3ff@spud>
In-Reply-To: <20251028-veteran-smell-963bb76ab3ff@spud>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYRPR01MB15956:EE_
x-ms-office365-filtering-correlation-id: ef6286a1-3ff2-4dcd-aebf-08de16603a6e
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?/yDhMLNo3sKzsJTQ5lbb/t9iYf92+NKYdjx7AsPCKtw6DTMfQ+M1Xahex+lU?=
 =?us-ascii?Q?k8SD4YuUFJ2Qhe0wgrzmtB4baaYnZIEjWnRZBUFnEDUKogiOtoXVMfu2xCdp?=
 =?us-ascii?Q?yzxpZ7+xCMPYby5iEZKabE35K2doZClWKVCGLkmweHir93vrV0Y+ZBh7LiG5?=
 =?us-ascii?Q?R3VEwEioN+ER5GQHcRYCPOwBg2TVULy0lzYBceavh9802JeqqfLhQHKsh4Bk?=
 =?us-ascii?Q?cf+UFdfIzqWjg/66PDIsO9Y6HyAX4OS4bgRCWzYbgp+xxnpQRVHewJCfUl37?=
 =?us-ascii?Q?/fy3tvN2LfHbmu18NTUiuJE2STPaHqE5Rp660clURcPJxXE9w0CVsa/32WhR?=
 =?us-ascii?Q?YaOeTDudXbGQCMVHaPjqdo+DxCiiS8IQI2qAklJLMPepMPpGMyFrHT+WnNNQ?=
 =?us-ascii?Q?t1gPFOk+WgR5Lw/0Ueq4HBoGByoZpm+ymDyurCJuYkeSgoL6VGEQIajGjWiq?=
 =?us-ascii?Q?s6a2G0QyuMDvQOxDMLUFi/DtjkgalVpWWdYAyZLbYzX0vJkEt8S5Y0aPqh6/?=
 =?us-ascii?Q?GmFmQ1A67st/WrIjQZHddX6TviXFD3q4p0fy3Vbljh16LSGAUNPa9RpAOFfq?=
 =?us-ascii?Q?KEn5dNokQjh5snVaVfEgIAkEIVynL08kTCoNPPXEV7HtTbwQx1/vYVQC1Kgc?=
 =?us-ascii?Q?VNjoClfm8Kg7Xe1vxymLAGoJQDSPtAYBG82W6DPkl5Suqd72gvFmxIeOruFu?=
 =?us-ascii?Q?OKb3Cwzw53WUxHPDhM38n2WnQ2uhGEyNIAxhhSxMc/BG2bZq+tvsRNMiEwUH?=
 =?us-ascii?Q?UAqWXE00d2WrmZJEM4AxYe6N+E84F5X8Boo88cKhL1MmnSo4F490mrArhKwl?=
 =?us-ascii?Q?p3r0rrYJomGiH4cxo3kzAc3aadEEj5Oxuq+8jhShocOAbqk+mAE8UXrMC5kL?=
 =?us-ascii?Q?qkamZfNtgzE2hBpZaMij4QEe3NbtGof/3/luirFvygAYSgtkBPo7h6ZtWZGo?=
 =?us-ascii?Q?NWTB/J/a5Zo4AB1eBkf6wIh2rErXl3BLrUiL3IsgPRNAz+NB2RsICKeAqroT?=
 =?us-ascii?Q?LF7AwSL2m8kUwoyZJp1t0MomaeM6z783ueoQnWmVmNVGtMkUsgzhLFGvazBk?=
 =?us-ascii?Q?w2PE1/XJCX4GEjxTHGNC5uaGuA5gsniDcWHPRnuHzokA0XfZ4lYAlINDzBiD?=
 =?us-ascii?Q?oRsDxjET9YvPlQsSOX4xC/j3gXZQR2quUTSDOSzXOjwZW2q2ctnsT4yubeAJ?=
 =?us-ascii?Q?0Td3zOAPc0vV5Gu+jxDIZJta3QAukg/Ekb4FAlVp0xWY+DgKrf5aSGFlfo+k?=
 =?us-ascii?Q?lGNfbNL8A6MhQ/nPG8xGFOyyPw71dq8Nz5lvK0aHyl3XlggbTUz/I4dL06fE?=
 =?us-ascii?Q?L/cLChrm2Nc6lSYoPDRIg73dBvKE43HawxioAdQj6knRaO3QF0Eq6VtctHSU?=
 =?us-ascii?Q?NcUKV+hGPEgB49rPVh+ifjEA1uQU1RNKg04d3/RrnGOD3yQ5c4wHPeR3Dfx3?=
 =?us-ascii?Q?OyXmjrBX5yhcPaRGvZw08BecEKx3LPVGQ07StKm6D8jFizr6f9dAVhhTf7Gx?=
 =?us-ascii?Q?e0F3yohcKCt9VJpVtwtyRZypsIrJxZbdVq+u?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?W5zbA/PhRBYCztf8aIsAT+9XTtJ4SeW9DxRywreDx0tY/YkG1yy4WEdqSWGm?=
 =?us-ascii?Q?1hJmzo1u6Mls0ILykV7b/c7ZjGLyBMUNYlOr9RRvOzOzkjqnvdBcIVRol65l?=
 =?us-ascii?Q?+gQWcGFcExLdUS4Dk5zPa1YA/u00feR5+7YUAc102c0DN6k8ivM17wh20TMx?=
 =?us-ascii?Q?S8sY93sTcsvMzBjNPPfL1oWWUeLp6j5aun4SQjEDd6kXNo9a272iREBNOlRY?=
 =?us-ascii?Q?oe2sDZCnOoNYmy4ZRTYfeqzDUxqhzJvKjbXwuz2c1Fba79ZxIenApPf6leVc?=
 =?us-ascii?Q?7Tvp2c9Lj2ON4vWH5TjPc1p2iNqMeUTJLUz7McLD4xLgq33zeiY8p2fGhV9M?=
 =?us-ascii?Q?hBXFRp1zlE+ZCyAyGjKSLHWXJgBUhm+ZhP8MwkeLC2eHECDFXxE0IcfMcxus?=
 =?us-ascii?Q?7Xum0teAPip+fLTAxOs/kctGn+OskRliMTxIc6OEAnz+SFfk6TcH5y9SZIUa?=
 =?us-ascii?Q?c/GyTvECGd9ACmh+3YaUEjep8EPAeRsKr3Z0mGn4Y0Ty3Jb1TLmXfpeQlIho?=
 =?us-ascii?Q?Dxx7uD3n1k9atshUtdsUshKHeAYuS9HI/WYZqDx4pxhSDludQL/unNcBss24?=
 =?us-ascii?Q?EFdl0WPGuFQ76XzgWio86kNyDQK+2gwscix30qOl/IhW8N+e8Uke89afIWqU?=
 =?us-ascii?Q?Y/6+DeLyJ0nrPXJ84yB5Fq+HHJP/9RvbdEJYPI2fbg8Fpsv7acPCYa1jx3Yb?=
 =?us-ascii?Q?Y8QCAePzHdn6E5xU7rnZ8WrkUkwPFCBjMpWQBiSvcKpRGdAE6sS8wBqTi6ve?=
 =?us-ascii?Q?HZ7SzOmwjqCnS3HI3czoyLZUg4Eu6TFiZW34h8D2CQkbgJsYESrUItikyg8d?=
 =?us-ascii?Q?ADKGuOlS6UskJ0D8PjjiHG4knLxXSGUc0b6YVYylL11rHuU700sR22XVCSjz?=
 =?us-ascii?Q?juh52tudbHzdv4jmtfsCgoHSgerIgBQi1vg+Htrv8TUYM0oxnuIXd/E0GsB/?=
 =?us-ascii?Q?pJGCuvR0BbeGTWSuatZbY9eLWQhDTA3LO22ir4PUeRjMmcXH9K/rTtsr1S67?=
 =?us-ascii?Q?O/dLEXnJtJzCKtuGxiGchvkOcxyESFwBss2oDhcEhXciE4NBDfVV8tyjEFRE?=
 =?us-ascii?Q?Hqop1z2/Ly3uq8TV/wmjY2mNm+h2F8rNF2Y7vT3giJf9gTigYb2P+NemcT+R?=
 =?us-ascii?Q?YoOklm4I4amE3AnWdcFel2a9jT52zuE/PlM0jYHzqto4sMJhPfnLInr6Q7yY?=
 =?us-ascii?Q?v+/Gp0dDINp3j6BrUBcX1O8uWZuTjUhJNcivdx2ksaQhTOx9THCyImg4gujK?=
 =?us-ascii?Q?W8jpMSTrHgzTjpbyEq/DNgMXEjd6ZXRBRIzmt4eOU+wRSt3VZySEh3vvd/FL?=
 =?us-ascii?Q?3WNuE2/iaY7/WIdFooSSSjPraOcFweGOaeNAu70UwHSEM/nrOg6eozjx9u7C?=
 =?us-ascii?Q?t8CaWsytY7elUpfLhWYJIBRd1f0DjQyQH7Y5QdUIvLwPWQC41ed0j1p+nXNt?=
 =?us-ascii?Q?bp65RdNmd5v1gbXfNJ9yoqjYGZuEG04cBfKVg180ag2ZM5eUW+dtOQNBVQ+d?=
 =?us-ascii?Q?8mfeNXw0vph4zVuOPx8JOaLz01KUsi8BE63BWk948d1rzaAXerzFiWnyoC2J?=
 =?us-ascii?Q?fPcOvGJxq6XsVUqQYLQJxybMpvvzJcWt69m859IYRx84D/OJEjqcdjcJZEy0?=
 =?us-ascii?Q?Hw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ef6286a1-3ff2-4dcd-aebf-08de16603a6e
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2025 20:26:08.5999
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +YV4nuc0FAuyqD0guznIgpQDeCoRW+OBRwenF+YtgFzkkYeMqnpwExr5dFBb8QegyklgoTVwrlBhBXF7s7eSH1/cBR/G9efS5My+JKst17w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15956

Hi Conor Dooley,

Thanks for the feedback.

> -----Original Message-----
> From: Conor Dooley <conor@kernel.org>
> Sent: 28 October 2025 19:52
> Subject: Re: [PATCH 03/19] dt-bindings: serial: renesas,rsci: Document RZ=
/G3E support
>=20
> On Tue, Oct 28, 2025 at 07:41:33PM +0000, Biju Das wrote:
> > > > +  - if:
> > > > +      properties:
> > > > +        compatible:
> > > > +          contains:
> > > > +            enum:
> > > > +              - renesas,r9a09g047-rsci
> > > > +              - renesas,r9a09g047-rscif
> > > > +    then:
> > > > +      properties:
> > > > +        clocks:
> > > > +          minItems: 5
> > > > +
> > > > +        clock-names:
> > > > +          minItems: 5
> > > > +
> > > > +      required:
> > > > +        - resets
> > > > +        - reset-names
> > >
> > > Does this need an "else: properties: resets: false"? Or do other devi=
ces actually have resets too?
> >
> > It is not required as resets are optional for RZ/T2H and RZ/N2H.
> > RZ/T2H and N2H does not have Resets.
>=20
> This is a contradiction. Either they are optional for these platforms or =
the platforms do not have
> resets. Cannot be both!

Some RSCI IP SoCs has resets and some does not have. From RSCI IP point of =
view
this property is optional.

I just try to avoid complex if else statements in dt schema by adding
Per SoC properties.

If you prefer else statements for resets, I can add that as well. Please le=
t me know.

Cheers,
Biju


